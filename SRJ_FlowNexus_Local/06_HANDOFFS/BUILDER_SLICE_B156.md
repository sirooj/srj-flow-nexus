# BUILDER SLICE B-156 - K0 quotes, K1/K2 spots + diffs, T tables, B156SL rows, restore (RESTORED)

Trial tag B156K; print tag B156SL. Runs: RECON62-B156 (EA 4566BE74, Tester/logs/20261010.log lines 2255953+, DONE PASSED 16:24:04). JUNE run never launched (gated on RECON62 passing every gate).

## K0 rule-conflict check (his words + spec; no contradiction found, edit proceeded)

- SEP7 Appendix 3 "EXACTLY two swings away": SEP7_CHARTREAD.md:141-143. SLDEF5 Addendum 4 "second-swing stops": SLDEF5_FIVEEXAMPLES.md:97-108 (esp. 101-103). Addendum 5 A2 first 09:55 NOT 09:45: SLDEF5:140-147. SEP8 "Two swings away": SEP8_1010-LEVELS.md:7-10. Strategy skill L47 (16:40 two-swing high 1.16359) + L31 R-AT-OPEN.
- Spec 3.7: two branches spec:199-200; swing spec:202; protective side + walk continues spec:204; in-zone spec:208; branch selector spec:210; one flag spec:319; 500-slot bound spec:17. Not-most-extreme quote: SLREF-1.md:11-13 (beside, never a test).
- Verdict: export adds readability (spec section 8), W-O applies only on 2xOB-no-imbalance, one-swing/target/PROMO/exit paths untouched. No contradiction; edited.

## K1 indicator spots (raw, kept src 78D3BFB1)

