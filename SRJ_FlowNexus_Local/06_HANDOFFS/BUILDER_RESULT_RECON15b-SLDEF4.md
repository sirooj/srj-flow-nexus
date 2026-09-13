# BUILDER_RESULT_RECON15b-SLDEF4 (P-SLDEF-4, E31–E34)

STATUS: EXECUTED AND GRADED — all 15 gates gradeable, 15/15 PASS on
RECON15b. Council verdict owed (ACCEPT + baseline advance, or BLOCK with
reasons). NO commit (no verdict); RECON14 baseline (2702B7F2) stays frozen.

## Builds

- Build 1: EA `EE8DCC1F50B2D071EEEB8364FE6271E969AFE0D6E2A23849AB3968548218DA97`
  (383578 B, 0/0) — ran RECON15 (PASSED 0:55:12) — SUPERSEDED, defect owned
  (§defect). FlowLogic `3606BFB4…` UNCHANGED (0/0).
- Build 2 (current, UNCOMMITTED):
  EA `1EE6FC62B979B545C9818450CB1F663EF3874AC753434F9E2A60D0C8FB4728B5`
  (383844 B, 0/0) — ran RECON15b (PASSED 0:54:46). One-line guard added;
  nothing else touched.

## Run records

- RECON15: 09:37:05–10:32:41, `Test passed in 0:55:11.788`, wrapper archived
  itself 17548 lines / 3305482 B /
  SHA256 `9A9AE93B631D2B07F0C166EC1F13F8011CA3530CE245C2D5EED06B4A95E712AD`,
  boundaries [27221..44768] (PRE_JOURNAL_LINES=27220), purity 1/4/481.
  Records retained (journal/tabulation/STATUS/DONE) as the defect record.
- RECON15b: 10:39:06–11:34:09, `Test passed in 0:54:46.326`, wrapper archived
  itself 17598 lines / 3322832 B /
  SHA256 `1BB162E5F5959F68A1BF2FE7DD595AE5351579D18E42E275B849DEF3308DDFDB`,
  boundaries [44769..62366] (PRE=44768 = RECON15's measured end: no
  interleaving writer), purity 1/4/481.
- Window/ini unchanged, 3168 bars / 563338 ticks both runs. No wrapper split,
  no timeout either run. Both tester terminals closed gracefully post-run.

## §defect — RECON15 superseded (owned, RECON12/12b precedent)

- The E31 beyond-check edit dropped the planned `wCoverN > 0` guard (line
  5996 stayed `if(slimbr_fresh)`): with an empty obligated set
  ladCoverT=0.0, and for SHORT any price exceeds 0 → break on the first rung.
- Blast radius exactly 9/08 (the only SHORT empty-obligation row): 1 rung
  (absolute slot 4, correct prefix) instead of 52; capHit 0 (should be 1);
  covers=1 (right value, wrong path). A LONG empty-set row would have
  enumerated correctly by accident (`x < 0-pt` false); none exists on pilot.
- Fix: `if(slimbr_fresh && wCoverN > 0 && wRowOk == 1)` + comment naming the
  defect. RECON15b proves the fix: 9/08 back to 52/351/500/1 with
  covers=1, MATCH byte-identical to RECON14 (52/6/OFF/20), SLADDER total
  285+51=336 exactly.
- Lesson: structural edits need a re-read of the edited region before
  compile (the guard was in the plan, lost between plan and edit).

## Gate verdicts (on RECON15b)

1. PASS — EA 0/0, Flow 0/0, FlowLogic digest re-stated unchanged.
2. PASS — identities verbatim: CQD 906 (170/308/263/165); WS161 21/205/0;
   SLMEMO 471/118/589; SL_REF 432/39/10; INPLAYCOMMIT 157/46; MTEXIT 4
   (3 TP_TOUCH + 1 HTF_FLIP, rows verbatim vs RECON14); aborts
   18/37/13/11/2/0/12; PROMO 469; CONFIRMPOLL 555; SUPPRESSED 156; N1
   28/26/0/3 with pairing (10+16 / 28+0 / 0+0 / 3+0 / 0+0); guard 60;
   sideViolations 0 / sideFracViolations 0; four-signal set verbatim.
