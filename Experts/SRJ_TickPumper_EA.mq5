//+------------------------------------------------------------------+
//|                                            SRJ_TickPumper_EA.mq5 |
//|  v6.02 - append-only live tick pump for a custom symbol.         |
//|                                                                  |
//|  Owns exactly one region of time: everything AFTER a write floor |
//|  computed at init as (newest stored tick - InpHealBackHours), and|
//|  never earlier than InpHardFloorArc if that is set.              |
//|                                                                  |
//|  Contains NO tick-delete and NO bar-delete calls of any kind     |
//|  outside of the operator-authorised manual repair window.        |
//|                                                                  |
//|  v6.01 changes, all of them guards against destructive splices:  |
//|    1. InpHardFloorArc - an absolute, data-independent floor.     |
//|    2. A silent tick read is no longer treated as a whole-window  |
//|       hole. An unloaded tick base and an empty range are         |
//|       indistinguishable, so the pass is skipped instead.         |
//|    3. Density gate - refuses a replace thinner than N ticks/min. |
//|    4. Bar veto - M1 bars with volume inside a hole block the     |
//|       write. Bars can only ever BLOCK, never justify a write.    |
//|    5. Warm-up delay before the first heal, and a post-write      |
//|       readback that reports a shortfall in the log.              |
//|    6. InpRebuildBars now defaults to false.                      |
//|  v6.02 changes:                                                  |
//|    1. Added bounded, operator-authorised manual repair engine.   |
//|    2. Bar veto upgraded to fail-closed (unresolved reads block). |
//+------------------------------------------------------------------+
#property copyright "SRJ"
#property version   "6.02"
#property description "Appends live ticks to a custom symbol in the server time frame, fills gaps forward of a write floor, and rebuilds M1 bars only for minutes it wrote itself. Never deletes ticks or bars."

//+------------------------------------------------------------------+
//| MODES                                                            |
//+------------------------------------------------------------------+
enum ENUM_PUMP_MODE
  {
   MODE_LIVE    = 0,   // LIVE - pump, heal forward of the floor
   MODE_INSPECT = 1    // INSPECT - report only, write nothing
  };

//+------------------------------------------------------------------+
//| INPUTS                                                           |
//+------------------------------------------------------------------+
input group "=== Essentials ==="
input string         InpCustomSymbol  = "EURUSD_RAW"; // Custom symbol to write into
input ENUM_PUMP_MODE InpMode          = MODE_LIVE;    // LIVE writes, INSPECT reports only
input int            InpHealBackHours = 0;            // Floor = newest stored tick minus this
input bool           InpVerbose       = false;        // Detailed log

input group "=== Hard limits - set the floor after every import ==="
input string InpHardFloorArc   = "";    // Absolute floor "YYYY.MM.DD HH:MM" archive frame. Empty = off.
input double InpMinTicksPerMin = 1.0;   // Refuse a splice thinner than this (0 = off)
input int    InpBarVetoMinutes = 5;     // Consult M1 bars for holes wider than this (0 = off)
input int    InpWarmupSec      = 180;   // No healing until this long after attach / reconnect

input group "=== Manual repair (one-shot, operator authorised) ==="
input string InpRepairFromArc    = "";     // "YYYY.MM.DD HH:MM" archive frame. Empty = repair off.
input string InpRepairToArc      = "";     // Exclusive end.
input bool   InpRepairArmed      = false;  // Second key. Both this AND a parseable window are required.
input bool   InpRepairDryRun     = true;   // Report the plan and the hole map, write nothing.
input double InpRepairMinDensity = 5.0;    // ticks/min the SOURCE must offer before any chunk is written
input bool   InpRepairAllowThin  = false;  // Also replace chunks that hold SOME ticks but far fewer than source
input double InpRepairThinRatio  = 0.25;   // stored/source below this = "thin", i.e. partially destroyed
input bool   InpRepairVerifyBars = true;   // After writing, compare rebuilt M1 against the surviving M1

input group "=== Heal window ==="
input int    InpMaxHealHours     = 72;     // Widest window a single heal pass will request

input group "=== Advanced - safe defaults, rarely touched ==="
input int  InpServerUtcMin  = 9999;   // Server UTC offset, min (9999 = auto)
input int  InpArchiveUtcMin = 9999;   // Archive = UTC + this (9999 = follow server)
input int  InpHealEveryMin  = 15;     // Maintenance interval, minutes
input int  InpMaxSpreadPts  = 0;      // Reject spread wider than this (0 = off)
input int  InpMaxSpikePts   = 0;      // Reject single-print spikes (0 = off)
input bool InpRebuildBars   = false;  // Rebuild M1 for days this EA spliced into

//+------------------------------------------------------------------+
//| Internal constants                                               |
//+------------------------------------------------------------------+
#define GAP_SECONDS      60      // tick spacing that counts as a hole
#define SAFETY_LAG_SEC   60      // never heal closer than this to now
#define FUTURE_TOL_SEC   120     // stamped further ahead than this = corrupt
#define SYNC_RETRIES     40      // retries per history request
#define RETRY_SLEEP_MS   250     // sleep between retries
#define EMPTY_CONFIRMS   10      // spaced confirmations before believing "empty"
#define ADD_CHUNK        2048    // ticks per CustomTicksAdd call
#define TAIL_CATCHUP_HR  2       // catch-up floor when the symbol is empty
#define LOCK_TIMEOUT_SEC 900     // stale lock expiry
#define MAX_DIRTY_DAYS   16      // days queued for M1 rebuild

#define REPAIR_CHUNK_SEC    900    // 15 min probe granularity
#define REPAIR_CHUNKS_PASS  8      // chunks per timer tick, so the terminal stays responsive
#define REPAIR_MAX_SPAN_HR  192    // widest authorised window, 8 days

//--- range classification ------------------------------------------
enum EMPTY_CHECK
  {
   EC_WRITABLE,      // nothing stored here, safe to splice
   EC_HAS_DATA,      // real tick data present, never touch
   EC_UNRESOLVED     // could not determine, retry later
  };

//--- time base ------------------------------------------------------
int   g_srvMin    = 0;      // server  = UTC + g_srvMin
int   g_arcMin    = 0;      // archive = UTC + g_arcMin
long  g_deltaSec  = 0;      // server minus archive, seconds
bool  g_offKnown  = false;

//--- the boundary ---------------------------------------------------
long  g_floorMsc      = 0;  // ARCHIVE frame. Nothing at or before this is written.
long  g_hardFloorMsc  = 0;  // ARCHIVE frame. Parsed from InpHardFloorArc. 0 = off.
bool  g_floorFromData = false;
bool  g_floorIsHard   = false;
long  g_newestAtInit  = 0;

//--- repair state, ARCHIVE frame ------------------------------------
long g_repFrom = 0, g_repTo = 0, g_repCursor = 0;
bool g_repValid = false, g_repDone = false, g_repAnnounced = false;
int  g_repPresent = 0, g_repWritten = 0, g_repRefused = 0;
int  g_repDeferred = 0, g_repThin = 0, g_repSilent = 0, g_repErrors = 0;
long g_repTicks = 0;
int  g_repBarOk = 0, g_repBarBad = 0, g_repBarNone = 0;

//--- pump state -----------------------------------------------------
long   g_cursorMsc  = 0;    // ARCHIVE frame
int    g_cursorDup  = 0;
long   g_pushed     = 0;
long   g_rejected   = 0;
double g_lastGoodPx = 0.0;
bool   g_pumpBlocked = false;

//--- maintenance counters -------------------------------------------
long     g_spliced      = 0;
int      g_lastHoles    = 0;
int      g_lastFixed    = 0;
int      g_lastRefused  = 0;
int      g_lastVetoed   = 0;
int      g_barsRebuilt  = 0;
datetime g_lastHeal     = 0;
datetime g_warmFrom     = 0;   // warm-up reference, reset on attach and reconnect
bool     g_wasConnected = true;
bool     g_holdsLock    = false;
string   g_lastNote     = "";
string   g_lockName     = "";

//--- days the EA spliced into, queued for M1 rebuild ----------------
long g_dirtyDays[MAX_DIRTY_DAYS];
int  g_dirtyCnt = 0;

//--- forward declarations -------------------------------------------
void SeedCursor();
bool CheckArchiveSanity();
void RefreshCharts();
void ComputeFloor(const bool announce);

