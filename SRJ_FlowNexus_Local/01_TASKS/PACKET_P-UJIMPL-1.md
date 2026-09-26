# PACKET_P-UJIMPL-1 v1 DRAFT - implementation predicates for cleared UJ legs (design questions, no code edits, nothing builds/runs/commits on this file)

Status: v3 DRAFT (v2 + his 11 June chart conflict: 4H bullish till 6/12 00:00 flip, SUPPRESSED-as-killer WITHDRAWN under session rules, regime-only death exhibit; zero code edits; budget OPEN); v2 history retained below; follows V298 CLEAR 3-0 on P-ENTRY-2 v14 PROSE

Canonical files: exactly ONE for edits - Experts\SRJ_FlowNexus_EA.mq5 (predicates only; no new indicator buffers proposed here - council rules; no new inputs proposed here; S1 recount will govern the implementation packet). Read-only evidence pulls span the indicator + includes under his scope YES (ledger 832); edit-canonical stays EA-only.

## Authority (his words + disk + CLEAR, no invention)

- V298 CLEAR 3-0 (result V298-GRADE; route-fail-closed + pool-proof grade obligations ride into acceptance below).
- His bias-flip ruling + journal row 17 corroboration (finding USDJPY-MISSES Rulings-D filed whole): 5m flipped 9:25, 15m confirms 09:45 open = entry candle, trend-following short enabled.
- His Rulings-C (finding filed whole): NEAREST-ANY-AGE + TOUCH-RETARGET + CLOSE-ONLY-GAP-BREAK + 1R floor; friction point (far-back lookup cost) is council mechanism work.
- Divergence example-only (his detection stands; no predicate touches DIV machinery anywhere).

## D1 - UJ1 15m-bias source + promotion route (council rules both)

- Eligibility (his rule, settled): 5m retest + 5m confirmation standing, 15m structural bias flipped at the entry-candle open.
- Source candidates on disk (council rules which): (a) FlowLogic M15 feed into the indicator (EA 10665-10668: FlowLogic handle takes PERIOD_H4, PERIOD_H1, PERIOD_M15 - 15m data enters the indicator; WHICH buffer carries the 15m structural bias is unmapped on record); (b) new M15 snapshotter call (SrjSelSnapTF is generic over handle/tf/maxN at EA 3046; called for M5-4000 at EA 5001 and H1-600 at EA 5003; NO M15 call exists on disk); (c) his sheet 15m column is not machine-readable (operator transport only). Indicator evidence v2 (his scope YES consumed): session inputs Asia 20-00 / London 02-05 / NY 07-12 / PM 13:30-16 NY tz with broker +3 (FlowLogic EA 320-331); HTF inputs H4/H1/M15 with inUseConfirmedHTFOnly=false (EA 246-256); buffer map decls incl session H/L 8-17, PD sessions 40-47, HTF 19/20/21 (EA 30-60); BiasEngine flip state wasBiasFlip + bull/bear alerts + renewal/strong-flip counts (BiasEngine EA 14-35/138-169); HTF engine include (53 bias hits, zero flip hits). Closed-M15 discipline (GLM A3 carried): the read takes closed M15 bars as of the decision tick (09:30-09:45 bar at 09:45:00). Earliest-consumer ordering (Astra A5 carried): before the earliest ordinary-path consumer needing the confirmed value. B1 mirror path DROPPED on his indicator redirect. Ordering: the source read must precede the promotion decision on the same evaluation pass (once-per-bar evaluation at EA 11484-11492).
- Route candidates (council rules which + ordering): the standing candidate must reach a promotion site through the ordinary unmodified state path on the same evaluation pass (P-ENTRY-2 P034 requirement); sites S3-PREBIND EA 8668 + S4 EA 8805 (PREBIND_S2 0 hits on disk; EA 8666 S2-outside-scope); E1-walk + E2-recency first; no S2 extension, no new branch. Predicate-time rows prove the route or A-UJ1 fails closed.
- DQ1 for council: which 15m source + which promotion route, with exact siting and ordering? (answer form in relay)

## D2 - UJ2 historical lookup + booking integration + 1R gate (council rules mechanism)

