# BUILDER RESULT B-92 - XOB separator parked as NOT BUILDABLE after B-91 found no separating one-condition reading, MEASURED

Trader summary: B-91 re-graded retrace and in-play as one condition across every register row and all 65 counted passes. No reading separates his valid and ruled-out trades, and the full live-XOB map remains unreadable by the EA. This relay records the decision and parks the XOB gate; no source edit, compile or tester run is authorized.

## Part 0 - fresh-session start

- 0.1 Relay skill loaded whole first (67 lines), then strategy skill whole second (205 lines; Ruling 2026-10-08 (B-91) retrace-is-in-play + no-cascade re-read).
- 0.2 `git ls-remote https://github.com/sirooj/srj-flow-nexus.git builder/B-91` = `237b6562eb3a0ec49fee8d346d4cc1141e728871` (verified). Cut `builder/B-92` from it. Push via `backup`, never `origin`.
- 0.3 Read in order on `builder/B-91`: pointer (20 lines); RESULT_B91 (65) + SLICE_B91 (75) whole; RESULT_B90 (62) + SLICE_B90 (83) whole; RESULT_B89 (62) + SLICE_B89 (86) whole; RESULT_B88 (68) + SLICE_B88 (124) whole; PLANNER_CONTEXT (98) + PLANNER_HANDOFF (38) whole; both skills whole; spec v4.2 whole (396 lines); register whole (53 lines, 65-row scope).
- 0.4 Names per relay: kept EA `Experts/SRJ_FlowNexus_EA.mq5` prefix `137076D9CF85`; kept EX5 prefix `FA4C924978F6`; kept build hunk S + hunk RKD unchanged; B-91 ruling retrace-and-in-play-one-condition; B-91 ledger item `1236` tag `B91-INPLAY-ONE-READ`; this relay tag `B92-XOB-PARKED-NONSEPARATOR`, item `1237`; result/slice B-92; verdict MEASURED.
- 0.5 Start gate: `git log -1` = `237b6562eb3a0ec49fee8d346d4cc1141e728871` (B-91 head). `git diff 237b6562eb3a0ec49fee8d346d4cc1141e728871 --` EMPTY on every committed file named (pointer, RESULT/SLICE B88-B91, PLANNER_CONTEXT, PLANNER_HANDOFF, LEDGER, REGISTER, both skills). `git status --short` = 359 lines (tracked ` M`/staged-empty drift + untracked lane dirt; preserved, untouched). EA disk SHA `137076D9CF85160AB8CD8379575AFD4801E71098CE97C0B10D88A42C7BF59671` (695359 B; LF-only, NormBytes == DiskBytes, no CR to strip; prefix matches; ` M` vs stale blob = expected uncommitted kept-build lag, never staged). EX5 disk SHA `FA4C924978F6A1D5C57B725F2AB530BBB5DC5B1E0D1D0B51FB0172E80D8C41B5` (prefix matches; binary, no LF normalization). No terminal64. No compile. No tester run. No STOP.
- 0.6 Scope MEASURED (read-only consolidation B-88..B-91, grep-first text records, B-92 result/slice/ledger/pointer/context/handoff writes only).

## Part B - banking

- B1 Grep-first: the operator message carries the B-92 relay order only; it contains no new trading-rule words. Skill, journal and ledger need no new banking for B-92. Record `no new rule words`; appended nothing.

## Part R - planner decision, read-only

- R1 B-91 ruling present in the committed strategy skill exactly once each: `"what i meant by retrace and in play are the same thing."` = 1 (SKILL.md:202); the no-cascade order beginning `"when i reexplain a rule..."` = 1 (SKILL.md:204). Both FOUND. Not re-banked.
- R2 B-91 full-register result confirmed from `BUILDER_RESULT_B91.md` + `BUILDER_SLICE_B91.md`:
  - MACH-1 misses valid 28 Aug (A1) and both 8 Sep takes (A6/A7); the from-formation alternative admits the 2 June fire (F1): FOUND (RESULT_B91 R5 + R2 table lines 26-44; SLICE_B91 R2 cells lines 19/28/29/34 + R3 line 48).
  - WF-1 admits the 2 June fire (F1 MET) and differs from his 4 June words (F3 MET vs "no retest"): FOUND (RESULT_B91 R2 table + R3 lines 44-45; SLICE_B91 R2 lines 34/36-37 + R3 line 49).
  - WP-1 misses the same valid trades as the machine reading (A1/A6/A7 NOT MET): FOUND (RESULT_B91 R2 table + R4 lines 46/48; SLICE_B91 R2 lines 19/28/29 + R4 line 54).
  - PXS-1 misses the valid 1 Sep long (A2 NOT MET) and admits the 2 June fire (F1 MET); it also differs from his 4 June words (F3 MET): FOUND (RESULT_B91 R2 table + R3/R5 lines 44-48; SLICE_B91 R2 lines 20-21/34/36-37 + R3 line 49).
  - No reading separates across the register: FOUND (RESULT_B91 R5 line 47; SLICE_B91 R3 lines 48-50).
  - The 65-pass grade does not rescue any reading: FOUND (RESULT_B91 R4 lines 46/48 + R6 line 48; SLICE_B91 R4 lines 54-62 + R6 lines 64-67).
  - Every cited row remains tied to its recorded journal/run and EA SHA: FOUND (RESULT_B91 R1 line 23 + R2 header line 24: j45/j46 EA 55D91C7E; SLICE_B91 conventions line 3 + R1 census lines 11-13).
  - No item CONTRADICTED; none NOT FOUND.
