# BUILDER SLICE B-191 - raw rows, spots, Part S table, both full diffs (under 600 lines)

Base: builder/B-191 cut at 1c2de24 (backup exact). B1 planner note banked. R reads offline. P: B190TK re-applied + B191LXP hunk (82b56b9c), one compile (0/0), three always-restored runs 14/14+8/8+2/2 SAME-as-trial. Table SEPARATES (filed before K2). K: B191LX hunk (d6327e4a), one compile (0/0). T: three trial runs. VERDICT NOT VERIFIED (own defect): recorded trial build .B191LX carries B190TK=0 (B190TakenBad=0) - the swept-target fix is byte-absent - while the trial-cut rows show the swept-excluded line booked (1.33630); build/run mapping unproven, every trial line below is VOID. Citable: kept-build print rows (B190TKP/B191LXP) and code spots.

## Part R spots (raw, real line numbers)
- MTEXIT writer :12868 (`PrintFormat("[SRJ-EA] MTEXIT bar=%s reason=%s line=%s lineVal=%s entry=%s exit=%s src=%s"`); exit books tpRef :12863 (`g_mtrade.exitPrice = g_mtrade.tpRef`).
- Touch test :12711-12724 (tpBookedTouch vs tpRef :12714-12715; tpRecomputeTouch vs live curTp :12720-12721, suppress-count only :12723, never sets vTP).
- EXITCENSUS writer :12769 (live POI values via ReadBuf1 :12735; side per bar 5.2; Q3 line 12728: a line's own gap/move alone never exits).
- R1 verdict: exit trigger compares the candle with the LATCHED booked value only; EXITCENSUS reads live values. (tpRef latched at admission :11466; curTp recomputed per bar :12658.)
- R2 key rows (B190P packs): F2 7/07 14:40 group - WIN YLOL 1.33747 (B188TPSRC 1581), live W-VWAP per candle 14:45 (1.33630) to 17:00 (1.33649), first live touch 17:00 (low 1.33625); A2 9/01 17:30 group - WIN Yearly-POC 1.16077, live static 1.16077 at 17:35/17:40, relocated (UNMATCHED) at 17:45 with 17:45 h/l 1.16018/1.15984; A5 9/07 16:45 group - WIN Yearly-VWAP 1.16315 static, first touch 17:10 (exit 17:13 stands); A7 9/08 17:00 group - WIN Yearly-POC 1.16114 static all 17:00-17:30, price never near (SL exit stands). Session-liquidity bookings (A1/A3/A4/A6/B2/B3/C-06-03) verified untaken candle by candle (first=NONE each).
- R3 candles 7/07 14:45-17:05 with o/h/l/c (job_r2_b191.py output; 17:05 candle printed, live missing - post-exit).
- R5 candle (B187 pack 94, jline 14508061): 09:10 o=1.33777 h=1.33779 l=1.33747 c=1.33769 (London 36/36 printed).

## Part S separator table (LIVE-LINE-TOUCH; B190P rows)
- F2 7/07 SHORT: kept YLOL 1.33747 R1.51 (taken 13:00). First live Weekly-VWAP touch 17:00 (low 1.33625 through live 1.33649) at its live value. Entry same 14:45. Moves 16:54/1.33747 -> 17:00-touch exit. SEPARATES.
- Fixed exits stay: A1 11:35 BREAK; A2 17:50 SL (Y-POC relocated into 17:45 candle per Q3/5.2 - relocation alone never exits); A3 day-close 23:55; A4 Asia-high session target (booked test unchanged); A5 17:13 TP (live static, same-candle touch); B2 19:16 retarget 160.298; B3 15:20 TP 160.588. Entries never move (R latched).
- Refusals stay refused (trial-valid subset of kept-valid). Predicted new deals: NONE.
- Verdict: SEPARATES. K2 ran on it.

## Part P full diff .preB191 vs .B191LXP (raw)
--- SRJ_FlowNexus_EA.mq5.preB191
+++ SRJ_FlowNexus_EA.mq5.B191LXP
@@ -2841,6 +2841,39 @@
    return false;
   }
 
