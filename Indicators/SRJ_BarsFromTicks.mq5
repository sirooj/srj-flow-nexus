//+------------------------------------------------------------------+
//|                                          SRJ_BarsFromTicks.mq5   |
//|  Builds M1 bars from the custom symbol's own tick base and writes |
//|  them with CustomRatesUpdate. Never deletes ticks or bars.        |
//+------------------------------------------------------------------+
#property copyright "SRJ"
#property version   "1.00"
#property script_show_inputs

input string   InpCustomSymbol  = "EURUSD_RAW";        // custom symbol
input datetime InpFromUTC       = D'2026.07.27 00:00'; // inclusive, ARCHIVE frame
input datetime InpToUTC         = D'2026.07.31 00:00'; // exclusive, ARCHIVE frame
input bool     InpDryRun        = true;                // TRUE = report only
input int      InpRetries       = 40;                  // sync retries per day
input int      InpEmptyConfirms = 10;                  // spaced confirmations before believing "empty"
input int      InpSleepMs       = 250;                 // sleep between retries
input bool     InpRepointCharts = true;                // repoint charts when finished

//+------------------------------------------------------------------+
//| Retry-hardened tick read.                                        |
//| >0 count, 0 only after InpEmptyConfirms spaced confirmations,    |
//| -1 if the request never resolved.                                |
//+------------------------------------------------------------------+
int ReadTicks(const string sym, MqlTick &out[], const long fromMsc, const long toMsc)
  {
   int zeroStreak = 0;

   for(int a = 0; a <= InpRetries; a++)
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

      Sleep(InpSleepMs);
     }
   return -1;
  }

//+------------------------------------------------------------------+
//| Aggregate a sorted tick array into M1 bars.                      |
//+------------------------------------------------------------------+
int BuildM1(const MqlTick &t[], const int n, MqlRates &out[], const double point)
  {
   ArrayResize(out, 0);
   if(n <= 0)
      return 0;

   ArrayResize(out, 1440 + 16);
   int    k          = 0;
   long   curMin     = -1;
   double spreadSum  = 0.0;
   int    spreadCnt  = 0;

   for(int i = 0; i < n; i++)
     {
      //--- price to use: bid for FX, fall back to last
      double px = (t[i].bid > 0.0) ? t[i].bid : t[i].last;
      if(px <= 0.0)
         continue;

      long m = (long)t[i].time_msc / 60000;   // minute bucket

      if(m != curMin)
        {
         //--- close out the previous bar's spread average
         if(k > 0)
            out[k - 1].spread = (spreadCnt > 0 && point > 0.0)
                                ? (int)MathRound(spreadSum / spreadCnt / point) : 0;

         if(k >= ArraySize(out))
            ArrayResize(out, k + 512);

         curMin    = m;
         spreadSum = 0.0;
         spreadCnt = 0;

         out[k].time        = (datetime)(m * 60);
         out[k].open        = px;
         out[k].high        = px;
         out[k].low         = px;
         out[k].close       = px;
         out[k].tick_volume = 0;
         out[k].real_volume = 0;
         out[k].spread      = 0;
         k++;
        }

      int b = k - 1;
      if(px > out[b].high) out[b].high = px;
      if(px < out[b].low)  out[b].low  = px;
      out[b].close = px;
      out[b].tick_volume++;
      out[b].real_volume += (long)t[i].volume_real;

      if(t[i].ask > 0.0 && t[i].bid > 0.0)
        { spreadSum += (t[i].ask - t[i].bid); spreadCnt++; }
     }

   if(k > 0)
      out[k - 1].spread = (spreadCnt > 0 && point > 0.0)
                          ? (int)MathRound(spreadSum / spreadCnt / point) : 0;

   ArrayResize(out, k);
   return k;
  }

