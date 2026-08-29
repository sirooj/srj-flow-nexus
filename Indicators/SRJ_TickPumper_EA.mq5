//+------------------------------------------------------------------+
//|                                          SRJ_TickPumper_EA.mq5   |
//|   v3.30 - time-base aware pump + non-destructive seam healer     |
//+------------------------------------------------------------------+
#property copyright "SRJ"
#property version   "3.30"
#property description "Translates broker server-time ticks into the archive time base, streams them loss-lessly, and heals only ranges proven empty by two independent bases."

//--- Target ---------------------------------------------------------
input group             "=== Target ==="
input string   InpCustomSymbol      = "EURUSD_RAW"; // Custom symbol to write into

//--- Time base ------------------------------------------------------
input group             "=== Time base (run SRJ_TickAudit first) ==="
input int      InpFeedOffsetMinutes = -9999; // Server feed minus archive, minutes. -9999 = unconfigured
input bool     InpTrackGmtDrift     = true;  // Follow DST via TimeGMT and cross-check the offset

//--- Live pump ------------------------------------------------------
input group             "=== Live pump ==="
input int      InpTailCatchupHours  = 2;     // Max hours the pump replays on start
input int      InpAddChunk          = 2048;  // Ticks per CustomTicksAdd call

//--- Seam healer ----------------------------------------------------
input group             "=== Seam healer (scope-limited) ==="
input bool     InpDryRun            = true;  // TRUE = healer reports only, writes nothing
input int      InpHealHours         = 48;    // Only heal the last N hours
input datetime InpArchiveFloor      = 0;     // Never write at or before this, ARCHIVE frame (0 = window start)
input int      InpGapSeconds        = 60;    // Min tick spacing treated as a hole
input int      InpMaxHoleMinutes    = 240;   // Larger holes are reported, never written
input int      InpSafetyLagSeconds  = 60;    // Never heal closer than this to now
input int      InpHealEverySeconds  = 300;   // Periodic heal interval
input bool     InpRebuildRates      = false; // Delete rates after a verified splice

//--- Sync -----------------------------------------------------------
input group             "=== Sync / coordination ==="
input int      InpSyncRetries       = 40;    // Retries per history request
input int      InpRetrySleepMs      = 250;   // Sleep between retries
input int      InpEmptyConfirms     = 10;    // Spaced confirmations before believing "empty"
input bool     InpSerializeHeals    = true;  // One heal at a time across charts
input int      InpLockTimeoutSec    = 300;   // Stale lock expiry

//--- Diagnostics ----------------------------------------------------
input group             "=== Diagnostics ==="
input bool     InpVerbose           = true;  // Verbose log
input bool     InpShowComment       = true;  // On-chart status

#define LOCK_NAME "SRJ_PUMPER_HEAL_LOCK"

//--- range classification ------------------------------------------
enum EMPTY_CHECK
  {
   EC_WRITABLE,      // both bases agree the range holds nothing
   EC_HAS_DATA,      // real tick data present, never touch
   EC_PHANTOM_BARS,  // bars exist but the tick base is empty - import required
   EC_UNRESOLVED     // could not determine, retry later
  };

//--- state ----------------------------------------------------------
long     g_offSec       = 0;      // server minus archive, seconds
int      g_offMin       = 0;      // same, minutes
bool     g_offKnown     = false;  // TRUE once the time base is configured
bool     g_forceDry     = false;  // healer disabled by a safety condition
bool     g_pumpBlocked  = false;  // pump disabled: archive holds future-stamped ticks

long     g_cursorMsc    = 0;      // ARCHIVE frame
int      g_cursorDup    = 0;
long     g_pushed       = 0;
long     g_spliced      = 0;
long     g_wouldSplice  = 0;
int      g_needImport   = 0;
int      g_protected    = 0;
int      g_phantom      = 0;
int      g_lastHoles    = 0;
datetime g_lastHeal     = 0;
bool     g_wasConnected = true;
bool     g_holdsLock    = false;

