# BUILDER SESSION POINTER - read this first, every session

**Rule:** this file is the ONLY live memory (capped 35 lines). Old queue/state documents are audit-only.

## State (2026-10-07; B-SERIES LANE ACTIVE; latest result B-64)
- B-series relay lane active (operator order 2026-10-04). Relay B-64 is the active task; for its scope it wins over older queue items. Latest result: `SRJ_FlowNexus_Local/06_HANDOFFS/BUILDER_RESULT_B64.md` (branch builder/B-64; target-race tier-skip diagnostic on B-61 code, RESTORED).
- Planner: PromptQL bot session for relay B-64; context 99_WORKFLOW/PLANNER_CONTEXT.md (PROMPTQL file audit-only).
- EA on disk: `Experts/SRJ_FlowNexus_EA.mq5` = `D00F93BB688001108042536DA5B907AE7676BD51FA22E08C386551D51ABC4193` (683671 B = B-58 gate; .B61DIAG/.B63DIAG/.B64DIAG keep attempt hunks, uncommitted, never pushed).
- EA.ex5 bytes AE1E9A5E (rebuilt 0/0 from D00F93BB; provenance MATCH). FlowLogic 956BF3E3/ex5 27B5F272; includes at gate SHAs; MARKER 79859EDC/f0890c0b untouched.
- R2=CLOSED (section 12); ALL7 guard absent, ALL7 passed false; WRITE_EXPLAINS 972/974. Slots fixed on disk (lookback 3000). June standard window 5/25 start, graded 6/01-6/12 (terminal.ini 88a0deb1 STD_JUNE; preB58/preB60/preB61/preB63/preB64 kept).
- Ledger last item 1207 (B64-DIAG-TIERRACE, RESTORED); journal 1061 lines; strategy skill + register untouched this relay (relay skill June window + planner context B-64 line edited per Part X).
- SILENT6 parked (not in register; logs complete; ends UNKNOWN).
- TIER_ORIGIN = CODE_ONLY (P-EXITMODEL-2 F1, V225-cleared; no his-verbatim). X27_AFTER = GONE (books D-VWAP R0.35, refused). EU7_B64 = 5/7 SAME, 9/4 + 9/8pm LOST to Weekly-VWAP R0.01/R0.04. JUNE_B64 = all 7 SAME. TIER_HITS = 3 refusals.
- B-63 chart calls (6/2, 6/10) still pending with the planner - nothing banked. No carried note in B-64.

## Next
- Relay B-65 from the planner (bank his 6/2 + 6/10 answers first if given, then build from T1-T4).

## Resume order
- Resume order: the latest planner relay's Part 0, then this pointer. Older handoffs are audit-only.

(End of file - total 27 lines)
