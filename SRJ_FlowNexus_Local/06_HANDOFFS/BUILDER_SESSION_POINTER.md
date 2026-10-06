# BUILDER SESSION POINTER - read this first, every session

**Rule:** this file is the ONLY live memory (capped 35 lines). Old queue/state documents are audit-only.

## State (2026-10-06; B-SERIES LANE ACTIVE; latest result B-37)
- B-series relay lane active (operator order 2026-10-04). Relay B-37 is the active task; for its scope it wins over older queue items. Latest result: `SRJ_FlowNexus_Local/06_HANDOFFS/BUILDER_RESULT_B37.md` (branch builder/B-37; broker follows retarget, 5 June closes same-day, 11 June same refusal, KEPT).
- EA on disk: `Experts/SRJ_FlowNexus_EA.mq5` = `D93400EBE8E2A83F4EAC02DACC7CDDA7FA50FEEDF63866B8ECAA65EBDEFAA067` (679918 B, 12379 lines, LF-only; X+Y+M+F+D+BROKER kept uncommitted == `.B37TP`).
- HTFEngine on disk: `Include/SRJ/SRJ_HTFEngine.mqh` = `D5FD5B063E75628745B27E57133E58ACD19F470D4036DC4B2567CE1BE5053755` (23026 B, uncommitted; content-equals HEAD f35b02bd, endings only).
- FlowLogic.ex5: `27B5F272DCFAF6089CBE6E74DB2D61A1EBA49904720EB2C41FF56A22B46DDF90` (956BF3E3 source). EA.ex5: `568F2BC1477EBEFBCB4A7FE859193916AC2A3CBC2B3FE175E92430168E464DD0` (D93400EB source). Both MATCH (kept after the B37 runs).
- R2=CLOSED (section 12); ALL7 guard absent, ALL7 passed false; WRITE_EXPLAINS 972/974. Slots fixed on disk (lookback 3000, ~3-min runs). No AGENTS.md, terminal.ini (June USDJPY) or git-config change.
- Ledger last item 1178 (B37-BROKER-RETARGET); journal 1058 rows (row 306 banked); register carries B-35 correction.

## Next
- Relay B-38 from the planner (sole outstanding item; B-37 ends KEPT, broker follows retarget).

## Resume order
- Resume order: the latest planner relay's Part 0, then this pointer. Older handoffs are audit-only.
