# BUILDER FINDING — DIVCON-1: the EA-side CQD divergence-consumption mechanism map
Report: C:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\SRJ_FlowNexus_Local\06_HANDOFFS\BUILDER_FINDING_DIVCON-1.md
Date: 2026-09-09. Audit only — ZERO source changes (EA, CQD, FlowLogic, includes all untouched).
Source of record: Experts\SRJ_FlowNexus_EA.mq5 SHA256 4CD717289EDD1AB3F49FD16AC1930B60BA131CBB3B04FAA6F06DF19E413B48A1
(4,190 lines, 206,852 bytes — re-verified at session start; the certified T161H baseline).
Trigger: OPERATOR RULING 2026-09-09 (verbatim): "The EA follows the indicators. so i have said the ruling
of a valid CQD divergence which is the latest, hence the EA must follow the same signal from the
indicator. The latest is the latest on the indicator."

## 1. THE MECHANISM (every anchor measured on the current source)
1.1 EVALUATION DRIVER — OnTick EA L4180-4189: new-bar gated (`iTime(...,1)` change), then
    `EvaluateClosedBar(1, currentBarTime)` — the EA always evaluates the JUST-CLOSED bar (shift 1).
    Bar B is therefore evaluated at the open of B+1.
1.2 CQD BINDING — EA L4093-4095: `iCustom(..., InpCqdName, PERIOD_D1, InpCqd_NoReset, true,
    InpCqd_MaxCarryBars, InpCqd_MaxBackfillDays)` — positional, maps to CQD inputs #1-#5
    (InpResetPeriod L73, InpNoReset L74, InpUseZeroTickRule L75, InpMaxCarryBars L76,
    InpMaxBackfillDays L77). CQD InpDebugLog is input #16 (L98): iCustom accepts only a PREFIX of
    inputs, so an EA-side pass-through must supply #6..#15 as well (11 extra literal args) —
    the record's "one-line EA pass-through" is NOT achievable as stated. The true one-liner is the
    CQD DEFAULT FLIP (L98 `InpDebugLog = false` -> `= true`), global to every CQD instance.
    Both shapes remain PACKET items; nothing applied.
1.3 VERDICT SURFACE — CQD buffer 6 (CQD_DivVerdict, SetIndexBuffer L1093, INDICATOR_CALCULATIONS):
    written ONLY in TryDivergence's confirmed-pair branch (L750-755: +1 bull regular, +2 bull hidden,
    -1 bear regular, -2 bear hidden = operator codes 1/3/2/4), at bar x2, LAST-WRITE-WINS across
    qualifying pairs. ScanDivergences cadence L856: `maxX2 = rates_total - 3` — a verdict for bar X
    first becomes writable at the OPEN of X+2 bars (10 minutes on M5). ScanUnconfirmedDivergence
    (L893+, the dotted PREVIEW anchored on the LIVE forming bar, InpShowUnconfirmed L94) NEVER
    writes buffer 6 (L747, L888-891) — the preview exists only as a chart object.
1.4 CENSUS READ — EA L2316-2331: diagnostic-only loop over shifts 1-2 at the top of
    EvaluateClosedBar; prints "[SRJ-EA] ... CQD DIV verdict=%+d shift=%d bar=%s". This print IS the
    journal verdict stream. It assigns nothing.
1.5 THE LATCH — caller EA L2955-2959:
        if(!g_divLatch && g_state >= ST_S1_REGIME && g_dir != DIR_NONE)
          { string kind; g_divLatch = UpdateDivergenceLatch(barShift, g_dir, kind); }
    Walk EA L1945-1969: for s = 1 (barShift) upward while iTime(s) >= g_anchorBarTime; reads buffer 6;
    skips read-fail / EMPTY_VALUE / 0; the FIRST nonzero verdict is "the latest"; matches =
    (LONG: v=1|2) / (SHORT: v=-1|-2); returns the match. A 0-verdict bar does NOT stop the walk
    (only nonzero verdicts do), which is correct — the operator cares about the latest DIVERGENCE.
1.6 STRUCTURAL VISIBILITY (EA-78, re-measured) — buffer 6 at shifts 0 and 1 is ALWAYS EMPTY at
    evaluation time (maxX2 = rates_total-3 makes shift 2 the newest confirmable bar). The walk's
    first effective read is therefore shift 2, and the EA's evaluation instant EXACTLY coincides
    with that verdict's first availability — the EA is never late on a confirmed verdict, and the
    just-closed confirmation candle can never carry a visible verdict at its own evaluation.
