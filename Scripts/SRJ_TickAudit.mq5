//+------------------------------------------------------------------+
//|                                                SRJ_TickAudit.mq5 |
//|  v1.01 - READ-ONLY archive audit. Reports, per day, how many      |
//|  ticks and how many M1 bars each custom symbol holds, where the   |
//|  holes are, and which ranges need re-importing versus merely      |
//|  rebuilding. Contains no write calls of any kind.                 |
//+------------------------------------------------------------------+
#property copyright "SRJ"
#property version   "1.01"
#property script_show_inputs
#property description "Read-only per-day tick/bar census for custom symbols. Writes two CSV reports to MQL5/Files and a summary to the Experts log. Never modifies data."

//+------------------------------------------------------------------+
//| INPUTS                                                           |
//+------------------------------------------------------------------+
input string   InpSymbols        = "EURUSD_RAW,GBPUSD_RAW,USDJPY_RAW,XAUUSD_RAW"; // Symbols, comma separated
input datetime InpFrom           = D'2026.01.01 00:00';  // Audit from (archive frame)
input datetime InpTo             = 0;                    // Audit to (0 = now)
input int      InpGapAlertMin    = 60;                   // Report intraday gaps of at least this many minutes
input int      InpFullDayMinutes = 600;                  // Fewer populated minutes than this = PARTIAL day
input int      InpHealBackHours  = 6;                    // Only to show the write floor v6 would compute
input bool     InpCheckSource    = true;                 // Also count broker M1 bars (informational only)
input bool     InpWriteCsv       = true;                 // Write CSV reports to MQL5/Files
input bool     InpLogEveryDay    = false;                // Log every day, not just problem days

//+------------------------------------------------------------------+
//| Constants                                                        |
//+------------------------------------------------------------------+
#define READ_RETRIES   8
#define RETRY_SLEEP_MS 200
#define MAX_GAPS       4000
#define DAY_SEC        86400

//+------------------------------------------------------------------+
//| Per-day census record                                            |
//+------------------------------------------------------------------+
struct DayStat
  {
   long   day;          // day start, archive frame seconds
   int    dow;          // 0=Sun .. 6=Sat, archive frame
   long   ticks;        // tick count
   int    minutes;      // distinct minutes that hold at least one tick
   int    bars;         // M1 bars present in the custom symbol
   bool   barsUnread;   // CopyRates never resolved for this day
   int    srcBars;      // M1 bars the broker serves (informational, -1 = not checked)
   long   firstMsc;
   long   lastMsc;
   long   maxGapSec;
   long   maxGapAtMsc;  // last tick before the largest gap
   string verdict;
  };

//+------------------------------------------------------------------+
//| Recorded intraday gap                                            |
//+------------------------------------------------------------------+
struct GapRec
  {
   string sym;
   long   fromMsc;
   long   toMsc;
   long   secs;
  };

GapRec g_gaps[];
int    g_gapCnt = 0;

//--- time base, resolved once for display and weekend classification
int  g_srvMin = 0;

//+------------------------------------------------------------------+
//| Helpers                                                          |
//+------------------------------------------------------------------+
void Say(const string m) { Print("[Audit] ", m); }

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

string DOW(const int d)
  {
   switch(d)
     {
      case 0: return "Sun";
      case 1: return "Mon";
      case 2: return "Tue";
      case 3: return "Wed";
      case 4: return "Thu";
      case 5: return "Fri";
      case 6: return "Sat";
     }
   return "?";
  }

string HMS(const long secs)
  {
   long h = secs / 3600;
   long m = (secs % 3600) / 60;
   if(h > 0) return StringFormat("%dh%02dm", (int)h, (int)m);
   return StringFormat("%dm", (int)m);
  }

int DowOf(const long sec)
  {
   MqlDateTime st;
   TimeToStruct((datetime)sec, st);
   return st.day_of_week;
  }

//--- archive frame follows the server clock on this setup
datetime ArchiveNow() { return (datetime)((long)TimeGMT() + (long)g_srvMin * 60); }

string BarsStr(const DayStat &d)
  {
   if(d.barsUnread) return "?";
   return IntegerToString(d.bars);
  }

string SrcStr(const DayStat &d)
  {
   if(d.srcBars < 0) return "?";
   return IntegerToString(d.srcBars);
  }

