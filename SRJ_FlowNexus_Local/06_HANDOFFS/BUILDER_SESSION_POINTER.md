# BUILDER SESSION POINTER - read this first, every session

**Rule:** this file is the ONLY live memory (capped 35 lines). Old queue/state documents are audit-only.

## State (2026-10-04; B-SERIES LANE ACTIVE; latest result B-11)
- B-series relay lane active (operator order 2026-10-04). Relay B-11 is the active task; for its scope it wins over older queue items. Latest result: `SRJ_FlowNexus_Local/06_HANDOFFS/BUILDER_RESULT_B11.md` (branch builder/B-11; Run 1 1/7 identical to B-10, Run 2 feed-stalled, restored+rematched).
- EA on disk: `Experts/SRJ_FlowNexus_EA.mq5` = `F04AF9C31D42B756F9DCAC62B2506D0D67D2EDA6231C571B6558D2B4B14C4582` (685444 B, 12300 lines; restored pre-B-11 tree, B-7 kept build, uncommitted by relay order). Backups `.preB11` same SHA; `.preB7` = `E80FF0C24149AB0946EB6A4341C0503A79BFE82E9843867CEF0DBA89BF587BBC` (never committed).
- EX5 on disk: `Experts/SRJ_FlowNexus_EA.ex5` = `E031179F6901071CC665B9D0017F0025D1B980258941F09C72D33B3966AA3447` (452422 B, compiled from the restored source after C5). MATCHES the EA source.
- PromptQL planner context: `SRJ_FlowNexus_Local/99_WORKFLOW/PROMPTQL_PLANNER_CONTEXT.md` (9CF2220C, 47 lines; never-ask-him + repo-copy lines added by B-11 relay).
- Strategy skill: section 9 (2026-10-04 rulings) banked, B5DC5BD0, 123 lines. AGENTS.md untouched in this lane.

## Next
- Relay B-12 from the planner (sole outstanding item; B-11 ends MEASURED, restored with matching EX5).

## Resume order
1. `BUILDER_HANDOFF_NEWSESSION_POST-V415.md`, then this pointer. 2. AGENTS.md and git state. 3. Handoff section 4, then the V414 grade plus verdict blocks in Luna 18738-18767, Sonnet 9309-9395, GLM 11752-11823. 4. Ledger for audit only. 5. Relevance index before record search.
