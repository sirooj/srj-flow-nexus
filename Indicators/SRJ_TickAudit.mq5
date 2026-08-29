//+------------------------------------------------------------------+
//|                                              SRJ_TickAudit.mq5   |
//|  v1.20 - read-only coverage audit + feed/archive time-base probe |
//+------------------------------------------------------------------+
#property copyright "SRJ"
#property version   "1.20"
#property script_show_inputs

input string InpCustomSymbol   = "EURUSD_RAW"; // custom symbol to audit
input string InpSourceSymbol   = "EURUSD";     // broker source symbol
input int    InpDays           = 40;           // days back to audit

input bool   InpDetectOffset   = true;         // probe the feed/archive time offset
input int    InpKnownOffsetMin = -9999;        // skip the probe, use this (server minus archive, minutes)
input int    InpOffsetSpanMin  = 780;          // probe range +/- minutes (13 h)
input int    InpOffsetStepMin  = 15;           // probe step in minutes

input int    InpRetries        = 40;           // sync retries per tick read
input int    InpEmptyConfirms  = 10;           // spaced confirmations before believing "empty"
input int    InpSleepMs        = 250;          // sleep between retries

#define MS_DAY 86400000

long g_offSec   = 0;      // server time minus archive time, in seconds
bool g_offKnown = false;

//+------------------------------------------------------------------+
//| Retry-hardened tick count, fully instrumented.                   |
//| >0 count, 0 = confirmed empty, -1 = never resolved.              |
//+------------------------------------------------------------------+
int CountTicks(const string sym, const long fromMsc, const long toMsc,
               int &attempts, int &lastRc, int &lastErr, uint &elapsedMs)
  {
   MqlTick t[];
   int  zeroStreak = 0;
   uint t0 = GetTickCount();

   attempts = 0; lastRc = 0; lastErr = 0;

   for(int a = 0; a <= InpRetries; a++)
     {
      attempts++;
      ResetLastError();
      int n = CopyTicksRange(sym, t, COPY_TICKS_ALL, (ulong)fromMsc, (ulong)toMsc);
      int e = GetLastError();
      lastRc = n; lastErr = e;

      if(n > 0)
        { elapsedMs = GetTickCount() - t0; return n; }

      if(n == 0 && e == 0)
        {
         if(++zeroStreak >= InpEmptyConfirms)
           { elapsedMs = GetTickCount() - t0; return 0; }
        }
      else
         zeroStreak = 0;

      Sleep(InpSleepMs);
     }

   elapsedMs = GetTickCount() - t0;
   return -1;
  }

//+------------------------------------------------------------------+
//| First rates index with time >= t                                 |
//+------------------------------------------------------------------+
int RatesLB(const MqlRates &a[], const int n, const datetime t)
  {
   int lo = 0, hi = n;
   while(lo < hi)
     {
      int m = (lo + hi) >> 1;
      if(a[m].time < t) lo = m + 1; else hi = m;
     }
   return lo;
  }

//+------------------------------------------------------------------+
//| Time-base probe.                                                 |
//| Aligns one day of custom M1 closes against a wide source window   |
//| and finds the shift that minimises mean absolute price error.     |
//| Independent of the PC clock and of any session configuration.      |
//+------------------------------------------------------------------+
bool DetectOffset(int &bestOff, double &bestMae, int &bestMatched,
                  int &runnerOff, double &runnerMae, datetime &refDay)
  {
   long srvToday = ((long)TimeCurrent() / 86400) * 86400;

   for(int d = 1; d <= InpDays; d++)
     {
      datetime ds = (datetime)(srvToday - (long)d * 86400);

      MqlRates B[], A[];
      int nb = CopyRates(InpCustomSymbol, PERIOD_M1, ds, (datetime)((long)ds + 86400), B);
      if(nb < 800) continue;

      datetime a1 = (datetime)((long)ds - (long)InpOffsetSpanMin * 60);
      datetime a2 = (datetime)((long)ds + 86400 + (long)InpOffsetSpanMin * 60);
      int na = CopyRates(InpSourceSymbol, PERIOD_M1, a1, a2, A);
      if(na < 800) continue;

      bestMae = 1e18; runnerMae = 1e18;
      bestOff = 0;    runnerOff = 0;   bestMatched = 0;

      for(int off = -InpOffsetSpanMin; off <= InpOffsetSpanMin; off += InpOffsetStepMin)
        {
         double sum = 0.0;
         int    m   = 0;

         for(int i = 0; i < nb; i++)
           {
            datetime want = (datetime)((long)B[i].time + (long)off * 60);
            int k = RatesLB(A, na, want);
            if(k >= na || A[k].time != want) continue;
            sum += MathAbs(A[k].close - B[i].close);
            m++;
           }

         if(m < 400) continue;
         double mae = sum / m;

         if(mae < bestMae)
           {
            runnerMae = bestMae; runnerOff = bestOff;
            bestMae   = mae;     bestOff   = off;  bestMatched = m;
           }
         else if(mae < runnerMae)
           { runnerMae = mae; runnerOff = off; }
        }

      if(bestMatched >= 400)
        { refDay = ds; return true; }
     }
   return false;
  }

