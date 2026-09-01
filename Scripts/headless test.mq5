void OnStart()
{
   int handle = iCustom(_Symbol, PERIOD_CURRENT, "SRJ_CQD_TickBased_MT5");
   if(handle == INVALID_HANDLE) { Print("iCustom failed"); return; }
   
   Print("Waiting for CQD to calculate history...");
   while(BarsCalculated(handle) <= 0)
   {
      Sleep(500);
   }
   Sleep(1000); // Give it one extra second to finalize buffers
   
   double buf[];
   ArraySetAsSeries(buf, true);
   int copied = CopyBuffer(handle, 0, 0, 5, buf); // Test buffer 0 (CQD Open)
   Print("CopyBuffer result: ", copied, " values: ", 
         (copied > 0 ? DoubleToString(buf[0], 0) : "none"));
   IndicatorRelease(handle);
}