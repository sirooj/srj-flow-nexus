# BUILDER SESSION POINTER - read this first, every session

**Rule:** this file is the ONLY live memory (capped 35 lines). Old queue/state documents are audit-only.

## State (2026-10-05; B-SERIES LANE ACTIVE; latest result B-30)
- B-series relay lane active (operator order 2026-10-04). Relay B-30 is the active task; for its scope it wins over older queue items. Latest result: `SRJ_FlowNexus_Local/06_HANDOFFS/BUILDER_RESULT_B30.md` (branch builder/B-30; 9/8 NY dies at UJALIGN_NOMATCH on true 15m bull, memo voids print no values, guard has no pin and misses the 7-take build, MEASURED read-only).
- EA on disk: `Experts/SRJ_FlowNexus_EA.mq5` = `964803F4FD452349D67FDC31A73A7B297D4BB93726FA69086DB0A60283AE74F8` (688599 B, 12342 lines; == .B20SRV, uncommitted; RESTORED from .preB29, Hunk X kept only in .B29X 70E68EE1).
- HTFEngine on disk: `Include/SRJ/SRJ_HTFEngine.mqh` = `D5FD5B063E75628745B27E57133E58ACD19F470D4036DC4B2567CE1BE5053755` (23026 B, uncommitted; content-equals HEAD f35b02bd, endings only).
- FlowLogic.ex5: `27B5F272DCFAF6089CBE6E74DB2D61A1EBA49904720EB2C41FF56A22B46DDF90` (956BF3E3 source). EA.ex5: `7C46B16C035A9F19B936FD4899BEC0289AD82C8F4AF8B652B0FA6D7A3DC54994` (964803F4 source). Both MATCH (restored after the B29X run).
- R2=CLOSED (section 12); ALL7 guard absent, ALL7 passed false; WRITE_EXPLAINS 972/974. MAPPING_FIXED=yes (j14: ctf=1 lookback=3000 slots read H4/H1/M15, conf=1); GROUP_SHIFT_OTHER=none. No AGENTS.md, terminal.ini (June USDJPY) or git-config change.
- Ledger last item 1171 (B30-SEP8NY-DROP-TRACE); journal 1057 rows untouched.

## Next
- Relay B-31 from the planner (sole outstanding item; B-30 ends MEASURED, UJALIGN pin + MEMO_IDENTITY values open).

## Resume order
- Resume order: the latest planner relay's Part 0, then this pointer. Older handoffs are audit-only.
