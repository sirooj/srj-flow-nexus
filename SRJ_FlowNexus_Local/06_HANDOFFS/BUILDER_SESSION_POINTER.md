# BUILDER SESSION POINTER - read this first, every session

**Rule:** this file is the ONLY live memory (capped 35 lines). Old queue/state documents are audit-only.

## State (2026-10-07; B-SERIES LANE ACTIVE; latest result B-62)
- B-series relay lane active (operator order 2026-10-04). Relay B-62 is the active task; for its scope it wins over older queue items. Latest result: `SRJ_FlowNexus_Local/06_HANDOFFS/BUILDER_RESULT_B62.md` (branch builder/B-62; retest staleness 27 Aug vs 5 June, read-only, MEASURED).
- Planner: SuperApp planner session for relay B-62; context 99_WORKFLOW/PLANNER_CONTEXT.md (PROMPTQL file audit-only).
- EA on disk: `Experts/SRJ_FlowNexus_EA.mq5` = `D00F93BB688001108042536DA5B907AE7676BD51FA22E08C386551D51ABC4193` (683671 B = B-58 gate; .B60DIAG/.B61DIAG keep attempt hunks, uncommitted, never pushed).
- EA.ex5 bytes 9A522F05 (rebuilt 0/0 from D00F93BB; provenance MATCH). FlowLogic 956BF3E3/ex5 27B5F272; includes at gate SHAs; MARKER 79859EDC/f0890c0b untouched.
- R2=CLOSED (section 12); ALL7 guard absent, ALL7 passed false; WRITE_EXPLAINS 972/974. Slots fixed on disk (lookback 3000). June standard window 5/25 start, graded 6/01-6/12 (terminal.ini 88a0deb1 STD_JUNE; preB58/preB60/preB61 kept).
- Ledger last item 1205 (B62-MEAS-RETESTLIFE, MEASURED); journal 1061 lines; strategy skill + register untouched this relay.
- SILENT6 parked (not in register; logs complete; ends UNKNOWN).
- C27_MATCH = SAME_TRADE (X27 IS the ruled-INVALID 8/27 17:05 SHORT; no question needed). RETEST_LIFE_HIS = FOUND (Ruling 3 death-by-break verbatim + SEED-CARRY no-expiry). B2 clean 1-bar wait vs X27 6-bar wait (16:35 re-touch, 16:30 break, 5m-against). B2 stays owed.
- No carried note (neither chart call fired).

## Next
- Relay B-63 from the planner (retest-life guard from R1/R3 or his answer to the carried note).

## Resume order
- Resume order: the latest planner relay's Part 0, then this pointer. Older handoffs are audit-only.

(End of file - total 25 lines)
