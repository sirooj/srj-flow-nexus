# BUILDER SESSION POINTER - read this first, every session

**Rule:** this file is the ONLY live memory (capped 35 lines). Old queue/state documents are audit-only.

## State (2026-10-07; B-SERIES LANE ACTIVE; latest result B-57)
- B-series relay lane active (operator order 2026-10-04). Relay B-57 is the active task; for its scope it wins over older queue items. Latest result: `SRJ_FlowNexus_Local/06_HANDOFFS/BUILDER_RESULT_B57.md` (branch builder/B-57; F11 hold off, 7 EU takes re-proved, June graded, KEPT).
- Planner: PromptQL bot session for relay B-57; context 99_WORKFLOW/PLANNER_CONTEXT.md (PROMPTQL file audit-only).
- EA on disk: `Experts/SRJ_FlowNexus_EA.mq5` = `958D5AA1495BD08FFAA5B74B9318CD5EB8D632F103E4685E97179642AC5692DF` (681229 B; F11-OFF hunk uncommitted == `.B57F11OFF`; pre-edit `.preB57` = 63B18C1F).
- EA.ex5: `A2A47B9FAAC84720BAFD212405E8FF0A9CC0BC97DB4B0CF6EFE246EFF6AA05CE` (457450 B, compiled from the disk source 0/0 - MATCH). FlowLogic 956BF3E3/ex5 27B5F272; includes at gate SHAs; MARKER 79859EDC/f0890c0b untouched.
- R2=CLOSED (section 12); ALL7 guard absent, ALL7 passed false; WRITE_EXPLAINS 972/974. Slots fixed on disk (lookback 3000). June standard window 5/25 start, graded 6/01-6/12 (terminal.ini 88a0deb1 STD_JUNE; preB57 88a0deb1 kept).
- Ledger last item 1200 (B57-F11-OFF, KEPT); journal 1061 lines; register carries B-57 CORRECTION (B1 SAME, B2 owed abort-16:05, B3 SAME, C-3June SAME, A1-A7 SAME on j26).
- SILENT6 parked (not in register; logs complete; ends UNKNOWN).
- j26 RECON62-B57 (F6E30E77, 68248 lines, PASSED bal 10474.64 = j23); j27 JUNE0525-B57 (DD3E6855, 66904 lines, PASSED bal 10395.28); UJLTFHOLD 0 both runs. B2 stays owed: Monthly-POC long aborted 16:05, no 16:15 entry.

## Next
- Relay B-58 from the planner (F11-off follow-ups; 5 June 16:15 on the new map; machine-trade deltas 6/05-back + 6/09-gone are his call only via relay).

## Resume order
- Resume order: the latest planner relay's Part 0, then this pointer. Older handoffs are audit-only.

(End of file - total 24 lines)
