# BUILDER_RESULT_RECON14-SLDEF3 (P-SLDEF-3, E27–E30)

STATUS: ACCEPTED (council verdict 2026-09-13). Gate-5 halt ruled the
packet's over-specification; coverage RESCOPED to rung-obligated refs.
New frozen baseline: EA 2702B7F2… (357192 B), FlowLogic 3606BFB4….
RECON13 superseded (ladder record retained). Local commit cleared.

## Run record

- Packet: P-SLDEF-3 ISSUED → EXECUTED (E27 coverage, E28 slot identity,
  E29 flip operands, E30 conventions gate; print-only; MTEXIT stays 4).
- Build: EA `2702B7F2E128E5B9DEC92C00CA5C5E7FF661DA3BAFCEF9F219E09C056C705451`
  (357192 B, 0/0); FlowLogic `3606BFB4…` UNCHANGED (0/0). Gate 1 PASS.
- Window/ini: RECON1_P1.ini unchanged. 563338 ticks / 3168 bars.
- `Test passed in 0:57:54.352`, DONE=PASSED 06:51:02. Wrapper archived
  itself (no split this run): `RECON14-SLDEF3_JOURNAL.log`, 17516 lines,
  LEN 3300754, SHA256 F0D7AC70BFC70BC13A6DF5E8ABFD3129F089270BFF51468E669A85A4550ADDAA,
  boundaries new-log [9705..27220] (PRE=9704). Verified on disk: purity
  triple 1 Test-passed / 4 signals / 481 SLIMB.
- Tabulation: `RECON14-SLDEF3_TABULATION.txt`. Join: `RECON14_GATE3_JOIN.txt`.
- Harness note: the launch call still hung to timeout on the builder side
  even with file redirection (the launch itself is proven reliable — the
  wrapper ran 58 min detached and completed). Mechanism unexplained;
  next launch tries `cmd /c start` before any AGENTS claim. No packet
  impact; recorded here, not yet in §8.

## Gate verdicts

2. Identities verbatim — PASS (CQD 906; WS161 21/205/0; SLMEMO 471/118/
   589; SL_REF 432/39/10; INPLAY 157/46; MTEXIT 4 = 3+1 rows verbatim;
   aborts 18/37/13/11/2/0/12; PROMO 469; CONFIRMPOLL 555; SUPPRESSED 156;
   4 signals verbatim; N1 28/26/0/3 pairing identical; guard 60; 0/0).
3. Inert, sixth build — PASS: 481/481 ×3 + 10/10 vs RECON11b, zero miss.
4. Census — PASS: 11/1/3/0/0, Oct-28 360 quoted, HALT 0.
5. Coverage — HALT (see §halt). Other clauses PASS: rungExt monotone on
   all 10 extended ladders (off-log), distinct barTime on all 324 rungs,
   ladRungs + ladDeepestSlot reported per row (11–52 rungs, slots 63–493).
6. Split — PASS: FRAC_OFF_LADDER = 0 (FINAL fracOff=0). TODAY split
   changed 4/6 → 9/1: REPORTED per packet (single OFF = 9/08 16:40,
   resid -999/no-rung at slot 817 — one of the §halt rows).
7. Slot residuals — PASS: HIST rows=10 pairs=52 zero=52 lo=0 hi=0. Every
   slot-matched pair residual 0. The RECON13 +5s were the frame defect —
   falsified as predicted.
8. Ghost — RETIRED with operands (see §ghost). PASS as re-armed.
9. MATCH — PASS: Sep-7 1.16240 still MATCH (rung 0 slot 1 ext 0 resid 0).
   Sep-4 1.15907 now MATCH on 15:55 (rung 16 slot 407 rungT 9/03 05:55
   resid 0) — the predicted confirmation; other Sep-4 rows NOMATCH with
   slots. Statuses 2/3/5 = 10 rows.
10. MTFLIP — PASS: exactly 1 line (per-evaluation emission; the packet's
    "four expected" is not on disk — 1 measured, reported). Sep-4 quoted:
    openBar=1/16:00, evalBar=1/16:00, biasBefore=2 biasAfter=2,
    flipSourceBar=15:55, barsHeld=0, sameBarFlip=1. The flip PREDATES the
    record: correct answer to an already-flipped bias, with operands.
11. Conventions — PASS: SIGMAP 4/4 with both bar times; FRAME_NOTE carries
    all five conventions (sigmap token, max 248).
12. Width — PASS: 19/19 classes (SLADCORR 353, HIST 73, FINAL, SIGMAP,
    MTFLIP 198), truncated=0, BADFMT=0 on all new classes.
