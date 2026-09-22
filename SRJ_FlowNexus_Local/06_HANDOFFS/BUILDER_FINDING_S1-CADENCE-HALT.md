# BUILDER FINDING S1-CADENCE-HALT — PACKET_P-VALIDITY-1 v5 STAGE-1 (2026-09-22)

Status: S1 HALTED the v5 build per the packet's own rule. Gate 8 observed: BLOCKED named below, nothing further written toward the build, nothing reverted. Packet v5 0E44ED96/25765/50 and EA DA975803/616591/11236 untouched (both re-measured this turn, identical). Luna key + his run word stand; they authorize a build the packet's S1 refuses to release.

## Gate that fired

S1 tick-cadence assert (packet L38, Kimi-1 fold): "assert the R2 block executes on every tick while the guard holds, not gated to new-bar; if the containing block is new-bar-gated, HALT and relocate R2 to a tick-driven site."

## Measured values (disk, two independent proofs)

- PROOF 1 (gate body, read whole): OnTick EA L11218-L11235 opens with static s_lastBarTime, reads bar-1 time, and RETURNS on unchanged bar time (L11222). Everything downstream runs at most once per new bar.
- PROOF 2 (exhaustive entry enumeration): the tree's only entry points are OnInit L10420, OnDeinit L10559, OnTick L11218. OnTimer/OnChartEvent/OnTradeTransaction/OnTester count is 0. No tick path bypasses the OnTick gate.
- SITE placement: the seed/R2 site (seed assign L7695, R2 insert L7706-L7708) sits inside EvaluateClosedBar(int barShift, datetime barTime) (def L6587), called as EvaluateClosedBar(1, ...) at L11225. At R2: barShift = 1 (just-closed bar, finalized wick), barShift+1 = 2 (settled pre-bar), barTime = closed-bar time (parameter-pinned).
- CONSEQUENCE: the assert's letter is unsatisfiable — a tick-driven relocation target does not exist anywhere in this tree. HALT per the packet; relocation per the packet is impossible without redesigning the EA's closed-bar evaluation model (out of scope, contradicts exact-diff minimalism and the cleared edit set).

## Premise vs disk (Kimi-1 sub-claims, ruled one by one)

- (a) "r2_hi == r2_lo == open at execution": FALSE on disk. barShift = 1 closed bar carries a finalized range; degeneracy needs a zero-range bar (edge case, not vacuity).
- (b) "Kimi-D1 seed-bar coverage vacuous": FALSE. Same-pass coverage holds better than specified: the seed admitted for bar 1 is tested against bar 1's own finalized wick in the same pass (R2 sits after the seed block, L7695 before L7706), with no lookahead and no repaint.
- (c) "Swallow via Luna-2 pre-bar skip": FALSE for seed-bar sweeps (mask at barShift+1 = bar 2 predates them, so the touch fires); correct skip for older sweeps (already deleted-for-TP).
- (d) "G2 launders never-fire vs non-exercised": MOOT as a halt reason; the silent-healthy-path residual stands as Kimi-2 already recorded it (counter + rows cover firing runs; S1 cadence covers the rest).

## Corollaries (mechanism sound, three findings moot)

- The R2 mechanism is SOUND under the actual closed-bar cadence: finalized wick vs settled pre-bar, same-pass seed coverage, correct skip aging.
- The per-tick chattiness findings (Luna-8, GLM-1, Kimi-A1) all assume per-tick execution and are MOOT: R2 evaluates at most once per bar while the guard holds (≤1 R2SKIP row per bar, InpDebugLog-gated, 90-minute ceiling).
- Credit Kimi (dissent-priority): the probe that forced the cadence question exposed the true execution model; the assert it produced overshoots (tick-or-halt) what the mechanism needs (closed-bar-valid).

## What else passed S1 (single blocker confirmed)

GREEN: EA hash/bytes/lines exact; FlowLogic BEC2CBBD/69852/1464, Sessions A0C8542A/23431/582, State C6D56BC1/17999/516 recorded; E1/E1b/E2/E3-anchor(single-hit)/E4/E5 anchors byte-exact (E1b 229/229, E6 8/8 spans); PD writers FlowLogic L1172-1179; ST set contiguous (ST_IDLE..ST_ABORT, L222-224); LogState shape L1715; FL_BUF decls EA L181-200; seven families present; thisBarSweeps detector-local (Sessions L342-451); seed(7695)→R2(7706)→S-advance(9855+) order; no seed path after R2 (DetectPoiRetest calls ≤7689, L10631 comment; sole direct ST_S1 assign L7695); sessbufs order 18/18 identical (L2284 vs L10898); R-FILTER map; packet ASCII (no homoglyphs). UNVERIFIED-but-moot: s1f L7744 body (L7716/L7777 diagnostic-confirmed), zero-init sample.

## Recommendation (council, one question)

Amend by TEXT (v6, zero literal changes to E1-E5): reword the S1 cadence assert to the measured closed-bar model ("assert R2 executes in the once-per-bar closed-bar pass with barShift = 1 finalized wick vs barShift+1 settled pre-bar; HALT only if the site leaves the EvaluateClosedBar path") and fold one closed-bar-cadence clause into L18. Slim delta-clearance relay (this finding rides quoted). Estimated council cost: one round, one question. No re-verdict needed on E1-E5 (literals untouched, all prior accepts stand on them).

(End of file)
