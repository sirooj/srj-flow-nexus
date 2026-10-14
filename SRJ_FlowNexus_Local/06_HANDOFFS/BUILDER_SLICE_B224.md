# BUILDER SLICE B-224 - raw rows (in-play census + separator; MEASURED)
Base: builder/B-224 cut at f77b4b1 (= B-223 head). Verdict MEASURED (F3-INPLAY 1 of 6; 30-row census, reviews filed, DOES NOT SEPARATE).
## Start gate
```
log-1 f77b4b12f563d531c9832d92dc80deeebb0e8d48 (backup exact; B-224 cut here; rev-parse HEAD at cut + before commit).
diff f77b4b1 EMPTY on pointer + RESULT_B223 + SLICE_B223 + INDEX_B223 + SEPARATOR_B223 + SETUPS_*-B222K + DEALS_*-B222K + EU_FIX_PLAN + CONTEXT + HANDOFF + LESSONS + READ_MAP + both skills. Status 824 (dirty tree as B-223 = ACCOUNTED).
Disk SHAs: kept EA b4db21c5/61829f05; .B222K same; .preB223 7c392767/83ac8bde; tini c725e437. CUT_B222K pair present (163994231/602470995 B). Ledger ^1370=1 ^1371=0 pre. No terminal64. Python 3.13.16 (py launcher absent).
Gaps ACCOUNTED: (g1) no A3 EU row / 09-04 EU day file (A3 graded from the cut); (g2) register copies current (source 1440933b, all six headers match); (g3) pointer State header fixed in X.
Pins: rules/47 count 1 ALREADY_BANKED (cite f77b4b1). Spec 3.3 L22-26; rules/17 L3+L6; rules/18 L6+L12; rules/21 L2 (retrace = in play); rules/43 L12 (28Jul words); rules/47 (7Sep words). F3 L49-52 (28Jul marked removed).
```
## Part R (job_r_b224.py, one pass per CUT_B222K; 5 script fixes with recounts)
```
Index counts EU: GF 30705 MID 2632 ZLP 2632 ZLK 2543 B96 9606 ZP/IPC 970 FIRE 537 B201 785 HZ 64 TPE 45 A6 22 DEAL 44 MT 22. RECON: B96 1049 ZP/IPC 141 FIRE 71 B96... (BORN 95/855, CONF/FRS indexed phase 3).
R1: A entries SAME every cell both runs. Exits: A1 11:35 1.16467 vs owed 1.16464 (+1 fill); A2 EU 17:51 1.15975 vs owed 17:50 1.15987 (machine next-bar; RECON 17:50 1.15987 SAME); A3 23:55 1.16129 SAME; A4 exits per reg row 4; A5 TP unhit exit 21:25 stop (EU) / 17:13 (RECON window); A6 10:42 1.16102 SAME; A7 17:26 1.16275 (+1 over 1.16274 note). P3 09:45 1.15256 / 10:00 1.15195 SAME. C rows: 4Sep10:40/1Sep15:30/27Aug/28Aug16:25/8Sep16:45 ABSENT; 10Jun/25Jun/22Jul FIRE KNOWN OPEN FIRE (F1/F2 parked); 28Jul ABSENT (GONE trial).
R2 INPLAY_B224.csv 30 rows (EU 22 + RECON 8): zones INPLAYCOMMIT (formation B182MID else promoT); HZ road; B178ZL kill; TP_ELECT stop; BEYOND-STOP by price order only; candles B196BAR promoT-to-confirm first-enter else NEVER-REACHED; FVG opp-touch via seed candle. Fixes: ohlc tuple order (NEVER-bug recount), A6FIRED class= prefix, FIRE+fill same-bar, session-scoped FIRE keys, date-scoped BORN/CONF/B201.
R3 reviews: A 5066 B (8 takes: P3+A1+A2+A4+A5+A6+A7 + trader list), M1 2263 B (must-never 3 first), M2 8197 B (11 machine). A2 (a2): 17:30 o=1.16010 h=1.16031 l=1.16002 c=1.16021 (JL 12062115); Monthly-VWAP value NOT PRINTED (WINLINE, only FREEZE val=- rows). A6 (a): retest NOT PRINTED (BORN; no BORN row in CUT) - review-sheet gap on his take, named. Each file under 20000 B.
```
## Part S (SEPARATOR_B224.csv 30 rows; from INPLAY rows only)
```
T-REACH = REACHED + STANDING + NO. HIS-KEEP 10/13 PASS (A1 EU+RECON NEVER FAIL; A2 EU NEVER FAIL / RECON PASS; A3-A7 PASS both). P3 PASS (REACHED 09:00 STANDING NO). MUST-NEVER 10Jun/25Jun FAIL = wanted, 22Jul OTHER-GATE (F1/F2). F3-NAMED 6/6 FAIL (4Jun/29Jun/15Jul/17Aug/22Sep/8Oct: every zone BEYOND-STOP; 29Jun + 22Sep also REACHED). MACHINE rest listed. Overall DOES NOT SEPARATE. Halves: reach+standing fails A1x2/A2-EU (runtime tags B196BAR + INPLAYCOMMIT + B178ZL); zone_vs_stop fails A2-EU only (runtime tags TP_ELECT + INPLAYCOMMIT). No Part K in this relay.
```
## Part X records
```
Pointer State B-224 + Lane F3 1/6 + Next trial gate (4487 B/35 lines). HANDOFF 3a F3 row + 3b drop B-214 add B-224 keep10 (112 chars). CONTEXT sec5 B-224 + sec4 F3 line. FIXPLAN F3 State B-224. Ledger 1371 (^1371=1). LESSONS +1 B-224-NEVER-REACHED-RIDES (141 chars), B-71 folded (19871 B). Register no edit (copies current 1440933b).
```
## Size gate (caps pointer 6000/35, result 12000, slice 20000/600)
```
pointer 4487/35 PASS; result 4566/15 PASS; slice 4584/36 PASS (this file); CONTEXT 8164 PASS; HANDOFF 4937 PASS; LESSONS 19871 PASS; FIXPLAN 12305 PASS; SEPARATOR_B224 3140 PASS; INPLAY_B224 + REVIEW x3 (F2 filed, no ROWPACK on MEASURED) PASS; READ_MAP rewritten. Strategy max + relay + READ max per READ_MAP.
```
## Timing + final disk + housekeeping
```
Wall: gate + reads ~15m est; R script ~25m (index + 5 fixes with recounts); reviews ~10m; S ~5m; records ~10m est; commit/push follow.
Final disk: no edit, no compile, no runs (kept b4db21c5/61829f05). CUT_*-B222K kept baseline. tini c725e437. No terminal64.
Housekeeping: none (no new cuts; delete nothing).
```
(End of slice)