+//--- [B190TK] taken-on-candles (B-190 trial; OR'd onto the kept verdict above, kept test untouched)
+bool B190TakenBad(const int b190_idx, const double b190_v, const ENUM_SRJ_DIR b190_dir, const int b190_shift)
+  {
+   datetime b190_barT = iTime(_Symbol, PERIOD_CURRENT, b190_shift);
+   if(b190_barT <= 0 || b190_v == EMPTY_VALUE || b190_v <= 0.0) return false;
+   if(b190_dir != DIR_LONG && b190_dir != DIR_SHORT) return false;
+   bool b190_hi = (b190_idx % 2 == 0);
+   if(b190_dir == DIR_LONG && !b190_hi) return false;
+   if(b190_dir == DIR_SHORT && b190_hi) return false;
+   datetime b190_day = StringToTime(TimeToString(b190_barT, TIME_DATE));
+   datetime b190_floor = (b190_day > 0 ? b190_day - 86400 : 0);
+   int b190_max = Bars(_Symbol, PERIOD_CURRENT);
+   int b190_set = -1;
+   for(int b190_s = b190_shift; b190_s < b190_max; b190_s++)
+     {
+      datetime b190_st = iTime(_Symbol, PERIOD_CURRENT, b190_s);
+      if(b190_st <= 0 || (b190_floor > 0 && b190_st < b190_floor)) break;
+      if(b190_hi && iHigh(_Symbol, PERIOD_CURRENT, b190_s) == b190_v) { b190_set = b190_s; break; }
+      if(!b190_hi && iLow(_Symbol, PERIOD_CURRENT, b190_s) == b190_v) { b190_set = b190_s; break; }
+     }
+   int b190_fsh = (b190_floor > 0 ? iBarShift(_Symbol, PERIOD_CURRENT, b190_floor, false) : -1);
+   int b190_from = (b190_set >= 0 ? b190_set - 1 : b190_fsh);
+   if(b190_from >= b190_max) b190_from = b190_max - 1;
+   for(int b190_c = b190_from; b190_c >= b190_shift; b190_c--)
+     {
+      double b190_ch = iHigh(_Symbol, PERIOD_CURRENT, b190_c);
+      double b190_cl = iLow(_Symbol, PERIOD_CURRENT, b190_c);
+      if(b190_hi && b190_ch > 0.0 && b190_ch > b190_v) return true;
+      if(!b190_hi && b190_cl > 0.0 && b190_cl < b190_v) return true;
+     }
+   return false;
+  }
+
 bool ComputeNearestTpTarget(int barShift, ENUM_SRJ_DIR dir,
                              double currentPrice, double &tpTargetOut)
   {
@@ -2942,7 +2975,7 @@
 for(int i = 0; i < ArraySize(sessbufs); i++)
   {
    double v;
-   if(ReadFlow(sessbufs[i], v, barShift) && !TpSessionLevelFiltered(i, s39_mask))
+   if(ReadFlow(sessbufs[i], v, barShift) && !TpSessionLevelFiltered(i, s39_mask) && !B190TakenBad(i, v, dir, barShift))
       TpTargetUpdateBest(v, dir, currentPrice, best, haveBest, sname[i], uj_dk, -1);
   }
 //--- [P-UJIMPL-IMPL-1 v8 IE5] third candidate loop: published history pool,
@@ -12410,7 +12443,7 @@
    for(int i = 0; i < ArraySize(sessbufs); i++)
      {
       double v;
-      if(ReadFlow(sessbufs[i], v, barShift) && !TpSessionLevelFiltered(i, s39_mask))
+      if(ReadFlow(sessbufs[i], v, barShift) && !TpSessionLevelFiltered(i, s39_mask) && !B190TakenBad(i, v, dir, barShift))
          TpTargetUpdateBest(v, dir, currentPrice, best, haveBest, uj_sname[i], uj_dk, -1);
      }
    //--- [P-UJIMPL-IMPL-1 v8 IE5b] managed-side pool loop (same cache + entry;
@@ -12722,6 +12755,52 @@
       }
     if(tpRecomputeTouch && !tpBookedTouch) g_n1_tpRecomputeSupp++;
     if(tpBookedTouch) vTP = true;
