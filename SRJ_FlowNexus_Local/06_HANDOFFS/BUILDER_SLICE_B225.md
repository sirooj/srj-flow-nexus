# BUILDER SLICE B-225 - raw rows (one zone per take + separator; MEASURED)
Base: builder/B-225 cut at 6ec2647 (= B-224 head). Verdict MEASURED (F3-INPLAY 2 of 6; 49+14+14 rows, DOES NOT SEPARATE).
## Start gate
```
log-1 6ec26478e63060ff9eb890bd84afa5d3a429d828 (backup exact; B-225 cut here; rev-parse HEAD at cut + before commit).
diff 6ec2647 EMPTY on pointer + RESULT_B224 + SLICE_B224 + INPLAY_B224 + SEPARATOR_B224 + REVIEW_EU_B224_A/M1/M2 + EU_FIX_PLAN + CONTEXT + HANDOFF + LESSONS + READ_MAP + both skills. Status 827 (dirty tree as B-224 = ACCOUNTED).
Disk SHAs: kept EA b4db21c5/61829f05; .B222K same; .preB223 7c392767/83ac8bde; tini c725e437. CUT_B222K pair present (163994231/602470995 B). Ledger ^1371=1 ^1372=0 pre. No terminal64. Python 3.13.16 (py launcher absent).
Carried k1 (pointer State still B-219: fixed in X), k2 (SEPARATOR_B224 25Jun/22Jul swapped: B225 uses 25Jun OTHER-GATE + 22Jul FAIL=wanted, B224 file left filed), k3 (Lane trial line withdrawn: no Part K without SEPARATES).
DEALS counts 44 (EU) / 16 (RECON) on B222K + B206T + B218K reads.
```
## Part R (job_r_b225.py, one pass per CUT_B222K; 2 script fixes with recounts)
```
IDX RECON62-B222K GF29158 MID477 ZLK441 OG11169 B96 1049 XP141 ZP141 IPC141 FIRE71 HZ16 TPE16 DEAL16 MT8.
IDX EU0525TD-B222K GF30705 MID2632 ZLK2543 OG59111 B96 9606 XP939 ZP970 IPC970 FIRE537 HZ64 TPE45 DEAL44 MT22.
R1 gate-read IPC per take (Y row; ZP/XP/OG agree except noted):
A1 both runs: IPC 1.16492-1.16507 promo 06:40 (RC9594391/EU11981602); ZP same; XP id2149/13629 promo06:40; OG doc 2109/13589 1.16505-1.16537 f01:00; HZ PASS rt09:55.
A2 RECON: IPC 1.15975-1.16013 promo17:25 (9627365); ZP/XP2549/OG2549 same object f16:45; HZ PASS rt16:45.
A2 EU: IPC 1.15902-1.15926 promo16:40 (12057419, bar17:00); ZP/XP NONE at 17:30; OG doc 14029 1.15975-1.16013 f16:45; HZ PASS rt16:50.
10Jun: IPC 1.15361-1.15401 (10670458); OG doc 3860 1.15399-1.15474. 18Jun P3: IPC 1.15089-1.15112 (10775282). 25Jun: IPC 1.13524-1.13587 (10869428).
22Jul: IPC 1.14146-1.14194 (11241071); ZP/XP8925 agree. 4Jun: IPC 1.15967-1.15972 (10607073). 29Jun: IPC 1.13928-1.13952 (10903120, ZP/XP/OG6088 agree).
15Jul: IPC 1.14042-1.14070 (11136537); OG doc 8018 differs. 17Aug: IPC 1.15784-1.15796 (11699155). 22Sep: IPC 1.14555-1.14602 (12490850).
8Oct: IPC 1.12058-1.12075 (12896506); OG doc 18431 1.12023-1.12035 differs.
A2-CAUSE FOUND: MID both objects both runs (EU12055693 f16:20/p16:40 + EU12060599 f16:45/p17:25; RC9626513 + RC9627048). EU LONG IPC only 17:00 (12057419); RC LONG IPC 17:30 (9627365). EU XP last 17:00 id14025; RC XP 17:30 id2549. EU ZP last 17:00; RC ZP 17:30. ZLK 1.15975-1.16013 both runs t17:45 (post-confirm, STANDING at 17:30). Cause: EU printed no 17:30 LONG pick/commit, gate carried the 17:00 commit; deeper selector reason UNKNOWN (MEASURED scope).
ZONE1_B225.csv 49 rows (run,date,side,entry,object_src,kind,lo,hi,formT,promoT,read_by_gate,reach,reach_candle,kill,jl).
R2: 06:30 o1.16506 h1.16508 l1.16491 c1.16494 (HZB JL3880014); 06:35 o1.16494 h1.16494 l1.16486 c1.16486 (3880051); 06:40 o1.16487 h1.16489 l1.16475 c1.16476 (3880088). DERIVED gap lo1.16489 hi1.16491. Reach 06:40->10:00: REACHED 09:55 (CUT B96 JL9594203/11980797; HZB B179 sample corroborates no earlier touch). Opposing 09:55 touch=yes. Machine carries gap: FOUND B176HZ GAP_FORM RC9592869 + EU11978800 (range 1.16489-1.16491); no DEAD/KILL row either run = STANDING.
R3 spec quotes: 3.md L58 "No protective-side filter on the zone..."; L118-119 swing branches; L123 protective-side stop test; L127 stop-may-lie-inside + side-not-containment. Greps (beyond/below-above-stop/behind/far-side/SL+zone): only near-misses (rules/26 planner note; rules/27 ENFORCED-TIGHTLY; rules/46 PANEL-LEG-STATE; findings code mechanics; journal O1/F1/B-211 bank lines) = NO RULING FOUND. Chart call drafted (29Jun + 22Sep fields from REVIEW_EU_B224_M2), DRAFT FOR PLANNER CHECK.
R4 (owed vs machine; TP at conf bar; exit-deal + B206T/B218K dated):
A1 both: MT 11:30 1.16464 POI_BREAK (9595493/11983578) = owed; deal 11:35 1.16467; TP 1.16364; B206T 10:05/11:35 same = FILL +3.
A2 RC: MT 17:45 1.15987 Yearly-break (9627718) = owed; deal 17:50 1.15987; TP 1.16077 = SAME. A2 EU: MT SL 17:50 1.15975 (12063181); deal 17:51 1.15975; TP 1.16086; B206T/B218K same = OTHER (-12, Yearly NOT PRINTED on EU).
A3 RC: MT DAY_CLOSE 23:50 1.16129 (9669718); deal 23:55 1.16129 = owed; TP 1.16302 = SAME. A3 EU: no FIRE/deal/TPE = OTHER (absent EU-window).
A4 both: MT TP 10:50 1.16200 (9675768/12154627); deal 10:53 1.16201 = owed; TP 1.16200 = FILL -1.
A5 RC: MT TP 17:10 1.16318 (9682416); deal 17:13 1.16319; TP 1.16318; B206T same = YEARLY-DEPTH (+4, F5 1.16315->1.16319). A5 EU: MT SL 21:25 1.16239 (12177514); deal same; TP 1.16358 unreached = OTHER.
A6 both: MT TP 10:40 1.16102 = owed; deal 10:42 1.16102; TP 1.16102 = SAME. A7 both: MT SL 17:30 1.16274 (9696907/12200578, -1 vs 1.16275 cell per B-181); deal 17:26 1.16275 = owed; TP RC 1.16114 (= Yearly-POC target, row7) vs EU 1.16077 = FILL -1.
Yearly prints: 1Sep 17:45 Yearly-POC RC 1.15987 (MTEXIT 9627718), EU NOT PRINTED (zero Yearly rows in EU cut). 7Sep 16:45 Yearly-POC RC 1.15987 (EXITCENSUS 9682126, side behind); EU NOT PRINTED.
EXITS_B225.csv 14 rows.
```
## Part S (SEPARATOR_B225.csv 14 rows; reach + standing only)
```
A1 RC/EU HIS-KEEP 10:05: HIS-FVG-DERIVED REACHED STANDING PASS (9592869/11978800).
A2 RC HIS-KEEP 17:35: 1.15975-1.16013 REACHED STANDING PASS. A2 EU: 1.15902-1.15926 NEVER STANDING FAIL.
P3 18Jun REACHED STANDING PASS. 10Jun NEVER FAIL(wanted). 25Jun REACHED OTHER-GATE. 22Jul NEVER FAIL(wanted).
F3 4Jun NEVER FAIL; 29Jun REACHED PASS; 15Jul NEVER FAIL; 17Aug NEVER FAIL; 22Sep REACHED PASS; 8Oct NEVER FAIL.
OVERALL HIS-KEEP 3/4, F3-PASS 2/6 => DOES NOT SEPARATE. A1 pass buildable (B176HZ GAP_FORM carries range both runs; B148 not triggered). No Part K.
```
## Part X records
```
Pointer State B-225 + Lane F3 2/6 no-trial + Next minus review sheet (35-line cap kept). HANDOFF 3a F3 2/6 + 3b drop B-215 add B-225. CONTEXT sec4 F3 B-225 line + sec5 B-225 line. FIXPLAN F3 State B-225 + F5 A5-YEARLY-DEPTH row + F9 two NOT-PRINTED gaps. Ledger 1372 appended. LESSONS +1 B225-PROMO-NOT-PICK (129 chars). Register no edit.
```
## Size gate (caps pointer 6000/35, result 12000, slice 20000/600)
```
pointer 4472/35 PASS; result 5340/18 PASS; slice 7014/59 PASS (this file); CONTEXT 8421 PASS; HANDOFF 4962 PASS; LESSONS 20126 disk / 19996 LF PASS (relay-ordered +1 line, 124 chars; trimmed 8 to hold the cap); FIXPLAN 12868 PASS; ZONE1 6127 + EXITS 2451 + SEPARATOR 1836 PASS; READ_MAP rewritten. Strategy max + relay + READ max per READ_MAP.
```
## Timing + final disk + housekeeping
```
Wall: gate + reads ~15m; R script ~20m (1 fix + 1 recount); R3 greps ~10m; R4/S ~10m; records ~10m; commit/push follow.
Final disk: no edit, no compile, no runs (kept b4db21c5/61829f05). CUT_*-B222K kept baseline. tini c725e437. No terminal64.
Housekeeping: none (no new cuts; delete nothing).
```
(End of slice)
