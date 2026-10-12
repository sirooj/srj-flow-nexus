# BUILDER SLICE B-185 - raw spots, full diagnostic diff, table samples

Base: builder/B-185 cut at e55b4de (backup exact). One EA edit (3 hunks [B185F]/[B185E]/[B185P] once each), one compile (Dukascopy MetaEditor64: 0 errors, 0 warnings, 7.5s codegen, b185_compile.log), three runs, always restored (EA 67021D84/ex5 7601D51A/terminal.ini/charts verified). Edited EA dd2ff513 + ex5 bed710c6; .B185D kept uncommitted. Brace delta +5/+5 = K2(1)+helpers(4); file balanced 1225/1225.

## K2 [B185F] spot: freshness site (CheckFreshness :2769-2779 returns ABORT_FRESH_* when t88_n>=2 && twoOfThreeKills; call :8075 `CheckFreshness(barShift, g_state != ST_S5_GATE_CHECK)`; S4 branches :8095-8102). Lift skips iff g_confirmFromState != ST_IDLE (per-candidate live-confirm latch, cleared on ResetSequence :7049) + B185RX FRESHPOST; pre-confirm byte-identical.
## K3 [B185E] spot: expiry :8920-8925 (`(barTime - g_anchorBarTime) >= 3600 && g_anchorLine >= 0` -> UJHOLDEXPIRE print + GoAbort). Lift prints RX EXPIRY + neuters both lines (commented, restored after); other kills untouched.
## K4 [B185P] spots: helper before GoAbort (live recompute shift-1 + N1 save/restore + zone/div/TP/SL/R + UNLATCHED tpName) + DnOpen tickets loop; calls at GoAbort pre-ResetSequence (:7089-7092 mirror), LogSignal FIRE path (:11441-11443), MtLifeEmit top (:12462). Lean lines.
## O3 exit path: EA :12857-12874 (priority SL>TP>BREAK>HTF>DAY; vTP -> MT_EXIT_TP_TOUCH at tpRef :12863) + EXITVERDICT :12844-12855 + MtNearestTpTarget :12343; EXITCENSUS per-line verdicts :12768-12782.
## O4 code: yearly anchor Jan-1 (TickCore :383-384); adoption triple-match (POI_Marker :2306-2307); Q/Y truncated without seed (:2161-2168); seed prints :2048-2086/:2118/:2232-2239; CKPT_SLOT_META :861-862.

## Full diagnostic diff (.preB185 vs .B185D, 142 lines)
--- 
+++ 
@@ -1840,6 +1840,9 @@
 
 //--- B182P prototype (definition with the marker sits before GoAbort).
 void B182DecPrint(const string outcome);
+//--- B185P prototypes (definitions with the marker sit before GoAbort; print-only).
+void B185DnPrint(const string outcome);
+void B185DnOpen();
 void LogAbort(const string reason, ENUM_SRJ_STATE atState)
   {
    PrintFormat("[SRJ-EA] %s ABORT reason=%s state=%s poi=%s dir=%s",
@@ -7075,6 +7078,70 @@
                DirName(g_dir), AnchorStr(), outcome, RegimeName(g_regime),
                (g_divLatch ? 1 : 0), b182v, b182kind, b182dbar);
   }