- Buffers 50, plots 2: FlowLogic.mq5:8 (#property indicator_buffers 50). Decl g_bufB150Bull/Bear: :174-175. SetIndexBuffer 48/49: :755-756. ArraySetAsSeries: :823-825. Reset ArrayInitialize: :1473-1474. Write target=i-1: :1545-1546 (inside if(barClosed):1480 + if(target>=0):1543, same gate as B150 pair). Writer convention: :1467-1470 (close-of-i state; buffers ride target=i-1).
- ltf2OB variable FOUND: g_s.isDoubleOB (.B149D:1454 prints it as ltf2OB; struct set/clear BiasEngine.mqh:221/276/281). Present in kept include (untouched).

## K1 diff (.preB156 -> .B156K; +7/-1, additive only)

- :8 buffers 50 -> 51 (+ B156SL note). + decl `double g_buf2xOB[];` after :175. + `SetIndexBuffer(50, g_buf2xOB, INDICATOR_CALCULATIONS);` after :756. + `ArraySetAsSeries(g_buf2xOB, false);` after :825. + `ArrayInitialize(g_buf2xOB, 0.0);` in reset (new slots start empty). + `g_buf2xOB[target] = (g_s.isDoubleOB ? 1.0 : 0.0);` after the B150 writes. No existing buffer/input/draw/computation touched.
- Full raw diff: 55-line git diff --no-index output on file (K1 hunks above; single-word buffer-count line + 5 insertions + 1 write line).

## K2 EA spots (raw, kept src 5A5BD1F0)

- FL_BUF defines: EA:206-212 (22/23 XOB zones, 24/25 FVG legs, 48/49 B150; +50 FL_BUF_B156_2XOB by K2). FVG read idiom: EA:2645 + EA:7744/7748 (ReadFlow FL_BUF_LTF_FVG_VALID at barShift).
- FindNearestSwing EA:3044-3058. 1-swing print EA:6388 (obValid=1). 2-swing walk EA:6443-6474 (comment) + EA:6475-6552, prints EA:6528/6590. S5 stop step EA:9847 (`if(!ComputeSlReference(barShift, g_dir, slRef, slMode, "S5"))`); tpTarget EA:9823 + currentPrice EA:9821 in scope above it.

## K2 diff (.preB156 -> .B156K; +100/-2)

- +2 define lines (FL_BUF_B156_2XOB 50). +38 SrjWalkOutward2Swing helper after FindNearestSwing (chart-frame iHigh/iLow walk from confShift+1, strict triple, strict protective side, first + strictly-beyond second, 500 bound, false = NO_SECOND).
- S5 site restructured EA:9887-9936: `bool b156_keptOk = ComputeSlReference(...S5)` (kept call kept), S5-only block reads buffer 50 + buffer 4 at barShift, two = (2x==1.0 && fvg<0.5); on two: W-O from iOpen(barShift-1) entry idiom, override slRef/slMode=2SWING, R from tpTarget/currentPrice, B156SL print every S5 confirmation (branch TWO/ONE_OR_NEITHER, first/stop/kept/R/reason). Abort iff !keptOk && !proceed.
- Owned whitespace drift: FindNearestSwing EA:3053-3054 re-indented 6sp->3sp by the insert anchor (behaviour-identical; disclosed, restored).
- Full raw diff: 120-line git diff --no-index output on file (hunks above).

## Compiles (0 errors each)

- Indicator trial src 1009A4EF, ex5 A5EB81B6, 0 errors + 1 benign warning (pre-existing long->int cast, was :1489 now :1494 after +5 lines). Binary fresh.
- EA trial src 4566BE74, ex5 1480EC30, 0 errors 0 warnings. Binary fresh. .B156K copies kept uncommitted (4 files).

## T1 RECON62-B156 (terminal.ini EURUSD 1787702400/1788998400 read back; launch script file; WMI 20092; window verified 8/26 progression; wrapper shell killed post-verification; watcher PID-verified; DONE genuine 16:24:04)

- Filed-trade table vs DEALS_RECON62-B153.csv (14 deals): #2 sell 8/28 10:05 1.16466 | #3 buy 8/28 11:35 1.16467 | #4 buy 9/1 17:35 1.16024 | #5 sell 9/1 17:50 1.15987 | #6 buy 9/4 16:00 1.16019 | #7 sell 9/4 23:55 1.16129 | #8 buy 9/7 09:20 1.16138 | #9 sell 9/7 10:53 1.16201 | #10 buy 9/7 16:45 1.16264 | #11 sell 9/7 17:13 1.16315 | #12 sell 9/8 10:10 1.16205 | #13 buy 9/8 10:42 1.16102 | #14 sell 9/8 17:00 1.16220 | #15 buy 9/8 17:26 1.16275. 14/14 SAME side/date/time/price/volumes (2.38/2.04/0.57/2.49/3.9/1.95).
- B156SL rows at the 7 confirmations (+H3): A1 10:00 TWO first 09:55 1.16491 stop 06:30 1.16508 kept 1.16508 R 2.43 | A3 15:55 TWO first 15:45 1.15902 stop 15:30 1.15847 kept(S5) 1.15907 R 1.66 | A4 09:15 TWO first 09:10 1.16102 stop 08:40 1.16098 kept 1.16098 R 1.76 | A5 16:40 TWO first 16:30 1.16240 stop 16:15 1.16239 kept(S5) 1.16218 R 2.45 | A6 10:05 TWO first 09:50 1.16251 stop 09:40 1.16258 kept(S5) 1.16379 R 1.94 | A7 16:55 TWO first 16:50 1.16233 stop 16:20 1.16274 kept(S5) 1.16379 R 1.96 | H3 16:40 TWO first 16:20 1.16274 stop 09:05 1.16359 kept(S5) 1.16379 R 0.68. (kept_stop_px = pre-rewire S5-compute; latched kept differs - see root cause.)
- Other 11 B156SL S5 rows: ONE_OR_NEITHER KEPT_PATH (8/28 16:20, 9/1 09:10, 9/1 09:50, 9/1 17:30, 9/2 14:40, 9/2 16:30, 9/2 17:45, 9/4 09:25, 9/4 15:35, 9/8 09:35) + one TWO row 9/1 15:25 first 14:45 1.15954 stop 14:30 1.15957 R 1.19 (C-09-01-1530 REJECTED row, never fires). No NO_SECOND / TWO_WO_RESCUE anywhere (18 rows).
- G1 export proof: flag2xOB at A1-A7 = 1.0 on all 7 = B-149 R1 ltf2OB (verdicts only). PASS.
- G2 walk proof: every TWO stop_bar+stop_px = Part S W-O cell to the point; first = his first on A1/A5/A6/A7. PASS.
- G3: entries 14/14 identical SAME; exits identical SAME; no fire absent SAME; H3 still refused (TP_RR_FAIL_LATCH 16:40 sl 1.16359 R 0.68 + SLNONFIRE wouldFire=0 + A6REFUSED) SAME; A5 booked stop 1.16238 (take-profit line `sl: 1.16238`, TP_ELECT sl 1.16238, A6FIRED sl 1.16238 mode 2SWING r 2.34) DIFFERENT from ordered 1.16239 -> G3 MISS (not entry-lost, not new-fire).
- G4 refusals with changed booked stops: EMPTY (every booked stop = kept; H3 refusal rows above, unchanged).
- Latch check (ELIGSTATE slRef/rLive): A1 1.16508/2.43, A3 1.15847/1.66, A4 1.16098/1.76, A5 1.16238/2.34, A6 1.16258/1.94, A7 1.16274/1.96, H3 1.16359/0.68 refused. S2POLL prints byte-identical by construction (spot: SLSRC+S2POLL 1.16218 rows present as on kept).
- Root cause (read-only): S1-LIVE-STOPFIX-001 live rewire EA:10775-10830 reselects slRef at S5 AFTER the B156K hook from ext-1/s0/s1 rungs (EA:10820-10827); on A5 it picks 16:05 1.16238 over the S5 16:15 1.16239 (on the other six rows both paths agree, so the override is invisible). Reopen key: place the outward override downstream of the S1X rewire (just before the R-gate slDist EA:10832). K0 missed this rule (checked his words + spec, not staged EA stop rules) - defect owned, skill gate extended in ledger.
- T3 June: NOT RUN (gated on RECON62 passing every gate).

## Restore (T4 RESTORED)

- Sources restored from .preB156, SHA-verified: EA 5A5BD1F0 + indicator 78D3BFB1. Indicator ex5 restored from .ex5.B153K: E0E98A3D verified. EA ex5 had no kept backup: recompiled from restored source (0 errors 0 warnings): D26AB572 (differs from AFCEC04D by build stamp only; source-identical; disclosed).
- terminal.ini restored (F017D32D) + Charts restored (26 files) from .preB156 copies. No terminal64 remains (leftover PID 6800 stopped post-grading).
- .B156K trial copies kept uncommitted (EA src+ex5, indicator src+ex5) + full diffs above. No source/ex5 committed.

## B156SL all 18 S5 rows (RECON62-B156, log lines 2255953+)

- 8/28 10:00 SHORT TWO first 09:55 1.16491 stop 06:30 1.16508 kept 1.16508 R 2.43 | 8/28 16:20 SHORT KEPT_PATH 1.16508 | 9/1 09:10 SHORT KEPT_PATH | 9/1 09:50 LONG KEPT_PATH | 9/1 15:25 SHORT TWO first 14:45 1.15954 stop 14:30 1.15957 kept 1.15954 R 1.19 (C-09-01 rejected row) | 9/1 17:30 LONG A2 KEPT_PATH kept 1.15975 | 9/2 14:40 SHORT KEPT_PATH | 9/2 16:30 SHORT KEPT_PATH | 9/2 17:45 LONG KEPT_PATH | 9/4 09:25 LONG KEPT_PATH | 9/4 15:35 LONG KEPT_PATH kept 1.15907 | 9/4 15:55 LONG A3 TWO first 15:45 1.15902 stop 15:30 1.15847 kept 1.15907 R 1.66 | 9/7 09:15 LONG A4 TWO first 09:10 1.16102 stop 08:40 1.16098 kept 1.16098 R 1.76 | 9/7 16:40 LONG A5 TWO first 16:30 1.16240 stop 16:15 1.16239 kept 1.16218 R 2.45 | 9/8 09:35 LONG KEPT_PATH | 9/8 10:05 SHORT A6 TWO first 09:50 1.16251 stop 09:40 1.16258 kept 1.16379 R 1.94 | 9/8 16:40 SHORT H3 TWO first 16:20 1.16274 stop 09:05 1.16359 kept 1.16379 R 0.68 refused | 9/8 16:55 SHORT A7 TWO first 16:50 1.16233 stop 16:20 1.16274 kept 1.16379 R 1.96.
- No NO_SECOND / TWO_WO_RESCUE rows. flag2xOB: 1.0 on all 7 deciding confirmations (= B-149 R1), fvg halves match B-149 too.

## Filed-trade table RECON62-B156 vs DEALS_RECON62-B153 (14/14 SAME)

- #2 sell 8/28 10:05 1.16466 2.38 | #3 buy 8/28 11:35 1.16467 2.38 | #4 buy 9/1 17:35 1.16024 2.04 | #5 sell 9/1 17:50 1.15987 2.04 | #6 buy 9/4 16:00 1.16019 0.57 | #7 sell 9/4 23:55 1.16129 0.57 | #8 buy 9/7 09:20 1.16138 2.49 | #9 sell 9/7 10:53 1.16201 2.49 | #10 buy 9/7 16:45 1.16264 3.9 | #11 sell 9/7 17:13 1.16315 3.9 | #12 sell 9/8 10:10 1.16205 1.95 | #13 buy 9/8 10:42 1.16102 1.95 | #14 sell 9/8 17:00 1.16220 1.95 | #15 buy 9/8 17:26 1.16275 1.95. Volumes identical (no balance drift: no P&L moved).

## K1 raw diff (.preB156 -> .B156K; git diff --no-index, literal)

- @@ :8 buffers 50 -> 51 (+ B156SL note). + decl `double g_buf2xOB[];` (buffer 50 comment) after g_bufB150Bear. + `SetIndexBuffer(50, g_buf2xOB, INDICATOR_CALCULATIONS);` after 49. + `ArraySetAsSeries(g_buf2xOB, false);` block. + `ArrayInitialize(g_buf2xOB, 0.0);` in reset. + `g_buf2xOB[target] = (g_s.isDoubleOB ? 1.0 : 0.0);` after the B150 writes (same barClosed gate, same target). 6 insertions + 1 modified line; nothing else touched.
- Literal hunks (from the 55-line diff output on file):
  `#property indicator_buffers 51  // [B156SL] Was 50. Added 50 (5m 2xOB flag). [B150PR] Was 48...`
  `+double g_buf2xOB[];   // [B156SL] Buffer 50. 5m 2xOB state per closed bar (1 = strong 2xOB, 0 = not).`
  `+   SetIndexBuffer(50, g_buf2xOB,     INDICATOR_CALCULATIONS);   // [B156SL]`
  `+   // [B156SL]` / `+   ArraySetAsSeries(g_buf2xOB, false);`
  `+         ArrayInitialize(g_buf2xOB, 0.0);   // [B156SL] new slots start empty`
  `+            g_buf2xOB[target] = (g_s.isDoubleOB ? 1.0 : 0.0);   // [B156SL] same variable B149OB2 printed as ltf2OB`

## K2 raw diff (.preB156 -> .B156K; git diff --no-index, literal)

- +2 FL_BUF_B156_2XOB 50 define lines. +38 SrjWalkOutward2Swing helper (confShift+1 walk, strict triple, strict protective side, first + strictly-beyond second, 500 bound, iHigh/iLow chart reads, false = NO_SECOND). S5 hunk EA:9887-9936: kept call captured to b156_keptOk; S5-only two-branch block (buffer 50 + buffer 4 at barShift; two = 2x==1.0 && fvg<0.5; W-O from iOpen(barShift-1) entry idiom; override slRef/slMode=2SWING; R from tpTarget/currentPrice; B156SL print every S5 confirmation); abort iff !keptOk && !proceed (kept body verbatim).
- Owned whitespace drift: FindNearestSwing EA:3053-3054 re-indented 6sp->3sp by the insert anchor (behaviour-identical; disclosed).
- Literal hunks (from the 120-line diff output on file):
  `+//--- [B156K] 5m 2xOB flag export (relay B-156 K1; next free index).` / `+#define FL_BUF_B156_2XOB         50`
  `+//--- [B156K] outward two-swing walk on finished chart swings (relay B-156 K2).` (+37 helper lines: confShift+1 origin, finished M>=confShift+1, strict triple, strict protective side, first + strictly-beyond second, 500 bound, chart highs/lows, false = NO_SECOND; `bool SrjWalkOutward2Swing(const int confShift, const ENUM_SRJ_DIR dir, const double entryPx, datetime &firstBT, double &firstPx, datetime &stopBT, double &stopPx)` ...)
  `-       if(!ComputeSlReference(barShift, g_dir, slRef, slMode, "S5"))` / `+       bool b156_keptOk = ComputeSlReference(barShift, g_dir, slRef, slMode, "S5");` (+48 S5-wrapper lines: reads, branch, walk, override, R, B156SL print) / `+       if(!b156_keptOk && !b156_proceed)`

(End of slice)
