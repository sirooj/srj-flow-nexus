//+------------------------------------------------------------------+
//|                                           SRJ_RatesRebuild.mq5   |
//|  Deletes the custom symbol's BAR base in a range so MT5 rebuilds  |
//|  it from the existing ticks. Never touches ticks.                 |
//+------------------------------------------------------------------+
#property copyright "SRJ"
#property version   "1.00"
#property script_show_inputs

input string   InpCustomSymbol = "EURUSD_RAW";        // custom symbol
input datetime InpFromUTC      = D'2026.07.27 00:00'; // inclusive, ARCHIVE frame
input datetime InpToUTC        = D'2026.07.30 00:00'; // exclusive, ARCHIVE frame
input bool     InpDryRun       = true;                // TRUE = report only
input string   InpConfirm      = "";                  // type REBUILD to allow

//+------------------------------------------------------------------+
void OnStart()
  {
   if(!SymbolSelect(InpCustomSymbol, true))
     { Print("REBUILD: cannot select ", InpCustomSymbol); return; }

   if(!(bool)SymbolInfoInteger(InpCustomSymbol, SYMBOL_CUSTOM))
     { Print("REBUILD: ", InpCustomSymbol, " is not a custom symbol. Aborting."); return; }

   if(InpToUTC <= InpFromUTC)
     { Print("REBUILD: empty range. Aborting."); return; }

   long fromMsc = (long)InpFromUTC * 1000;
   long toMsc   = (long)InpToUTC   * 1000 - 1;

   //--- day by day so you can see exactly what is wrong where
   PrintFormat("REBUILD target %s : %s -> %s (archive frame)",
               InpCustomSymbol,
               TimeToString(InpFromUTC, TIME_DATE|TIME_MINUTES),
               TimeToString(InpToUTC,   TIME_DATE|TIME_MINUTES));
   Print("date       | ticks | M1 bars | state");

   bool anyTickless = false;

   for(datetime d = InpFromUTC; d < InpToUTC; d += 86400)
     {
      datetime d2 = d + 86400;
      MqlTick t[];
      int tk = CopyTicksRange(InpCustomSymbol, t, COPY_TICKS_ALL,
                              (ulong)((long)d * 1000), (ulong)((long)d2 * 1000 - 1));
      int br = Bars(InpCustomSymbol, PERIOD_M1, d, d2);

      string state = "ok";
      if(tk <= 0 && br <= 0) state = "empty (nothing to rebuild)";
      else if(tk <= 0)       { state = "NO TICKS - rebuild would blank this day"; anyTickless = true; }
      else if(br <= 0)       state = "ticks only - needs rebuild";
      else if(br < 1300)     state = "partial bars - needs rebuild";

      PrintFormat("%s | %7d | %7d | %s", TimeToString(d, TIME_DATE), tk, br, state);
     }

   if(anyTickless)
      Print("REBUILD WARNING: at least one day has bars but no ticks. Deleting its bars "
            "removes the only price record you have for that day. Narrow the range.");

   if(InpDryRun || InpConfirm != "REBUILD")
     {
      Print("REBUILD: DRY RUN - nothing deleted.");
      Print("REBUILD: to execute, set InpDryRun=false and InpConfirm=REBUILD.");
      return;
     }

   ResetLastError();
   int del = CustomRatesDelete(InpCustomSymbol, InpFromUTC, InpToUTC);
   if(del < 0)
     {
      PrintFormat("REBUILD: CustomRatesDelete failed, err %d", GetLastError());
      return;
     }
   PrintFormat("REBUILD: deleted %d bar record(s).", del);

   //--- repoint every chart of this symbol so the series is regenerated
   long id = ChartFirst();
   int  repointed = 0;
   while(id >= 0)
     {
      if(ChartSymbol(id) == InpCustomSymbol)
        {
         ChartSetSymbolPeriod(id, InpCustomSymbol, (ENUM_TIMEFRAMES)ChartPeriod(id));
         repointed++;
        }
      id = ChartNext(id);
     }
   PrintFormat("REBUILD: repointed %d chart(s).", repointed);

   Sleep(3000);   // give MT5 a moment to regenerate from ticks

   Print("---- after ----");
   Print("date       | ticks | M1 bars");
   for(datetime d = InpFromUTC; d < InpToUTC; d += 86400)
     {
      datetime d2 = d + 86400;
      MqlTick t[];
      int tk = CopyTicksRange(InpCustomSymbol, t, COPY_TICKS_ALL,
                              (ulong)((long)d * 1000), (ulong)((long)d2 * 1000 - 1));
      PrintFormat("%s | %7d | %7d", TimeToString(d, TIME_DATE), tk,
                  Bars(InpCustomSymbol, PERIOD_M1, d, d2));
     }
   Print("REBUILD: if bars are still 0, close the chart, then reopen it from Market Watch.");
  }
//+------------------------------------------------------------------+