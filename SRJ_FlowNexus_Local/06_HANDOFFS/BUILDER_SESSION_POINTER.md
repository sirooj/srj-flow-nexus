# BUILDER SESSION POINTER - read this first, every session

**Rule:** this file is the ONLY live memory (capped 35 lines). Old queue/state documents are audit-only.

## State (2026-10-07; B-SERIES LANE ACTIVE; latest result B-65)
- B-series relay lane active (operator order 2026-10-04). Relay B-65 is the active task; for its scope it wins over older queue items. Latest result: `SRJ_FlowNexus_Local/06_HANDOFFS/BUILDER_RESULT_B65.md` (branch builder/B-65; bank 6/2 + 6/10, retest-death rows, nearest-line filter, MEASURED).
- Planner: PromptQL bot session for relay B-65; context 99_WORKFLOW/PLANNER_CONTEXT.md (PROMPTQL file audit-only).
- EA on disk: `Experts/SRJ_FlowNexus_EA.mq5` = `D00F93BB688001108042536DA5B907AE7676BD51FA22E08C386551D51ABC4193` (683671 B = B-58 gate; .B61DIAG/.B63DIAG/.B64DIAG keep attempt hunks, uncommitted, never pushed).
- EA.ex5 bytes AE1E9A5E (rebuilt 0/0 from D00F93BB at B-64 D4; provenance MATCH). FlowLogic 956BF3E3/ex5 27B5F272; includes at gate SHAs; MARKER 79859EDC/f0890c0b untouched.
- R2=CLOSED (section 12); ALL7 guard absent, ALL7 passed false; WRITE_EXPLAINS 972/974. Slots fixed on disk (lookback 3000). June standard window 5/25 start, graded 6/01-6/12 (terminal.ini 88a0deb1 STD_JUNE; preB58/preB60/preB61/preB63/preB64 kept).
- Ledger last items 1208 (B65-BANK-0602-0610, BANKED) + 1209 (B65-DIAG-NEARFILTER, NO_PICK/MEASURED); journal 1063 lines (rows 310/311 banked); strategy skill Ruling B-65 + register C rows banked; planner-context X1/X2 banked.
- SILENT6 parked (not in register; logs complete; ends UNKNOWN).
- 6/2 + 6/10 banked INVALID (0602 no-XOB-setup; 0610 15:45 body-close death). DEATH_0610 = CODE_MISSES_BREAK (no S5.4 kill; R2 MEANREV-only). XOB_0602 meaning NOT_FOUND. FILTER_PICK = NO_PICK (no filter removes 9/4). No .B65DIAG, no j37/j38, no Part D runs.
- Carried note: 2 chart calls (4 Sep NY target? LOH 1.16302 vs W-VWAP 1.16019; 8 Sep NY target? Y-POC 1.16114 vs W-VWAP 1.16207) - read it first.

## Next
- Relay B-66 from the planner (build the 10 June death-by-break from R0a rows and the 2 June touch from R0b, or his answer to the B-65 carried note).

## Resume order
- Resume order: the latest planner relay's Part 0, then this pointer. Older handoffs are audit-only.

(End of file - total 27 lines)
