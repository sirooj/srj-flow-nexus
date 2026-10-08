# BUILDER SLICE B-92 - raw greps, B-91 evidence refs, four-reading table, R3 inputs, before/after lines (XOB parked, MEASURED)

Conventions: kept EA 137076D9CF85 (695359 B, LF-only); kept EX5 FA4C924978F6. B-91 journals j45 BF03B8A2 / j46 9B2F44B6 on EA 55D91C7E. Readings: MACH-1 machine verdict, WF-1 from-formation, WP-1 from-promotion, PXS-1 stop-leg — all as ONE in-play condition per his B-91 words. Zero tolerance. No source diff. No run tables.

## START GATE (raw)

- `git ls-remote ... builder/B-91` = `237b6562eb3a0ec49fee8d346d4cc1141e728871` (verified; cut builder/B-92 here).
- `git log -1` = `237b6562eb3a0ec49fee8d346d4cc1141e728871 B-91 bank retrace-is-in-play, one-condition re-grades, nothing separates (relay B-91)`.
- `git status --short` line count = 359 (tracked ` M` drift + untracked lane dirt; preserved, untouched).
- `git diff 237b65... --` EMPTY on: pointer, RESULT/SLICE B88/B89/B90/B91, PLANNER_CONTEXT, PLANNER_HANDOFF, LEDGER, REGISTER, both skills.
- EA disk SHA `137076D9CF85160AB8CD8379575AFD4801E71098CE97C0B10D88A42C7BF59671` (DiskBytes 695359; NormBytes 695359; no CR; prefix matches).
- EX5 disk SHA `FA4C924978F6A1D5C57B725F2AB530BBB5DC5B1E0D1D0B51FB0172E80D8C41B5` (prefix matches).
- No terminal64. No compile. No tester run.

## PART B GREPS (before/after)

- Operator message = B-92 relay order only; no new trading-rule words. Record `no new rule words`; appended nothing.
- Skill/B-91 quotes: `"what i meant by retrace and in play are the same thing."` skill 1 (SKILL.md:202); `"when i reexplain a rule..."` skill 1 (SKILL.md:204). Both FOUND exactly once; not re-banked.
- `B92-XOB-PARKED-NONSEPARATOR` in SRJ_FlowNexus_Local 0→1 (ledger 1237 only). `B-92-XOB-PARKED-NONSEPARATOR` in 99_WORKFLOW 0→1 (context X1 only). `B-92` in 99_WORKFLOW 0→1 (handoff X2 only; context X1 carries the longer tag, counted separately).
- Ledger `^1236.` = 1 (line 6934, B91-INPLAY-ONE-READ); `^1237.` 0→1; `B91-INPLAY-ONE-READ` beside (result/pointer/slice/ledger).

## R2 FOUR-READING DECISION TABLE (B-91 evidence; every row tied to j45/j46 EA 55D91C7E)

| reading | B-91 verdict | failing names | exact B-91 source |
|---|---|---|---|
| MACH-1 | DOES NOT SEPARATE | A1 28 Aug, A6 8 Sep London, A7 8 Sep NY (all NOT MET) | RESULT_B91 R2 table + R5 (file lines 26-44, 47); SLICE_B91 R2 lines 19/28/29 + R3 line 48 |
| WF-1 (from-formation) | DOES NOT SEPARATE | F1 2 June fire MET (admits); F3 4 June MET (differs from his "no retest") | RESULT_B91 R2 + R3 (lines 26-45); SLICE_B91 R2 lines 34/36-37 + R3 line 49 |
| WP-1 (from-promotion) | DOES NOT SEPARATE | A1, A6, A7 NOT MET (same three as machine) | RESULT_B91 R2 + R4 (lines 26-46); SLICE_B91 R2 lines 19/28/29 + R4 line 54 |
| PXS-1 (stop-leg) | DOES NOT SEPARATE | A2 1 Sep long NOT MET (misses); F1 MET (admits 2 June); F3 MET (differs 4 June words; bias+CQD beside) | RESULT_B91 R2 + R3 + R5 (lines 26-48); SLICE_B91 R2 lines 20-21/34/36-37 + R3 line 49 |

