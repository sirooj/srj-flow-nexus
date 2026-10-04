# BUILDER SESSION POINTER - read this first, every session

**Rule:** this file is the ONLY live memory (capped 35 lines). Old queue/state documents are audit-only.

## State (2026-10-04; B-SERIES LANE ACTIVE; latest result B-9)
- B-series relay lane active (operator order 2026-10-04). Relay B-9 is the active task; for its scope it wins over older queue items. Latest result: `SRJ_FlowNexus_Local/06_HANDOFFS/BUILDER_RESULT_B9.md` (branch builder/B-9).
- EA on disk: `Experts/SRJ_FlowNexus_EA.mq5` = `F04AF9C31D42B756F9DCAC62B2506D0D67D2EDA6231C571B6558D2B4B14C4582` (685444 B; B-7 kept build, uncommitted by relay order). Backups: `.preB7` = `E80FF0C24149AB0946EB6A4341C0503A79BFE82E9843867CEF0DBA89BF587BBC` (685026 B); `.preB8` = `F04AF9C31D42B756F9DCAC62B2506D0D67D2EDA6231C571B6558D2B4B14C4582` (685444 B, byte-identical to the EA).
- EX5 on disk: `Experts/SRJ_FlowNexus_EA.ex5` = `0D78C1C876326FD76161B5CBF217487534114D2459F95A0DE426BEC0FBD0300A` (452482 B; B-8 trial build, does NOT match the EA source; any later run must compile first).
- Relay lane files: `.opencode/skills/srj-relay/SKILL.md` (full source) + `.agents/skills/srj-relay/SKILL.md` (thin pointer); resume skill carries 1a (relay-first rule).
- AGENTS.md C2 inserts BLOCKED on anchor miss (filed in B-9 C2/C5): the live concise contract (34 lines) has no sections 2/10; left unchanged, conflict listed, planner owes corrected anchors.

## Next
- Relay B-10 from the planner (sole outstanding item; B-9 ends MEASURED with no carried build or run).

## Resume order
1. `BUILDER_HANDOFF_NEWSESSION_POST-V415.md`, then this pointer. 2. AGENTS.md and git state. 3. Handoff section 4, then the V414 grade plus verdict blocks in Luna 18738-18767, Sonnet 9309-9395, GLM 11752-11823. 4. Ledger for audit only. 5. Relevance index before record search.
