# BUILDER SESSION POINTER - read this first, every session

**Rule:** this file is the ONLY live memory (capped 35 lines). Old queue/state documents are audit-only.

## State (2026-10-08; B-SERIES LANE ACTIVE; latest result B-79)
- B-series relay lane active (operator order 2026-10-04). Relay B-79 is the active task; for its scope it wins over older queue items. Latest result: `SRJ_FlowNexus_Local/06_HANDOFFS/BUILDER_RESULT_B79.md` (branch builder/B-79; 4-Sep 15:35 vs his entry, MEASURED).
- Planner: PromptQL bot session for relay B-79; context 99_WORKFLOW/PLANNER_CONTEXT.md (PROMPTQL file audit-only).
- EA on disk: `Experts/SRJ_FlowNexus_EA.mq5` = `6CFE8F8B81C700411EB723C597A4672D2D631123284F45382CB96C11DC50D213` (688905 B, LF-only = kept D00F93BB + hunk S; .B78RK 7A88676A kept uncommitted with its diff, never pushed).
- EA.ex5 bytes 6CDBB39E (matches kept source). FlowLogic 956BF3E3/ex5 27B5F272; includes at gate SHAs; MARKER 79859EDC/f0890c0b untouched.
- R2=CLOSED (section 12); ALL7 guard absent, ALL7 passed false; WRITE_EXPLAINS 972/974. Slots fixed on disk (lookback 3000). June standard window 5/25 start, graded 6/01-6/12 (terminal.ini 88a0deb1; preB58-preB78 kept).
- Ledger last item 1224 (B79-0904-1535-REC, MEASURED); journal 1066 lines; banking verified (no new words); planner-context B-79 lines only.
- SILENT6 parked (not in register; logs complete; ends UNKNOWN).
- S54 hunk S live: retrospective latest-touch + strict close-through + zero tol at 3 confirm sites; j37 77F454AB 7/7 SAME (bal 10474.64); j38 5/5 SAME incl 6/4 + 6/11 (bal 10395.28); j37/j38 zero S54KILL rows.
- B-79 records only: 15:35 candidate MET every banked entry word exactly as his 15:55 take (confirm/retest/bias/regime/structure/zone/target all MET both; CQD UNREAD both); R4 DOES NOT SEPARATE + ONE carried chart call (15:40 1.15964/1.15835 vs his 16:00 1.16018); R3 EU 20/2/20 UJ 9/0/9, kept-FAIL->RK-PASS 5+5 all stopped at confirm. CQD line: flag-gate superseded by his 9 Sep restore directive (161-R). Kept build unchanged.

## Next
- Relay B-80 from the planner.

## Resume order
- Resume order: the latest planner relay's Part 0, then this pointer. Older handoffs are audit-only.

(End of file - total 27 lines)
