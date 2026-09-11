# BUILDER_FINDING_SLREF-1.md — Phase 1 of PLAN_SLREF-SIDE: the SL-swing measurement (read-only)
File: c:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\SRJ_FlowNexus_Local\06_HANDOFFS\BUILDER_FINDING_SLREF-1.md
Session 2026-09-11. Zero canonical-file changes; no git token. All figures below are
verbatim tool measurements taken this session (baselines re-hashed byte-exact at open:
EA 2B11CB1295B2905AC3317A483BD6DB7042A81BDA6F68826EC694580E4FB95DC0 / CQD BE6FD84F...
A421F / OrderblockMgr D286621C...20B7B / FlowLogic 1EA7858F...73B08; HEAD 8371669).

## 1. WHAT THE SPEC OF RECORD ALREADY ANSWERS (Part A v4.2 §3.7, L183-214)
- L202: "A swing is the three-candle pattern where the middle candle is the extreme."
  Plus the operator quote: a valid swing pattern NOT tied to an order block, NOT the
  most structurally extreme, still takes the stop.
- L204 (THE SIDE RULE, already in the spec): "The reference must lie on the protective
  side of the entry. An unusable candidate is skipped and the walk continues to the
  next valid swing further back; it never aborts where a valid swing exists."
- L206/L208: no minimum stop distance; the stop may lie inside the entry zone; the
  correct test is the stop's side relative to the entry, never containment.
- L197-201 branch table: one-swing = a valid order block WITH an imbalance -> one
  swing from that OB's swing high/low; two-swing = strong-signal with no imbalance ->
  two swings, plain candle swings, no order block required.
- L210: "Branch selection is the two-OB state plus imbalance presence — not the
  order-block validity flag." THE EA SELECTS THE BRANCH ON obValid ALONE (below) — a
  known standing deviation, with the named 1.15835 defect at L212.

## 2. THE CURRENT EA MACHINERY (measured line numbers in the live source, 4,939 lines)
- FindNearestSwing EA L2014-2028: walks ONE buffer from the evaluation bar back,
  500-slot bound, returns the FIRST swing found (nearest by shift). NO side test.
- ComputeSlReference EA L2031-2247. Branch selection: obValid (FL_BUF_LTF_OB_VALID,
  buffer 3) read at the bar (L2059-2060); obValid==1 -> 1-swing branch, else 2-swing.
- 1-swing branch L2109-2218: primary = buffer 27 (FL_BUF_OB_SWING_EXTREME) with the
  obSwingSideOk side guard vs iClose(barShift) (L2106-2108); fallback = the NEAREST
  swing (FindNearestSwing, no side test), then the Task-75 rescue walk L2144-2186
  (from the fallback's shift, walk further back to a protective-side swing; abort only
  on exhaustion). SLSRC/SWINGPICK/SWINGDUMP prints.
- 2-swing branch L2219-2246: walks the PROTECTIVE-SIDE buffer (SWING_HIGH for SHORT,
  SWING_LOW for LONG) from the bar; firstVal = the first swing; takes the NEXT DISTINCT
  swing (|v - firstVal| > 1 point) as the stop. NO side test vs the entry AT ALL — the
  buffer choice is directional, but recency decides, and consecutive micro swings all
  sit near each other. THIS IS THE 8/28 DEFECT SITE.
- Call sites (all three consume the SAME function — no separate logic):
  S2POLL advisory EA L3214; S3ARM arming gate EA L3991; S5 latch EA L4322.

## 3. THE 8/28 EVIDENCE (RECON2-ANYSTATE_JOURNAL.log, verbatim)
- SWINGDUMP #22 (bar=2026.08.28 10:00, evaluation 10:05, S5, SHORT):
  SH[1..10]= - 1.16491 - 1.16481 - 1.16482 - 1.16479 - - ;
  SL[1..10]= 1.16462 - - - 1.16443 - - - - -
  (shifts are the raw ReadBuf1 frame; ReadFlow adds the settled-slot +1.)
- SL_REF branch=2-swing obValid=0 slRef=1.16481 distPts=14 firstSwing=1.16491
  foundAtShift=3 site=S5. TP_ELECT entry=1.16466 sl=1.16481 tp=1.16364 R=6.80.
- The operator's stop was the "6:30 high" (journal field "1.65068 6:30 high", an
  apparent typo), an OLDER-STRUCTURE swing the recency walk never reached.

## 4. THE TRUE 6:30 HIGH — MEASURED FROM THE OHLC DUMP (T162DUMP_JOURNAL.log)
2026.08.28 06:30 O=1.16506 H=1.16508 L=1.16491 C=1.16494. THE TRUE 6:30 HIGH =
1.16508 — NOT the ~1.16568 assumed in the earlier records (that figure was never
measured; the journal typo "1.65068" sits between the 06:30 open 1.16506 and high
1.16508, effectively the same level).
KEY JUDGMENT ITEM RESOLVED FAVORABLY: with entry 1.16466 and the ruled TP (the
Daily-VWAP line 1.16364): slDist = 42 pts, tpDist = 102 pts -> R = 2.43 — ABOVE the
1R gate. The earlier "R = 1.00 exactly" arithmetic (based on 1.16568) is VOID. Under
the ruled stop the 8/28 trade SURVIVES the gate.