//+------------------------------------------------------------------+
//| Helpers                                                          |
//+------------------------------------------------------------------+
void Log(const string m) { if(InpVerbose) Print("[Pumper] ", m); }
void Say(const string m) { Print("[Pumper] ", m); }

long MinL(const long a, const long b) { return a < b ? a : b; }
long MaxL(const long a, const long b) { return a > b ? a : b; }

bool Writing() { return (InpMode == MODE_LIVE); }

string TS(const long msc)
  {
   if(msc <= 0) return "-";
   return TimeToString((datetime)(msc / 1000), TIME_DATE | TIME_MINUTES | TIME_SECONDS);
  }

string DS(const long sec) { return TimeToString((datetime)sec, TIME_DATE); }

string HM(const int minutes)
  {
   int a = (int)MathAbs(minutes);
   return StringFormat("%s%d:%02d", (minutes < 0 ? "-" : "+"), a / 60, a % 60);
  }

//+------------------------------------------------------------------+
//| FRAME CONVERSION                                                 |
//|   UTC     = TimeGMT()                                            |
//|   Server  = UTC + g_srvMin   (TimeTradeServer, never stale)      |
//|   Archive = UTC + g_arcMin                                       |
//| Internal state is ALWAYS archive frame.                          |
//+------------------------------------------------------------------+
long     ToServerMsc(const long archiveMsc) { return archiveMsc + g_deltaSec * 1000; }
datetime ArchiveNow() { return (datetime)((long)TimeGMT() + (long)g_arcMin * 60); }
datetime ServerNow()  { return (datetime)((long)TimeGMT() + (long)g_srvMin * 60); }

int ServerUtcAuto()
  {
   long raw = (long)TimeTradeServer() - (long)TimeGMT();
   return (int)MathRound(raw / 900.0) * 15;   // nearest 15 min
  }

int ServerUtcMinutes()
  {
   if(InpServerUtcMin != 9999) return InpServerUtcMin;
   return ServerUtcAuto();
  }

void ApplyOffsets(const int srvMin)
  {
   g_srvMin   = srvMin;
   g_arcMin   = (InpArchiveUtcMin == 9999) ? srvMin : InpArchiveUtcMin;
   g_deltaSec = (long)(g_srvMin - g_arcMin) * 60;
   g_offKnown = true;
  }

void RefreshOffset()
  {
   int srv = ServerUtcMinutes();
   if(srv == g_srvMin) return;

   int oldSrv = g_srvMin;
   ApplyOffsets(srv);

   Say(StringFormat("server time base changed: UTC%s -> UTC%s. "
                    "archive UTC%s, live shift %s. Re-seeding.",
                    HM(oldSrv), HM(g_srvMin), HM(g_arcMin), HM(-(int)(g_deltaSec / 60))));

   //--- the archive frame may have moved with it, so the floor is restated
   ComputeFloor(true);
   SeedCursor();
  }

void ShiftToArchive(MqlTick &t[], const int n)
  {
   if(g_deltaSec == 0) return;
   long shift = g_deltaSec * 1000;
   for(int i = 0; i < n; i++)
     {
      t[i].time_msc -= shift;
      t[i].time      = (datetime)(t[i].time_msc / 1000);
     }
  }

//+------------------------------------------------------------------+
//| HARD FLOOR                                                       |
//| Parsed once at init. Independent of what is stored, so a failed  |
//| or empty tick read cannot lower it.                              |
//+------------------------------------------------------------------+
bool ParseHardFloor()
  {
   string s = InpHardFloorArc;
   StringTrimLeft(s);
   StringTrimRight(s);

   if(StringLen(s) == 0)
     {
      g_hardFloorMsc = 0;
      return true;
     }

   datetime d = StringToTime(s);
   if(d <= 0) return false;

   g_hardFloorMsc = (long)d * 1000;
   return true;
  }

//+------------------------------------------------------------------+
//| THE FLOOR. Computed from what is already stored, then raised to  |
//| the hard limit if one is set. Everything at or before it is out  |
//| of reach for the whole session.                                  |
//+------------------------------------------------------------------+
void ComputeFloor(const bool announce)
  {
   MqlTick t[];
   int n = CopyTicks(InpCustomSymbol, t, COPY_TICKS_ALL, 0, 16);

   long ceilMsc = (long)(ArchiveNow() + FUTURE_TOL_SEC) * 1000;

   //--- disregard future-stamped junk when locating the newest tick
   while(n > 0 && (long)t[n - 1].time_msc > ceilMsc) n--;

   g_floorIsHard = false;

   if(n <= 0)
     {
      g_newestAtInit  = 0;
      g_floorFromData = false;
      g_floorMsc      = (long)(ArchiveNow() - (long)TAIL_CATCHUP_HR * 3600) * 1000;

      if(g_hardFloorMsc > g_floorMsc)
        {
         g_floorMsc    = g_hardFloorMsc;
         g_floorIsHard = true;
        }

      if(announce)
        {
         if(g_floorIsHard)
            Say(StringFormat("no usable stored ticks, but the hard floor %s applies. "
                             "Nothing at or before it is reachable.", TS(g_floorMsc)));
         else
            Say(StringFormat("no usable stored ticks and no hard floor set. "
                             "Floor fell back to the catch-up default %s. Import history "
                             "before running LIVE, or the EA will only ever hold the last "
                             "%d hour(s). Setting InpHardFloorArc is strongly advised.",
                             TS(g_floorMsc), TAIL_CATCHUP_HR));
        }
      return;
     }

   g_newestAtInit  = (long)t[n - 1].time_msc;
   g_floorFromData = true;
   g_floorMsc      = g_newestAtInit - (long)InpHealBackHours * 3600 * 1000;

   if(g_hardFloorMsc > g_floorMsc)
     {
      g_floorMsc    = g_hardFloorMsc;
      g_floorIsHard = true;
     }

   if(announce)
     {
      Say(StringFormat("floor: %s   (newest stored tick %s minus %dh). "
                       "Nothing at or before the floor will be written this session.",
                       TS(g_floorMsc), TS(g_newestAtInit), InpHealBackHours));
      if(g_floorIsHard)
         Say(StringFormat("floor raised to the hard limit %s from InpHardFloorArc.",
                          TS(g_hardFloorMsc)));
     }
  }

//+------------------------------------------------------------------+
//| Mark a day for M1 rebuild. Only called after a successful splice.|
//+------------------------------------------------------------------+
void MarkDay(const long anySecInDay)
  {
   long d = (anySecInDay / 86400) * 86400;
   for(int i = 0; i < g_dirtyCnt; i++)
      if(g_dirtyDays[i] == d) return;
   if(g_dirtyCnt >= MAX_DIRTY_DAYS) return;
   g_dirtyDays[g_dirtyCnt++] = d;
  }

//+------------------------------------------------------------------+
//| Tick quality gate. Applied at WRITE time only. Stored ticks are  |
//| never re-judged, so nothing already accepted can be revoked.     |
//+------------------------------------------------------------------+
bool ChartUsesLast()
  {
   return ((ENUM_SYMBOL_CHART_MODE)SymbolInfoInteger(InpCustomSymbol, SYMBOL_CHART_MODE)
           == SYMBOL_CHART_MODE_LAST);
  }

double TickPrice(const MqlTick &t, const bool useLast)
  {
   double px = useLast ? t.last : t.bid;
   if(px <= 0.0) px = useLast ? t.bid : t.last;
   if(px <= 0.0) px = t.ask;
   return px;
  }

double TargetPoint()
  {
   double p = SymbolInfoDouble(InpCustomSymbol, SYMBOL_POINT);
   if(p <= 0.0) p = SymbolInfoDouble(_Symbol, SYMBOL_POINT);
   if(p <= 0.0) p = 0.00001;
   return p;
  }

bool TickIsValid(const MqlTick &t, const long archNowMsc, const double point,
                 const bool useLast, string &why)
  {
   if(t.time_msc <= 0)
     { why = "zero timestamp"; return false; }

   if((long)t.time_msc > archNowMsc + (long)FUTURE_TOL_SEC * 1000)
     { why = "stamped in the future"; return false; }

   double px = TickPrice(t, useLast);
   if(px <= 0.0)
     { why = "no usable price"; return false; }

   if(t.bid > 0.0 && t.ask > 0.0)
     {
      double sp = t.ask - t.bid;
      if(sp < 0.0)
        { why = "inverted spread"; return false; }
      if(InpMaxSpreadPts > 0 && sp > InpMaxSpreadPts * point)
        { why = StringFormat("spread %.1f pts", sp / point); return false; }
     }

   return true;
  }

