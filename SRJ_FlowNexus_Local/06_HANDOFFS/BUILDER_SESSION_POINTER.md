# BUILDER SESSION POINTER - read this first, every session

**Rule:** this file is the ONLY live memory (capped 35 lines). Old queue/state documents are audit-only.

## State (2026-10-07; B-SERIES LANE ACTIVE; latest result B-58)
- B-series relay lane active (operator order 2026-10-04). Relay B-58 is the active task; for its scope it wins over older queue items. Latest result: `SRJ_FlowNexus_Local/06_HANDOFFS/BUILDER_RESULT_B58.md` (branch builder/B-58; 5 June bar map on record, reseed path found, no trade moves, KEPT).
- Planner: PromptQL bot session for relay B-58; context 99_WORKFLOW/PLANNER_CONTEXT.md (PROMPTQL file audit-only).
- EA on disk: `Experts/SRJ_FlowNexus_EA.mq5` = `D00F93BB688001108042536DA5B907AE7676BD51FA22E08C386551D51ABC4193` (683671 B; DIAG-BAR print-only uncommitted == `.B58DIAG`; pre-edit `.preB58` = 958D5AA1).
- EA.ex5: `84F6CE11A654D0672F3F194C82D82105BE47455220D380E22F020A81621F2AE5` (458994 B, compiled from the disk source 0/0 - MATCH). FlowLogic 956BF3E3/ex5 27B5F272; includes at gate SHAs; MARKER 79859EDC/f0890c0b untouched.
- R2=CLOSED (section 12); ALL7 guard absent, ALL7 passed false; WRITE_EXPLAINS 972/974. Slots fixed on disk (lookback 3000). June standard window 5/25 start, graded 6/01-6/12 (terminal.ini 88a0deb1 STD_JUNE; preB58 88a0deb1 kept).
- Ledger last item 1201 (B58-DIAG-0605, KEPT); journal 1061 lines; register untouched (read-only this relay; B-57 CORRECTION stands).
- SILENT6 parked (not in register; logs complete; ends UNKNOWN).
- j28 RECON62-B58 (29BC5DBA, 71417 lines, PASSED bal 10474.64 = j26); j29 JUNE0525-B58 (FDD4D79A, 71227 lines, PASSED bal 10395.28 = j27); UJLTFHOLD 0 both; UJBARMAP 3168/4320 rows. B2 stays owed: 16:15 open 160.059, no seed 16:05-16:15 (RETESTBOOK hits=0), abort 16:05 stands.

## Next
- Relay B-59 from the planner (rules B-59 from R1, R2 and T2: 16:15 entry vs 16:05/16:10 no-touch/no-break rows).

## Resume order
- Resume order: the latest planner relay's Part 0, then this pointer. Older handoffs are audit-only.

(End of file - total 24 lines)