- Trade rule (his, settled): nearest previous day/session high/low at entry any age; session H/L valid once closed; revise on price/wick touch to today's NY high/low; closes for gap breaks only; nearest must give 1R at admission (no-rescue); degenerate exact-landing = distance<1R of the same 1R gate (state once, implement once).
- Lookup candidates on disk (council rules which): (a) FindNearestSwing over FlowLogic swing buffers (EA 2490-2503: scans evalShift..evalShift+500 M5 bars - PROVEN short of the April-30 ~36d high; nearest-in-TIME sense flagged per GLM A4, his rule is nearest-in-PRICE - deepening fixes neither sense nor the ReadFlow buffer bound at EA 2497); use site on disk EA 4501-4502 (nearest-swing read in selection; Astra A9: not shown to be a TP-booking site - do not touch without ruling); (b) H1-600 snapshot (EA 5003: 600 H1 bars ~25d reach, bar-hours not calendar proof per Astra A10 - also short of ~36d; structure feed, not a level pool); (c) new deep lookup (unscoped surface - council rules; GLM B2 day-keyed cache at the EA 5005-5010 cluster carried as the recommended shape). Pool-proof obligation: grade rows must establish nearest or fail; completeness contract (Astra A11 carried): authoritative history coverage stated or admission fails closed.
- Integration candidates (council rules; GLM B3 + Astra A12-A16 carried): booking race head EA 2349-2372 (ComputeNearestTpTarget with sessbufs[18] incl PD sessions 2356-2364, mask read 2367-2368) + race EA 2396-2409 + census naming EA 2441-2465 (census read-only per EA 2410-2413, cannot change booking; census omits mask + zone tests per Astra A13 - never authoritative admission proof; dump cap EA 2421-2424 accounted per GLM A9); third candidate loop between EA 2402/2403 + census mirror between EA 2451/2452 (GLM-ruled siting); nearest-wins comparator TpTargetUpdateBest EA 2301-2322 (in-direction 2305, zone-exclusion 2318, nearest 2319-2321) UNCHANGED; nearest-in-PRICE framing (his NEAREST point); composite reading ADOPTED (builder rendering, labeled, veto-able): touch of today's NY H/L is the retarget EVENT, re-election reads the closed-session pool only - "strictly-forward" DROPPED as undefined builder wording; 1R gate sits post-race on the winner at the admission consumer (S2POLL_NO_TP_TARGET emitter EA 7307-7312 via ComputeNearestTpTarget; managed recompute at EA 11095-11118 must not see the admission-only gate); touch event + closed snapshot live in the post-entry refresh path (TP_ELECT shadow EA 10087 design context); degenerate exact-landing = distance<1R of the same gate (single check, GLM A11).
- DQ2 for council: which lookup + integration + gate/trigger siting, with exact lines?

## D3 - UJ3 regime passage for the bias-aligned setup (RE-SCOPED v2; FVG-yield premise WITHDRAWN ledger 833)

- Trade rule (his, settled): 14:35 flip + retest + confirmation SAME 14:35 candle, entry 14:40 open; HTF bullish context (his 4H chart: bullish till the 6/12 00:00 flip; 15m Bull on journal rows 33-36; journal 4H Bear differs - chart governs per his presentation; MTF-detection inaccuracy corroborated); 14:45+ post-entry never selection (DO-NOT-REPEAT); trend bias follows the flip direction generally.
- Refutation carried (ledger 833, double-proven): 14:40:22 pass = S1WAIT regime-NONE retention, zero freshness; the FVG-yield relocation addresses a death that never occurred. The SUPPRESSED row at the same pass is present but INADMISSIBLE as mechanism under his session rules (an unexecuted cross-session claim cannot block; its survival without POI-break/5m-flip invalidation is the open diagnostic, ledger 835).
- Passage candidates on disk (council rules implementation): S1WAIT print EA 8060 with consumer 8059 (REGIME_NONE retention); ordinary S2 exit EA 8067-8077 (aligned to S3 on LTF alignment); ClassifyRegime EA 2238-2267 (HTF 19/20/21 votes, trendOk 2+, sweepTag mrOk); R2 seed-death block EA 7822-7856 (A13 pull); confirm signature + bar reads EA 2193-2208 (A13 pull); S1WAIT/REGIMECENSUS death rows exhibited at 14:40:22 (new fence patterns).
- DQ3 for council: regime-passage implementation for the bias-aligned flip-confirmed setup (which gate admits it past S1WAIT, with exact siting + ordering + E1/E2 precedence), with exact lines?

## Scope (his orders + refinement discipline)

- Design questions only (no code edits in this packet; no overall-logic revision; code-surface + budget OPEN pending council rule; S3 recount governs the implementation packet).
- Windows for future grade runs (unchanged, on key + word): EU 8/26-9/10 + UJ 6/1-6/13 (config-ini unix window per RUN-WINDOW GATE). InpDebugLog=true (grading precondition), InpMode=1, M5 pinned.

## Edit set

- NONE in this packet (design round). STAGE-1/S3 disciplines attach to the implementation packet council issues.

## Acceptance (grade-time proofs; event tuples, never bare clock labels)

- A-UJ1-ROUTE: predicate-time rows prove the standing candidate's same-pass route to a promotion site (E1/E2 first, 15m flip at entry candle) or A-UJ1 fails closed (no bypass authorized, ever).
- A-UJ2-POOL: predicate-time rows establish nearest from the pool (any-age nearest per his rule) + 1R admission + touch-retarget to closed-session NY high/low, or fail closed.
- A-UJ3-REGIME: predicate-time rows prove regime passage for the bias-aligned flip-confirmed setup (S1WAIT/suppression passed with E1/E2 first, 14:35-class) or fail closed.
- Event-tuple schema v2 (Astra A23 carried): build + symbol + direction + anchor + seed time + confirmation-bar time + evaluation boundary + actual evaluation time + source/session timestamps (15m-read tick for A-UJ1-ROUTE incl a declared 15m-read print spec per GLM A10; closed-session stamps for A-UJ2-POOL).
- Recount discipline v2 (Astra A24 carried): STAGE-1 exact-diffs the edit; S1 pre-hash gates the tree digest; S3 budget recount governs code surface. E1/E2 carried questions keep their original P-ENTRY-2 Q1/Q2 labels everywhere.
- L-final: A-UJ1-ROUTE + A-UJ2-POOL + A-UJ3-REGIME above + EU preservation carried (A-7PRESERVE).

## Run cost and novel evidence

- No run proposed (design round; no code to grade). Novel evidence vs all prior rounds: first code-level predicate specification round (no prior round ruled implementation; all prior rounds ruled PROSE scope).

(End of file)