//+------------------------------------------------------------------+
//| Helpers                                                          |
//+------------------------------------------------------------------+
void Log(const string m) { if(InpVerbose) Print("[SRJ Pumper] ", m); }
void Say(const string m) { Print("[SRJ Pumper] ", m); }

long MinL(const long a, const long b) { return a < b ? a : b; }
long MaxL(const long a, const long b) { return a > b ? a : b; }

bool DryMode() { return (InpDryRun || g_forceDry); }

string TS(const long msc)
  {
   return TimeToString((datetime)(msc / 1000), TIME_DATE | TIME_MINUTES | TIME_SECONDS)
          + StringFormat(".%03d", (int)(msc % 1000));
  }

//--- frame conversion. Internal state is always archive frame. ------
long     ToServerMsc (const long archiveMsc) { return archiveMsc + g_offSec * 1000; }
long     ToArchiveMsc(const long serverMsc)  { return serverMsc  - g_offSec * 1000; }
datetime ArchiveNow()                        { return (datetime)((long)TimeCurrent() - g_offSec); }

//+------------------------------------------------------------------+
//| Shift a source block from server frame into the archive frame.   |
//+------------------------------------------------------------------+
void ShiftToArchive(MqlTick &t[], const int n)
  {
   if(g_offSec == 0) return;
   long shift = g_offSec * 1000;
   for(int i = 0; i < n; i++)
     {
      t[i].time_msc -= shift;
      t[i].time      = (datetime)(t[i].time_msc / 1000);
     }
  }

//+------------------------------------------------------------------+
//| DST tracking. The archive is UTC, so the GMT-derived offset is    |
//| authoritative provided the PC clock is right. Only a whole-hour   |
//| DST-sized correction is adopted; anything else is a fault.        |
//+------------------------------------------------------------------+
void RefreshOffset()
  {
   if(!InpTrackGmtDrift) return;

   long raw = (long)TimeCurrent() - (long)TimeGMT();
   int  gmtMin = (int)MathRound(raw / 900.0) * 15;   // nearest 15 min

   if(gmtMin == g_offMin) return;

   int delta = MathAbs(gmtMin - g_offMin);
   if(delta == 60)
     {
      Say(StringFormat("time base: DST shift detected, offset %+d -> %+d min", g_offMin, gmtMin));
      g_offMin = gmtMin;
      g_offSec = (long)gmtMin * 60;
      SeedCursor();
      return;
     }

   if(!g_forceDry)
      Say(StringFormat("FAULT: GMT-derived offset %+d min disagrees with the configured %+d min "
                       "by %d min. Healer disabled. Re-run SRJ_TickAudit and check the PC clock.",
                       gmtMin, g_offMin, delta));
   g_forceDry = true;
  }

//+------------------------------------------------------------------+
//| Retry-hardened tick read. The range must be in the frame native  |
//| to the symbol being read.                                        |
//| >0 count, 0 only after InpEmptyConfirms spaced confirmations,    |
//| -1 if the request never resolved.                                |
//+------------------------------------------------------------------+
int ReadTicks(const string sym, MqlTick &out[], const long fromMsc, const long toMsc)
  {
   int zeroStreak = 0;

   for(int a = 0; a <= InpSyncRetries; a++)
     {
      ResetLastError();
      int n = CopyTicksRange(sym, out, COPY_TICKS_ALL, (ulong)fromMsc, (ulong)toMsc);
      int e = GetLastError();

      if(n > 0)
         return n;

      if(n == 0 && e == 0)
        {
         if(++zeroStreak >= InpEmptyConfirms)
            return 0;
        }
      else
         zeroStreak = 0;

      Sleep(InpRetrySleepMs);
     }

   Log(StringFormat("unresolved read %s %s -> %s", sym, TS(fromMsc), TS(toMsc)));
   return -1;
  }

