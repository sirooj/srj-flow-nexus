# BUILDER SLICE B-107 - artifact checks, case rows, matrices, record lines (June classification, MEASURED)

Scope: offline classification of recovered June rows vs OHLC/register/words. No edit, compile, launch, run, gate, grade. Live files only.

## START GATE (raw)

- `git ls-remote ... builder/B-106` = `91c4eaee6cb82adad9804ebb9572ca649eb99ae0` (verified; cut builder/B-107 here).
- `git log -1` = `91c4eae B-106 June XOB rows recovered for ruled-out comparison (relay B-106)`.
- `git status --short` line count = 427 (prior artifacts + B106 June files/scripts; preserved, untouched).
- `git diff 91c4eaee6cb82adad9804ebb9572ca649eb99ae0 --` EMPTY on every committed file named.
- EA disk `137076d9cf85160ab8cd8379575afd4801e71098ce97c0b10d88a42c7bf59671` LF same (LF-only). EX5 `fa4c924978f6...`. Indicator at gate SHAs, untouched.
- June CSVs present with B-106 SHAs (TARGETS 761 lines `36844a2b...`; INC 77909963 B `6ec47f5d...` re-hashed identical). No terminal64 launched, no compile, no tester run. No STOP.

## PART B GREPS (before/after)

- Operator message = B-107 relay order only; no new trading-rule words. Record `no new rule words`; appended nothing.
- `B-107-JUNE-XOB-SEPARATOR-CLASSIFICATION` in 99_WORKFLOW 0->1 (context X1). `B-107` in 99_WORKFLOW 0->1 (handoff X2).
- `B107-JUNE-XOB-SEPARATOR-CLASSIFICATION` in SRJ_FlowNexus_Local 0->1 (ledger 1252). `^1252.` 0->1; `^1251.` = 1 beside.

## READS (in relay order, on builder/B-106)

- Pointer 20 lines; RESULT_B106 head (89-line file, prior turn, unchanged); SLICE_B106 head (96-line file, prior turn, unchanged); RESULT_B105 section (98-line file, unchanged); RESULT_B104 tail (103-line file, unchanged); RESULT_B103 section (84-line file, unchanged); PLANNER_CONTEXT §4 tail (128-line file, B-106 lesson present); PLANNER_HANDOFF §3 tail (68-line file, B-106 line present); relay skill whole (67 lines); strategy skill whole (64 KB; s178/B-70/B-91/JUN05NY re-verified); spec v4.2 (35807 B, identical bytes); register (11072 B, identical bytes: rows 310/314/306 + 5/13/17); JUNE_TARGETS verified (761 lines); JUNE_INCREMENTAL re-hashed identical; journal grepped (rows 5/13/17 context, 306 VALID, 307/308 London context, 310 INVALID 2 June, 314 NOT-HIS-TAKE 4 June).

## RAW ARTIFACT CHECKS (R1)

- TARGETS 761 lines (760 rows + header), SHA `36844a2b8c7ecf305bb49488a3f72698e0e0548dcad66897c8e9457228fb8170`. INC 77909963 B, SHA `6ec47f5d...` (re-hashed identical to B-106).
- Six candles exact: 1780410000 (123 rows), 1780564200 (139), 1780566900 (130), 1780675200 (122), 1780675800 (123), 1780676100 (123); sum 760. Single build `2026.10.08 21:25:54`, paths `INCREMENTAL2` on every row. 18-field schema re-verified in the recompute.

## EXACT CASE ROWS (touch rows row-verified; full sets in XOBDIAG_JUNE_TARGETS.csv)

- 5JUN1600 id 3150: `XOBDIAG;1780675200;3150;B;159.85300000;159.82000000;1780588200;1780588500;1780589100;1;1;1;1780588500;NA;159.83650000;2026.10.08 21:25:54;INCREMENTAL;2` (B, relevant-valid, touches 159.726-160.262).
- 5JUN1600 id 3308: `XOBDIAG;1780675200;3308;B;159.91600000;159.88100000;1780670100;1780670400;1780674000;1;1;1;1780673400;NA;159.89850000;2026.10.08 21:25:54;INCREMENTAL;2` (B, relevant-valid, touches).
- 4JUN0910/0955 id 3099: `XOBDIAG;1780564200;3099;B;159.86800000;159.79700000;1780558800;1780559100;1780560900;1;1;1;1780559100;NA;159.83250000;2026.10.08 21:25:54;INCREMENTAL;2` (B vs SHORT fires: opposite-direction 1-point edge touches, hence trade-direction touch 0).
- 2JUN1420: zero touches in 30 relevant-valid (B104-style above/below split logic re-applied in verification).

