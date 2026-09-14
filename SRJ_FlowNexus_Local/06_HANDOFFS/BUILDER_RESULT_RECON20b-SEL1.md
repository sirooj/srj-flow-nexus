# BUILDER RESULT RECON20b-SEL1 (P-SEL-1 build-2) — COMPLETE RUN, G1 FAIL → PACKET DEAD

Build: EA `766BADDCFA8E542B2A6DE8DC8B286EE4DB07D82F0E74F88ADFEEB4E37E05E55B`
(469237 B, P-SEL-1 build-2, uncommitted); FlowLogic
`3606BFB480A34B5ED4357588DDAFDFE8F7DF2224DA34C6A220EA49F506725911`
(67515 B, unchanged since RECON9).
Launched 02:54:10 PID 11488, PRE_JOURNAL_LINES=7042, ini `RECON1_P1.ini`
(same ini/range as cleared). DONE=PASSED 03:49:49.

## 1. Build-2 compliance (v15 clearance, measured)

- STAGE-1 pre-fix hash `44D0923B…` verified before the edit (carried record
  from item 42; the edit session's own backup file was NOT found on disk
  on re-search — `*base*` under `SRJ_FlowNexus_Local` returns nothing —
  so no fresh byte-diff is asserted here. Diff-verified rests on: pre-hash
  record + single SEL52CTX call site (lines 2815/2837, only StringFormat
  with 9 specifiers in the function) + post parity below. The DIFF-0-void
  race stays owned as recorded in item 42.)
- Fix (lines 2837–2839): `site` passed as third arg. Format has 9
  specifiers (`%d %s %s %s %s %s %s %d %s`); args are 9
  (`i, evalT-string, site, DirName, oPxS, oBtS, slRef-string, slMode, halt`).
  9/9 asserted by count + sample rows showing `site=S2POLL/S3ARM/S5`.
- Sibling audit (measured 2026-09-14): `PARITY_CHECKED=190`,
  `PARITY_MISMATCH=0` (`audit_sel_parity.ps1`, StringFormat+PrintFormat).
- Compile: EA `Result: 0 errors, 0 warnings`
  (`06_HANDOFFS\T162_SEL1_EACOMPILE.log`, 02:53:22, ex5 280030 B);
  Flow `Result: 0 errors, 0 warnings`
  (`06_HANDOFFS\T162_SEL1_FLOWCOMPILE.log`; FlowLogic digest unchanged).
- Fresh hash (measured post-run, after no further write):
  `766BADDCFA8E542B2A6DE8DC8B286EE4DB07D82F0E74F88ADFEEB4E37E05E55B`,
  469237 B. No binary-repro claim (per clearance).
- Power (measured): `Current AC Power Setting Index: 0x00000000`,
  `Current DC Power Setting Index: 0x00000000` (Balanced; STANDBYIDLE 0/0 —
  host-sleep remediation held; no 00:24-style freeze recurred).
- Single-agent (measured from the archive): `Local network farm switched
  off=1`, `Cloud servers switched off=1`, `Agent-127.0.0.1-3003=1`,
  `Test passed=1`; all test-time lines `Core 04` only.
- No identical stall: run reached `Test passed`, so the v15
  stall-contingency (infrastructure relay, no third run) is NOT triggered.

## 2. Archive (wrapper self-archived; measurements verbatim)

- `06_HANDOFFS\RECON20b-SEL1_JOURNAL.log`: 33937 lines, 6746945 B,
  SHA256 `06556CF46A0935F649ED3FD5D2FB80AA8C10CA6F9740B952735AA5B622B06AA4`.
- Bounds: day-log lines [7043..40979] (PRE=7042 + 33937).
- First: `PD	0	02:54:12.174	Tester	Local network farm switched off`.
- Last: `NG	0	03:49:33.258	Core 04	connection closed`.
- Completion: `JL	0	03:49:33.236	Core 04	EURUSD,M5: 563338 ticks,
  3168 bars generated. … Test passed in 0:55:17.348 …`.
- STATUS `ARCHIVED_LINES=33937`, `RESULT=PASSED`, `DONE=2026-09-14 03:49:49`.

## 3. Gate grades (frozen gates v14 §4; filed-authoritative, exact, no tolerance)

### G1 — primary, FAIL (0/12 eligible variants pass 4/4)

`SEL53_FINAL` (24 rows, verbatim tallies): V001=1 V002=0 V003=0 V004=0
V005=2 V006=0 V007=0(inelig) V008=0 V009=1 V010=0 V011=0 V012=0 V013=2
V014=0 V015=0 V016=0 V017=1 V018=0 V019=0 V020=0 V021=2 V022=0 V023=0 V024=0.
Best = 2/4 (V005/V013/V021 = MONO/M5 family). Full lines:

