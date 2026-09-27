# BUILDER RESULT RECON71-V8-UJ - v8 on USDJPY 6/1-6/13: PASSED, 0 takes, mechanism diagnosed (2026-09-27)

## 1. Run facts (segment-measured)
- RECON71-V8-UJ DONE=PASSED (43m23s, 2880 bars, 542258 ticks, final balance 10000.00). Binary proven: EA 14C7476C still on disk at grade (takes attributable to the v8 build).
- Window proven by the journal testing-line: USDJPY M5 2026.06.01-2026.06.13. Pool built READY 11/11 from the 2026.04.29 floor (covReq=covAch=04.29 on rows).
- Row census: UJPROBE 2880/2880, UJM15ROW 960, UJPOOLCOV 2880, UJPOOLSTATE 11 (READY), UJPOOLSVC 1, UJALIGN 47 (32 PASS/15 NOMATCH, readFail 0), UJ1R 88 (42 PASS/46 FAIL), UJMEMO_PASS 0, UJMISMATCH 1, MTSNAP 0, UJADMIT 0, UJTOUCH 0, DIV_WAIT 0, SIGNAL 1, MTCOLLISION 0.
- Aborts (69): SUB_1R 46 (1:1 with UJ1R FAIL), NO_TP_TARGET 8, SESSION_CLOSED 7, LTF_MISALIGN 3, FRESH 4, MEMO_MISMATCH 1.
- DIV classes over 2880 probes: ALIGNED 157, OPPOSING 2714, ABSENT 9, INCOMPLETE 0.

## 2. Close the loop (promise vs realized)
- Improved (firsts): cross-check guard fired honestly once (6/3, both value sets carried); probe DIV classifier + pool lineage rows present on every bar; pool builds READY from the named floor; TPCENSUS ref= rename live (#75-77).
- Confirmed only: guards pass across days (32 PASS); 1R gate kills sub-1R at poll (46, per spec).
- Voided: A-IMPL1 REFUTED (below); A-IMPL2/A-IMPL3 unproven (0 admissions, UJADMIT schema never published); A-EU-PRESERVE out of scope (one-run grant).

## 3. Mechanism (proximate death per venue, rows cited)
- 6/3 09:10 (tester-only LONG, TP 159.983): the run's sole fire. Poll memo sl=159.905 (SlRefMemo) vs fire sl=159.889 (ComputeSlReference) - 1.6pts apart. Guard aborted MEMO_MISMATCH per spec; SIGNAL had already printed (LogSignal precedes the latch). No take. Root: PRE-EXISTING SL-source divergence, first proven by the new cross-check (no prior run ever compared them).
- 6/5 09:45 (his SHORT): candidate retained S2WAIT "LTF bias unaligned" 09:25-09:45 (5 consecutive passes, R 1.30-2.00 PASS), killed 09:50 at R 0.60 (SUB_1R). Guards never ran (candidate never left S2). A-IMPL1 REFUTED by death-row rule: predicted guard-pass row absent at the decision pass while S2WAIT-LTF refusal present complete - the S2 5-minute axis, not the M15 axis, holds the gate. Alternative becomes the mechanism.
- 6/5 16:15 (his LONG): S2WAIT retained 16:00, NO_TP_TARGET abort 16:10 at S2. Dead before any v8 check.
- 6/11 14:40 (his LONG): promoted to S4 (PASS R 3.65/4.27/1.75 at 14:25-14:35), then 14:40 TPCENSUS #77: Daily-VWAP printed 2pts above entry (160.522 vs 160.520) and won nearest; R 0.11 FAIL -> SUB_1R abort from S4_ARMED. Correct refusal UNDER HIS admission floor - unless that 2pt VWAP was invalid by his read (validity question open, see 5).
- Background firewall: DIV OPPOSING on 2714/2880 probes (94%). Nothing reached the DIV branch this run except 6/3 (ALIGNED(hidden, v=2), complete=1).

## 4. Defects/credits
- Builder defect: NONE this turn (implementation verified faithful: counts match spec; placements recorded in V8-BUILD). Skill checked: srj-council section 8 DEATH-ROW applied as written (A-IMPL1 refuted, alternative installed) - no skill change; the rule already governs this class.
- Credit: cross-check + probe + pool rows (first honest SL-divergence proof on record).

## 5. Owed next (council route + his answers)
- Next packet candidates: (a) single-source fire SL from the memo (admission consumes memo values); (b) S2-axis vs M15-axis reconciliation (S2 waits on 5m LTF; his 15m thesis unrepresented in promotion); (c) POI validity: was the 6/11 14:40 2pt Daily-VWAP valid in his eye (his answer decides filter fix vs correct-refusal grade); (d) poll-site vs fire-edge 1R placement (his veto surface, P025-recorded).
- Strategy question for him (record-first trail filed here: spec booking-validity + rank filter are code, not his words; no filed VWAP-validity rule found): see memo.

## 6. Correction (his rulings 2026-09-27; sections 1-5 stand verbatim)
- WITHDRAWN (a) the 14:40 entry-bar attribution carrying ref 160.520: 160.520 is the 14:45 open; his entry is the 14:40 open at 160.524 (TPCENSUS #76: bar 14:35, ref 160.524, winner YLOH 160.587, R 1.75 PASS, promoted). Repeat +1-bar defect, owned. (b) The section-5 VWAP-validity question: ANSWERED NO by his own-source ruling (finding USDJPY-MISSES Rulings-J); withdrawn as a question, never re-asked. (c) Venue diagnoses unattributed to his filed rulings: recall-join filed in Rulings-J (Rulings-D/F/G + STRUCTURAL-BIAS + VENUE-CORRECTION + NEAREST-ONLY-TP pins); re-derivation withdrawn.
- Revised 6/11: correct election at 14:35 (entry-consistent, R 1.75, promoted past S2); wrong kill at 14:40 on invalid VWAP-2pts (own-source + POC-over-VWAP hierarchy); surviving booking YLOH. Fix items for the packet: (a) POI own-source exclusion + hierarchy in the race; (b) SL single-source (memo-consumed admission); (c) S2 5m-axis vs 15m-confirm representation.
- Gates violated: BAR-TRIPLE (evaluated/pass/entry unconflated - failed on 160.520) + RECORD-FIRST (filed rulings uncited). No skill change beyond the strategy pins (OWN-SOURCE-EXCLUSION + ENTRY-BAR READ-BACK, read-back verified 1x each): BAR-TRIPLE, RECORD-FIRST, and DEATH-ROW already govern; execution failure, not a rule gap.

(End of file)
