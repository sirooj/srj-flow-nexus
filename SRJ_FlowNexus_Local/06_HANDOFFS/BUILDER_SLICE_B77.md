# BUILDER SLICE B-77 - raw R1 rows, raw R2 candidate rows per row, raw R3 scans, raw R5 code (records only; kept EA 6CFE8F8B; diag 4C6D560E; no edit/compile/run)

Conventions: 1-based lines. j37 77F454AB (kept); j38 6019A461 (kept); j39 408E5073 (diag 4C6D560E); j40 1D968931 (diag). Ranks per SLICE_B76 line 3 (FOMC-POC 0 .. Daily-VWAP 11); tier = rank/2. R = |target - entry| / |entry - stop| on booked TP_ELECT/A6FIRED values; PASS iff R >= 1.0. T3: entry-line row = latest retest row at/before confirmation; tier key = lowest rank in that row; own-source = every line in that row; session/pool stay in; Y/Q/F values NO ROW unless TPCENSUS best=.

## R1 RAW ROWS (entry-line row + key + tier + SAME/DIFFERENT vs T0 machine-anchor key vs T1 max-tier key)

- A1 (j37 kept): row 09:55 j37:15486 hits=1 Daily-VWAP:r11:dS; lines {Daily-VWAP r11}; key Daily-VWAP tier 5. Vs T0 (Daily-VWAP t5) SAME; vs T1 (max 5) SAME.
- A2 (j37): row 17:30 j37:29717 hits=2 Daily-VWAP:r11:dL Monthly-VWAP:r7:dL; key Monthly-VWAP tier 3 (lowest rank 7). Vs T0 (Monthly-VWAP t3) SAME; vs T1 (max 5) DIFFERENT.
- A3 (j37): row 15:55 j37:44340 hits=2 Weekly-VWAP:r9:dS Yearly-POC:r2:dL; key Yearly-POC tier 1 (lowest rank 2). Vs T0 (Yearly-POC t1) SAME; vs T1 (max 4) DIFFERENT.
- A4 (j37): row 09:15 j37:47442 hits=2 Daily-POC:r10:dL Weekly-POC:r8:dL; key Weekly-POC tier 4 (lowest rank 8). Vs T0 (Weekly-POC t4) SAME; vs T1 (max 5) DIFFERENT.
- A5 (j37): row 16:15 j37:49429 hits=2 Daily-POC:r10:dL Weekly-POC:r8:dL; key Weekly-POC tier 4. Vs T0 SAME; vs T1 (max 5) DIFFERENT.
- A6 (j37): row 10:05 j37:52286 hits=1 Monthly-POC:r6:dS; key Monthly-POC tier 3. Vs T0 SAME; vs T1 (3) SAME.
- A7 (j37): row 16:55 j37:54724 hits=1 Monthly-POC:r6:dS; key Monthly-POC tier 3. Vs T0 SAME; vs T1 SAME.
- B3 (j38 kept): row 14:35 j38:59124 hits=2 Daily-POC:r10:dL Daily-VWAP:r11:dL; key Daily-POC tier 5 (lowest rank 10). Vs T0 (Daily-POC t5) SAME; vs T1 (max 5) SAME.
- C3 (j38): row 09:05 j38:29581 hits=1 Daily-VWAP:r11:dL; key Daily-VWAP tier 5. Vs T0 SAME; vs T1 SAME.
- B2 (j40 diag): row 16:00 j40:32886 hits=6 all M/W/D lines; key Monthly-POC tier 3 (lowest rank 6). Vs T0 (Monthly-POC t3) SAME; vs T1 (max 5) DIFFERENT.
- F1a (j38 kept): row 14:20 j38:22470 hits=3 Daily-POC:r10:dL Weekly-POC:r8:dL Monthly-POC:r6:dL; key Monthly-POC tier 3. Vs T0 SAME; vs T1 (max 5) DIFFERENT.
- F1b (j40 diag): row 14:20 j40:21558 hits=3 same three; key Monthly-POC tier 3. Vs T0 SAME; vs T1 DIFFERENT.
- F2 (j39 diag): row 17:00 j39:11677 hits=1 Daily-POC:r10:dS; key Daily-POC tier 5. Vs T0 (Weekly-VWAP t4) DIFFERENT; vs T1 (max 5) SAME.
- F2k (j37 kept): row 17:00 j37:12710 hits=1 Daily-POC:r10:dS; key Daily-POC tier 5. Vs T0 DIFFERENT; vs T1 SAME.
- Counts: vs T0 SAME 12 / DIFFERENT 2 (F2, F2k); vs T1 SAME 7 (A1,A6,A7,B3,C3,F2,F2k) / DIFFERENT 7 (A2,A3,A4,A5,B2,F1a,F1b).