+//--- [B185P] print-only diagnostic lines (relay B-185; reads held state + recomputed live gate on shift 1 with N1 save/restore, no gate touched).
+void B185DnPrint(const string outcome)
+  {
+   if(!InpDebugLog) return;
+   string b185bar = TimeToString(TimeCurrent(), TIME_DATE|TIME_MINUTES);
+   string b185anc = ((g_anchorLine >= 0 && g_anchorLine < POI_NLINES) ? g_lineCode[g_anchorLine] : "-");
+   string b185poi = AnchorStr();
+   string b185poiBar = ((g_anchorBarTime > 0) ? TimeToString(g_anchorBarTime, TIME_DATE|TIME_MINUTES) : "-");
+   int b185rs = ((g_b61RetestTime > 0) ? iBarShift(_Symbol, PERIOD_CURRENT, g_b61RetestTime, true) : -1);
+   int b185sVW = g_n1_vwapSurv, b185sVI = g_n1_vwapInv, b185sPS = g_n1_pocSurv, b185sPI = g_n1_pocInv;
+   string b185term = "";
+   bool b185live = false;
+   if(g_anchorLine >= 0 && g_dir != DIR_NONE)
+      b185live = IsConfirmationCandle(1, g_anchorLine, g_dir, b185term, false, b185rs);
+   g_n1_vwapSurv = b185sVW; g_n1_vwapInv = b185sVI; g_n1_pocSurv = b185sPS; g_n1_pocInv = b185sPI;
+   if(b185term == "") b185term = "PASS";
+   double b185h1 = iHigh(_Symbol, PERIOD_CURRENT, 1), b185l1 = iLow(_Symbol, PERIOD_CURRENT, 1);
+   int b185zw = ((g_zoneHi > 0.0 && b185h1 >= g_zoneLo && b185l1 <= g_zoneHi) ? 1 : 0);
+   double b185pr = 0.0; string b185zf = "unset";
+   if(ReadFlow(FL_BUF_XOB_PROMO_TIME, b185pr, 1) && b185pr > 0.0 && b185pr != EMPTY_VALUE)
+      b185zf = TimeToString((datetime)b185pr, TIME_DATE|TIME_MINUTES);
+   int b185dv = 0, b185ds = -1, b185max = Bars(_Symbol, PERIOD_CURRENT) - 1;
+   for(int s = 1; s <= b185max; s++)
+     {
+      double w = 0.0;
+      if(!ReadBuf1(g_hCqd, CQD_BUF_DIVVERDICT, w, s)) continue;
+      if(w == EMPTY_VALUE) continue;
+      int v = (int)MathRound(w);
+      if(v == 0) continue;
+      b185dv = v; b185ds = s; break;
+     }
+   string b185dk = ((b185dv == 0) ? "NOT_HELD" : ((MathAbs(b185dv) == 1) ? "regular" : "hidden"));
+   string b185db = ((b185ds < 0) ? "NOT_HELD" : TimeToString(iTime(_Symbol, PERIOD_CURRENT, b185ds), TIME_DATE|TIME_MINUTES));
+   string b185tp = ((g_latchedTp > 0.0) ? DoubleToString(g_latchedTp, _Digits) : "none");
+   string b185sl = ((g_latchedSl > 0.0) ? DoubleToString(g_latchedSl, _Digits) : "none");
+   string b185rr = ((g_latchedR > 0.0) ? DoubleToString(g_latchedR, 2) : "none");
+   PrintFormat("[SRJ-EA] B185DN bar=%s anc=%s dir=%s poi=%s poiBar=%s live=%d fail=%s zone=%d zfirst=%s div=%s dbar=%s tpName=UNLATCHED tp=%s sl=%s R=%s out=%s",
+               b185bar, b185anc, DirName(g_dir), b185poi, b185poiBar, (int)b185live, b185term, b185zw, b185zf, b185dk, b185db, b185tp, b185sl, b185rr, outcome);
+  }
+//--- B185P open-position line (print-only; per-bar managed-trade hook reads tickets only).
+void B185DnOpen()
+  {
+   if(!InpDebugLog) return;
+   for(int i = PositionsTotal() - 1; i >= 0; i--)
+     {
+      ulong tk = PositionGetTicket(i);
+      if(tk == 0 || !PositionSelectByTicket(tk)) continue;
+      if(PositionGetString(POSITION_SYMBOL) != _Symbol) continue;
+      double tp = PositionGetDouble(POSITION_TP);
+      double sl = PositionGetDouble(POSITION_SL);
+      double wv = 0.0;
+      bool wvok = ReadBuf1(g_hPoi, POI_BUF_W_VWAP, wv, 1);
+      double h1 = iHigh(_Symbol, PERIOD_CURRENT, 1), l1 = iLow(_Symbol, PERIOD_CURRENT, 1);
+      long ptyp = PositionGetInteger(POSITION_TYPE);
+      int tpT = ((tp > 0.0 && l1 <= tp && tp <= h1) ? 1 : 0);
+      int wvT = ((wvok && wv > 0.0 && wv != EMPTY_VALUE && l1 <= wv && wv <= h1) ? 1 : 0);
+      PrintFormat("[SRJ-EA] B185DN open tk=%I64u ptyp=%d tp=%s sl=%s wv=%s tpT=%d wvT=%d",
+                  tk, (int)ptyp,
+                  ((tp > 0.0) ? DoubleToString(tp, _Digits) : "none"),
+                  ((sl > 0.0) ? DoubleToString(sl, _Digits) : "none"),
+                  ((wvok && wv > 0.0 && wv != EMPTY_VALUE) ? DoubleToString(wv, _Digits) : "none"),
+                  tpT, wvT);
+     }
+  }
 void GoAbort(const string reason, ENUM_SRJ_STATE atState)
   {
    LogAbort(reason, atState);
@@ -7090,6 +7157,9 @@
        B182DecPrint("ABORT " + reason + " A6REFUSED " + reason);
     else
        B182DecPrint("ABORT " + reason);
+    // B185P-call (print-only after-confirmation checks; runs before ResetSequence clears state).
+    if(g_dir != DIR_NONE)
+       B185DnPrint("ABORT " + reason);
    //--- TASK 19c: count NO_REGIME aborts so the census can be read against
    //--- them directly. Measurement only.
    if(InpDebugLog && reason == ABORT_NO_REGIME) g_ea19_noRegimeAborts++;
@@ -8091,6 +8161,15 @@
                            DirName(g_dir), "DAY");
             g_freshVetoBar = 0; g_freshVetoAnchor = -1; g_freshVetoDir = -1;
            }
