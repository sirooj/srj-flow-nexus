# PACKET_P-UJIMPL-1 v1 DRAFT - implementation predicates for cleared UJ legs (design questions, no code edits, nothing builds/runs/commits on this file)

Status: v1 DRAFT (follows V298 CLEAR 3-0 on P-ENTRY-2 v14 PROSE: E-UJ1-15M + E-UJ2-SPEC + E-UJ3; this packet asks council to rule the code-level predicates; NO code edits proposed here - old/new blocks ship in the implementation packet after council rules; E1/E2 byte-identical carried; budget OPEN - council rules surface). Base tree D74FE972/633552/11502 (his 7-trade EU tree, current disk). Assembly rule: design questions with disk inventories; each question names candidate sites + ordering; answers are NOT issuance (issuance = a council packet carrying exact old/new).

Canonical files: exactly ONE - Experts\SRJ_FlowNexus_EA.mq5 (predicates only; no new indicator buffers proposed here - council rules; no new inputs proposed here; S1 recount will govern the implementation packet).

## Authority (his words + disk + CLEAR, no invention)

- V298 CLEAR 3-0 (result V298-GRADE; route-fail-closed + pool-proof grade obligations ride into acceptance below).
- His bias-flip ruling + journal row 17 corroboration (finding USDJPY-MISSES Rulings-D filed whole): 5m flipped 9:25, 15m confirms 09:45 open = entry candle, trend-following short enabled.
- His Rulings-C (finding filed whole): NEAREST-ANY-AGE + TOUCH-RETARGET + CLOSE-ONLY-GAP-BREAK + 1R floor; friction point (far-back lookup cost) is council mechanism work.
- Divergence example-only (his detection stands; no predicate touches DIV machinery anywhere).

## D1 - UJ1 15m-bias source + promotion route (council rules both)

- Eligibility (his rule, settled): 5m retest + 5m confirmation standing, 15m structural bias flipped at the entry-candle open.
- Source candidates on disk (council rules which): (a) FlowLogic M15 feed into the indicator (EA 10665-10668: FlowLogic handle takes PERIOD_H4, PERIOD_H1, PERIOD_M15 - 15m data enters the indicator; WHICH buffer carries the 15m structural bias is unmapped on record); (b) new M15 snapshotter call (SrjSelSnapTF is generic over handle/tf/maxN at EA 3046; called for M5-4000 at EA 5001 and H1-600 at EA 5003; NO M15 call exists on disk); (c) his sheet 15m column is not machine-readable (operator transport only). Ordering: the source read must precede the promotion decision on the same evaluation pass (once-per-bar evaluation at EA 11484-11492).
- Route candidates (council rules which + ordering): the standing candidate must reach a promotion site through the ordinary unmodified state path on the same evaluation pass (P-ENTRY-2 P034 requirement); sites S3-PREBIND EA 8668 + S4 EA 8805 (PREBIND_S2 0 hits on disk; EA 8666 S2-outside-scope); E1-walk + E2-recency first; no S2 extension, no new branch. Predicate-time rows prove the route or A-UJ1 fails closed.
- Q1 for council: which 15m source + which promotion route, with exact siting and ordering? (answer form in relay)

## D2 - UJ2 historical lookup + booking integration + 1R gate (council rules mechanism)

- Trade rule (his, settled): nearest previous day/session high/low at entry any age; session H/L valid once closed; revise on price/wick touch to today's NY high/low; closes for gap breaks only; nearest must give 1R at admission (no-rescue); degenerate exact-landing keeps NO_TP_TARGET; strictly-forward NY high required.
- Lookup candidates on disk (council rules which): (a) FindNearestSwing over FlowLogic swing buffers (EA 2490-2503: scans evalShift..evalShift+500 M5 bars - PROVEN short of the April-30 ~36d high; honest gap, his friction point); use site on disk EA 4501-4502 (nearest-swing read in selection); (b) H1-600 snapshot (EA 5003: 600 H1 bars ~25d reach - also short of ~36d); (c) new deep lookup (unscoped surface - council rules). Pool-proof obligation: grade rows must establish nearest or fail.
- Integration candidates (council rules): booking race EA 2396-2409 (session + POI loops into best/haveBest) + census naming EA 2441-2465 (census read-only per EA 2410-2413, cannot change booking); nearest-wins comparator TpTargetUpdateBest EA 2301-2322 (in-direction, zone-exclusion, nearest); 1R gate siting open; touch-trigger siting open; closed-snapshot discipline (retarget reads closed sessions only).
- Q2 for council: which lookup + integration + gate/trigger siting, with exact lines?

## D3 - UJ3 qualifying-flip yield (council rules implementation)

- Trade rule (his, settled): 14:35 flip-bar IS the confirmation; FVG irrelevant post-flip; A2 = Daily-POC anchor; sole-death no-kill corpus; 14:45+ post-entry never selection.
- Yield point on disk (council rules implementation): CheckFreshness EA 2288-2298 (twoOfThreeKills true pre-confirmation, false at S5 where verdict HOLD is diagnostic-only); call site EA 7265 (twoOfThreeKills = state != S5; S4 veto-persistence + VETOCLEAR day logic follow); confirm terms EA 2222-2233 (oppCandle/bodyDir/touch on prior bar, bodyDir on evaluated bar); decision rows CE/QF/FN cohere (seed 14:20 < confirm 14:35, E2-eligible).
- Q3 for council: yield implementation (proceed-past-HOLD on the qualifying-flip bar only), with exact siting?

## Scope (his orders + refinement discipline)

- Design questions only (no code edits in this packet; no overall-logic revision; code-surface + budget OPEN pending council rule; S3 recount governs the implementation packet).
- Windows for future grade runs (unchanged, on key + word): EU 8/26-9/10 + UJ 6/1-6/13 (config-ini unix window per RUN-WINDOW GATE). InpDebugLog=true (grading precondition), InpMode=1, M5 pinned.

## Edit set

- NONE in this packet (design round). STAGE-1/S3 disciplines attach to the implementation packet council issues.

## Acceptance (grade-time proofs; event tuples, never bare clock labels)

- A-UJ1-ROUTE: predicate-time rows prove the standing candidate's same-pass route to a promotion site (E1/E2 first, 15m flip at entry candle) or A-UJ1 fails closed (no bypass authorized, ever).
- A-UJ2-POOL: predicate-time rows establish nearest from the pool (any-age nearest per his rule) + 1R admission + touch-retarget to closed-session NY high/low, or fail closed.
- A-UJ3-YIELD: predicate-time rows show proceed-past-HOLD on the qualifying-flip bar only (14:35-class), E1/E2 first.
- L-final: A-UJ1-ROUTE + A-UJ2-POOL + A-UJ3-YIELD above + EU preservation carried (A-7PRESERVE).

## Run cost and novel evidence

- No run proposed (design round; no code to grade). Novel evidence vs all prior rounds: first code-level predicate specification round (no prior round ruled implementation; all prior rounds ruled PROSE scope).

(End of file)
