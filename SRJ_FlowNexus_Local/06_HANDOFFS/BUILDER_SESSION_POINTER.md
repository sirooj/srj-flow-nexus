# BUILDER SESSION POINTER - read this first, every session

**Rule:** this file is the ONLY live memory (capped 35 lines). Old queue/state documents are audit-only.

## State (2026-10-05; B-SERIES LANE ACTIVE; latest result B-18)
- B-series relay lane active (operator order 2026-10-04). Relay B-18 is the active task; for its scope it wins over older queue items. Latest result: `SRJ_FlowNexus_Local/06_HANDOFFS/BUILDER_RESULT_B18.md` (branch builder/B-18; 5m-bias entry refusal tried once - run reproduced j2 not j3, edit unproven, RESTORED).
- EA on disk: `Experts/SRJ_FlowNexus_EA.mq5` = `F04AF9C31D42B756F9DCAC62B2506D0D67D2EDA6231C571B6558D2B4B14C4582` (685444 B, 12300 lines; restored from .preB18, empty diff, uncommitted).
- HTFEngine on disk: `Include/SRJ/SRJ_HTFEngine.mqh` = `D5FD5B063E75628745B27E57133E58ACD19F470D4036DC4B2567CE1BE5053755` (23026 B, uncommitted; content-equals HEAD f35b02bd, endings only).
- FlowLogic.ex5: `27B5F272DCFAF6089CBE6E74DB2D61A1EBA49904720EB2C41FF56A22B46DDF90` (956BF3E3 source). EA.ex5: `D7DEA92375D8DADB38E8A8B5667DF7891D65C6EA6F4B5DD5F47C76D2B338DC96` (F04AF9C3 source). Both MATCH.
- Relay skill ls-remote bullet banked (08A045A3, 51 lines). Planner context refreshed (0CA62129). No AGENTS.md, terminal.ini (June USDJPY) or git-config change.

## Next
- Relay B-19 from the planner (sole outstanding item; B-18 ends RESTORED, j3-baseline question carried).

## Resume order
- Resume order: the latest planner relay's Part 0, then this pointer. Older handoffs are audit-only.
