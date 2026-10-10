# BUILDER SLICE B-151 - R1 lines, R2 table, R3 rows, R4 fact, SHA sanity (STOP, nothing applied)

## R1 verdict lines (Tester/logs/20261010.log:line, re-confirmed present; trade side graded)
290363 B150PR EURUSD 2026.08.28 10:00 bull=1 bear=1 (A1 SHORT MET)
305459 B150PR EURUSD 2026.09.01 17:30 bull=1 (A2 LONG MET)
321027 B150PR EURUSD 2026.09.04 15:55 bull=1 (A3 LONG MET)
324334 B150PR EURUSD 2026.09.07 09:15 bull=1 (A4 LONG MET)
327286 B150PR EURUSD 2026.09.07 16:40 bull=1 (A5 LONG MET)
329484 B150PR EURUSD 2026.09.08 10:05 bear=1 (A6 SHORT MET)
332020 B150PR EURUSD 2026.09.08 16:55 bear=1 (A7 SHORT MET)
460364 B150PR USDJPY 2026.05.27 15:30 bull=1 (C-05-27 LONG beside)
484929 B150PR USDJPY 2026.06.03 09:05 bull=1 (C-06-03 LONG MET)
490911 B150PR USDJPY 2026.06.04 09:50 bear=0 none (C-06-04 SHORT NOT MET)
495434 B150PR USDJPY 2026.06.05 16:10 bull=1 (B2 LONG MET)
516345 B150PR USDJPY 2026.06.11 14:35 bull=1 (B3 LONG MET)
R1: 12/12 verdicts as required. Full id sets in B-150 slice K4.

