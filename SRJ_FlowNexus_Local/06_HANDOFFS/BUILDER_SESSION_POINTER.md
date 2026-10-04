# BUILDER SESSION POINTER - read this first, every session

**Rule:** this file is the ONLY live memory (capped 35 lines). Old queue/state documents are audit-only.

## State (2026-10-04; B-SERIES LANE ACTIVE; latest result B-10)
- B-series relay lane active (operator order 2026-10-04). Relay B-10 is the active task; for its scope it wins over older queue items. Latest result: `SRJ_FlowNexus_Local/06_HANDOFFS/BUILDER_RESULT_B10.md` (branch builder/B-10; STOP rule C fired, RESTORED).
- EA on disk: `Experts/SRJ_FlowNexus_EA.mq5` = `F04AF9C31D42B756F9DCAC62B2506D0D67D2EDA6231C571B6558D2B4B14C4582` (685444 B; restored pre-B-10 tree, B-7 kept build, uncommitted by relay order). Backup `.preB10` same SHA (never committed).
- EX5 on disk: `Experts/SRJ_FlowNexus_EA.ex5` = `3587ADBF646D03169420D21D234FFDF5CD3478678CE4AFAEB4FCFF563DEEFC4F` (452272 B; B-10 trial build, does NOT match the restored EA source; the next authorized compile overwrites it).
- PromptQL planner context: `SRJ_FlowNexus_Local/99_WORKFLOW/PROMPTQL_PLANNER_CONTEXT.md` (workflow only, planner-refreshed).
- AGENTS.md C2 WITHDRAWN by the planner - no AGENTS.md edit now or later in this lane.

## Next
- Relay B-11 from the planner (sole outstanding item; B-10 ends RESTORED with no carried build or run).

## Resume order
1. `BUILDER_HANDOFF_NEWSESSION_POST-V415.md`, then this pointer. 2. AGENTS.md and git state. 3. Handoff section 4, then the V414 grade plus verdict blocks in Luna 18738-18767, Sonnet 9309-9395, GLM 11752-11823. 4. Ledger for audit only. 5. Relevance index before record search.