//+------------------------------------------------------------------+
//| Retry-hardened tick read. Range is in the frame native to the    |
//| symbol being read.                                               |
//| >0 count, 0 only after EMPTY_CONFIRMS confirmations, -1 unresolved |
//+------------------------------------------------------------------+
int ReadTicks(const string sym, MqlTick &out[], const long fromMsc, const long toMsc)
  {
   int zeroStreak = 0;

   for(int a = 0; a <= SYNC_RETRIES; a++)
     {
      ResetLastError();
      int n = CopyTicksRange(sym, out, COPY_TICKS_ALL, (ulong)fromMsc, (ulong)toMsc);
      int e = GetLastError();

      if(n > 0) return n;

      if(n == 0 && e == 0)
        {
         if(++zeroStreak >= EMPTY_CONFIRMS) return 0;
        }
      else
         zeroStreak = 0;

      Sleep(RETRY_SLEEP_MS);
     }

   Log(StringFormat("unresolved read %s %s -> %s", sym, TS(fromMsc), TS(toMsc)));
   return -1;
  }

//+------------------------------------------------------------------+
//| Was the market open across this ARCHIVE range?                   |
//+------------------------------------------------------------------+
bool ResolveActivity(const long fromMsc, const long toMsc, bool &out_open)
  {
   datetime t1 = (datetime)(ToServerMsc(fromMsc) / 1000);
   datetime t2 = (datetime)(ToServerMsc(toMsc)   / 1000) + 1;

   for(int a = 0; a <= SYNC_RETRIES; a++)
     {
      int n = Bars(_Symbol, PERIOD_M1, t1, t2);
      if(n > 0) { out_open = true; return true; }

      if((bool)SeriesInfoInteger(_Symbol, PERIOD_M1, SERIES_SYNCHRONIZED))
        { out_open = false; return true; }

      Sleep(RETRY_SLEEP_MS);
     }

   out_open = false;
   return false;
  }

//+------------------------------------------------------------------+
//| Is this range genuinely empty in the custom symbol?              |
//| Ticks only. Bar presence is handled separately, and only ever as |
//| a veto - see BarsHoldData.                                       |
//+------------------------------------------------------------------+
EMPTY_CHECK ClassifyRange(const long fromMsc, const long toMsc)
  {
   MqlTick probe[];
   int n = ReadTicks(InpCustomSymbol, probe, fromMsc, toMsc);

   if(n < 0) return EC_UNRESOLVED;
   if(n > 0) return EC_HAS_DATA;
   return EC_WRITABLE;
  }

//+------------------------------------------------------------------+
//| Does the custom symbol hold M1 bars with volume inside this range? |
//|                                                                  |
//| READ-ONLY, and used ONLY to BLOCK a write. It never justifies one. |
//| A bar with tick_volume > 0 inside a range the tick reader calls  |
//| empty means the two oracles disagree, which is the exact signature |
//| of an unloaded or damaged tick base. Refusing to write is always |
//| the safe response, because a genuine hole will be filled by an   |
//| import instead.                                                  |
//|                                                                  |
//| Custom symbol bars are already in the archive frame.             |
//+------------------------------------------------------------------+
bool BarsHoldData(const long fromMsc, const long toMsc)
  {
   long innerFrom = fromMsc + 60000;   // ignore the boundary minutes, which a
   long innerTo   = toMsc   - 60000;   // legitimate small hole can overlap
   if(innerTo <= innerFrom) return false;

   MqlRates r[];
   ResetLastError();
   int n = CopyRates(InpCustomSymbol, PERIOD_M1,
                     (datetime)(innerFrom / 1000), (datetime)(innerTo / 1000), r);

   if(n < 0)
     {
      //--- Series not loaded. A veto that passes when it cannot measure is not
      //--- a veto, so unresolved blocks the write.
      Log(StringFormat("bar veto unresolved %s -> %s (err %d) - treating as a veto",
                       TS(fromMsc), TS(toMsc), GetLastError()));
      return true;
     }
   if(n == 0) return false;

   for(int i = 0; i < n; i++)
      if(r[i].tick_volume > 0) return true;

   return false;
  }

//+------------------------------------------------------------------+
//| Binary search: first index with time_msc >= msc                  |
//+------------------------------------------------------------------+
int LowerBound(const MqlTick &a[], const int n, const long msc)
  {
   int lo = 0, hi = n;
   while(lo < hi)
     {
      int mid = (lo + hi) >> 1;
      if((long)a[mid].time_msc < msc) lo = mid + 1; else hi = mid;
     }
   return lo;
  }

//+------------------------------------------------------------------+
//| Splice one hole from the preloaded, already-shifted source block.|
//|                                                                  |
//| CustomTicksReplace DELETES the range before writing, so every gate |
//| below exists to stop a thin or ill-judged write from destroying  |
//| more than it adds.                                               |
//+------------------------------------------------------------------+
void FillHole(const MqlTick &block[], const int blockN, long from, const long to)
  {
   if(to <= g_floorMsc)
     {
      Log(StringFormat("BELOW FLOOR %s -> %s : ignored", TS(from), TS(to)));
      return;
     }

   if(from <= g_floorMsc)
     {
      Log(StringFormat("clipped hole start %s -> %s (floor)", TS(from), TS(g_floorMsc + 1)));
      from = g_floorMsc + 1;
     }

   int lo  = LowerBound(block, blockN, from);
   int hi  = LowerBound(block, blockN, to + 1);
   int cnt = hi - lo;
   if(cnt <= 0)
     {
      Log(StringFormat("source silent across %s -> %s", TS(from), TS(to)));
      return;
     }

   EMPTY_CHECK ec = ClassifyRange(from, to);

   if(ec == EC_HAS_DATA)
     { Log(StringFormat("PROTECTED %s -> %s : ticks already present", TS(from), TS(to))); return; }

   if(ec == EC_UNRESOLVED)
     { Log(StringFormat("DEFERRED %s -> %s : classification unresolved", TS(from), TS(to))); return; }

   //--- GATE 1: density. A replace that writes a handful of ticks across
   //--- hours or days is deleting far more than it supplies.
   long   spanMin = (to - from) / 60000;
   double perMin  = (spanMin > 0) ? (double)cnt / (double)spanMin : (double)cnt;

   if(InpMinTicksPerMin > 0.0 && spanMin >= 2 && perMin < InpMinTicksPerMin)
     {
      g_lastRefused++;
      Say(StringFormat("REFUSED %s -> %s : source offers %d tick(s) across %d min "
                       "(%.3f/min, floor %.3f). A replace this thin would delete more "
                       "than it writes. This range needs an import, not a splice.",
                       TS(from), TS(to), cnt, (int)spanMin, perMin, InpMinTicksPerMin));
      return;
     }

   //--- GATE 2: bar veto. Two oracles must agree before anything is replaced.
   if(InpBarVetoMinutes > 0 && spanMin > InpBarVetoMinutes && BarsHoldData(from, to))
     {
      g_lastVetoed++;
      Say(StringFormat("VETOED %s -> %s : the tick read says empty but M1 bars with volume "
                       "exist here. The two oracles disagree, so nothing is written. "
                       "Ticks in this range may already have been lost - audit it.",
                       TS(from), TS(to)));
      return;
     }

   if(!Writing())
     {
      Say(StringFormat("INSPECT: would splice %d tick(s) into %s -> %s",
                       cnt, TS(from), TS(to)));
      return;
     }

   //--- same quality gate as the pump
   bool   useLast = ChartUsesLast();
   double point   = TargetPoint();
   long   archNow = (long)ArchiveNow() * 1000;

   MqlTick slice[];
   ArrayResize(slice, cnt);
   int m = 0;
   for(int i = 0; i < cnt; i++)
     {
      string why = "";
      if(TickIsValid(block[lo + i], archNow, point, useLast, why))
         slice[m++] = block[lo + i];
     }
   if(m == 0)
     { Log(StringFormat("all source ticks for %s -> %s failed the gate", TS(from), TS(to))); return; }
   ArrayResize(slice, m);

   ResetLastError();
   if(CustomTicksReplace(InpCustomSymbol, from, to, slice) < 0)
     {
      Say(StringFormat("ERROR: CustomTicksReplace %s -> %s (%d ticks) err %d",
                       TS(from), TS(to), m, GetLastError()));
      return;
     }

   Say(StringFormat("SPLICED %s -> %s : %d of %d tick(s)", TS(from), TS(to), m, cnt));

   //--- post-write readback. Cannot undo anything; exists so that a loss
   //--- announces itself here instead of being found hours later.
   MqlTick after[];
   int post = CopyTicksRange(InpCustomSymbol, after, COPY_TICKS_ALL,
                             (ulong)from, (ulong)to);
   if(post >= 0 && post < m)
      Say(StringFormat("WARNING: wrote %d tick(s) into %s -> %s but the range now reads %d. "
                       "Audit this range.", m, TS(from), TS(to), post));

   g_spliced += m;
   g_lastFixed++;
   MarkDay(from / 1000);
  }

