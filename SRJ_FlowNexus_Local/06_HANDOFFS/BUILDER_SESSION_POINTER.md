# BUILDER SESSION POINTER - read this first, every session

**Rule:** this file is the ONLY live memory (capped 35 lines). Old queue/state documents are audit-only.

## State (2026-10-09; B-SERIES LANE ACTIVE; latest result B-130)
- B-series relay lane active (operator order 2026-10-04). Relay B-130 is the active task; for its scope it wins over older queue items. Latest result: `SRJ_FlowNexus_Local/06_HANDOFFS/BUILDER_RESULT_B130.md` (branch builder/B-130; CQD latch reading, diagnostic RESTORED).
- Planner entry: any planner agent starts from 99_WORKFLOW/PLANNER_BOOTSTRAP.md (kit PK-1); context 99_WORKFLOW/PLANNER_CONTEXT.md; cold start 99_WORKFLOW/PLANNER_HANDOFF.md.
- EA on disk (B-129 KEPT BUILD): `Experts/SRJ_FlowNexus_EA.mq5` = `EECDF0BC9FB8EFACCA02E2309FD94813D4A95C201789454E70315FC209D4CCA8` (701081 B, LF-only; .preB130 identical; .B130DIAG 90240F23 uncommitted).
- EA.ex5 bytes 504665AEAEDCEBD2EC98EC15D3D93871D8130C966076254C4F25ACB85B9AE1E4A (matching the kept source). FlowLogic 956BF3E3/ex5 27B5F272; includes at gate SHAs; MARKER 79859EDC/f0890c0b untouched.
- R2=CLOSED (section 12); ALL7 guard absent, ALL7 passed false; WRITE_EXPLAINS 972/974. Slots fixed on disk (lookback 3000). June standard window 5/25 start, graded 6/01-6/12 (terminal.ini 4082A94F + Profiles 131/131 restored; preB87/preB84 kept).
- Ledger last item 1275 (B130-CQD-LATCHED-VERDICT, RESTORED); skill +9 lines (B-130 divergence ruling); journal 1067 lines (row 315 banked); planner-context B-130 lines (X1/X2/X3); register B row 2 TAKEN + C 4 June correction (j38 cell withdrawn).
- R6: 4 June sold 09:55 open because 09:50 latest divergence was hidden bearish (-2) on 09:45 (walkShift 2; opp +1 @ 09:35). All 12 kept latches named, no UNKNOWN.
- 4 June still open (record names no divergence time/type; chart call carried: 09:50 candle latest divergence + candle?). 5 June 16:15 TAKEN (B-129). 2 June silent.
- SILENT6 parked (not in register; logs complete; ends UNKNOWN).
- S54 hunk S + hunk C/XT live as kept. R7: BUILDABLE-PICK-ONLY + NOT-BUILDABLE-FULL-XOB-MAP; BLOCKED none. B-130: RESTORED diagnostic (print-only undone; kept byte-identical).
- B-79 chart call WITHHELD by planner (never reaches him). Record answer: 15:35 Y-POC r2:dS nearest higher target 1.15987 R0.18 refused; entry line Y-POC long side 15:45 dL confirm=0, 15:55 dL confirm=1, 16:00 open 1.16018.

## Next
- Next relay chooses the next unresolved fidelity task (4 June CQD gap is detection, not walk; chart call open); project goal open unless proven otherwise.

## Resume order
- Resume order: the latest planner relay's Part 0, then this pointer. Older handoffs are audit-only.