//+------------------------------------------------------------------+
//| Sync-aware market activity oracle. Range is ARCHIVE frame and is |
//| converted to server frame for the source-symbol query.           |
//+------------------------------------------------------------------+
bool ResolveActivity(const long fromMsc, const long toMsc, bool &out_open)
  {
   datetime t1 = (datetime)(ToServerMsc(fromMsc) / 1000);
   datetime t2 = (datetime)(ToServerMsc(toMsc)   / 1000) + 1;

   for(int a = 0; a <= InpSyncRetries; a++)
     {
      int n = Bars(_Symbol, PERIOD_M1, t1, t2);
      if(n > 0) { out_open = true; return true; }

      if((bool)SeriesInfoInteger(_Symbol, PERIOD_M1, SERIES_SYNCHRONIZED))
        { out_open = false; return true; }

      Sleep(InpRetrySleepMs);
     }

   out_open = false;
   return false;
  }

//+------------------------------------------------------------------+
//| THE GUARD. Two independent bases must agree before any write.     |
//| Also separates a genuine hole from a range whose rates base       |
//| survived while its tick base was wiped. ARCHIVE frame.            |
//+------------------------------------------------------------------+
EMPTY_CHECK ClassifyRange(const long fromMsc, const long toMsc)
  {
   datetime t1 = (datetime)(fromMsc / 1000);
   datetime t2 = (datetime)(toMsc / 1000) + 1;

   int bars = Bars(InpCustomSymbol, PERIOD_M1, t1, t2);

   MqlTick probe[];
   int n = ReadTicks(InpCustomSymbol, probe, fromMsc, toMsc);

   if(n < 0)
      return EC_UNRESOLVED;
   if(n > 0)
      return EC_HAS_DATA;              // ticks present - hands off
   if(bars > 0)
      return EC_PHANTOM_BARS;          // bars without ticks - import required
   return EC_WRITABLE;
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
//| Write one hole from the preloaded, already-shifted source block.  |
//| Three brakes must all pass. All times ARCHIVE frame.              |
//+------------------------------------------------------------------+
void FillHole(const MqlTick &block[], const int blockN,
              const long from, const long to, const long floorMsc)
  {
   //--- brake 1: absolute write floor
   if(from <= floorMsc)
     {
      g_protected++;
      Log(StringFormat("PROTECTED %s -> %s : at or before the archive floor %s",
                       TS(from), TS(to), TS(floorMsc)));
      return;
     }

   //--- brake 2: size cap. Large holes are an import job, not a splice job.
   long minutes = (to - from) / 60000;
   if(minutes > InpMaxHoleMinutes)
     {
      g_needImport++;
      Say(StringFormat("NEEDS IMPORT %s -> %s (%d min) : exceeds the %d min splice cap. "
                       "Re-export this range from the .bi5 archive.",
                       TS(from), TS(to), (int)minutes, InpMaxHoleMinutes));
      return;
     }

   //--- payload
   int lo  = LowerBound(block, blockN, from);
   int hi  = LowerBound(block, blockN, to + 1);
   int cnt = hi - lo;
   if(cnt <= 0)
     {
      Log(StringFormat("source silent across %s -> %s, nothing to write", TS(from), TS(to)));
      return;
     }

   //--- brake 3: dual-base classification
   EMPTY_CHECK ec = ClassifyRange(from, to);

   if(ec == EC_HAS_DATA)
     {
      g_protected++;
      Log(StringFormat("PROTECTED %s -> %s : tick data already present", TS(from), TS(to)));
      return;
     }
   if(ec == EC_UNRESOLVED)
     {
      Log(StringFormat("DEFERRED %s -> %s : classification unresolved", TS(from), TS(to)));
      return;
     }
   if(ec == EC_PHANTOM_BARS)
     {
      g_phantom++;
      g_needImport++;
      Say(StringFormat("PHANTOM BARS %s -> %s : M1 bars exist but the tick base is empty. "
                       "Tick indicators are blind here. Re-import from the .bi5 archive.",
                       TS(from), TS(to)));
      return;
     }

   //--- dry run stops here
   if(DryMode())
     {
      g_wouldSplice += cnt;
      Say(StringFormat("DRY RUN: would write %d tick(s) into %s -> %s",
                       cnt, TS(from), TS(to)));
      return;
     }

   MqlTick slice[];
   ArrayResize(slice, cnt);
   for(int i = 0; i < cnt; i++)
      slice[i] = block[lo + i];

   ResetLastError();
   int rep = CustomTicksReplace(InpCustomSymbol, from, to, slice);
   if(rep < 0)
     {
      Say(StringFormat("ERROR: CustomTicksReplace %s -> %s (%d ticks) err %d",
                       TS(from), TS(to), cnt, GetLastError()));
      return;
     }

   //--- verify the write actually landed
   MqlTick after[];
   int nAfter = ReadTicks(InpCustomSymbol, after, from, to);
   Say(StringFormat("SPLICED %s -> %s : wrote %d, range now reads %d",
                    TS(from), TS(to), cnt, nAfter));

   g_spliced += cnt;

   if(InpRebuildRates && nAfter > 0)
      CustomRatesDelete(InpCustomSymbol,
                        (datetime)(from / 1000) - 60,
                        (datetime)(to / 1000) + 60);
  }

//+------------------------------------------------------------------+
//| Heal the recent seam only. Never scans the deep archive.          |
//| All internal ranges are ARCHIVE frame.                            |
//+------------------------------------------------------------------+
void HealSeam(const string tag)
  {
   long healEnd   = (long)(ArchiveNow() - InpSafetyLagSeconds) * 1000;
   long healStart = (long)(ArchiveNow() - (long)InpHealHours * 3600) * 1000;
   if(healEnd <= healStart)
      return;

   long floorMsc = healStart;
   if(InpArchiveFloor > 0)
      floorMsc = MaxL(floorMsc, (long)InpArchiveFloor * 1000);

   //--- was the market open in this window at all?
   bool open = false;
   if(!ResolveActivity(healStart, healEnd, open))
     { Log(tag + ": activity unresolved, will retry"); return; }
   if(!open)
     { Log(tag + ": market closed across the window"); g_lastHoles = 0; return; }

   //--- local coverage
   MqlTick loc[];
   int locN = ReadTicks(InpCustomSymbol, loc, healStart, healEnd);
   if(locN < 0)
     { Say(tag + ": aborted, local tick base unresolved"); return; }

   //--- collect holes
   long hFrom[], hTo[];
   int  holes = 0;
   long gapMs = (long)InpGapSeconds * 1000;
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
      // Nothing in the whole window. The size cap and the dual-base guard
      // decide whether this is safe to touch. Usually it is not.
      ArrayResize(hFrom, 1); ArrayResize(hTo, 1);
      hFrom[0] = healStart; hTo[0] = healEnd; holes = 1;
      Log(tag + ": window reads empty end to end");
     }
   else if((healEnd - prev) > gapMs)
     {
      ArrayResize(hFrom, holes + 1); ArrayResize(hTo, holes + 1);
      hFrom[holes] = prev + 1; hTo[holes] = healEnd; holes++;
     }

   g_lastHoles = holes;
   if(holes == 0)
     { Log(tag + ": seam is continuous"); return; }

   //--- one wide source request, server frame, then shifted to archive
   MqlTick src[];
   int srcN = ReadTicks(_Symbol, src, ToServerMsc(healStart), ToServerMsc(healEnd));
   if(srcN < 0)
     {
      Say(StringFormat("%s: %d hole(s) but source history unresolved, will retry", tag, holes));
      return;
     }
   if(srcN == 0)
     {
      Say(StringFormat("%s: %d hole(s) and %s serves no ticks for this window",
                       tag, holes, _Symbol));
      return;
     }

   ShiftToArchive(src, srcN);

   for(int h = 0; h < holes; h++)
      FillHole(src, srcN, hFrom[h], hTo[h], floorMsc);

   Say(StringFormat("%s complete: %d hole(s) | mode %s | protected %d | phantom %d | needs import %d",
                    tag, holes, (DryMode() ? "DRY RUN" : "LIVE"),
                    g_protected, g_phantom, g_needImport));
  }

