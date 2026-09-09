# PACKET P-SCOPE34 — §3.4 pre-confirmation-only scoping (the 2-of-3 kill window)
Packet: C:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\SRJ_FlowNexus_Local\01_TASKS\PACKET_P-SCOPE34.md
STATUS: DRAFT — NOT ISSUED — NOT EXECUTED. Ruled by the operator's Q4 answer of
2026-09-09 (verbatim in BUILDER_FINDING_EXITMODEL-1.md §6): "yes, that is only pre
confirmation entry. even if after entry, the structure flip then i still hold the
trade" — which ratifies spec §3.4's verbatim: "This criteria is before the trade
confirmed, if later the structure is flipped after the confirmation entry, i still
hold the trade." Canonical file: EXACTLY ONE — Experts\SRJ_FlowNexus_EA.mq5 (the
post-P-EXITMODEL baseline, hashed at this packet's own Stage 1). KEPT SEPARATE from
P-EXITMODEL: it touches the ENTRY pipeline (spec §7's separation), and bundling it
would break P-EXITMODEL's entry-side identity gates.

## THE DEFECT (measured, spec §8)
- Spec §8 row: "§3.4 pre-confirmation-only scoping | **not built** — runs through
  gate-check | no". The 2-of-3 adverse-evidence poll (FRESHCOUNT: obDead / fvgDead /
  oppFvg; two or more adverse invalidate) currently runs in states S2 through S5 —
  i.e., ALSO after the confirming candle has closed (S4->S5 is the confirming-close
  transition) and while the setup sits at the gate-check. Under the ruled rule, a
  2-of-3 kill AFTER the confirming close is ILLEGAL: post-confirmation the trade is
  held through structure flips.

## THE RULED SHAPE
- Pre-confirmation (S2..S4, before the confirming close): 2-of-3 adverse kills the
  candidate (exactly as built).
- At/after the confirming close (S5_GATE_CHECK, pre-signal; and the pending-entry
  phase of §5.5): the kill condition collapses to the THREE-FLAG CONJUNCTION — which
  is the same event as the bias flip (spec §3.4: "the post-confirmation cancellation
  condition collapses to 'the bias flipped'"; §5.5: "it cancels on a bias flip, or on
  the three-flag conjunction — which is the same event"). The 2-of-3 test must NOT
  kill there.
- Post-signal (the managed trade, P-EXITMODEL): structure flips never kill; the exits
  are §5's rules only.

## EDIT SET (draft)
E1  In the S5 gate-check's adverse-evidence evaluation: the 2-of-3 kill is removed;
    the three-flag conjunction (= the live bias flip test already present) remains as
    the only cancellation there. The FRESHCOUNT census line KEEPS ITS SHAPE but gains
    a scope tag (pre/post) so the tabulation can separate the populations.
E2  The S2/S3/S4 poll sites unchanged (the 2-of-3 remains legal there).
E3  Comment truthing at the touched sites.

## STAGES (on issuance)
S1 pre-hash gate (the then-current EA baseline) -> S2 apply E1-E3 -> S3 post-hash ->
S4 compile (expect 0/0; T161P) -> S5 headless run T161P (the T161N shape) ->
S6 gates: entry-side identity gates = the P-EXITMODEL post-state (NOT T161N — this
packet runs AFTER P-EXITMODEL and inherits its baseline); the FRESHCOUNT pre/post
split tabulated; SIGNALS MUST BE UNCHANGED unless a candidate that the illegal
post-confirmation 2-of-3 killed would now survive to S5 — any such delta is a
DESIGNED OBSERVABLE, enumerated bar-by-bar in the result; S7 BUILDER_RESULT_161-P.md.

## ORDERING
AFTER P-EXITMODEL's execution (it inherits the exit-phase baseline). If the operator
prefers it FIRST, the gate table re-bases to T161N — builder's note, one line to
confirm at issuance.