## 5. THE 8/28 MORNING SWING STRUCTURE (hand-derived from the dump; strict 3-candle
fractal = FlowLogic buffers 6/7, verified: SRJ_FlowLogic.mq5 L968-976 assigns
SRJ_isStrictFractalHigh/Low(high/low, i, 1); the buffer values in SWINGDUMP #22 match
these hand fractals exactly)
Strict swing highs before the 10:00 entry bar: 09:55 (1.16491), 09:45 (1.16481),
09:35 (1.16482), 09:25 (1.16479), 08:30 (1.16446), 08:15 (1.16447), 07:15 (1.16463),
06:30 (1.16508), 06:15 (1.16507), 06:00 (1.16513).
- THE 6:30 HIGH 1.16508 IS A STRICT FRACTAL -> it IS in the FlowLogic export
  (FL_BUF_SWING_HIGH), roughly 42 bars back from the entry — inside the 500-slot
  bound. NO FlowLogic change is needed for data availability.
- THE AMBIGUITY (only the operator can define): NO counting rule over this series,
  walking left from the entry bar, lands on 1.16508 as the second swing:
  (a) literal two 3-candle swings back = 09:45 = 1.16481 — the EA's AS-BUILT pick,
      which the operator REJECTS;
  (b) an alternating zigzag on the strict fractals = 09:55 (1.16491) then 08:15
      (1.16447) — not the pick either;
  (c) MT5's 5-bar Bill Williams fractal = 09:55 (1.16491) then 08:30 (1.16446) — no.
  For 6:30 to be "two swings away", the WHOLE 09:25-09:55 cluster (1.16479-1.16491,
  all marginally above the entry) must count as ONE swing (the current up-leg's top),
  and 6:30 as the PREVIOUS swing. I.e. the operator's "swing" for the SL walk is a
  STRUCTURAL (leg-level) turn, coarser than the 3-candle pattern the spec's L202
  defines and coarser than any fixed-window fractal.
- CORROBORATING DATUM (measured, same journal): the setup's own order block —
  ZONEID bar=2026.08.28 09:55 xobId=2149; XOBINPLAY zoneLo=1.16492 zoneHi=1.16507
  promoT=2026.08.28 06:40 — the XOB zone TOP is 1.16507, i.e. the 6:30 high region.
  A structure-based rule ("the stop = the protective-side swing of the structure that
  marks the setup") lands on the same number. NOTE: the spec's two-swing branch says
  "no order block required", and spec L210 says branch selection = two-OB state +
  imbalance presence, NOT the obValid flag the EA uses — so which branch the 8/28
  setup "really" belongs to is itself open under the spec's own definition.

## 6. THE PROTECTED IDENTITIES AND THE KILLS (current behavior, verbatim)
- 9/7 09:20:00 LONG Weekly-POC LONDON R=1.76 SL 1.16098 = 1-swing branch, buffer 27,
  side-correct (obSwingRef). 9/7 16:45:00 LONG Weekly-POC NYAM R=1.25 SL 1.16218 =
  same. Both survive any change confined to the 2-swing walk (their branch and the
  OB-buffer path are untouched).
- The five TP_RR_FAIL kills ("not worth 1R" at the single-shot latch):
  8/26 14:40 LONG R=0.41 (sl 1.16580); 8/28 16:20 SHORT R=0.85 (sl 1.16508 — note:
  the 2-swing walk DID reach 1.16508 here); 9/4 09:25 LONG R=0.63; 9/4 10:35 SHORT
  R=0.36; 9/8 16:40 SHORT R=0.60. Under the ruled rule these latch inputs move —
  the a-priori predictions for the verification run will be derived per candidate
  rule AFTER the operator defines the swing notion.

## 7. WHAT GOES TO THE OPERATOR (batched, plain language — see the chat question)
1. What makes the small 09:25-09:55 highs not count as swings (why the walk skips to
   6:30) — confirm the "one swing per structural turn" notion and pick its mechanical
   definition (leg-level turns vs a minimum-swing filter vs the structure's own
   protective swing).
2. Confirm the 8/28 SL level: measured 6:30 high = 1.16508 (their journal digits
   1.65068 ≈ 1.16507-1.16508).
3. Informational: with that stop, the 8/28 R = 2.43 — the trade survives the 1R gate.

## 8. STATUS
No canonical file touched; nothing under 02_TASK_CHECKPOINTS; no git token. Phase 2
(the packet) waits on the operator's swing-definition ruling.


## 9. THE OPERATOR'S SWING-DEFINITION RULING (this session, verbatim from the
ask_question result): "A — one swing = one turn of the bigger move (recommended:
it reproduces your 6:30 stop exactly)". THE MECHANICAL RULE derived from it (stated
in PACKET_P-SLREFSIDE.md section 3): walking the protective-side swing buffer from
the entry bar, a swing counts as a NEW swing only when it EXCEEDS every more-recent
protective-side swing (beyond the codebase's existing 1-point separation idiom);
the first such swing is the PREVIOUS structure top and becomes the stop; on
exhaustion the current structure extreme is the stop (never abort while a valid
swing exists); wrong-side candidates are skipped, never aborting the walk.
REPRODUCES the 8/28 pick exactly: cluster max 1.16491 (09:55), first exceeding
swing = 06:30 = 1.16508.

