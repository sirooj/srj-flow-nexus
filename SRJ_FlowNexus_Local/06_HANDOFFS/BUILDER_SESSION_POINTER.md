# BUILDER SESSION POINTER - read this first, every session

**Rule:** this file is the ONLY live memory (capped 35 lines). Old queue/state documents are audit-only.

## State (2026-10-07; B-SERIES LANE ACTIVE; latest result B-75)
- B-series relay lane active (operator order 2026-10-04). Relay B-75 is the active task; for its scope it wins over older queue items. Latest result: `SRJ_FlowNexus_Local/06_HANDOFFS/BUILDER_RESULT_B75.md` (branch builder/B-75; live-XOB census at every confirmation, MEASURED).
- Planner: PromptQL bot session for relay B-75; context 99_WORKFLOW/PLANNER_CONTEXT.md (PROMPTQL file audit-only).
- EA on disk: `Experts/SRJ_FlowNexus_EA.mq5` = `6CFE8F8B81C700411EB723C597A4672D2D631123284F45382CB96C11DC50D213` (688905 B, LF-only = kept D00F93BB + hunk S; .B61DIAG/.B63DIAG/.B64DIAG/.B69DIAG keep attempt hunks, .preB68/.preB69 kept, all uncommitted, never pushed).
- EA.ex5 bytes 6CDBB39E (built 0/0 from 6CFE8F8B; provenance MATCH). FlowLogic 956BF3E3/ex5 27B5F272; includes at gate SHAs; MARKER 79859EDC/f0890c0b untouched.
- R2=CLOSED (section 12); ALL7 guard absent, ALL7 passed false; WRITE_EXPLAINS 972/974. Slots fixed on disk (lookback 3000). June standard window 5/25 start, graded 6/01-6/12 (terminal.ini 88a0deb1 STD_JUNE; preB58/preB60/preB61/preB63/preB64/preB68/preB69 kept).
- Ledger last item 1220 (B75-XOBCENSUS-REC, MEASURED); journal 1066 lines; banking verified (no new words); planner-context B-75 lines only.
- SILENT6 parked (not in register; logs complete; ends UNKNOWN).
- S54 hunk S live: retrospective latest-touch + strict close-through + zero tol at 3 confirm sites; j37 77F454AB 7/7 SAME (bal 10474.64); j38 5/5 SAME incl 6/4 + 6/11 (bal 10395.28); j37/j38 zero S54KILL rows.
- B-75 records only: full live-XOB census at every confirmation (A1 143/60-live, A6 219/93, A7 222/94, B2 270/145, F1 230/126 both journals, F2 134/56); R2 MP/AP/AF all DOES NOT SEPARATE (MP: A1/A6/A7 NOT MET; AP: A1 NOT MET + F1 MET; AF: all MET); R3 27-Aug D-VWAP never admitted on j39 (silent tier skip, books Y-VWAP R2.73; printed R 0.35); R4.2 filed none, no chart call. CQD line: flag-gate superseded by his 9 Sep restore directive (161-R). Kept build unchanged.

## Next
- Relay B-76 from the planner.

## Resume order
- Resume order: the latest planner relay's Part 0, then this pointer. Older handoffs are audit-only.

(End of file - total 27 lines)