## R2 table (artifact = XOBDIAG incrementals Oct-8; alive @barT C-1; touch scanned on kept UJBARMAP same-run rows)
ID 65 bull C=5/27: zone 156.672-156.773 startT 5/08 22:55 promoT 5/11 04:10 | alive valid=1/1/1 NA lvl 156.7225 @15:25 | touch: promo pre-coverage (5/22), NOT IN ROWS
ID 78 bull: 156.578-156.584 start 5/11 00:25 promo 5/11 00:35 | alive 1/1/1 | pre-coverage, NOT IN ROWS
ID 212 bull: 157.028-157.060 start 5/11 18:50 promo 5/11 19:20 | alive 1/1/1 | pre-coverage, NOT IN ROWS
ID 256 bull: 157.172-157.178 start 5/12 01:10 promo 5/12 01:25 | alive 1/1/1 | pre-coverage, NOT IN ROWS
ID 261 bull: 157.184-157.192 start 5/12 02:00 promo 5/12 03:00 | alive 1/1/1 | pre-coverage, NOT IN ROWS
ID 313 bull: 157.331-157.497 start 5/12 09:30 promo 5/12 10:00 | alive 1/1/1 | pre-coverage, NOT IN ROWS
ID 414 bull: 157.517-157.589 start 5/13 00:15 promo 5/13 01:10 | alive 1/1/1 | pre-coverage, NOT IN ROWS
ID 447 bull: 157.562-157.648 start 5/13 04:45 promo 5/13 06:20 | alive 1/1/1 | pre-coverage, NOT IN ROWS
ID 449 bull: 157.599-157.654 start 5/13 05:00 promo 5/13 05:15 | alive 1/1/1 | pre-coverage, NOT IN ROWS
ID 460 bull: 157.645-157.660 start 5/13 06:40 promo 5/13 07:05 | alive 1/1/1 | pre-coverage, NOT IN ROWS
ID 696 bull: 157.568-158.167 start 5/14 16:40 promo 5/14 18:05 | alive 1/1/1 | pre-coverage, NOT IN ROWS
ID 714 bull: 158.107-158.142 start 5/14 19:15 promo 5/14 19:30 | alive 1/1/1 | pre-coverage, NOT IN ROWS
ID 305 bull C=8/28: 1.15201-1.15225 start 8/13 10:30 promo 8/13 10:45 | alive 1/1/1 @09:55 | pre-coverage (8/25), NOT IN ROWS
ID 405 bull: 1.15248-1.15263 start 8/14 00:10 promo 8/14 00:25 | alive 1/1/1 | pre-coverage, NOT IN ROWS
ID 435 bull: 1.15357-1.15373 start 8/14 04:40 promo 8/14 06:30 | alive 1/1/1 | pre-coverage, NOT IN ROWS
ID 474 bull: 1.15441-1.15473 start 8/14 10:20 promo 8/14 11:40 | alive 1/1/1 | pre-coverage, NOT IN ROWS
ID 484 bull: 1.15504-1.15532 start 8/14 11:30 promo 8/14 11:45 | alive 1/1/1 | pre-coverage, NOT IN ROWS
ID 1389 bear C=8/28: 1.17072-1.17107 start 8/21 13:35 promo 8/21 13:55 | alive 1/1/1 | pre-coverage, NOT IN ROWS
ID 1481 bear: 1.16836-1.16871 start 8/24 03:20 promo 8/24 04:10 | alive 1/1/1 | pre-coverage (8/24 < 8/25), NOT IN ROWS
ID 1484 bear: 1.16822-1.16855 start 8/24 03:55 promo 8/24 04:20 | alive 1/1/1 | pre-coverage, NOT IN ROWS
ID 1516 bear: 1.16800-1.16817 start 8/24 08:15 promo 8/24 08:45 | alive 1/1/1 | pre-coverage, NOT IN ROWS
ID 2149 bear C=8/28: 1.16492-1.16507 start 8/28 06:25 promo 8/28 06:40 | alive 1/1/1 @09:55 | in-coverage 41 bars, 0 hits (B-142 INPLAYCOMMIT hits=0 corroborates)
ID 2281 bull C=9/1: 1.15801-1.15820 start 8/31 01:10 promo 8/31 01:40 | alive 1/1/1 @17:25 | in-coverage 479 bars, 0 hits
ID 2706 bull C=9/4: 1.15781-1.15811 start 9/02 16:10 promo 9/02 16:20 | alive 1/1/1 @15:50 | in-coverage 572 bars, 0 hits
ID 2510 bull C=6/3: 159.141-159.180 start 5/29 18:30 promo 5/29 19:10 | alive 1/1/1 @09:00 | post-promo min low 159.181 vs hi 159.180 (0.1 pip miss); 64 pre-promo overlaps exist -> NAMED STOP INSTANCE
ID 3491 bull C=6/11: 159.942-159.982 start 6/08 16:20 promo 6/08 16:50 | alive 1/1/1 @14:30 | in-coverage 838 bars, 0 hits
ID 3834 bull C=6/11: 160.399-160.420 start 6/10 17:20 promo 6/10 18:00 | alive 1/1/1 @14:30 | in-coverage 248 bars, min low 160.425 vs hi 160.420
R2 verdict: no extra has a quotable post-promo touch on kept rows; six checkable prove absent -> STOP. Alt reading: live numbering may diverge from Oct-8 diagnostic numbering (undecidable offline; export prints no live zone/promo per id).

## R3 2566 (B-147 has it, B150PR lacks it)
Artifact: bull zone 159.382-159.407 start 6/01 01:50 promo 6/01 03:15, valid=1 active=1 promoted=1 @barT 09:00 level 159.3945 (alive, not the issue). Kept rows: no overlap after promotion through 09:05 (nor 09:10 entry bar). FOUND (touch-bound, B-147 row unreproducible on kept evidence). C-06-03 stays MET on 8 other ids. No gate.

## R4 window fact
B150PR rows span 2025.01.02 00:10 -> 2026.09.09 23:50 (RECON62-S1) and 2025.01.02 00:10 -> 2026.06.12 23:50 (JUNE-S1): ~20 months of replay; B-147's scans saw 2796 EU + 3920 UJ in-window log bars only. The replay side saw more history on every row.

## SHA sanity (nothing applied)
EA 585093BF/AB159DE7; FlowLogic 956BF3E3/27B5F272; OrderblockMgr 5D14FCE2; no terminal64. No .preB151 (never created); .B150K/.preB150 untouched (B-150).

(End of slice)