+        }
+      //--- [B185F] diagnostic lift: freshness 2-of-3 kill skipped ONLY when this candidate's LIVE gate already passed confirmation (spec 3.4); before live confirmation unchanged (L57).
+      if((fail == ABORT_FRESH_OPP_FVG || fail == ABORT_FRESH_OB_DEAD) && g_confirmFromState != ST_IDLE)
+        {
+         if(InpDebugLog)
+            PrintFormat("[SRJ-EA] B185RX term=FRESHPOST bar=%s dir=%s poi=%s fail=%s fromState=%s - lifted block skipped after live confirmation",
+                        TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES),
+                        DirName(g_dir), AnchorStr(), fail, StateName(g_confirmFromState));
+         fail = "";
         }
       if(fail == ABORT_FRESH_OPP_FVG)
         {
@@ -8921,8 +9000,12 @@
      {
       if((barTime - g_anchorBarTime) >= 3600 && g_anchorLine >= 0)
         {
-         if(InpDebugLog) PrintFormat("[SRJ-EA] UJHOLDEXPIRE bar=%s poi=%s dir=%s heldMin=%d - unconfirmed holder expired, no eviction (Fix H2)", TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES), AnchorStr(), DirName(g_dir), (int)((barTime - g_anchorBarTime) / 60));
-         GoAbort(ABORT_HOLDER_EXPIRED, g_state); return;
+         //--- [B185E] diagnostic lift: 60-minute holder expiry skipped (NO PIN per spec 0, spec 6 "no bar count, no time window", SEED-CARRY L81); holders still die by every other kill.
+         if(InpDebugLog) PrintFormat("[SRJ-EA] B185RX term=EXPIRY bar=%s poi=%s dir=%s heldMin=%d - lifted block skipped",
+                        TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES), AnchorStr(), DirName(g_dir), (int)((barTime - g_anchorBarTime) / 60));
+         //--- B185E neutered for the diagnostic run (restored after): the UJHOLDEXPIRE print + GoAbort below do not run.
+         //--- if(InpDebugLog) PrintFormat("[SRJ-EA] UJHOLDEXPIRE bar=%s poi=%s dir=%s heldMin=%d - unconfirmed holder expired, no eviction (Fix H2)", TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES), AnchorStr(), DirName(g_dir), (int)((barTime - g_anchorBarTime) / 60));
+         //--- GoAbort(ABORT_HOLDER_EXPIRED, g_state); return;
         }
       ENUM_SRJ_REGIME regime;
       if(!ClassifyRegime(barShift, g_dir, regime))