3. PASS — instrument inert, eighth build: SLIMB 481/481, SLIMBWALK 481/481,
   SLIMBWALKF 481/481, SLIMBR 10/10 on the `bar|site` join, deltas and
   classes included (`RECON15b_GATE3_JOIN.txt`, zero miss).
4. PASS — census 11/1/3/0/0, overlaps 0, Oct-28 `offsetMinutes` 360 quoted,
   gap HALT 0.
5. PASS — `ladCovers = 1` on all 10 rows over the obligated subset
   (SLADWIN 1=10, SLADCORR 1=10); `ladLimitHit` 0=10, no UNCOVERED row, no
   HALT (witness agreement 100%, §witness); `rungExt` monotone 10/10 rows,
   0 violations; distinct `barTime` 10/10 rows, 0 dups. THE result: 15:55
   covers=1 — window [1..574], deepest rung 571, OB base slot 524 matched
   resid 0. The named 31-slot shortfall is CLOSED by E31 as predicted.
6. REPORTED (pass-as-reporting) — `FRAC_OFF_LADDER = 0`; `TODAY_OFF_LADDER`
   = 2 rows {10:35 NEW, 9/08 carried}; `REF_OB_DEEP` 6 lines with slots
   {10:35 slot 168 ×3 (today/base/nuance, steps 0), 9/08 slot 817 ×3}.
   Change mechanism (not absorbed): 10:35's obligated set is frac-only
   (fracSteps=12, OB steps=0) → cover target less protective → ladder covers
   at 29 rungs (was 33), never reaches the zero-step OB extreme at slot 168
   → today/base/nuance unmatched (−3 pairs), REF_OB_DEEP ×3, todayOff +1 —
   the rescoped behavior working as specified. Pairs 52→50 = −3 (10:35) +1
   (15:55 base newly matched): arithmetic closed. Slot 168 (10:35-frame)
   and slot 817 (9/08-frame) resolve via slotT to the SAME historical bar
   9/03 20:35 1.16379 — the shift frame slides with test progress (649 bars
   between the two evals); slotT is the cross-row key.
7. PASS — slot-matched residuals 50/50 zero (lo=0 hi=0), histogram in full
   (empty), nonzero none.
8. PASS — ghost re-verified by slot: 1.16112 rung 19 (index UNCHANGED from
   RECON14), rungSlot 77, shift 78, 10:10 bar, px=wick exact, body 1.16126,
   imbCode 1, distPts −106, rungR 0.36, brackets rung 18 (1.16141) / rung 20
   (1.16102).
9. PASS — `SLADDER_MATCH`: Sep-7 1.16240 MATCH (rung 0 slot 1 ext 0, 16:30
   bar, resid 0); Sep-4 1.15907 MATCH (rung 16 slot 407, 9/03 05:55 bar,
   resid 0); other Sep-4 rows NOMATCH with slots; NOLEVEL ×5; 1.15847
   unfiled — the SL pair stays open.
10. PASS — `ORDER` on 16 distinct S5-evaluated bars (16 lines, seqS5 strictly
    increasing, one line per bar); outcomes RR_FAIL=6 DIV_WAIT=6 PASS=4
    NO_TP=0 NO_SL=0; seqBias<seqS5 on all 13 stamped pairs (bias block
    textually precedes S5 in the same per-bar pass); seqBias=−1 ×4 (8/27
    17:00, 9/01 10:10, 9/04 09:40, 9/04 10:35 — S4→S5 promotion after the
    bias block ran for the bar; disclosed); `count(flip==1 AND PASS)` = 0,
    in-code counter and off-log count agree; biasAtGate always readable
    (0/1/2); Sep-4 15:55 quoted seqBias=279 seqS5=280 biasAtGate=2 PASS —
    the bias was already flipped at the gate (stronger than MTFLIP's lower
    bound; consistent: anti stayed 2 from ≤15:55 through 16:00).
11. PASS — `SLADDER_DECISION` rows=10 fired=4 threshold=1.00
    compiled_default orderFlipPass=0; ROW 10/10 wellformed; RUNG 24
    (SLOT=12 EXT=12) wellformed; every companion carries slot+barTime+price
    — no rung index load-bearing.
12. PASS — `SIGMAP` 4/4 (same map); `FRAME_NOTE` six conventions (readwin
    token present, max 320).
