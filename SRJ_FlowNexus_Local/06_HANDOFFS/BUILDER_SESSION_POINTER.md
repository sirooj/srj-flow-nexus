# BUILDER SESSION POINTER - read this first, every session

**Rule:** this file is the ONLY live memory (capped 35 lines). Old queue/state documents are audit-only.

## State (2026-10-08; B-SERIES LANE ACTIVE; latest result B-80)
- B-series relay lane active (operator order 2026-10-04). Relay B-80 is the active task; for its scope it wins over older queue items. Latest result: `SRJ_FlowNexus_Local/06_HANDOFFS/BUILDER_RESULT_B80.md` (branch builder/B-80; side-matched row-key reading RKD, MEASURED).
- Planner: PromptQL bot session for relay B-80; context 99_WORKFLOW/PLANNER_CONTEXT.md (PROMPTQL file audit-only).
- EA on disk: `Experts/SRJ_FlowNexus_EA.mq5` = `6CFE8F8B81C700411EB723C597A4672D2D631123284F45382CB96C11DC50D213` (688905 B, LF-only = kept D00F93BB + hunk S; .B78RK 7A88676A kept uncommitted with its diff, never pushed).
- EA.ex5 bytes 6CDBB39E (matches kept source). FlowLogic 956BF3E3/ex5 27B5F272; includes at gate SHAs; MARKER 79859EDC/f0890c0b untouched.
- R2=CLOSED (section 12); ALL7 guard absent, ALL7 passed false; WRITE_EXPLAINS 972/974. Slots fixed on disk (lookback 3000). June standard window 5/25 start, graded 6/01-6/12 (terminal.ini 88a0deb1; preB58-preB78 kept).
- Ledger last item 1225 (B80-RKD-READ, MEASURED); journal 1066 lines; banking verified (no new words); planner-context B-80 lines only.
- SILENT6 parked (not in register; logs complete; ends UNKNOWN).
- S54 hunk S live: retrospective latest-touch + strict close-through + zero tol at 3 confirm sites; j37 77F454AB 7/7 SAME (bal 10474.64); j38 5/5 SAME incl 6/4 + 6/11 (bal 10395.28); j37/j38 zero S54KILL rows.
- B-80 records only: RKD census 418 passes (EU 197S/37K/1N, UJ 159S/21K/3N); R4 (a)-(e) all HOLDS; R5 verdict RKD BREAKS naming 8/27 10:05 SHORT (RKD D-POC R0.40 FAIL vs kept YPML R3.13 PASS, no fire either way; covering words FOUND, no carried note). 15:35 K (Y-POC dS refused R0.18); 15:55 kept-path fires R1.66. Kept build unchanged.
- B-79 chart call WITHHELD by planner (never reaches him). Record answer: 15:35 Y-POC r2:dS nearest higher target 1.15987 R0.18 refused; entry line Y-POC long side 15:45 dL confirm=0, 15:55 dL confirm=1, 16:00 open 1.16018.

## Next
- Relay B-81 from the planner.

## Resume order
- Resume order: the latest planner relay's Part 0, then this pointer. Older handoffs are audit-only.

(End of file - total 23 lines)