//+------------------------------------------------------------------+
//| Archive sanity gate.                                             |
//| If the tick base holds ticks stamped ahead of archive now, the    |
//| frame is contaminated and CustomTicksAdd will reject correctly    |
//| stamped live ticks as out of order. Block the pump and say why.   |
//+------------------------------------------------------------------+
bool CheckArchiveSanity()
  {
   MqlTick t[];
   int n = CopyTicks(InpCustomSymbol, t, COPY_TICKS_ALL, 0, 1);
   if(n <= 0)
     {
      g_pumpBlocked = false;
      return true;                      // empty base is safe to write into
     }

   long last     = (long)t[n - 1].time_msc;
   long archNow  = (long)ArchiveNow() * 1000;
   long aheadSec = (last - archNow) / 1000;

   if(aheadSec > 60)
     {
      if(!g_pumpBlocked)
         Say(StringFormat("PUMP BLOCKED: %s holds ticks stamped %s, which is %d min ahead of "
                          "archive now (%s). The tick base is in the wrong time frame. "
                          "Purge and re-import that range before streaming.",
                          InpCustomSymbol, TS(last), (int)(aheadSec / 60),
                          TimeToString(ArchiveNow(), TIME_DATE | TIME_MINUTES | TIME_SECONDS)));
      g_pumpBlocked = true;
      g_forceDry    = true;
      return false;
     }

   if(g_pumpBlocked)
      Say("pump unblocked: archive tick base is no longer future-stamped");

   g_pumpBlocked = false;
   return true;
  }

