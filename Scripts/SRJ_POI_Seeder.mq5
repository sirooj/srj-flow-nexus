//+------------------------------------------------------------------+
//|                                          SRJ_POI_Seeder.mq5      |
//|                                                                  |
//|   Pre-folds a deep archive symbol into the six POI accumulators  |
//|   and writes them to a seed file, so SRJ_POI_Marker can show a   |
//|   Yearly POC that is REAL rather than truncated at whatever tick |
//|   depth the broker happens to hold.                              |
//|                                                                  |
//|   Reads the archive. Writes two files. Touches no symbol data.   |
//|                                                                  |
//|   Three things are non-negotiable and all three are enforced:    |
//|                                                                  |
//|    1. The bin grid comes from the DESTINATION symbol, not the    |
//|       archive. The host recomputes it and refuses on a mismatch. |
//|                                                                  |
//|    2. The usable-tick predicate must be the one the host will    |
//|       apply to its native tail. It is no longer an input on      |
//|       either side - SEED_FIXED_FLAGMODE in SRJ_SeedFormat.mqh is |
//|       the single definition. SRJ_TickFlagAudit measured a 6.6    |
//|       point acceptance gap between EURUSD_RAW and EURUSD under   |
//|       FLAGS, against 0.1 under BIDDIFF, because the importer sets|
//|       TICK_FLAG_BID on 7.4% of ticks whose bid did not move      |
//|       against the live feed's 0.8%.                              |
//|                                                                  |
//|    3. Gaps are reported, not smoothed. A POC seeded across a     |
//|       silent 75 minutes is still a wrong number. The seed carries|
//|       its own gap count so the host can print it.                |
//|                                                                  |
//|   v2.00  TOTAL CLOCK UNIFICATION. Every timestamp this script    |
//|          reads, computes or writes is BROKER SERVER TIME. There  |
//|          are no other zones and there is no DST modelling.       |
//|                                                                  |
//|          DELETED: InpServerDstRule, InpServerGmtBase,            |
//|          InpUseSessionHour, InpSessionHour, InpSessionMinute,    |
//|          InpSessionZone, InpFomcTZ. Every one of them existed to |
//|          drive a conversion that is now gone.                    |
//|                                                                  |
//|          RENAMED: InpFomcTimes -> InpFomcTimesServer. The        |
//|          string's meaning moved by 6-7 hours, so the rename is   |
//|          deliberate - it forces re-entry rather than letting a   |
//|          stale .set file carry Eastern Time into a server-time   |
//|          field in silence. Slot 5 adoption is an exact-equality  |
//|          test on the absolute instant, so a one-hour error       |
//|          DECLINES the slot rather than shifting a line, which is |
//|          silent unless something prints it. Something now does.  |
//|                                                                  |
//|          KEPT: InpArchiveShiftMin. Despite the name it is not a  |
//|          civil timezone setting - it aligns a custom-imported    |
//|          archive's frame to the server frame, and ShiftToServer  |
//|          must run before the first fold because every anchor     |
//|          calculation downstream reads t.time.                    |
//|                                                                  |
//|          HARDCODED, from SRJ_SeedFormat.mqh so the two hosts     |
//|          cannot drift: the usable-tick predicate, the price      |
//|          source, and the per-chunk tick cap. Each was an input   |
//|          on both sides, each had to match exactly, and each had  |
//|          exactly one correct setting.                            |
//|                                                                  |
//|          DERIVED: the output file names. SEED_FileName and       |
//|          SEED_CkptName are the single definition, so a seed and  |
//|          its sidecar cannot be pointed at different symbols.     |
//|                                                                  |
//|          The seed's serverGmtBase field now carries the          |
//|          INSTANTANEOUS broker offset and is INFORMATIONAL. It is |
//|          derived from TimeGMT(), which MT5 computes from the     |
//|          LOCAL PC CLOCK, so nothing may refuse on it.            |
//|                                                                  |
//|   v1.21  THE DEPTH PROBE CAN NO LONGER LIE. SeedMeasureTickDepth |
//|          walks candidate weekdays oldest to newest and stops at  |
//|          the first one that serves ticks. If that is the FIRST   |
//|          candidate, the walk never found an edge - the answer is |
//|          this probe window's own floor, not the broker's cache   |
//|          boundary - and every figure derived from it inherits    |
//|          the fiction. It is now flagged as SATURATED, and it is  |
//|          a WARNING rather than a refusal, because saturation     |
//|          makes the seam CONSERVATIVE rather than wrong.          |
//|                                                                  |
//|   v1.20  CHECKPOINT INTEGRATION. Samples developing POC/VWAP     |
//|          trajectories during the pre-fold walk and writes them   |
//|          to an SRJ_CKPT sidecar, so the host gets a real series  |
//|          left of the seam instead of a flat line.                |
//|                                                                  |
//|   v1.10  SEAM VALIDATION against BOTH ends of the only window in |
//|          which a seam is legal:                                  |
//|            measured native depth <= seam <= newest archive tick  |
//+------------------------------------------------------------------+
#property copyright "SRJ Ventures"
#property version    "2.00"
#property description "Pre-folds an archive symbol into the 6 POI anchor accumulators and writes a seed file for SRJ_POI_Marker. All times are BROKER SERVER TIME."
#property script_show_inputs

#include <SRJ/SRJ_SeedFormat.mqh>

//====================== Inputs ======================================
input group "Symbols"
input string InpArchiveSymbol   = "EURUSD_RAW";    // deep history, read from
input string InpNativeSymbol    = "EURUSD";        // the symbol the HOST runs on
input int    InpArchiveShiftMin = 0;               // archive frame minus SERVER frame, minutes.
                                                   //  NOT a timezone setting. This aligns a
                                                   //  custom-imported archive to the server
                                                   //  frame. 0 unless the import is offset.

input group "Must match SRJ_POI_Marker exactly"
input double            InpBinPips    = 0.1;       // 0.1 pip = 1 point on a 3- or 5-digit quote
input ENUM_WEIGHT_MODE  InpWeightMode = WEIGHT_TICKCOUNT;

input group "FOMC anchor (slot 5) - times are SERVER TIME, pre-converted"
input string InpFomcTimesServer = "2026.07.29 21:00";              // "2026.07.29 21:00; ..." most recent past wins.
                                                   //
                                                   //  FOMC is scheduled in EASTERN TIME and must be
                                                   //  entered here PRE-CONVERTED to server time. The
                                                   //  offset is NOT constant, because US and EU DST
                                                   //  switch on different dates:
                                                   //
                                                   //    1 Nov -> 2nd Sun Mar   EST + EET   = ET+7
                                                   //    2nd Sun Mar -> last Sun Mar        = ET+6
                                                   //    last Sun Mar -> last Sun Oct       = ET+7
                                                   //    last Sun Oct -> 1st Sun Nov        = ET+6
                                                   //
                                                   //  14:00 ET on 2026.07.29  ->  "2026.07.29 21:00"
                                                   //  14:00 ET on 2026.11.04  ->  "2026.11.04 20:00"
                                                   //
                                                   //  The two +6 windows total about three weeks a
                                                   //  year and both routinely contain meetings. The
                                                   //  log below prints the resolved instant and its
                                                   //  weekday for every entry - check it.

