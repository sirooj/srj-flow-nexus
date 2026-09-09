# BUILDER FINDING — EXITMODEL-1: the §5 exit phase measured; the STEP-4 design; the batched questions
Report: C:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\SRJ_FlowNexus_Local\06_HANDOFFS\BUILDER_FINDING_EXITMODEL-1.md
Date: 2026-09-09 (session, post-XOBSUIT-1). ZERO source changes. EA line numbers on the
current baseline E5B0E2E4...AFEECA (4,204 CRLFs). Spec = Part A v4.2 (read in full this
session before framing anything). This memo is the work item "THE EXIT MODEL (section 5,
charter STEP 4)" preparation: measurement + design + ONE batched question set (§5).
PACKET DRAFTED, NOT ISSUED: 01_TASKS\PACKET_P-EXITMODEL.md.

## 1. WHAT EXISTS POST-SIGNAL (measured — the gap)
- The signal path (EA L3944-3968): LogSignal -> EmitAlert -> (ALERT-ONLY) MarkSessionUsed
  -> g_state = ST_SIGNAL -> ResetSequence() -> return. THE CANDIDATE LIFECYCLE ENDS AT
  THE SIGNAL. ResetSequence (working-set membership, R-177) wipes g_dir, g_anchorLine,
  g_anchorPrice, g_anchorBarTime, g_sessionAtEntry, g_divLatch, g_zone*, g_touch*,
  g_alerted* — NOTHING about the trade survives the bar it fired on.