//+------------------------------------------------------------------+
//| Cross-chart heal lock                                            |
//+------------------------------------------------------------------+
bool AcquireLock()
  {
   if(!InpSerializeHeals) return true;
   if(g_holdsLock)        return true;

   double stamp = (double)TimeLocal();
   if(GlobalVariableCheck(LOCK_NAME))
     {
      if(stamp - GlobalVariableGet(LOCK_NAME) < InpLockTimeoutSec)
         return false;
      GlobalVariableDel(LOCK_NAME);
     }
   if(!GlobalVariableSetOnCondition(LOCK_NAME, stamp, 0.0))
     {
      GlobalVariableTemp(LOCK_NAME);
      if(GlobalVariableGet(LOCK_NAME) != 0.0) return false;
      GlobalVariableSet(LOCK_NAME, stamp);
     }
   g_holdsLock = true;
   return true;
  }

void ReleaseLock()
  {
   if(g_holdsLock) { GlobalVariableDel(LOCK_NAME); g_holdsLock = false; }
  }

//+------------------------------------------------------------------+
//| Loss-less live pump.                                             |
//| Reads the source in SERVER frame from the translated cursor,      |
//| shifts the block into ARCHIVE frame, then appends what is new.    |
//| Immune to event coalescing and to a blocked handler.              |
//+------------------------------------------------------------------+
void PumpLive()
  {
   if(g_pumpBlocked || !g_offKnown)
      return;

   long fromArc = (g_cursorMsc > 0)
                  ? g_cursorMsc
                  : (long)(ArchiveNow() - 60) * 1000;
   long toArc   = (long)(ArchiveNow() + 10) * 1000;

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

   int cnt = n - first;
   if(cnt <= 0) return;

   MqlTick buf[];
   int done = 0;
   while(done < cnt)
     {
      int k = (int)MinL(InpAddChunk, cnt - done);
      ArrayResize(buf, k);
      for(int i = 0; i < k; i++) buf[i] = t[first + done + i];

      ResetLastError();
      if(CustomTicksAdd(InpCustomSymbol, buf) < 0)
        {
         int err = GetLastError();
         Say(StringFormat("ERROR: CustomTicksAdd rejected %d ticks at %s (err %d)",
                          k, TS((long)buf[0].time_msc), err));
         CheckArchiveSanity();   // out-of-order rejection usually means frame contamination
         return;
        }
      done += k;
     }

   long nc = (long)t[n - 1].time_msc;
   int  at = 0;
   for(int i = n - 1; i >= 0 && (long)t[i].time_msc == nc; i--) at++;

   g_cursorMsc = nc;
   g_cursorDup = at;
   g_pushed   += cnt;
  }