## R2 RAW CANDIDATE ROWS (decision-pass rows reused from B-76; values beside)

- A1 (j37): UJBARMAP j37:15531 (mpoc 1.15424 mvwap 1.15864 wpoc 1.16523 wvwap 1.16549 dpoc 1.16532 dvwap 1.16490); TPCENSUS #86/#87 j37:15615/15732 (winner YNYL 1.16364, ref 1.16466); TP_ELECT j37:15787 entry 1.16466 sl 1.16508; A6FIRED j37:15790 tp 1.16364 r 2.43. T3: key D-VWAP t5, own {D-VWAP}; POI in-dir (SHORT): M-POC 1042, M-VWAP 602; session-best = winner YNYL (session) 102 exact. Winner YNYL 1.16364, 102pts, R = 102/42 = 2.43 PASS.
- A2 (j37): UJBARMAP j37:29596 (all six below ref 1.16022); TPCENSUS #161 j37:29847 (winner Yearly-POC 1.16077, ref 1.16022); TP_ELECT j37:29882 entry 1.16022 sl 1.15975; A6FIRED j37:29885 tp 1.16077 r 1.17. T3: key M-VWAP t3, own {D-VWAP,M-VWAP}; POI: Y-POC value printed (best=) t1<=3 not-own in-dir 55pts; UJBARMAP six wrong-dir. Winner Yearly-POC 1.16077, 55pts, R = 55/47 = 1.17 PASS.
- A3 (j37): UJBARMAP j37:44195 (mvwap 1.16024 wpoc 1.15935 wvwap 1.16019 dpoc 1.16284 dvwap 1.16174 mpoc 1.15935); TPCENSUS #216/#217 j37:44322/44475 (winner YLOH best=1.16302, ref 1.16018); TP_ELECT j37:44604 entry 1.16018 sl 1.15847; A6FIRED j37:44607 tp 1.16302 r 1.66. T3: key Y-POC t1, own {W-VWAP,Y-POC}; POI tier<=1 printed: none. Winner YLOH 1.16302 = his London high, 284pts, R = 284/171 = 1.66 PASS.
- A4 (j37): UJBARMAP j37:47287 (max 1.16127 below ref 1.16135); TPCENSUS #220/#221 j37:47423/47585 (winner YASH 1.16200, ref 1.16135); TP_ELECT j37:47682 entry 1.16135 sl 1.16098; A6FIRED j37:47685 tp 1.16200 r 1.76. T3: key W-POC t4, own {D-POC,W-POC}; POI printed none in-dir. Winner YASH 1.16200, 65pts, R = 65/37 = 1.76 PASS (his TP 1.16201 beside it).
- A5 (j37): UJBARMAP j37:50138 (max 1.16266? o=1.16249 h=1.16266 l=1.16249 c=1.16260; POI max wpoc/dpocc 1.16249 below ref 1.16261); TPCENSUS #231/#232 j37:50276/50436 (winner Yearly-VWAP 1.16315, ref 1.16261); TP_ELECT j37:50511 entry 1.16261 sl 1.16238; A6FIRED j37:50514 tp 1.16315 r 2.34. T3: key W-POC t4, own {D-POC,W-POC}; POI none in-dir. Winner Yearly-VWAP 1.16315, 54pts, R = 54/23 = 2.34 PASS.
- A6 (j37): UJBARMAP j37:52119 (mvwap 1.16072 in-dir SHORT); TPCENSUS #234/#235 j37:52264/52451 (winner YLOL 1.16102, ref 1.16205); TP_ELECT j37:52489 entry 1.16205 sl 1.16258; A6FIRED j37:52492 tp 1.16102 r 1.94. T3: key M-POC t3, own {M-POC}; POI: M-VWAP 133pts; session-best = winner YLOL (session) 103 exact. Winner YLOL 1.16102, 103pts, R = 103/53 = 1.94 PASS.
- A7 (j37): UJBARMAP j37:54559 (mvwap 1.16077 dpoc 1.16118 in-dir SHORT); TPCENSUS #242/#243 j37:54704/54877 (winner Yearly-POC 1.16114, ref 1.16220); TP_ELECT j37:54925 entry 1.16220 sl 1.16274; A6FIRED j37:54928 tp 1.16114 r 1.96. T3: key M-POC t3, own {M-POC}; POI: M-VWAP 143, Y-POC value printed (best=) t1<=3 not-own 106pts. Winner Yearly-POC 1.16114 = his Y-POC, 106pts, R = 106/54 = 1.96 PASS.
- B3 (j38): UJBARMAP j38:58932 (dpoc 160.523 1pt under ref 160.524, rest below); TPCENSUS #187/#188 j38:59107/59326 (winner YLOH 160.587, ref 160.524); TP_ELECT j38:59436 entry 160.524 sl 160.501; A6FIRED j38:59439 tp 160.587 r 2.74. T3: key D-POC t5, own {D-POC,D-VWAP}; POI printed none in-dir (strict). Winner YLOH 160.587, 63pts, R = 63/23 = 2.74 PASS (no named target on record).
- C3 (j38): UJBARMAP j38:29435 (all below ref 159.929); TPCENSUS #97/#98 j38:29562/29715 (winner YASH 159.983, ref 159.929); TP_ELECT j38:29770 entry 159.929 sl 159.889; A6FIRED j38:29773 tp 159.983 r 1.35. T3: key D-VWAP t5, own {D-VWAP}; POI none in-dir. Winner YASH 159.983, 54pts, R = 54/40 = 1.35 PASS.
- B2 (j40): UJBARMAP j40:32943 (all below ref 160.059); TPCENSUS #82/#83 j40:33087/33265 (winner NONE best=160.723 ref 160.059, admitted PDH:15 NYH:203 both nearer-than-664 hence wrong-direction); TP_ELECT j40:33497 entry 160.059 sl 159.598; A6FIRED j40:33500 tp 160.723 r 1.44. T3: key M-POC t3, own all six; printed POI none eligible; pool best 160.723 eligible. Winner 160.723 = his target, 664pts, R = 664/461 = 1.44 PASS.
- F1a (j38): UJBARMAP j38:24578 (all below ref 159.771); TPCENSUS #72 j38:24702 (winner NONE best=160.723 admitted EMPTY); UJ1R POLL j38:24714 entry 159.771 sl 159.678 tp 160.723 R=10.24 PASS; no TP_ELECT (died PREBIND_FAIL j38:24735). T3: key M-POC t3, own {D-POC,W-POC,M-POC}; nearest printed = pool best 160.723, 952pts; R NO ROW (no booked entry/stop); machine poll R10.24 PASS, unbooked.
- F1b (j40): UJBARMAP j40:23666 (same); TPCENSUS #65/#66 j40:23790/23948 (winner NONE best=160.723 admitted EMPTY); TP_ELECT j40:24045 entry 159.771 sl 159.734 tp 160.723 R=25.73; A6FIRED j40:24048. T3: same key/own; winner 160.723, 952pts, R = 952/37 = 25.73 PASS booked.
- F2 (j39): UJBARMAP j39:11579 (dvwap 1.16498 in-dir SHORT; dpoc own; rest above); TPCENSUS #60/#61 j39:11660/11779 (winner Yearly-VWAP 1.16322, ref 1.16524, no D-VWAP admitted); TP_ELECT j39:11913 entry 1.16524 sl 1.16598; A6FIRED j39:11916 tp 1.16322 r 2.73. T3: key D-POC t5, own {D-POC}; POI: D-VWAP 26pts eligible (t5<=5, not own, in-dir, outside zone 1891). Winner D-VWAP 1.16498, 26pts, R = 26/74 = 0.35 REFUSE (= his nearest-below-1R words).
- F2k (j37): UJBARMAP j37:12612 (same values); TPCENSUS #71 j37:12693 (winner Yearly-VWAP 1.16322, ref 1.16524); UJ1R POLL j37:12705 R1.58; no TP_ELECT (died j37:12731). T3: same key/own; winner D-VWAP 1.16498, 26pts, R = 26/74 = 0.35 REFUSE on 1.16524/1.16598 (B-76 0.4 values; no own TP_ELECT).

