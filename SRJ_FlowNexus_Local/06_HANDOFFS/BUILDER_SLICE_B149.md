# BUILDER SLICE B-149 - K3 spots, K4 diff, tables, B149OB2 rows, triples (RESTORED)

## K3 spots (located by text; SL_REF located only, never edited)
EA:6383 1-swing SL_REF print | EA:6523 + EA:6585 2-swing SL_REF prints
FlowLogic.mq5:1052 DecisionBlock | :1070-1072 export block, target = i-1
SRJ_Draw.mqh:42-45 BarClosed(i) = i < rates_total-1 (printed time[i] IS the closed bar)
HTF RunAll FlowLogic.mq5:1446 (once post-loop; e.* = latest-as-of-tick, not per-bar-final)
Insertion anchor FlowLogic.mq5:1437-1444 (in-loop, after all per-bar passes)
No per-bar strong flag exists (doStrongFlip BiasEngine-local) - omitted
HTF names: g_htfHighTF/H1/Mid/H1/Low/M15 defaults PERIOD_H4/H1/M15 (FlowLogic.mq5:249-251/508-510)

## K4 diff (+20 lines vs .preB149, pure addition; edited src 606063E4; trial ex5 7AE02D9F; .B149D kept)
+ // [B149OB2] comment block (reads-only, ungated like B96, prevCalc>0 skips first pass)
+ if(barClosed && prevCalc > 0)
+ PrintFormat("[SRJ-IND] B149OB2 sym=%s bar=%s ltf2OB=%d ltfBull=%d ltfBear=%d ..." + 3x HTF (EnumToString timeframe + 2OB/bull/bear)
K5 compile: 0 errors, 0 warnings, binary fresh. EA EX5 AB159DE7 untouched.

## T2 filed-trade table RECON62-B149D vs DEALS (14/14 identical side/date/time/price; vols identical)
2 sell 8/28 10:05 1.16466 | 3 buy 8/28 11:35 1.16467 | 4 buy 9/1 17:35 1.16024 | 5 sell 9/1 17:50 1.15987 | 6 buy 9/4 16:00 1.16019 | 7 sell 9/4 23:55 1.16129 | 8 buy 9/7 09:20 1.16138 | 9 sell 9/7 10:53 1.16201 | 10 buy 9/7 16:45 1.16264 | 11 sell 9/7 17:13 1.16315 | 12 sell 9/8 10:10 1.16205 | 13 buy 9/8 10:42 1.16102 | 14 sell 9/8 17:00 1.16220 | 15 buy 9/8 17:26 1.16275
B149OB2 rows 3168 (first 2026.08.25 23:55, last 2026.09.09 23:50). DONE PASSED 06:02:32.

## T3 filed-trade table JUNE0525-B149D vs DEALS (10/10 identical; vols identical)
2 buy 5/27 15:35 159.344 | 3 sell 5/27 20:08 159.535 | 4 buy 6/3 09:10 159.932 | 5 sell 6/3 09:59 159.983 | 6 sell 6/4 09:55 159.868 | 7 buy 6/4 10:40 159.920 | 8 buy 6/5 16:15 160.065 | 9 sell 6/5 19:16 160.298 | 10 buy 6/11 14:40 160.530 | 11 sell 6/11 15:23 160.588
B149OB2 rows 4320 (first 2026.05.22 23:55, last 2026.06.12 23:50). DONE PASSED 06:26:22 (after busy-refusal repair: leftover 7000 stopped, relaunched).
T4 restore verified: 956BF3E3/27B5F272/AB159DE7/585093BF/AA4EA14B + Charts 20/0/0; no terminal64.

## R1 B149OB2 confirmation rows (one each; LTF graded, HTF beside)
A1 10:00: 2OB=1 0/1 | H4 1, H1 1, M15 1
A2 17:30: 2OB=1 0/0 | H4 0, H1 1, M15 1
A3 15:55: 2OB=1 0/0 | H4 1, H1 1, M15 1
A4 09:15: 2OB=1 0/1 | H4 1, H1 0, M15 1
A5 16:40: 2OB=1 0/0 | H4 0, H1 1, M15 1
A6 10:05: 2OB=1 1/1 | H4 1, H1 1, M15 1
A7 16:55: 2OB=1 0/0 | H4 1, H1 1, M15 0
B2 16:10: 2OB=1 0/0 | H4 1, H1 1, M15 1
B3 14:35: 2OB=1 0/0 | H4 1, H1 1, M15 0
C-06-03 09:05: 2OB=0 0/1 | H4 1, H1 0, M15 1
(C-06-04 beside 09:50: 2OB=1 0/0)

## R3/R4 swing triples (log jln; all strict, no tolerance)
A1 06:30 1.16508 (09:40/09:50) | A3 15:45 1.15902 j46504 (15:40/15:50) | A4 09:00 1.16103 j49763 (08:55/09:05) | A5 16:15 1.16239 j52379 (16:10/16:20) | A6 09:50 1.16251 j55235 (09:45/09:55) | A7 16:20 1.16274 (B-141 triple) | B2 16:00 159.726 j117288 (15:55/16:05)
R recomputes (entry open): A1 6.80, A3 2.45, A4 2.03, A5 2.45, A6 2.24, A7 1.96, B2 1.99. Zero flips (floor 1.0 inclusive).

(End of slice)
