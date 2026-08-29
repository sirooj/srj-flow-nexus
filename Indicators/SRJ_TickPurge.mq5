//+------------------------------------------------------------------+
//|                                              SRJ_TickPurge.mq5   |
//|   Deletes ticks and rates in an archive-frame range. DESTRUCTIVE. |
//+------------------------------------------------------------------+
#property copyright "SRJ"
#property version   "1.00"
#property script_show_inputs

input string   InpCustomSymbol = "EURUSD_RAW";          // custom symbol to purge
input datetime InpFromUTC      = D'2026.07.01 00:00';   // inclusive, ARCHIVE frame
input datetime InpToUTC        = D'2026.08.01 00:00';   // exclusive, ARCHIVE frame
input bool     InpDryRun       = true;                  // TRUE = report only
input string   InpConfirm      = "";                    // type PURGE to allow writes
input bool     InpPurgeRates   = true;                  // also drop the rates base

void OnStart()
  {
   if(!SymbolSelect(InpCustomSymbol, true))
     { Print("PURGE: cannot select ", InpCustomSymbol); return; }

   if(!(bool)SymbolInfoInteger(InpCustomSymbol, SYMBOL_CUSTOM))
     { Print("PURGE: ", InpCustomSymbol, " is not a custom symbol. Aborting."); return; }

   if(InpToUTC <= InpFromUTC)
     { Print("PURGE: empty range. Aborting."); return; }

   long fromMsc = (long)InpFromUTC * 1000;
   long toMsc   = (long)InpToUTC   * 1000 - 1;

   MqlTick t[];
   ResetLastError();
   int have = CopyTicksRange(InpCustomSymbol, t, COPY_TICKS_ALL,
                            (ulong)fromMsc, (ulong)toMsc);
   int bars = Bars(InpCustomSymbol, PERIOD_M1, InpFromUTC, InpToUTC);

   PrintFormat("PURGE target %s : %s -> %s (archive frame)",
               InpCustomSymbol,
               TimeToString(InpFromUTC, TIME_DATE|TIME_MINUTES),
               TimeToString(InpToUTC,   TIME_DATE|TIME_MINUTES));
   PrintFormat("PURGE currently holds %d tick(s) and %d M1 bar(s) in that range.", have, bars);

   if(InpDryRun || InpConfirm != "PURGE")
     {
      Print("PURGE: DRY RUN - nothing deleted.");
      Print("PURGE: to execute, set InpDryRun=false and InpConfirm=PURGE.");
      Print("PURGE: detach SRJ_TickPumper_EA from every chart first.");
      return;
     }

   ResetLastError();
   int delT = CustomTicksDelete(InpCustomSymbol, fromMsc, toMsc);
   if(delT < 0)
      PrintFormat("PURGE: CustomTicksDelete failed, err %d", GetLastError());
   else
      PrintFormat("PURGE: deleted %d tick(s).", delT);

   if(InpPurgeRates)
     {
      ResetLastError();
      int delR = CustomRatesDelete(InpCustomSymbol, InpFromUTC, InpToUTC);
      if(delR < 0)
         PrintFormat("PURGE: CustomRatesDelete failed, err %d", GetLastError());
      else
         PrintFormat("PURGE: deleted %d M1 bar(s).", delR);
     }

   MqlTick after[];
   int left = CopyTicksRange(InpCustomSymbol, after, COPY_TICKS_ALL,
                            (ulong)fromMsc, (ulong)toMsc);
   PrintFormat("PURGE: range now reads %d tick(s), %d M1 bar(s). Re-import from Tickstory next.",
               left, Bars(InpCustomSymbol, PERIOD_M1, InpFromUTC, InpToUTC));
  }
//+------------------------------------------------------------------+