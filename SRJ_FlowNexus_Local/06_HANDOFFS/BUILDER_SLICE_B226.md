# BUILDER SLICE B-226 - raw rows (current-leg test + separator; MEASURED)
Base: builder/B-226 cut at f7c8158 (= B-225 head). Verdict MEASURED (F3-INPLAY 3 of 6; 23+143+25 rows, DOES NOT SEPARATE).
## Start gate
```
log-1 f7c8158ed8fa55d1ff45d887cf3585da4614a46f (backup exact; B-226 cut here; rev-parse HEAD at cut + before commit).
diff f7c8158 EMPTY on pointer + RESULT_B225 + SLICE_B225 + ZONE1_B225 + SEPARATOR_B225 + EXITS_B225 + EU_FIX_PLAN + CONTEXT + HANDOFF + LESSONS + READ_MAP + register + both skills. Status 830 (dirty tree as B-225 = ACCOUNTED).
Disk SHAs: kept EA b4db21c5/61829f05; .B222K same; .preB223 7c392767/83ac8bde; tini c725e437. CUT_B222K pair present (163994231/602470995 B). Ledger ^1372=1 ^1373=0 pre. No terminal64. Python 3.13.16 (py launcher absent).
Carried k4 (SEPARATOR_B223 A3-EU PASS vs no 4 Sep 16:00 deal on B218K/B222K: verified R3, B223 file left filed; Carry in pointer, F5 owns it), k5 (LESSONS 19996 LF: fold L3 to ARCHIVE/LESSONS_ARCHIVE_B220.md first, then +1 line).
DEALS counts 44 (EU) / 16 (RECON) on B222K reads.
```
## Part R (job_r_b226.py, one pass per CUT_B222K; 3 script fixes with recounts)
```
IDX RECON62-B222K GF29158 MID477 ZLK441 YRLY2835 B96 1049 BORN533 XP141 ZP141 IPC141 FLIP25 FIRE71 HZ16.
IDX EU0525TD-B222K GF30705 MID2632 ZLK2543 YRLY0 B96 9606 BORN5265 FIRE537 XP939 ZP970 IPC970 FLIP234 HZ64.
R1 leg verdicts (form -> conf; flip = LTFFLIP bar<=conf; newOB = B182MID side formT in window + promoT<=conf, FVG = B176HZ GAP_FORM side t1 after OBform, event = FVG t3<=conf; runtime tag at confirm or PRINT-ONLY-n/a):
A1 both: parent leg XOB 1.16490-1.16503 promo05:20 (RC9592338/EU11977997); ENDED 07:30 newOB 07:15 1.16451-1.16463 + FVG t1 07:20; reach 09:55 NO; STANDING.
A2 RC 1.15975-1.16013 f16:45: IN-LEG; reach 17:25 YES; STANDING. A2 EU gate 1.15902-1.15926 f16:20: IN-LEG; reach NONE; STANDING.
P3 1.15089-1.15112 f03:45: ENDED 05:30 newOB 04:55 1.15158-1.15191 + FVG 05:20; reach 09:00 NO; STANDING.
10Jun IN-LEG (newOB promo 16:20 post-conf); reach NONE. 25Jun IN-LEG; reach 10:20 YES. 22Jul ENDED flip 07-21 17:25 Weekly-POC/S3_ZONE_WAIT (also newOBFVG 18:35); NONE.
4Jun ENDED 05:40 newOB 04:10 1.16060-1.16073 + FVG 05:30; NONE. 29Jun ENDED 09:55 newOB 09:40 1.14000-1.14023 + FVG 09:45; reach 11:50 NO.
15Jul ENDED flip 07-14 17:20 Daily-POC/S4_ARMED; NONE. 17Aug ENDED 09:50 newOB 09:30 1.15890-1.15921 + FVG 09:40; NONE.
22Sep IN-LEG; reach 16:30 YES. 8Oct ENDED flip 10:15 Weekly-POC/S4_ARMED; NONE.
A3 RC ENDED 09-03 09:30 newOB 08:50 1.15975-1.16004 + FVG 09:20 (flip 16:45 later); reach 15:30 NO. A4x2 IN-LEG (newOB promo 09:30 post-conf); reach 09:00 YES.
A5x2 IN-LEG (newOB promo 18:00 post-conf); reach 15:50 YES. A6x2 IN-LEG (newOB promo 10:20 post-conf); reach 09:40 YES.
A7x2 ENDED 10:15 newOB 10:00 1.16198-1.16229 + FVG 10:05; reach 09:40 YES (old leg) = CONFLICTS HIS B-143 WORDS (RC9691391/EU12188789).
LEG_B226.csv 23 rows.
R2 1Sep LONG road 16:40-17:35 (PICKROAD_B226.csv 143 rows): 16:40 MID-promo 1.15902-1.15926 both; 16:45 MID-form 1.15975-1.16013 both; 17:00 EU XP14025/ZP/IPC-1.15902-1.15926, RECON MID-promo 1.15895-1.15931 only; 17:25 MID-promo 1.15975-1.16013 both; 17:30 RECON XP2549/ZP/IPC-1.15975-1.16013 + HZ PASS rt16:45, EU HZ PASS rt16:50 only. FOUND first difference 17:00. EU Yearly rows 0, RECON 123 (16:40-17:50).
R3 EU 4Sep 14:00-17:00 LONG: BORN/ALIVE Yearly-POC NONE; any Yearly row ABSENT; LONG FIRE/ABORT last 15:35/15:40/16:00 Monthly-POC ABORTs (SEEDBIAS_REFUSED, TP_RR_FAIL, TP_RR_FAIL); A6REFUSED 15:35 SEEDBIAS_REFUSED, 15:40 + 16:00 TP_RR_FAIL. FOUND killing row B182DEC 16:00 Monthly-POC ABORT TP_RR_FAIL (JL 12138603, div hidden 15:45 latched). DEALS B218K/B222K/B206T 4Sep: only 09:30 buy + 10:51 sell (machine London long), no 16:00 deal: k4 verified, loss dated on all three long-run files.
```
## Part S (SEPARATOR_B226.csv 25 rows; T-LEG = reached in-leg + leg open at confirm + standing)
```
A1x2 FAIL (ENDED). A2 RC PASS; A2 EU gate-object FAIL (unreached) + second PASS PICK DEFECT OWNED BY XOBPROMO (RECON object reached 17:25 EU jl12061329, IN-LEG, STANDING).
A3 RC FAIL (ENDED); A3 EU ABSENT (F5). A4x2/A5x2/A6x2 PASS. A7x2 FAIL CONFLICTS HIS B-143 WORDS. P3 FAIL (ENDED).
10Jun FAIL (unreached, wanted); 25Jun OTHER-GATE (IN-LEG reached); 22Jul FAIL (flip, wanted).
F3 4Jun/15Jul/17Aug/8Oct FAIL; 29Jun FAIL (ENDED); 22Sep PASS (only F3 pass).
OVERALL HIS-KEEP 7/13, P3 FAIL, F3-PASS [22Sep] => DOES NOT SEPARATE. No Part K. Chart call WITHHELD (22Sep passes T-LEG: next relay re-drafts).
```
## Part X records
```
Register NOTE under row 3 + READ/REGISTER A-F copies regenerated (source sha 3f79224b; B-F bodies verified match).
FIXPLAN F5 Shows-on B-226 line + F3 State B-226. Pointer State B-226 + Lane 3/6 + A3 Carry (35 lines kept).
HANDOFF 3a F3 3/6 + 3b drop B-216 add B-226. CONTEXT sec4 F3 B-226 line + sec5 B-226 line. Ledger 1373.
LESSONS fold L3 to archive + B226-LEG-READ-WRONG (124 chars). READ_MAP rewritten.
```
## Size gate (caps pointer 6000/35, result 12000, slice 20000/600)
```
pointer 4528/35 PASS; result 5701/18 PASS; slice 5698/55 PASS (this file); CONTEXT 8676 PASS; HANDOFF 4971 PASS; LESSONS 20104 disk / 19974 LF PASS (fold-first per k5); FIXPLAN 13488 PASS; LEG 4107 + PICKROAD 22567 + SEPARATOR 4243 PASS; READ_MAP rewritten. Strategy max + relay + READ max per READ_MAP.
```
## Timing + final disk + housekeeping
```
Wall: gate + reads ~15m; R1 ~25m (1 fix + 1 recount); R2 ~10m; R3 ~10m; S ~5m; records ~10m; commit/push follow.
Final disk: no edit, no compile, no runs (kept b4db21c5/61829f05). CUT_*-B222K kept baseline. tini c725e437. No terminal64.
Housekeeping: none (no new cuts; delete nothing).
```
(End of slice)