input group "Advanced"
input string InpSeamServer        = "";   // "YYYY.MM.DD HH:MM" server frame.
                                         //  Empty = AUTO from measured native depth.
input int    InpNativeDepthDays   = 150;  // probe InpNativeSymbol this far back for its real tick
                                         //  depth. 0 = skip (not recommended). MUST comfortably
                                         //  exceed real depth - a hit on the FIRST candidate
                                         //  weekday means the probe measured its own window and
                                         //  not the broker's cache, and that is reported.
input int    InpSeamMarginDays    = 60;    // AUTO seam clearance above measured depth. Also the
                                         //  re-seed interval: clearance counts down about a day
                                         //  per day, so 21 buys three weeks and 60 buys a quarter.
input int    InpCkIntervalSec     = 60;   // 0 = off. 60 = one sample per M1 boundary, which is
                                         //  exact on every standard timeframe because they are all
                                         //  whole-minute multiples. Raise it only to save disk.
input string InpCkSlots           = "DWMQY";   // "" = AUTO: every calendar slot whose period begins
                                         //  before measured native depth AND whose seam period
                                         //  matches the host's. Override with any of "DWMQY".
input int    InpGapReportSec      = 300;  // log gaps wider than this
input int    InpGapAbortSec       = 0;    // refuse to write if any gap exceeds this. 0 = never.
input int    InpGapLogMax         = 25;   // stop listing individual gaps after this many
input bool   InpVerbose           = false;

//====================== Constants ===================================
#define SEED_RETRIES     40
#define SEED_SLEEP_MS    250
#define SEED_ZERO_OK     8
#define SEED_CHUNK_MS    86400000     // one day per fetch

//--- Depth-probe budget. Deliberately NOT SEED_RETRIES: the probe walks up to
//--- ~32 weekdays and retries each one, so 40 attempts at 250 ms per weekday is
//--- a five-minute stall on a cold tick base. The forward walk is the real
//--- resilience - an unresolved day is treated as no-data and the probe moves
//--- on, which errs LATE, which is the safe direction here.
#define SEED_PROBE_HOUR      10       // server hour. 10:00 on an EET/EEST feed is the
                                      // London morning, the least likely quarter hour
                                      // on EURUSD to be legitimately silent.
#define SEED_PROBE_MINUTES   15
#define SEED_PROBE_RETRIES   2
#define SEED_PROBE_SLEEP_MS  200

//--- CK_MAGIC and CK_VERSION are NOT defined here. They live in
//--- SRJ_SeedFormat.mqh at v2, because until then they were #defined
//--- identically in BOTH .mq5 files - two independent copies of a number that
//--- has to agree or no checkpoint file loads at all.

#define S_DAILY      0
#define S_WEEKLY     1
#define S_MONTHLY    2
#define S_QUARTERLY  3
#define S_YEARLY     4
#define S_FOMC       5

//====================== State =======================================
VwapAccum g_v[SEED_NSLOTS];
PocAccum  g_p[SEED_NSLOTS];

long g_periodStart[SEED_NSLOTS];
long g_absAnchor[SEED_NSLOTS];
int  g_isEvent[SEED_NSLOTS];
int  g_anchorType[SEED_NSLOTS];

long g_ticksRead   = 0;
long g_ticksFolded = 0;
long g_lastArcMsc  = 0;

int  g_gapCount    = 0;
int  g_gapWorst    = 0;
int  g_gapLogged   = 0;

string g_fomcLabel = "";

string g_code[SEED_NSLOTS] = { "D","W","M","Q","Y","F" };

string g_dowName[7] = { "Sunday","Monday","Tuesday","Wednesday",
                        "Thursday","Friday","Saturday" };

//------------------------------------------------------------------
//  CHECKPOINT STORE
//
//  The walk already computes every slot's POC and VWAP at every instant. It
//  just discards all of them but the last. That discard is the entire reason a
//  seeded Yearly line cannot be drawn left of the seam: the file holds ONE
//  number, so there is nothing to plot at 3 February. Keeping a sample per
//  minute costs ~24 bytes and turns the seeded slot into a real series.
//
//  One row carries every slot, because all selected slots sample on the same
//  boundaries. Per-slot series are then just row ranges, which is what
//  g_ckStart is for: when a slot rolls over its accumulator is cleared, so
//  every row before that instant belongs to a period the host is not
//  developing and must not be handed to it.
//------------------------------------------------------------------
struct CkRow
  {
   long   t;                        // server seconds. State = all ticks STRICTLY BEFORE t.
   double poc[SEED_NSLOTS];
   double vwap[SEED_NSLOTS];
  };

CkRow g_ck[];
int   g_ckRows = 0;
int   g_ckStart[SEED_NSLOTS];       // first row belonging to the slot's CURRENT period
bool  g_ckOn[SEED_NSLOTS];
bool  g_ckAny        = false;
long  g_ckNextMs     = 0;
long  g_ckIntervalMs = 0;

//====================== Helpers =====================================
string TSms(const long msc)
  {
   if(msc <= 0) return "-";
   return TimeToString((datetime)(msc / 1000), TIME_DATE | TIME_MINUTES | TIME_SECONDS);
  }

string TSday(const datetime t)
  {
   if(t <= 0) return "-";
   return TimeToString(t, TIME_DATE | TIME_MINUTES);
  }

string DowName(const datetime t)
  {
   int d = TC_Dow(t);
   if(d < 0 || d > 6) return "?";
   return g_dowName[d];
  }