//+------------------------------------------------------------------+
//| Does the interval touch a Saturday or Sunday? In a UTC+3 frame    |
//| the trading week is Mon 00:00 to Fri 23:59, so weekend gaps are   |
//| expected and must not be reported as holes.                      |
//+------------------------------------------------------------------+
bool SpansWeekend(const long fromSec, const long toSec)
  {
   long a = (fromSec / DAY_SEC) * DAY_SEC;
   for(long d = a; d <= toSec; d += DAY_SEC)
     {
      int w = DowOf(d);
      if(w == 0 || w == 6)
        {
         //--- the weekend day must actually overlap the interval
         if(d + DAY_SEC > fromSec && d < toSec) return true;
        }
     }
   return false;
  }

//+------------------------------------------------------------------+
//| Retry-hardened reads. Both are read-only.                        |
//+------------------------------------------------------------------+
int ReadTicks(const string sym, MqlTick &out[], const long fromMsc, const long toMsc)
  {
   for(int a = 0; a <= READ_RETRIES; a++)
     {
      ResetLastError();
      int n = CopyTicksRange(sym, out, COPY_TICKS_ALL, (ulong)fromMsc, (ulong)toMsc);
      if(n >= 0) return n;
      Sleep(RETRY_SLEEP_MS);
     }
   return -1;
  }

int ReadBars(const string sym, const long fromSec, const long toSec)
  {
   MqlRates r[];
   for(int a = 0; a <= READ_RETRIES; a++)
     {
      ResetLastError();
      int n = CopyRates(sym, PERIOD_M1, (datetime)fromSec, (datetime)toSec, r);
      if(n >= 0) return n;
      Sleep(RETRY_SLEEP_MS);
     }
   return -1;
  }

//+------------------------------------------------------------------+
//| Record one intraday gap                                          |
//+------------------------------------------------------------------+
void PushGap(const string sym, const long fromMsc, const long toMsc)
  {
   if(g_gapCnt >= MAX_GAPS) return;
   if(ArrayResize(g_gaps, g_gapCnt + 1, 512) <= g_gapCnt) return;
   g_gaps[g_gapCnt].sym     = sym;
   g_gaps[g_gapCnt].fromMsc = fromMsc;
   g_gaps[g_gapCnt].toMsc   = toMsc;
   g_gaps[g_gapCnt].secs    = (toMsc - fromMsc) / 1000;
   g_gapCnt++;
  }

//+------------------------------------------------------------------+
//| Classify one day                                                 |
//+------------------------------------------------------------------+
string Verdict(const DayStat &d, const long alertSec)
  {
   string v;

   if(d.dow == 0 || d.dow == 6)
      return (d.ticks > 0) ? "WEEKEND_TICKS" : "CLOSED";

   if(d.barsUnread && d.ticks == 0) return "UNREAD_BARS";

   if(d.ticks == 0 && d.bars == 0)  return "EMPTY";
   if(d.ticks == 0 && d.bars >  0)  return "ORPHAN_BARS";

   if(d.barsUnread)                       v = "UNREAD_BARS";
   else if(d.bars == 0)                   v = "NO_BARS";
   else if(d.bars < d.minutes)            v = "BARS_SHORT";
   else if(d.bars > d.minutes)            v = "EXTRA_BARS";
   else if(d.minutes < InpFullDayMinutes) v = "PARTIAL";
   else                                   v = "OK";

   if(d.maxGapSec >= alertSec && v != "OK") return v + "/GAP";
   if(d.maxGapSec >= alertSec)              return "GAP";
   return v;
  }