- R3 Input limitation still stands (exact evidence, no reinterpretation):
  - selected trade-direction pick not reliably available for every bias-differing candle: FOUND (SLICE_B91 R6 line 66; RESULT_B89 R1/R6 + RESULT_B90 R6).
  - formation time not exported: FOUND (SLICE_B91 R6 line 66: "Formation time NOT FOUND (no obStart export...)"; RESULT_B89 R6).
  - full live-XOB promotion and kill state not readable: FOUND (SLICE_B91 R6 line 66: "Kill state NOT FOUND (zero OBPROV consumers)"; RESULT_B90 R6; B-86 R7 BUILDABLE-PICK-ONLY + NOT-BUILDABLE-FULL-XOB-MAP carried in pointer line 13).
  - machine verdict is print coverage, not a complete runtime map: FOUND (SLICE_B91 R6 line 67: verdict prints exist only at evaluated bars, 13 R4 UNKNOWNs; RESULT_B91 R6 line 48).
  - B-89 and B-90 remain NOT-BUILDABLE findings: FOUND (RESULT_B89 R6 line 45: W-F/W-P NOT-BUILDABLE; RESULT_B90 R6 line 43: NOT-BUILDABLE; RESULT_B91 R6 line 48 carried).
- R4 Planner decision: `XOB-SEPARATOR-PARKED-NONSEPARATOR`. This means: no current reading is authorized for an EA gate; no source edit is authorized; no compile or run is authorized; the full live-XOB requirement remains NOT BUILDABLE from the current EA-readable inputs; the XOB term is parked, not ruled out as a trading rule; future work resumes only after a new operator-approved upstream readable source exists or a new record changes the evidence; a future relay must not reopen the same four readings without new evidence.
- R5 Distinction: this is not a verdict on his rule; not permission to replace the XOB rule with a pick-only approximation; not permission to add a tolerance or select a winning window; it is a planner decision that the present machine inputs cannot support a faithful implementation.

## Part X - records

- X1 `PLANNER_CONTEXT.md` section 4 grep `B-92-XOB-PARKED-NONSEPARATOR` = 0 -> appended exactly one lesson (verified 1). No duplicate.
- X2 `PLANNER_HANDOFF.md` section 3 grep `B-92` = 0 -> appended `- B-92: parked the XOB separator as NOT BUILDABLE after B-91 found no separating reading; no source edit or run.` (verified 1). No duplicate.
- X3 Ledger grep `B92-XOB-PARKED-NONSEPARATOR` = 0 and `^1237.` = 0 -> appended item `1237` with that tag (B-91 provenance, four readings + failures, full-register + 65-pass scope, input limitation, rule-vs-buildability distinction, no edit/compile/run, parked pending genuinely new evidence). `^1236.` = 1 beside. No duplicate.
- X4 Pointer 20 -> 20 lines (cap 35): latest B-92 MEASURED, separator parked NOT BUILDABLE, EA/EX5 unchanged, no compile/runs, next work needs genuinely new evidence, no repeat of the four readings.

## Part F - file, push, reply

- F1 this result. F2 slice `BUILDER_SLICE_B92.md` (raw greps, B-91 refs, decision table, R3 evidence, before/after lines; under 600 lines; no source diff, no run tables). F3 ledger 1237. F4 pointer per X4. F5 stages only the 6 relay files (result/slice/ledger/pointer/PLANNER_CONTEXT/PLANNER_HANDOFF). F6 commit + push `builder/B-92` via `backup` + ls-remote check. Reply MEASURED.

## Final disk state (MEASURED turn; kept RKD build on disk, uncommitted)

- EA `137076D9CF85160AB8CD8379575AFD4801E71098CE97C0B10D88A42C7BF59671` (695359 B, LF-only, untouched; ` M` vs stale blob = expected uncommitted lag, never staged) + `.preB87`/`.B87PICKXOB` kept uncommitted. EX5 `FA4C924978F6A1D5C57B725F2AB530BBB5DC5B1E0D1D0B51FB0172E80D8C41B5` (matching kept source). Strategy skill unchanged this turn (B-91 section stands). Journal CSV untouched (NOT APPENDED). terminal.ini + charts untouched. No terminal64. No edit/compile/run beyond the relay's text records.

No carried note (no STOP; nothing to ask him).