## PRIMARY COMPARISON (R2/R3; independent clean-loop recompute, all six cells match B-106 expected - no forcing)

- 2JUN1420 (LONG): total 123, relV 30, td 30, tdTouch 0, tdNon 30.
- 4JUN0910 (SHORT): total 139, relV 34, td 3, tdTouch 0, tdNon 3.
- 4JUN0955 (SHORT): total 130, relV 34, td 3, tdTouch 0, tdNon 3.
- 5JUN1600 (LONG): total 122, relV 32, td 32, tdTouch 2, tdNon 30.
- 5JUN1610 (LONG): total 123, relV 32, td 32, tdTouch 0, tdNon 32.
- 5JUN1615 (LONG): total 123, relV 32, td 32, tdTouch 0, tdNon 32.

## LIFECYCLE TIMING (R4)

- 16:00 retest (classification anchor) / 16:10 confirmation / 16:15 entry-open (banked path). 16:10 + 16:15 touch-absence (0/0) is context, never a retest failure. No post-entry selection. 5m flip never XOB evidence.

## READING MATRIX (R5; primary = touch at counted retest; confirmation/entry = context)

- TRADE-DIRECTION-RELEVANT: 2JUN MET(30); 4JUN0910 MET(3); 4JUN0955 MET(3); 5JUN1600 MET(32); 5JUN1610 MET(32); 5JUN1615 MET(32).
- TRADE-DIRECTION-TOUCH-AT-COUNTED-RETEST: 2JUN1420 NOT MET(0); 4JUN0910 NOT MET(0); 5JUN1600 MET(2).
- TRADE-DIRECTION-NONTOUCH-AT-COUNTED-RETEST: 2JUN MET(30); 4JUN0910 MET(33); 5JUN1600 MET(30).
- TOUCH-AT-CONFIRMATION-OR-ENTRY: 4JUN0955 NOT MET(0); 5JUN1610 NOT MET(0); 5JUN1615 NOT MET(0); 2 June n/a UNKNOWN.

## SEPARATOR MATRIX (R7; valid = 5JUN1600 retest; ruled-out = 2JUN1420 + 4JUN0910/0955; 16:10/16:15 context)

- TRADE-DIRECTION-RELEVANT | valid MET(32) | ruled-out MET(30) + MET(3)/MET(3) | none | DOES-NOT-SEPARATE
- TRADE-DIRECTION-TOUCH-AT-COUNTED-RETEST | valid MET(2) | ruled-out NOT MET(0) + NOT MET(0)/NOT MET(0) | none | SEPARATES
- TRADE-DIRECTION-NONTOUCH-AT-COUNTED-RETEST | valid MET(30) | ruled-out MET(30) + MET(33)/MET(33) | none | DOES-NOT-SEPARATE
- TOUCH-AT-CONFIRMATION-OR-ENTRY | context (0/0) | n/a UNKNOWN + NOT MET(0) | none | UNKNOWN (context, not a setup classification)
- R6 words beside (never as): 2 June no-touch words onto 30/0; 4 June three reasons with bias/CQD excluded (3/0 per candle); 5 June path with flip excluded (32/2 at 16:00; 32/0 at 16:10/16:15). B-91 single-condition preserved. §3.6/§10: touch used as positive discriminator, never a rejection.
- R8: `JUNE-XOB-SEPARATOR-FOUND-OFFLINE` (complete provenance, no contradiction; thin-margin note filed: separation rests on 2 rows at one candle - buildability + rule-authority review next before any edit).

## RECORD LINES (exact)

- X1 context §4 appended once: `- B-107-JUNE-XOB-SEPARATOR-CLASSIFICATION (planner lesson 2026-10-08, B-107): classified the recovered June XOB rows at the counted retest and kept confirmation/entry context separate without enabling a gate.`
- X2 handoff §3 appended once: `- B-107: classified the recovered June XOB rows; no gate or trade grade was performed.`
- X3 ledger `1252.` appended once (tag `B107-JUNE-XOB-SEPARATOR-CLASSIFICATION`; hashes, provenance, comparison, matrices, R8, no edit/compile/run/gate/grade).
- X4 pointer 20->20 lines (cap 35): latest B-107 MEASURED; FOUND-OFFLINE; kept EA/EX5 unchanged; no compile/runs; no gate/grade; next reviews buildability + rule-authority.
- Pre-commit re-check: X1/X2/X3 counts 1; `^1251.` = 1; staged set = 6 relay files only; no source diff; no run tables.

(End of slice)
