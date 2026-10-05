# BUILDER SESSION POINTER - read this first, every session

**Rule:** this file is the ONLY live memory (capped 35 lines). Old queue/state documents are audit-only.

## State (2026-10-06; B-SERIES LANE ACTIVE; latest result B-34)
- B-series relay lane active (operator order 2026-10-04). Relay B-34 is the active task; for its scope it wins over older queue items. Latest result: `SRJ_FlowNexus_Local/06_HANDOFFS/BUILDER_RESULT_B34.md` (branch builder/B-34; June measured on the KEPT tree: 3/6 hit, 3 misses diagnosed, 2 new fires, 8/6 silent, MEASURED).
- EA on disk: `Experts/SRJ_FlowNexus_EA.mq5` = `F9F9C569DCAC5B87660D1E82B77857966FEA1CD0617B732BFCB28205E04F7631` (677904 B, 12351 lines, LF-only; X+Y+M+F+D kept uncommitted == `.B33XYMFD`).
- HTFEngine on disk: `Include/SRJ/SRJ_HTFEngine.mqh` = `D5FD5B063E75628745B27E57133E58ACD19F470D4036DC4B2567CE1BE5053755` (23026 B, uncommitted; content-equals HEAD f35b02bd, endings only).
- FlowLogic.ex5: `27B5F272DCFAF6089CBE6E74DB2D61A1EBA49904720EB2C41FF56A22B46DDF90` (956BF3E3 source). EA.ex5: `CF14BED2CCF14BC5B140F8BD57BF91141484144300288D1E150511D939445696` (F9F9C569 source). Both MATCH (no edit or compile this relay).
- R2=CLOSED (section 12); ALL7 guard absent, ALL7 passed false; WRITE_EXPLAINS 972/974. Slots fixed on disk (lookback 3000, ~3-min runs). No AGENTS.md, terminal.ini (June USDJPY) or git-config change.
- Ledger last item 1175 (B34-JUNE-MEASURE); journal 1057 rows untouched; register carries the B-33 j17 exit correction.

## Next
- Relay B-35 from the planner (sole outstanding item; B-34 ends MEASURED, June misses + 5/6-NY entry question open).

## Resume order
- Resume order: the latest planner relay's Part 0, then this pointer. Older handoffs are audit-only.