## R3 RAW SCANS (body closes through the line, entry-line-row bar → confirmation candle; pre-setup = count only; validity never re-decided)

- A1: window 09:55->10:00 = bar 10:00 only (o=1.16482 c=1.16467, both above YNYL 1.16364): 0 closes through. Winner session (machine taken-mask); nearer tier-outs none (key t5 admits all tiers).
- A2: row=conf 17:30 -> empty. Winner Y-POC per-bar history NO ROW.
- A3: row=conf 15:55 -> empty. Pre-setup counts beside: M-VWAP 186 closes-above (first j37:40107 00:00 c=1.16199 vs 1.15993); D-POC 45 over + D-VWAP 74 over (first j37:40117 00:10).
- A4: row=conf -> empty. Winner session (machine mask).
- A5: row 16:15 -> conf 16:40, winner Yearly-VWAP per-bar NO ROW -> scan impossible, NO ROW. Nearer tier-outs: none.
- A6: row=conf -> empty. Winner session.
- A7: row=conf -> empty. Nearer tier-out D-POC 102pts: window empty; pre-setup 92 closes-below (first j37:51190 01:40 c=1.16247 vs 1.16248).
- B3: row=conf -> empty. Winner session.
- C3: row=conf -> empty. Winner session.
- B2: window 16:00->16:10, 2 UJBARMAP bars, 0 closes through 160.723 (closes ~160.0-160.06, all one side).
- F1a/F1b: window 14:20->15:30, 14 bars each, 0 closes through 160.723.
- F2/F2k: T3 REFUSE, no winner; nearest D-VWAP window empty (row=conf); pre-setup 106 closes-below contemporary dvwap pre-17:00 (first j39:8657 00:00 c=1.16467 vs 1.16487); his no-close-through words cover 17:00-17:10 (skill:147).
- A1 window correction: entry row 09:55 -> conf 10:00 = 1 bar (10:00): YNYL session, no through as printed above.

