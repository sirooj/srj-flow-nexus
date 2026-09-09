# BUILDER FINDING — MIDLINE-1: mechanical step (a) ANSWERED, step (b) BLOCKED ON DATA
Report: C:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\SRJ_FlowNexus_Local\06_HANDOFFS\BUILDER_FINDING_MIDLINE-1.md
Date: 2026-09-09. ZERO source changes. Include line numbers on the Task-160 reference
states (untouched this session; EA/CQD digests verified at session start).

## (a) WHICH EXPORT BUFFER CARRIES THE XOB invalidationLevel? — NONE.
Measured from source:
- The FlowLogic export set (SRJ_FlowLogic.mq5 L30-120, buffers 0-36) carries: bias,
  OB/FVG validity flags, swings, ten session/PD levels, sweep tag, HTF votes, the XOB
  zone bounds (22/23), FVG leg zone (24/25), OB struct/swing extremes (26/27), the
  renewal boundary time (28), the swept+live mask (29), struct-leg boundary (30),
  XOB/FVG objIds (31/32), XOB promo time (33), and provenance buffers 34/35/36
  (34 populated, 35/36 deferred). NO buffer carries invalidationLevel and NO buffer
  carries the invalidation bar.
- The "obInval=" figure in the journal's XOB-PROMOCENSUS lines is NOT an export read:
  it is printed INSIDE the include compiled into FlowLogic — SRJ_OrderblockMgr.mqh
  L909-917 and L955-963 print COrderblock.invalidationBar directly.
- COrderblock.invalidationBar (SRJ_Types.mqh L47 struct; default SRJ_NA_DBL/-NA_INT)
  is assigned ONLY when invalidation fires: the replay path L131-132
  (ob.isValid=false; ob.invalidationBar=replayBar) and the live path L513-514
  (ob.invalidationBar=i).
- The criterion those paths test: invLevel = isBull ? MathMin(mid, obOpen) :
  MathMax(mid, obOpen) (SRJ_OrderblockMgr.mqh L39) — the charter §9 recorded divergence
  from the operator's pure-midline rule (deeper-or-equal; the zone edge when the open
  is the extreme). Invalidation = a BODY CLOSE beyond invLevel
  (L123-133 replay; L501-515 live, with the same-bar and creation-bar guards).
- THEREFORE: "obInval=-2147483648 (INT_MIN) with isValid=1 on EVERY promoted XOB"
  means precisely — no promoted XOB in the whole 9-day window ever met FlowLogic's
  body-close-beyond-invLevel criterion. It is a faithful NA, not a plumbing defect.
- EA-SIDE CONSEQUENCE (measured): the EA has NO access to the invalidation level or
  the invalidation bar. Its entire XOB lifecycle view = the zone bounds (22/23),
  objId (31), promoTime (33), and the validity/freshness flags. Any operator rule
  keyed to the midline or the invalidation event needs a NEW export (packet item)
  before the EA can consume it.

## (b) DID A BODY CLOSE CROSS XOB 2159's MIDLINE (1.158035) 05:05 -> 14:10 ON 08.18?
BLOCKED ON DATA — no M5 OHLC for 2026.08.18 exists on disk. Measured: the repo's only
price CSVs are Files\SRJ_TickAudit_20260803/0804/0907_*.csv and the POI retest logs
(git ls-files, this session); none covers 08.18.
WHAT THE ANSWER WILL DECIDE:
- If a body closed below 1.158035 in the window: the operator's pure-midline rule
  invalidates XOB 2159 before the 14:10 setup, FlowLogic's criterion (deeper invLevel)
  did not — the criterion divergence has teeth and the fix is a packet item (either
  FlowLogic's invLevel -> pure midline, or a new export + EA-side rule; operator's call).
- If NONE did: both criteria agree XOB 2159 stays valid, and the 14:10 XOB-suitability
  disagreement moves to the 05:05 promotion-validity question instead.
NOTE: if XOB 2159's obOpen sits at the zone high (1.15813), invLevel = mid = 1.158035
and the two criteria COINCIDE — the OHLC test then answers for both at once. obOpen is
not exported, so the OHLC test is run against the operator's pure midline regardless.
AUTHORIZATION NEEDED (operator, batched in BUILDER_FINDING_ANCHORTIER-1.md §9 Q4):
one headless tester run of a THROWAWAY dump EA (new temp file, e.g.
Experts\SRJ_Temp_OhlcDump.mq5, deleted with its .ex5 after the run; run_tester.ps1
harness, no canonical file touched) to write the 08.18 M5 OHLC to a CSV — OR the
operator supplies/exports the OHLC themselves. No terminal will be closed without
their explicit authorization per the harness protocol.

## (b) ANSWERED (2026-09-09 — the T161L throwaway dump run, operator-authorized)
DATA: T161L_OHLC_EURUSD_M5_0818.csv (06_HANDOFFS; 288 M5 rows for 2026.08.18, dumped by
the throwaway EA from the tester's own generated series; run T161L "Test passed",
321,404 ticks, 1,728 bars — the same tick/bar counts as the identity runs).
MEASUREMENT (window [05:05, 14:10) on 2026.08.18; XOB 2159 midline 1.158035):
- ALL 109 bars in the window closed BELOW the midline (109 of 109).
- The FIRST bar of the window — the 05:05 promotion bar itself — already closed below:
  close 1.15777 (2.6 points below the line; its high 1.15794 only touched the zone low).
- Window minimum close 1.15682 (09:00); window maximum close 1.15801 (05:55) — still
  below the line. Price NEVER closed above the midline anywhere in the window.
ANSWER: YES. Body closes crossed XOB 2159's midline immediately and continuously. Under
the operator's rule, XOB 2159 was INVALID FROM ITS FIRST BAR and could never be the
valid zone for the 14:10 setup.
WHY FLOWLOGIC NEVER INVALIDATED IT (measured from source): the manager's invalidation
test is ACTIVATION-GATED — SRJ_OrderblockMgr.mqh L497-505 runs only inside
if(ob.isActivated && ob.isValid), and bullish activation requires a bar HIGH above the
zone high (1.15813). The window's maximum high is 1.15804 (05:55): the OB was NEVER
activated, so the invalidation check never ran; obInval stayed INT_MIN, isValid stayed
1. (The replay path carries the same gate, L119-121.) This also explains the
census-wide obInval=INT_MIN + isValid=1 pattern: an OB that price never revisits from
above NEVER dies under FlowLogic's lifecycle.
CONSEQUENCE (operator/packet item — NO source change made): the operator's XOB-validity
standard (pure midline, activation-independent) and FlowLogic's lifecycle (deeper-or-
equal level AND activation-gated) are now FULLY measured. Fix shapes for the operator
to choose: (1) FlowLogic adopts the midline body-close invalidation
(activation-independent); or (2) FlowLogic exports the missing state (activation flag /
invalidationLevel / invalidationBar) and the EA applies the operator's rule. Both are
canonical edits = packet items.