- R1 (HAND 1.16508@06:30): MONO/M5 → `px=1.16508 bt=2026.08.28 06:30
  slot=43 avail=1 status=OK g1m=1 retm=1 … R=2.429 take=1`
  (V005/V013/V021 + inelig V007/V015/V023). RAW/M5 → `px=1.16482
  bt=2026.08.28 09:35 slot=6 … g1m=0 … R=6.375`. H1 → `px=1.16598
  bt=2026.08.27 16:25 slot=212 … g1m=0 … R=0.773` (and UNCONF variants
  `avail=0`). Monotone-only pass; raw fails.
- R2 (hypothetical, not in G1; decl anchor): ALL 24 →
  `px=1.16297 bt=2026.09.04 10:05 slot=7 avail=1 status=OK g1m=0 retm=0
  … R=1.281 take=1 decl=1` (M5-family; H1 `px=1.16412 … R=0.279 take=0
  decl=1`). Code stop is 2 pts under hypothetical 1.16299 on every branch;
  every branch TAKES on R (1.281 clears 1.0) while DECLINING by CQD rule —
  adoption blocked by construction exactly as pre-registered.
- R3 (HAND 1.15847@15:30): all M5 variants → `px=1.15847 bt=2026.09.04
  15:30 slot=6 avail=1 status=OK g1m=1 retm=1 … R=1.661 take=1`
  (V001/V005/V009/V013/V017/V021 + inelig mirrors). All H1 variants →
  `px=1.15835 bt=2026.09.03 03:00 slot=444 … g1m=0` (UNCONF `avail=0`).
  M5-only pass.
- R4 (HAND 1.16098@08:40): ALL 24 MISS. M5-family → `px=1.16088
  bt=2026.09.07 08:20 slot=12 avail=1 status=OK g1m=0 retm=0 … R=1.383
  take=1` (10 pts / 20 min off). H1-family → `px=1.16050 bt=2026.09.07
  00:40 slot=104 … g1m=0 … R=0.765 take=0`. Zero G1M on R4 anywhere.
- R5 (FILED 1.16239@16:15 authoritative): ALL M5 variants →
  `px=1.16238 bt=2026.09.07 16:05 slot=8 avail=1 status=OK g1m=0 retm=1
  … R=2.478 take=1` (retained matches, filed misses by 1 pt / 10 min, by
  design — baseline is 1 pt off HAND). H1 → `px=1.16050 … g1m=0 retm=0
  … R=0.270`. Zero filed-G1M anywhere; retained-retm=1 on all M5.
- Failure gate fires: no G1 passer → packet dead, no rerun, no tuning.

### G2 — force-eval, REPORTED (adoption-blocking, never erases G1)

`SEL53_FINAL G2x3=0` on all 24 variants. Operand rows: R2 §G1 above
(decl=1 everywhere, take=1 M5 / take=0 H1); S1 → M5-family `px=1.16359
bt=2026.09.08 09:05 slot=13 avail=1 status=OK … R=0.669 take=0 decl=0`
(101 pts above HAND 1.16258; H1 `1.16329@2026.09.07 17:15 R=0.831` /
`1.16358@2026.09.07 11:20` / `avail=0` rows); S2 → `R=TARGET_UNSTATED
take=-2 decl=0` on all 24 (`px=1.16250@2026.09.08 16:05 slot=11` M5-family /
`1.16359@09:05 slot=95` MONO / `1.16412@2026.09.03 19:50` H1 vs HAND
1.16274). Nothing reproduces S1/S2 stops.

### G3 — uniqueness, MOOT (no passers; nothing to disambiguate)

Disagreement set is the whole matrix (R1 MONO-vs-RAW, R3 M5-vs-H1, R4
universal miss, R5 filed-vs-retained). No winner declared.

### G4 — census, REPORTED

- CTX: 599 rows = `S2POLL=432 S3ARM=157 S5=10` (432+157+10=599;
  599 = 481 baseline + 118 probe; S3ARM 157 = 39 baseline + 118).
  Sample: `SEL52CTX seq=0 bar=2026.08.26 09:10 site=S3ARM …`,
  `seq=1 bar=2026.08.26 09:15 site=S2POLL …` (site/mode/halt present —
  the build-1 shift defect is closed).
- SEL52: 14376 rows = 24 × 599 (matrix ran over every CTX row).
  `SEL52_FINAL`: 24 rows, all `ctxRows=599`; `defRows=597/589/599/597/
  597/555/599/560 …` per variant (verbatim in journal).
- SEL53: 168 rows = 24 × 7 (R1–R5+S1/S2 all defined, `def=1` everywhere;
  zero FRACTAL_UNAVAILABLE / AMBIGUOUS_IDENTITY / INVALID_GEOMETRY —
  every cell `status=OK`).
- SLIMB-family: `SLIMB fields=19 => 481`, `SLIMBWALK fields=27 => 481`,
  `SLIMBWALKF fields=25 => 481`, `SLIMBR bar= => 10` (see isolation).

### G5 — presence, REPORTED (complete traces; his SHORTs absent, EA LONG opposed)