//+------------------------------------------------------------------+
//| Seed the cursor from what is already stored locally (ARCHIVE).    |
//+------------------------------------------------------------------+
void SeedCursor()
  {
   MqlTick t[];
   int n = CopyTicks(InpCustomSymbol, t, COPY_TICKS_ALL, 0, 256);
   long floorMsc = (long)(ArchiveNow() - (long)InpTailCatchupHours * 3600) * 1000;

   if(n <= 0 || (long)t[n - 1].time_msc < floorMsc)
     {
      g_cursorMsc = floorMsc;
      g_cursorDup = 0;
      Log(StringFormat("cursor seeded at the catch-up floor %s", TS(g_cursorMsc)));
      return;
     }

   long last = (long)t[n - 1].time_msc;
   int  at = 0;
   for(int i = n - 1; i >= 0 && (long)t[i].time_msc == last; i--) at++;

   g_cursorMsc = last;
   g_cursorDup = at;
   Log(StringFormat("cursor resumes from %s (%d tick(s) on that ms)", TS(g_cursorMsc), at));
  }

//+------------------------------------------------------------------+
//| On-chart status                                                  |
//+------------------------------------------------------------------+
void ShowStatus()
  {
   if(!InpShowComment) return;

   string mode = g_pumpBlocked ? "PUMP BLOCKED - frame contaminated"
                               : (DryMode() ? "DRY RUN - no writes" : "LIVE WRITES");

   Comment(StringFormat(
      "SRJ TickPumper v3.30   [%s]\n%s -> %s\n"
      "time base: server %+d min vs archive   archive now %s\n"
      "cursor:   %s\n"
      "streamed: %I64d ticks\n"
      "%s: %I64d ticks\n"
      "last scan: %d hole(s) | protected %d | phantom %d | needs .bi5 import %d\n"
      "heal window: last %d h   link: %s%s",
      mode,
      _Symbol, InpCustomSymbol,
      g_offMin,
      TimeToString(ArchiveNow(), TIME_DATE | TIME_MINUTES | TIME_SECONDS),
      (g_cursorMsc > 0 ? TS(g_cursorMsc) : "-"),
      g_pushed,
      (DryMode() ? "would splice" : "spliced"),
      (DryMode() ? g_wouldSplice : g_spliced),
      g_lastHoles, g_protected, g_phantom, g_needImport,
      InpHealHours,
      (TerminalInfoInteger(TERMINAL_CONNECTED) ? "connected" : "OFFLINE"),
      (g_holdsLock ? "   [healing]" : "")));
  }