//------------------------------------------------------------------
//  MEASURED NATIVE TICK DEPTH  -  local by design, not in SRJ_TickCore.
//
//  Two reasons it lives here rather than in the shared header. Sleep() is
//  legal in a script and prohibited in an indicator, so the two hosts
//  genuinely want different bodies. And a header addition has to reach every
//  host that includes it, which is one more thing that can be half-applied
//  across duplicate copies of the header - which is exactly how the clock
//  unification release failed to compile the first time.
//
//  Answers a question no symbol property answers: what is the oldest instant
//  for which the terminal actually serves ticks on this symbol RIGHT NOW?
//  Cache depth is server-side policy and it rolls forward every day, so it
//  must be measured, and it may never be cached across a day.
//
//  Method: walk candidate WEEKDAYS oldest to newest, probing one narrow liquid
//  window on each. The first window that serves ticks fixes the answer. Narrow
//  because a full-day probe on EURUSD copies ~400k ticks per attempt, and
//  thirty of those is a stall.
//
//  Both biases are conservative - they report depth LATER than truth, and a
//  request landing before real depth is precisely what produces error 4401:
//   * the answer is the PROBE START, not that day's midnight
//   * a weekday whose window is genuinely silent (a holiday) reads as
//     no-data and pushes the answer later again
//
//  n == 0 and n == -1 are deliberately NOT distinguished. Walking forward,
//  "unresolved, unresolved, then ticks" is the expected signature of the cache
//  boundary itself, and treating unresolved as no-data errs late. Everywhere
//  else in this file the distinction is kept.
//
//  Does NOT call TC_TickUsable: that predicate is stateful under BIDDIFF and a
//  probe must not consume a bid transition the fold is entitled to. Raw
//  presence is the right question anyway.
//
//  SATURATION. The forward walk only measures anything if it FINDS an edge, and
//  it can only find one if maxDaysBack reaches past it. When the very first
//  candidate weekday already serves ticks, the walk terminated on its own
//  starting point: the returned instant is this window's floor, not the
//  broker's. Downstream that is indistinguishable from a measurement, which is
//  how InpNativeDepthDays = 45 produced "depth at now-45d" against a real edge
//  56 days earlier, and every derived figure inherited it. The caller is told.
//
//  Returns 0 for "could not measure", never for "no history".
//------------------------------------------------------------------
datetime SeedMeasureTickDepth(const string sym, const int maxDaysBack, bool &saturated)
  {
   saturated = false;
   if(maxDaysBack <= 0) return 0;

   datetime now = TimeCurrent();
   if(now <= 0) return 0;

   MqlTick buf[];

   //--- A hit on the FIRST candidate weekday means the walk never found an edge.
   //--- Weekends `continue` before this flag is cleared, so it stays true across
   //--- a leading Saturday/Sunday - which is correct: a skipped weekend is not
   //--- evidence of anything either way.
   bool firstCandidate = true;

   for(int d = maxDaysBack; d >= 0; d--)
     {
      datetime day = TC_DayStart((datetime)((long)now - (long)d * 86400));
      int dow = TC_Dow(day);
      if(dow == 0 || dow == 6) continue;             // no data expected

      long from = (long)day + (long)SEED_PROBE_HOUR * 3600;
      long to   = from + (long)SEED_PROBE_MINUTES * 60;
      if(from >= (long)now) break;                   // window not in the past yet
      if(to   >  (long)now) to = (long)now;
      if(to <= from)        break;

      for(int a = 0; a <= SEED_PROBE_RETRIES; a++)
        {
         ResetLastError();
         int n = CopyTicksRange(sym, buf, COPY_TICKS_ALL,
                                (ulong)(from * 1000), (ulong)(to * 1000 - 1));
         if(n > 0)
           {
            saturated = firstCandidate;
            PrintFormat("[Seeder] %s tick depth %s %s (%d ticks in a %d-min probe)",
                        sym,
                        saturated ? "SATURATED - real depth is DEEPER than"
                                  : "measured at",
                        TSday((datetime)from),
                        n, SEED_PROBE_MINUTES);
            return (datetime)from;
           }
         if(a < SEED_PROBE_RETRIES) Sleep(SEED_PROBE_SLEEP_MS);
        }

      //--- This weekday served nothing, so the boundary is later than it.
      //--- Keep walking forward. Erring late is the safe direction. And the
      //--- walk has now genuinely rejected a candidate, so a later hit is a
      //--- real edge rather than the window's floor.
      firstCandidate = false;
     }

   PrintFormat("[Seeder] %s served no ticks in any %d-minute probe across the last %d day(s). "
               "Depth is unmeasurable right now - most likely the tick base is still loading. "
               "This is NOT evidence that the symbol has no history.",
               sym, SEED_PROBE_MINUTES, maxDaysBack);
   return 0;
  }

//------------------------------------------------------------------
//   Tri-state read. -1 means the range could not be resolved, which is
//   NOT the same fact as an empty range. An unresolved chunk aborts the
//   whole seed; folding it as zero ticks would write a confident profile
//   with a hole in it.
//------------------------------------------------------------------
int ArcRead(const string sym, MqlTick &buf[], const long fromMs, const long toMs,
            const bool zeroIsFinal = false)
  {
   int zeroStreak = 0;

   for(int a = 0; a <= SEED_RETRIES; a++)
     {
      ResetLastError();
      int n = CopyTicksRange(sym, buf, COPY_TICKS_ALL, (ulong)fromMs, (ulong)toMs);
      int e = GetLastError();

      if(n > 0) return n;

      if(n == 0 && e == 0)
        {
         zeroStreak++;
         //--- On a chunk with no trading second in it, a clean zero IS the answer.
         //--- Retrying it eight times only buys 1.75 s of sleep per weekend day.
         if(zeroIsFinal || zeroStreak >= SEED_ZERO_OK) return 0;
        }
      else
         zeroStreak = 0;

      Sleep(SEED_SLEEP_MS);
     }
   return -1;
  }

//------------------------------------------------------------------
//   FOMC anchor resolution. SERVER TIME, no conversion.
//
//   StringToTime on operator input yields a naive datetime that IS server
//   time by definition, so the entry is used exactly as written. The most
//   recent entry at or before TimeCurrent() wins.
//
//   BYTE-IDENTICAL to SRJ_POI_Marker::ParseFomcAnchor. That is not a style
//   preference: slot 5 adoption is an exact-equality test on this long, so any
//   divergence between the two bodies declines the slot instead of shifting a
//   line, and a decline is silent unless something prints it.
//
//   logAll exists because the Marker calls this on every rebuild and must not
//   spam. The Seeder runs once, so it always logs.
//
//   A FUTURE-DATED entry is discarded by the `srv <= now` filter and is the one
//   remaining way to get "no usable FOMC anchor" from a correctly formatted
//   string. It is named explicitly below rather than dropped in silence.
//------------------------------------------------------------------
datetime ParseFomcAnchor(const bool logAll)
  {
   g_fomcLabel = "";
   datetime now  = TimeCurrent();
   datetime best = 0;

   string parts[];
   int k = StringSplit(InpFomcTimesServer, ';', parts);

   if(k <= 0)
     {
      if(logAll)
         Print("[Seeder] FOMC: InpFomcTimesServer is empty - slot 5 is seeded EMPTY. That is a "
               "valid configuration; the host will fold slot 5 natively from its own anchor.");
      return 0;
     }

   //--- Two passes. The first resolves and prints every entry, so the operator
   //--- can see exactly which instant each string became. The second picks the
   //--- winner. Splitting them keeps the log in input order rather than in
   //--- whatever order the max-search happens to visit.
   datetime res[];
   string   raw[];
   ArrayResize(res, k);
   ArrayResize(raw, k);
   int nRes = 0;

   for(int i = 0; i < k; i++)
     {
      string s = parts[i];
      StringTrimLeft(s); StringTrimRight(s);
      if(StringLen(s) == 0) continue;

      datetime srv = StringToTime(s);
      if(srv <= 0)
        {
         PrintFormat("[Seeder] FOMC: could not parse \"%s\" - expected yyyy.mm.dd hh:mi. Skipped.", s);
         continue;
        }

      res[nRes] = srv;
      raw[nRes] = s;
      nRes++;

      if(srv > best && srv <= now) { best = srv; g_fomcLabel = s; }
     }

   if(logAll)
     {
      Print("[Seeder] FOMC entries, resolved as SERVER TIME (no conversion applied):");
      for(int i = 0; i < nRes; i++)
        {
         string tag;
         if(res[i] > now)                    tag = "  <- FUTURE, discarded until it passes";
         else if(res[i] == best)             tag = "  <- ACTIVE ANCHOR";
         else                                tag = "  (older, superseded)";
         PrintFormat("[Seeder]   \"%s\"  ->  %s (%s)%s",
                     raw[i], TSday(res[i]), DowName(res[i]), tag);
        }

      if(best <= 0)
        {
         if(nRes > 0)
            Print("[Seeder] FOMC: every entry is FUTURE-DATED, so none is usable yet and slot 5 is "
                  "seeded EMPTY. This is not a parse failure. Add a past meeting if you want slot 5 "
                  "anchored now.");
         else
            Print("[Seeder] FOMC: no entry parsed - slot 5 is seeded EMPTY.");
        }
      else
         PrintFormat("[Seeder] FOMC anchor: %s (%s), from \"%s\". Verify this is the instant you "
                     "intended - FOMC is scheduled in Eastern Time and this field is SERVER time, "
                     "so it must be entered pre-converted (ET+7, or ET+6 in the two DST shoulder "
                     "windows).",
                     TSday(best), DowName(best), g_fomcLabel);
     }

   return best;
  }