//+------------------------------------------------------------------+
//| Audit one symbol. Returns the number of days examined.           |
//+------------------------------------------------------------------+
int AuditSymbol(const string sym, const long fromSec, const long toSec,
                DayStat &out[], string &summary)
  {
   summary = "";

   if(!SymbolSelect(sym, true))
     {
      Say(StringFormat("%s: cannot select, skipped", sym));
      return 0;
     }

   bool isCustom = (bool)SymbolInfoInteger(sym, SYMBOL_CUSTOM);

   //--- informational source symbol, derived by stripping _RAW
   string src = "";
   if(InpCheckSource)
     {
      int p = StringFind(sym, "_RAW");
      if(p > 0)
        {
         src = StringSubstr(sym, 0, p);
         if(!SymbolSelect(src, true)) src = "";
        }
     }

   long alertSec = (long)InpGapAlertMin * 60;
   long firstDay = (fromSec / DAY_SEC) * DAY_SEC;
   long lastDay  = (toSec   / DAY_SEC) * DAY_SEC;

   int nDays = (int)((lastDay - firstDay) / DAY_SEC) + 1;
   if(nDays <= 0) return 0;
   ArrayResize(out, nDays);

   long prevMsc = 0;      // carried across days for gap detection
   int  idx     = 0;
   int  unread  = 0;

   for(long day = firstDay; day <= lastDay; day += DAY_SEC)
     {
      if(IsStopped()) { Say("aborted by user"); break; }

      long dayEnd = day + DAY_SEC - 1;

      DayStat d;
      d.day        = day;
      d.dow        = DowOf(day);
      d.ticks      = 0;
      d.minutes    = 0;
      d.bars       = 0;
      d.barsUnread = false;
      d.srcBars    = -1;
      d.firstMsc   = 0;
      d.lastMsc    = 0;
      d.maxGapSec  = 0;
      d.maxGapAtMsc= 0;
      d.verdict    = "";

      long lastMinute = -1;

      //--- hour by hour keeps peak memory small on heavy days
      for(int h = 0; h < 24; h++)
        {
         long hFrom = day + (long)h * 3600;
         long hTo   = hFrom + 3599;

         MqlTick t[];
         int n = ReadTicks(sym, t, hFrom * 1000, hTo * 1000 + 999);
         if(n < 0) { unread++; continue; }
         if(n == 0) continue;

         d.ticks += n;
         if(d.firstMsc == 0) d.firstMsc = (long)t[0].time_msc;
         d.lastMsc = (long)t[n - 1].time_msc;

         for(int i = 0; i < n; i++)
           {
            long m = (long)t[i].time_msc;

            long minute = m / 60000;
            if(minute != lastMinute) { d.minutes++; lastMinute = minute; }

            if(prevMsc > 0)
              {
               long gap = (m - prevMsc) / 1000;
               if(gap >= alertSec && !SpansWeekend(prevMsc / 1000, m / 1000))
                 {
                  if(gap > d.maxGapSec) { d.maxGapSec = gap; d.maxGapAtMsc = prevMsc; }
                  PushGap(sym, prevMsc, m);
                 }
              }
            prevMsc = m;
           }
        }

      int nb = ReadBars(sym, day, dayEnd);
      if(nb < 0) { d.barsUnread = true; d.bars = 0; }
      else         d.bars = nb;

      if(src != "")
        {
         int sb = ReadBars(src, day, dayEnd);
         d.srcBars = (sb >= 0) ? sb : -1;
        }

      d.verdict = Verdict(d, alertSec);
      out[idx++] = d;

      if((idx % 25) == 0)
         Comment(StringFormat("Audit %s : %d / %d days", sym, idx, nDays));
     }

   ArrayResize(out, idx);
   Comment("");

   //--- roll up
   int cOK = 0, cEmpty = 0, cNoBars = 0, cShort = 0, cExtra = 0,
       cOrphan = 0, cPartial = 0, cGap = 0, cWknd = 0, cClosed = 0, cUnread = 0;
   long totTicks = 0, totBars = 0;

   for(int i = 0; i < idx; i++)
     {
      totTicks += out[i].ticks;
      totBars  += out[i].bars;
      string v = out[i].verdict;

      if(v == "CLOSED")             cClosed++;
      else if(v == "WEEKEND_TICKS") cWknd++;
      else if(v == "EMPTY")         cEmpty++;
      else if(v == "ORPHAN_BARS")   cOrphan++;
      else if(v == "OK")            cOK++;
      else
        {
         if(StringFind(v, "UNREAD_BARS") >= 0) cUnread++;
         if(StringFind(v, "NO_BARS")     >= 0) cNoBars++;
         if(StringFind(v, "BARS_SHORT")  >= 0) cShort++;
         if(StringFind(v, "EXTRA_BARS")  >= 0) cExtra++;
         if(StringFind(v, "PARTIAL")     >= 0) cPartial++;
         if(StringFind(v, "GAP")         >= 0) cGap++;
        }
     }

   //--- newest stored tick, and the write floor v6 would derive from it
   MqlTick tail[];
   long newest = 0;
   int nt = CopyTicks(sym, tail, COPY_TICKS_ALL, 0, 32);
   if(nt > 0) newest = (long)tail[nt - 1].time_msc;

   long floorSec = (newest > 0) ? (newest / 1000) - (long)InpHealBackHours * 3600 : 0;
   long aheadSec = (newest > 0) ? (newest / 1000) - (long)ArchiveNow() : 0;

   //--- built line by line: one format specifier set per call, so an
   //--- argument-count slip can never take the whole block down
   string s = sym;
   if(!isCustom) s += "  [WARNING: not a custom symbol]";
   s += "\n";

   s += StringFormat("  days examined   : %d\n", ArraySize(out));
   s += StringFormat("  weekend / closed: %d day(s)\n", cClosed + cWknd);
   s += StringFormat("  ticks / M1 bars : %I64d / %I64d\n", totTicks, totBars);
   s += StringFormat("  OK              : %d\n", cOK);
   s += StringFormat("  EMPTY           : %d   <-- needs re-import\n", cEmpty);
   s += StringFormat("  NO_BARS         : %d   <-- ticks present, bars missing: rebuildable\n", cNoBars);
   s += StringFormat("  BARS_SHORT      : %d   <-- rebuildable\n", cShort);
   s += StringFormat("  EXTRA_BARS      : %d   <-- bars with no ticks behind them\n", cExtra);
   s += StringFormat("  ORPHAN_BARS     : %d   <-- bars but zero ticks all day\n", cOrphan);
   s += StringFormat("  PARTIAL         : %d   <-- thin day, under %d populated minutes\n",
                     cPartial, InpFullDayMinutes);
   s += StringFormat("  intraday GAP    : %d day(s) with a gap >= %d min\n", cGap, InpGapAlertMin);
   s += StringFormat("  WEEKEND_TICKS   : %d   <-- ticks stamped into a closed market\n", cWknd);
   s += StringFormat("  UNREAD_BARS     : %d   <-- bar read never resolved, inconclusive\n", cUnread);
   s += StringFormat("  newest tick     : %s", TS(newest));
   if(aheadSec > 120)
      s += StringFormat("   [%I64d min AHEAD of archive now]", aheadSec / 60);
   s += "\n";
   s += StringFormat("  v6 write floor  : %s  (newest minus %dh)\n",
                     (floorSec > 0 ? TS(floorSec * 1000) : "-"), InpHealBackHours);
   s += StringFormat("  unreadable hours: %d", unread);

   summary = s;
   return ArraySize(out);
  }

