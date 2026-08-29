//+------------------------------------------------------------------+
//|                                             SRJ_TickBridge.mq5   |
//|  Fills an explicit archive-frame range in the custom symbol from  |
//|  the broker feed, then builds M1 bars from what was written.      |
//+------------------------------------------------------------------+
#property copyright "SRJ"
#property version   "1.00"
#property script_show_inputs

input string   InpCustomSymbol     = "EURUSD_RAW";        // custom symbol to write into
input string   InpSourceSymbol     = "EURUSD";            // broker source symbol
input int      InpFeedOffsetMinutes= 180;                 // server feed minus archive, minutes
input datetime InpFromUTC          = D'2026.07.27 00:00'; // inclusive, ARCHIVE frame
input datetime InpToUTC            = D'2026.07.28 00:00'; // exclusive, ARCHIVE frame
input bool     InpDryRun           = true;                // TRUE = report only
input bool     InpOverwrite        = false;               // TRUE = write even if ticks already present
input bool     InpBuildBars        = true;                // build M1 bars after writing
input int      InpRetries          = 60;                  // sync retries per read
input int      InpEmptyConfirms    = 12;                  // confirmations before believing "empty"
input int      InpSleepMs          = 300;                 // sleep between retries

long g_offSec = 0;

//+------------------------------------------------------------------+
int ReadTicks(const string sym, MqlTick &out[], const long fromMsc, const long toMsc)
  {
   int zeroStreak = 0;
   for(int a = 0; a <= InpRetries; a++)
     {
      ResetLastError();
      int n = CopyTicksRange(sym, out, COPY_TICKS_ALL, (ulong)fromMsc, (ulong)toMsc);
      int e = GetLastError();
      if(n > 0) return n;
      if(n == 0 && e == 0) { if(++zeroStreak >= InpEmptyConfirms) return 0; }
      else                 zeroStreak = 0;
      Sleep(InpSleepMs);
     }
   return -1;
  }

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
//| Aggregate a sorted tick array into M1 bars.                      |
//+------------------------------------------------------------------+
int BuildM1(const MqlTick &t[], const int n, MqlRates &out[], const double point)
  {
   ArrayResize(out, 0);
   if(n <= 0) return 0;

   ArrayResize(out, 2048);
   int    k = 0;
   long   curMin = -1;
   double spreadSum = 0.0;
   int    spreadCnt = 0;

   for(int i = 0; i < n; i++)
     {
      double px = (t[i].bid > 0.0) ? t[i].bid : t[i].last;
      if(px <= 0.0) continue;

      long m = (long)t[i].time_msc / 60000;

      if(m != curMin)
        {
         if(k > 0)
            out[k-1].spread = (spreadCnt > 0 && point > 0.0)
                              ? (int)MathRound(spreadSum / spreadCnt / point) : 0;
         if(k >= ArraySize(out)) ArrayResize(out, k + 1024);

         curMin = m; spreadSum = 0.0; spreadCnt = 0;
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
      if(t[i].ask > 0.0 && t[i].bid > 0.0) { spreadSum += (t[i].ask - t[i].bid); spreadCnt++; }
     }

   if(k > 0)
      out[k-1].spread = (spreadCnt > 0 && point > 0.0)
                        ? (int)MathRound(spreadSum / spreadCnt / point) : 0;
   ArrayResize(out, k);
   return k;
  }

//+------------------------------------------------------------------+
//| Bridge one archive-frame day.                                    |
//+------------------------------------------------------------------+
void BridgeDay(const datetime d, const double point,
               int &okDays, int &skipDays, int &failDays)
  {
   datetime d2      = d + 86400;
   long     fromArc = (long)d  * 1000;
   long     toArc   = (long)d2 * 1000 - 1;
   string   ds      = TimeToString(d, TIME_DATE);

   //--- what is already there?
   MqlTick loc[];
   int have = ReadTicks(InpCustomSymbol, loc, fromArc, toArc);

   if(have < 0)
     {
      PrintFormat("%s | UNRESOLVED : local tick base did not resolve, rerun for this day", ds);
      failDays++;
      return;
     }
   if(have > 0 && !InpOverwrite)
     {
      PrintFormat("%s | SKIP : %d tick(s) already present. Set InpOverwrite=true to replace.",
                  ds, have);
      skipDays++;
      return;
     }

   //--- pull the source, server frame
   MqlTick src[];
   int n = ReadTicks(InpSourceSymbol, src,
                     fromArc + g_offSec * 1000, toArc + g_offSec * 1000);

   if(n < 0)
     {
      PrintFormat("%s | UNRESOLVED : %s tick history did not resolve, rerun",
                  ds, InpSourceSymbol);
      failDays++;
      return;
     }
   if(n == 0)
     {
      PrintFormat("%s | NO SOURCE : %s serves no tick history here. Only a .bi5 import fixes this.",
                  ds, InpSourceSymbol);
      skipDays++;
      return;
     }

   ShiftToArchive(src, n);

   //--- trim to the day after shifting, so nothing lands outside
   int lo = 0, hi = n;
   while(lo < n  && (long)src[lo].time_msc   <  fromArc) lo++;
   while(hi > lo && (long)src[hi-1].time_msc >  toArc)   hi--;
   int cnt = hi - lo;

   if(cnt <= 0)
     {
      PrintFormat("%s | NO SOURCE : nothing falls inside the day after the %+d min shift",
                  ds, (int)(g_offSec / 60));
      skipDays++;
      return;
     }

   if(InpDryRun)
     {
      PrintFormat("%s | DRY RUN : would write %d tick(s) (%s -> %s)",
                  ds, cnt,
                  TimeToString((datetime)(src[lo].time_msc/1000),   TIME_MINUTES|TIME_SECONDS),
                  TimeToString((datetime)(src[hi-1].time_msc/1000), TIME_MINUTES|TIME_SECONDS));
      return;
     }

   MqlTick slice[];
   ArrayResize(slice, cnt);
   for(int i = 0; i < cnt; i++) slice[i] = src[lo + i];

   ResetLastError();
   int rep = CustomTicksReplace(InpCustomSymbol, fromArc, toArc, slice);
   if(rep < 0)
     {
      PrintFormat("%s | ERROR : CustomTicksReplace failed, err %d", ds, GetLastError());
      failDays++;
      return;
     }

   //--- verify
   MqlTick after[];
   int nAfter = ReadTicks(InpCustomSymbol, after, fromArc, toArc);

   int barsWritten = 0;
   if(InpBuildBars && nAfter > 0)
     {
      MqlRates r[];
      int built = BuildM1(after, nAfter, r, point);
      if(built > 0)
        {
         ResetLastError();
         if(CustomRatesUpdate(InpCustomSymbol, r) < 0)
            PrintFormat("%s | WARNING : CustomRatesUpdate failed, err %d", ds, GetLastError());
         else
            barsWritten = built;
        }
     }

   PrintFormat("%s | WROTE %d tick(s), range now reads %d, bars written %d, bars now %d",
               ds, cnt, nAfter, barsWritten,
               Bars(InpCustomSymbol, PERIOD_M1, d, d2));
   okDays++;
  }

//+------------------------------------------------------------------+
void OnStart()
  {
   if(InpCustomSymbol == InpSourceSymbol)
     { Print("BRIDGE: source and target are the same symbol. Aborting."); return; }
   if(!SymbolSelect(InpCustomSymbol, true) || !SymbolSelect(InpSourceSymbol, true))
     { Print("BRIDGE: cannot select symbols. Aborting."); return; }
   if(!(bool)SymbolInfoInteger(InpCustomSymbol, SYMBOL_CUSTOM))
     { Print("BRIDGE: ", InpCustomSymbol, " is not a custom symbol. Aborting."); return; }
   if(InpToUTC <= InpFromUTC)
     { Print("BRIDGE: empty range. Aborting."); return; }
   if(MathAbs(InpFeedOffsetMinutes) > 900)
     { Print("BRIDGE: offset out of range. Aborting."); return; }

   g_offSec = (long)InpFeedOffsetMinutes * 60;
   double point = SymbolInfoDouble(InpCustomSymbol, SYMBOL_POINT);

   PrintFormat("BRIDGE %s <- %s | %s -> %s (archive frame) | offset %+d min | mode %s",
               InpCustomSymbol, InpSourceSymbol,
               TimeToString(InpFromUTC, TIME_DATE|TIME_MINUTES),
               TimeToString(InpToUTC,   TIME_DATE|TIME_MINUTES),
               InpFeedOffsetMinutes,
               (InpDryRun ? "DRY RUN" : "WRITE"));

   int okDays = 0, skipDays = 0, failDays = 0;
   for(datetime d = InpFromUTC; d < InpToUTC; d += 86400)
      BridgeDay(d, point, okDays, skipDays, failDays);

   if(!InpDryRun)
     {
      long id = ChartFirst();
      int  rp = 0;
      while(id >= 0)
        {
         if(ChartSymbol(id) == InpCustomSymbol)
           { ChartSetSymbolPeriod(id, InpCustomSymbol, (ENUM_TIMEFRAMES)ChartPeriod(id)); rp++; }
         id = ChartNext(id);
        }
      PrintFormat("BRIDGE: repointed %d chart(s).", rp);
     }

   PrintFormat("BRIDGE summary: %d day(s) written | %d skipped | %d failed",
               okDays, skipDays, failDays);
   Print("BRIDGE note: these ticks come from the broker demo feed, so volume is demo scale, "
         "not .bi5 ECN lot scale.");
  }
//+------------------------------------------------------------------+