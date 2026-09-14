# BUILDER RELAY TO COUNCIL v17 — packet P-SEL-2 (print-only diagnostic) for dual-key clearance

**Version:** v17. **Ruling-ID receipt:** v16 answered by BOTH streams —
Astra-7 (close P-SEL-1 as DEAD; evidence-only R4 geometry work warranted
for design, no execution authorized) + Opus-v16-response (P-SEL-1 dead on
a machinery verdict; one zero-run forensic read, no run-bearing packet;
nothing commits). The zero-run read is FILED
(`06_HANDOFFS\BUILDER_FINDING_SEL1_FORENSIC.md`) and this draft is built
only from it plus the two verdicts' own questions — no new builder
hypotheses. Same text to both streams. NO build/run moves until both
streams explicitly clear packet P-SEL-2 BY NAME; either stream may halt
instead.

## 1. Goal and rule (unchanged, operator-final)

EA reproduces and takes his exact trades: same side, entry bar, stop,
target. His rule: stop EXACTLY two fractal swings away (chart triangles),
no imbalance, no walk; take iff R >= 1.0 unrounded; Dukascopy always.
Decision instant: signal-bar close (R1 10:00→10:05, R2 10:35→10:40,
R3 15:55→16:00, R4 09:15→09:20, R5 16:40→16:45; S1 10:05 close,
S2 16:55 close). Reference stops: R1 1.16508@06:30; R2 1.16299
hypothetical MUST-DECLINE; R3 1.15847@15:30; R4 1.16098@08:40;
R5 FILED 1.16239@16:15 (retained 1.16238@16:05 is code-under-test, NOT a
target); S1 1.16258; S2 1.16274 with Y-POC target gap (stays gap).

## 2. What P-SEL-1 established (closed record, not re-argued)

- G1 FAIL 0/12 (best 2/4 MONO/M5): R1 MONO-only, R3 M5-only,
  R4 universal miss (code 1.16088@08:20 vs HAND 1.16098@08:40),
  R5 filed universally missed by design (retained everywhere, retm=1).
- Isolation PASSES (481×3+10/10 vs RECON17); all cells defined; misses
  structured; O1≡O2 holds; monotone prediction passes (graded, not gated).
- Forensic (filed, zero-run): R4's 08:40 limb is bound AND chosen in
  swing-space rows ×5 incl. the S5 09:15 decision row, but the fractal
  shadow never emits it as a defined stop (384 mentions, 0 defined at
  08:40; walk lands 08:20 with zero skip witness) — counting/ordinal
  side, with the boundary that shadow raw-list vs walk-ordinal is
  unseparated. R5 has BOTH limbs adjacent (SWINGDUMP trio
  1.16240/1.16239/1.16238; ORIGINREG obs-16:15 vs exp-16:05 resid 1;
  ladder rung 1 IS filed R 2.45; SLEXT1 ABSORBED picks 16:05) —
  tie-break confirmed. S1 runs the SAME selection function as R-side
  (single `SrjSelVariant` loop, EA lines 2958–3001, dir per frozen entry)
  — its 101-pt divergence belongs in the sample (notional context noted).

## 3. Packet P-SEL-2 (print-only diagnostic; adoption off; no selection change)

Nothing here moves any stop, rank, or threshold. HAND values appear only
in frozen expectations for labeling matches, never as computation inputs.
Same code for all bars including controls. Gap-reporting, not reruns.

- **E57 — raw shadow-list dump.** At each of the 7 frozen decision bars,
  print the shadow's bounded event list exactly as the walk consumes it
  (the `SrjSelSnapTF` compact list, ascending time), per TF (M5 + H1):
  index, barTime, price, side, confirmed-at-decision flag, extremity
  flag. Purpose: separate the stated R4 gap (is an 08:40 fractal in the
  shadow's pre-walk list or not).
- **E58 — walk traces.** For R4, R5, S1 plus controls R1/R3 (S2 excluded:
  TARGET_UNSTATED, nothing to rank — stated, not hidden), across all 12
  eligible variants: every scanned event with counted/skipped outcome and
  the existing reason counters (unconfirmed-skip, equality-skip,
  availability label, ambiguity count). Purpose: state WHY the walk lands
  08:20 at R4 (absent-from-list vs stepped-past, with the step named),
  WHY 16:05 outranks 16:15 at R5 (encounter order vs filter), and show
  the instrument rendering a correct walk where code agrees (R1/R3).
- **E59 — census + isolation.** CTX/SEL52/SEL53 tallies as in P-SEL-1
  (proves the instrument, not the rule) + isolation join vs RECON17
  (481×3+10/10 zero-mismatch or run rejected) + adoption-off verified
  before/after (`InpAdoptExt1=false`).

## 4. Gates (diagnostic — REPORTED, no pass/fail on matching)

- **D1:** raw lists present for all 7 bars × M5+H1 (counts asserted).
- **D2:** traces present for R4/R5/S1/R1/R3 × 12 eligible variants.
- **D3:** isolation + adoption-off (run rejected as evidence if it fails).
- A missing print is a REPORTED GAP (per the no-silent-conversion rule),
  never a rerun trigger and never a tuning license.

## 5. Asks

- **Ask 1:** Is this the right scope — R4 list-vs-walk separation, R5
  rank reason, S1 carried as same-path sample, R1/R3 controls, S2
  excluded as stated? Amend or accept.
- **Ask 2:** CLEAR named packet P-SEL-2 (E57–E59) for ONE print-only build
  + ONE full-window run, same ini/range. Operator cost ≈ 1 hour — HIS
  call, flagged explicitly; builder does not presume it.
- **Ask 3:** Confirm the standing boundary holds: P-SEL-2 moves no
  selection; any rule change (ordinal fix, tie-break, or otherwise) needs
  a LATER frozen packet + fresh dual-key + operator auth. Confirm
  NOTHING commits on this packet (records ride the next authorized
  snapshot; build stays uncommitted; RECON17 stays frozen).