//+------------------------------------------------------------------+
//| Merge consecutive days sharing a verdict class into ranges, so    |
//| you get concrete re-import windows instead of a list of dates.    |
//+------------------------------------------------------------------+
void ReportRuns(const string sym, const DayStat &d[], const string match, const string label)
  {
   int n = ArraySize(d);
   long runFrom = 0, runTo = 0;
   bool inRun = false;
   int  runs = 0;

   for(int i = 0; i <= n; i++)
     {
      bool hit = false;
      if(i < n)
        {
         if(match == "EMPTY") hit = (d[i].verdict == "EMPTY");
         else                 hit = (StringFind(d[i].verdict, match) >= 0);
        }

      if(hit)
        {
         if(!inRun) { runFrom = d[i].day; inRun = true; }
         runTo = d[i].day;
        }
      else if(inRun)
        {
         int days = (int)((runTo - runFrom) / DAY_SEC) + 1;
         Say(StringFormat("  %s %s : %s -> %s  (%d day%s)",
                          sym, label, DS(runFrom), DS(runTo), days, (days > 1 ? "s" : "")));
         inRun = false;
         runs++;
        }
     }

   if(runs == 0)
      Say(StringFormat("  %s %s : none", sym, label));
  }

//+------------------------------------------------------------------+
//| CSV writers                                                      |
//+------------------------------------------------------------------+
int OpenCsv(const string name)
  {
   ResetLastError();
   int h = FileOpen(name, FILE_WRITE | FILE_CSV | FILE_ANSI, ',');
   if(h == INVALID_HANDLE)
      Say(StringFormat("could not create %s (err %d) - report will be log-only",
                       name, GetLastError()));
   return h;
  }

void WriteDayRows(const int h, const string sym, const DayStat &d[])
  {
   if(h == INVALID_HANDLE) return;
   for(int i = 0; i < ArraySize(d); i++)
     {
      FileWrite(h,
                sym,
                DS(d[i].day),
                DOW(d[i].dow),
                IntegerToString(d[i].ticks),
                IntegerToString(d[i].minutes),
                BarsStr(d[i]),
                SrcStr(d[i]),
                TS(d[i].firstMsc),
                TS(d[i].lastMsc),
                (d[i].maxGapSec > 0 ? HMS(d[i].maxGapSec) : ""),
                d[i].verdict);
     }
  }