- There is NO position record, NO per-bar monitoring, NO exit test anywhere. The SL and
  TP figures on the signal line are caller locals (slRef, tpTarget at L3895-3907) — NOT
  STORED (the R60 handoff's storage table: "NOT STORED ... no — new storage").
- Precedent for a record that outlives the sequence: GoAbort snapshots four working-set
  fields into g_shadowDir/Line/Opened/Sess BEFORE ResetSequence (R-201, EA L1772-1783).
- Spec §8 agrees: rows "§5.1-5.3, §5.5, §5.6 | not built — exit phase" and
  "§5.4 pre-confirmation body-close | not built".
- Pre-confirmation today: the 2-of-3 poll (FRESHCOUNT, obDead/fvgDead/oppFvg) runs
  S2-S5; the S2POLL block is advisory; there is NO POI-side (body-close-vs-anchor)
  test anywhere pre- or post-signal.

## 2. WHAT THE SPEC REQUIRES (verbatim anchors)
- §4: "evaluate at the next candle's open, at three sites — the POI retest that seeds a
  candidate, the confirmation candle, and the exit." The 8/17 exit measured the body
  close against the POI value at the NEXT open. (Sites 1-2 = T161K, built. Site 3 = this
  build.) §4's own mitigation: build the exit reads as DIAGNOSTICS FIRST — log verdicts,
  change no control flow — so the population is known before the rule governs.
- §5.1: POI ahead (above a LONG / below a SHORT) = TP target -> EXIT ON TOUCH. POI
  behind -> supports; EXIT ONLY ON A BODY CLOSE THROUGH IT (wick does nothing). The
  body-close break is an UNCONDITIONAL IMMEDIATE EXIT ("i exit early or right there,
  disregarding if TP or SL").
- §5.2: side is DYNAMIC per bar — a POI's value moves, its side and role move with it
  (8/17: the W POC sat beneath the candle, still supporting, then the body closed below
  it -> exit). Exit tests read the line's CURRENT per-bar buffer value, never a stale
  snapshot.
- §5.3: no favour/adverse asymmetry; no distance/size/width; which-side + body-vs-wick
  only.
- §5.4: PRE-CONFIRMATION — a candidate armed and waiting for its confirming close is
  DEAD if the POI behind it is body-broken before that close. (EA mapping: the S4/S5
  pre-fill phase; the anchor POI is the "POI behind".)
- §5.5: entry is a LIMIT at the confirming candle's close; fills on a wick; while
  pending it cancels on a bias flip (= the three-flag conjunction); staleness/renewal
  do NOT cancel; if the filling candle's own close invalidates, exit immediately.
- §5.6: post-entry LTF ignored; HTF aggregate flip EXITS trend-following setups at the
  flipping HTF candle's confirmation close; toggle; "ruled, not measured".
- §2 row 2 + §1.3: a take-profit POI exits on touch, "identical treatment to session
  liquidity"; targets follow the nearest valid POI AS VALUES MOVE (no gap concept).
- §7: exits must NOT be built inside the entry pipeline (separate phase).

## 3. THE DESIGN SHAPE (mechanical; full detail in the draft packet)
- A POST-SIGNAL RECORD survives ResetSequence (the R-201 pattern): dir, anchorLine,
  anchorPrice (the value at the retest, provenance only — tests use current values per
  §5.2), anchorBarTime, sessionAtEntry, entryPrice (the S5 next-open reference), slRef
  (latched two-branch stop), regimeAtAdmission (drives §5.6 scope), signalBarTime, and
  a state (PENDING_FILL -> MANAGING -> CLOSED).
- A per-bar EXIT evaluation (in OnTick's closed-bar walk, AFTER the entry pipeline,
  separate function — §7's separation): evaluated at the next open,
  (E-a) PENDING_FILL: cancel on bias flip / three-flag conjunction (§5.5); fill on
        the first wick-touch of the entry level; if the filling bar's own close
        invalidates -> immediate exit (§5.5 last sentence).
  (E-b) MANAGING, TP side: the current nearest valid target (the TP candidate set =
        the ten session/PD levels mask-filtered + the 12 POI lines under the existing
        ComputeNearestTpTarget admission, re-run per bar per §1.3) -> EXIT ON TOUCH.
  (E-c) MANAGING, body-close side (RESOLVED per the §6 rulings): the trigger-line set
        = compile-time constant EXIT_SCOPE, DEFAULT family-POC + anchor (the ruled
        hierarchy: AVP-POC over VWAP inside each family — 9.1(1) a VWAP close does
        NOT exit; 9.1(2) the origin/anchor line's own break DOES exit). A line's own
        GAP/MOVE alone NEVER exits (Q3; §1.3); the exit is PRICE's BODY close through
        a behind trigger line (body = open -> NEXT open, the §4 site-3 / T161K
        convention; Q5: "it must be body") -> UNCONDITIONAL IMMEDIATE EXIT. Side per
        bar (§5.2): a trigger line whose CURRENT value sits ahead of the trade is a
        touch-target, not a body-close trigger. Session levels behind: TP-touch only,
        never body-close triggers.
  (E-d) MANAGING, SL: exit when price trades through the latched slRef (the journal's
        SL rows; the touch-through convention — Q5).
  (E-e) MANAGING, §5.6: if regimeAtAdmission == trend and the HTF aggregate flips,
        exit at the flipping HTF candle's confirmation close. Toggle = compile-time
        constant (the §4 note), DEFAULT ON per spec.
- Instrumentation-first: every verdict ALSO logged as an EXITCENSUS line (bar, site,
  line, value, side, close, verdict) BEFORE any behavior change; in ALERT-ONLY the
  "behavior" is the EXIT alert itself, so the census and the alerts land together and
  the diagnostics-first requirement is met by construction.
- NOTHING in the entry pipeline changes; the identity gates (WS161, BIASCENSUS,
  ZONECENSUS, CQD stream, SIGNAL lines) MUST NOT MOVE — the exit phase adds lines
  after the signal bar only.

## 4. WHAT THE IDENTITY RUN WILL SHOW (pre-stated)
- The 08.17 signal (16:35:02 LONG Weekly-VWAP, SL 1.15870, TP 1.16141): under E-c the
  body-close test binds to Weekly-VWAP while behind; under E-b the touch of the current
  target exits. The operator's own 08.17 outcome (their exit 17:10) was a W-POC
  body-break on a Weekly-VWAP-anchored trade — under Q1=anchor-only the EA would NOT
  reproduce that exit; under an all-behind-lines reading it could. THIS IS WHY Q1 IS
  THE LOAD-BEARING QUESTION.
- The 08.20 signal (09:35:04 LONG Daily-VWAP): same structure.

## 5. THE BATCHED QUESTIONS (ONE relay; recommendations attached)
Q1 (charter 9.1 confirmation (a) — THE BIG ONE): the §5.1/§5.2 body-close early exit —
    ENTRY-ANCHOR POI ONLY, or ALL twelve lines sitting behind the trade? Your 9.1
    ruling ("my entry was based from POC"; a VWAP flip does not exit a POC-anchored
    trade) reads anchor-only; but your 08.17 exit was a W-POC body-break on a
    Weekly-VWAP-anchored trade — which contradicts anchor-only UNLESS the rule is
    "every line behind the trade" and 9.1's point was narrower (a line whose value
    merely moved is not an exit; a BODY CLOSE THROUGH a behind line is).
    RECOMMENDATION: ALL lines behind the trade carry the body-close test (the spec's
    own wording "POI behind the trade"), with 9.1 recorded as its consequence. YOUR
    CALL — this decides the whole build.
Q2 (confirmation (b)): the SHORT-side mirror is exact (a behind line body-closes ABOVE
    the trade -> exit; an ahead line touched -> TP). RECOMMENDATION: confirm.
Q3 (confirmation (c)): TP-vs-exit asymmetry — a line can be the TP target (touch exit)
    and yet never an early-exit trigger while behind; the anchor's family sibling
    admitted as a TP candidate stays TP-only. RECOMMENDATION: confirm as measured.
Q4 (0814-MISS §6): the pre-confirmation 2-of-3 adverse-evidence kill stays EXACTLY as
    built, and §5.4's anchor-body-break is ADDED as a separate, additional
    pre-confirmation death (spec §5.4's own two-death table, no overlap).
    RECOMMENDATION: yes.
Q5: SL exit convention in alert-only: the exit alert fires when price TRADES THROUGH
    the latched stop (wick or body). RECOMMENDATION: trade-through (standard stop
    semantics; the journal's SL rows).
Q6: post-entry TP target: RE-COMPUTED per bar from the current candidate set (targets
    follow moving values, §1.3/§2.2 — your 8/17 "revised exit/TP target"), NOT frozen
    at the admission figure. RECOMMENDATION: re-computed per bar (spec-verbatim).

## 6. RULINGS RECEIVED 2026-09-09 (the operator's answers, verbatim) — Q2/Q4/Q5/Q6 CLEAN
Q1: "Yes, but still adhere to the ruling of the hierarchy"
Q2: "yes"
Q3: "i don't quiet grasp the question, but if for example the entry was from W POC, then
     if the W POC gap or breaking the setup bias direction, it does not close or early
     exit because the origin entry POI was from the same W POC."
Q4: "yes, that is only pre confirmation entry. even if after entry, the structure flip
     then i still hold the trade"
Q5: "On early exit, when the price break through the POC gap, then it must be body."
Q6: "yes, the nearest because price is dynamic so which ever valid TP target is the
     nearest, even if less than 1R after the entry and revision."

RESOLUTION (declared, correctable — reconciled against the RECORD, not invented):
- Q5 + charter 9.1(2) agree and GOVERN: PRICE's BODY-close through the (possibly
  gap-jumped) POC line IS the early exit ("when the price break through the POC gap,
  then it must be body"; 9.1: "the POC's own early exit applies when it gap-jumps and
  price body-closes below it — the 8/17 shape"). Wick does nothing (§5.1).
- Q3 reads as: the LINE's own gap/move NEVER exits by itself ("it does not close or
  early exit" on the W POC's gap or the line breaking the bias direction by MOVING) —
  the gap/jump is descriptive, never a mechanism (spec §1.3); the exit is the BODY
  close of PRICE through the line (Q5). The "because the origin entry POI was from the
  same W POC" clause binds the test to the origin/anchor line (9.1). DECLARED
  INTERPRETATION: Q3's literal "not" scopes over the gap/move alone, NOT over the
  body-close break — otherwise Q3 would contradict 9.1(2) and Q5, which are two
  recorded/confirmed signals vs one fuzzy sentence. The T161O census measures every
  line's verdict per bar either way, so any correction is data-checkable.
- Q1 "Yes ... adhere to the ruling of the hierarchy": the body-close early exit carries
  to the lines BEHIND the trade, CLASSIFIED THROUGH THE RULED HIERARCHY — the rank
  table (FOMC > Yearly > Quarterly > Monthly > Weekly > Daily; AVP-POC over VWAP
  inside each family; ANCHORTIER-1 §10 closed it as mapped). Per 9.1(1) ("a candle
  close that flips below the VWAP does NOT exit the trade — my entry was based from
  POC"), a family's VWAP line does NOT carry the body-close exit; the family's POC
  line does; the ANCHOR line itself always does (9.1(2) — the origin entry POI's own
  body-break exits, Q5's shape). Session levels behind the trade: TP-touch only
  (§2.2); never body-close triggers (§5.1 says "POI").
- IMPLEMENTATION-SAFETY: because Q1's scope has one residual soft spot (anchor-line-
  only vs family-POC-set vs all-twelve), the scope is a COMPILE-TIME CONSTANT
  (the §4 toggle precedent) with the census logging ALL twelve lines' verdicts per bar
  regardless — so the run MEASURES every variant and a scope change is a one-constant
  flip + recompile, never a redesign. DEFAULT: family-POC set + the anchor line.
- Q2: the SHORT mirror is exact.
- Q4: the 2-of-3 kill and the §5.4 anchor-body-break death are PRE-CONFIRMATION ONLY;
  after the confirming entry, structure flips do NOT kill — the trade is held (spec
  §3.4 verbatim). CONSEQUENCE RULED: the current build's 2-of-3 poll runs through the
  gate-check (spec §8: "§3.4 pre-confirmation-only scoping — not built") and must be
  scoped to end at the confirming close — SEPARATE PACKET P-SCOPE34 (DRAFT, NOT
  ISSUED; an entry-pipeline change, NOT bundled here — spec §7 separation and the
  identity-gate design).
- Q6: the post-entry TP target is RE-COMPUTED per bar (the nearest valid target, price
  is dynamic), EVEN IF less than 1R after entry — the 1R gate is admission-only.
- Q5 (SL sub-question): the SL exit = price trading through the latched stop (the
  recommended convention, unobjected); the body-only rule Q5 states binds the POI
  early exit.

## 7. STATUS
All six answers received and recorded. The packet is FINALIZED (the scope constant +
the resolved semantics) and READY. NO canonical file touched. The build is a canonical
EA edit = packet-gated (hard invariant 1): execution of stages S1-S7 awaits the
operator's explicit issuance of PACKET_P-EXITMODEL.md. P-SCOPE34 drafted separately,
NOT ISSUED.




