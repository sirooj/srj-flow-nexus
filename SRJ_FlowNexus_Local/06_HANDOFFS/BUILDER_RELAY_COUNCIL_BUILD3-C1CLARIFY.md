# BUILDER_RELAY_COUNCIL_BUILD3-C1CLARIFY.md - operator clarification on C1, 2026-09-11
Purpose: paste whole to Opus 5 as follow-up to BUILDER_RELAY_COUNCIL_BUILD3-HANDOVER.md
+ COUNCIL_RESPONSE_BUILD3.md. No edit packet issued. No source change.

## OPERATOR RULING (verbatim 2026-09-11)
"the original backtest speed was 33 mins and although it heavily incorrect spec wise, now it runs for 1 hour."
"i do not want another run, i want the council to review the overall code to make it better, logic wise. not pure speed"

## WHAT THIS CHANGES ABOUT C1
- The "original" endpoint is now PINNED by wall-time, not by digest: 33 min, on a build
  the operator describes as heavily incorrect spec-wise. No digest for that build is on
  record. The builder does NOT invent one. If the council needs the exact old source,
  name which tag/digest you mean and the builder will locate it in git history.
- The measured T162 series on the same window (8/26->9/10, 563338 ticks, 3168 bars):
  SHADOW 0:58:22 | GATE 0:57:33 | ANYSTATE 0:47:12 | SLREF 0:51:07 | SLREF2 0:59:54 |
  BUILD3 1:03:47. So the felt delta is ~33 min -> ~60+ min, roughly 2x, not the 9%
  spread inside the T162 table. The council's variance critique of the T162 table stands
  but is no longer the main question.
- The operator DECLINES the log on/off run pair. No new runs for C1. Do NOT ask for
  repeat runs, three-run statistics, or timing comparisons. The review is STATIC.

## THE REVISED ASK (logic-wise, not pure speed)
Review Experts\SRJ_FlowNexus_EA.mq5 at 7BB1E9B6 (257968 B, run-verified) for:
1. Redundant re-evaluation: per-tick work that should be per-bar (council's own
   suspect #2); repeated buffer reads / CopyBuffer inside loops; repeated accessor
   calls (iTime/iClose/SymbolInfo) inside per-bar loops; ArrayResize growth in loops.
2. Gating-site waste (suspect #1): StringFormat/argument evaluation before the
   InpDebugLog gate, vs call-site if(InpDebugLog) around whole construction.
3. Logic clarity / dead paths: anything added across T162 (RetestBook poll,
   CONFIRMPOLL/TP_ELECT shadow, EXITVERDICT/EXITCENSUS 12-line, ANCHOR prints,
   SL_STRUCT, managed-trade evaluator) that can be simplified, hoisted, cached,
   or removed WITHOUT changing the ruled behaviour.
Constraint (unchanged): the section-3 signal/exit set + G5 censuses must reproduce
RECON3-BUILD3 verbatim (WS161 21/3168/3168/208 mismatch=0; BIASCENSUS 1554/1614 x2;
ZONECENSUS 3168/1056; XOB-PROMO 469; CQD 906 = 170/308/263/165; 4 signals + 4 exits).
Report findings with line numbers + measured effect (static counts: call sites,
loop bounds, buffer windows). No edit packet in the response - shape only.
The operator issues packets.

## SOURCES (same as handover section 7; operator attaches the EA file itself)
- Experts\SRJ_FlowNexus_EA.mq5 (7BB1E9B6...C3CB3C, 257968 B) - attached by operator.
- Context: CQD BE6FD84F / OBMGR D286621C / FlowLogic 1EA7858F (unchanged).
- Behaviour to preserve: BUILDER_RESULT_RECON3-BUILD3.md + RECON3-BUILD3_TABULATION.txt.
