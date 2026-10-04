# BUILDER SESSION POINTER - read this first, every session

**Rule:** this file is the ONLY live memory (capped 35 lines). Old queue/state documents are audit-only.

## State (2026-10-04; B-SERIES LANE ACTIVE; latest result B-17)
- B-series relay lane active (operator order 2026-10-04). Relay B-17 is the active task; for its scope it wins over older queue items. Latest result: `SRJ_FlowNexus_Local/06_HANDOFFS/BUILDER_RESULT_B17.md` (branch builder/B-17; his W1-W6 banked verbatim as skill section 11 + journal rows 281/285/301-304 + ledger 1159-1164; 8/27 exit, 1-Sep 5m/CQD reads and 15m source all MEASURED).
- EA on disk: `Experts/SRJ_FlowNexus_EA.mq5` = `F04AF9C31D42B756F9DCAC62B2506D0D67D2EDA6231C571B6558D2B4B14C4582` (685444 B, 12300 lines; unedited, uncommitted by relay order).
- HTFEngine on disk: `Include/SRJ/SRJ_HTFEngine.mqh` = `D5FD5B063E75628745B27E57133E58ACD19F470D4036DC4B2567CE1BE5053755` (23026 B, uncommitted; content-equals HEAD f35b02bd, endings only).
- FlowLogic.ex5: `27B5F272DCFAF6089CBE6E74DB2D61A1EBA49904720EB2C41FF56A22B46DDF90` (956BF3E3 source). EA.ex5: `D7DEA92375D8DADB38E8A8B5667DF7891D65C6EA6F4B5DD5F47C76D2B338DC96` (F04AF9C3 source). Both MATCH.
- Strategy skill section 11 banked (.opencode copy 2B76301A, 141 lines; .agents stub untouched). Relay skill banked (E5713CDB, 50 lines). Planner context refreshed (85D6F901). No AGENTS.md, terminal.ini or git-config change.

## Next
- Relay B-18 from the planner (sole outstanding item; B-17 ends MEASURED, June window home).

## Resume order
1. `BUILDER_HANDOFF_NEWSESSION_POST-V415.md`, then this pointer. 2. AGENTS.md and git state. 3. Handoff section 4, then the V414 grade plus verdict blocks in Luna 18738-18767, Sonnet 9309-9395, GLM 11752-11823. 4. Ledger for audit only. 5. Relevance index before record search.