//+------------------------------------------------------------------+
//| Keep the region forward of the floor continuous.                 |
//| All internal ranges are ARCHIVE frame.                           |
//+------------------------------------------------------------------+
void HealSeam(const string tag)
  {
   long healEnd   = (long)(ArchiveNow() - SAFETY_LAG_SEC) * 1000;
   long widest    = (long)(ArchiveNow() - (long)InpMaxHealHours * 3600) * 1000;
   long healStart = MaxL(g_floorMsc + 1, widest);

   if(healEnd <= healStart)
     { g_lastNote = "window empty"; return; }

   if(g_floorMsc + 1 < widest)
      Log(StringFormat("floor is older than %dh; healing only from %s. "
                       "Anything earlier is an import job.",
                       InpMaxHealHours, TS(healStart)));

   g_lastFixed   = 0;
   g_lastRefused = 0;
   g_lastVetoed  = 0;

   bool open = false;
   if(!ResolveActivity(healStart, healEnd, open))
     { Log(tag + ": activity unresolved, will retry"); g_lastNote = "activity unresolved"; return; }
   if(!open)
     { Log(tag + ": market closed across the window"); g_lastHoles = 0; g_lastNote = "market closed"; return; }

   MqlTick loc[];
   int locN = ReadTicks(InpCustomSymbol, loc, healStart, healEnd);
   if(locN < 0)
     { Say(tag + ": aborted, local tick base unresolved"); g_lastNote = "local base unresolved"; return; }

   //--- collect holes
   long hFrom[], hTo[];
   int  holes = 0;
   long gapMs = (long)GAP_SECONDS * 1000;
   long prev  = 0;

   for(int i = 0; i < locN; i++)
     {
      long m = (long)loc[i].time_msc;
      if(prev > 0 && (m - prev) > gapMs)
        {
         ArrayResize(hFrom, holes + 1); ArrayResize(hTo, holes + 1);
         hFrom[holes] = prev + 1; hTo[holes] = m - 1; holes++;
        }
      prev = m;
     }

   if(prev == 0)
     {
      //--- A silent read is NOT evidence of an empty range. An unloaded tick
      //--- base and a genuinely empty window are indistinguishable from here,
      //--- and a replace across the whole window would destroy whatever is in
      //--- it. If the range really is empty, the next pass will find it once
      //--- at least one tick reads back and the gap logic has an anchor.
      Say(StringFormat("%s: %s reads empty across %s -> %s. NOT treating that as a hole. "
                       "Skipping this pass.",
                       tag, InpCustomSymbol, TS(healStart), TS(healEnd)));
      g_lastHoles = 0;
      g_lastNote  = "window unreadable - skipped";
      return;
     }

   if((healEnd - prev) > gapMs)
     {
      ArrayResize(hFrom, holes + 1); ArrayResize(hTo, holes + 1);
      hFrom[holes] = prev + 1; hTo[holes] = healEnd; holes++;
     }

   g_lastHoles = holes;
   if(holes == 0)
     { Log(tag + ": continuous"); g_lastNote = "continuous"; return; }

   MqlTick src[];
   int srcN = ReadTicks(_Symbol, src, ToServerMsc(healStart), ToServerMsc(healEnd));
   if(srcN < 0)
     { Say(StringFormat("%s: %d hole(s), source unresolved, will retry", tag, holes));
       g_lastNote = "source unresolved"; return; }
   if(srcN == 0)
     { Say(StringFormat("%s: %d hole(s) but %s serves no ticks here", tag, holes, _Symbol));
       g_lastNote = "source silent"; return; }

   ShiftToArchive(src, srcN);

   for(int h = 0; h < holes; h++)
      FillHole(src, srcN, hFrom[h], hTo[h]);

   g_lastNote = StringFormat("%d filled, %d refused, %d vetoed",
                             g_lastFixed, g_lastRefused, g_lastVetoed);
  }

//+------------------------------------------------------------------+
//| Aggregate a tick block into M1 bars.                             |
//+------------------------------------------------------------------+
int BuildRatesFromTicks(const MqlTick &t[], const int n, MqlRates &r[])
  {
   bool   useLast = ChartUsesLast();
   double point   = TargetPoint();
   long   archNow = (long)ArchiveNow() * 1000;

   ArrayResize(r, 0, 4096);
   int cnt = 0;
   long spreadAcc = 0;
   int  spreadCnt = 0;

   for(int i = 0; i < n; i++)
     {
      string why = "";
      if(!TickIsValid(t[i], archNow, point, useLast, why)) continue;

      double   px = TickPrice(t[i], useLast);
      datetime m  = (datetime)((t[i].time_msc / 60000) * 60);

      if(cnt == 0 || r[cnt - 1].time != m)
        {
         if(cnt > 0)
            r[cnt - 1].spread = (spreadCnt > 0) ? (int)(spreadAcc / spreadCnt) : 0;
         spreadAcc = 0; spreadCnt = 0;

         ArrayResize(r, cnt + 1, 4096);
         r[cnt].time        = m;
         r[cnt].open        = px;
         r[cnt].high        = px;
         r[cnt].low         = px;
         r[cnt].close       = px;
         r[cnt].tick_volume = 1;
         r[cnt].real_volume = 0;
         r[cnt].spread      = 0;
         cnt++;
        }
      else
        {
         if(px > r[cnt - 1].high) r[cnt - 1].high = px;
         if(px < r[cnt - 1].low)  r[cnt - 1].low  = px;
         r[cnt - 1].close = px;
         r[cnt - 1].tick_volume++;
        }

      if(t[i].ask > 0.0 && t[i].bid > 0.0)
        { spreadAcc += (long)MathRound((t[i].ask - t[i].bid) / point); spreadCnt++; }
     }

   if(cnt > 0)
      r[cnt - 1].spread = (spreadCnt > 0) ? (int)(spreadAcc / spreadCnt) : 0;

   return cnt;
  }

//+------------------------------------------------------------------+
//| Rebuild M1 for the days this EA spliced into, and only for the   |
//| portion of those days that lies forward of the floor.            |
//| CustomRatesUpdate adds and overwrites; it cannot delete a bar.   |
//|                                                                  |
//| Off by default. Bars that survive a tick loss are the only witness |
//| to that loss, and rebuilding would erase the evidence.           |
//+------------------------------------------------------------------+
void RebuildDirtyDays()
  {
   if(!InpRebuildBars || g_dirtyCnt == 0) { g_dirtyCnt = 0; return; }

   for(int k = 0; k < g_dirtyCnt; k++)
     {
      long day    = g_dirtyDays[k];
      long fromMs = MaxL(day * 1000, g_floorMsc + 1);
      long toMs   = MinL((day + 86400) * 1000 - 1,
                         (long)(ArchiveNow() - SAFETY_LAG_SEC) * 1000);
      if(toMs <= fromMs) continue;

      MqlTick t[];
      int n = ReadTicks(InpCustomSymbol, t, fromMs, toMs);
      if(n <= 0) continue;

      MqlRates r[];
      int m = BuildRatesFromTicks(t, n, r);
      if(m <= 0) continue;

      if(!Writing())
        {
         Say(StringFormat("INSPECT: would rebuild %d M1 bar(s) on %s from %d tick(s)",
                          m, DS(day), n));
         continue;
        }

      ResetLastError();
      if(CustomRatesUpdate(InpCustomSymbol, r) < 0)
        {
         Say(StringFormat("ERROR: CustomRatesUpdate %s err %d", DS(day), GetLastError()));
         continue;
        }

      g_barsRebuilt++;
      Say(StringFormat("REBUILT %d M1 bar(s) on %s from %d tick(s)", m, DS(day), n));
     }

   g_dirtyCnt = 0;
  }

