# BUILDER SESSION POINTER - read this first, every session

**Rule:** this file is the ONLY live memory (capped 35 lines). Old queue/state documents are audit-only.

## State (2026-10-07; B-SERIES LANE ACTIVE; latest result B-71)
- B-series relay lane active (operator order 2026-10-04). Relay B-71 is the active task; for its scope it wins over older queue items. Latest result: `SRJ_FlowNexus_Local/06_HANDOFFS/BUILDER_RESULT_B71.md` (branch builder/B-71; spec XOB words vs rows, MEASURED).
- Planner: PromptQL bot session for relay B-71; context 99_WORKFLOW/PLANNER_CONTEXT.md (PROMPTQL file audit-only).
- EA on disk: `Experts/SRJ_FlowNexus_EA.mq5` = `6CFE8F8B81C700411EB723C597A4672D2D631123284F45382CB96C11DC50D213` (688905 B, LF-only = kept D00F93BB + hunk S; .B61DIAG/.B63DIAG/.B64DIAG/.B69DIAG keep attempt hunks, .preB68/.preB69 kept, all uncommitted, never pushed).
- EA.ex5 bytes 6CDBB39E (built 0/0 from 6CFE8F8B; provenance MATCH). FlowLogic 956BF3E3/ex5 27B5F272; includes at gate SHAs; MARKER 79859EDC/f0890c0b untouched.
- R2=CLOSED (section 12); ALL7 guard absent, ALL7 passed false; WRITE_EXPLAINS 972/974. Slots fixed on disk (lookback 3000). June standard window 5/25 start, graded 6/01-6/12 (terminal.ini 88a0deb1 STD_JUNE; preB58/preB60/preB61/preB63/preB64/preB68/preB69 kept).
- Ledger last item 1216 (B71-SPEC-XOB, MEASURED); journal 1066 lines (row 314 banked 4 June NOT-HIS-TAKE); skill section Ruling 2026-10-07 (B-70) banked; register untouched (4 June C row stood since B-70); planner-context B-71 lines only.
- SILENT6 parked (not in register; logs complete; ends UNKNOWN).
- S54 hunk S live: retrospective latest-touch + strict close-through + zero tol at 3 confirm sites; j37 77F454AB 7/7 SAME (bal 10474.64; RESULT_B68 T1 77BBCB55-class = j35 SHA, slice header right, RESULT_B68 untouched); j38 5/5 SAME incl 6/4 + 6/11 (bal 10395.28); j37/j38 zero S54KILL rows.
- 4 June London: must-never-take standing (register C; skill 0604-LDN-NOT-HIS; journal row 314). B-71 records only: spec XOB words pasted (§1.2/§3.5/§3.5.1/§3.6/§10/§9.9-12/§8) + XOBSUIT-1 §6 + charter §9; touch-optional origin corrected to spec §3.6 (B-70 CODE-ONLY stood as to his words); R4: 4 June fails §3.8, 2 June fails Step 4, no chart call, STOP-class NONE. Kept build unchanged.

## Next
- Relay B-72 from the planner.

## Resume order
- Resume order: the latest planner relay's Part 0, then this pointer. Older handoffs are audit-only.

(End of file - total 27 lines)
