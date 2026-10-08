# BUILDER SLICE B-104 - artifact checks, OHLC, classifications, matrices, record lines (offline separator, MEASURED)

Scope: offline measurement of FULL-XOB-RETRACE-OR-TOUCH on recovered rows + existing candle records. No edit, compile, launch, run, gate, grade. Live files only.

## START GATE (raw)

- `git ls-remote ... builder/B-103` = `9368ae5e8eb97c5242efaab810831c216f4188a1` (verified; cut builder/B-104 here).
- `git log -1` = `9368ae5 B-103 EU XOB record review of recovered RECON62 rows (relay B-103)`.
- `git status --short` line count = 413 (prior artifacts; preserved, untouched).
- `git diff 9368ae5e8eb97c5242efaab810831c216f4188a1 --` EMPTY on every committed file named.
- EA disk `137076d9cf85160ab8cd8379575afd4801e71098ce97c0b10d88a42c7bf59671` LF same (LF-only). EX5 `fa4c924978f6...`. Indicator at gate SHAs, untouched.
- No terminal64 launched, no compile, no tester run. Both CSVs present (EU_TARGETS 1446 lines `623ce07d...`; INC 346247 lines `12f08bd0...`). No STOP.

## PART B GREPS (before/after)

- Operator message = B-104 relay order only; no new trading-rule words. Record `no new rule words`; appended nothing.
- `B-104-OFFLINE-XOB-SEPARATOR` in 99_WORKFLOW 0->1 (context X1). `B-104` in 99_WORKFLOW 0->1 (handoff X2).
- `B104-OFFLINE-XOB-SEPARATOR` in SRJ_FlowNexus_Local 0->1 (ledger 1249). `^1249.` 0->1; `^1248.` = 1 beside.

## READS (in relay order, on builder/B-103)

- Pointer 20 lines; RESULT_B103 head (84-line file, prior turn, unchanged); SLICE_B103 head (72-line file, prior turn, unchanged); RESULT_B102 tail (84-line file, unchanged); RESULT_B101 head (73-line file, unchanged); PLANNER_CONTEXT §4 tail (122-line file, B-103 lesson present); PLANNER_HANDOFF §3 tail (62-line file, B-103 line present); relay skill whole (67 lines); strategy skill whole (64 KB; s178/B-70/B-91 grep-verified; C-1530 direction search: only 10 June hits, none on the 1 Sep take); spec v4.2 (35807 B, whole read prior turn on identical bytes, line-133 anchor re-verified); register (11072 B, whole read prior turn on identical bytes); EU_TARGETS (1446 lines, header verified); INC source spot-checked; journal grepped (rows 301/303/304/313: rulings + entry/target prices, no counted-candle OHLC).

## RAW ARTIFACT CHECKS (R1)

- 13 distinct barT, each an exact requested epoch; 1445/1445 rows `XOBDIAG_RECON62_INCREMENTAL.csv`, build `2026.10.08 20:34:34`, `INCREMENTAL;2`. 18-field schema on every row. Provenance matches B-102 (copies `4487afe3...`/`12f08bd0...` re-verified). Zero mismatches, no STOP.

## EXACT OHLC RECORDS (R2; UJBARMAP EA-diagnostic prints, RECON62-B102 journal, Core 04)

- F2 08-26 16:25: 1.16572/1.16578/1.16552/1.16570
- A1 08-28 09:55: 1.16473/1.16491/1.16473/1.16482
- C-1530 09-01 15:25: 1.15931/1.15943/1.15920/1.15922
- A2 09-01 16:45: 1.16013/1.16013/1.15975/1.15990
- A2 09-01 17:25: 1.16064/1.16066/1.16009/1.16011
- A3 09-03 15:40: 1.16227/1.16227/1.16178/1.16188
- A3 09-03 15:50: 1.16232/1.16301/1.16208/1.16286
- A4 09-07 09:00: 1.16143/1.16143/1.16103/1.16116
- A4 09-07 09:10: 1.16116/1.16119/1.16102/1.16114
- A5 09-07 16:05: 1.16247/1.16251/1.16238/1.16245
- A5 09-07 16:35: 1.16261/1.16263/1.16246/1.16250
- A6 09-08 10:00: 1.16210/1.16229/1.16198/1.16223
- A7 09-08 16:50: 1.16218/1.16233/1.16208/1.16225
- Continuity: A4 09:00 close = 09:10 open (1.16116). First-pass regex typo under-matched 09:10 (owned, re-grepped exactly, FOUND). Journal carries no counted-candle OHLC (rulings/prices only).