//+------------------------------------------------------------------+
void OnStart()
  {
   if(!SymbolSelect(InpCustomSymbol, true) || !SymbolSelect(InpSourceSymbol, true))
     { Print("AUDIT: cannot select symbols"); return; }

   PrintFormat("---- AUDIT %s vs %s ----", InpCustomSymbol, InpSourceSymbol);
   PrintFormat("server time %s | GMT %s | naive server-GMT offset %d min",
               TimeToString(TimeCurrent(), TIME_DATE|TIME_MINUTES),
               TimeToString(TimeGMT(),     TIME_DATE|TIME_MINUTES),
               (int)(((long)TimeCurrent() - (long)TimeGMT()) / 60));

   //--- time base
   if(InpKnownOffsetMin != -9999)
     {
      g_offSec   = (long)InpKnownOffsetMin * 60;
      g_offKnown = true;
      PrintFormat("time base: using supplied offset %d min (server minus archive)", InpKnownOffsetMin);
     }
   else if(InpDetectOffset)
     {
      int bo, bm, ro; double bmae, rmae; datetime ref;
      if(DetectOffset(bo, bmae, bm, ro, rmae, ref))
        {
         g_offSec   = (long)bo * 60;
         g_offKnown = true;
         PrintFormat("time base: offset = %+d min (%.2f h). reference day %s, %d matched bars, MAE %.6f",
                     bo, bo / 60.0, TimeToString(ref, TIME_DATE), bm, bmae);
         PrintFormat("time base: runner-up %+d min, MAE %.6f (a large margin here means the result is solid)",
                     ro, rmae);
         if(bo != 0)
            PrintFormat("time base: ACTION - set InpFeedOffsetMinutes = %d in the pumper EA.", bo);
        }
      else
         Print("time base: probe could not find a day with enough bars in both symbols. Offset assumed 0.");
     }

   PrintFormat("---- per-day coverage (windows frame-matched, offset %+d min) ----",
               (int)(g_offSec / 60));
   Print("server date | custom ticks | custom M1 | source M1 | verdict");

   long srvToday = ((long)TimeCurrent() / 86400) * 86400;

   int okDays = 0, shortDays = 0, emptyDays = 0, phantomDays = 0,
       barlessDays = 0, unresolvedDays = 0;

   for(int d = InpDays; d >= 0; d--)
     {
      long srvDs = srvToday - (long)d * 86400;
      long srvDe = srvDs + 86399;
      long arcDs = srvDs - g_offSec;
      long arcDe = srvDe - g_offSec;

      int srcBars = Bars(InpSourceSymbol, PERIOD_M1, (datetime)srvDs, (datetime)(srvDe + 1));
      int dstBars = Bars(InpCustomSymbol, PERIOD_M1, (datetime)arcDs, (datetime)(arcDe + 1));

      int att = 0, rc = 0, err = 0; uint ms = 0;
      int dstTk = CountTicks(InpCustomSymbol, arcDs * 1000, arcDe * 1000 + 999,
                             att, rc, err, ms);

      if(srcBars <= 0 && dstBars <= 0 && dstTk <= 0)
         continue;

      string verdict = "ok";
      bool   stub    = (srcBars <= 1);

      if(dstTk < 0)
        { verdict = StringFormat("UNRESOLVED (attempts %d, last rc %d, err %d, %u ms)",
                                 att, rc, err, ms);                          unresolvedDays++; }
      else if(stub)
        { verdict = "session stub";                                          okDays++; }
      else if(dstTk == 0 && dstBars == 0)
        { verdict = "EMPTY - needs .bi5 import";                             emptyDays++; }
      else if(dstTk == 0 && dstBars > 0)
        { verdict = "TICK BASE EMPTY, BARS ARE PHANTOM - needs .bi5 import"; phantomDays++; }
      else if(dstTk > 0 && dstBars == 0)
        { verdict = "TICKS PRESENT, BARS DELETED";                           barlessDays++; }
      else if(dstBars < srcBars * 90 / 100)
        { verdict = "SHORT bars";                                            shortDays++; }
      else
        { okDays++; }

      PrintFormat("%s | %12d | %9d | %9d | %s",
                  TimeToString((datetime)srvDs, TIME_DATE), dstTk, dstBars, srcBars, verdict);
     }

   Print("---- summary ----");
   PrintFormat("ok %d | short %d | phantom bars %d | bars deleted %d | empty %d | unresolved %d",
               okDays, shortDays, phantomDays, barlessDays, emptyDays, unresolvedDays);
   PrintFormat("time offset in force for this audit: %+d min", (int)(g_offSec / 60));
   Print("Any non-zero phantom / empty / short count is a .bi5 re-import job.");
   Print("---- audit complete ----");
  }
//+------------------------------------------------------------------+