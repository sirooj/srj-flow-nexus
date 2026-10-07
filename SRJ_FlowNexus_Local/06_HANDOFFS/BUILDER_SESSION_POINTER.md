# BUILDER SESSION POINTER - read this first, every session

**Rule:** this file is the ONLY live memory (capped 35 lines). Old queue/state documents are audit-only.

## State (2026-10-07; B-SERIES LANE ACTIVE; latest result B-78)
- B-series relay lane active (operator order 2026-10-04). Relay B-78 is the active task; for its scope it wins over older queue items. Latest result: `SRJ_FlowNexus_Local/06_HANDOFFS/BUILDER_RESULT_B78.md` (branch builder/B-78; row-keyed target trial hunk RK, RESTORED).
- Planner: PromptQL bot session for relay B-78; context 99_WORKFLOW/PLANNER_CONTEXT.md (PROMPTQL file audit-only).
- EA on disk: `Experts/SRJ_FlowNexus_EA.mq5` = `6CFE8F8B81C700411EB723C597A4672D2D631123284F45382CB96C11DC50D213` (688905 B, LF-only = kept D00F93BB + hunk S, RESTORED from .preB78 and verified; .B78RK 7A88676A kept uncommitted with its diff, never pushed).
- EA.ex5 bytes 6CDBB39E (restored, matches kept source). FlowLogic 956BF3E3/ex5 27B5F272; includes at gate SHAs; MARKER 79859EDC/f0890c0b untouched.
- R2=CLOSED (section 12); ALL7 guard absent, ALL7 passed false; WRITE_EXPLAINS 972/974. Slots fixed on disk (lookback 3000). June standard window 5/25 start, graded 6/01-6/12 (terminal.ini 88a0deb1 restored+verified; preB58/preB60/preB61/preB63/preB64/preB68/preB69/preB78 kept).
- Ledger last item 1223 (B78-ROWKEY-TRIAL, RESTORED); journal 1066 lines; banking verified (no new words); planner-context B-78 lines only.
- SILENT6 parked (not in register; logs complete; ends UNKNOWN).
- S54 hunk S live: retrospective latest-touch + strict close-through + zero tol at 3 confirm sites; j37 77F454AB 7/7 SAME (bal 10474.64); j38 5/5 SAME incl 6/4 + 6/11 (bal 10395.28); j37/j38 zero S54KILL rows.
- B-78 trial only: hunk RK refused 27-Aug D-VWAP below 1R with no fire (key Daily-POC) but moved 4-Sep to a 15:35 fire (entry/stop/exit differ, target same 1.16302); j41 DD4128CB bal 10429.29 (6/7 identical); j42 ED757045 bal 10395.28 (5/5 identical); ROWKEY 10/11; verdict RESTORED. CQD line: flag-gate superseded by his 9 Sep restore directive (161-R). Kept build back on disk.

## Next
- Relay B-79 from the planner.

## Resume order
- Resume order: the latest planner relay's Part 0, then this pointer. Older handoffs are audit-only.

(End of file - total 27 lines)