//+------------------------------------------------------------------+
//| Entry point                                                      |
//+------------------------------------------------------------------+
void OnStart()
  {
   //--- time base, for display and weekend classification only
   long raw = (long)TimeTradeServer() - (long)TimeGMT();
   g_srvMin = (int)MathRound(raw / 900.0) * 15;

   long toSec   = (InpTo > 0) ? (long)InpTo : (long)ArchiveNow();
   long fromSec = (long)InpFrom;

   if(toSec <= fromSec)
     {
      Say("FATAL: InpTo must be later than InpFrom.");
      return;
     }

   Say("=====================================================");
   Say("READ-ONLY audit. Nothing will be written to any symbol.");
   Say(StringFormat("server UTC%s | archive now %s | range %s -> %s",
                    HM(g_srvMin),
                    TimeToString(ArchiveNow(), TIME_DATE | TIME_MINUTES),
                    DS(fromSec), DS(toSec)));
   Say("=====================================================");

   //--- CSV setup
   string stamp = TimeToString(TimeLocal(), TIME_DATE);
   StringReplace(stamp, ".", "");
   string fDays = StringFormat("SRJ_TickAudit_%s_days.csv", stamp);
   string fGaps = StringFormat("SRJ_TickAudit_%s_gaps.csv", stamp);

   int hDays = INVALID_HANDLE, hGaps = INVALID_HANDLE;
   if(InpWriteCsv)
     {
      hDays = OpenCsv(fDays);
      if(hDays != INVALID_HANDLE)
         FileWrite(hDays, "symbol", "date", "dow", "ticks", "minutes", "bars",
                   "src_m1_info", "first_tick", "last_tick", "max_gap", "verdict");
     }

   //--- split the symbol list
   string parts[];
   int nSym = StringSplit(InpSymbols, (ushort)',', parts);

   for(int s = 0; s < nSym; s++)
     {
      string sym = parts[s];
      StringTrimLeft(sym);
      StringTrimRight(sym);
      if(sym == "") continue;
      if(IsStopped()) break;

      DayStat days[];
      string summary = "";

      uint t0 = GetTickCount();
      int n = AuditSymbol(sym, fromSec, toSec, days, summary);
      uint ms = GetTickCount() - t0;

      if(n <= 0) continue;

      Say("");
      Say(summary);
      Say(StringFormat("  scan took %.1f s", ms / 1000.0));

      Say("  ranges to RE-IMPORT (no ticks at all):");
      ReportRuns(sym, days, "EMPTY", "re-import");

      Say("  ranges that only need M1 REBUILD (ticks are intact):");
      ReportRuns(sym, days, "NO_BARS", "rebuild");
      ReportRuns(sym, days, "BARS_SHORT", "rebuild");

      Say("  ticks in a closed market (old wrong-frame residue):");
      ReportRuns(sym, days, "WEEKEND_TICKS", "weekend");

      for(int i = 0; i < n; i++)
        {
         string v = days[i].verdict;
         if(!InpLogEveryDay && (v == "OK" || v == "CLOSED")) continue;

         Say(StringFormat("    %s %s  ticks %I64d  min %d  bars %s  src %s  %s",
                          DS(days[i].day), DOW(days[i].dow),
                          days[i].ticks, days[i].minutes,
                          BarsStr(days[i]), SrcStr(days[i]), v));
        }

      WriteDayRows(hDays, sym, days);
     }

   //--- gap report
   if(g_gapCnt > 0)
     {
      Say("");
      Say(StringFormat("%d intraday gap(s) of %d min or more, weekends excluded:",
                       g_gapCnt, InpGapAlertMin));

      int show = (g_gapCnt < 40) ? g_gapCnt : 40;
      for(int i = 0; i < show; i++)
         Say(StringFormat("    %s  %s -> %s  (%s)",
                          g_gaps[i].sym, TS(g_gaps[i].fromMsc), TS(g_gaps[i].toMsc),
                          HMS(g_gaps[i].secs)));
      if(g_gapCnt > show)
         Say(StringFormat("    ... %d more, see the gaps CSV", g_gapCnt - show));

      if(InpWriteCsv)
        {
         hGaps = OpenCsv(fGaps);
         if(hGaps != INVALID_HANDLE)
           {
            FileWrite(hGaps, "symbol", "gap_from", "gap_to", "duration");
            for(int i = 0; i < g_gapCnt; i++)
               FileWrite(hGaps,
                         g_gaps[i].sym,
                         TS(g_gaps[i].fromMsc),
                         TS(g_gaps[i].toMsc),
                         HMS(g_gaps[i].secs));
           }
        }

      if(g_gapCnt >= MAX_GAPS)
         Say(StringFormat("NOTE: gap list capped at %d entries, there may be more.", MAX_GAPS));
     }
   else
      Say(StringFormat("no intraday gaps of %d min or more found", InpGapAlertMin));

   if(hDays != INVALID_HANDLE) { FileClose(hDays); Say("wrote MQL5/Files/" + fDays); }
   if(hGaps != INVALID_HANDLE) { FileClose(hGaps); Say("wrote MQL5/Files/" + fGaps); }

   Say("=====================================================");
   Say("audit complete. No data was modified.");
   Say("=====================================================");
   Comment("");
  }
//+------------------------------------------------------------------+