//------------------------------------------------------------------
//   Widest anchor start across all six slots, server frame.
//   Includes the FOMC anchor: one older than the yearly start would
//   otherwise be silently truncated.
//------------------------------------------------------------------
datetime WidestStart(const datetime ref, const datetime fomc)
  {
   datetime widest = ref;

   datetime cand[5];
   cand[0] = AnchorStartFor(ref, ANCHOR_DAILY);
   cand[1] = AnchorStartFor(ref, ANCHOR_WEEKLY);
   cand[2] = AnchorStartFor(ref, ANCHOR_MONTHLY);
   cand[3] = AnchorStartFor(ref, ANCHOR_QUARTERLY);
   cand[4] = AnchorStartFor(ref, ANCHOR_YEARLY);

   for(int i = 0; i < 5; i++)
      if(cand[i] < widest) widest = cand[i];

   if(fomc > 0 && fomc < widest) widest = fomc;
   return widest;
  }

//------------------------------------------------------------------
//   Slot reset, preserving the bin size, exactly as the host does.
//------------------------------------------------------------------
void ResetSlot(const int s)
  {
   ClearVwap(g_v[s]);
   ClearPoc(g_p[s]);
  }

//------------------------------------------------------------------
//   Byte-for-byte the same rollover logic as POI's FoldTickAllSlots.
//   Slot 5 is absolute and must never reach AnchorStartFor, which
//   returns t unchanged for ANCHOR_MANUAL and would reset every tick.
//
//   The usability predicate is applied ONCE, here, before the slot
//   loop. Under USABLE_BIDDIFF it is stateful, so calling FoldTick per
//   slot would let the first slot consume the bid transition and starve
//   the other five.
//------------------------------------------------------------------
bool FoldAllSlots(const MqlTick &t)
  {
   if(!TC_TickUsable(t)) return false;

   bool folded = false;

   for(int s = 0; s < SEED_NSLOTS; s++)
     {
      if(g_isEvent[s] != 0)
        {
         if(g_absAnchor[s] > 0 && (long)t.time >= g_absAnchor[s])
            if(FoldTickPreChecked(g_v[s], g_p[s], t)) folded = true;
         continue;
        }

      long ps = (long)AnchorStartFor(t.time, (ENUM_ANCHOR)g_anchorType[s]);
      if(ps != g_periodStart[s])
        {
         ResetSlot(s);
         g_periodStart[s] = ps;
         //--- The accumulator just went to zero, so every row already written
         //--- describes a period that has ended. Discard them for this slot.
         g_ckStart[s] = g_ckRows;
        }
      if(FoldTickPreChecked(g_v[s], g_p[s], t)) folded = true;
     }
   return folded;
  }

//------------------------------------------------------------------
//   Shift a fetched block from the archive frame into the server frame.
//   Every anchor calculation downstream reads t.time, so this must
//   happen before the first fold, not after.
//------------------------------------------------------------------
void ShiftToServer(MqlTick &t[], const int n, const long shiftMs)
  {
   if(shiftMs == 0) return;
   for(int i = 0; i < n; i++)
     {
      t[i].time_msc -= shiftMs;
      t[i].time     = (datetime)(t[i].time_msc / 1000);
     }
  }

//------------------------------------------------------------------
//   Does this silent stretch cover a non-trading day?
//
//   HEURISTIC, not a proof. On an EET/EEST broker the week runs Monday
//   00:00 to Friday 23:59, so a gap touching a Saturday or Sunday is
//   almost always the weekend rather than missing data. Anything two
//   days or wider necessarily covers one. Used only to keep the gap
//   report readable - a weekend gap is still counted, it is just
//   labelled, and it never suppresses the abort check.
//------------------------------------------------------------------
bool GapTouchesWeekend(const long fromSec, const long toSec)
  {
   if(toSec - fromSec >= 2 * 86400) return true;

   for(long t = fromSec; t <= toSec; t += 3600)
     {
      MqlDateTime d; TimeToStruct((datetime)t, d);
      if(d.day_of_week == 0 || d.day_of_week == 6) return true;
     }

   MqlDateTime e; TimeToStruct((datetime)toSec, e);
   return (e.day_of_week == 0 || e.day_of_week == 6);
  }

//------------------------------------------------------------------
//  Is this stretch entirely outside the trading week?
//  Server frame, EET/EEST: week runs Mon 00:00 -> Fri 23:59.
//
//  Three callers. On an unresolved chunk, a stretch with no weekday second in
//  it CANNOT contain a tick, so an unresolved read across it is absence of
//  data, not absence of an answer. On the upper seam check, a seam past the
//  newest archive tick is benign exactly when the stretch between them holds no
//  trading time - which is what a Friday-close / Monday-open seam is. And on
//  the walk itself, it tells ArcRead that a clean zero is final rather than
//  something to retry eight times.
//
//  Hourly sampling cannot produce a false "non-trading", because fromSec itself
//  is always sampled.
//------------------------------------------------------------------
bool ChunkIsNonTrading(const long fromSec, const long toSec)
  {
   for(long t = fromSec; t < toSec; t += 3600)
     {
      MqlDateTime d; TimeToStruct((datetime)t, d);
      if(d.day_of_week != 0 && d.day_of_week != 6) return false;
     }
   return true;
  }

//------------------------------------------------------------------
//  Sample every selected slot, stamped at a boundary. Called BEFORE the tick
//  that crossed that boundary is folded, so the row means "state after all
//  ticks strictly before t" - which is exactly the value a chart bar closing
//  at t should display, on any timeframe.
//------------------------------------------------------------------
void CkEmit(const long stampMs)
  {
   if(!g_ckAny) return;

   if(g_ckRows >= ArraySize(g_ck))
      if(ArrayResize(g_ck, g_ckRows + 16384, 32768) < 0)
        {
         g_ckAny = false;
         Print("[Seeder] checkpoint store could not grow - checkpoints ABANDONED. The seed "
               "itself is unaffected and will still be written.");
         return;
        }

   double sd;
   g_ck[g_ckRows].t = stampMs / 1000;

   for(int s = 0; s < SEED_NSLOTS; s++)
     {
      if(!g_ckOn[s]) { g_ck[g_ckRows].poc[s] = 0.0; g_ck[g_ckRows].vwap[s] = 0.0; continue; }
      g_ck[g_ckRows].poc[s]  = SnapshotPoc(g_p[s]);
      g_ck[g_ckRows].vwap[s] = SnapshotVwap(g_v[s], sd);
     }
   g_ckRows++;
  }

