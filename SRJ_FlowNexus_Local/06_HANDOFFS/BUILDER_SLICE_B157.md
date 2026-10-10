# BUILDER SLICE B-157 - K0 spots, both diffs, filed tables, every B157SL row, G5 (KEPT)

Trial tag B157K; print tag B157SL. Runs: RECON62-B157 (EA 1617DC1A, Tester/logs/20261010.log lines 2542403-2828855, DONE PASSED) + JUNE0525-B157 (lines 2828855+, DONE PASSED).

## K0(a) his words + spec (no contradiction; his words do not authorize S1X over them, edited)

- SEP7 Appendix 3 EXACTLY-two-away: SEP7_CHARTREAD.md:141-143. SLDEF5 Addendum 4 second-swing stops: SLDEF5_FIVEEXAMPLES.md:97-108 (101-103). Addendum 5 A2 first 09:55 NOT 09:45: SLDEF5:140-147. SEP8 Two-swings-away: SEP8_1010-LEVELS.md:7-10. Strategy skill L47 (16:40 two-swing high 1.16359) + L31 R-AT-OPEN.
- Spec 3.7: branches :199-200, swing :202, protective+walk :204, in-zone :208, selector :210, one flag :319, bound 500 :17. Not-most-extreme: SLREF-1.md:11-13 beside.
- S1X authorization one-liner: S1-LIVE-STOPFIX-001 is council-staged machinery (ADD10 gate SATISFIED under Luna V112-AMENDED-STOPFIX-001 re-clear, dual-key; ledger HALTED line is the v113-LAND adoption context, not this code); AGENTS.md 0 hits, FINDINGs 1 hit (ADD10), ledger 2 hits; no words of his authorize S1X over his two-swing stop words (canon: council never overrules him) -> override-after-S1X proceeds, S1X itself untouched.

## K0(b) every machine write to the stop, S5 stop step to order send (kept EA, located by text)

- S5 stop step: ComputeSlReference call EA:9847 (SL_REF sites inside: 1-swing EA:6383-6409, 2-swing EA:6443-6611, FindNearestSwing EA:3044-3058).
- P-ADOPT-1 E50 dormant EA:9880 (`if(ad_def == 1) slRef = ad_px`, behind InpAdoptExt1=false): write site, inert.
- S1-LIVE-STOPFIX-001 live rewire EA:10686-10741 (probe decl :10686; walk :10701-10729; ext1Take EA:10732 `slRef = g_sl41_px`; s0 EA:10737; s1 EA:10738). Last stop write before the R gate.
- R gate reads slRef EA:10743 (`double slDist`), no write. No further `slRef =` before order send (full-file grep).
- Order send EA:11372/11374 (g_trade.Buy/Sell with slRef).
- Chosen site: B157K override block just before EA:10743 (after the last writer S1X, before the R gate reads it).

## K1 indicator (re-applied .B156K byte-for-byte, SHA 1009A4EF verified; ex5 A5EB81B6 copied, no recompile)

- Spots: buffers宣言 :8 (50->51), decl :174-175, SetIndexBuffer :755-756, ArraySetAsSeries :823-825, reset :1473-1474, write :1545-1546 (barClosed :1480 + target>=0 :1543, same gate as B150). ltf2OB variable g_s.isDoubleOB (.B149D:1454; BiasEngine.mqh:221/276/281).
- Raw diff (.preB157 -> live, +7/-1): buffers line 50->51; +decl g_buf2xOB; +SetIndexBuffer(50); +ArraySetAsSeries block; +ArrayInitialize 0.0; +write line. Nothing else.

## K2 EA (from .preB157 5A5BD1F0; +89/-0, purely additive, minus-check verified)

- +2 FL_BUF_B156_2XOB 50 define. +38 SrjWalkOutward2Swing helper (same walk as B-156: confShift+1 origin, strict triple, strict protective side, first + strictly-beyond second, 500 bound, iHigh/iLow chart reads, false = NO_SECOND).
- +49 override block before R-gate slDist: reads buffer 50 + buffer 4 at barShift; two = (2x==1.0 && fvg<0.5); on two replaces slRef/slMode=2SWING with the W-O stop (entry idiom iOpen(barShift-1) fallback iClose); NO_SECOND keeps S1X value; B157SL print per R-gate arrival (bar/side/flags/branch/first/wo/kept(S1X post-rewire)/booked/R/reason).
- Anchor-whitespace note: the edit tool normalized 1sp on two kept lines at match (S1X `}` + slDist); repaired same turn; final diff minus-check = zero non-additive lines.
- Compile 0 errors 0 warnings, binary fresh. Trial src 1617DC1A / ex5 187A7202. .B157K copies (EA src+ex5, indicator src+ex5) kept uncommitted.

