# BUILDER DECISION MEMO — XOB-VALIDITY: the fix-shape choice (operator-reserved)
Memo: C:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\SRJ_FlowNexus_Local\06_HANDOFFS\BUILDER_DECISION_MEMO_XOB-VALIDITY.md
Date: 2026-09-09 (session opening). ZERO source changes. Decision memo per .clinerules §3
(one memo, all open questions, recommendation attached). Basis: BUILDER_FINDING_MIDLINE-1.md
((a)+(b) ANSWERED), BUILDER_FINDING_ANCHORTIER-1.md, CHARTER.md §9, GOAL_STATEMENT.md.

## 1. YOUR RULE (verbatim, CHARTER §9, 2026-09-09)
"What qualifies an XOB is the invalidation of it. When there is a candle body closure that
closes beyond the XOB midline level." The XOB rolls within the same session.

## 2. WHAT FLOWLOGIC DOES TODAY (measured, Task-160 reference state, untouched)
- Criterion: SRJ_OrderblockMgr.mqh L39 — invLevel = isBull ? MathMin(mid, obOpen) :
  MathMax(mid, obOpen) — DEEPER-OR-EQUAL, not the pure midline (zone edge when the open
  is the extreme). Invalidation = a BODY CLOSE beyond invLevel (replay L123-133, live
  L501-515, with same-bar/creation-bar guards).
- GATE: the invalidation test is ACTIVATION-GATED — live L497-505 runs only inside
  if(ob.isActivated && ob.isValid); the replay path carries the same gate (L119-121).
  Bullish activation requires a bar HIGH above the zone high.
- Net effect: an OB that price never revisits from above NEVER dies. The census-wide
  obInval=INT_MIN + isValid=1 on EVERY promoted XOB is a faithful NA of this lifecycle.

## 3. THE MEASURED INSTANCE (T161L authorized dump; T161L_OHLC_EURUSD_M5_0818.csv)
XOB 2159 — promoted 2026.08.18 05:05, zone 1.15794-1.15813, midline 1.158035:
- ALL 109 bars in [05:05, 14:10) closed BELOW the midline; the FIRST is the promotion bar
  itself (close 1.15777); window max close 1.15801 (05:55); price NEVER closed above.
- Window max HIGH 1.15804 < zone high 1.15813 → the OB was NEVER ACTIVATED → FlowLogic's
  invalidation check never ran → isValid stayed 1 all day.
- UNDER YOUR RULE: XOB 2159 was INVALID FROM ITS FIRST BAR and could never validly back
  the 14:10 setup you rejected (your XOB-suitability standard). FlowLogic's lifecycle
  disagreed with your rule on BOTH the level (deeper-or-equal) and the gate (activation).
- The EA has NO access to invalidationLevel/invalidationBar (MIDLINE-1 (a)); its whole
  XOB view = zone bounds (buffers 22/23), objId (31), promoTime (33), validity flags.

