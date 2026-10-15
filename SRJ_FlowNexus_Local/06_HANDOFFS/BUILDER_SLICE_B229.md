# BUILDER SLICE B-229 - raw rows (seam diagnostic + whole runs; RESTORED)
Base: builder/B-229 cut at 6eab54d (= B-228 head). Verdict RESTORED (diagnostic ran, undone).
## Start gate
```
log-1 6eab54dba9cb5f531b9eadcadf754a6af526bd6b (backup exact; B-229 cut here; rev-parse HEAD at cut + before commit).
status 849 (dirty tree as B-228 = ACCOUNTED: helpers + B228P cuts/inis/status + .out files).
POI src 5af5e035 / ex5 e5cbe1a2 + EA b4db21c5/61829f05 match. terminal.ini c291791f vs blessed c725e437: TOUCH-CLASS ACCOUNTED (RecompiledAll/LastStartTime stamps + his M5 Horizontal Line 29131->2406 1.162181->1.143080 + Dividers-0 one bit; [Tester] block intact; transient terminal64 PID 23004 seen once, gone).
No terminal64 at gate. Ledger ^1375=1 ^1376=0 pre. Python 3.13.16.
```
## Part B banking (grep-first; all counts 0)
```
REGISTER_TRUTH.csv +7: V29JUN KEEP 2026-06-29 buy 16:15 1.14039; N22SEP NEVER 2026-09-22 sell 19:00 1.14314; K28MAY KEEP 2026-05-28 buy 11:50 1.16134 exit 12:12 1.16177; K8JUL KEEP 2026-07-08 sell 14:50 1.14002; K2SEP KEEP 2026-09-02 sell 14:45 1.15747; K8OCT KEEP 2026-10-08 sell 11:35 1.11884; N17AUG NEVER 2026-08-17 buy 15:55 1.15947.
Truth exit_price patched machine-booked (grader needs a number; disclosed, never his exits): V29JUN 1.14152, K8JUL 1.14095, K2SEP 1.15822, K8OCT 1.11819. K28MAY exit 12:12 1.16177 is his line.
rules/48_his-words-2026-10-15-b-229-review.md new (13 lines: B1/B2a-e verbatim + V1/V2) + strategy SKILL index +1 (48 files).
V1 SETUPS_EU0525TD-B222K EXECUTED rows: 28May LONG NEUTRAL/BEAR/BEAR sweep NOT PRINTED = FAIL; 29Jun LONG NEUTRAL/BEAR/BULL sweep NOT PRINTED = FAIL; 8Jul SHORT NEUTRAL/BEAR/BEAR = HOLD majority; 2Sep SHORT same = HOLD; 8Oct SHORT same = HOLD (all class NOT PRINTED (REGIME)). V2: fails are answered items; no new questions.
B2d zones from committed rows: 26May XOB 1.16479-1.16505 INPLAY_B224; 4Jun XOB 1.15967-1.15972 ZONE1_B225; 15Jul XOB 1.14042-1.14070 ZONE1_B225; 5Aug XOB 1.15318-1.15360 INPLAY_B224 (SETUPS zone cells all NOT PRINTED). No chart call.
```
## Part K (K0 NO CONFLICT; tester-only)
```
K1 .preB229 5af5e035/e5cbe1a2 + terminal.ini.preB229 c291791f (content).
K2 kept lines 2241-2260 (two if(InpRefuseSeamHole) in file: 2211 SEAM_HOLE + 2248 SEAM_UNREACHABLE; target = reach==0 block).
K3 diff vs .preB229: +// [B229YD] comment + condition "if(InpRefuseSeamHole && !MQLInfoInteger(MQL_TESTER))"; body unchanged. Marker count 1; braces 233/233 both.
K4 compile result: 0 errors, 0 warnings. src d47a0e68 / ex5 04fcd8a5; .B229D copies verify equal.
```
## Part T (ex5 04fcd8a5 pre/post both runs; D: 144.9 -> 142.1 GB)
```
T1 RECON62-B229D: dates 1787702400/1788998400 written + read back. Direct launch PID 19620. Test passed (~7m). Cut JL 14962456 + 1052900 lines. DEALS 16, side/date/time/price all identical to B222K. Grader: entries 8/8 exits 6/8 never 0 machine 0 (moves vs B227W-L1 only by banked K2SEP exact; per-row A1-A7 identical) = no STOP.
T2 EU0525TD-B229D: T1 terminal stopped per B-43; dates 1779667200/1791849600 written + read back; ini 25.05-10.13. Launch PID 13512. Init: SEAM_UNREACHABLE_IGNORED + slot-Y SEED CALENDAR + FLOOR adopted YES foldFrom 26.06 (hunk live). Test passed (~35m). Cut JL 16015356 + 3325468 lines. DEALS 44: NEW 29 sell 17:50 1.15987 (A2 exit), 32 buy 16:00 1.16019 + 33 sell 23:55 1.16129 (A3), 37 sell 17:13 1.16319 (A5 exit); GONE 17:51 1.15975, 09:30 1.16296, 10:51 1.16249, 21:25 1.16239. Grader: KEEP entries 13/13 exits 11/13 (A1 +3, A5 +4 DIFF) NEVER 5 (10Jun/25Jun/22Jul/N22SEP/N17AUG) machine 4 (26May/4Jun/15Jul/5Aug) trades 22.
T3 restored POI 5af5e035/e5cbe1a2 (= K1 verified) + tini c291791f content (verified post-stop, no re-save); T2 terminal stopped by PID; no terminal64.
```
## Part R (R1 EU-B229D cut; R2 vs B222K DEALS)
```
R1: slot-Y SEED CALENDAR JL16015471 + CKPT_META adopted YES JL16015478 + CKPT_RESULT ACTIVE 254041 recs JL16015484 + FLOOR adopted YES JL16015492. Yearly lines 14039 (vs 0 kept). First priced Yearly 26 May 15:55 EXITCENSUS YPOC 1.16866 + YVWAP 1.16884 (JL16805021/22).
R2: A3 entry DIFF-realized (absent -> 16:00 1.16019); A2 exit DIFF-realized (17:51 1.15975 -> 17:50 1.15987); A5 exit DIFF-realized (21:25 1.16239 -> 17:13 1.16319); + unpredicted 4Sep London 09:30/10:51 GONE.
```
## Part X records
```
Truth +7 rows (B1/B2; exit_price machine-booked disclosed). Pointer State B-229 + Lane 2/3 + Next B-230 (35 lines). FIXPLAN F5 State B-229. Ledger 1376. REVIEW_BATCH_B229 (items 1,3,6,7 + record zones + B229D exits; item 10 = 4 Sep pick). rules/48 + index. READ_MAP rewritten. No LESSONS line (no new standing lesson).
```
## Size gate (caps pointer 6000/35, result 12000, slice 20000/600)
```
pointer 4464/35 PASS; result 5602/19 PASS; slice 5348/50 PASS (this file); TRUTH 2376 PASS; BATCH229 1145 PASS; RULES48 2644 PASS; SKILL-index PASS; FIXPLAN 14049 PASS; B229D-DEALS 721/1939 PASS; READ_MAP rewritten. Register (source) untouched. EA/includes/POI committed files untouched.
```
## Timing + final disk + housekeeping
```
Wall: gate + reads + banking ~25m; K ~10m; T1 ~10m; T2 ~40m; R + records ~20m; commit/push follow.
Final disk RESTORED: POI src 5af5e035 / ex5 e5cbe1a2; EA b4db21c5/61829f05; tini c291791f; no terminal64.
Housekeeping: none (B229D cuts/inis/status uncommitted, kept baseline intact; nothing deleted).
```
(End of slice)
