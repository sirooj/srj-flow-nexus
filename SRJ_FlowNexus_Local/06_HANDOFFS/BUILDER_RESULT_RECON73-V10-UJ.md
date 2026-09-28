# BUILDER RESULT RECON73-V10-UJ (2026-09-29; v10 tree FC41EE0D, UJ 1-13 June; DONE=PASSED)

## 0. Run gates (from segment, verbatim)

- DONE=PASSED 2026-09-29 00:34:50. Test passed in 0:46:49, 542258 ticks, 2880 bars (SEG 28864, 1x).
- Final balance 10118.27 (SEG 18592, 1x). Deposit 10000. One admission run-wide (SEG 159, 1x).
- Binary proof: EA FC41EE0D on disk + git-clean; ex5 443452 B 23:44 built before 23:47 launch.
- Window proof (pre-launch): journal testing-of 2026.06.01 to 2026.06.13 (2 lines). Not void: bars=2880, signals present.

## 1. PASS A - what the run got

- Sole take 3 June London LONG: entry 159.929, SL 159.889, TP 159.983, R 1.35, wsrc=ASH (SEG 159).
  Byte-identical values to RECON72 (entry/SL/TP/R + balance 10118.27). A-SL1-PRESERVE: PASS.
- v19 machinery census (segment counts): S2PROMOTE_M15 23 / UJLTFHOLD 22 (16 M15 + 6 CARVE) /
  UJCONFIRMCARRY 0 / UJPOLLRISK 114 / UJHISTPOOL 55 + TPFALLBACK 55 / UJFBPOOL 0 /
  reason=SUB_1R 0 (two patterns) / CONFIRM_STRUCT_FAIL 97 / action=HELD 80 / UJADMIT 1.
- Death rows: 06_HANDOFFS\RECON73-V10-UJ_DEATHROWS.txt (23 rows, script-pulled 1x each, dup 0).
  Every row below cites SEG line + extract presence; no hand-typed rows.

## 2. PASS B - against his four valid takes (register B1-B3 + his frames, no new words)

- V1 5 June 09:45 SHORT (his frame: 09:35 retest, 09:40 confirmation, 09:45 open entry): MISS.
  Acceptance pins HIT: promotions 09:05 (SEG 5041, 1x) + 09:30 (SEG 5217, 1x); M15 holds;
  expected 09:25 abort fired. Acceptance MISSED: S4 arm at 09:40 + fire 09:45.
  Death chain: CONFIRMPOLL 09:40 confirm=1, but ZONEPICK 09:40 haveXob=1/xobInPlay=0 (SEG 5310)
  + S3INPLAY inPlay=0 via=none, bar 159.944-159.956 above zone 159.878-159.916, 0 hits over
  189 swings (SEG 5311) + verdict "no qualifying zone". No S4 arm, no STRUCT row, then
  ABORT LTF_MISALIGN at 09:50. Mechanism: the confirm poll passed while the S3 zone-touch
  arm refused the same bar - two predicates, one bar, opposite answers. Finding: UJ-NOADMIT.
- V2 11 June 14:40 LONG (his frame: 14:35 retest + confirmation, entry 14:40 open 160.524): MISS.
  A SHORT squatter held S4_ARMED on Daily-POC through 14:20/14:25/14:30 while the LONG printed
  dL retest hits (14:20/25/30) and was SUPPRESSED/HELD every pass, wouldPreempt=0 same tier
  (6 S4_ARMED->ABORT SHORT rows incl the 14:40:22 clearer). At the 14:40:22 pass the SHORT
  aborted - and the pass died with it: RETESTBOOK 14:35 = 0 rows, CONFIRMPOLL 14:35 = 0 rows
  (both zero, two patterns each), RETESTBOOK 14:40 hits=0 (SEG 14790, 1x). Slot freed one pass
  too late with no live LONG seed; a fresh SHORT cycle re-armed at 14:50 (SEG 14811, 1x).
  UJCONFIRMCARRY 0 run-wide is explained: no LONG candidate ever armed. Finding: UJ-NOADMIT.
- V3 5 June 16:15 LONG (his frame: entry 16:15 open 160.059, TP 30-April high 160.723): MISS.
  Every downstream gate PASSED: UJHISTPOOL pool=DH20260430:664 (SEG 5800, 1x), TPFALLBACK
  tp=160.723 src=DH20260430 (SEG 5801, 1x), UJ1R R=3.73 PASS on entry 160.059/sl 159.881
  (SEG 5816, 1x). But RETESTBOOK hits=0 at 16:05 (SEG 5775, 1x) and 16:10 (SEG 5817, 1x):
  no seed entered the pipeline, so nothing downstream could fire. Finding: UJ-NOADMIT.
- L-final: exactly 1 admission, no UJ-EXTRA. EU-preserve rides the August sibling run (owed,
  not this window). C-silence: no invalid takes in-window.

## 3. Why the same result two builds running

- The v19 remainder proved its own gates and missed all three venues at gates it never touched:
  F holds fired (22x; aborts only where neither M15 nor carve agreed - 36 LTF aborts incl the
  predicted 09:25 and the 09:50/14:40 killers); C promoted (23x incl both acceptance pins);
  H1 retired the poll abort (0 SUB_1R); H2 elected his high (55 pools). Preservation holds
  (6/3 byte-identical, zero regression) with zero progress on the three.
- The three death points are all UPSTREAM-or-BESIDE v19: S3 zone-touch arming (V1), same-session
  slot contention + aborted evaluation pass (V2), retest detection (V3).
- Owned census correction this turn: the first tabulation read ABORT_LTF_MISALIGN as 0 by a
  code-name pattern while the journal prints reason=LTF_MISALIGN (36x). Zero re-proved, record
  corrected here, no grade rested on it.

## 4. Next direction (builder-owned, council route, no questions this turn)

- V1: S3 zone-touch vs POC-retest-plus-confirm - the EA's extra arming condition on his bar.
- V2: wrong-side same-session squatter + evaluation pass dying with it - contention resolution.
- V3: retest-detector gap at 16:05/16:10 with prints everywhere else - detector diagnosis.
- Each carries Rule-vs-takes fencing (6/3 + EU takes must not move) before any packet drafts.

## 5. Record

- Ledger 945; pointer refreshed (graded 1/4, three UJ-NOADMIT findings, direction named);
  index updated (result + extract lines). Segment + extract + result commit same turn. No push.
- Digests: tree FC41EE0D/671645/12127 (unchanged since build commit 9485bf6).