## 4. THE CHOICE — two fix shapes (both canonical edits = packet items)
SHAPE 1 — FLOWLOGIC ADOPTS YOUR RULE (builder recommendation):
  SRJ_OrderblockMgr.mqh only (compiled into SRJ_FlowLogic): invLevel becomes the pure
  midline AND the body-close invalidation test runs ACTIVATION-INDEPENDENT (replay and
  live paths both). The EA IS UNTOUCHED — it keeps consuming the indicator's validity
  flags, now corrected at the source. Consistent with your governing ruling: "The EA
  follows the indicators... the EA consumes, never overrides." No new exports; one file.
  Expected observables (pre-stated for the packet's verification run): XOB-PROMOCENSUS
  promotions 372 unchanged; obInval begins to populate (invalidations now fire);
  validity-driven censuses and signals MAY move — the named check: XOB 2159 must show
  invalid from ~05:05 on 08.18, and the 08.18 14:10 zone landscape changes accordingly.
SHAPE 2 — FLOWLOGIC EXPORTS, THE EA APPLIES YOUR RULE:
  FlowLogic gains new export buffers (activation flag / invalidationLevel /
  invalidationBar) and the EA runs its own midline body-close test on top. TWO canonical
  files change; TWO sources of truth for XOB validity (the indicator's isValid stays
  non-your-rule while the EA corrects over it) — in tension with the EA-follows-indicator
  ruling; more surface for the working-set instrument to guard.

## 5. MECHANICAL SUB-ITEMS THE PACKET FIXES EITHER WAY (declared, nothing invented)
- Replay path gets the same change as the live path.
- Pure midline = (zoneLo+zoneHi)/2 at the OB's promotion-time bounds.
- "Closes beyond" = a body close strictly beyond the level (your word "beyond").
- The same-bar/creation-bar guards and the roll-within-session mechanism stay as-is
  unless you rule otherwise.

## 6. SECONDARY OPEN ITEMS (batched per §3 — answer whenever, none gates item 1)
- EXIT-POCVWAP (a): does the §5 body-close early exit bind to the ENTRY-ANCHOR LINE only
  (general), or specifically to the POC-vs-VWAP pairing?
- EXIT-POCVWAP (b): the SHORT-side mirror (you stated the long side) — confirmed?
- EXIT-POCVWAP (c): TP-vs-exit asymmetry — a line can be the TP target (the family-pair
  sibling admitted at EA L1640) yet never an early-exit trigger — confirm?
- 0814-MISS §6 (narrowed): is the pre-confirmation 2-of-3 adverse-evidence kill your
  GENERAL standard? (Moot for 08.14's classification — the invalid CQD governs there.)
- Standing (no answer needed now): the 08.17 CVD-classification datum (15:25-15:55
  confirmed stream -1/-2/-1 vs your CVD=3 row); the TP-reference layer (your S LQ vs the
  EA's nearest-POI).

## 7. SESSION-OPENING VERIFICATION (this memo's provenance floor)
EA E5B0E2E4830BEFD24F18EC712A7806C17305F8BDDF30EEC8AF291412F5AFEECA (207,854 B, 4,204
CRLFs) = T161K baseline, MATCH; CQD 92F3A62BE11E7343D2E9E05AD5B6FE7FCF565B69737E53A48628
E6990792969F (51,701 B, 1,471 CRLFs) = T161J baseline, MATCH; FlowLogic + fourteen
includes 15/15 MATCH vs BUILDER_RESULT_160-PreL.md STAGE 1 (pre-measures R-234);
git HEAD 9861414, tree clean except untracked T161L4_STATUS.txt (kept artifact).
No canonical file touched this session. NOTHING UNDER 02_TASK_CHECKPOINTS.

## 9. RULINGS RECEIVED 2026-09-09 (in-session) — THE PACKET IS DEFINED
- FIX SHAPE (answering §4): "Shape 1 — FlowLogic adopts the midline body-close rule,
  activation-independent (recommended)".
- DIRECTION (answering §8): "A — Break-direction kill: bearish OB dies on body close BELOW
  the pure midline, bullish ABOVE; same-bar guards relaxed (recommended — fixes XOB 2159
  as measured)".
- Consumer map completed post-ruling (measured verbatim): test sites L125/127 + L503/505;
  seven draw sites consume the stored member (L56, 287, 311, 392, 413, 474, 485 — all move
  to the pure mid via the level edit); the replay pass is called only inside the mgr
  (L268, L373, right after SRJ_createOrderblock L255/L360); the live pass is called once
  (FlowLogic L870); the HTF path keeps its own level (HTFEngine L133/L152) and its own
  same-direction test (L184-185) — OUT OF SCOPE per the ruling; the EA has ZERO lifecycle
  calls (its single pattern hit = its own local field declaration, EA L498 verbatim
  "double     invalidationLevel;" — not a FlowLogic consumer).
- PACKET: SRJ_FlowNexus_Local\01_TASKS\PACKET_P-XOBMID.md — DRAFT, NOT ISSUED.

## 10. ADDENDUM — THE OPERATOR'S DIRECTION CLARIFICATION (2026-09-09, superseding §8/§9's
Direction A): "please clarify your understanding of OB. bullish OB is a bearish closing
candlestick so it dies if body close below the mid level, and vice versa." THEREFORE:
bullish OB (bearish origin candle) dies on a body close BELOW the pure mid; bearish OB
(bullish origin candle) dies on a body close ABOVE the pure mid — THE CODE'S ORIGINAL
DIRECTIONS. Consequences, measured and stated: (1) the Direction-A flip caused the
zero-signal regression ("the zero signal outcome is a major regression" — operator
verbatim); E2/E3/E4/E5 must be REVERTED; E1 (the pure-midline level) STANDS. (2) The
activation gate is structurally REQUIRED under the clarified doctrine — before its
traversal price sits on the origin-candle side of the mid, so an activation-independent
test would kill every OB at creation; Shape-1's "activation-independent" element is
superseded by this clarification. An OB that price never revisits staying valid is
CORRECT behavior. (3) MIDLINE-1 (b)'s conclusion ("XOB 2159 invalid from its first bar")
is VOID — the OHLC measurement stands, the conclusion was the builder's misreading of
"beyond"; XOB 2159's survival through 14:10 was correct, and its old level already
equaled the pure mid so the level fix does not touch it. The "no valid XOB" suitability
question returns to operator-reserved status as a separate standard. (4) "the bias
counter or engine is perfect as currently is" (operator verbatim) — no bias packet; the
shards should settle back once the direction reverts. REVERSION PACKET: AMENDMENT 2 in
PACKET_P-XOBMID.md — DRAFT, AWAITING ISSUANCE.


## 8. ADDENDUM (2026-09-09, post-measurement) — THE DIRECTION QUESTION (escalated per §3)
Measured on the T161K journal (verbatim line in the session record): XOB 2159 is a BEARISH
OB promoted mode=all, ALREADY ACTIVATED 04:55 (obVal=121381, the bearish traversal) and
valid at promotion — so the activation gate was NOT what kept it alive. Its obOpen sits at
the zone low, so the current level MathMax(mid, obOpen) ALREADY EQUALS the pure mid
1.158035: the code's kill test for 2159 was close > 1.158035 (a reclaim), which never
happened. THE LEVEL-ONLY CHANGE IS A NO-OP FOR THE MEASURED INSTANCE. The code's kill
DIRECTIONS (replay L124-127 = live L502-505: bullish close < level; bearish close > level)
are the OPPOSITE of the blessed MIDLINE-1 (b) reading (all closes BELOW mid -> invalid).
THE OPERATOR MUST CHOOSE THE TEST DIRECTION (one question, recommendation attached):
- A (RECOMMENDED) — BREAK-DIRECTION KILL: the body close on the far side of the midline
  from the OB's origin side kills it — bearish OB: body close BELOW the pure midline;
  bullish OB: body close ABOVE it. This is the reading MIDLINE-1 (b) blessed and the same
  universal body-close rule the spec applies to POI lines (§5.1/§5.4). Declared mechanical
  consequences: the same-bar act+inv guards (replay `!didActivate` L121; live
  `wouldBeSameBarValInv` L508/511) MUST be relaxed so the traversal bar's own body close
  counts — under this doctrine the activation bar IS the typical kill bar; the
  creation-bar guard stays (structurally redundant: origin candles close on their own
  side by construction). Scope: the test runs on activated+valid OBs (isValid is born
  false and only activation sets it; unactivated OBs are already ineligible for mode=all
  promotion — the documented nearest-branch dead-promotion case stays as-is, separate).
- B — LEVEL-ONLY: keep the code's directions, set the level := pure midline. XOB 2159
  REMAINS valid through 14:10 — the measured instance would NOT be fixed.
- C — A's direction but KEEP the same-bar guards (the kill starts the bar AFTER the
  activation bar).
Either way: the HTF path (SRJ_HTFEngine.mqh has its own invLvl, L133/L152) stays OUT OF
SCOPE for this packet. Under A/C, promotion counts and every OB-lifecycle census become
DESIGNED OBSERVABLES (mode=all promotion requires isValid at promotion) — the identity
gates for the verification run are redefined in the packet accordingly. RULING PENDING.