//+------------------------------------------------------------------+
//| Frame sanity gate. Blocks the pump if the store holds ticks      |
//| ahead of archive now - that means the declared frame is wrong.   |
//| It reports; it does not repair.                                  |
//+------------------------------------------------------------------+
bool CheckArchiveSanity()
  {
   MqlTick t[];
   int n = CopyTicks(InpCustomSymbol, t, COPY_TICKS_ALL, 0, 1);
   if(n <= 0) { g_pumpBlocked = false; return true; }

   long last     = (long)t[n - 1].time_msc;
   long aheadSec = (last - (long)ArchiveNow() * 1000) / 1000;

   if(aheadSec > FUTURE_TOL_SEC)
     {
      if(!g_pumpBlocked)
         Say(StringFormat("PUMP BLOCKED: %s holds ticks stamped %s, %d min ahead of "
                          "archive now. The declared frame does not match the store. "
                          "Check InpArchiveUtcMin, or re-import; this EA will not delete them.",
                          InpCustomSymbol, TS(last), (int)(aheadSec / 60)));
      g_pumpBlocked = true;
      return false;
     }

   if(g_pumpBlocked)
      Say("pump unblocked");

   g_pumpBlocked = false;
   return true;
  }

//+------------------------------------------------------------------+
//| Per-symbol lock, so several instances run independently          |
//+------------------------------------------------------------------+
bool AcquireLock()
  {
   if(g_holdsLock) return true;

   double stamp = (double)TimeLocal();
   if(GlobalVariableCheck(g_lockName))
     {
      if(stamp - GlobalVariableGet(g_lockName) < LOCK_TIMEOUT_SEC) return false;
      GlobalVariableDel(g_lockName);
     }
   if(!GlobalVariableSetOnCondition(g_lockName, stamp, 0.0))
     {
      GlobalVariableTemp(g_lockName);
      if(GlobalVariableGet(g_lockName) != 0.0) return false;
      GlobalVariableSet(g_lockName, stamp);
     }
   g_holdsLock = true;
   return true;
  }

void ReleaseLock()
  {
   if(g_holdsLock) { GlobalVariableDel(g_lockName); g_holdsLock = false; }
  }

//+------------------------------------------------------------------+
//| Loss-less live pump. Appends only; never touches the floor.      |
//+------------------------------------------------------------------+
void PumpLive()
  {
   if(g_pumpBlocked || !g_offKnown || !Writing()) return;

   long fromArc = (g_cursorMsc > 0) ? g_cursorMsc : g_floorMsc + 1;
   fromArc = MaxL(fromArc, g_floorMsc + 1);
   long toArc = (long)(ArchiveNow() + 10) * 1000;
   if(toArc <= fromArc) return;

   MqlTick t[];
   ResetLastError();
   int n = CopyTicksRange(_Symbol, t, COPY_TICKS_ALL,
                          (ulong)ToServerMsc(fromArc), (ulong)ToServerMsc(toArc));
   if(n <= 0) return;

   ShiftToArchive(t, n);

   //--- skip what is already written: older ticks, then the already-sent
   //--- portion of the cursor millisecond (several ticks can share one ms)
   int first = 0;
   while(first < n && (long)t[first].time_msc < g_cursorMsc) first++;
   int skip = 0;
   while(first < n && (long)t[first].time_msc == g_cursorMsc && skip < g_cursorDup)
     { first++; skip++; }

   //--- and never anything at or before the floor
   while(first < n && (long)t[first].time_msc <= g_floorMsc) first++;

   int cnt = n - first;
   if(cnt <= 0) return;

   bool   useLast  = ChartUsesLast();
   double point    = TargetPoint();
   double spikeThr = (InpMaxSpikePts > 0) ? InpMaxSpikePts * point : 0.0;
   long   archNow  = (long)ArchiveNow() * 1000;

   MqlTick good[];
   ArrayResize(good, cnt);
   int g = 0;
   for(int i = first; i < n; i++)
     {
      string why = "";
      if(!TickIsValid(t[i], archNow, point, useLast, why))
        {
         g_rejected++;
         Log(StringFormat("reject %s : %s", TS((long)t[i].time_msc), why));
         continue;
        }

      double px = TickPrice(t[i], useLast);
      if(spikeThr > 0.0 && g_lastGoodPx > 0.0 && MathAbs(px - g_lastGoodPx) > spikeThr)
        {
         //--- drop the unconfirmed print, accept the level, so a genuine
         //--- fast move costs one tick instead of stalling the feed
         g_rejected++;
         Log(StringFormat("reject %s : unconfirmed %.1f pt jump",
                          TS((long)t[i].time_msc), MathAbs(px - g_lastGoodPx) / point));
         g_lastGoodPx = px;
         continue;
        }

      g_lastGoodPx = px;
      good[g++] = t[i];
     }

   //--- advance the cursor even if everything was rejected, otherwise the
   //--- same ticks get re-examined forever
   long nc = (long)t[n - 1].time_msc;
   int  at = 0;
   for(int i = n - 1; i >= 0 && (long)t[i].time_msc == nc; i--) at++;
   g_cursorMsc = nc;
   g_cursorDup = at;

   if(g == 0) return;
   ArrayResize(good, g);

   MqlTick buf[];
   int done = 0;
   while(done < g)
     {
      int k = (int)MinL(ADD_CHUNK, g - done);
      ArrayResize(buf, k);
      for(int i = 0; i < k; i++) buf[i] = good[done + i];

      ResetLastError();
      if(CustomTicksAdd(InpCustomSymbol, buf) < 0)
        {
         Say(StringFormat("ERROR: CustomTicksAdd rejected %d tick(s) at %s (err %d)",
                          k, TS((long)buf[0].time_msc), GetLastError()));
         CheckArchiveSanity();
         return;
        }
      done += k;
     }

   g_pushed += g;
  }

//+------------------------------------------------------------------+
//| Seed the cursor from what is already stored, never below the floor |
//+------------------------------------------------------------------+
void SeedCursor()
  {
   MqlTick t[];
   int n = CopyTicks(InpCustomSymbol, t, COPY_TICKS_ALL, 0, 256);
   long ceilMsc = (long)(ArchiveNow() + FUTURE_TOL_SEC) * 1000;

   while(n > 0 && (long)t[n - 1].time_msc > ceilMsc) n--;

   if(n <= 0 || (long)t[n - 1].time_msc <= g_floorMsc)
     {
      g_cursorMsc  = g_floorMsc + 1;
      g_cursorDup  = 0;
      g_lastGoodPx = 0.0;
      Log(StringFormat("cursor seeded just above the floor, %s", TS(g_cursorMsc)));
      return;
     }

   long last = (long)t[n - 1].time_msc;
   int  at = 0;
   for(int i = n - 1; i >= 0 && (long)t[i].time_msc == last; i--) at++;

   g_cursorMsc  = last;
   g_cursorDup  = at;
   g_lastGoodPx = TickPrice(t[n - 1], ChartUsesLast());
   Log(StringFormat("cursor resumes from %s", TS(g_cursorMsc)));
  }

//+------------------------------------------------------------------+
//| Repoint any chart of the custom symbol so the series rebuilds    |
//+------------------------------------------------------------------+
void RefreshCharts()
  {
   long id = ChartFirst();
   while(id >= 0)
     {
      if(ChartSymbol(id) == InpCustomSymbol)
         ChartSetSymbolPeriod(id, InpCustomSymbol, (ENUM_TIMEFRAMES)ChartPeriod(id));
      id = ChartNext(id);
     }
  }

