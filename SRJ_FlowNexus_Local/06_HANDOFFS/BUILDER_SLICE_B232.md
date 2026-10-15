# BUILDER SLICE B-232 - raw rows (rebind + readings + addendum; MEASURED)
Base: builder/B-232 cut at d9668e9 (= B-231 head). Verdict MEASURED (no separation, no runs).
## Start gate
```
log-1 d9668e94c1e43454dc8ee56b06c9a5b98c70f1f9 (backup exact; rev-parse at cut + before commit).
status 871 (867-class + B231 artifacts = ACCOUNTED). gated diff EMPTY on all 0.3 files + skills + ledger (LF-normalized).
Disk: EA b4db21c5/61829f05; POI d47a0e68/04fcd8a5 (kept B-230); tini 65c97348 (vs c291791f: touch-class + T1 dates/Symbol; [Tester]/[TickLoad] intact; ACCOUNTED).
Cuts B230K 165047122 + B229D 609929022 present. Tick EURUSD mtimes static May-Sep (Oct live). No terminal64 (transient PID 1548 seen once, gone).
Ledger ^1378=1 ^1379=0 pre. Python 3.13.16 at the pointer path.
```
## Part B banking (addendum; grep-first)
```
rules/50 new (6 verbatim quotes; ZONE-NOT-REACHED-NOT-INPLAY pin) + strategy index +1 (50 files).
Truth +4: N26MAY NEVER 26May sell 15:50; N4JUN1005 NEVER 4Jun buy 10:05; N15JUL1035 NEVER 15Jul buy 10:35; K5AUG KEEP 5Aug buy 11:20 (exit_price machine-booked 1.15346, exit_time blank, disclosed: grader needs a number, never his exit).
QUESTION_LOG items 1,3,6,7 ANSWERED B-232 (never re-asked).
V1 SETUPS rows: 28May LONG NEUTRAL/BEAR/BEAR no-majority no-sweep FAIL; 29Jun LONG NEUTRAL/BEAR/BULL FAIL; 8Jul SHORT majority HOLD; 2Sep SHORT HOLD; 8Oct SHORT HOLD (all class NOT PRINTED). V2: fails answered, no new questions.
```
## Addendum R1/R2/R3 (job_r_b232.py tail)
```
R1 zone walks promo->conf, h/l vs zone, JL per candle (247-line .out): 26May zone 1.16479-1.16505 NEVER-REACHED (25.05 16:15 window + 26.05 session); 4Jun zone 1.15967-1.15972 NEVER-REACHED; 15Jul zone 1.14042-1.14070 NEVER-REACHED. Gate JLs: INPLAY_B224 source lines (26May 10513386-group; 4Jun 10607299-group; 15Jul 11136551-group); INPLAYCOMMIT/ZONEPICK/B177HZ JLs per B-225 R1 (A1/B177HZ PASS rt rows; F3 ZP/XP NONE rows).
R2 5 Aug: htf_4h NEUTRAL htf_1h BULL htf_15m BULL ltf_5m BEAR setup_class NOT PRINTED (REGIME) sweep NOT PRINTED (B182SWEEP) => TREND by spec 3.2 (2/3 majority with LONG; sweep unneeded).
R3 answer: htf_4h/htf_1h/htf_15m/ltf_5m columns exist with values on B-222K rows; setup_class NOT PRINTED (REGIME tag not carried); sweep_src NOT PRINTED (B182SWEEP not carried). Gap: the machine REGIME verdict print must be carried to SETUPS on every candidate.
```
## Part R (job_r_b232.py; IDX EU B96 9607/BORN 864/FIRE 541/FROM 768/WIN 2938; RECON B96 1049/BORN 95/FIRE 71/FROM 95/WIN 347)
```
R1 rebind 30 rows (B201FROM sd = setup FROM; own-defect class B231-SEED-BINDING owned: B-231 bound latest-seed-before-confirmation with no session bound).
Changed: 25Jun FROM 10:30 (was 23Jun 10:35 seed); A3 FROM 15:45 4Sep (was 3Sep 09:00); A6 FROM 10:05 8Sep (was 1Sep 15:30). Same: all others incl N17AUG 15:00 + N22SEP 18:45.
Same-session: yes 30/30.
R2 N22SEP candles 18:45-18:55 (line 1.14334 WINLINE ADD/KILL): 18:45 open==line wick+1pt; 18:50 close==line; 18:55 high==line wick-only. R2 N17AUG 15:00-15:50 (line 1.15917-18): no open/close/wick equality at any candle.
R3 keeps FROM candles (21 rows): all valid under both readings (penetration with body on side).
R4: Mon 17Aug + Tue 22Sep; Q3 starts 1 July, weeks open 17/21 Aug-Sep - all inside 25 May walk: FOUND.
Own defects owned this relay: (1) cls5 six-name unpack shifted o/h/l/c (all-MISS run); (2) SEP aggregation keyed run+entry without date (June seeds in A1 carrier); (3) FROM-tuple indices off by two (all-None run); (4) B201FROM rx missed space-in-timestamp (25 rows of 793); (5) R3 line/side split swapped (empty KEPT). Each caught by evidence rows before filing.
```
## Part S (SEPARATOR_B232.csv: EQ-A/EQ-B/EQ-AB)
```
keeps 21/21 PASS all readings (FROM retests valid). N22SEP refused all readings (18:45 open-touch; 18:55 wick-exact). N17AUG fires all readings (15:00 clean 2pt; no equality 15:00-15:50). 10/25Jun + 22Jul OTHER-GATE. Silent NEVERs FAIL = wanted (13). Machine 4 listed.
Overall DOES NOT SEPARATE x3. No K/T/G-runs. G scoreboards above (kept cuts, current truth).
Batch B-232 (2 takes, exact candles + line values, only new facts).
```
## Part X records
```
EU_FIX_PLAN F10 State B-232 + F3 re-scope (refuse set empty). Pointer State B-232 + Lane 2/3 + Next F3 (35 lines). Ledger 1379. REVIEW_BATCH_B232 (2 takes). READ_MAP rewritten. Checklist X6 below (all FOUND). No LESSONS order.
```
## Record checklist X6 (grep-verified in staged files)
```
X0.1 REVIEW_BATCH_B232 2 takes + exact candles + line values: FOUND
X0.2 pointer State B-232 + fix-order PK-4 + tini 65c97348: FOUND
X0.3 LESSONS under cap + fold line in ARCHIVE: FOUND (done B-231; untouched here)
X0.4 CONTEXT Brain B-227..B-231: FOUND (done B-231; untouched here)
X0.5 QUESTION_LOG.md 13+4 questions: FOUND
X1 EU_FIX_PLAN F10 + F3 Shows-on: FOUND
X2 pointer State + Lane 2/3 + Next: FOUND
X3 ledger 1379: FOUND
X4 n/a (no LESSONS order this relay)
X5 READ_MAP rewritten: FOUND
```
## Size gate (caps pointer 6000/35, result 12000, slice 20000/600)
```
pointer 4590/35 PASS; result 4961/18 PASS; slice 5884/67 PASS (this file); TRUTH 2995 unchanged PASS; BATCH232 834 PASS; RULES50 1344 PASS; SKILL-index PASS; FIXPLAN 15365 PASS; RETEST232 6194 PASS; SEPARATOR232 245 PASS; QUESTION_LOG 1264 unchanged PASS; CONTEXT 9383 PASS; LESSONS 19848 untouched PASS; READ_MAP rewritten. Register (source) untouched. EA/includes/POI committed files untouched.
```
## Timing + final disk + housekeeping
```
Wall: gate + reads + banking ~25m; R + S debug ~35m (five own defects caught by evidence); records ~15m; commit/push follow.
Final disk: no source edit, no compile, no runs (kept EA b4db21c5/61829f05 + POI d47a0e68/04fcd8a5). tini 65c97348 untouched. No terminal64.
Housekeeping: none (scripts/cuts uncommitted; nothing deleted).
```
(End of slice)
