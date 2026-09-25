# BUILDER_RESULT_RECON61-DAY2355-V4 (2026-09-25, A1 PASS, A2 PASS, A3 PASS, L-final PASS)

## Authority (all present before the first gate pull)

- Packet 01_TASKS\PACKET_P-DAY2355-1.md v4 7C915C61/9898/58 (E1 4-line day-mark lookahead, STAGE-1 gated).
- Relay 06_HANDOFFS\BUILDER_RELAY_COUNCIL_v273-DAY2355-CLEAR4.md 90FF7606/21643/149 (unanimous-clear 3-0, ledger 741).
- Luna key PACKET_P-DAY2355-1 v4 CLEARED one-build-one-run (5/5, ledger 742, SPENT HERE on this build+run).
- His words banked: run word (verbatim "build and run granted", precedent ledger 733) + completion word (this session, "the run has completed, please proceed").
- Stop-and-report mismatch condition checked green before grading (EA A82F15E7/633938/11506 + packet 7C915C61/9898/58 + relay 90FF7606/21643/149 + DONE=PASSED, all re-measured this block).
- Commit rule per his 2026-09-23 order (builder-called, commit after every build; result commit at grade time): build commit d0589ef + record commit eada674 ride first, result commit rides this file.

## Execution record (S1-S5 on DONE, carried ledger 742)

- S1 green (pre D74FE972/633552/11502 exact + mark-hit 1x at 11429 + names + buffers N/A).
- S2 E1 applied packet-sourced (4 lines post-11429, old 0; two script-assert slips + one off-by-one owned and fixed pre-write, fail-closed restores, tree verified pristine between).
- S3 post: EA A82F15E7/633938/11506 (budget 11502+4 exact).
- S4 compile 0 errors 0 warnings both targets (EA 6495ms + Flow 5959ms, logs re-read).
- S5 scoped ini [Tester] 1788480000/1788825600 (Fri 9/4 00:00 through Mon 9/7, DateTo Tue 9/8 exclusive) + WMI_PID 10892 RC=0. DONE=PASSED 2026-09-25 08:11:43. Wall 12:03 (07:59:40 launch to 08:11:43 DONE; test passed 0:11:42).
- Segment: 06_HANDOFFS\RECON61-DAY2355-V4_JOURNAL.log 5B8DD2A4/1896029/10747 (wrapper-archived; STATUS terminal state PASSED; ARCHIVED_LINES 10747 == file lines 10747).
- Baselines: RECON60 4824FE61/6465733/34269 (full window; same-span slices pulled this block).
- Feed: 94355 ticks, 576 bars (scoped window; window starts 9/4, balance path differs by construction).
- Final balance 10422.36 (EA-driven: Friday close 1.16129 vs Monday 1.16093 + re-derived lots; never graded, recorded only).
- Tabulation: machine pulls same-method both sides (.Contains parity; zeros re-proved) in 06_HANDOFFS\RECON61-DAY2355-V4_TABULATION.txt (3B279921/5298/50).

## Realized delta (packet novel-evidence vocabulary)

- DELIVERED (a) first Friday-timed DAY_CLOSE fill: deal #3 sell 0.58 at 1.16129 stamped Friday 2026.09.04 23:55:00 (fill-date == verdict-date; zero Monday fills for the Friday mark; zero trade-class rows dated ge-9/8 by two patterns).
- DELIVERED (b) ref==23:55-open join: MTCLOSE ref=1.16129 == MTEXIT exit == MTLIFE closePx == deal/order/CTrade fill 1.16129, all exact, all Friday first-tick (market sell close #2 1.16129/1.16136); prints carry evaluated bar 23:50, fill-time joins Friday.
- DELIVERED (c) takes intact with the earlier close: 3/3 SIGNAL/PRE-SEND/EXECUTED/ENTRY_TICKET chains, identical bars/entries (1.16019/1.16138/1.16264), tickets 2/4/6 pid==ppid; lots re-derived second (0.58/2.51/3.93 vs 0.57/2.5/3.9).
- Falsifiable probe reproduced WITH execution: 25 Friday-23:55:00 rows (16-pattern + 9 execution rows); vDAY=1 exactly 1x.

## Acceptance grades

- A1 PASS (timing): fill-date == verdict-date on the DAY_CLOSE deal (Friday 23:55:00 deal #3); no-Friday-ticks halt-cause never arises (25 Friday eval rows); Monday fallback unneeded; overshoot 0/0.
- A2 PASS (price): every MTCLOSE DAY_CLOSE ref == deal fill == 1.16129 exact (four-way join + order/CTrade); first-tick Friday timing (bid IS the bar open); bar-label rule holds (23:50 print, 23:55 fill-time). Contingency from packet F16 stands as stated (nextOpenPx identity gated on disk by the join, never self-proven).
- A3 PASS (identical): BREAK-leg 0-delta (0 in-window both); takes identical bars/entries; 9/4-invalid refused 7/7 identical (10:35 S4 triplet + 10:40 S5 quadruplet); MTCOLLISION 0/0 both; DIV 9/4 82/82; EVICTSUPPRESS ARM 1/1 identical; 9/7 TP exits identical bars/reasons/entries/fills (1.16200/1.16315 exits, 1.16201/1.16315 fills); magic pattern identical; fail rows 0.
- L-final: A1 PASS / A2 PASS / A3 PASS. Scope delivered whole: Friday-timed exact day-close + takes intact + identical elections.

## Goal join (window 09-04 to 09-07; scoreboard re-joined)

- HIT - 9/4 New York LONG (entry identical 1.16019; exit now Friday 23:55 fill 1.16129 - fill TIMING closed per his 23:55-open rule; was Monday 1.16093 defect).
- HIT - 9/7 London LONG + 9/7 New York LONG (entries/bars identical; TP exits identical prices; lots re-derived only).
- REFUSED - 9/4 10:40 INVALID SHORT (S4+S5 rows preserved 7/7).
- Rejects silent (3 signals + 3 broker exits = 6 deals; no Monday mark-fill).
- Feed note (never an EA defect): tester Friday-23:55 fill 1.16129 vs his chart Monday-00:00 O 1.16093 (36pt tester weekend gap; his Monday-O == tester Monday fill, agreement); his-feed Friday-23:55 open unmeasured on disk.
- Deployment bar SHUT (no live money ever; full-journal open; exit-model follow-ons via council route on his scope word).

## Cost and next

- Cost: one build (E1 4-line lookahead, STAGE-1 gated) + one scoped run 12:03 wall (90 ceiling respected; test 0:11:42) + Luna key DAY2355 SPENT. Novel evidence delivered: all three packet items (a) through (c) with rows.
- Next: exit-model follow-ons (B-alternatives kept-recorded: same-bar guard, iTime form, print hygiene) via council route on his scope word; full-journal span on his scope word. No transport owed (grade turns carry no transport ask).

(End of file)