//+------------------------------------------------------------------+
void OnStart()
  {
   if(!SymbolSelect(InpCustomSymbol, true))
     { Print("BARS: cannot select ", InpCustomSymbol); return; }

   if(!(bool)SymbolInfoInteger(InpCustomSymbol, SYMBOL_CUSTOM))
     { Print("BARS: ", InpCustomSymbol, " is not a custom symbol. Aborting."); return; }

   if(InpToUTC <= InpFromUTC)
     { Print("BARS: empty range. Aborting."); return; }

   double point = SymbolInfoDouble(InpCustomSymbol, SYMBOL_POINT);

   PrintFormat("BARS %s : %s -> %s (archive frame) | mode %s",
               InpCustomSymbol,
               TimeToString(InpFromUTC, TIME_DATE|TIME_MINUTES),
               TimeToString(InpToUTC,   TIME_DATE|TIME_MINUTES),
               (InpDryRun ? "DRY RUN" : "WRITE"));
   Print("date       |   ticks | bars before | bars built | bars after | result");

   int wroteDays = 0, skipDays = 0, failDays = 0;

   for(datetime d = InpFromUTC; d < InpToUTC; d += 86400)
     {
      datetime d2 = d + 86400;
      long fromMsc = (long)d  * 1000;
      long toMsc   = (long)d2 * 1000 - 1;

      int before = Bars(InpCustomSymbol, PERIOD_M1, d, d2);

      MqlTick t[];
      int n = ReadTicks(InpCustomSymbol, t, fromMsc, toMsc);

      if(n < 0)
        {
         PrintFormat("%s | %7s | %11d | %10s | %10s | UNRESOLVED - tick base not synced, rerun",
                     TimeToString(d, TIME_DATE), "?", before, "-", "-");
         failDays++;
         continue;
        }

      if(n == 0)
        {
         PrintFormat("%s | %7d | %11d | %10s | %10s | NO TICKS - needs splice or .bi5 import",
                     TimeToString(d, TIME_DATE), 0, before, "-", "-");
         skipDays++;
         continue;
        }

      MqlRates r[];
      int built = BuildM1(t, n, r, point);

      if(built <= 0)
        {
         PrintFormat("%s | %7d | %11d | %10d | %10s | no usable prices in ticks",
                     TimeToString(d, TIME_DATE), n, before, 0, "-");
         skipDays++;
         continue;
        }

      if(InpDryRun)
        {
         PrintFormat("%s | %7d | %11d | %10d | %10s | DRY RUN - would write",
                     TimeToString(d, TIME_DATE), n, before, built, "-");
         continue;
        }

      ResetLastError();
      int rc = CustomRatesUpdate(InpCustomSymbol, r);
      if(rc < 0)
        {
         PrintFormat("%s | %7d | %11d | %10d | %10s | ERROR CustomRatesUpdate err %d",
                     TimeToString(d, TIME_DATE), n, before, built, "-", GetLastError());
         failDays++;
         continue;
        }

      int after = Bars(InpCustomSymbol, PERIOD_M1, d, d2);
      PrintFormat("%s | %7d | %11d | %10d | %10d | %s",
                  TimeToString(d, TIME_DATE), n, before, built, after,
                  (after >= built * 90 / 100 ? "ok" : "written but count low"));
      wroteDays++;
     }

   if(!InpDryRun && InpRepointCharts)
     {
      long id = ChartFirst();
      int  rp = 0;
      while(id >= 0)
        {
         if(ChartSymbol(id) == InpCustomSymbol)
           {
            ChartSetSymbolPeriod(id, InpCustomSymbol, (ENUM_TIMEFRAMES)ChartPeriod(id));
            rp++;
           }
         id = ChartNext(id);
        }
      PrintFormat("BARS: repointed %d chart(s).", rp);
     }

   PrintFormat("BARS summary: %d day(s) written | %d skipped | %d failed",
               wroteDays, skipDays, failDays);
   if(failDays > 0)
      Print("BARS: rerun for the UNRESOLVED days once the terminal has finished loading them.");
  }
//+------------------------------------------------------------------+