@@ -11370,6 +11453,9 @@
        }
         LogSignal(tpTarget, tpR, slRef, slMode, divKind);
         if(InpDebugLog) A6Fired(barShift, tpTarget, tpR, slRef, slMode, divKind);   //--- [A6-HOOK] (ii)
+        // B185P-call (print-only after-confirmation checks on the firing pass).
+        if(InpDebugLog && g_dir != DIR_NONE)
+           B185DnPrint("FIRE");
         if(InpDebugLog) PrintFormat("[SRJ-EA] SIDE1F_WATCH bar=%s dir=%s", TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES), DirName(g_dir));   //--- [SIDE1F] (iii) fire watch (read-only)
 
       if(!g_alertedSignal)
@@ -12461,6 +12547,7 @@
 //--- Unevaluable (unfilled/uninit) prints -1.
 void MtLifeEmit()
    {
+    B185DnOpen();  // B185P-call (print-only open-position line; tickets only, no state touched).
     string mtlOpen = (g_mtrade.fillBarTime > 0) ? TimeToString(g_mtrade.fillBarTime, TIME_DATE|TIME_MINUTES) : "-";
     string mtlClose = (g_mtrade.exitBarTime > 0) ? TimeToString(g_mtrade.exitBarTime, TIME_DATE|TIME_MINUTES) : "-";
     int mtlNews = -1, mtlDay = -1, mtlWeek = -1;

## Table samples
- T1 filed trades: GBP 2/2 (7/07 14:45 sell 1.33863 + 16:54 buy 1.33747); EU 14/14 (#2-#15 all match); June 8/8 (#2-#9 all match). Zero moved deals.
- Lifts rode: B185RX EXPIRY x111 (GBP 22 + EU 14 + June 75), FRESHPOST x4 (EU 9/03 18:40-18:55 Daily-POC LONG fromState=S3, no deals). B185DN 88 = B182DEC 88 on GBP (funnel parity).
- F3 7/10: B185DN 15:55 live=0 fail=C_TOUCH (shift-1); kill 15:55 S4 armed (pinned); zero FRESHPOST on 7/10; zero B60C rows (live never confirmed).
- F2 7/07: B185DN 14:45 live=1 fail=PASS zone=1; 26 EXITCENSUS W-VWAP rows val 1.33630->1.33648 all ok/trigger=0; MTEXIT 16:50 TP_TOUCH 1.33747.
- O4 day-log: GBP seed REFUSED SEAM_UNREACHABLE (8874443-8874447; same on B185D 9813388-9813392); June same; EU ACCEPTED (6853390-6853394). 60 YEARLY hits all RETESTDIAG distances.
- G3: FRESHPOST DOES NOT SEPARATE (adds nothing) + EXPIRY DOES NOT SEPARATE (holders live on; downstream DIV/reg-NONE/no-zone refuse). SEPARATOR_B185.csv 51 rows.
- G4 B-186 target: CONFIRM_STRUCT_FAIL cut (name the live term) + Yearly POC seed fix (reachable seam); 7 July exit trial separate if needed.
(End of slice)
