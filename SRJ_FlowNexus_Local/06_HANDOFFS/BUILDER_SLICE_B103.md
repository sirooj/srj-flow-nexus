# BUILDER SLICE B-103 - artifact checks, provenance, 13 groups, classifications, record lines (EU record review, MEASURED)

Scope: read-only review of recovered EU XOB rows vs register/spec/skill/XOBSUIT-1/provenance. No edit, compile, launch, run, gate, grade. Live files only.

## START GATE (raw)

- `git ls-remote ... builder/B-102` = `983ac47fa5cc364d268ae61bc55fdf3c4039782b` (verified; cut builder/B-103 here).
- `git log -1` = `983ac47 B-102 RECON62 counted-candle rows recovered with exact artifact hashes (relay B-102)`.
- `git status --short` line count = 413 (prior artifacts; preserved, untouched).
- `git diff 983ac47fa5cc364d268ae61bc55fdf3c4039782b --` EMPTY on every committed file named.
- EA disk `137076d9cf85160ab8cd8379575afd4801e71098ce97c0b10d88a42c7bf59671` LF same (LF-only). EX5 `fa4c924978f6a1d5c57b725f2ab530bbb5dc5b1e0d1d0b51fb0172e80d8c41b5`. Indicator src/ex5 at gate SHAs, untouched.
- No terminal64 launched, no compile, no tester run. CSVs present (not NOT FOUND). No STOP.

## PART B GREPS (before/after)

- Operator message = B-103 relay order only; no new trading-rule words. Record `no new rule words`; appended nothing.
- `B-103-EU-XOB-RECORD-REVIEW` in 99_WORKFLOW 0->1 (context X1). `B-103` in 99_WORKFLOW 0->1 (handoff X2).
- `B103-EU-XOB-RECORD-REVIEW` in SRJ_FlowNexus_Local 0->1 (ledger 1248). `^1248.` 0->1; `^1247.` = 1 beside.

## READS (in relay order, on builder/B-102)

- Pointer 20 lines; RESULT_B102 head (84-line file, prior turn, unchanged); SLICE_B102 head (109-line file, prior turn, unchanged); RESULT_B101 head (73-line file, unchanged); RESULT_B100 head (59-line file, unchanged); PLANNER_CONTEXT whole (120 lines); PLANNER_HANDOFF whole (60 lines); relay skill whole (67 lines); strategy skill whole (64 KB, grep-verified: s178 line 178; B-70 veto line 198; B-91 lines 202/204); spec v4.2 whole (396 lines, §§3.5/3.5.1/3.6/10); register whole (65 lines, A/B/C/D); XOBSUIT-1 §6 whole (ruling 2026-09-09 verbatim); EU_TARGETS verified (1446 lines); INC source spot-checked (A1 112, A7 109, exact).

## RAW ARTIFACT CHECKS

- `XOBDIAG_RECON62_EU_TARGETS.csv`: present, 1446 lines (header + 1445 rows), SHA `623ce07d92945bd62369dfc941fb35e0bea0779cb89744d3666d480ae1b18a93`.
- Header: `srcFile;barT;objId;dir;hi;lo;startT;createT;promoT;valid;active;promoted;validationT;invalidationT;invalidationLevel;build;calcPath;runPass` (18 columns; all R1 fields present).
- 13 distinct barT, each an exact requested epoch; all rows `XOBDIAG_RECON62_INCREMENTAL.csv`, build `2026.10.08 20:34:34`, `INCREMENTAL;2` (1445/1445).
- First data rows: `...;1787761500;189;B;1.15612000;1.15500000;1786551000;1786551600;1786717500;1;1;1;1786716900;NA;1.15556000;2026.10.08 20:34:34;INCREMENTAL;2` and `...;1787761500;197;B;1.15512000;1.15428000;1786555800;1786556100;NA;1;1;0;1786705200;NA;1.15470000;2026.10.08 20:34:34;INCREMENTAL;2`.
- Source `XOBDIAG_RECON62_INCREMENTAL.csv`: 48497150 B, 346247 lines, SHA `12f08bd09960d8a4e7a0c79be2b3376228d25e201986f4f62f5d68c01671b43b` (re-verified identical to B-102). FRESH copy `4487afe3...` re-verified identical.
- Producing-artifact SHAs match B-102: EA src `.B102RECON62` `b5be962a...`, indicator `45682cab...`, diag EX5s `4eeed526...`/`f8d85ea9...` (filed record values; live EX5s restored-kept `FA4C924978F6`/`27B5F272DCFA` re-verified).

## EXACT PROVENANCE ROWS (B-102 record, this review's basis)