## GROUP CLASSIFICATIONS (R3/R4; relevance = promoted=1 + promoT<=candle; touch = range intersect; script b104_measure.ps1, rows only)

- F2 08-26 16:25 (S): total 102, relevant-valid 34, touch 0, nontouch 34, td 11/0/11.
- A1 08-28 09:55 (S): total 112, relevant-valid 35, touch 0, nontouch 35, td 13/0/13. Independent recheck: 13 zones above + 22 below the 1.16473-1.16491 range, 0 intersecting (zero-touch measured, not a bug).
- C-1530 09-01 15:25 (dir UNKNOWN): total 111, relevant-valid 36, touch 0, nontouch 36, td UNKNOWN.
- A2 09-01 16:45 (B): 110, 37, 0, 37, td 18/0/18. A2 17:25 (B): 112, 39, 0, 39, td 20/0/20.
- A3 09-03 15:40 (B): 102, 32, 0, 32, td 18/0/18. A3 15:50 (B): 103, 32, 0, 32, td 18/0/18.
- A4 09-07 09:00 (B): 118, 38, 0, 38, td 20/0/20. A4 09:10 (B): 118, 38, 0, 38, td 20/0/20.
- A5 09-07 16:05 (B): 116, 41, 0, 41, td 25/0/25. A5 16:35 (B): 119, 41, 0, 41, td 25/0/25.
- A6 09-08 10:00 (S): 113, 40, 0, 40, td 16/0/16. A7 09-08 16:50 (S): 109, 36, 0, 36, td 16/0/16.
- No invalidity relabeled as kills; no bias/depth/recency/tolerance condition added; adjacent candles never merged.

## READING MATRICES (R5; counts = rows behind MET)

- ANY-DIRECTION-RELEVANT: MET x13 (34,35,36,37,39,32,32,38,38,41,41,40,36 candle order F2..A7). No NOT MET, no UNKNOWN.
- TRADE-DIRECTION-RELEVANT: MET x12 (11,13,18,20,18,18,20,20,25,25,16,16); C-1530 UNKNOWN.
- TRADE-DIRECTION-TOUCH: NOT MET x12 (0 each); C-1530 UNKNOWN (full-pop touch likewise 0, fact not reading).
- TRADE-DIRECTION-NONTOUCH: MET x12 (11,13,18,20,18,18,20,20,25,25,16,16); C-1530 UNKNOWN.

## SEPARATOR MATRIX (R7/R8; valid = 11 section-A candle-groups; ruled-out = C-1530 tester-only NOT his; F2 ruling-absent UNKNOWN, excluded)

- ANY-DIRECTION-RELEVANT | valid 11/0/0 | ruled-out 1/0/0 (MET, 36 rows) | none | DOES-NOT-SEPARATE
- TRADE-DIRECTION-RELEVANT | 11/0/0 | 0/0/1 (no direction) | none | UNKNOWN
- TRADE-DIRECTION-TOUCH | 0/11/0 | 0/0/1 | none | DOES-NOT-SEPARATE
- TRADE-DIRECTION-NONTOUCH | 11/0/0 | 0/0/1 | none | UNKNOWN
- R6: F2 compared without rule inference; A1 at-bar only; A2-A7 candles separate; C-1530 tester-only kept; 2 June/4 June NOT IN THIS POPULATION.
- R9: `OFFLINE-SEPARATOR-NOT-FOUND` (nothing missing: 13/13 groups + 13/13 OHLC; not PARTIAL). Offline only; no gate. Subsidiary fact: trade-direction relevant XOBs exist on all 11 valid candles (11-25 rows) and are uniformly non-touching (§3.6-permitted, §9.12-now-measured).

## RECORD LINES (exact)

- X1 context §4 appended once: `- B-104-OFFLINE-XOB-SEPARATOR (planner lesson 2026-10-08, B-104): measured full-population XOB retracement/touch evidence across the recovered EU counted candles without editing or enabling a gate.`
- X2 handoff §3 appended once: `- B-104: measured one offline full-population XOB separator across the recovered EU counted candles; no gate or trade grade was performed.`
- X3 ledger `1249.` appended once (tag `B104-OFFLINE-XOB-SEPARATOR`; artifacts+hashes, OHLC provenance, 13 classifications, four matrices, separator matrix, R9, no edit/compile/run/gate/grade).
- X4 pointer 20->20 lines (cap 35): latest B-104 MEASURED; NOT-FOUND; kept EA/EX5 unchanged; no compile/runs; no gate/grade; next follows the offline result.
- Pre-commit re-check: X1/X2/X3 counts 1; `^1248.` = 1; staged set = 6 relay files only; no source diff; no run tables.

(End of slice)