13. Spot — PASS: 157/157/443 identical.
14. Digests above; FlowLogic re-stated unchanged; archive as §record.
    NO COMMIT (gate 5).

## §halt — gate 5, 8/10 cover

- 9/04 15:55 LONG: 33 rungs to slot 493, capHit=1. Coverage target is the
  OB base at slot 524 (baseRefSlot=524) — inside the walk's window
  [408..908] but outside the ladder's entry-anchored [1..501]. today (408),
  nuance (408) and anchor (2) all slot-match at residual 0; fracRefs are
  slotless exhausted echoes (-1, consistent with fracClass
  WALK_EXHAUSTED). fracOffN=0, todayOffN=0.
- 9/08 16:40 SHORT: 52 rungs to slot 351, capHit=1. OB refs (today/base/
  nuance) all sit at slot 817 — 317 slots past the cap. Frac refs (slot 4)
  match at 0; fracOffN=0; todayOffN=1 (the single gate-6 OFF).
- Both genuine (targets verified against SLIMBR/walk rows, not code
  artifacts). Structural note for council: the ladder's entry-anchored
  500-window and the walk's start-anchored 500-window are DIFFERENT
  windows — coverage-by-price from the entry bar cannot always reach a
  walk reference found from a deeper start. Options live with council:
  raise/extend the cap, anchor the ladder window at the walk start, or
  accept uncovered-with-UNTESTED.

## §ghost — 1.16112 is rung 19 (earned finding)

- 16:40 row (ladCovers=1): rung=19 rungSlot=77 rungExt=6 shift=78,
  barTime 2026.09.07 10:10, px=wick=1.16112, body 1.16126, imbCode=1,
  exceedsPrev=B, distPts=-106, rungR=0.36. Bracketed by rung 18
  (1.16141) and rung 20 (1.16102).
- A real fractal swing with imbalance, from the morning session — not a
  ghost. The ghost claim is retired; the conservative R 0.36 stands
  measured against rungR 2.56 at the nuance.

## Debts repaid / standing

- Fractal zero-step falsifier: `count(fracAnchorFlag==1 AND
  fracSteps!=0) = 0` on RECON14 (56 anchor rows) + 0/0/0 off 11b/12c/13.
  `fracAnchorPx` shipped (SLADCORR fracAnchorPx + fracAnchorSlot).
- E29 count corrected (1 vs "four expected", measured above).
- E30.3 collision note: new tokens contain none of `class=` /
  `fracClass=` / `nuanceClass=` as substrings; tabulation patterns stay
  head-anchored (`[SRJ-EA] <CLASS>`) with quoted class values.
- Standing: flats PROVISIONAL (MTFLIP operand: pre-flipped); labels +20 /
  −10 open; N1 wick ruling owed; probes on both news edits; "two-away"
  still not packetized.

## Files

- `06_HANDOFFS/RECON14-SLDEF3_JOURNAL.log` (17516, F0D7AC70…, LEN 3300754)
- `06_HANDOFFS/RECON14-SLDEF3_TABULATION.txt`
- `06_HANDOFFS/RECON14_GATE3_JOIN.txt`
- `00_CURRENT_WORKING/{launch,tabulate,join_14}_sldef314*.ps1`,
  `T162_SLDEF3_{EA,FLOW}COMPILE.log`
- EA 2702B7F2… UNCOMMITTED; FlowLogic 3606BFB4 unchanged.

## Verdict 2026-09-13 — ACCEPTED, committed locally (no push)

- Gate-5 halt = packet over-specification (two windows, one invariant).
  Rescoped: rung-obligated only (walkSteps>0); zero-step OB extremes →
  REF_OB_DEEP. Rung index derived, never key (slot,barTime,px,imbCode).
  Sixth FRAME_NOTE convention (window origin/span per reader).
- Off-log discharge filed (`BUILDER_FINDING_RECON14-OFFLOG.md`): 9/08
  walkSteps=0 → covered, no rerun; 15:55 walkSteps=22 → named 31-slot
  shortfall closed by E31. Shallow rungs 0/1/2 all 10 rows + matched
  R 2.56/2.56. "Two-away" REFUTED on the fractal set (rung 0 vs 16);
  no counting definition before the mark-up. 1.15847 noted open.
- Same-bar race confirmed as entry-side (bias flipped 15:55, gate passed
  15:55, opened 16:00, died same-bar); E33 measures it for exit-side +
  news-guard design. Flats stay provisional.
- Debts discharged: zero-step falsifier CLOSED; E30.3 form standing.
- Launch hang: `cmd /c start` next, no canonical packet on it.
- P-SLDEF-4 ISSUED (E31 rescope+window, E32 decision, E33 order census,
  E34 conventions; print-only; MTEXIT stays 4).
