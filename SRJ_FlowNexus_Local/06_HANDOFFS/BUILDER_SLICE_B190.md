# BUILDER SLICE B-190 - raw rows, spots, full diffs, Part S table (under 600 lines)

Base: builder/B-190 cut at df8da29 (backup exact). B1 banked (skill+row 328+ledger). R reads offline. P: print-only EA hunk 6d14fba2, one compile (0/0), three always-restored runs 14/14+8/8+2/2 SAME. Table SEPARATES (below; filed before Part K per relay).

## Part B banking (grep-first counts)
- "stale sessional liquidity": skill 0, journal 0, ledger 0. "swept but still targeted": skill 0, journal 0, ledger 0. Count 0 -> appended skill section "## His words 2026-10-12 (B-190)" (pins skill:82/126/127 quoted in result), journal row 328 (28 fields, verified by re-parse, UNSTAGED), ledger via 1336.

## Part R spots (raw, real line numbers)
- SWEPTMASK producer Indicators/SRJ_FlowLogic.mq5:1454-1483 (bits 0-9 same-day latches :1460-1469; bits 14-21 pd-latches :1470-1477; bits 10-13 live session :1478-1482; buffer :1483).
- Booking walk Experts/SRJ_FlowNexus_EA.mq5:2942-2947 (sessbufs + !TpSessionLevelFiltered + TpTargetUpdateBest); filter :2828-2842 (swept bit idx, +4 for 10-17; live bits 10-13 Asia/London/NY/PM); mask reads :2870, :12409; pool taken-scan :2951-2984 (B-20 Hunk S': closure bar via iBarShift :2958; MISS :2961; scan :2963-2976 strict iHighest/iLowest every candle no session filter no buffer; SKIP :2979-2980); POI loop :2986-2994 (never filtered); retarget walk :12410-12435 + UJREELECT :12448 + UJTOUCH :12392.
- Blind ranges kept test can NOT see: hairline-beyond candles (strict but within +1pt buffer) on session-buffer levels; pool entries with unfound closure (UJTAKENMISS, no scan); pre-closure and pre-warmup candles (mask EMPTY fail-open); exact-equal touches (correctly not taken, both rules agree). Gap/overnight candles ARE seen by latches (every bar, no session filter).
- R2 validity readers: admission R gate S5 `if(!tpOk)` (~11286 area); booking walks (above); retarget MtNearestTpTarget :12343-12449; exit-ranking EXITCENSUS/MTEXIT (line-state, no target-validity read). Single validity read for K: TpSessionLevelFiltered (both walks call it).
- R3 7/07 candles: printed 09:15-12:50 + 13:55-14:40 with o/h/l/c (job_r3_b190.py; min printed low after 09:10 = 1.33748 at 10:00); NOT PRINTED 12:55-13:50 (12 slots, 12:00-13:55 first per relay). FOUND low strictly under 1.33747 on printed rows: none.
- R4 exact-1pt census (33 TP_ELECT rows, decision-day committed candles): hits all post-decision (exit evidence: 9/08 tp=1.16102 lows 11:05/11:45; 6/03 tp=159.983 high 09:55) or POI targets (7/06 tp=1.33430 Weekly-POC: pre-decision exact candles exist but POI has no taken verdict). No booked/refused session-level taken verdict changes pre-decision. A6REFUSED rows carry no tp (class/predicate only); refused tp values ride TP_ELECT shadow rows (covered).
- R5 candle: pack 94 (jline 14508061) 09:10 o=1.33777 h=1.33779 l=1.33747 c=1.33769. YLOL = same-day London low cached at 14:00 NY open (prevLondonLow only writer Sessions.mqh:296-297); London closed 12:00; untaken pre-14:40 (no low tag). Record silent (register F2 names W-POC/W-VWAP only; journal 326-327 exit-journal + B168/B169 words; B185-LIVE-CHART general) -> ONE chart call in carried note.

## Part P hunk + runs (print-only EA 6d14fba2; restored)
- P1 B190TakenEmit + 2 calls (Compute end :3257-area, MtNearest end :12530-area); B190TKP x1; braces 1220/1220 -> 1237/1237 (+17 delta, balanced); compile 0 errors 0 warnings binary fresh; .B190TKP kept (never committed); full diff raw below.
- P3 .preB190 terminal.ini (78d143fa) + Charts (19) before first launch. Runs: RECON62-B190P pass 0:03:48 563338/3168 (launch 18:35:15, terminal start ~4.5 min); JUNE0525-B190P pass 0:03:32 740873/4320 (launch 18:45:51, start ~5 min); GBP0629-B190P pass 0:03:57 1386092/4320 (launch 18:57:05, start ~4.5 min). Launch-then-stop each (launchers killed post-verify).
- P4 tables: 14/14 SAME (volumes identical), 8/8 SAME, 2/2 SAME. No STOP.
- P5 restored + verified: EA 67021D84 + ex5 7601D51A (via .ex5.preB185 byte-match, disclosed), terminal.ini 78d143fa, Charts 19/19 0 mismatch, seeds/ckpt identical, no terminal64.

## Part S separator table (TAKEN-ON-CANDLES; B190P rows; monotonic proof: trial-valid subset of kept-valid => R' <= R, so refusals stay refused)
- F2 7/07 SHORT (decides): kept YLOL 1.33747 R1.51 (B188TPSRC 1581). Reading: taken 13:00@1.33707 (B190TKP 1593 first). Next valid W-VWAP 1.33630 (B188TPSRC n2; no admitted pool entry nearer; NYL swept+first NONE stays out; PML/YPML taken 10:00). R' = 233/77 = 3.03 >= 1, entry same 14:45 bar, exit = W-VWAP touch (his exit). SEPARATES.
- A1 8/28 SHORT: kept PDL 1.16364 (B190TKP first=NONE) stays, R 2.43. SAME.
- A2 9/01 LONG: kept Yearly-POC 1.16077 (POI) stays. SAME.
- A3 9/04 LONG: kept LOH 1.16302 set=09:10 first=NONE stays, R 1.66. SAME.
- A4 9/07 LONG: kept ASH 1.16200 set=03:50 first=NONE stays, R 1.76. SAME.
- A5 9/07 LONG: kept Yearly-VWAP 1.16315 (POI) stays. SAME.
- A6 9/08 SHORT: kept YLOL-9/07 1.16102 set=9/07 09:10 first=NONE stays, R 1.94. SAME.
- A7 9/08 SHORT: kept Yearly-POC 1.16114 (POI) stays. SAME.
- B2 6/05 LONG: kept DH20260430 160.723 first=NONE stays, R 1.44; retarget NYH 160.298 set=18:45 first=NONE stays. SAME.
- B3 6/11 LONG: kept LOH 160.587 set=09:40 first=NONE stays, R 2.74. SAME.
- C-06-03 6/03 LONG: kept ASH 159.983 first=NONE stays, R 1.35. SAME.
- C-05-27 warm-up: DH20260430 first=NONE (listed, never graded).
- Refusals with session nearest (all stay refused): 7/01 ASH 1.32513 first=NONE (R 0.68/0.71); 6/04 LOH 159.927 first=NONE (R 0.21); others POI (7/06 Monthly/Weekly-POC, 9/04 Yearly-VWAP, 9/02 FOMC-VWAP x2, 9/08 Yearly-VWAP, 6/11 Daily-VWAP) or R<<1 shadows. Predicted new deals: NONE.
- Retarget rows: B2 NYH 160.298 first=NONE stays; no UJREELECT/UJTOUCH prints on B190P runs (no touch events).
- Verdict: SEPARATES (F2 moves to his exit; every fixed booking stays; no refusal fires).

## Part P full diff .preB190 vs .B190TKP (raw; 96 added, 0 removed, +17/+17 braces; filed from diff_B190TKP_utf8.txt)
hunk = B190TakenEmit function + 2 calls at Compute end and MtNearest end; B190TKP x1; compile 0/0 binary fresh f3f75012; .B190TKP kept 6d14fba2 never committed)
--- SRJ_FlowNexus_EA.mq5.preB190
+++ SRJ_FlowNexus_EA.mq5.B190TKP
@@ -2816,6 +2816,100 @@
    if(StringSubstr(ak, 0, ap) != StringSubstr(ck, 0, cp)) return true;
    return true;
   }