1.7 S5 CONSUMPTION — the S5 gate holds while divLatch=0 ("S5 waiting: divLatch=0 tpOk=1",
    T161H_JOURNAL.log L3941/3955/3970) until a matched latest latches or the sequence dies
    (session close / abort). This is the operator's WAITING RULE shape (charter §9).

## 2. THE 08.18 AFTERNOON TIMELINE (T161H_JOURNAL.log, verbatim times; bar times are OPEN times)
  bar 14:20  verdict -2 (bear hidden)  confirmable 14:30:00  EA read 14:30:01  -> seq1 (seeded 14:15,
             Daily-POC) latches, dir=SHORT, state S5_GATE_CHECK
  bar 14:25  no verdict printed; "S5 waiting: divLatch=0 tpOk=1" at 14:25:00
  seq1 ends IDLE by 14:40 (aborted; not by divergence)
  bar 14:30  verdict +1 (bull normal)  confirmable 14:40:00  EA read 14:40:00  -> EA IDLE, no candidate
  bar 14:40  verdict -2                confirmable 14:50:00  EA read 14:50:01  -> seq2 (re-armed by
             14:45, divLatch=0) walks: shift1 bar 14:45 EMPTY, shift2 bar 14:40 = -2 = the latest,
             direction-matched (SHORT) -> LATCH -> SIGNAL 14:50:01 SHORT Daily-POC R=1.06 SL 1.15813
             TP 1.15665 (journal L4037/4038/4040). NOTE: at 14:45:01 the walk's latest was +1@14:30
             (opposing) -> correctly unlatched; the +2 on bar 14:45 was confirmable only at 15:00 —
             it never gated this signal.
  bar 14:50 +2 (read 15:00:00), bar 15:00 -2 (15:10:01), bar 15:20 -1 (15:30:00),
  bar 15:25 +2 (15:35:00), bar 15:30 +2 (15:40:01), bar 15:35 +2 (15:45:00) — EA IDLE throughout;
  the stream alternates rapidly (7 verdicts in ~80 min), but each was the indicator's own latest
  at its own confirmation instant.