- Register scope beside: A1-A7 section A (his 7 EU); B1 ABSENT / B2 / B3 section B (UJ owed); F1 0602-NO-SETUP / F2 8/27 target-step / F3 0604-NOT-HIS / F4 0610-INVALID / C-1530 tester-only section C; 4Sep1040 / 28Aug1625 / 8Sep1645-LONG / news ABSENT with reasons (RESULT_B91 R1 line 23; SLICE_B91 R1 lines 11-13).
- 65-pass scope beside: 43 EU + 22 UJ; diffs MACH-1 29 / WF-1 12 / WP-1 11 / PXS-1 7; fires MACH-1 7-6 / WF-1 13-0 / WP-1 9-4 / PXS-1 12-1; refusals beside (RESULT_B91 R4 line 46; SLICE_B91 R4 lines 54-62). Grade rescues no reading (RESULT_B91 R6 line 48).
- No cell CONTRADICTED; none NOT FOUND.

## R3 INPUT-LIMITATION EVIDENCE (no reinterpretation)

- Trade-direction pick zone read FOUND (:6911/:8800) but trade-side content when bias differs NOT FOUND (no per-side buffer; B-89 R1 instances A2-16:45/17:25, A5-16:05, F3-09:10): SLICE_B91 R6 line 66; RESULT_B89 R1 line 20 + R6 line 45.
- PromoT (33) FOUND (:8790, same side caveat): SLICE_B91 R6 line 66; RESULT_B89 R6 line 45.
- Formation time NOT FOUND (no obStart export; buffers 30/39 are leg/swing times, EA reads :7076/:5015 - checked different): SLICE_B91 R6 line 66; RESULT_B89 R6 line 45.
- OHLC FOUND (:2289+); swings FOUND (6/7 reads :7128/:6082/:6133); B60C candle FOUND (.B82C :9392/:9413/:9602 + :2551): SLICE_B91 R6 line 66.
- Kill state NOT FOUND (zero OBPROV consumers on kept EA): SLICE_B91 R6 line 66; RESULT_B90 R6 line 43.
- Machine verdict prints (ZONEPICK :8873 / INPLAYCOMMIT :9286) exist only at evaluated bars — 13 R4 UNKNOWNs; print coverage, not a complete runtime map: SLICE_B91 R6 line 67; RESULT_B91 R6 line 48.
- B-89 verdicts: W-F NOT-BUILDABLE (pick zone + formation time), W-P NOT-BUILDABLE (pick zone): RESULT_B89 R6 line 45.
- B-90 verdict: NOT-BUILDABLE (trade-direction pick zone; also kill state): RESULT_B90 R6 line 43.
- B-91 carry: no grade separates, so no new buildability verdict; B-89 R6 + B-90 R6 carried unchanged: RESULT_B91 R6 line 48.

## R4/R5 DECISION (planner words, relay B-92)

- `XOB-SEPARATOR-PARKED-NONSEPARATOR`: no reading authorized for a gate; no source edit; no compile/run; full live-XOB requirement NOT BUILDABLE from current EA-readable inputs; term parked, not ruled out; resume only on new operator-approved readable source or new record evidence; no reopening of the same four readings without new evidence.
- Distinction: not a verdict on his rule; not a pick-only replacement; no tolerance/window; present inputs cannot support a faithful implementation.

## BEFORE/AFTER RECORD LINES (exact)

- X1 context §4 appended once: `- B-92-XOB-PARKED-NONSEPARATOR (planner lesson 2026-10-08, B-92): B-91 found no separator across the four one-condition in-play readings on the full register and 65 passes; the XOB gate is parked as NOT BUILDABLE from current EA-readable inputs, with no source edit or run.`
- X2 handoff §3 appended once: `- B-92: parked the XOB separator as NOT BUILDABLE after B-91 found no separating reading; no source edit or run.`
- X3 ledger `1237.` appended once (tag `B92-XOB-PARKED-NONSEPARATOR`; carries B-91 provenance 237b6562 + ledger 1236, four-reading failures, A/B/C + 65-pass scope, input limitation, rule-vs-buildability distinction, no edit/compile/run, parked pending new evidence).
- X4 pointer 20→20 lines (cap 35): latest B-92 MEASURED; separator parked NOT BUILDABLE; EA/EX5 unchanged; no compile/runs; next needs genuinely new evidence, no repeat of the four readings.
- Gate re-check pre-commit: X1/X2/X3 counts 1 each; `^1236.` = 1; `B-92` duplicates none; staged set = 6 relay files only.

(End of slice)