## R5 RAW CODE (kept EA 6CFE8F8B; SAME/DIFFERENT on .B69DIAG)

- Anchor set at seed (kept EA:8297-8300; SAME on .B69DIAG :8320-8322, verified B-76, both SHAs unchanged since): 8297: s1g_legDir = pr.isLong ? 1 : -1; 8298: g_s2_seedShift = barShift; 8299: g_anchorLine = pr.topLine; 8300-8303: (carried-side comment).
- RETESTBOOK build (kept EA:2293-2308; SAME on .B69DIAG :2296-2311, verified this turn): 2293: { 2294: double L; 2295: if(!ReadBuf1(g_hPoi, k, L, barShift)) continue; 2296: if(L == EMPTY_VALUE || L <= 0.0) continue; 2297-2298: (longHit/shortHit geometry) 2299: if(!longHit && !shortHit) continue; 2300-2303: (hits string build with rank) 2304: } 2305: PrintFormat("[SRJ-EA] RETESTBOOK bar=%s hits=%d %s", ...) 2306-2308: (args).
- Answer: NO. The RETESTBOOK row is a fresh per-bar poll printed and discarded (hits string is local to the pass); no line list is stored. The target race keys off the carried seed anchor g_anchorLine (kept EA:2660). F2 proves the divergence on rows (race key W-VWAP vs 17:00 row D-POC j39:11677).

(End of slice)