- `SEL54BAR`: 2 rows — `bar=2026.09.08 10:10 sess=1 inWin=1 upstream=1
  cqd=EMPTY bias1=-1.0 bias2=-1.0 carried=LONG` and `bar=2026.09.08 17:00
  sess=2 inWin=1 upstream=1 cqd=EMPTY bias1=-1.0 bias2=-1.0 carried=LONG`.
- `SEL54STAGE`: 2 rows — both `stage=S2POLL dir=LONG state=S2_LTF_ALIGN`
  (10:10 and 17:00). No S3ARM/S5 stage rows at either bar.
- `SEL54_FINAL s1hook=1 s2hook=1`; `SEL56_FINAL ctxRows=599 s1hook=1
  s2hook=1 sel55rows=5`.
- Reading: both Sep-8 bars processed in-window with upstream candidates,
  carried LONG throughout; no SHORT generated at either bar (matches the
  standing disclosure that the EA is LONG-opposed at S1/S2).

### G6 — components, REPORTED (S2 TP gap stays gap)

`SEL55` 5/5 rows + `SEL55_FINAL rows=5`:
`ex=R1 bar=2026.08.28 10:00 codedir=SHORT codeentry=1.16466
codetp=1.16364 hisentry=1.16466 histp=1.16364 cqd=EMPTY`;
`ex=R2 bar=2026.09.04 10:35 codedir=SHORT codeentry=1.16265
codetp=1.16224 hisentry=1.16265 histp=1.16224 cqd=EMPTY`;
`ex=R3 bar=2026.09.04 15:55 codedir=LONG codeentry=1.16018
codetp=1.16302 hisentry=1.16018 histp=1.16302 cqd=EMPTY`;
`ex=R4 bar=2026.09.07 09:15 codedir=LONG codeentry=1.16135
codetp=1.16200 hisentry=1.16135 histp=1.16200 cqd=EMPTY`;
`ex=R5 bar=2026.09.07 16:40 codedir=LONG codeentry=1.16261
codetp=1.16315 hisentry=1.16261 histp=1.16318 cqd=EMPTY`.
Code side/entry/target exact vs HAND on R1–R4; R5 entry+side exact, TP
+3 (known Yearly-VWAP drift 1.16315 vs 1.16318). CQD-state EMPTY at all
five S5 rows (R2 divergence now DATA for the third run in a row).
Unrounded R on the closest-to-HAND rows: R1 2.429 (pre-reg 2.43),
R3 1.661 (1.66), R4 best 1.383 (pre-reg 1.76 — miss), R5 retained 2.478
(2.48); R2 1.281 takes-everywhere (pre-reg 1.206 basis — threshold
cannot explain the decline); S1 0.669 (declines on R); S2 uncomputable.

### O1≡O2 + desk prediction (pre-registered, graded-not-gated)

- O1≡O2 HOLDS: SIG vs FILL identical on every example (V001≡V009,
  V005≡V013 on R1/R2/R3/R4/R5/S1/S2 — fill bar carries no fractal; shown,
  not assumed).
- Monotone prediction PASSES: MONO wins R1 at 06:30 slot 43
  (`skN=5 skE=1`: five non-qualifying skips + extremity evidence),
  RAW lands 09:35. Graded, not gated — G1 still decides (FAIL).

### Isolation gate — PASS (run accepted as evidence)

- `InpAdoptExt1 = false` (line 65, compiled default; adoption paths
  dormant — E50 `if(InpAdoptExt1 && InpDebugLog)` never fires print-only).
- Join vs RECON17 (payload compare after journal-prefix strip):
  SLIMB 481/481 IDENTICAL 0 mismatch; WALKOB 481/481; WALKFR 481/481;
  SLIMBR 10/10 IDENTICAL.
- Signals 4/4 identical: `2026.08.28 10:05 SHORT … R=2.43 SL 1.16508
  TP 1.16364`, `2026.09.04 16:00 LONG … R=2.56 SL 1.15907 TP 1.16302`,
  `2026.09.07 09:20 LONG … R=1.76 SL 1.16098 TP 1.16200`,
  `2026.09.07 16:45 LONG … R=1.25 SL 1.16218 TP 1.16315`.
- Census identical: BIASCENSUS `bars=3168 sh1 neg=1554 pos=1614`,
  ZONECENSUS `xobOnly=3168`, WS161 `loads=3168 stores=3168 changes=205
  mismatch=0`; ticks/bars 563338/3168.
- Handles: `SEL fractal handle M5=13 err=0`, `H1=14 err=0`.

## 4. Disposition

P-SEL-1 is DEAD per its own failure gate (G1 0/12, best 2/4; R4 universal
miss is the load-bearing miss, R5 filed-gap is by-design). No rerun, no
tuning. RECON17 (`6ACDF3B8…`) stays frozen baseline of record. Build-2
(`766BADDC…`) stays UNCOMMITTED (no token). Council ruling owed on the
v16 relay (close P-SEL-1 and next direction). No adoption, no selection
change, no digest move.
