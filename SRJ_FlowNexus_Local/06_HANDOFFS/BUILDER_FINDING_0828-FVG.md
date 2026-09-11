# BUILDER_FINDING_0828-FVG.md — the 8/28 entry miss: the operator's correction + the FVG ruling
File: c:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\SRJ_FlowNexus_Local\06_HANDOFFS\BUILDER_FINDING_0828-FVG.md
Session 2026-09-11. Context: BUILDER_RESULT_RECON2-GATE.md section 5 Q1 (the 8/28 ~10:05
London SHORT on the Daily-VWAP line did not return under build 2). Read-only session until
the operator's ruling; no canonical file touched.

## 1. THE OPERATOR'S CORRECTION (verbatim, 2026-09-11)
"8/28 was not killed, I took it but early exit due to the D POC gapped and made price
above the D POC level. i have attached the image."
MEANING: the 8/28 London SHORT on the Daily-VWAP line is a VALID TAKEN trade (entry
1.16466 = the next open after the confirmation candle, per the earlier ruling record in
COUNCIL_RESPONSE_POI-R.md; early exit 1.16464 at the 11:35 open) — the early exit was the
ruled EXIT-POCVWAP standard (the Daily-POC line gap-jumped and price body-closed through
it), which lives in the unbuilt STEP-4 exit layer. The EA's obligation is the ENTRY at
~10:05. The builder's phrase "your killed trade" in the Q1 ask was a mischaracterization.
The attached image did not arrive in the builder's text channel (declared).

## 2. THE OPERATOR'S FVG RULING (verbatim, 2026-09-11)
"the bearish bias flip is from 9:35, the LTF POI confirmation was from imbalance from the
older structure from 6:30 to 6:40. the FVG is not new from the latest structure, this is a
rare occasion where although the FVG level is not projected indefinitely, but I think it
kind of is although i still rule out partial fill non body closure invalidation.
the older structure FVG was valid because it is still fresh and has not been filled."
READING: (i) the 8/28 bearish bias flip = 9:35; (ii) the confirming LTF POI = an imbalance
(FVG) created 6:30-6:40 — OLDER-structure, not the latest structure; (iii) it was valid
because still fresh and unfilled; (iv) the operator is inclined to treat such an FVG level
as effectively still projected ("kind of ... indefinitely"), rare occasion; (v) partial
fill WITHOUT body closure does NOT invalidate.

## 3. THE MEASURED EA BEHAVIOR (verbatim code, read 2026-09-11)
- SRJ_ImbalanceMgr.mqh L364-392 (SRJ_FVG_FillDetectionPass): a bullish FVG sets
  isFilled ONLY on `liveClose < fvg.midpoint && liveClose < liveOpen` (L382); a bearish
  FVG ONLY on `liveClose > fvg.midpoint && liveClose > liveOpen` (L384). The criterion
  IS a body-closure-through-midpoint test — a partial fill (wick into the zone, or a
  close that comes back out) does NOT set isFilled. **The EA's fill rule ALREADY matches
  the operator's "rule out partial fill non body closure invalidation" ruling.**
- The AGE/LEG side (the open question): the FVG export that feeds the EA's zone
  selection requires leg membership — FlowLogic L1044-1046: "freshest in-bias, unfilled
  FVG within the current still-open leg (startBar >= obInvalidationBoundary)". The
  operator's 6:30-6:40 FVG predates the 9:35 flip; whether obInvalidationBoundary at the
  8/28 bars reaches back to 6:30 (i.e. whether the leg was still open that far) decides
  whether the EA could even SEE that FVG as a zone on 8/28. NOT YET MEASURED (needs the
  8/28 journal's OBPROV/leg lines or an OHLC-based reconstruction).
- No recency/bar-count limit exists on the fill test itself (an FVG of any age can be
  marked filled the moment the body criterion hits).

## 5. THE FVG-VALIDITY RULE CONFIRMED (2026-09-11, operator's two clarifications)
First message (verbatim): "let me clarify. i rule out partial fill or the level of the
imbalance that has been filled all the way with wicks to be invalid for a new entry POI.
i need a fresh FVG. / partial fill if still have some untested price level or within one
FVG, there is still a price level that has not filled all the way tested all the way with
wicks, i still consider the remaing FVG price level as valid"
Builder's plain-language restatement put to the operator; the operator CONFIRMED WITH ONE
CORRECTION (verbatim): "Close, but a candle BODY closing through the FVG also kills it
(even if not fully wick-tested)".
THE RULED FVG-VALIDITY RULE (for a new-entry POI):
  1. DEAD when price has traded through the FVG's ENTIRE range with wicks (nothing
     untested remains) — even without a body closure.
  2. DEAD when a candle BODY closes through the FVG — even if not fully wick-tested.
  3. Otherwise ALIVE: a partial fill leaves the FVG valid; the REMAINING UNTESTED range
     is the entry POI.
MEASURED DELTA vs the EA today:
  - Condition 2 is essentially the EA's existing fill criterion (ImbalanceMgr L382/384,
    body close through the midpoint with the closing direction).
  - Condition 1 is ABSENT in the EA (no wick-extent tracking; an FVG fully traversed by
    wicks without a qualifying body close stays isFilled=false forever).
  - Condition 3's "remaining range as POI" is ABSENT — the EA's FVG is binary
    (isFilled true/false; zone edges fixed at formation; no partial-fill state).
ENCODING = a packet to Include\SRJ\SRJ_ImbalanceMgr.mqh (the fill pass gains a
wick-extent/remaining-range concept; the exported zone edges and tickFVGIsValid
shift) — NOT identity-safe (BIASCENSUS/ZONECENSUS/in-play all move). QUEUED AFTER
BUILD 3 per the builder's declaration unless the operator reorders.
The spec of record (Part A v4.2 L135) says only "The FVG has not been filled or
invalidated" and does NOT define filled (wick vs body) — this ruling SUPPLEMENTS it.

## 6. STATUS
- Q1 (the 8/28 miss ruling: accept-until-build-3 vs confirm-at-any-ladder-state) REMAINS
  OPEN — the operator's answers supplied the structural context (the FVG rule), not the
  mechanism ruling; re-put in plain language.
- No canonical file touched; no git token; nothing under 02_TASK_CHECKPOINTS.


