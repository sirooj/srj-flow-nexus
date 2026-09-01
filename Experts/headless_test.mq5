int handle = INVALID_HANDLE;

int OnInit()
{
   // Load CQD with default inputs
   handle = iCustom(_Symbol, PERIOD_CURRENT, "SRJ_CQD_TickBased_MT5", PERIOD_D1, false, true, 12, 1);
   if(handle == INVALID_HANDLE) 
   { 
      Print("iCustom failed! Error: ", GetLastError()); 
      return INIT_FAILED; 
   }
   EventSetTimer(2); // Check every 2 seconds
   Print("EA Started. Waiting for CQD to calculate...");
   return INIT_SUCCEEDED;
}

void OnTimer()
{
   int bc = BarsCalculated(handle);
   if(bc > 0)
   {
      double buf[];
      ArraySetAsSeries(buf, true);
      int copied = CopyBuffer(handle, 6, 0, 5, buf); // Test buffer 6 (Verdict)
      Print("HEADLESS TEST PASS! BarsCalc=", bc, " Copied=", copied, " val=", buf[0]);
      EventKillTimer();
      ExpertRemove();
   }
   else
   {
      Print("Waiting... BarsCalc=", bc);
   }
}