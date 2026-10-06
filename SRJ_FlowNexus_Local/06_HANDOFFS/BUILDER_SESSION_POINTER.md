# BUILDER SESSION POINTER - read this first, every session

**Rule:** this file is the ONLY live memory (capped 35 lines). Old queue/state documents are audit-only.

## State (2026-10-06; B-SERIES LANE ACTIVE; latest result B-38)
- B-series relay lane active (operator order 2026-10-04). Relay B-38 is the active task; for its scope it wins over older queue items. Latest result: `SRJ_FlowNexus_Local/06_HANDOFFS/BUILDER_RESULT_B38.md` (branch builder/B-38; 11 June NY long fires off reclaimed 14:35, EU identical, KEPT).
- EA on disk: `Experts/SRJ_FlowNexus_EA.mq5` = `63B18C1F6FEAE62B8AAB77C5D352E4DC6D463B808458B59F6C6B3F377A37E928` (680981 B, LF-only; A2-RECLAIM kept uncommitted == `.B38A2`).
- HTFEngine on disk: `Include/SRJ/SRJ_HTFEngine.mqh` = `D5FD5B063E75628745B27E57133E58ACD19F470D4036DC4B2567CE1BE5053755` (23026 B, uncommitted; content-equals HEAD f35b02bd, endings only).
- FlowLogic.ex5: `27B5F272DCFAF6089CBE6E74DB2D61A1EBA49904720EB2C41FF56A22B46DDF90` (956BF3E3 source). EA.ex5: `B0D4AA9E0804D9CDB6DE0679FECFF817D563C26D3FB03EBE1AB1F3A0A3B49B` (63B18C1F source). Both MATCH (kept after the B38 runs).
- R2=CLOSED (section 12); ALL7 guard absent, ALL7 passed false; WRITE_EXPLAINS 972/974. Slots fixed on disk (lookback 3000, ~3-min runs). No AGENTS.md, terminal.ini (June USDJPY) or git-config change.
- Ledger last item 1179 (B38-A2-RECLAIM); journal 1058 rows (row 306 banked); register carries B-35 correction.

## Next
- Relay B-39 from the planner (sole outstanding item; B-38 ends KEPT, 11 June fires, EU clean).

## Resume order
- Resume order: the latest planner relay's Part 0, then this pointer. Older handoffs are audit-only.

(End of file - total 19 lines)