## T1 RECON62-B157 PASSED (ini EURUSD read back; WMI launch; window verified; wrapper killed; watcher PID-verified; DONE genuine)

- Filed table vs DEALS_RECON62-B153 (14 deals): #2 sell 8/28 10:05 1.16466 2.38 | #3 buy 8/28 11:35 1.16467 2.38 | #4 buy 9/1 17:35 1.16024 2.04 | #5 sell 9/1 17:50 1.15987 2.04 | #6 buy 9/4 16:00 1.16019 0.57 | #7 sell 9/4 23:55 1.16129 0.57 | #8 buy 9/7 09:20 1.16138 2.49 | #9 sell 9/7 10:53 1.16201 2.49 | #10 buy 9/7 16:45 1.16264 4.05 | #11 sell 9/7 17:13 1.16315 4.05 | #12 sell 9/8 10:10 1.16205 1.95 | #13 buy 9/8 10:42 1.16102 1.95 | #14 sell 9/8 17:00 1.16220 1.95 | #15 buy 9/8 17:26 1.16275 1.95. Side/date/time/price SAME all 14; A5 volume 3.9->4.05 drift from new risk (sizer, own account value) ACCOUNTED.
- B157SL 18 rows: A1 10:00 TWO first 09:55 1.16491 wo 06:30 1.16508 kept=booked 1.16508 R 2.43 | A3 15:55 TWO first 15:45 1.15902 wo 15:30 1.15847 kept=booked 1.15847 R 1.66 | A4 09:15 TWO first 09:10 1.16102 wo 08:40 1.16098 kept=booked 1.16098 R 1.76 | A5 16:40 TWO first 16:30 1.16240 wo 16:15 1.16239 kept(S1X) 1.16238 booked 1.16239 R 2.45 | A6 10:05 TWO first 09:50 1.16251 wo 09:40 1.16258 kept=booked 1.16258 R 1.94 | A7 16:55 TWO first 16:50 1.16233 wo 16:20 1.16274 kept=booked 1.16274 R 1.96 | H3 16:40 TWO first 16:20 1.16274 wo 09:05 1.16359 kept=booked 1.16359 R 0.68 refused | + 11 KEPT_PATH rows (8/28 16:20, 9/1 09:10/09:50/17:30, 9/2 14:40/16:30/17:45, 9/4 09:25/15:35, 9/8 09:35) + 9/1 15:25 TWO first 14:45 1.15954 wo=kept=booked 1.15957 R 1.19 (C-09-01 rejected, never fires). No NO_SECOND anywhere.
- G1 PASS (flag2xOB=1.0 all 7 = B-149 R1). G2 PASS (first/wo = Part S to the point; firsts A1/A5/A6/A7 his). G3 PASS (booked=wo every TWO row; A5 order stop 1.16239 on terminal line + TP_ELECT + A6FIRED + ELIGSTATE slRef 1.16239 rLive 2.45). G4 PASS (entries/exits identical; H3 refused 0.68; 9/1 15:25 silent; no absent fire; A5 drift ACCOUNTED). G5: H3 row kept R 0.68 vs trial R 0.68 SAME (sole refused TWO row; booked unchanged); no refused row changed.

## T3 JUNE0525-B157 PASSED (ini USDJPY read back; same launch discipline; DONE genuine)

- Filed table vs DEALS_JUNE0525-B153 (8 deals): #2 buy 5/27 15:35 159.344 1.08 | #3 sell 5/27 20:08 159.535 1.08 | #4 buy 6/3 09:10 159.932 3.75 | #5 sell 6/3 09:59 159.983 3.75 | #6 buy 6/5 16:15 160.065 0.35 | #7 sell 6/5 19:16 160.298 0.35 | #8 buy 6/11 14:40 160.530 5.69 | #9 sell 6/11 15:23 160.588 5.69. 8/8 SAME (volumes identical).
- B157SL 11 rows: 5/27 TWO first 15:20 159.245 wo=kept=booked 159.197 R 9.67 | 6/3 09:05 C-06-03 KEPT_PATH 159.889 R 1.35 | 6/3 14:55/17:25/18:00 KEPT_PATH | 6/4 17:05 KEPT_PATH | 6/5 09:15 KEPT_PATH (B1 silent) | 6/5 16:10 B2 TWO first 16:00 159.726 wo=kept=booked 6/4 07:30 159.598 R 1.44 | 6/10 10:25 KEPT_PATH (silent) | 6/11 11:20 KEPT_PATH | 6/11 14:35 B3 KEPT_PATH 160.501 R 2.74. No NO_SECOND.
- G1 PASS (B2 1.0, B3 1.0, C-06-03 0.0 = B-149 R1). G2/G3 B2 PASS (first/wo/booked = 6/4 07:30 159.598). 4 June 09:55 refused PROMO_RETURN_NONE SAME (+11:05 event SAME). 2 June/10 June/5 June London silent SAME. No absent fire SAME.