+//--- print-only taken-on-candles census (B-190 diagnostic; reads only, no gate reads this)
+void B190TakenEmit(const int b190_shift, const ENUM_SRJ_DIR b190_dir, const double b190_px, const double b190_best, const bool b190_have, const string b190_dk)
+  {
+   if(!InpDebugLog) return;
+   datetime b190_barT = iTime(_Symbol, PERIOD_CURRENT, b190_shift);
+   if(b190_barT <= 0) return;
+   datetime b190_day = StringToTime(TimeToString(b190_barT, TIME_DATE));
+   datetime b190_floor = (b190_day > 0 ? b190_day - 86400 : 0);
+   int b190_max = Bars(_Symbol, PERIOD_CURRENT);
+   const int b190_bufs[18] = { FL_BUF_PDAY_HIGH, FL_BUF_PDAY_LOW,
+                               FL_BUF_ASIA_HIGH, FL_BUF_ASIA_LOW,
+                               FL_BUF_LONDON_HIGH, FL_BUF_LONDON_LOW,
+                               FL_BUF_NY_HIGH, FL_BUF_NY_LOW,
+                               FL_BUF_PM_HIGH, FL_BUF_PM_LOW,
+                               FL_BUF_PD_ASIA_HIGH, FL_BUF_PD_ASIA_LOW,
+                               FL_BUF_PD_LONDON_HIGH, FL_BUF_PD_LONDON_LOW,
+                               FL_BUF_PD_NY_HIGH, FL_BUF_PD_NY_LOW,
+                               FL_BUF_PD_PM_HIGH, FL_BUF_PD_PM_LOW };
+   const string b190_names[18] = { "PDH", "PDL", "ASH", "ASL", "LOH", "LOL",
+                                   "NYH", "NYL", "PMH", "PML",
+                                   "YASH", "YASL", "YLOH", "YLOL",
+                                   "YNYH", "YNYL", "YPMH", "YPML" };
+   double b190_mask;
+   if(!ReadFlow(FL_BUF_SWEPT_MASK, b190_mask, b190_shift)) b190_mask = EMPTY_VALUE;
+   string b190_tn[3]; double b190_tv[3]; double b190_td[3]; int b190_ti[3];
+   for(int b190_q = 0; b190_q < 3; b190_q++) { b190_tn[b190_q] = "-"; b190_tv[b190_q] = EMPTY_VALUE; b190_td[b190_q] = 0.0; b190_ti[b190_q] = -1; }
+   for(int b190_i = 0; b190_i < 18; b190_i++)
+     {
+      double b190_v;
+      if(!ReadFlow(b190_bufs[b190_i], b190_v, b190_shift)) continue;
+      if(b190_v == EMPTY_VALUE || b190_v <= 0.0) continue;
+      bool b190_inD = (b190_dir == DIR_LONG) ? (b190_v > b190_px) : (b190_v < b190_px);
+      if(!b190_inD) continue;
+      if(g_zoneHi > 0.0 && g_zoneLo > 0.0 && b190_v >= g_zoneLo && b190_v <= g_zoneHi) continue;
+      double b190_d = MathAbs(b190_v - b190_px);
+      for(int b190_k = 0; b190_k < 3; b190_k++)
+        {
+         if(b190_tv[b190_k] == EMPTY_VALUE || b190_d < b190_td[b190_k])
+           {
+            for(int b190_j = 2; b190_j > b190_k; b190_j--)
+              { b190_tv[b190_j] = b190_tv[b190_j-1]; b190_td[b190_j] = b190_td[b190_j-1]; b190_tn[b190_j] = b190_tn[b190_j-1]; b190_ti[b190_j] = b190_ti[b190_j-1]; }
+            b190_tv[b190_k] = b190_v; b190_td[b190_k] = b190_d; b190_tn[b190_k] = b190_names[b190_i]; b190_ti[b190_k] = b190_i;
+            break;
+           }
+        }
+     }
+   for(int b190_r = -1; b190_r < 3; b190_r++)
+     {
+      string b190_nm; double b190_vv; string b190_dy; string b190_kv;
+      if(b190_r < 0)
+        {
+         if(!b190_have) continue;
+         b190_nm = uj_winnerSource; b190_vv = b190_best; b190_dy = uj_winnerDayKey; b190_kv = "WIN";
+        }
+      else
+        {
+         if(b190_tv[b190_r] == EMPTY_VALUE) continue;
+         b190_nm = b190_tn[b190_r]; b190_vv = b190_tv[b190_r]; b190_dy = b190_dk;
+         b190_kv = (b190_r == 0 ? "n1" : (b190_r == 1 ? "n2" : "n3"));
+        }
+      bool b190_isHi = (b190_dir == DIR_LONG);
+      int b190_set = -1;
+      for(int b190_s = b190_shift; b190_s < b190_max; b190_s++)
+        {
+         datetime b190_st = iTime(_Symbol, PERIOD_CURRENT, b190_s);
+         if(b190_st <= 0 || (b190_floor > 0 && b190_st < b190_floor)) break;
+         double b190_sh = iHigh(_Symbol, PERIOD_CURRENT, b190_s);
+         double b190_sl = iLow(_Symbol, PERIOD_CURRENT, b190_s);
+         if(b190_isHi && b190_sh == b190_vv) { b190_set = b190_s; break; }
+         if(!b190_isHi && b190_sl == b190_vv) { b190_set = b190_s; break; }
+        }
+      string b190_first = "NONE";
+      int b190_fsh = (b190_floor > 0 ? iBarShift(_Symbol, PERIOD_CURRENT, b190_floor, false) : -1);
+      int b190_from = (b190_set >= 0 ? b190_set - 1 : b190_fsh);
+      if(b190_from >= b190_max) b190_from = b190_max - 1;
+      for(int b190_c = b190_from; b190_c >= b190_shift; b190_c--)
+        {
+         double b190_ch = iHigh(_Symbol, PERIOD_CURRENT, b190_c);
+         double b190_cl = iLow(_Symbol, PERIOD_CURRENT, b190_c);
+         if(b190_isHi && b190_ch > 0.0 && b190_ch > b190_vv)
+           { b190_first = StringFormat("%s@%s", TimeToString(iTime(_Symbol, PERIOD_CURRENT, b190_c), TIME_DATE|TIME_MINUTES), DoubleToString(b190_ch, _Digits)); break; }
+         if(!b190_isHi && b190_cl > 0.0 && b190_cl < b190_vv)
+           { b190_first = StringFormat("%s@%s", TimeToString(iTime(_Symbol, PERIOD_CURRENT, b190_c), TIME_DATE|TIME_MINUTES), DoubleToString(b190_cl, _Digits)); break; }
+        }
+      string b190_setT = (b190_set < 0 ? "NONE" : TimeToString(iTime(_Symbol, PERIOD_CURRENT, b190_set), TIME_DATE|TIME_MINUTES));
+      string b190_verd = "n/a";
+      if(b190_r >= 0 && b190_ti[b190_r] >= 0)
+         b190_verd = (TpSessionLevelFiltered(b190_ti[b190_r], b190_mask) ? "kept-swept" : "kept-valid");
+      PrintFormat("[SRJ-EA] B190TKP bar=%s dir=%s role=%s name=%s val=%s set=%s first=%s kept=%s",
+                  TimeToString(b190_barT, TIME_DATE|TIME_MINUTES),
+                  (b190_dir == DIR_SHORT ? "S" : "L"), b190_kv, b190_nm,
+                  DoubleToString(b190_vv, _Digits), b190_setT, b190_first, b190_verd);
+     }
+  }
 //--- TASK 39 (EA-26 + EA-51): decode FlowLogic buffer 29 for one session/PD TP
 //--- candidate. sessIdx is the sessbufs[] index (0..9). Excluded when:
 //---   EA-26  its swept bit (0..9, same order) is set Ã¢â‚¬â€ swept once = not fresh; or
@@ -3160,6 +3254,7 @@
                      nEmpty, admitted);
         }
      }
+   B190TakenEmit(barShift, dir, currentPrice, best, haveBest, uj_dk);
    if(!haveBest) return false;
    tpTargetOut = best;
    return true;
@@ -12433,6 +12528,7 @@
       if(!ReadBuf1(g_hPoi, k, v, barShift)) continue;
       TpTargetUpdateBest(v, dir, currentPrice, best, haveBest, g_lineCode[k], uj_dk, -1);
      }
+   B190TakenEmit(barShift, dir, currentPrice, best, haveBest, uj_dk);
    if(!haveBest)
      {
       //--- [P-UJIMPL-IMPL-1 v8 IE8] re-election record: no winner leaves TP

## Part K full diff .preB190 vs .B190TK (raw; 35 added, 2 removed, +5/+5 braces)
--- SRJ_FlowNexus_EA.mq5.preB190
+++ SRJ_FlowNexus_EA.mq5.B190TK
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
(diff lines pasted at filing time from the verified hunk; B190TKP x1, calls x2)
(End of slice)
