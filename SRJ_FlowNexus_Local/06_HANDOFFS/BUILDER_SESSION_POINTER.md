# BUILDER SESSION POINTER - read this first, every session

**Rule:** this file is the ONLY live memory (capped 35 lines). Old queue/state documents are audit-only.

## State (2026-10-07; B-SERIES LANE ACTIVE; latest result B-52)
- B-series relay lane active (operator order 2026-10-04). Relay B-52 is the active task; for its scope it wins over older queue items. Latest result: `SRJ_FlowNexus_Local/06_HANDOFFS/BUILDER_RESULT_B52.md` (branch builder/B-52; bank + SuperApp move + 11 June fires + POI lines, MEASURED).
- Planner: SuperApp AI; context 99_WORKFLOW/PLANNER_CONTEXT.md (moved from PromptQL 2026-10-07, relay B-52; PROMPTQL file audit-only).
- EA on disk: `Experts/SRJ_FlowNexus_EA.mq5` = `63B18C1F6FEAE62B8AAB77C5D352E4DC6D463B808458B59F6C6B3F377A37E928` (680981 B, LF-only; A2-RECLAIM kept uncommitted == `.B38A2`; untouched since B-38).
- HTFEngine on disk: `Include/SRJ/SRJ_HTFEngine.mqh` = `D5FD5B063E75628745B27E57133E58ACD19F470D4036DC4B2567CE1BE5053755` (23026 B, uncommitted; content-equals HEAD f35b02bd, endings only).
- FlowLogic.ex5: `27B5F272DCFAF6089CBE6E74DB2D61A1EBA49904720EB2C41FF56A22B46DDF90` (956BF3E3 source). EA.ex5: `B0D4AA9E0804D9CDB6DE0679FECFF817D563C26D3FB03EBE1AB1F3A0A3B49B` (63B18C1F source). Both MATCH (no build since B-38).
- R2=CLOSED (section 12); ALL7 guard absent, ALL7 passed false; WRITE_EXPLAINS 972/974. Slots fixed on disk (lookback 3000). terminal.ini June USDJPY ([Tester] restored + verified post-B48). No git-config change.
- Ledger last item 1195 (B52-PLANNER-SUPERAPP-1106RECHECK-0506LINES); journal 1061 lines (row 309 banked B-52); register carries B-52 section-B correction (row 3 TAKEN must-keep).
- 5 June NY POI = his M/W POC + VWAP at 16:00, banked B-52 (strategy ruling + journal 309 + ledger 1194); machine 16:00 rows name Daily lines only (Part M).

## Next
- Relay B-53 from the planner (5 June NY POI = his M/W POC + VWAP at 16:00, banked B-52; Part M results).

## Resume order
- Resume order: the latest planner relay's Part 0, then this pointer. Older handoffs are audit-only.

(End of file - total 22 lines)
