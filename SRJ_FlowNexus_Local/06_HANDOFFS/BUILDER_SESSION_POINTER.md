# BUILDER SESSION POINTER - read this first, every session

**Rule:** this file is the ONLY live memory (capped 35 lines). Old queue/state documents are audit-only.

## State (2026-10-04; B-SERIES LANE ACTIVE; latest result B-12)
- B-series relay lane active (operator order 2026-10-04). Relay B-12 is the active task; for its scope it wins over older queue items. Latest result: `SRJ_FlowNexus_Local/06_HANDOFFS/BUILDER_RESULT_B12.md` (branch builder/B-12; no tree re-runnable as committed, restored+rematched).
- EA on disk: `Experts/SRJ_FlowNexus_EA.mq5` = `F04AF9C31D42B756F9DCAC62B2506D0D67D2EDA6231C571B6558D2B4B14C4582` (685444 B, 12300 lines; restored pre-B-12 tree, uncommitted by relay order). Backup `.preB12` same SHA (never committed).
- HTFEngine on disk: `Include/SRJ/SRJ_HTFEngine.mqh` = `D5FD5B063E75628745B27E57133E58ACD19F470D4036DC4B2567CE1BE5053755` (23026 B, restored, uncommitted).
- FlowLogic.ex5: `634183D25C5F4D4F41FFDC8AB72B2836BDE4FA3ECD3D9EF966746CE95D685173` (from restored 956BF3E3 source). EA.ex5: `F3D3F2405BF6F344DB540C0B34F1AFB83987386FF6C26FB481E16CBCDA4435B5` (from restored F04AF9C3 source). Both MATCH.
- No strategy-skill, AGENTS.md or planner-context change in this relay.

## Next
- Relay B-13 from the planner (sole outstanding item; B-12 ends MEASURED, restored with matching EX5s).

## Resume order
1. `BUILDER_HANDOFF_NEWSESSION_POST-V415.md`, then this pointer. 2. AGENTS.md and git state. 3. Handoff section 4, then the V414 grade plus verdict blocks in Luna 18738-18767, Sonnet 9309-9395, GLM 11752-11823. 4. Ledger for audit only. 5. Relevance index before record search.
