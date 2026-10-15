# BUILDER SLICE B-231 - raw rows (retest census + repairs; MEASURED)
Base: builder/B-231 cut at 7f2ac26 (= B-230 head). Verdict MEASURED (no separation, no runs).
## Start gate
```
log-1 7f2ac267f2ace894307859ee6a31ae46fbf18bd7 (backup exact; B149 rev-parse at cut + before commit).
status 867 (860-class + B230K/T1 artifacts = ACCOUNTED). gated diff EMPTY on all 0.3 files (LF-normalized).
Disk: EA b4db21c5/61829f05; POI d47a0e68/04fcd8a5 (kept B-230); tini 65c97348 (vs c291791f: touch-class + T1 dates 1787702400/1788998400 + Symbol EURUSD; [TickLoad] intact; ACCOUNTED).
Tick EURUSD mtimes static May-Sep (Jun 7/29, Jul 8/2, Aug 9/1, Sep 10/1; Oct live); cuts present (B230K + B229D, same ex5).
No terminal64. Ledger ^1377=1 ^1378=0 pre. Python 3.13.16.
```
## Part B banking (grep-first)
```
B1 rules/49 new (his 2026-10-15 no-repeat words verbatim, 3 lines) + strategy index +1 (49 files) + CONTEXT Questions bullet + No-repeat bullet (both counts 1 pre).
```
## Part X0 repairs (checked in file afterwards; checklist X6)
```
X0.1 REVIEW_BATCH_B231 (items 1,3,6,7; his questions quoted from rules/48; record zones INPLAY_B224/ZONE1_B225; F3 stops 4Jun 1.16069 + 15Jul 1.14190 from INPLAY_B224; VALID/INVALID lines).
X0.2 pointer State B-231 + fix-order PK-4 line + tini c291791f line (34 lines).
X0.3 LESSONS fold "Later word governs on CQD (B-74)..." (156 B) to ARCHIVE/LESSONS_ARCHIVE_B220.md (19875 disk).
X0.4 CONTEXT Brain B-227/B-228/B-229/B-230/B-231 PK-4 lines.
X0.5 QUESTION_LOG.md new (13 questions: 8 answered, 5 open incl item-13 rule question).
```
## Part R (job_r_b231.py; IDX RECON B96 1049/BORN ~40/FIRE 71; EU B96 9606/BORN 5265/FIRE 537)
```
R1 method: counted retest = latest BORN seed (anchor+side) <= conf (review-consistent); classes Decimal-exact, THROUGH = penetration >= 1pt (spec 2 row 1 L9), else WICK-EQUAL/BODY-EQUAL/MISS; full + 5d (identical everywhere: all values 5dp).
Own-defect caught by evidence (B-231 lesson class): first run unpacked o/h/l/c shifted (all MISS), second run leaked entry-time aggregation (June seeds in A1 carrier); fixed, recounted, RETEST_B231.csv 611 rows.
Boundary rows: N22SEP 18:45 Quarterly-POC 1.14334 o1.14334 h1.14335 l1.14308 c1.14325 = 1pt THROUGH + open-touch (his wick-only words describe this candle; spec >=1pt still counts it). N17AUG 15:00 Weekly-VWAP 1.15917 o1.15921 h1.15954 l1.15915 c1.15953 = 2pt clean THROUGH (his body-equality matches no printed value; WINLINE flat 1.15917-18).
Same-candle passes: V29JUN (16:10==conf), A2 x2 (17:30==conf) - allowed spec 3.6, named.
R2 F3 re-scope: refuse set now 4 Jun + 15 Jul (29Jun/8Oct VALID out; 22Sep/17Aug carry his reasons; 22Jul must-never separate) -> EU_FIX_PLAN F3 Shows-on line.
```
## Part S (SEPARATOR_B231.csv 43 rows; T-ANY)
```
HIS-KEEP 20/20 PASS (counted THROUGH; A3-EU PASS on B229D diagnostic take - relay ABSENT label applied to kept B222K only, noted). P3 PASS. N22SEP/N17AUG OTHER-GATE (pass retest; no EQUAL-only reading on record). Silent MUST-NEVER 13 FAIL = wanted (incl N4SEP0930 silent B229D). Machine 4 PASS for review. Overall DOES NOT SEPARATE full + 5d (identical). No K/T/G-runs.
G scoreboards (kept cuts, current truth): RECON62-B230K 8/8 6/8 never 0 machine 0; EU0525TD-B229D 13/13 11/13 never 5 machine 4. Per-row B229D-vs-B222K diff in B-230 slice.
```
## Part X records
```
EU_FIX_PLAN F10 (his rules/48 words + State B-231) + F3 Shows-on re-scope. Pointer State + Lane 1/3 + Next (34 lines). Ledger 1378. LESSONS +1 B-231-RECORD-CHECKLIST (fold-first). READ_MAP rewritten. Checklist X6 appended to 01b Housekeeping + run below.
```
## Record checklist X6 (grep-verified in staged files)
```
X0.1 REVIEW_BATCH_B231 items 1/3/6/7 + zones + stops + grade lines: FOUND
X0.2 pointer State B-231 + fix-order PK-4 + tini c291791f: FOUND
X0.3 LESSONS under cap + fold line in ARCHIVE: FOUND
X0.4 CONTEXT Brain B-227..B-231: FOUND
X0.5 QUESTION_LOG.md 13 questions: FOUND
X1 EU_FIX_PLAN F10 + F3 Shows-on: FOUND
X2 pointer State + Lane 1/3 + Next: FOUND
X3 ledger 1378: FOUND
X4 LESSONS B-231-RECORD-CHECKLIST line: FOUND
X5 READ_MAP rewritten: FOUND
```
## Size gate (caps pointer 6000/35, result 12000, slice 20000/600)
```
pointer 4570/35 PASS; result 4972/18 PASS; slice 5030/63 PASS (this file); TRUTH 2511 unchanged PASS; BATCH231 1236 PASS; RULES49 540 PASS; SKILL-index PASS; 01b-checklist PASS; FIXPLAN 15046 PASS; RETEST 119571 data PASS; SEPARATOR 5780 PASS; QUESTION_LOG 1264 PASS; CONTEXT 9383 PASS; LESSONS 19848 PASS; ARCHIVE 2129 PASS; READ_MAP rewritten. Register (source) untouched. EA/includes/POI committed files untouched.
```
## Timing + final disk + housekeeping
```
Wall: gate + reads + banking ~20m; X0 ~15m; R + S debug ~30m; records ~15m; commit/push follow.
Final disk: no source edit, no compile, no runs (kept EA b4db21c5/61829f05 + POI d47a0e68/04fcd8a5). tini 65c97348 untouched. No terminal64.
Housekeeping: none (scripts/cuts uncommitted; nothing deleted).
```
(End of slice)