+    //--- print-only live-line census (relay B-191 Part P; reads only, no gate reads this)
+    if(InpDebugLog && g_mtrade.tpRef != EMPTY_VALUE && g_mtrade.tpRef > 0.0)
+      {
+       string b191_nm = "UNMATCHED"; double b191_live = EMPTY_VALUE;
+       const int b191_bufs[18] = { FL_BUF_PDAY_HIGH, FL_BUF_PDAY_LOW,
+                                   FL_BUF_ASIA_HIGH, FL_BUF_ASIA_LOW,
+                                   FL_BUF_LONDON_HIGH, FL_BUF_LONDON_LOW,
+                                   FL_BUF_NY_HIGH, FL_BUF_NY_LOW,
+                                   FL_BUF_PM_HIGH, FL_BUF_PM_LOW,
+                                   FL_BUF_PD_ASIA_HIGH, FL_BUF_PD_ASIA_LOW,
+                                   FL_BUF_PD_LONDON_HIGH, FL_BUF_PD_LONDON_LOW,
+                                   FL_BUF_PD_NY_HIGH, FL_BUF_PD_NY_LOW,
+                                   FL_BUF_PD_PM_HIGH, FL_BUF_PD_PM_LOW };
+       const string b191_names[18] = { "PDH", "PDL", "ASH", "ASL", "LOH", "LOL",
+                                       "NYH", "NYL", "PMH", "PML",
+                                       "YASH", "YASL", "YLOH", "YLOL",
+                                       "YNYH", "YNYL", "YPMH", "YPML" };
+       for(int b191_i = 0; b191_i < 18; b191_i++)
+         {
+          double b191_v;
+          if(!ReadFlow(b191_bufs[b191_i], b191_v, barShift)) continue;
+          if(b191_v == g_mtrade.tpRef) { b191_nm = b191_names[b191_i]; b191_live = b191_v; break; }
+         }
+       if(b191_nm == "UNMATCHED")
+         {
+          for(int b191_k = 0; b191_k < POI_NLINES; b191_k++)
+            {
+             double b191_pv;
+             if(!ReadBuf1(g_hPoi, b191_k, b191_pv, barShift)) continue;
+             if(b191_pv == g_mtrade.tpRef) { b191_nm = g_lineCode[b191_k]; b191_live = b191_pv; break; }
+            }
+         }
+       if(b191_nm == "UNMATCHED")
+         {
+          for(int b191_u = 0; b191_u < ArraySize(uj_pool); b191_u++)
+            {
+             if(uj_pool[b191_u].value == g_mtrade.tpRef) { b191_nm = uj_pool[b191_u].source; b191_live = uj_pool[b191_u].value; break; }
+            }
+         }
+       PrintFormat("[SRJ-EA] B191LXP bar=%s dir=%s name=%s booked=%s live=%s h=%s l=%s",
+                   TimeToString(barTime, TIME_DATE|TIME_MINUTES),
+                   (g_mtrade.dir == DIR_SHORT ? "S" : "L"), b191_nm,
+                   DoubleToString(g_mtrade.tpRef, _Digits),
+                   (b191_live == EMPTY_VALUE ? "-" : DoubleToString(b191_live, _Digits)),
+                   DoubleToString(h, _Digits), DoubleToString(l, _Digits));
+      }
 
    //--- (c) the body-close exit: PRICE's BODY close through a BEHIND trigger line
    //--- (body = open -> next open, the T161K convention; "it must be body" - Q5).

## Part K full diff .preB191 vs .B191LX (raw)
--- SRJ_FlowNexus_EA.mq5.preB191
+++ SRJ_FlowNexus_EA.mq5.B191LX
@@ -258,6 +258,7 @@
    double       entryPrice;        // the S5 next-open reference = the fill level
    double       slRef;             // the latched two-branch stop
    double       tpRef;             // the admission TP figure (provenance)
+   int          tpPoi;             // booked POI line index (-1 = session/pool)
    int          regimeAtAdmission; // ENUM_SRJ_REGIME as int (drives the 5.6 scope)
    datetime     fillBarTime;       // the fill candle's OPEN time (the next candle)
    datetime     signalBarTime;     // the confirming candle's open time
@@ -11464,6 +11465,9 @@
       g_mtrade.entryPrice        = currentPrice;
       g_mtrade.slRef             = slRef;
       g_mtrade.tpRef             = tpTarget;
+      g_mtrade.tpPoi             = -1;
+      for(int b191_li = 0; b191_li < POI_NLINES; b191_li++)
+        { if(g_lineCode[b191_li] == uj_winnerSource) { g_mtrade.tpPoi = b191_li; break; } }
       g_mtrade.regimeAtAdmission = (int)g_regime;
       g_mtrade.fillBarTime       = iTime(_Symbol, PERIOD_CURRENT, 0);
       g_mtrade.signalBarTime     = iTime(_Symbol, PERIOD_CURRENT, barShift);