- FRESH header `HEADER;EURUSD;300;123050;2026.10.08 20:34:34;1735776000;FRESH;1`; INC header `HEADER;EURUSD;300;123051;2026.10.08 20:34:34;1735776000;INCREMENTAL;2`. Row builds single `2026.10.08 20:34:34`; EA census `2026.10.08 20:34:52`. EURUSD/300/window 1787702400-1788998400. PROV symMatch=1 perMatch=1 runPass 1/2, pathBad=0 both files.

## 13 GROUP COUNTS (register row | candle (UTC) | total | B/S | valid | promoted | distinct | build | run)

- A1 | 08-28 09:55 | 112 | 64/48 | 82 | 36 | 112 | 20:34:34 | RECON62-B102
- A2 | 09-01 16:45 | 110 | 49/61 | 82 | 37 | 110 | 20:34:34 | RECON62-B102
- A2 | 09-01 17:25 | 112 | 50/62 | 81 | 39 | 112 | 20:34:34 | RECON62-B102
- A3 | 09-03 15:40 | 102 | 50/52 | 75 | 34 | 102 | 20:34:34 | RECON62-B102
- A3 | 09-03 15:50 | 103 | 51/52 | 75 | 34 | 103 | 20:34:34 | RECON62-B102
- A4 | 09-07 09:00 | 118 | 56/62 | 85 | 38 | 118 | 20:34:34 | RECON62-B102
- A4 | 09-07 09:10 | 118 | 57/61 | 85 | 38 | 118 | 20:34:34 | RECON62-B102
- A5 | 09-07 16:05 | 116 | 61/55 | 87 | 41 | 116 | 20:34:34 | RECON62-B102
- A5 | 09-07 16:35 | 119 | 62/57 | 88 | 41 | 119 | 20:34:34 | RECON62-B102
- A6 | 09-08 10:00 | 113 | 62/51 | 84 | 41 | 113 | 20:34:34 | RECON62-B102
- A7 | 09-08 16:50 | 109 | 54/55 | 80 | 38 | 109 | 20:34:34 | RECON62-B102
- C-1530 | 09-01 15:25 | 111 | 50/61 | 84 | 37 | 111 | 20:34:34 | RECON62-B102
- F2 | 08-26 16:25 | 102 | 65/37 | 73 | 35 | 102 | 20:34:34 | RECON62-B102
- Distinct == total every candle; id 189 on all 13 (within-run persistence only). Directions from row fields, never the machine buffer.

## EVIDENCE CLASSIFICATIONS (per group; no valid/invalid trade label, no kill-bar language)

- §3.5 (projection/invalidation/age per row): EVIDENCE-PRESERVED x13.
- §3.5.1 (promoT/validationT absolute per row; export answers the old honesty limit): EVIDENCE-PRESERVED x13.
- §3.6+§10 (XOB side complete; touch attribution needs the candle's price range from the chart record): EVIDENCE-PRESERVED x13 with that price-record limitation; never a prohibition reading.
- XOBSUIT-1 §6-a3 (bounds+validity+level present for the SL-leg walk): EVIDENCE-PRESERVED wherever that walk is later measured.
- B-91 single-condition + no-cascade: applied; no cascade made.
- R4: F1/2 June UNKNOWN from this artifact (no June rows by design; venue is the June artifacts); A1/A6/A7/C-1530 (tester-only status kept)/F2 (no ruling attaches, no stop/target reading) evidence preserved as stated.

## RECORD LINES (exact)

- X1 context §4 appended once: `- B-103-EU-XOB-RECORD-REVIEW (planner lesson 2026-10-08, B-103): reviewed the recovered RECON62 EU XOB rows at all 13 counted candles without choosing a gate or grading trades.`
- X2 handoff §3 appended once: `- B-103: reviewed all recovered RECON62 EU XOB counted-candle rows; no gate or trade grade was performed.`
- X3 ledger `1248.` appended once (tag `B103-EU-XOB-RECORD-REVIEW`; artifact+hashes, 13 groups, field coverage, classifications, R6, no edit/compile/run/gate/grade).
- X4 pointer 20->20 lines (cap 35): latest B-103 MEASURED; READY; kept EA/EX5 unchanged; no compile/runs; no gate/grade; next follows R7.
- Pre-commit re-check: X1/X2/X3 counts 1; `^1247.` = 1; staged set = 6 relay files only; no source diff; no run tables.
- R6: `EU-XOB-EVIDENCE-READY-FOR-PLANNER-DESIGN` - 13/13 groups present, provenance complete, evidence preserved for planner design without choosing a gate.

(End of slice)
