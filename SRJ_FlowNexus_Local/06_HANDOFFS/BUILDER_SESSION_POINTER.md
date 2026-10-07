# BUILDER SESSION POINTER - read this first, every session

**Rule:** this file is the ONLY live memory (capped 35 lines). Old queue/state documents are audit-only.

## State (2026-10-07; B-SERIES LANE ACTIVE; latest result B-67)
- B-series relay lane active (operator order 2026-10-04). Relay B-67 is the active task; for its scope it wins over older queue items. Latest result: `SRJ_FlowNexus_Local/06_HANDOFFS/BUILDER_RESULT_B67.md` (branch builder/B-67; bank 4/8 Sep targets + S5.4 death, MEASURED).
- Planner: PromptQL bot session for relay B-67; context 99_WORKFLOW/PLANNER_CONTEXT.md (PROMPTQL file audit-only).
- EA on disk: `Experts/SRJ_FlowNexus_EA.mq5` = `D00F93BB688001108042536DA5B907AE7676BD51FA22E08C386551D51ABC4193` (683671 B = B-58 gate; .B61DIAG/.B63DIAG/.B64DIAG keep attempt hunks, uncommitted, never pushed).
- EA.ex5 bytes AE1E9A5E (B-64 D4 rebuild 0/0; provenance MATCH). FlowLogic 956BF3E3/ex5 27B5F272; includes at gate SHAs; MARKER 79859EDC/f0890c0b untouched.
- R2=CLOSED (section 12); ALL7 guard absent, ALL7 passed false; WRITE_EXPLAINS 972/974. Slots fixed on disk (lookback 3000). June standard window 5/25 start, graded 6/01-6/12 (terminal.ini 88a0deb1 STD_JUNE; preB58/preB60/preB61/preB63/preB64 kept).
- Ledger last item 1212 (B67-S54-BUILD, MEASURED); journal 1065 lines (rows 312/313 banked); skill Ruling B-67 + register A notes banked; planner-context B-67 line banked.
- SILENT6 parked (not in register; logs complete; ends UNKNOWN).
- 4/8 Sep targets banked (LDNHIGH 1.16302 day-close exit; YPOC 1.16114 hierarchy+nearest); kept build already books both. S54: 13 LIVES; DIES 6/4 LDN + 6/11 NY (1pt) + 6/10 + 18:05. R6 STOP: his-retest window uncodeable; no K/D/T.
- Carried note: 2 chart calls (6/11 NY 1pt break?; 6/4 LDN 23pt break?) - read it first.

## Next
- Relay B-68 from the planner (27 Aug target race from R3 rows; his answer to the B-67 carried note first: 6/11 + 6/4 break calls).

## Resume order
- Resume order: the latest planner relay's Part 0, then this pointer. Older handoffs are audit-only.

(End of file - total 27 lines)
