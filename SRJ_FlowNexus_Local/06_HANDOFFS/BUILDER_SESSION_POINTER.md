# BUILDER SESSION POINTER - read this first, every session

**Rule:** this file is the ONLY live memory (capped 35 lines). Old queue/state documents are audit-only.

## State (2026-10-07; B-SERIES LANE ACTIVE; latest result B-66)
- B-series relay lane active (operator order 2026-10-04). Relay B-66 is the active task; for its scope it wins over older queue items. Latest result: `SRJ_FlowNexus_Local/06_HANDOFFS/BUILDER_RESULT_B66.md` (branch builder/B-66; retest death by body close, MEASURED).
- Planner: PromptQL bot session for relay B-66; context 99_WORKFLOW/PLANNER_CONTEXT.md (PROMPTQL file audit-only).
- EA on disk: `Experts/SRJ_FlowNexus_EA.mq5` = `D00F93BB688001108042536DA5B907AE7676BD51FA22E08C386551D51ABC4193` (683671 B = B-58 gate; .B61DIAG/.B63DIAG/.B64DIAG keep attempt hunks, uncommitted, never pushed).
- EA.ex5 bytes AE1E9A5E (B-64 D4 rebuild 0/0; provenance MATCH). FlowLogic 956BF3E3/ex5 27B5F272; includes at gate SHAs; MARKER 79859EDC/f0890c0b untouched.
- R2=CLOSED (section 12); ALL7 guard absent, ALL7 passed false; WRITE_EXPLAINS 972/974. Slots fixed on disk (lookback 3000). June standard window 5/25 start, graded 6/01-6/12 (terminal.ini 88a0deb1 STD_JUNE; preB58/preB60/preB61/preB63/preB64 kept).
- Ledger last item 1210 (B66-S54-BODYBREAK, MEASURED); journal 1063 lines; skill/register/journal untouched this relay (planner-context B-66 line only).
- SILENT6 parked (not in register; logs complete; ends UNKNOWN).
- S54_RECORD: seed-own lines, (seed,confirm] window, strict close-through, open unruled, zero tolerance. S54_INSTANCES: 13 LIVES; DIES 6/4 LDN (23pts) + 6/11 NY (1pt drift) + 6/10 + 18:05 (both expected). R2 STOP: no K/D/T. XOB_0602B meaning NOT_FOUND.
- Carried note: 2 chart calls (6/4 LDN break? 09:15 over D-POC 159.884; 6/11 NY break? 1pt under D-POC 160.525) - read it first. B-65 calls (4/8 Sep targets) still pending.

## Next
- Relay B-67 from the planner (his answer to the B-66 carried note first: 6/4 and 6/11 live-take-vs-break calls; then death-by-break build and target race).

## Resume order
- Resume order: the latest planner relay's Part 0, then this pointer. Older handoffs are audit-only.

(End of file - total 27 lines)