//+------------------------------------------------------------------+
//| Parses and validates the authorised repair window.               |
//| Refuses anything unbounded, inverted, absurdly wide, or too      |
//| close to now. A window that fails validation disables repair     |
//| entirely rather than falling back to something wider.            |
//+------------------------------------------------------------------+
bool ParseRepairWindow()
  {
   g_repValid = false;
   g_repFrom  = 0;
   g_repTo    = 0;

   string a = InpRepairFromArc, b = InpRepairToArc;
   StringTrimLeft(a); StringTrimRight(a);
   StringTrimLeft(b); StringTrimRight(b);

   if(StringLen(a) == 0 && StringLen(b) == 0)
      return true;                     // repair simply not requested

   if(!InpRepairArmed)
     {
      Say("REPAIR: a window is set but InpRepairArmed is false. Nothing will be repaired. "
          "Both keys are required on purpose.");
      return true;
     }

   if(StringLen(a) == 0 || StringLen(b) == 0)
     { Say("REPAIR FATAL: both InpRepairFromArc and InpRepairToArc must be set."); return false; }

   datetime d1 = StringToTime(a), d2 = StringToTime(b);
   if(d1 <= 0 || d2 <= 0)
     { Say("REPAIR FATAL: window not parseable. Use \"YYYY.MM.DD HH:MM\"."); return false; }
   if(d2 <= d1)
     { Say("REPAIR FATAL: InpRepairToArc must be later than InpRepairFromArc."); return false; }

   long span = (long)d2 - (long)d1;
   if(span > (long)REPAIR_MAX_SPAN_HR * 3600)
     {
      Say(StringFormat("REPAIR FATAL: window is %.1f h, wider than the %d h cap. "
                       "Repair one day at a time.", span / 3600.0, REPAIR_MAX_SPAN_HR));
      return false;
     }

   long safeEnd = (long)ArchiveNow() - SAFETY_LAG_SEC;
   if((long)d2 > safeEnd)
     {
      Say("REPAIR FATAL: the window reaches into the live edge. Leave the last minute alone; "
          "the pump owns it.");
      return false;
     }

   g_repFrom   = (long)d1 * 1000;
   g_repTo     = (long)d2 * 1000;
   g_repCursor = g_repFrom;
   g_repValid  = true;

   Say(StringFormat("REPAIR ARMED [%s]: %s -> %s  (%.1f h). "
                    "This region is EXEMPT from the floor, from InpMaxHealHours, and from the bar veto. "
                    "It is NOT exempt from the present-ticks protection: a chunk that already holds "
                    "ticks is never replaced unless InpRepairAllowThin is on and it reads thin.",
                    (InpRepairDryRun ? "DRY RUN" : "WILL WRITE"),
                    TS(g_repFrom), TS(g_repTo), span / 3600.0));
   return true;
  }

//+------------------------------------------------------------------+
//| Repairs one 15-minute chunk. Returns nothing; every outcome is   |
//| tallied and logged so a dry run produces a complete hole map.    |
//|                                                                  |
//| Ordering is the whole safety argument:                           |
//|   1. what does the store hold here?      (never guessed)         |
//|   2. what does the source offer here?    (never assumed)         |
//|   3. is the source dense enough to be real full-depth history?   |
//|   4. only then replace, then read back and compare.              |
//+------------------------------------------------------------------+
void RepairChunk(const long from, const long to)
  {
   //--- 1. the store
   MqlTick have[];
   int haveN = ReadTicks(InpCustomSymbol, have, from, to);

   if(haveN < 0)
     {
      g_repDeferred++;
      Say(StringFormat("REPAIR DEFERRED %s -> %s : store unresolved. Re-run to retry this chunk.",
                       TS(from), TS(to)));
      return;
     }

   //--- 2. the source, read in the server frame then shifted
   MqlTick src[];
   int srcN = ReadTicks(_Symbol, src, ToServerMsc(from), ToServerMsc(to));

   if(srcN < 0)
     {
      g_repDeferred++;
      Say(StringFormat("REPAIR DEFERRED %s -> %s : %s tick history unresolved.",
                       TS(from), TS(to), _Symbol));
      return;
     }

   if(srcN == 0)
     {
      //--- distinguish "market was closed" from "broker does not retain this far back"
      bool open = false;
      bool known = ResolveActivity(from, to, open);
      g_repSilent++;
      if(known && !open)
         Log(StringFormat("REPAIR skip %s -> %s : market closed, nothing to restore.",
                          TS(from), TS(to)));
      else
         Say(StringFormat("REPAIR SOURCE SILENT %s -> %s : %s serves no ticks here%s. "
                          "Nothing can be healed from the live feed for this chunk.",
                          TS(from), TS(to), _Symbol,
                          (known ? " even though the market was open" : "")));
      return;
     }

   ShiftToArchive(src, srcN);

   //--- 3. density. A thin source is not full-depth history and must never
   //--- be allowed to overwrite a range via a delete-then-insert.
   double spanMin = (double)(to - from) / 60000.0;
   double perMin  = (spanMin > 0.0) ? (double)srcN / spanMin : (double)srcN;

   if(InpRepairMinDensity > 0.0 && perMin < InpRepairMinDensity)
     {
      g_repRefused++;
      Say(StringFormat("REPAIR REFUSED %s -> %s : source offers %d tick(s), %.2f/min, "
                       "below the %.2f/min floor. Too thin to be real depth.",
                       TS(from), TS(to), srcN, perMin, InpRepairMinDensity));
      return;
     }

   //--- present-ticks protection, with explicit thin detection
   if(haveN > 0)
     {
      double ratio = (double)haveN / (double)srcN;
      if(ratio >= InpRepairThinRatio)
        {
         g_repPresent++;
         Log(StringFormat("REPAIR intact %s -> %s : store %d, source %d (%.0f%%).",
                          TS(from), TS(to), haveN, srcN, ratio * 100.0));
         return;
        }

      g_repThin++;
      if(!InpRepairAllowThin)
        {
         Say(StringFormat("REPAIR THIN %s -> %s : store holds %d tick(s) but the source offers %d "
                          "(%.0f%%). This chunk looks PARTIALLY destroyed. Not touched - set "
                          "InpRepairAllowThin to replace chunks like this.",
                          TS(from), TS(to), haveN, srcN, ratio * 100.0));
         return;
        }
      Say(StringFormat("REPAIR THIN %s -> %s : store %d vs source %d (%.0f%%). "
                       "InpRepairAllowThin is on - this chunk WILL be replaced.",
                       TS(from), TS(to), haveN, srcN, ratio * 100.0));
     }

   //--- 4. quality gate, same one the pump uses
   bool   useLast = ChartUsesLast();
   double point   = TargetPoint();
   long   archNow = (long)ArchiveNow() * 1000;

   MqlTick keep[];
   ArrayResize(keep, srcN);
   int m = 0;
   for(int i = 0; i < srcN; i++)
     {
      string why = "";
      if((long)src[i].time_msc < from || (long)src[i].time_msc > to) continue;
      if(TickIsValid(src[i], archNow, point, useLast, why)) keep[m++] = src[i];
     }

   if(m == 0)
     {
      g_repRefused++;
      Say(StringFormat("REPAIR REFUSED %s -> %s : all %d source tick(s) failed the quality gate.",
                       TS(from), TS(to), srcN));
      return;
     }
   ArrayResize(keep, m);

   if(InpRepairDryRun || !Writing())
     {
      Say(StringFormat("REPAIR PLAN %s -> %s : would write %d tick(s) (%.1f/min) into a chunk "
                       "currently holding %d.", TS(from), TS(to), m, perMin, haveN));
      return;
     }

   ResetLastError();
   if(CustomTicksReplace(InpCustomSymbol, from, to, keep) < 0)
     {
      g_repErrors++;
      Say(StringFormat("REPAIR ERROR %s -> %s : CustomTicksReplace failed, err %d. %d tick(s) "
                       "were NOT written. AUDIT THIS RANGE - the delete may have already run.",
                       TS(from), TS(to), GetLastError(), m));
      return;
     }

   //--- read back. Cannot undo, but a shortfall announces itself here.
   MqlTick after[];
   int post = ReadTicks(InpCustomSymbol, after, from, to);

   if(post < 0)
      Say(StringFormat("REPAIR %s -> %s : wrote %d tick(s), readback unresolved. Verify manually.",
                       TS(from), TS(to), m));
   else if(post < m)
     {
      g_repErrors++;
      Say(StringFormat("REPAIR SHORTFALL %s -> %s : wrote %d, range now reads %d. AUDIT.",
                       TS(from), TS(to), m, post));
     }
   else
      Say(StringFormat("REPAIRED %s -> %s : %d tick(s) (readback %d).",
                       TS(from), TS(to), m, post));

   g_repWritten++;
   g_repTicks += m;
   MarkDay(from / 1000);
  }

