# BUILDER SESSION POINTER - read this first, every session

**Rule:** this file is the ONLY live memory (capped 35 lines). Old queue/state documents are audit-only.

## State (2026-10-09; B-SERIES LANE ACTIVE; latest result B-127)
- B-series relay lane active (operator order 2026-10-04). Relay B-127 is the active task; for its scope it wins over older queue items. Latest result: `SRJ_FlowNexus_Local/06_HANDOFFS/BUILDER_RESULT_B127.md` (branch builder/B-127; confirmation-candle reading, MEASURED).
- Planner entry: any planner agent starts from 99_WORKFLOW/PLANNER_BOOTSTRAP.md (kit PK-1); context 99_WORKFLOW/PLANNER_CONTEXT.md; cold start 99_WORKFLOW/PLANNER_HANDOFF.md.
- EA on disk (kept build UNCHANGED): `Experts/SRJ_FlowNexus_EA.mq5` = `137076D9CF85160AB8CD8379575AFD4801E71098CE97C0B10D88A42C7BF59671` (695359 B, LF-only = kept + hunk S + hunk RKD; .preB87 kept; .B87PICKXOB 5066BAB9 uncommitted).
- EA.ex5 bytes FA4C924978F6A1D5C57B725F2AB530BBB5DC5B1E0D1D0B51FB0172E80D8C41B5 (matching the kept source). FlowLogic 956BF3E3/ex5 27B5F272; includes at gate SHAs; MARKER 79859EDC/f0890c0b untouched.
- R2=CLOSED (section 12); ALL7 guard absent, ALL7 passed false; WRITE_EXPLAINS 972/974. Slots fixed on disk (lookback 3000). June standard window 5/25 start, graded 6/01-6/12 (terminal.ini + 3 charts re-save noise accounted; preB87/preB84 kept).
- Ledger last item 1272 (B127-CONFIRM-CANDLE-READING, MEASURED); skill untouched (read relay, no rule); journal 1066 lines (NOT APPENDED); planner-context B-127 lines (X1/X2/X3).
- R2 answer: machine tests PRIOR candle vs single anchor (touchAttr +/-1pt, EA:2454/2532); confirm needs opp+A2+body+touch; candidate carries one anchor (sites :9340/:9360/:9548); hunk C counts retest OR prior (cSrc).
- R3: 16:10 touches NONE, through NONE, closes LONG 49pts YES; machine tested Monthly-POC only touchAttr=0. 16:00 touched all six dL.
- CF-A DOES NOT SEPARATE (B2 fails); CF-B DOES NOT SEPARATE (B2 fails); CF-C DOES NOT SEPARATE (2 Jun + 4 Jun pass, 27 Aug would-pass). Census 341 kept refusals filed.
- SILENT6 parked (not in register; logs complete; ends UNKNOWN).
- S54 hunk S live. R7: BUILDABLE-PICK-ONLY + NOT-BUILDABLE-FULL-XOB-MAP; BLOCKED none. B-127: MEASURED (no edit/run; kept SHAs verified).
- 4 June 09:55 still fires on kept (tester-only, NOT HIS per row 314/B-70); 5 June 16:15 still owed (no touch 16:10+, reseeded trial died 18:30; hunk C touch half unbuilt).
- B-79 chart call WITHHELD by planner (never reaches him). Record answer: 15:35 Y-POC r2:dS nearest higher target 1.15987 R0.18 refused; entry line Y-POC long side 15:45 dL confirm=0, 15:55 dL confirm=1, 16:00 open 1.16018.

## Next
- Next relay chooses the next unresolved fidelity task (no confirmation-only separator on file; 5JUN-1615 still open); project goal open unless proven otherwise.

## Resume order
- Resume order: the latest planner relay's Part 0, then this pointer. Older handoffs are audit-only.
