# BUILDER SESSION POINTER - read this first, every session

**Rule:** this file is the ONLY live memory (capped 35 lines). Old queue/state documents are audit-only.

## State (2026-10-09; B-SERIES LANE ACTIVE; latest result B-128)
- B-series relay lane active (operator order 2026-10-04). Relay B-128 is the active task; for its scope it wins over older queue items. Latest result: `SRJ_FlowNexus_Local/06_HANDOFFS/BUILDER_RESULT_B128.md` (branch builder/B-128; retest-carry XOB reading, MEASURED).
- Planner entry: any planner agent starts from 99_WORKFLOW/PLANNER_BOOTSTRAP.md (kit PK-1); context 99_WORKFLOW/PLANNER_CONTEXT.md; cold start 99_WORKFLOW/PLANNER_HANDOFF.md.
- EA on disk (kept build UNCHANGED): `Experts/SRJ_FlowNexus_EA.mq5` = `137076D9CF85160AB8CD8379575AFD4801E71098CE97C0B10D88A42C7BF59671` (695359 B, LF-only = kept + hunk S + hunk RKD; .preB87 kept; .B87PICKXOB 5066BAB9 uncommitted).
- EA.ex5 bytes FA4C924978F6A1D5C57B725F2AB530BBB5DC5B1E0D1D0B51FB0172E80D8C41B5 (matching the kept source). FlowLogic 956BF3E3/ex5 27B5F272; includes at gate SHAs; MARKER 79859EDC/f0890c0b untouched.
- R2=CLOSED (section 12); ALL7 guard absent, ALL7 passed false; WRITE_EXPLAINS 972/974. Slots fixed on disk (lookback 3000). June standard window 5/25 start, graded 6/01-6/12 (terminal.ini + 3 charts re-save noise accounted; preB87/preB84 kept).
- Ledger last item 1273 (B128-RETEST-CARRY-XOB-READING, MEASURED); skill untouched (read relay, no rule); journal 1066 lines (NOT APPENDED); planner-context B-128 lines (X1/X2/X3).
- RETEST population: j45 20 / j46 8 / j39 19 / j40 8 (BOTH/PRIOR out of scope, counted only). Pick dir SAME every printed pick. Retest-bar zone prints ABSENT all multi-bar rows.
- Deciding: 5 June 16:00 [159.726 low] dug through pick 159.881-159.916 (XT YES, fired j46+j40); 2 June 14:20 [159.716 low] above pick 159.679-159.694 (XT NO, fired j46+j40); 27 Aug 16:25 below pick 1.16612-1.16640 (XT NO, fired j39 only, j45 target-refused).
- XT-TOUCH SEPARATES (5 June pass, 2 June + 27 Aug fail; no breaker). XT-INPLAY UNKNOWN (no retest-bar verdict printed at any deciding/fired row).
- R5 site: .B82C:2544 tR + :2546 touch gate; kept tP :2545 byte-unchanged YES. Draft no hunk.
- SILENT6 parked (not in register; logs complete; ends UNKNOWN).
- S54 hunk S live. R7: BUILDABLE-PICK-ONLY + NOT-BUILDABLE-FULL-XOB-MAP; BLOCKED none. B-128: MEASURED (no edit/run; kept SHAs verified).
- 4 June 09:55 kept path out of scope (fires on kept, no RETEST row); 5 June 16:15 still owed (XT-TOUCH separates; touch-half unbuilt).
- B-79 chart call WITHHELD by planner (never reaches him). Record answer: 15:35 Y-POC r2:dS nearest higher target 1.15987 R0.18 refused; entry line Y-POC long side 15:45 dL confirm=0, 15:55 dL confirm=1, 16:00 open 1.16018.

## Next
- Next relay chooses the next unresolved fidelity task (XT-TOUCH separates on added rows; 5JUN-1615 still open); project goal open unless proven otherwise.

## Resume order
- Resume order: the latest planner relay's Part 0, then this pointer. Older handoffs are audit-only.