//------------------------------------------------------------------
//  Sidecar file. Deliberately NOT part of SRJ_SeedFormat's read/write
//  functions: the seed format does not change shape, existing seed files stay
//  readable, and a host without this block behaves exactly as before. Its MAGIC
//  and VERSION constants DO live in the header, because both hosts need them
//  and two copies of a number that must agree is one copy too many.
//
//  Every identity field the seed carries is repeated here and re-checked by the
//  host, because a checkpoint series spliced onto a seed built on a different
//  grid is a wrong number rather than a coarse one.
//
//  TWO of those fields are INFORMATIONAL at v2 and the host must not refuse on
//  them: the broker offset and the retired DST field. The offset is derived
//  from TimeGMT(), which MT5 computes from the LOCAL PC CLOCK, so gating a
//  sidecar on it would reject a valid file because of a workstation's timezone.
//  They are written so a human can see a genuine cross-broker mismatch, and
//  serverDst is written as a literal 0 because the rule enum no longer exists.
//------------------------------------------------------------------
bool CkWrite(const string name, const long seamMs, const double binSize,
             const int dig, const double pt, string &err)
  {
   err = "";
   // UPDATED: Added FILE_COMMON to write to Terminal\Common\Files
   int f = FileOpen(name, FILE_WRITE | FILE_BIN | FILE_COMMON);
   if(f == INVALID_HANDLE)
     { err = "cannot open " + name + " for writing (" + IntegerToString(GetLastError()) + ")"; return false; }

   FileWriteInteger(f, CK_MAGIC,   INT_VALUE);
   FileWriteInteger(f, CK_VERSION, INT_VALUE);

   int n = StringLen(InpNativeSymbol);
   FileWriteInteger(f, n, INT_VALUE);
   FileWriteString (f, InpNativeSymbol, n);

   FileWriteInteger(f, dig,                        INT_VALUE);
   FileWriteDouble (f, pt);
   FileWriteDouble (f, binSize);
   FileWriteInteger(f, SEED_FIXED_FLAGMODE,        INT_VALUE);
   FileWriteInteger(f, (int)InpWeightMode,         INT_VALUE);
   FileWriteInteger(f, gtc_serverOffsetKnown ? gtc_serverOffsetNow : 0, INT_VALUE);
   FileWriteInteger(f, 0,                          INT_VALUE);   // retired DST field
   FileWriteLong   (f, seamMs);
   FileWriteInteger(f, InpCkIntervalSec,           INT_VALUE);
   FileWriteInteger(f, SEED_NSLOTS,                INT_VALUE);

   int cnt[SEED_NSLOTS];
   for(int s = 0; s < SEED_NSLOTS; s++)
     {
      cnt[s] = g_ckOn[s] ? (g_ckRows - g_ckStart[s]) : 0;
      if(cnt[s] < 0) cnt[s] = 0;
      FileWriteInteger(f, g_ckOn[s] ? 1 : 0, INT_VALUE);
      FileWriteInteger(f, g_anchorType[s],   INT_VALUE);
      FileWriteLong   (f, g_periodStart[s]);
      FileWriteInteger(f, cnt[s],            INT_VALUE);
     }

   for(int s = 0; s < SEED_NSLOTS; s++)
     {
      if(cnt[s] <= 0) continue;
      for(int i = g_ckStart[s]; i < g_ckRows; i++)
        {
         FileWriteLong  (f, g_ck[i].t);
         FileWriteDouble(f, g_ck[i].poc[s]);
         FileWriteDouble(f, g_ck[i].vwap[s]);
        }
     }

   FileClose(f);
   return true;
  }