//+------------------------------------------------------------------+
//| Rebuilds M1 from the ticks now stored in the repair window and   |
//| compares against the M1 bars that SURVIVED the original loss.    |
//|                                                                  |
//| READ-ONLY. This writes nothing. It is the only test available    |
//| that can distinguish "the right ticks came back" from "some ticks|
//| came back": the surviving bars were built from the original,     |
//| complete tick base, so if the restored ticks reproduce their OHLC|
//| the restoration is genuine.                                      |
//+------------------------------------------------------------------+
void RepairVerifyBars()
  {
   if(!InpRepairVerifyBars) return;

   MqlTick t[];
   int n = ReadTicks(InpCustomSymbol, t, g_repFrom, g_repTo);
   if(n <= 0)
     { Say("REPAIR VERIFY: no ticks readable in the window, cannot verify."); return; }

   MqlRates built[];
   int m = BuildRatesFromTicks(t, n, built);
   if(m <= 0)
     { Say("REPAIR VERIFY: could not aggregate the restored ticks."); return; }

   MqlRates stored[];
   int s = CopyRates(InpCustomSymbol, PERIOD_M1,
                     (datetime)(g_repFrom / 1000), (datetime)(g_repTo / 1000), stored);
   if(s <= 0)
     { Say("REPAIR VERIFY: no stored M1 bars to compare against."); return; }

   double tol = TargetPoint() * 2.0;   // aggregation tolerance, 2 points

   for(int i = 0; i < m; i++)
     {
      int hit = -1;
      for(int j = 0; j < s; j++)
         if(stored[j].time == built[i].time) { hit = j; break; }

      if(hit < 0) { g_repBarNone++; continue; }

      bool ok = MathAbs(built[i].open  - stored[hit].open)  <= tol
             && MathAbs(built[i].high  - stored[hit].high)  <= tol
             && MathAbs(built[i].low   - stored[hit].low)   <= tol
             && MathAbs(built[i].close - stored[hit].close) <= tol;

      if(ok) g_repBarOk++;
      else
        {
         g_repBarBad++;
         if(InpVerbose)
            Say(StringFormat("REPAIR VERIFY mismatch %s : built %.5f/%.5f/%.5f/%.5f vs "
                             "stored %.5f/%.5f/%.5f/%.5f",
                             TimeToString(built[i].time, TIME_DATE | TIME_MINUTES),
                             built[i].open, built[i].high, built[i].low, built[i].close,
                             stored[hit].open, stored[hit].high, stored[hit].low, stored[hit].close));
        }
     }

   int total = g_repBarOk + g_repBarBad;
   double pct = (total > 0) ? (100.0 * g_repBarOk / total) : 0.0;

   Say(StringFormat("REPAIR VERIFY: %d of %d rebuilt M1 bars match the surviving bars (%.1f%%), "
                    "%d mismatched, %d had no surviving counterpart. "
                    "%s",
                    g_repBarOk, total, pct, g_repBarBad, g_repBarNone,
                    (pct >= 99.0
                     ? "The restored ticks reproduce the original bars - the repair is genuine."
                     : "Below 99% means the restored ticks are NOT the data that built those bars. "
                       "Treat this range as still damaged.")));
  }

//+------------------------------------------------------------------+
//| Bounded, resumable repair. A fixed number of chunks per timer    |
//| tick, so a full day does not freeze the terminal and progress is |
//| observable in the Comment panel.                                 |
//+------------------------------------------------------------------+
void RepairPass()
  {
   if(!g_repValid || g_repDone || g_pumpBlocked) return;

   if(!g_repAnnounced)
     {
      g_repAnnounced = true;
      Say(StringFormat("REPAIR starting: %s -> %s in %d s chunks, %d chunk(s) per second.",
                       TS(g_repFrom), TS(g_repTo), REPAIR_CHUNK_SEC, REPAIR_CHUNKS_PASS));
     }

   int done = 0;
   while(g_repCursor < g_repTo && done < REPAIR_CHUNKS_PASS)
     {
      long cFrom = g_repCursor;
      long cTo   = MinL(cFrom + (long)REPAIR_CHUNK_SEC * 1000 - 1, g_repTo);
      RepairChunk(cFrom, cTo);
      g_repCursor = cTo + 1;
      done++;
     }

   if(g_repCursor < g_repTo) return;

   g_repDone = true;

   Say(StringFormat("REPAIR COMPLETE [%s] %s -> %s : %d chunk(s) written (%I64d ticks), "
                    "%d intact, %d thin, %d refused, %d source-silent, %d deferred, %d error(s).",
                    (InpRepairDryRun ? "DRY RUN - nothing written" : "LIVE"),
                    TS(g_repFrom), TS(g_repTo),
                    g_repWritten, g_repTicks, g_repPresent, g_repThin,
                    g_repRefused, g_repSilent, g_repDeferred, g_repErrors));

   if(g_repDeferred > 0)
      Say("REPAIR: deferred chunks were left untouched. Re-attach with the same window to retry them.");

   if(!InpRepairDryRun && g_repWritten > 0)
     {
      RepairVerifyBars();
      RefreshCharts();
     }
  }

//+------------------------------------------------------------------+
//| On-chart status                                                  |
//+------------------------------------------------------------------+
void ShowStatus()
  {
   string mode = g_pumpBlocked ? "PUMP BLOCKED - frame mismatch"
                               : (Writing() ? "LIVE" : "INSPECT - no writes");

   string floorTag;
   if(g_floorIsHard)
      floorTag = "(HARD LIMIT - InpHardFloorArc)";
   else if(g_floorFromData)
      floorTag = "(from stored data)";
   else
      floorTag = "(DEFAULT - no history found)";

   Comment(StringFormat(
      "SRJ TickPumper v6.02   [%s]\n"
      "%s  ->  %s\n"
      "server UTC%s | archive UTC%s%s | live shift %s\n"
      "archive now %s     server now %s\n"
      "FLOOR     %s   %s\n"
      "hard      %s\n"
      "cursor    %s\n"
      "repair    %s\n"
      "streamed  %I64d   rejected %I64d   spliced %I64d\n"
      "last scan %d hole(s): %d filled, %d refused, %d vetoed\n"
      "note      %s\n"
      "M1 rebuilds %d   (rebuild %s)\n"
      "link %s%s",
      mode,
      _Symbol, InpCustomSymbol,
      HM(g_srvMin), HM(g_arcMin),
      (InpArchiveUtcMin == 9999 ? " (follows server)" : " (fixed)"),
      HM(-(int)(g_deltaSec / 60)),
      TimeToString(ArchiveNow(), TIME_DATE | TIME_MINUTES | TIME_SECONDS),
      TimeToString(ServerNow(),  TIME_DATE | TIME_MINUTES | TIME_SECONDS),
      TS(g_floorMsc), floorTag,
      (g_hardFloorMsc > 0 ? TS(g_hardFloorMsc) : "not set"),
      TS(g_cursorMsc),
      (!g_repValid ? "off"
        : (g_repDone
            ? StringFormat("done - %d written, %d thin, %d refused, %d deferred%s",
                           g_repWritten, g_repThin, g_repRefused, g_repDeferred,
                           (InpRepairDryRun ? " (DRY RUN)" : ""))
            : StringFormat("running %s / %s", TS(g_repCursor), TS(g_repTo)))),
      g_pushed, g_rejected, g_spliced,
      g_lastHoles, g_lastFixed, g_lastRefused, g_lastVetoed,
      g_lastNote,
      g_barsRebuilt, (InpRebuildBars ? "on" : "off"),
      (TerminalInfoInteger(TERMINAL_CONNECTED) ? "connected" : "OFFLINE"),
      (g_holdsLock ? "   [working]" : "")));
  }

//+------------------------------------------------------------------+
//| One maintenance pass                                             |
//+------------------------------------------------------------------+
void Maintain(const string tag)
  {
   int barsBefore = g_barsRebuilt;

   HealSeam(tag);
   RebuildDirtyDays();

   if(g_lastFixed > 0 || g_barsRebuilt > barsBefore)
      RefreshCharts();

   Log(StringFormat("%s done: %d hole(s), %d filled, %d refused, %d vetoed, "
                    "%d day(s) of M1 rebuilt [%s]",
                    tag, g_lastHoles, g_lastFixed, g_lastRefused, g_lastVetoed,
                    g_barsRebuilt - barsBefore,
                    (Writing() ? "LIVE" : "INSPECT")));
  }

