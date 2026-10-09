# BUILDER SESSION POINTER - read this first, every session

**Rule:** this file is the ONLY live memory (capped 35 lines). Old queue/state documents are audit-only.

## State (2026-10-09; B-SERIES LANE ACTIVE; latest result B-131)
- B-series relay lane active (operator order 2026-10-04). Relay B-131 is the active task; for its scope it wins over older queue items. Latest result: `SRJ_FlowNexus_Local/06_HANDOFFS/BUILDER_RESULT_B131.md` (branch builder/B-131; workflow PK-2 + latch kept, KEPT).
- Planner entry: kit PK-2. Any planner agent starts from 99_WORKFLOW/PLANNER_BOOTSTRAP.md (kit PK-2); context 99_WORKFLOW/PLANNER_CONTEXT.md; cold start 99_WORKFLOW/PLANNER_HANDOFF.md.
- EA on disk (NEW KEPT BUILD): `Experts/SRJ_FlowNexus_EA.mq5` = `90240F238A0668885E2D39BDA5271CE3C08D81B7EA1836DB77F52A42E631AF3` (12773 lines = EECDF0BC + 45-line print-only D130LATCH block; .preB131 EECDF0BC; .B131LATCH identical).
- EA.ex5 bytes 6CFD3A469E434CE0570F2CE04B1C19AD994570042A553EEF18D32569E58D380D (matching the latch source). FlowLogic 956BF3E3/ex5 27B5F272; includes at gate SHAs; MARKER 79859EDC/f0890c0b untouched.
- R2=CLOSED (section 12); ALL7 guard absent, ALL7 passed false; WRITE_EXPLAINS 972/974. Slots fixed on disk (lookback 3000). June standard window 5/25 start, graded 6/01-6/12 (terminal.ini 4082A94F + Profiles 131/131 restored; preB87/preB84 kept).
- Ledger last item 1276 (B131-WORKFLOW-PK2, KEPT); skill unchanged (B1 banked nothing); journal 1067 lines (row 315 stands); planner-context B-131 lines (X1/X2/X3); kit files PK-2 (SKILL/TEMPLATE/BOOTSTRAP/MEMORY + srj-relay Row pack); ROWPACK/ first packs + INDEX.
- T4 KEPT: 7/7 EU + B3/C3/27May + B2 16:15 + 4Jun kept-path identical, must-never zero both windows, latches equal. Lane: 4JUN-0955 (4 June London short), relays B-118, B-119, B-120, B-130, B-131 = 5 of 6.
- 4 June still open (chart call open: 09:50 pane read + candle?; latch -2@09:45 shared with A6; opposite +1@09:35 unique but retired evidence). 5 June TAKEN. 2 June silent.
- SILENT6 parked (not in register; logs complete; ends UNKNOWN).
- S54 + hunk C/XT + latch print live as kept. R7: BUILDABLE-PICK-ONLY + NOT-BUILDABLE-FULL-XOB-MAP; BLOCKED none.
- B-79 chart call WITHHELD by planner (never reaches him). Record answer: 15:35 Y-POC r2:dS nearest higher target 1.15987 R0.18 refused; entry line Y-POC long side 15:45 dL confirm=0, 15:55 dL confirm=1, 16:00 open 1.16018.

## Next
- Next relay chooses the next unresolved fidelity task (4 June at lane 5 of 6; parks at 6 without separator); project goal open unless proven otherwise.

## Resume order
- Resume order: the latest planner relay's Part 0, then this pointer. Older handoffs are audit-only.