//+------------------------------------------------------------------+
//| Init                                                             |
//+------------------------------------------------------------------+
int OnInit()
  {
   if(InpCustomSymbol == _Symbol)
     {
      Say("FATAL: target equals chart symbol. Attach to the live feed chart.");
      return INIT_PARAMETERS_INCORRECT;
     }

   //--- the time base must be measured, never guessed
   if(InpFeedOffsetMinutes == -9999)
     {
      Say("FATAL: InpFeedOffsetMinutes is unconfigured. Run SRJ_TickAudit and copy the "
          "reported offset in here. Writing without it displaces every live tick.");
      return INIT_PARAMETERS_INCORRECT;
     }
   if(MathAbs(InpFeedOffsetMinutes) > 900)
     {
      Say(StringFormat("FATAL: InpFeedOffsetMinutes = %d is out of range (+/- 900).",
                       InpFeedOffsetMinutes));
      return INIT_PARAMETERS_INCORRECT;
     }

   g_offMin   = InpFeedOffsetMinutes;
   g_offSec   = (long)InpFeedOffsetMinutes * 60;
   g_offKnown = true;

   if(!SymbolSelect(InpCustomSymbol, true))
     {
      Say(StringFormat("FATAL: cannot select '%s'. Create it in Symbols (Ctrl+U) first.",
                       InpCustomSymbol));
      return INIT_FAILED;
     }
   if(!(bool)SymbolInfoInteger(InpCustomSymbol, SYMBOL_CUSTOM))
     {
      Say(StringFormat("FATAL: '%s' is not a custom symbol, its tick base is not writable.",
                       InpCustomSymbol));
      return INIT_FAILED;
     }

   int ds = (int)SymbolInfoInteger(_Symbol, SYMBOL_DIGITS);
   int dd = (int)SymbolInfoInteger(InpCustomSymbol, SYMBOL_DIGITS);
   if(ds != dd)
      Say(StringFormat("WARNING: digits mismatch %s=%d vs %s=%d. Align them or prices "
                       "will be distorted.", _Symbol, ds, InpCustomSymbol, dd));

   g_pushed = 0; g_spliced = 0; g_wouldSplice = 0;
   g_needImport = 0; g_protected = 0; g_phantom = 0; g_lastHoles = 0;
   g_lastHeal = 0; g_forceDry = false; g_pumpBlocked = false;
   g_wasConnected = (bool)TerminalInfoInteger(TERMINAL_CONNECTED);

   //--- cross-check the configured offset against the PC clock
   int gmtMin = (int)MathRound(((long)TimeCurrent() - (long)TimeGMT()) / 900.0) * 15;
   if(gmtMin != g_offMin)
      Say(StringFormat("WARNING: configured offset %+d min but TimeCurrent-TimeGMT is %+d min. "
                       "If the archive is UTC these should match. Check the PC clock.",
                       g_offMin, gmtMin));

   SeedCursor();
   CheckArchiveSanity();
   EventSetTimer(1);

   Say(StringFormat("v3.30 online [%s]: %s -> %s | offset %+d min | archive now %s",
                    (DryMode() ? "DRY RUN" : "LIVE WRITES"),
                    _Symbol, InpCustomSymbol, g_offMin,
                    TimeToString(ArchiveNow(), TIME_DATE | TIME_MINUTES | TIME_SECONDS)));
   Say(StringFormat("healer: window %d h | splice cap %d min | floor %s | rates rebuild %s",
                    InpHealHours, InpMaxHoleMinutes,
                    (InpArchiveFloor > 0 ? TimeToString(InpArchiveFloor, TIME_DATE | TIME_MINUTES)
                                         : "window start"),
                    (InpRebuildRates ? "on" : "off")));
   ShowStatus();
   return INIT_SUCCEEDED;
  }

//+------------------------------------------------------------------+
void OnDeinit(const int reason)
  {
   ReleaseLock();
   EventKillTimer();
   Comment("");
   Say(StringFormat("stopped (%d): %I64d streamed, %I64d spliced", reason, g_pushed, g_spliced));
  }

//+------------------------------------------------------------------+
void OnTick()
  {
   PumpLive();
  }

//+------------------------------------------------------------------+
//| Timer: pump backstop, DST tracking, reconnect heal, seam heal     |
//+------------------------------------------------------------------+
void OnTimer()
  {
   static int sanityTick = 0;

   RefreshOffset();
   PumpLive();   // backstop for thin markets and starved OnTick

   //--- re-check the frame every 60 s, cheap and catches contamination early
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
     }

   if(g_pumpBlocked)
     { ShowStatus(); return; }   // never heal a base that is in the wrong frame

   bool due = (g_lastHeal == 0)
              || reconnected
              || (InpHealEverySeconds > 0 && (TimeCurrent() - g_lastHeal) >= InpHealEverySeconds);

   if(due && AcquireLock())
     {
      HealSeam(reconnected ? "RECONNECT HEAL" : "SEAM HEAL");
      g_lastHeal = TimeCurrent();
      ReleaseLock();
     }

   ShowStatus();
  }
//+------------------------------------------------------------------+