CROSS-CHECK (the operator's 18:20 W-POC example): bar 18:00 verdict +1, confirmable 18:10:00,

## 3. THE RULING vs THE MECHANISM — the measured deltas
D1 CONFIRMED-SPACE EQUIVALENCE: at any confirmation instant, the newest CONFIRMED divergence on the
   indicator IS the walk's first find. Under the ruling "the latest is the latest on the indicator",
   the EA's current consumption already conforms in confirmed space, and the 08.18 14:50 signal was
   the indicator's own latest (-2 on bar 14:40, direction-matched). The EA followed the indicator.
D2 THE PREVIEW GAP (the ONE "on the indicator" surface the EA cannot see): the dotted preview
   anchored on the live forming bar (what the operator watches build) never enters buffer 6
   (§1.3). If the operator's "latest" includes previews, consuming them requires a canonical
   CQD edit — an ADDITIVE export buffer (detection untouched, per the correct-by-design ruling).
   PACKET ITEM P-DIVCON-A (drafted, not applied).
D3 THE LATCH-CLEARING DISCREPANCY (code vs record — material): the STEP 2 comment (EA L1947-1954)
   and the standing state say the latch "clears when the latest is opposing, re-arms when a matched
   one appears". MEASURED FALSE: the caller's `!g_divLatch` guard (L2955) PREDATES STEP 2 —
   git diff af5a9bf 7080c06 shows the guard line as unchanged context; STEP 2 changed only (a) the
   walk window (shift 1-2 -> anchor-bounded) and (b) the assignment (`if(walk) true` -> `= walk`).
   With the guard, the walk never runs once latched -> the latch is PERMANENT-ONCE-SEEN (spec 3.8),
   and the operator's charter §9 rule ("an opposing divergence AFTER the matched one, before the
   confirming close, invalidates the divergence requirement at the confirmation candle") is NOT
   implemented. Strict implementation = delete the guard so `g_divLatch = walk` runs every bar.
   PACKET ITEM P-DIVCON-B (drafted, not applied). NOTE: the 08.18 outcome is IDENTICAL under both
   semantics (no opposing verdict was confirmable before 14:50:01); the difference bites when a
   matched divergence latches EARLY and an opposing one becomes the latest LATER in the sequence.
D4 THE CONFIRMATION-CANDLE LAG: a divergence whose right anchor IS the confirmation candle (or
   newer) is not confirmable until 10 minutes later — structurally invisible to the EA at the
   confirmation instant (§1.6). The operator's own 18:20 example operates in confirmed space and is
   reproduced (§2 cross-check); this lag is offered for explicit ratification as part of "latest".

## 4. THE MIDLINE AUDIT (.clinerules 7.1 work item 2) — THE MISSING LINK FOUND
The Types-constructor caller is LOCATED (the prior audit missed it because the calls are multi-line
and the level is a POSITIONAL argument with no matching identifier at the call site):
- SRJ_OrderblockMgr.mqh L33-81 SRJ_createOrderblock: L37 `mid = (obHigh+obLow)/2.0`;
  L39 `invLevel = isBull ? MathMin(mid,obOpen) : MathMax(mid,obOpen)` (comment: "Original design
  intentionally kept"); passed positionally to NewOrderblock at L61-69 (arg 8) ->
  SRJ_Types.mqh L248-276 assigns ob.invalidationLevel.
- The invalidation TEST is a BODY CLOSE beyond that level: SRJ_OrderblockMgr.mqh L121-133 (replay
  pass) and L497-515 (live pass): bullish invalid when barClose < invalidationLevel, bearish when
  barClose > invalidationLevel (same-bar validation and creation-bar guards apply).
- SRJ_HTFEngine.mqh L134/L153 call NewHTFOrderblock(..., invLvl, ...) for the HTF path (not yet read).
COMPARISON vs THE OPERATOR'S RULE (charter §9 XOB VALIDATION RULE: invalid = "a candle body closure
that closes beyond the XOB midline level"): the code's level is min/max(midpoint, open), NOT the
midline. For a bullish OB created from a BULLISH candle, open < mid -> level = open = the zone
BOTTOM (much deeper than the midline); bearish symmetric (open = zone top). The code therefore
invalidates LATER than — or never against — the operator's midline rule. Consistent with the
measured XOB 2159 (promoted 05:05, never invalidated, in-play at 14:10).
OPEN MECHANICAL STEPS (builder-autonomous, next): (a) which export buffer (if any) carries the
XOB's invalidationLevel — the measured obInval=NA-on-every-XOB observation; (b) whether a body
close crossed XOB 2159's midline (1.158035 = (1.15813+1.15794)/2) between 05:05 and 14:10 — needs
M5 OHLC for 08.18 05:05-14:10 (tester instrument run or OHLC export).

## 5. PACKET ITEMS DRAFTED (NONE applied — canonical edits await the operator's packet)
- P-DIVCON-A: CQD additive preview-verdict export (new buffer, written in ScanUnconfirmedDivergence;
  detection untouched) so the EA can consume the preview the operator sees. Needed ONLY if the
  operator rules that "the latest on the indicator" includes previews.
- P-DIVCON-B: EA one-line caller change — remove the `!g_divLatch` guard at L2955 so the walk
  re-evaluates every bar (strict latest-at-confirmation with clearing). Needed ONLY if the operator
  ratifies the strict clearing rule over permanent-once-seen.
- P-CQDDEBUG: the authorized CQD-debug run enablement — the actual one-liner is the CQD InpDebugLog
  default flip (L98); the EA pass-through is 11 extra positional args, not one line (§1.2).

## 6. QUESTIONS FOR THE OPERATOR (batched — the divergence-validity criteria, EA-consumption form)
Q1 THE PREVIEW AXIS: at the confirmation candle's close, does "the latest on the indicator" include
   the DOTTED PREVIEW anchored on the live forming bar (option B — needs P-DIVCON-A), or only
   CONFIRMED divergence lines (option A — the EA already conforms; no edit)?
Q2 THE CLEARING AXIS: strict latest-at-confirmation (an opposing latest CLEARS an earlier matched
   latch — needs P-DIVCON-B, one line), or permanent-once-seen (current behavior — no edit)?
Q3 RATIFY THE LAG: "the latest" = the newest verdict confirmable at the confirmation instant
   (anchor at least 2 bars old — the operator's 18:20 example already works this way)? YES/NO.

## 7. ADDENDUM — OPERATOR RULING 2026-09-09 (in-session, answers to §6)
VERBATIM: "option 1 with the addition of when there is a conflicting CQD divergence being
simultaneously validated, i consider that as an invalid or i wait for a new valid in direction of
the bias to occur."
RESOLVED AXES:
- Q1 = CONFIRMED LINES ONLY. The dotted preview is NOT part of "the latest on the indicator" for
  EA consumption. P-DIVCON-A (the CQD preview export) is NOT needed.
- Q2 = STRICT LATEST-AT-CONFIRMATION. The latch re-evaluates EVERY bar while the candidate is
  alive; an opposing latest CLEARS an earlier matched latch; the setup does not fire and does not
  abort — it KEEPS WAITING (the WAITING RULE) until a NEW direction-matched divergence becomes the
  latest, which re-latches. This is the operator's "conflicting divergence = invalid, or i wait for
  a new valid in direction of the bias" clause: the strict clearing and the re-arm ARE that clause.
- Q3 = RATIFIED by the confirmed-space choice: "the latest" = the newest verdict confirmable at the
  confirmation instant (its anchor at least 2 bars old; the 18:20 example operates exactly so).
IMPLEMENTATION MAPPING (mechanism §1): remove the caller's `!g_divLatch` guard (EA L2955) so
`g_divLatch = UpdateDivergenceLatch(...)` runs every bar in states S1+ with a direction. The walk
then mirrors "the newest CONFIRMED divergence within [anchor..evaluation bar] is direction-matched":
a matched verdict stays the newest (and the latch holds) until a NEWER verdict supersedes it; an
opposing newest clears; a later matched newest re-latches. No other g_divLatch touchpoint changes
(decl 823, ResetSequence 1981, seed 3182, S5 gate read 3869, log/adapter reads only).
INTERPRETATION NOTE (declared, correctable): "in direction of the bias" is implemented as the
candidate's TRADE direction (g_dir) — what the walk already matches (1|2 for LONG, -1|-2 for
SHORT), for trend AND mean-reversion setups alike. If the operator meant the REGIME bias for
mean-reversion setups (which can oppose the trade direction), that is a further semantic
refinement to be ruled separately.
PACKET: P-DIVCON-B drafted at SRJ_FlowNexus_Local\01_TASKS\PACKET_P-DIVCON-B.md —
DRAFT, NOT ISSUED, NOT EXECUTED. Awaiting the operator's explicit issuance; no canonical file touched.

## 8. ADDENDUM 2 — OPERATOR RULING 2026-09-09 (second ruling, same session): THE CQD FLAG-GATE DEFECT
VERBATIM: "I have another rule and this is the fault or defect in the current version of the CQD
indicator. when there is the dottet lines that indicate the potential divergence which is still not
confirmed swing candle wise, there is this defect of when the two swings have present but both on
the left which already satisfied my two out of four requirement. so i want you to change this
behaviour on the indicator."
MEANING: the "CQD is correct by design" ruling is REVOKED for this one behavior — the CQD-DA-1
mechanism (the 2-of-4 gate satisfiable by two flags on ONE anchor, e.g. both on x1, with a
non-swing x2) is now ruled a DEFECT and its change ORDERED. All other CQD-DA findings remain
measurements of deliberate behavior.
MEASURED MECHANISM (both scans share the gate): confirmed scan gate CQD L732-735; preview gate
L984-987. Preview anchor correction to CQD-DA-4: the preview's right anchor is the LAST CLOSED bar
(x2 = rates_total-2, L904); the live forming bar serves only as x2's right-hand swing-test
neighbor (L919-926).
IMPLEMENTATION: at least one swing flag required from EACH anchor (x1 and x2), 2-of-4 total kept —
the operator's manual standard (both anchors real swings) as a gate. BOTH scans patched (the EA
consumes the confirmed stream; a preview-only fix would leave the EA-side defect intact).
PACKET: SRJ_FlowNexus_Local\01_TASKS\PACKET_P-CQD-FLAGGATE.md — DRAFT, NOT ISSUED (the exact edit
text postdates the directive; explicit issuance required). CQD pre-edit digest
4B2D688C6A29B1A8CA0E2F894526A63C82DAACE6846B5A339A473D03140D96C2 (50,557 bytes).