## T4 KEPT (every gate both runs)

- Trial pair stays on disk uncommitted (EA src 1617DC1A / ex5 187A7202; indicator src 1009A4EF / ex5 A5EB81B6); kept ex5s backed as .ex5.B157K; .B156K copies kept. terminal.ini June window as-run; Charts as-run; no terminal64.

## K1 raw diff (.preB157 -> live; +7/-1, minus-check: only the buffers-count line)

- `-#property indicator_buffers 50 ...` / `+#property indicator_buffers 51  // [B156SL] Was 50. Added 50 (5m 2xOB flag). [B150PR] Was 48...`
- `+double g_buf2xOB[];   // [B156SL] Buffer 50. 5m 2xOB state per closed bar (1 = strong 2xOB, 0 = not).`
- `+   SetIndexBuffer(50, g_buf2xOB,     INDICATOR_CALCULATIONS);   // [B156SL]`
- `+   // [B156SL]` + `+   ArraySetAsSeries(g_buf2xOB, false);`
- `+         ArrayInitialize(g_buf2xOB, 0.0);   // [B156SL] new slots start empty`
- `+            g_buf2xOB[target] = (g_s.isDoubleOB ? 1.0 : 0.0);   // [B156SL] same variable B149OB2 printed as ltf2OB`

## K2 raw diff (.preB157 -> .B157K; +89/-0, minus-check verified zero removals)

