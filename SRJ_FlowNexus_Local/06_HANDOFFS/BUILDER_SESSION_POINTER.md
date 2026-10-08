# BUILDER SESSION POINTER - read this first, every session

**Rule:** this file is the ONLY live memory (capped 35 lines). Old queue/state documents are audit-only.

## State (2026-10-08; B-SERIES LANE ACTIVE; latest result B-83)
- B-series relay lane active (operator order 2026-10-04). Relay B-83 is the active task; for its scope it wins over older queue items. Latest result: `SRJ_FlowNexus_Local/06_HANDOFFS/BUILDER_RESULT_B83.md` (branch builder/B-83; touch-candle XOB reading, MEASURED).
- Planner: ClickUp Brain session for relay B-83; context 99_WORKFLOW/PLANNER_CONTEXT.md (PROMPTQL file audit-only).
- EA on disk (kept build UNCHANGED): `Experts/SRJ_FlowNexus_EA.mq5` = `137076D9CF85160AB8CD8379575AFD4801E71098CE97C0B10D88A42C7BF59671` (695359 B, LF-only = kept + hunk S + hunk RKD; .B82C 55D91C7E frozen uncommitted with its ex5 + diff, never pushed; .preB82 kept).
- EA.ex5 bytes FA4C924978F6A1D5C57B725F2AB530BBB5DC5B1E0D1D0B51FB0172E80D8C41B5 (matching the kept source). FlowLogic 956BF3E3/ex5 27B5F272; includes at gate SHAs; MARKER 79859EDC/f0890c0b untouched.
- R2=CLOSED (section 12); ALL7 guard absent, ALL7 passed false; WRITE_EXPLAINS 972/974. Slots fixed on disk (lookback 3000). June standard window 5/25 start, graded 6/01-6/12 (terminal.ini 88a0deb1; charts as restored in B-82; preB58-preB82 kept).
- Ledger last item 1228 (B83-TOUCHCANDLE-REC, MEASURED); journal 1066 lines; banking verified (no new words); planner-context B-83 lines only.
- SILENT6 parked (not in register; logs complete; ends UNKNOWN).
- S54 hunk S live. R5: W-P DOES NOT SEPARATE (A1 8/28 reads X NOT MET); W-F SEPARATES (all must-keeps + B2 MET, F1 NOT MET); MACHINE SEPARATES (same); no chart call, no proposal. F1 14:20 closes WITH, nothing touches it. Next relay drafts the trial.
- B-79 chart call WITHHELD by planner (never reaches him). Record answer: 15:35 Y-POC r2:dS nearest higher target 1.15987 R0.18 refused; entry line Y-POC long side 15:45 dL confirm=0, 15:55 dL confirm=1, 16:00 open 1.16018.

## Next
- Relay B-84 from the planner (drafts the W-F/machine trial).

## Resume order
- Resume order: the latest planner relay's Part 0, then this pointer. Older handoffs are audit-only.

(End of file - total 22 lines)
