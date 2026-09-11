# BUILDER_FINDING_0828-SLREF.md — the operator's SL-swing ruling (the side rule, not recency)
File: c:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\SRJ_FlowNexus_Local\06_HANDOFFS\BUILDER_FINDING_0828-SLREF.md
Session 2026-09-11, after BUILDER_RESULT_RECON2-ANYSTATE.md. Read-only + records only;
no canonical file touched; no git token.

## 1. THE OPERATOR'S RULING (verbatim, 2026-09-11)
"I see that price level as the nearest swing high to the left. what i define as one
swing or two swings away for the SL is higher or lower from the entry price, not the
most recent swing high or low. it might be from an older structure such as for this
example. i want this to be drafted as the next task and make the new session prompt
because i want to continue with a new session"
READING: the operator's SL-swing definition selects the swing by the PROTECTIVE SIDE
(a SHORT's stop swing is HIGHER than the entry; a LONG's is LOWER) and by the swing
structure — NOT by recency (the most recent swing high/low). The chosen swing may come
from an OLDER structure (the 8/28 "6:30 high" ~1.16568 vs the EA's nearest-shift pick
1.16481). The builder's question (result section 4) is thus ANSWERED: the operator DOES
want their discretionary stop reference encoded -> the SL-REF selection becomes the
next task.

## 2. THE MEASURED CURRENT BEHAVIOR (RECON2-ANYSTATE_JOURNAL.log, verbatim)
At the 8/28 10:05 latch (entry 1.16466 SHORT Daily-VWAP):
  SWINGPICK site=S5 dir=SHORT close=1.16467 SH=1.16491 atShift=1 SL=1.16443 atShift=4
  SL_REF branch=2-swing obValid=0 slRef=1.16481 distPts=14 firstSwing=1.16491
  foundAtShift=3 site=S5
  TP_ELECT entry=1.16466 sl=1.16481 tp=1.16364 R=6.80
  SIGNAL ... sl_ref=1.16481 sl_mode=2-swing
The 2-swing branch walked the swing series by SHIFT RECENCY (first swing at shift 3)
and landed on 1.16481 — a 15-pt stop. The operator's stop was ~1.16568 (the 6:30
high, an OLDER structure swing ~102 pts above the entry): with the ruled TP (the
Daily-VWAP line 1.16364, the EA's own closest-line pick) their stop gives
slDist = 102 pts = tpDist = 102 pts -> R = 1.00 EXACTLY (the gate passes); by the
EA's pick, 6.80R. NOTE: the operator's journal SL field read "1.65068 6:30 high"
(an apparent typo); Phase 1 derives the true level from the 6:30 candle's high on
the OHLC dump before any a-priori expectation is stated.

## 3. THE TASK SHAPE (drafted as PLAN_SLREF-SIDE.md; next session's first work item)
- Phase 1 (read-only measurement): how ComputeSlReference's two branches select today
  (the OB-swing buffer path and the FindNearestSwing fallback; the side guard); what
  swing series the FlowLogic buffers carry at the 8/28 bars (where the 6:30 high sits
  in them); what the spec of record (Part A v4.2, the SL section) already answers —
  the builder reads the spec FIRST (the XOBSUIT-1 discipline).
- Phase 2: the packet draft implementing the side rule (the stop swing is chosen as
  the swing structure's protective extreme HIGHER/lower than the entry, possibly from
  an older structure), with the 1R gate consuming the SAME latched reference; the
  9/7 pair and the 8/28 entry are the protected identities (entry timing MUST NOT
  move — only the SL/TP/R latch values change... note: R changes too, so TP_RR_FAIL
  kills can change; declared).
- NOT YET a packet: the design needs Phase 1's measurement + possibly one operator
  question (e.g., whether "one swing away" counts swings from the OB/structure or
  from the entry bar, if the spec does not answer it).
## 4. STATUS
No canonical file touched this session for this item; no git token; nothing under
02_TASK_CHECKPOINTS. The ruling is recorded verbatim above.
