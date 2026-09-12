# BUILDER_RELAY_COUNCIL_FIX-S2POLL.md — operator rulings + defect packet request, 2026-09-11
Purpose: paste whole to Opus 5 after COUNCIL_RESPONSE_BUILD3-STATIC.md.
Source on disk: 06_HANDOFFS\COUNCIL_RESPONSE_BUILD3-STATIC.md (council static review).
No edit by builder until a council packet / operator token. No source change in this relay.

## 1. OPERATOR RULINGS (verbatim 2026-09-11, plain trader language)
Q1 (fix the missing-bracket stop bug even if future counts shift?): "of course i want
it fix. that is a fatal mistake if not properly applied. or the explanation is this EA
is alert phase so it would not fire. but after getting it correct such as now, i want
it be able to take trades."
Q2 (should the stop candle itself count as proof the zone is live?): "i do not know
what count proof that the zone is live. if what you meant is the XOB or LTF
confirmation, then yes. count the SL leg not the latest structure leg."
Q3 (refuse to arm when no stop found?): "YES. SL should be present at all times. it is
simply wether it's one swing away+imbalance or two swings away."
BUILDER READING (correctable, council to confirm in packet): Q2 = the SL-leg walk
(including the stop swing as a valid witness) is the in-play proof, not the latest
structure leg alone. Q3 = fail-closed: no stop reference on the bar = no arming, at
every gate that consumes the stop pair. The imbalance criterion (a swing without an
imbalance behind it cannot be the one-swing stop) is already an operator datum on
record (BUILDER_RESULT_T162-SLREF.md section 5); whether this packet encodes it or a
later packet does is the council's sequencing call.

## 2. DEFECT (council headline, confirmed on disk by builder)
File: Experts\SRJ_FlowNexus_EA.mq5 at 7BB1E9B6 (257968 B). Site: EvaluateClosedBar,
lines 3344-3347:
  double slRef; ENUM_SRJ_SLMODE slMode;
  if(ComputeSlReference(barShift, g_dir, slRef, slMode, "S2POLL"))
     s1_stopRef = slRef; s1_haveStop = true;
    { double slDist = ... (bare scope block, runs unconditionally) }
The if governs one statement; s1_haveStop=true is unconditional; the brace block is
not the if body. slRef is read on the failure path. #property strict does not catch it.
Measured on RECON3-BUILD3 window: SWINGPICK site=S2POLL 468 = SL_REF site=S2POLL 468,
DIFF=0 (probe_councilverify.ps1) - the call never failed in-window, so the defect never
fired there; the 4-signal set is unthreatened historically. The fix changes walk bounds
on the ruled path, so it cannot reproduce RECON3-BUILD3 verbatim - the identity
baseline moves BY OPERATOR RULING Q1 above.

## 3. PACKET ASK (council to issue; builder executes S1-S7 on issuance)
P-FIX-S2POLL, ONE canonical file (the EA):
- E1: brace the S2POLL stop capture so the pair is atomic (both set on success, both
  absent on failure), and on failure path ABORT with a named reason (fail-closed per Q3;
  council names the reason code; TP_RR_FAIL-style naming precedent).
- E2: make the Task-133 committed walk test the stop swing before ending the walk
  (order: test containment, then break - matching ZoneInPlay/ZoneAdoptable/S3 ladder),
  per Q2; add the MathAbs distinctness filter so swings= is comparable.
- E3: close the Task-133 !bounded && !haveStop combination so it fails closed
  (no full-history unbounded walk on the live path).
- E4 (sequencing, council's call): fold in the ranked trims that are now unblocked -
  reuse s1_stopRef/s1_haveStop instead of the duplicate S3ARM ComputeSlReference call;
  drop the two dead ReadFlow calls; hoist Bars(); single-direction FindNearestSwing.
  Anything touching the journal format is declared in the packet (identity set moves).
- Gates: compile 0/0; full-window run (RECON1_P1.ini); WS161 mismatch=0; FlowLogic
  identities verbatim (CQD/OBMGR/FlowLogic untouched); the 4-signal set re-measured
  (moves declared, not hidden); post-run digests byte-identical.
No builder action until the packet is issued. No git move. Nothing under 02_TASK_CHECKPOINTS.