13. PASS — `LINEWIDTH` 22 classes (21+3: SLADWIN/ORDER/REF_OB_DEEP),
    truncated=0, BADFMT=0 every class. DISCLOSED: the tabulation line
    `WALKF_BADFMT=481` is a script mislabel (pattern missing the negative
    lookahead; TOTAL==wellformed==481 so true badfmt=0). Pre-existing in
    the 314 script; fixed in the next script; records stand.
14. PASS — sampled-day spot check 157/157/443 identical to RECON14.
15. Digests above; FlowLogic re-stated unchanged; archives as §records.
    NO COMMIT (no verdict).

## §witness — SLADWIN per row (isRung today/base/nuance/frac/fracNu/anchor; steps OB/frac; window start/span/limit; rungs)

- 8/26 LONG OK: 1×6; 3/72; 1/385/500; 30 rungs.
- 8/27 SHORT OK: 1,-1,-1,1,1,1; 108/2; 1/352/500; 52 rungs.
- 8/28 10:00 SHORT OK: 1×6; 2/13; 1/98/500; 11 rungs.
- 8/28 16:20 SHORT OK: 1×6; 2/0; 1/174/500; 35 rungs.
- 9/04 09:25 LONG OK: 1×6; 20/21; 1/163/500; 25 rungs.
- 9/04 10:35 SHORT OK: 1×6; 0/12; 1/117/500; 29 rungs. OB zero-step →
  REF_OB_DEEP ×3 (slot 168); obligated = frac subset.
- 9/04 15:55 LONG OK: 1,1,1,−1,−1,1; 22/95; 1/574/574; 49 rungs. Base slot
  524 obligated and matched; walkWinOB=408+500 walkWinFR=2+500.
- 9/07 09:15 LONG OK: 1×6; 8/10; 1/90/500; 32 rungs.
- 9/07 16:40 LONG OK: 1×6; 15/20; 1/128/500; 21 rungs.
- 9/08 SHORT OK: 1×6; 0/0; 1/49→500; 52 rungs. Obligated empty → covers
  vacuous + REF_OB_DEEP ×3 (slot 817); walkWinOB=817+500 (unobligated walk
  ground legitimately exceeds the ladder window — E31.5 checks obligated
  only, no halt).

## Mechanism choices disclosed (no ruling needed unless council disagrees)

- Row-level HALT (E31.1/E31.5 print-only refusal): implemented, never fired
  (OK=10). A run-stop would have destroyed the rest of the run's census;
  row refusal preserves all other evidence.
- SRJ_LAD_MARGIN_SLOTS=50 / SRJ_LAD_ABS_SLOT_CAP=4000: never bound (max
  span 574). Values stated in source.
- REF_OB_DEEP for OB limbs only (verdict-conformant); frac slotless echoes
  take nothing.
- E31.5 "the walk read" = the walk's produced reference slots, not every
  scanned slot.

## Files

- `06_HANDOFFS/RECON15b-SLDEF4_JOURNAL.log` (17598, 1BB162E5…, 3322832 B)
- `06_HANDOFFS/RECON15b-SLDEF4_TABULATION.txt`
- `06_HANDOFFS/RECON15b_GATE3_JOIN.txt`
- `06_HANDOFFS/RECON15-SLDEF4_JOURNAL.log` (17548, 9A9AE93B…, 3305482 B) +
  tabulation + STATUS/DONE (superseded defect record)
- `00_CURRENT_WORKING/{launch,tabulate,join_15,join_15b}_sldef415*.ps1`,
  `compile_sldef4_{ea,flow}.ps1`, `T162_SLDEF4_{EA,FLOW}COMPILE.log`
- EA 1EE6FC62 UNCOMMITTED; FlowLogic 3606BFB4 unchanged.
- Harness notes: `cmd /c start` with splatted argv launches reliably (two
  quoting traps documented in the launch script: single-variable args die
  silently, PowerShell strips title quotes); the builder-side call still
  hangs to timeout AFTER printing (same unexplained family as RECON14;
  launches proven reliable via STATUS). First attempt's popup came from
  stripped title quotes (operator dismissed).

## Verdict asked

ACCEPT (15/15 on RECON15b) + advance frozen baseline to 1EE6FC62, or BLOCK
with reasons. If ACCEPTED, next: HANDOFF BRIEF (gates 5–11 single artifact),
then operator mark-up collection (barTime+price).