@@ -12709,10 +12713,26 @@
        else if(InpDebugLog && uj_rtPx > 0.0) PrintFormat("[SRJ-EA] UJNORETARGET bar=%s dir=%s tp=%s rt=%s why=%s sess=%d seq=%I64d admit=%s - helper true but not tighter (Fix R)", TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES), DirName(g_mtrade.dir), DoubleToString(g_mtrade.tpRef, _Digits), DoubleToString(uj_rtPx, _Digits), (NormalizeDouble(uj_rtPx, _Digits) == NormalizeDouble(g_mtrade.tpRef, _Digits) ? "eq" : "loose"), g_mtrade.sessionAtEntry, (long)g_mtrade.uj_tradeSeq, TimeToString(g_mtrade.uj_admitBarTime, TIME_DATE|TIME_MINUTES)); // helper-true discriminator
       }
     bool tpBookedTouch = false;
+    //--- [B191LX] live-line touch for booked POC/VWAP targets (spec 2/5.1-5.2 + Q3; session targets keep the booked test)
     if(g_mtrade.tpRef != EMPTY_VALUE && g_mtrade.tpRef > 0.0)
       {
-       if(g_mtrade.dir == DIR_LONG  && h >= g_mtrade.tpRef) tpBookedTouch = true;
-       if(g_mtrade.dir == DIR_SHORT && l <= g_mtrade.tpRef) tpBookedTouch = true;
+       double b191_live = EMPTY_VALUE;
+       if(g_mtrade.tpPoi >= 0 && g_mtrade.tpPoi < POI_NLINES
+          && ReadBuf1(g_hPoi, g_mtrade.tpPoi, b191_live, barShift)
+          && b191_live != EMPTY_VALUE && b191_live > 0.0)
+         {
+          bool b191_ahead = (g_mtrade.dir == DIR_LONG) ? (b191_live > o) : (b191_live < o);
+          if(b191_ahead)
+            {
+             if(g_mtrade.dir == DIR_LONG  && h >= b191_live) tpBookedTouch = true;
+             if(g_mtrade.dir == DIR_SHORT && l <= b191_live) tpBookedTouch = true;
+            }
+         }
+       else
+         {
+          if(g_mtrade.dir == DIR_LONG  && h >= g_mtrade.tpRef) tpBookedTouch = true;
+          if(g_mtrade.dir == DIR_SHORT && l <= g_mtrade.tpRef) tpBookedTouch = true;
+         }
       }
     bool tpRecomputeTouch = false;
     if(haveTp)
@@ -12860,7 +12880,16 @@
    g_mtrade.state       = MT_CLOSED;
    g_mtrade.exitBarTime = barTime;
    if(vSL)         { g_mtrade.exitReason = MT_EXIT_SL;             g_mtrade.exitPrice = g_mtrade.slRef; }
-    else if(vTP)    { g_mtrade.exitReason = MT_EXIT_TP_TOUCH;       g_mtrade.exitPrice = g_mtrade.tpRef; }
+    else if(vTP)
+      {
+       double b191_xp = g_mtrade.tpRef;
+       double b191_lv = EMPTY_VALUE;
+       if(g_mtrade.tpPoi >= 0 && g_mtrade.tpPoi < POI_NLINES
+          && ReadBuf1(g_hPoi, g_mtrade.tpPoi, b191_lv, barShift)
+          && b191_lv != EMPTY_VALUE && b191_lv > 0.0)
+          b191_xp = b191_lv;
+       g_mtrade.exitReason = MT_EXIT_TP_TOUCH; g_mtrade.exitPrice = b191_xp;
+      }
    else if(vBREAK) { g_mtrade.exitReason = MT_EXIT_POI_BODY_BREAK; g_mtrade.exitPrice = nextOpenPx; }
    else if(vHTF)   { g_mtrade.exitReason = MT_EXIT_HTF_FLIP;       g_mtrade.exitPrice = nextOpenPx; }
    else if(vDAY)   { g_mtrade.exitReason = MT_EXIT_DAY_CLOSE;  g_mtrade.exitPrice = nextOpenPx; }
(End of slice)
