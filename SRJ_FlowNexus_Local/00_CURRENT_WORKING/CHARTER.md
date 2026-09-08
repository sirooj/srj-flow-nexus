# SRJ FLOW NEXUS — OPERATOR CHARTER v1 (DRAFT)
Written by the builder 2026-09-08 from the operator's goal statement, Part A Specification
v4.2 (the operator's own strategy document, received and fully read), and measured source.
Plain language by design. The formal record (rulings, packets) remains authoritative for
process; this charter states WHAT we are building and WHY.

## 1. PURPOSE
Automate the operator's manual discretionary trading. The EA must take the same trades the
operator would take, for the same reasons. The measure of success is STRUCTURAL AGREEMENT
between journalled operator trades and EA signals: today 0 of 12. Instrumentation and
plumbing exist; the strategy encoding is the work ahead.

## 2. THE STRATEGY (from Part A v4.2 — the operator's own rules)
Objects: twelve tiered POI lines (each is simultaneously entry anchor, TP target and exit
line); order blocks promoted to XOBs that project rightward until invalidated; FVGs that
never project; session liquidity; three-candle swings; expansion legs (XOB then FVGs).
THE LAW (§0): no minimum size, distance, width, depth or bar count — ever. Validity is
structural or geometric. "If a proposed rule needs a number, the rule is wrong."
A trade (§3): inside London 02:00-05:00 or NY AM 07:00-12:00 ET, a wick retest of one of
the twelve lines seeds a candidate. Regime: trend-following (4H/1H/15m simple majority
agrees — this filter rejects 79%) or mean-reversion (fresh prior-session sweep). The 5m
bias panel must agree, live every bar. Before confirmation, 2-of-3 adverse evidence flags
kill the setup; after confirmation, they never do. The zone: a relevant in-play XOB or a
leg FVG — in play has NO recency limit (the verified zone was in play via a swing ~80 bars
back). A retracement candle then a confirming candle; for an XOB the opposing candle need
NOT touch the zone (touching permitted, never disqualifying); for an FVG it must, and that
specific candle. Entry is a limit at the confirming close, possibly far outside the zone.
1R gate against the nearest valid target, computed last, reference latched. Order-flow
divergence at least once, anywhere in the sequence, permanent once seen. Stop: two-branch
swing rule, may sit inside the zone, no minimum distance.
Exits (§5): any POI ahead of the trade exits on TOUCH; any POI behind exits only on a BODY
CLOSE through it — unconditional, "disregarding if TP or SL." Side re-classified per bar.
Post-entry: 5m bias ignored; HTF aggregate flip exits (trend setups, toggle).
Concurrency (§6): many candidates alive; first to complete wins over any later tier; one
VALID setup per pair per session (max 6/day); rejections consume nothing; dedup while alive.

## 3. WHAT EXISTS TODAY (measured 2026-09-08)
Architecture: FlowLogic.mq5 (1,242 lines, 37 export buffers) computes structure; the EA
(4,131 lines) runs the candidate/hypothesis state machine in EvaluateClosedBar (L2288-3983).
Built and correct: session windows, POI retest, regime + LTF alignment, the 2-of-3 rule,
FVG-touch-required, arrival order, per-session throttle, the Task-161 working-set
instrument (zero-mismatch proof machinery), whole-tree digests and the frozen Tier-1 log.
Built but not yet governing: the promotion-time export (FlowLogic buffer 33, Task 113;
consumed since Task 123) and a SHADOW in-play census (Task 126, EA L3374+: the widened
promotion-time-bounded walk runs diagnostic-only beside the live two-swing test).
Wrong or missing (the spec's §8, updated by measurement):
  - in-play depth: live test stops at TWO swings; must be the promotion-time-bounded
    structural leg (the shadow already implements the walk — it needs promoting to live,
    and the three copies reconciled: ZoneInPlay L2263, ZoneAdoptable L2136, S3 inline L3265+)
  - XOB opposing-candle touch: build requires overlap uniformly; spec permits (removal)
  - in-zone stop: a guard excludes it; spec permits (removal; keep the side test)
  - stop branch selector: selects on obValid alone; must use the 2xOB panel state +
    imbalance presence (named defect: 1.15870 vs the operator's 1.15835)
  - §3.4 flag scope: global in-bias flags vs "the order block behind the entry zone"
    (needs per-candidate provenance — buffers 35/36 are declared but population deferred)
  - §3.4 scoping: 2-of-3 must stop at confirmation
  - §3.5.1 relevance-precedes-retracement + re-arm on promotion (bound source exists)
  - §3.7 latched R reference + ordering (29 of 33 RR failures fired while divergence
    was still unlatched — 88%)
  - §4 next-candle-open evaluation at three sites (diagnostic first)
  - §3.6 confirmation write: the bundle's confirmation fields have no assignment site in
    the measured source — the confirmation path must be located and completed
  - the entire exit model §5 and concurrency/dedup §6
## 4. THE WORK, IN ORDER (each step is its own master-authorized packet)
STEP 0  161-REG harness run on the CURRENT accepted build (closes the working-set proof
        and R-234), then the Task-161 git snapshot. Before anything changes behavior.
STEP 1  THE REMOVALS + IN-PLAY DEPTH (no new export needed): make XOB touch optional;
        permit in-zone stops; and widen in-play per the operator's 2026-09-08 ruling —
        every confirmed protective-side swing within the SL leg (the leg backing the
        stop reference, which reaches two swings in the strong-signal/no-imbalance
        case), not merely the latest leg or a fixed two swings. The Task-126 shadow
        walk is the starting implementation; its bound changes from promotion-time to
        the stop-reference walk. Reconcile the three in-play copies (EA-49).
STEP 2  STOP SELECTOR + LATCHED R: two-branch selector on the 2xOB/imbalance state; R
        computed after all conditions validate, higher-valid-R selection.
STEP 3  PROMOTION-BAR LOGIC + §3.4 SCOPING: relevance-precedes-retracement and re-arm as
        live rules (export already exists). §3.4 flag scope RESOLVED by operator ruling
        2026-09-08: the flags watch ANY in-bias XOB — the current global scope is correct
        in kind, so no per-candidate provenance is needed; the fix is that 2-of-3 stops
        at confirmation. Buffers 35/36 population stays deferred unless council rules
        otherwise.
STEP 4  EXIT MODEL §5 + PENDING-ENTRY LIFECYCLE §5.5 + HTF EXIT §5.6 (toggle).
STEP 5  CONCURRENCY + DEDUP §6 (multi-candidate, arrival order, while-alive dedup).
STEP 6  RE-MEASURE structural agreement against the operator's journal (Task 163 shape).
RATIONALE: removals first because the spec proves the build is STRICTER than the rules —
cheapest agreement gains; exits last because §7 forbids building them inside the entry
pipeline and every journalled outcome is entry plus exit.

## 5. VERIFICATION DISCIPLINE
Every packet: compile 0 errors 0 warnings (exit code never the gate); Tier-1 identity is
NOT the gate for behavior-changing steps — by design they diverge. Per-packet gates:
spec-conformance pastes (each changed rule beside its spec clause), the working-set
zero-mismatch invariant held throughout, the 08:17 change detector retained (§9.8: it
detects change, not correctness), and journal evidence from an authorized run.
Digests after every write (R-141). Times and sizes recorded, never gated (R-236/R-233).

## 6. NON-NEGOTIABLES
No dimensionals, ever (§0). No ordinal comparisons on state enums. Alert-only; no live
trading. No canonical edit without a master-issued packet. The operator is the final
authority on goals and money. Checkpoints are never written. History is never rewritten.

## 7. OPERATOR RULINGS (answered 2026-09-08 — verbatim, with builder interpretation marked)
1. §3.4 FLAG SCOPE — RESOLVED: "the valid XOB in play could be from the older structure
   on the left but it contributed to the current latest structure. so the answer is any
   in-bias XOB." The flags watch ANY in-bias XOB; the current global scope is correct in
   kind; the defect was only that 2-of-3 ran past confirmation (§8's scoping row).
2. §3.6 FVG-TOUCHING OPPOSING CANDLE — RESOLVED: "the FVG-touching opposing candle is
   usually a fresh or within the same expansion leg of the latest structure, not older."
   The wide within-the-leg reading is confirmed; adjacency is not required.
3. §9.11 IN-PLAY DEPTH — RESOLVED, one interpretation to confirm before build: "every
   confirmed swing in the SL leg to be precise. the SL leg could extend from the current
   leg such as the strong signal structure with no imbalance so the SL is two swings
   away, not necessarily the latest leg." Builder interpretation: the in-play walk runs
   from the evaluation bar back to the STOP-REFERENCE swing identified by §3.7's
   two-branch rule, testing every confirmed protective-side swing along the way.
4. AGREEMENT SAMPLE: "the EA took completely different trades than what i would manually
   execute or what i consider as a valid setup." Wholesale disagreement — consistent
   with spec §9.7 and §9.10.
GLOSSARY (operator's words -> spec/code): expansion leg = spec §3.5 leg; SL leg = the
leg backing the §3.7 stop reference; the operator distinguishes "ordinary imbalance"
from "FVG" — the spec/code currently do not, and the charter adopts the operator's
distinction; strong signal + no imbalance = §3.7's two-swing branch; "fresh" = the
spec's freshness concept (survives only on POI retest and mean-reversion sweep).

## 8. ROLES AND DOCUMENTS
Builder/primary interface: the IDE agent (Cline). Council: Opus 5 (operator-relayed).
External reviewer: GPT 6 Astra. Operator: goals, money, final say.
Documents: Part A Specification v4.2 (strategy, this folder); GOAL_STATEMENT.md (goal);
BUILDER_RESULT_161-A2B1C.md (Task 161 return, accepted); REVISION_63 (rulings R-96..161,
contracts §10, milestones §13); REVISION_64_SESSION_BRIEF (control brief, VOID list);
.clinerules (workflow + standing state, auto-loaded every session).