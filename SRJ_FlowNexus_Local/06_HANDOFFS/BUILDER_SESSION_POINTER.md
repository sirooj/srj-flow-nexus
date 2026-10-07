# BUILDER SESSION POINTER - read this first, every session

**Rule:** this file is the ONLY live memory (capped 35 lines). Old queue/state documents are audit-only.

## State (2026-10-07; B-SERIES LANE ACTIVE; latest result B-63)
- B-series relay lane active (operator order 2026-10-04). Relay B-63 is the active task; for its scope it wins over older queue items. Latest result: `SRJ_FlowNexus_Local/06_HANDOFFS/BUILDER_RESULT_B63.md` (branch builder/B-63; 27 Aug target vs his 1R skip + B-61 code diagnostic, RESTORED).
- Planner: SuperApp planner session for relay B-63; context 99_WORKFLOW/PLANNER_CONTEXT.md (PROMPTQL file audit-only).
- EA on disk: `Experts/SRJ_FlowNexus_EA.mq5` = `D00F93BB688001108042536DA5B907AE7676BD51FA22E08C386551D51ABC4193` (683671 B = B-58 gate; .B61DIAG/.B63DIAG keep attempt hunks, uncommitted, never pushed).
- EA.ex5 bytes 84B361C1 (rebuilt 0/0 from D00F93BB; provenance MATCH). FlowLogic 956BF3E3/ex5 27B5F272; includes at gate SHAs; MARKER 79859EDC/f0890c0b untouched.
- R2=CLOSED (section 12); ALL7 guard absent, ALL7 passed false; WRITE_EXPLAINS 972/974. Slots fixed on disk (lookback 3000). June standard window 5/25 start, graded 6/01-6/12 (terminal.ini 88a0deb1 STD_JUNE; preB58/preB60/preB61/preB63 kept).
- Ledger last item 1206 (B63-DIAG-1RGATE, RESTORED); journal 1061 lines; strategy skill + register untouched this relay.
- SILENT6 parked (not in register; logs complete; ends UNKNOWN).
- ONE_R_HIS = FOUND (W1 verbatim: nearest target D VWAP under 1R -> skip). X27_TARGET = CODE_SKIPS_NEAREST (D-VWAP 1.16498 R0.35 tier-skipped EA:2624; booked Y-VWAP R2.73). DIR_CARRY_HIS = FOUND scoped (death-by-break verbatim; reuse-other-way not on record). J29_EA = D00F93BB (B-62 R5 corrected).
- B-61 code on j33/j34: B2 now takes his 16:15 entry (160.059/tp 160.723, M1655 gone); EXTRA 6/2 + 6/10 NY longs (no register row). X27 EXTRA unchanged (C-row INVALID).
- Carried note: 2 chart calls (6/2 Monthly-POC 14:20->15:30 buy 159.774; 6/10 Daily-POC 15:30->16:05 buy 160.436) - read it first.

## Next
- Relay B-64 from the planner (build from ONE_R_HIS / X27_TARGET / DIR_CARRY_HIS / T4, or his answer to the carried note).

## Resume order
- Resume order: the latest planner relay's Part 0, then this pointer. Older handoffs are audit-only.

(End of file - total 28 lines)
