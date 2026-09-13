# BUILDER_RELAY_COUNCIL_RECON15b-SLDEF4 (P-SLDEF-4, E31–E34)

Packet P-SLDEF-4 EXECUTED (print-only, MTEXIT 4). Two builds, two runs;
all 15 gates gradeable, 15/15 PASS on the second run. Verdict owed: ACCEPT
(+ baseline advance) or BLOCK with reasons. No commit until verdict;
RECON14 baseline (EA 2702B7F2, 357192 B) stays frozen.

## What was built (EA 1EE6FC62…, 383844 B, 0/0; FlowLogic 3606BFB4… unchanged)

- E31: `refIsRung` (swing-buffer occupancy per reference slot) + `refWalkSteps`
  (new OB/frac step shadows stamped in SlimbWalkEmit) beside it; obligated =
  slot≥0 + occupied + steps>0. `ladCovers` over obligated only. Derived window
  (origin entry bar, span deepest-obligated+50, floor 500, abs cap 4000) with
  `ladWindowStart/Span`, `ladReadLimit`, `ladLimitHit`; zero-step OB extremes
  → `REF_OB_DEEP` (slot+distances); E31.1/E31.5 print-only row refusal with
  operands (never fired). New audited class `SLADWIN` (fields=27, one line
  per S5 row, guaranteed even on halted rows).
- E32: `SLADDER_DECISION` (rows=10 fired=4 threshold=1.00 compiled_default
  orderFlipPass=0) + ROW (fields=14, all 10 rows) + RUNG companions
  (fields=13, 24 = SLOT 12 + EXT 12, firing rows only), keyed
  bar|site|rung-kind with slot+barTime+px on every line. Excluded from
  LwAudit by the DECISION design (lines individually short).
- E33: `ORDER` (fields=7, audited): monotonic counter stamped at the live
  LTF-align invariant (the pipeline's only per-bar bias site; value never
  latched) and at each of the 5 S5 outcomes (DIV_WAIT/NO_TP/NO_SL/RR_FAIL/
  PASS), one line per bar enforced by a last-bar guard.
- E34: FRAME_NOTE sixth convention (readwin per reader, max 320); LwAudit
  extended to SLADWIN/ORDER/REF_OB_DEEP (22 classes, truncated=0);
  collision audit re-run (no `class=/fracClass=/nuanceClass=` substrings in
  new tokens); rung companions keyed bar|site|rung-kind, all lines <420.

## Runs

- RECON15 (build 1 EE8DCC1F): PASSED 0:55:12, archive 17548 lines
  SHA 9A9AE93B… bounds [27221..44768], purity 1/4/481 — SUPERSEDED, defect
  owned: the beyond-check missed the `wCoverN>0` guard, so 9/08 (the only
  SHORT empty-obligation row) broke after rung 0 on coverT=0.0. Records kept.
- RECON15b (build 2 1EE6FC62, one-line guard): PASSED 0:54:46, archive 17598
  lines SHA 1BB162E5… bounds [44769..62366] (PRE 44768 = RECON15 end, no
  interleave), purity 1/4/481. 3168/563338 both runs, ini unchanged.

## Gate summary (measured on RECON15b)

1. 0/0 both, Flow unchanged. 2. All identities verbatim (CQD 906; WS161
21/205/0; SLMEMO 471/118/589; SL_REF 432/39/10; INPLAY 157/46; MTEXIT 4 =
3+1 rows verbatim; aborts 18/37/13/11/2/0/12; PROMO 469; CONFIRMPOLL 555;
SUPPRESSED 156; N1 28/26/0/3 paired; guard 60; 0/0; 4 signals verbatim).
3. Eighth inert build 481/481×3 + 10/10 zero-miss. 4. Census 11/1/3/0/0,
Oct-28 360, HALT 0. 5. Covers 1=10, limitHit 0=10, OK=10; ext monotone
10/10; distinct barTime 10/10. 15:55 COVERS (window 574, deepest 571, base
524 matched resid 0) — shortfall CLOSED as predicted. 6. FRAC_OFF=0;
TODAY_OFF=2 {10:35 NEW, 9/08 carried}; REF_OB_DEEP ×6 with slots; change
explained (10:35 obligated = frac-only → covers at 29 rungs, never reaches
zero-step OB extreme at 168; pairs 52→50 = −3/+1 arithmetic closed).
7. Residuals 50/50 zero. 8. Ghost rung 19 slot 77 imb 1 px exact, brackets
reported, index unchanged. 9. MATCH as predicted (slots 1/407 resid 0);
1.15847 open. 10. ORDER 16/16 bars, outcomes 6/6/4/0/0, seqBias<seqS5 on all
13 stamped pairs, −1 ×4 (S4→S5 promotion artifact, disclosed), flip&&PASS=0
(code and log agree), 15:55 quoted (279/280/anti-2/PASS). 11. DECISION
10/4/24, threshold quoted. 12. SIGMAP 4/4, six conventions. 13. 22 classes,
truncated 0, BADFMT 0 (WALKF_BADFMT=481 line is a script mislabel, disclosed;
true badfmt 0). 14. 157/157/443. 15. Digests recorded post-write; archives
as above; NO COMMIT.

## Asks

1. ACCEPT + advance frozen baseline to EA 1EE6FC62 (383844 B), or BLOCK.
2. Confirm the 10:35 earlier-break shape is the specified rescope working
   (not a defect): zero-step OB extreme correctly withholds ladder ground.
3. Confirm row-level (not run-stop) HALT mechanism stands for future packets.
4. Next after verdict: HANDOFF BRIEF, then operator mark-up (barTime+price).