- `+//--- [B157K] 5m 2xOB flag export (relay B-156 K1, re-applied B-157; next free index).` + `+#define FL_BUF_B156_2XOB         50`
- Helper (+38, verbatim): `//--- [B157K] outward two-swing walk on finished chart swings (relay B-157 K2; same walk as B-156 K2).` + origin/finished/strict/protective/first-beyond/stop-second/500-bound/chart-reads comments; `bool SrjWalkOutward2Swing(const int confShift, const ENUM_SRJ_DIR dir, const double entryPx, datetime &firstBT, double &firstPx, datetime &stopBT, double &stopPx)` + body (firstBT/Px init; counted/last; `for(int m = confShift + 1; m <= confShift + 500; m++)`; iLow/iHigh pL/pM/pR triple with `<= 0.0 break`; strict test; protective test; first capture + `continue`; beyond test; stop capture + `return true`; `return false`).
- Override block (+49, verbatim): `//--- [B157K] outward two-swing stop as the last word...` (5 comment lines); `bool b157_2xOk = ReadFlow(FL_BUF_B156_2XOB, b157_2x, barShift);` + fvg read; `bool b157_two = (b157_2xOk && b157_2x == 1.0 && b157_fvgOk && b157_fvg < 0.5);`; keptStop/branch/reason/first/stop/R/fBT/fPx/sBT/sPx decls; `if(b157_two)` walk-from-`iOpen(barShift-1)`-fallback-`iClose`; override `slRef = b157_sPx; slMode = SL_MODE_2SWING;` reason TWO_WO else NO_SECOND; first/stop time+price captures; R from tpTarget/currentPrice; `PrintFormat("[SRJ-EA] B157SL bar=%s side=%s flag2xOB=%s fvgValid=%s branch=%s first_bar=%s first_px=%s wo_stop_px=%s kept_stop_px=%s booked_stop_px=%s R_at_open=%.2f reason=%s", ...)` (13 fields per relay).
- Override block (verbatim added lines):
```
       //--- [B157K] outward two-swing stop as the last word (relay B-157 K2, reopen key of B-156).
       //--- S1-LIVE-STOPFIX-001 above reselects slRef at S5; this block runs after it, before the R gate,
       //--- so on the two-swing branch the outward stop is what the R gate and the order read. S1X itself
       //--- is untouched. Two-swing branch = 2xOB 1 AND imbalance invalid/absent (B-149 R2, spec 3.7).
       //--- Only there slRef/slMode are replaced (NO_SECOND keeps the S1X value). Everything else kept.
         {
          double b157_2x = 0.0, b157_fvg = 0.0;
          bool b157_2xOk = ReadFlow(FL_BUF_B156_2XOB, b157_2x, barShift);
          bool b157_fvgOk = ReadFlow(FL_BUF_LTF_FVG_VALID, b157_fvg, barShift);
          bool b157_two = (b157_2xOk && b157_2x == 1.0 && b157_fvgOk && b157_fvg < 0.5);
          double b157_keptStop = slRef;
          string b157_branch = b157_two ? "TWO" : "ONE_OR_NEITHER";
          string b157_reason = "KEPT_PATH";
          string b157_firstBTS = "-", b157_stopBTS = "-";
          double b157_firstPx = 0.0, b157_stopPx = 0.0, b157_r = -1.0;
          datetime b157_fBT = 0, b157_sBT = 0;
          double b157_fPx = 0.0, b157_sPx = 0.0;
          if(b157_two)
            {
             double b157_entry = (barShift >= 1) ? iOpen(_Symbol, PERIOD_CURRENT, barShift - 1) : 0.0;
             if(b157_entry <= 0.0) b157_entry = iClose(_Symbol, PERIOD_CURRENT, barShift);
             if(SrjWalkOutward2Swing(barShift, g_dir, b157_entry, b157_fBT, b157_fPx, b157_sBT, b157_sPx))
               {
                slRef = b157_sPx; slMode = SL_MODE_2SWING;
                b157_reason = "TWO_WO";
               }
             else b157_reason = "NO_SECOND";
             if(b157_fBT > 0)
               { b157_firstBTS = TimeToString(b157_fBT, TIME_DATE|TIME_MINUTES); b157_firstPx = b157_fPx; }
             if(b157_sBT > 0)
               { b157_stopBTS = TimeToString(b157_sBT, TIME_DATE|TIME_MINUTES); b157_stopPx = b157_sPx; }
            }
          double b157_booked = slRef;
          double b157_risk = (g_dir == DIR_LONG) ? (currentPrice - b157_booked) : (b157_booked - currentPrice);
          double b157_rew = (g_dir == DIR_LONG) ? (tpTarget - currentPrice) : (currentPrice - tpTarget);
          if(tpTarget > 0.0 && b157_risk > 0.0) b157_r = b157_rew / b157_risk;
          if(InpDebugLog)
             PrintFormat("[SRJ-EA] B157SL bar=%s side=%s flag2xOB=%s fvgValid=%s branch=%s first_bar=%s first_px=%s wo_stop_px=%s kept_stop_px=%s booked_stop_px=%s R_at_open=%.2f reason=%s",
                         TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES),
                         DirName(g_dir),
                         (b157_2xOk ? DoubleToString(b157_2x, 1) : "READFAIL"),
                         (b157_fvgOk ? DoubleToString(b157_fvg, 1) : "READFAIL"),
                         b157_branch, b157_firstBTS,
                         (b157_fBT > 0 ? DoubleToString(b157_firstPx, _Digits) : "-"),
                         (b157_sBT > 0 ? DoubleToString(b157_sPx, _Digits) : "-"),
                         DoubleToString(b157_keptStop, _Digits),
                         DoubleToString(b157_booked, _Digits), b157_r, b157_reason);
         }
```
- Helper added lines (verbatim): `//--- [B157K] outward two-swing walk on finished chart swings (relay B-157 K2; same walk as B-156 K2).` + 9 comment lines (origin confShift chart frame; finished M>=confShift+1; strict triple; strict protective side; first + strictly-beyond second; 500 bound spec section 0; chart reads; false = NO_SECOND); `bool SrjWalkOutward2Swing(const int confShift, const ENUM_SRJ_DIR dir, const double entryPx, datetime &firstBT, double &firstPx, datetime &stopBT, double &stopPx)` + body (`firstBT = 0; firstPx = 0.0; stopBT = 0; stopPx = 0.0; int counted = 0; double last = 0.0; for(int m = confShift + 1; m <= confShift + 500; m++)` triple iLow/iHigh reads; `<= 0.0 break`; strict/protective tests; first capture; beyond test; stop capture `return true`; `return false`).
- Minus-check: zero `^-` lines across the EA diff (purely additive); indicator diff: single buffers-count line modified + 6 insertions.

(End of slice)