//====================== Main ========================================
void OnStart()
  {
   //--------------------------------------------------- validation
   if(InpArchiveSymbol == InpNativeSymbol)
     {
      Print("[Seeder] FATAL: archive and native are the same symbol. Nothing to seed from.");
      return;
     }
   if(!SymbolSelect(InpArchiveSymbol, true))
     { PrintFormat("[Seeder] FATAL: cannot select '%s'.", InpArchiveSymbol); return; }
   if(!SymbolSelect(InpNativeSymbol, true))
     { PrintFormat("[Seeder] FATAL: cannot select '%s'.", InpNativeSymbol); return; }
   if(InpBinPips <= 0.0)
     { Print("[Seeder] FATAL: InpBinPips must be positive."); return; }
   if(InpGapReportSec < 0 || InpGapAbortSec < 0 || InpGapLogMax < 0)
     { Print("[Seeder] FATAL: gap policy values cannot be negative."); return; }
   if(InpNativeDepthDays < 0 || InpSeamMarginDays < 0)
     { Print("[Seeder] FATAL: seam validation values cannot be negative."); return; }
   if(InpCkIntervalSec < 0)
     { Print("[Seeder] FATAL: InpCkIntervalSec cannot be negative."); return; }

   int dArc = (int)SymbolInfoInteger(InpArchiveSymbol, SYMBOL_DIGITS);
   int dNat = (int)SymbolInfoInteger(InpNativeSymbol,  SYMBOL_DIGITS);
   if(dArc != dNat)
     {
      PrintFormat("[Seeder] FATAL: digits mismatch %s=%d vs %s=%d. Archive prices would not "
                  "land on the destination's bin grid, so every seeded POC would be off-grid.",
                  InpArchiveSymbol, dArc, InpNativeSymbol, dNat);
      return;
     }

   double pArc = SymbolInfoDouble(InpArchiveSymbol, SYMBOL_POINT);
   double pNat = SymbolInfoDouble(InpNativeSymbol,  SYMBOL_POINT);
   if(pNat <= 0.0 || MathAbs(pArc - pNat) > pNat * 1.0e-9)
     {
      PrintFormat("[Seeder] FATAL: point size mismatch %s=%.10f vs %s=%.10f.",
                  InpArchiveSymbol, pArc, InpNativeSymbol, pNat);
      return;
     }

   //--------------------------------------------------- core config
   //   Every value the host also derives comes from SRJ_SeedFormat, not from an
   //   input here. Two inputs that must agree are two chances to disagree.
   gtc_priceSrc     = SEED_FIXED_PRICESRC;
   gtc_weightMode   = InpWeightMode;
   gtc_maxBackfill  = SEED_FIXED_MAXCHUNK;      // a capped seed is a lie about depth
   gtc_useTickFlags = true;                     // unread under BIDDIFF; set for completeness
   gtc_usableMode   = (ENUM_USABLE_MODE)SEED_FlagToMode(SEED_FIXED_FLAGMODE);
   gtc_prevBid      = 0.0;

   //--- ADVISORY ONLY. Nothing below consumes this value; it is written into the
   //--- seed header and printed so a human can see whether the workstation clock
   //--- is sane and whether this is the EET/EEST feed the suite assumes. It is
   //--- derived from TimeGMT(), i.e. from the local PC, so it must never gate
   //--- anything. Failure prints "unknown" rather than a plausible number.
   TC_DetectServerOffsetNow();
   PrintFormat("[Seeder] advisory broker offset now: %s (from the LOCAL PC clock via TimeGMT - "
               "informational, never compared). All times below are BROKER SERVER TIME.",
               TC_ServerOffsetText());

   double binSize = SEED_BinSize(InpNativeSymbol, InpBinPips);
   if(!(binSize > 0.0))
     { Print("[Seeder] FATAL: could not resolve a bin size for the destination symbol."); return; }

   long shiftMs = (long)InpArchiveShiftMin * 60000;

   //--------------------------------------------------- newest archive tick
   //   Bounded probe. The newest stored tick is found from the END of the base,
   //   never by requesting the whole range - a full-archive read is the
   //   allocation blow-up this suite already documents. Retried, because an
   //   unloaded base and an empty symbol both return 0.
   long newestSrvMs = 0;
   long ceilMs      = (long)(TimeCurrent() + 120) * 1000;

   for(int a = 0; a <= SEED_RETRIES; a++)
     {
      MqlTick tail[];
      ResetLastError();
      int tp = CopyTicks(InpArchiveSymbol, tail, COPY_TICKS_ALL, 0, 64);
      int e  = GetLastError();

      if(tp > 0)
        {
         while(tp > 0 && (long)tail[tp - 1].time_msc - shiftMs > ceilMs) tp--;
         if(tp > 0) { newestSrvMs = (long)tail[tp - 1].time_msc - shiftMs; break; }
        }

      if(tp == 0 && e == 0 && a >= SEED_ZERO_OK) break;
      Sleep(SEED_SLEEP_MS);
     }

   if(newestSrvMs <= 0)
     {
      PrintFormat("[Seeder] FATAL: %s served no usable ticks after %d attempts. Either it holds "
                  "no history, or the tick base is not loaded. Open a chart on it, let it load, "
                  "and re-run. An unresolved read is not evidence of an empty symbol.",
                  InpArchiveSymbol, SEED_RETRIES);
      return;
     }

   //--------------------------------------------------- native tick depth
   //   Measured on the DESTINATION symbol, because that is what the host folds
   //   from the seam forward. Unmeasurable is FATAL rather than skipped: a seed
   //   whose seam the host cannot reach is folded as empty in silence, and
   //   silence is the one failure this file exists to prevent. Set
   //   InpNativeDepthDays = 0 to opt out deliberately.
   long depthMs  = 0;
   bool depthSat = false;
   if(InpNativeDepthDays > 0)
     {
      datetime dep = SeedMeasureTickDepth(InpNativeSymbol, InpNativeDepthDays, depthSat);
      if(dep <= 0)
        {
         PrintFormat("[Seeder] FATAL: could not measure tick depth on %s. Open a chart on it, "
                     "let the tick base load, and re-run. InpNativeDepthDays = 0 skips this "
                     "check - but then nothing verifies the host can reach the seam.",
                     InpNativeSymbol);
         return;
        }
      depthMs = (long)dep * 1000;

      if(depthSat)
         PrintFormat("[Seeder] WARNING: the depth probe SATURATED at InpNativeDepthDays = %d. "
                     "%s served ticks on the very first candidate weekday, so real depth is "
                     "deeper than %s and that figure is a LOWER BOUND, not a measurement. The "
                     "AUTO seam is still safe - it clears a floor at least this early - but it "
                     "is placed later than necessary, so the host gets less native trajectory "
                     "than it could, and checkpoint AUTO selection may skip a slot that needs "
                     "one. Raise InpNativeDepthDays until this line stops appearing.",
                     InpNativeDepthDays, InpNativeSymbol, TSms(depthMs));

      //--- No legal seam exists at all in this case.
      if(newestSrvMs + 1 < depthMs)
        {
         PrintFormat("[Seeder] FATAL: the archive's newest tick %s is OLDER than native tick "
                     "depth %s. There is no instant both sides can reach, so any seam leaves a "
                     "hole. Re-import %s forward to at least %s, then re-run. Nothing was written.",
                     TSms(newestSrvMs), TSms(depthMs), InpArchiveSymbol, TSms(depthMs));
         return;
        }
     }

   //--------------------------------------------------- seam
   long   seamMs;
   string ss = InpSeamServer;
   StringTrimLeft(ss); StringTrimRight(ss);

   if(StringLen(ss) > 0)
     {
      datetime sd = StringToTime(ss);
      if(sd <= 0)
        { Print("[Seeder] FATAL: InpSeamServer is not parseable. Use \"YYYY.MM.DD HH:MM\", server time."); return; }
      seamMs = (long)sd * 1000;
      PrintFormat("[Seeder] seam from input: %s (%s)", TSday(sd), DowName(sd));
     }
   else if(depthMs > 0)
     {
      //--- AUTO derives from native depth, NOT from the newest archive tick.
      //--- Defaulting to the newest archive tick puts the seam at the chart's
      //--- right edge; every calendar slot then matches its current period and
      //--- adopts, so the entire chart becomes pre-seam - flat lines, no
      //--- trajectory, no markers on any slot. That was measured, not theorised.
      seamMs = depthMs + (long)InpSeamMarginDays * 86400 * 1000;

      if(seamMs > newestSrvMs + 1)
        {
         seamMs = newestSrvMs + 1;
         PrintFormat("[Seeder] AUTO seam clamped to the newest archive tick %s - the archive does "
                     "not reach depth + %d day(s). Clearance above depth is %.1f day(s); "
                     "re-import to restore the full margin.",
                     TSms(newestSrvMs), InpSeamMarginDays,
                     (double)(seamMs - depthMs) / 86400000.0);
        }
      else
         PrintFormat("[Seeder] AUTO seam = depth %s + %d day(s) = %s",
                     TSms(depthMs), InpSeamMarginDays, TSms(seamMs));
     }
   else
     {
      seamMs = newestSrvMs + 1;
      Print("[Seeder] NOTE: InpSeamServer is empty and the depth probe is off, so the seam "
            "lands on the newest archive tick. Every slot whose current period contains that "
            "instant will adopt, which flattens the whole chart - flat lines, no trajectory, "
            "no markers. Set InpSeamServer, or enable InpNativeDepthDays.");
     }

   //--------------------------------------------------- seam validation
   //  UPPER end. The seed stops at the newest archive tick; the host starts at
   //  the seam. Anything in between is folded by NEITHER side.
   if(seamMs > newestSrvMs + 1)
     {
      if(ChunkIsNonTrading(newestSrvMs / 1000 + 1, seamMs / 1000))
         PrintFormat("[Seeder] seam %s is past the newest archive tick %s, but that stretch "
                     "holds no trading time - benign.", TSms(seamMs), TSms(newestSrvMs));
      else
        {
         PrintFormat("[Seeder] FATAL: seam %s is past the newest archive tick %s and the "
                     "stretch between them contains trading time. Neither side would fold it. "
                     "Re-import up to the seam, or move the seam back to %s or earlier. "
                     "Nothing was written.", TSms(seamMs), TSms(newestSrvMs), TSms(newestSrvMs));
         return;
        }
     }

   //  LOWER end. The host cannot fold what the broker does not serve.
   //
   //  Under saturation this test is comparing against a lower bound, so a seam
   //  that fails it may well be reachable and refusing would be wrong. Nothing
   //  here can prove it either way. The fix is a wider InpNativeDepthDays, not
   //  a looser check.
   if(depthMs > 0 && seamMs < depthMs)
     {
      if(depthSat)
         PrintFormat("[Seeder] WARNING: seam %s precedes the SATURATED depth figure %s. That "
                     "figure is a lower bound, so the seam may well be reachable - but nothing "
                     "here can prove it. Raise InpNativeDepthDays and re-run to get a real "
                     "answer. Writing anyway.", TSms(seamMs), TSms(depthMs));
      else
        {
         PrintFormat("[Seeder] FATAL: seam %s precedes measured native depth %s on %s. The host "
                     "would fold the %.1f-day stretch between them as empty and print a confident "
                     "number. Move the seam to %s or later. Nothing was written.",
                     TSms(seamMs), TSms(depthMs), InpNativeSymbol,
                     (double)(depthMs - seamMs) / 86400000.0, TSms(depthMs));
         return;
        }
     }

   //  EXPIRY. The cache is a rolling window that advances about one day per
   //  day, so a seam has a knowable date on which it stops being reachable.
   //  SRJ_POI_Marker derives the same countdown on every rebuild from the seam
   //  in the file and its own depth probe, so the chart asks to be re-seeded
   //  rather than this date living on a calendar.
   datetime seedExpiry = 0;
   if(depthMs > 0)
     {
      double clear = (double)(seamMs - depthMs) / 86400000.0;
      seedExpiry   = (datetime)((long)TimeCurrent() + (seamMs - depthMs) / 1000);
      PrintFormat("[Seeder] seam clears native depth by %.1f day(s)%s. It stops being reachable "
                  "around %s. RE-SEED BEFORE THEN.",
                  clear,
                  depthSat ? " (LOWER BOUND - the probe saturated, so real clearance is larger)"
                           : "",
                  TSday(seedExpiry));
      if(clear < 2.0)
         Print("[Seeder] WARNING: under two days of clearance. Raise InpSeamMarginDays, or "
               "re-import the archive further forward.");
     }

   //--------------------------------------------------- anchors
   datetime now  = TimeCurrent();
   datetime fomc = ParseFomcAnchor(true);
   datetime widest = WidestStart(now, fomc);

   g_anchorType[S_DAILY]     = (int)ANCHOR_DAILY;
   g_anchorType[S_WEEKLY]    = (int)ANCHOR_WEEKLY;
   g_anchorType[S_MONTHLY]   = (int)ANCHOR_MONTHLY;
   g_anchorType[S_QUARTERLY] = (int)ANCHOR_QUARTERLY;
   g_anchorType[S_YEARLY]    = (int)ANCHOR_YEARLY;
   g_anchorType[S_FOMC]      = (int)ANCHOR_MANUAL;

   for(int s = 0; s < SEED_NSLOTS; s++)
     {
      g_isEvent[s]   = (s == S_FOMC) ? 1 : 0;
      g_absAnchor[s] = (s == S_FOMC) ? (long)fomc : 0;

      PocInit(g_p[s], binSize);
      ClearVwap(g_v[s]);

      g_periodStart[s] = (s == S_FOMC)
                       ? 0
                       : (long)AnchorStartFor(widest, (ENUM_ANCHOR)g_anchorType[s]);
     }

   PrintFormat("[Seeder] folding %s from %s to seam %s  bin=%.*f (%.1f pt)  weight=%s  usable=%s",
               InpArchiveSymbol,
               TSday(widest),
               TSms(seamMs),
               dNat, binSize, binSize / pNat,
               EnumToString(InpWeightMode),
               SEED_FlagName(SEED_FIXED_FLAGMODE));

   //--------------------------------------------------- checkpoint selection
   //  AUTO needs BOTH conditions. Below depth means the host physically cannot
   //  fold this period for itself, no matter how the seam is placed. Same
   //  period means the host will actually ADOPT the slot - and a slot that
   //  declines the seed can never use a series, which is how 47,900 Q rows got
   //  written and then refused.
   g_ckIntervalMs = (long)InpCkIntervalSec * 1000;
   for(int s = 0; s < SEED_NSLOTS; s++) { g_ckOn[s] = false; g_ckStart[s] = 0; }

   if(InpCkIntervalSec > 0)
     {
      string sel = InpCkSlots;
      StringTrimLeft(sel); StringTrimRight(sel); StringToUpper(sel);
      datetime seamT = (datetime)(seamMs / 1000);

      for(int s = 0; s < SEED_NSLOTS; s++)
        {
         if(g_isEvent[s] != 0) continue;         // an event anchor never precedes the seam here

         if(StringLen(sel) > 0)
            g_ckOn[s] = (StringFind(sel, g_code[s]) >= 0);
         else if(depthMs > 0)
           {
            datetime seamPS = AnchorStartFor(seamT, (ENUM_ANCHOR)g_anchorType[s]);
            datetime hostPS = AnchorStartFor(now,   (ENUM_ANCHOR)g_anchorType[s]);
            //--- Two conditions, both necessary. Below depth means the host cannot
            //--- fold this period for itself. Same period means the host will
            //--- actually ADOPT, and a slot that declines can never use a series -
            //--- which is how Q's 47,900 rows were written and then refused.
            g_ckOn[s] = ((long)seamPS * 1000 < depthMs) && (seamPS == hostPS);
           }
         else
            g_ckOn[s] = (s == S_QUARTERLY || s == S_YEARLY);

         if(g_ckOn[s]) g_ckAny = true;
        }

      if(g_ckAny)
        {
         string who = "";
         for(int s = 0; s < SEED_NSLOTS; s++)
            if(g_ckOn[s]) who += " " + g_code[s];
         ArrayResize(g_ck, 0, 32768);
         g_ckNextMs = (long)widest * 1000;
         PrintFormat("[Seeder] checkpoints ON for%s at %d s. The host will draw these slots as a "
                     "REAL series from their anchor start, not a flat line from the seam.",
                     who, InpCkIntervalSec);
        }
      else
         Print("[Seeder] checkpoints: no slot qualifies - every calendar period either already "
               "begins inside measured native depth, so the host folds it for itself, or would "
               "decline the seed anyway.");
     }

   //--------------------------------------------------- the walk
   long    fromMs = (long)widest * 1000;
   long    prevMs = 0;
   ulong   t0     = GetMicrosecondCount();
   MqlTick buf[];

   for(long cur = fromMs; cur < seamMs; )
     {
      long chunkEnd = cur + SEED_CHUNK_MS;
      if(chunkEnd > seamMs) chunkEnd = seamMs;

      //--- A chunk with no trading second in it cannot contain a tick, so a
      //--- clean zero is the answer rather than something to retry to the full
      //--- zero-streak. That retry was ~1.75 s per weekend day, ~68 s of a 75 s
      //--- walk. The chunk is still READ, once - if the broker ever does serve
      //--- Sunday-evening ticks in the server frame they are still folded.
      bool nonTrading = ChunkIsNonTrading(cur / 1000, chunkEnd / 1000);
      int  n = ArcRead(InpArchiveSymbol, buf, cur + shiftMs, chunkEnd + shiftMs - 1, nonTrading);

      if(n < 0)
        {
         if(nonTrading)
           {
            PrintFormat("[Seeder] chunk %s -> %s is entirely weekend - unresolved read "
                        "treated as legitimately empty.", TSms(cur), TSms(chunkEnd));
            cur = chunkEnd;
            continue;
           }
         PrintFormat("[Seeder] ABORTED: unresolved read across %s -> %s. Nothing was written. "
                     "An unresolved chunk folded as zero ticks would produce a confident "
                     "profile with a hole in it.",
                     TSms(cur), TSms(chunkEnd));
         return;
        }

      if(InpVerbose)
         PrintFormat("  %s : %d tick(s)", TSms(cur), n);

      if(n > 0)
        {
         ShiftToServer(buf, n, shiftMs);

         for(int i = 0; i < n; i++)
           {
            long ms = (long)buf[i].time_msc;
            if(ms >= seamMs) break;              // exclusive on the archive side

            if(prevMs > 0 && ms < prevMs)
              {
               PrintFormat("[Seeder] ABORTED: timestamps are not monotone at %s. Every "
                           "accumulator in the suite assumes ascending ticks. Audit the "
                           "import for %s.", TSms(ms), InpArchiveSymbol);
               return;
              }

            //--- Checkpoint emit BEFORE the fold, so the row captures state
            //--- strictly before the boundary tick.
            if(g_ckAny && ms >= g_ckNextMs)
              {
               CkEmit(g_ckNextMs);
               g_ckNextMs += g_ckIntervalMs;
              }

            if(FoldAllSlots(buf[i]))
              {
               g_ticksFolded++;
               g_lastArcMsc = ms;
              }

            //--- Gap detection. Applied AFTER the fold so the gap count
            //--- reflects the stretch the fold actually saw.
            if(prevMs > 0)
              {
               long gapSec = (ms - prevMs) / 1000;
               if(gapSec > 0)
                 {
                  g_gapCount++;
                  if(gapSec > g_gapWorst) g_gapWorst = (int)gapSec;

                  if(InpGapReportSec > 0 && gapSec > InpGapReportSec && g_gapLogged < InpGapLogMax)
                    {
                     string note = GapTouchesWeekend(prevMs / 1000, ms / 1000)
                                   ? " (weekend)" : "";
                     PrintFormat("[Seeder] gap %s -> %s : %d s%s",
                                 TSms(prevMs), TSms(ms), (int)gapSec, note);
                     g_gapLogged++;
                    }

                  if(InpGapAbortSec > 0 && gapSec > InpGapAbortSec)
                    {
                     PrintFormat("[Seeder] ABORTED: gap of %d s exceeds InpGapAbortSec=%d. "
                                 "Nothing was written.", (int)gapSec, InpGapAbortSec);
                     return;
                    }
                 }
              }

            prevMs = ms;
           }
        }

      cur = chunkEnd;
     }

   //--- Final checkpoint sample at the seam boundary.
   if(g_ckAny) CkEmit(seamMs);

   double elapsed = (double)(GetMicrosecondCount() - t0) / 1e6;

   //--------------------------------------------------- write seed
   string seedName = SEED_FileName(InpNativeSymbol);
   SeedHeader h;
   SEED_HeaderClear(h);

   h.dstSymbol   = InpNativeSymbol;
   h.srcSymbol   = InpArchiveSymbol;
   h.digits      = dNat;
   h.point       = pNat;
   h.binSize     = binSize;
   h.seamMsc     = seamMs;
   h.lastArcMsc  = g_lastArcMsc;
   h.lastBid     = gtc_prevBid;
   h.weightMode  = (int)InpWeightMode;
   h.flagMode    = SEED_FIXED_FLAGMODE;
   h.serverGmtBase = gtc_serverOffsetKnown ? gtc_serverOffsetNow : 0;
   h.serverDst     = 0;   // retired; literal 0 because the enum no longer exists
   h.ticksFolded = g_ticksFolded;
   h.ticksRead   = g_ticksRead;
   h.gapCount    = g_gapCount;
   h.gapWorstSec = g_gapWorst;
   h.builtAt     = (long)TimeCurrent();

   string err;
   if(!SEED_Write(seedName, h, g_periodStart, g_absAnchor,
                  g_isEvent, g_anchorType, g_v, g_p, err))
     {
      PrintFormat("[Seeder] FATAL: could not write seed file '%s': %s. Nothing was written.",
                  seedName, err);
      return;
     }

   //--------------------------------------------------- write checkpoint sidecar
   if(g_ckAny)
     {
      string ckName = SEED_CkptName(InpNativeSymbol);
      string ckErr;
      if(!CkWrite(ckName, seamMs, binSize, dNat, pNat, ckErr))
        {
         PrintFormat("[Seeder] WARNING: could not write checkpoint sidecar '%s': %s. "
                     "The seed itself was written successfully and is unaffected - the host will "
                     "just draw flat lines left of the seam instead of a real series.",
                     ckName, ckErr);
        }
      else
        {
         //--- Count and report total checkpoint rows written.
         int ckTotal = 0;
         for(int s = 0; s < SEED_NSLOTS; s++)
            if(g_ckOn[s]) ckTotal += (g_ckRows - g_ckStart[s]);
         PrintFormat("[Seeder] checkpoint sidecar '%s' written: %d total row-slot samples.",
                     ckName, ckTotal);
        }
     }

   //--------------------------------------------------- summary
   PrintFormat("[Seeder] DONE. %s -> %s  seam %s  %s ticks folded / %s read  "
               "%d gap(s), worst %d s  %.1f s",
               InpArchiveSymbol, InpNativeSymbol,
               TSms(seamMs),
               IntegerToString(g_ticksFolded), IntegerToString(g_ticksRead),
               g_gapCount, g_gapWorst,
               elapsed);

   if(g_gapCount > 0)
      PrintFormat("[Seeder]   gap summary: %d total, %d wider than %d s reported, "
                  "%d wider than %d s would have aborted.",
                  g_gapCount,
                  g_gapLogged, InpGapReportSec,
                  0, InpGapAbortSec);   // abort would have returned, so 0 survived

   PrintFormat("[Seeder]   seed file: %s", seedName);
   PrintFormat("[Seeder]   %s", SEED_ClockInfoText(h, gtc_serverOffsetNow, gtc_serverOffsetKnown));

   //--- Per-slot adoption forecast.
   datetime hostNow = TimeCurrent();
   for(int s = 0; s < SEED_NSLOTS; s++)
     {
      if(g_isEvent[s] != 0)
        {
         if(g_absAnchor[s] > 0)
            PrintFormat("[Seeder]   slot %s (FOMC): absolute anchor %s", g_code[s], TSday((datetime)(g_absAnchor[s] / 1000)));
         else
            PrintFormat("[Seeder]   slot %s (FOMC): no anchor, seeded empty", g_code[s]);
         continue;
        }

      datetime seamPS  = AnchorStartFor((datetime)(seamMs / 1000), (ENUM_ANCHOR)g_anchorType[s]);
      datetime hostPS  = AnchorStartFor(hostNow, (ENUM_ANCHOR)g_anchorType[s]);
      bool     adopts  = (seamPS == hostPS);

      string   note    = adopts ? "ADOPTS - host continues from seam"
                                : "declines - host folds natively from its own period start";

      //--- Checkpoint row count for this slot.
      string ckNote = "";
      if(g_ckOn[s])
         ckNote = StringFormat(", %d ck rows", g_ckRows - g_ckStart[s]);

      PrintFormat("[Seeder]   slot %s (%s): seam period %s, host period %s  %s%s",
                  g_code[s], TC_AnchorName((ENUM_ANCHOR)g_anchorType[s]),
                  TSday(seamPS), TSday(hostPS), note, ckNote);
     }
  }
//+------------------------------------------------------------------+