//+------------------------------------------------------------------+
//| Init                                                             |
//+------------------------------------------------------------------+
int OnInit()
  {
   if(InpCustomSymbol == _Symbol)
     {
      Say("FATAL: target equals the chart symbol. Attach this to the live broker chart.");
      return INIT_PARAMETERS_INCORRECT;
     }
   if(InpHealBackHours < 0 || InpHealBackHours > 48)
     {
      Say("FATAL: InpHealBackHours must be between 0 and 48.");
      return INIT_PARAMETERS_INCORRECT;
     }
   if(InpArchiveUtcMin != 9999 && MathAbs(InpArchiveUtcMin) > 900)
     {
      Say("FATAL: InpArchiveUtcMin out of range (+/-900, or 9999 to follow the server).");
      return INIT_PARAMETERS_INCORRECT;
     }
   if(InpServerUtcMin != 9999 && MathAbs(InpServerUtcMin) > 900)
     {
      Say("FATAL: InpServerUtcMin out of range (+/-900, or 9999 for auto).");
      return INIT_PARAMETERS_INCORRECT;
     }
   if(!ParseHardFloor())
     {
      Say("FATAL: InpHardFloorArc is not parseable. Use \"YYYY.MM.DD HH:MM\" "
          "in the archive frame, or leave it empty to disable.");
      return INIT_PARAMETERS_INCORRECT;
     }
   if(!ParseRepairWindow())
      return INIT_PARAMETERS_INCORRECT;

   if(InpMinTicksPerMin < 0.0)
     {
      Say("FATAL: InpMinTicksPerMin cannot be negative (0 disables the gate).");
      return INIT_PARAMETERS_INCORRECT;
     }
   if(!SymbolSelect(InpCustomSymbol, true))
     {
      Say(StringFormat("FATAL: cannot select '%s'. Create it in Symbols (Ctrl+U) first.",
                       InpCustomSymbol));
      return INIT_FAILED;
     }
   if(!(bool)SymbolInfoInteger(InpCustomSymbol, SYMBOL_CUSTOM))
     {
      Say(StringFormat("FATAL: '%s' is not a custom symbol, its data is not writable.",
                       InpCustomSymbol));
      return INIT_FAILED;
     }

   g_lockName = "SRJ_PUMP_LOCK_" + InpCustomSymbol;

   //--- time base
   int srvAuto = ServerUtcAuto();
   ApplyOffsets(ServerUtcMinutes());

   Say(StringFormat("time base: server UTC%s%s, archive UTC%s%s -> live shift %s",
                    HM(g_srvMin),
                    (InpServerUtcMin == 9999 ? " (auto)"
                       : StringFormat(" (pinned, auto says UTC%s)", HM(srvAuto))),
                    HM(g_arcMin),
                    (InpArchiveUtcMin == 9999 ? " (follows server)" : " (fixed)"),
                    HM(-(int)(g_deltaSec / 60))));

   int ds = (int)SymbolInfoInteger(_Symbol, SYMBOL_DIGITS);
   int dd = (int)SymbolInfoInteger(InpCustomSymbol, SYMBOL_DIGITS);
   if(ds != dd)
      Say(StringFormat("WARNING: digits mismatch %s=%d vs %s=%d.",
                       _Symbol, ds, InpCustomSymbol, dd));

   if(ChartUsesLast())
      Say(StringFormat("WARNING: %s chart mode is LAST. Dukascopy ticks carry no Last "
                       "price, so set it to Bid or the chart will read empty.",
                       InpCustomSymbol));

   if(g_hardFloorMsc == 0)
      Say("NOTE: InpHardFloorArc is empty. The floor is derived from stored data only. "
          "Setting it to the newest imported timestamp is the strongest available "
          "protection for imported history.");

   if(InpRebuildBars)
      Say("NOTE: InpRebuildBars is on. M1 bars that survive a tick loss are the only "
          "witness to that loss; rebuilding overwrites them. Off is the safer default.");

   g_pushed = 0; g_rejected = 0; g_spliced = 0;
   g_lastHoles = 0; g_lastFixed = 0; g_lastRefused = 0; g_lastVetoed = 0;
   g_barsRebuilt = 0;
   
   g_repPresent = 0; g_repWritten = 0; g_repRefused = 0; g_repDeferred = 0;
   g_repThin = 0; g_repSilent = 0; g_repErrors = 0; g_repTicks = 0;
   g_repBarOk = 0; g_repBarBad = 0; g_repBarNone = 0;
   g_repDone = false; g_repAnnounced = false;
   
   g_lastHeal = 0; g_pumpBlocked = false; g_dirtyCnt = 0;
   g_lastNote = "not scanned yet";
   g_wasConnected = (bool)TerminalInfoInteger(TERMINAL_CONNECTED);
   g_warmFrom = TimeGMT();

   ComputeFloor(true);
   SeedCursor();
   CheckArchiveSanity();
   EventSetTimer(1);

   Say(StringFormat("v6.02 online [%s]: %s -> %s | floor %s%s | spread gate %s | "
                    "spike gate %s | density %.2f/min | bar veto %s | rebuild %s",
                    (Writing() ? "LIVE" : "INSPECT"),
                    _Symbol, InpCustomSymbol, TS(g_floorMsc),
                    (g_floorIsHard ? " (HARD)" : ""),
                    (InpMaxSpreadPts > 0 ? IntegerToString(InpMaxSpreadPts) + " pts" : "off"),
                    (InpMaxSpikePts  > 0 ? IntegerToString(InpMaxSpikePts)  + " pts" : "off"),
                    InpMinTicksPerMin,
                    (InpBarVetoMinutes > 0 ? "> " + IntegerToString(InpBarVetoMinutes) + " min" : "off"),
                    (InpRebuildBars ? "on" : "off")));
   ShowStatus();
   return INIT_SUCCEEDED;
  }

//+------------------------------------------------------------------+
void OnDeinit(const int reason)
  {
   ReleaseLock();
   EventKillTimer();
   Comment("");
   Say(StringFormat("stopped (%d): %I64d streamed, %I64d rejected, %I64d spliced, %d M1 rebuild(s)",
                    reason, g_pushed, g_rejected, g_spliced, g_barsRebuilt));
  }

//+------------------------------------------------------------------+
void OnTick()
  {
   PumpLive();
  }

//+------------------------------------------------------------------+
//| Timer: pump backstop, DST tracking, periodic maintenance         |
//+------------------------------------------------------------------+
void OnTimer()
  {
   static int sanityTick = 0;

   RefreshOffset();
   PumpLive();   // backstop for thin markets and a starved OnTick

   if(++sanityTick >= 60)
     { sanityTick = 0; CheckArchiveSanity(); }

   bool conn = (bool)TerminalInfoInteger(TERMINAL_CONNECTED);
   if(!conn) { g_wasConnected = false; ShowStatus(); return; }

   bool reconnected = !g_wasConnected;
   g_wasConnected = true;

   if(reconnected)
     {
      Say("link restored");
      SeedCursor();
      g_warmFrom = TimeGMT();   // the tick base may need reloading, so wait again
     }

   if(g_pumpBlocked) { ShowStatus(); return; }

   //--- Warm-up. The pump above is append-only and runs regardless; only the
   //--- heal path is delayed, because that is the one that can replace data
   //--- and it is most likely to misread an unloaded tick base right after
   //--- attach or reconnect.
   if(InpWarmupSec > 0)
     {
      long elapsed = (long)TimeGMT() - (long)g_warmFrom;
      if(elapsed < (long)InpWarmupSec)
        {
         g_lastNote = StringFormat("warm-up, %d s left", (int)(InpWarmupSec - elapsed));
         ShowStatus();
         return;
        }
     }

   //--- Repair runs to completion before normal maintenance resumes. It is
   //--- bounded, authorised and one-shot; letting HealSeam interleave with it
   //--- would put two writers in the same region.
   if(g_repValid && !g_repDone)
     {
      if(AcquireLock())
        {
         RepairPass();
         ReleaseLock();
        }
      ShowStatus();
      return;
     }

   bool due = (g_lastHeal == 0)
              || reconnected
              || (InpHealEveryMin > 0 &&
                  ((long)TimeGMT() - (long)g_lastHeal) >= (long)InpHealEveryMin * 60);

   if(due && AcquireLock())
     {
      Maintain(reconnected ? "RECONNECT PASS" : "MAINTENANCE");
      g_lastHeal = TimeGMT();
      ReleaseLock();
     }

   ShowStatus();
  }
//+------------------------------------------------------------------+