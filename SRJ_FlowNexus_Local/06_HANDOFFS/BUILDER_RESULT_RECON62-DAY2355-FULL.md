# BUILDER_RESULT_RECON62-DAY2355-FULL (2026-09-25, F1 PASS, F2 PASS, F3 PASS, L-final PASS)

## Authority (all present before the first gate pull)

- Built tree EA A82F15E7/633938/11506 (PACKET_P-DAY2355-1 v4, relay v273 unanimous-clear; NO new build, NO canonical change this run; EA re-hashed this block, intact).
- His words banked: run word (full window on my recommendation) + completion word (this session, "the run has completed, please proceed").
- Stop-and-report mismatch condition checked green before grading (EA A82F15E7/633938/11506 + DONE=PASSED, re-measured this block).
- Commit rule per his 2026-09-23 order (builder-called; result commit rides this file).
- Vacated scoped attempt (ledger 745) never graded; this segment starts PRE_JOURNAL_LINES=47553, journal-proved range 2026.08.26 to 2026.09.10.

## Execution record

- Launched WMI_PID 2072 RC=0 instant (PID 17928), ceiling 90 respected. DONE=PASSED 2026-09-25 09:22:21. Wall 48:11 (08:34:10 to 09:22:21; test passed 0:47:49).
- Segment: 06_HANDOFFS\RECON62-DAY2355-FULL_JOURNAL.log 163B20FA/6463131/34254 (wrapper-archived; STATUS terminal state PASSED; ARCHIVED_LINES 34254 == file lines 34254).
- Baseline: RECON60 4824FE61/6465733/34269 (same window, same feed 563338 ticks / 3168 bars).
- Final balance 10474.64 (+24.55 vs 10450.09, EA-driven; never graded, recorded only).
- Tabulation: machine pulls same-method both sides (.Contains parity; zeros re-proved; full prefix-stripped set-diff) in 06_HANDOFFS\RECON62-DAY2355-FULL_TABULATION.txt (9F7EE982/3564/33).

## Realized delta (fidelity vocabulary: what differs vs what is only confirmed)

- CHANGED (the fix, carried): 9/4 DAY_CLOSE deal #7 Friday 23:55:00 fill 1.16129 (was Monday 00:00:07 fill 1.16093); Monday verdict + execution cluster gone; Friday vDAY=1 verdict only.
- CONFIRMED (untouched days): all other 6 takes identical bars/entries/exits; all elections identical; all census identical; feed identical.
- DERIVED (second, never graded): 9/7 second-take lots 3.90 to 3.91 (raw 3.9068 to 3.9160); 9/7 first-take raw 2.5000 to 2.5060 floored 2.50 same take; balance path downstream of the Friday close.

## Acceptance grades

- F1 PASS (takes): 7/7 SIGNAL/PRE-SEND/EXECUTED/ENTRY_TICKET chains identical bars/entries (1.16466/1.16024/1.16019/1.16138/1.16264/1.16205/1.16220); 9/4-invalid refused; MTCOLLISION 0/0.
- F2 PASS (exits): 6/7 MTEXIT identical + 9/4 DAY_CLOSE Friday-exact (ref==fill 1.16129, pid triple, flat, retcode DONE); MTCLOSE 2/2 joins hold; deals 14/14 (only #7 differs by the fix; #10/#11 second-decimal lots, fills identical).
- F3 PASS (elections/census/feed): ABORT 51/51 zero-diff; DIV 906/906; SUPPRESS 4/4; FIRE 1/1; SKIP 3/3; VETO 12/12; OPP_FVG 18/18; BIAS/ZONE byte-identical; PROMO 469/469 zero-mismatch; WS161 208/208; EXITVERDICT -1 explained (Monday verdict gone); set-diff venue-closed (only60=49, only62=36, unexplained 0 both).
- L-final: F1 PASS / F2 PASS / F3 PASS. His question answered on disk: the tighten touches only trades open at a mark (one trade, 9/4) plus second-decimal lots downstream.

## Goal join (full window 08-26 to 09-09; scoreboard re-joined)

- HIT - 8/28 London SHORT (entry/bar identical; 11:40 BREAK close identical).
- HIT - 9/1 New York LONG (entry exact 1.16024; SL 17:50 identical; his 17:45 early-exit reference stays tolerance-open, no question).
- HIT - 9/4 New York LONG (entry identical; exit now Friday 23:55 fill 1.16129, timing closed per his rule).
- HIT - 9/7 London LONG + 9/7 New York LONG (entries/bars identical; TP exits identical prices; lots second only).
- HIT - 9/8 London SHORT + 9/8 17:00 SHORT (entries/bars identical; TP + SL identical).
- REFUSED - 9/4 10:40 INVALID SHORT + 9/1 chain + all rejects silent (14 deals = 7 signals + 7 broker exits).
- Deployment bar SHUT (no live money ever; full-journal sample window only; exit-model follow-ons via council route on his scope word).

## Cost and next

- Cost: one fidelity run 48:11 wall (90 ceiling respected) on the cleared tree; no build, no key spent. Novel evidence delivered: full-window zero-delta outside the mark trade (set-diff venue-closed, not just count-equal).
- Next: exit-model follow-ons (B-alternatives kept-recorded) via council route on his scope word; wider journal spans on his scope word. No transport owed.

(End of file)
