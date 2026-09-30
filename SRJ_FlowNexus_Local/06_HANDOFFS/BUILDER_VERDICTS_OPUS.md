# BUILDER VERDICTS OPUS (verbatim stream, one file per source)

## V252-EVICT OPEN OPUS (his carry, Opus channel, relay v252, filed whole)

## Q1 verdict

**Discrepancy** — two blocking items, one of them a self-contradiction inside the pasted edit itself. The half of Q1 that asks about the session slot is confirmed; the disposition as pasted is not yet clear.

Citation note: the proposed E1/E2 blocks carry no absolute line numbers, so I number them relative — E1-1/E1-2 for the two defines, E2-1…E2-14 top to bottom for the after-shape (E2-1 = first comment line, E2-14 = `GoAbort(...); return;`). Carried code is cited at the absolute numbers you gave.

**Confirmed on the page (the part that holds):**
- Session marks are not consumed by the abort. `ResetSequence` (6266-6293) clears `g_sessionAtEntry` but touches neither `g_sessionUsed_London/NYAM` nor `g_sessionUsedDay_*`; those live only in `MarkSessionUsed` (1802-1817), which `GoAbort` (6295-6329) never calls. Abort frees the slot and leaves the session unconsumed. That claim is proven by the pasted text.
- Slot release is real: `g_state = ST_ABORT` then `ResetSequence()` → `ST_IDLE`, `g_dir = DIR_NONE`, anchor/zone/touch/latches/`g_confirmFromState` all cleared (6288, 6268-6291). No holder survives.
- Q3 is not violated. The refused holder never reached the SIGNAL path, so no first execution exists to protect, and the operator's quoted words at 7519 condition on *having executed* ("if i have executed the first trade"). Arrival order is intact.

**Blocking item 1 — the A9 dual-tag claim is unreachable under the pasted control flow.** E2-3 states "DIV_WAIT emit below stays as the path marker," and E2-5 states "S3 pre-bind rollback kept below." Neither is consistent with the block as pasted: the S3 rollback is *above* the abort (E2-8…E2-13), not below it, and every path out of the block returns — E2-12 on the rollback branch, E2-14 on the abort branch. Anything positioned below E2-14 inside this scope is dead code. So either the DIV_WAIT emit sits above the block (and the comment's "below" is wrong), or it sits below (and it never fires, which kills the baseline comparability A9 was folded to preserve). The page cannot distinguish these, because the DIV_WAIT emit line is not in the paste. This is the same class of defect V251 flagged — the packet asserts a line's behavior without pasting the line. Fix: paste the DIV_WAIT emit with its position relative to E2-6, and if it is genuinely below, hoist it above E2-7.

**Blocking item 2 — `ABORT_POI_REPLACED` (E1-1) has no live reference and a same-name reference already on record.** The only appearance of that token anywhere on the page is inside the removal comment at 7519, quoting the call that the operator ruling overturned: `Was GoAbort(ABORT_POI_REPLACED, g_state)`. On-page, E1-1 is a define with zero call sites — dead surface that re-creates the exact identifier of a path the operator killed. Two readings, both needing S1 to settle pre-compile: if a define for that name survived the Task 91 removal, E1-1 is a macro redefinition; if it did not, E1-1 is dead and should not be added at all. Only `ABORT_DIV_FALLBACK` (E1-2) is load-bearing for this packet. S1's pre-compile assertion as described covers "the symbol" singular — it needs to cover both names, and specifically needs to assert non-existence of `ABORT_POI_REPLACED`, not just existence of the new one.

---

## Analytic ask A — defects, gaps, imprecisions

**A-1. The contract summary overstates what fires unconditionally (E2-4 vs 6297-6308).** E2-4 says GoAbort "carries the decided outcome (LogAbort + A6REFUSED + STAND-DOWN)." On the pasted contract, only `LogAbort` (6297) is unconditional. A6REFUSED is gated on `InpDebugLog && g_dir != DIR_NONE` (6298); STAND-DOWN is gated on `InpAlertStandDown && g_alertedArmed && !g_alertedSignal` (6308-6309). In any configuration with `InpDebugLog=false`, the eviction leaves a single log line and no refusal row. Since this EA's stated purpose is alert-only probe/print, that is the configuration most likely to matter. The comment should name the gates or drop the claim.

**A-2. `bar=` in the A6REFUSED row carries `TimeCurrent()`, not the bar time (6299-6302).** `a6rBT = TimeToString(TimeCurrent(), ...)` is minute-resolution wall/server clock at the moment of the abort, but the row is emitted from a closed-bar evaluation and the field is labelled `bar=`. Every other bar-keyed row you pasted uses the bar itself — `iTime(_Symbol, PERIOD_CURRENT, barShift)` at 7513-7514, `bar=2026.09.01 17:30` in FP/KL. So A6REFUSED rows will not join to the bar-keyed census by their `bar=` column and can be off by up to one bar period. This is pre-existing, but it becomes load-bearing the moment DIV_FALLBACK aborts are the thing you want to count.

**A-3. The A6Emit dedupe key inherits the same problem (6303).** `"REF" + a6rBT + reason + StateName(atState)` is keyed on the same `TimeCurrent()` minute string. Two refusals of the same reason at the same state inside one minute collapse to one row; conversely, one logical bar spanning a minute boundary can key differently across runs. With a single live sequence at a time the collision risk is low, but the key is not bar-stable, which weakens cross-run comparability of exactly the census this packet wants.

**A-4. No shadow record for the new abort (6310-6321).** The TASK 15 block fires only for `ABORT_NO_REGIME` or `ABORT_LTF_MISALIGN`. `ABORT_DIV_FALLBACK` produces no counterfactual continuation record, so after the build there is no on-record answer to "what would the evicted holder have done." That is the single most valuable measurement the change could produce, and the current shape does not produce it.

**A-5. No counter for the new abort (6306-6308).** `g_ea19_noRegimeAborts++` exists for NO_REGIME so "the census can be read against them directly." DIV_FALLBACK gets no equivalent, leaving text-grep as the only count and only when `InpDebugLog` is on.

**A-6. The S4-origin discriminator is negative, which inverts the stated scope (E2-8, E2-14).** The claim is "S4-origin only." The code says: if `g_confirmFromState == ST_S3_ZONE_WAIT`, roll back; otherwise abort. Abort is therefore the *default* disposition for every `g_confirmFromState` value that is not S3_ZONE_WAIT — including `ST_IDLE`, which is exactly what `ResetSequence` sets it to (6288). Any path that reaches this block without a completed re-bind (the parked warmup edge is the obvious candidate) lands in the abort branch by omission, not by being S4-origin. A packet whose scope is "S4-origin only" should make the abort the narrow, positively-tested branch and leave anything unrecognized on the existing behavior.

**A-7. The caller's return type is never stated.** A3 pinned `GoAbort` to void, and 6295 confirms it. But E2-12 and E2-14 both use bare `return;`, which compiles only if `EvaluateClosedBar` is itself void. The S3 rollback branch being "kept" is circumstantial evidence, not proof. S1 should assert the enclosing signature alongside the defines.

**A-8. `prevDiv` is dead on the abort path and duplicates GoAbort's own local (E2-7 vs 6323).** `prevDiv` is used only at E2-11; on the abort branch it is computed and discarded, while `GoAbort` captures its own `prev` at 6323. A reader scanning E2-7 then E2-14 may reasonably think `prevDiv` is what gets passed. Declare it inside the rollback branch.

**A-9. Two overlapping `[P-EVICT-1]` comment groups at two indents (E2-1…E2-5 at 7 spaces, E2-6 at 9).** Both describe the same disposition, both carry the tag, and E2-6 restates "S4-origin only" already stated at E2-5. One edit should leave one comment.

**A-10. `GoAbort(...); return;` packs two statements on one line (E2-14),** against the one-statement-per-line convention visible in every other pasted block.

**A-11. The naming does not match the predicate convention (E1-2, consumed at 6301).** The A6 row renders reason as `predicate=%s`. `NO_REGIME` and `LTF_MISALIGN` are predicates that failed. `DIV_FALLBACK` names a path — and specifically names the behavior this packet deletes, so post-build the log will read `predicate=DIV_FALLBACK` for a case where no fallback occurs. `ABORT_DIV_ABSENT` or `ABORT_NO_DIVERGENCE` would be truthful in the field it lands in.

**A-12. `LogAbort` is asserted but not pasted (6297).** The contract was carried inline specifically so the seats would stop ruling on described behavior. `LogAbort`'s output format is what determines whether `ABORT_DIV_FALLBACK` is greppable and whether it carries the bar, so it belongs in the same paste as the rest of the contract.

**A-13. "0 of 6 fallbacks across 57/58" (E2-2/E2-3) overstates the sample.** Working the pasted rows by run — 16:xx timestamps are RECON57, 20:xx are RECON58 — the `S5_GATE_CHECK->S4_ARMED` re-arms are:

| Run | Rows | Bars |
|---|---|---|
| RECON58 (20:xx) | EM, GQ, LF | 2026.09.01 16:55, 2026.08.31 16:40, 2026.09.04 09:45 |
| RECON57 (16:xx) | RJ, CO, CE | 2026.09.01 16:55, 2026.08.31 16:40, 2026.08.27 10:15 |

Three per run matches the census line, but the union is **four distinct bars**, not six: 08-31 16:40 and 09-01 16:55 are the same bars re-observed in both runs; 08-27 10:15 appears only in 57 and 09-04 09:45 only in 58. So the true statement is "0 of 4 distinct refusals, observed 6 times across two runs" — or, cleanly, "0 of 3 per run." As written, the comment hardcodes a 1.5× inflated denominator into the source, and comments are part of the edit under review.

**A-14. The two runs do not cover the same window, so the splice is a union, not a cross-check.** 57 reaches back to 08-27 and 58 forward to 09-04; neither run alone contains all four re-arm bars. "The same 18 mechanical pulls" reads as one segment with a few substitutions, but the substitution list is doing real work — 8 of the 18 rows exist in the paste *because RECON58 does not contain them*.

**A-15. The 09-01 17:35:01 rows show the two runs disagreeing on holder state at the same server second.** RECON58 has FP `SUPPRESSED bar=17:30 poi=Monthly-VWAP dir=LONG heldPoi=Yearly-POC heldState=S4_ARMED action=HELD`. RECON57 has EL `STATE S1_REGIME->S2_LTF_ALIGN dir=LONG poi=Monthly-VWAP`, then QI SIGNAL on Monthly-VWAP, then RM PRE-SEND and PD order performed — all at 17:35:01. Same bar, same POI, one run holds the squatter and suppresses, the other has no holder and takes the trade. Read as a single timeline these rows contradict each other. Read correctly as two runs, they are the strongest evidence in the packet for the change — a near-paired counterfactual where the freed slot converts to a signal on the exact bar the squat suppressed. Either way the paste should label it as a cross-run pair rather than leaving it to be reconstructed from timestamp prefixes. Corroborating detail: RECON58's KL `A6TERM SELECTED ... mode=1SWING px=1.15975` matches RECON57's `sl_ref=1.15975`, so both runs reached term selection on that bar and diverged only at the holder gate.

**A-16. The tag column is not a unique key.** `EM` labels both the 16:45 ANCHOR_ELECT and the 16:55 S5→S4 row; `CO` labels both a RECON57 SEEDVOID (16:17:12) and a RECON57 S5→S4 (16:12:44). The exception list keys by tag and names `CO` once, which is ambiguous on its face. Timestamps resolve it, but the mapping from "18 mechanical pulls" to 16 distinct tags should be stated.

**A-17. The rows contain no direct evidence for the claims the scope decision rests on.** There is no DIV_WAIT row, no fallback-census row, and no row exposing `g_confirmFromState` at the moment of refusal. "Zero S3-origin fallback events on record" and "0 of 6 converted" are therefore asserted, not shown. The S5→S4 re-arms are good evidence that the squat exists; they are not evidence of its origin distribution, which is what licenses the S4-only narrowing.

**A-18. No session cap exists outside London/NYAM (1802-1817).** `SessionAlreadyUsed` returns false for `SESSION_NONE` and for any session that is not LONDON or NYAM; `MarkSessionUsed` marks nothing for them. Before this change, a squatting holder was itself the de facto limiter on candidates per session. After it, the slot frees repeatedly and nothing in the pasted code bounds the number of candidates that can reach SIGNAL outside those two sessions. Whether that is reachable depends on S1 session gating, which is not on the page, so I cannot resolve it here — but it is the one place where the eviction's blast radius is larger than "one take per session," and it should be resolved before the build rather than after.

**A-19. `SrjSideNote("ResetSequence", g_dir)` is called after `g_dir = DIR_NONE` (6270-6271).** The note always reports DIR_NONE, so any diagnostic keyed on it loses direction on every reset — including every DIV_FALLBACK abort this packet adds. Pre-existing, one line, and the contract now rides inline so it is in scope.

**A-20. The Q3 comment block ends with a stray empty statement and a mis-aligned brace (7519-7520).** The `*/ ;` leaves a bare `;` where the removed call was, and the closing `}` at 7520 sits one column right of the `{` at 7509. Cosmetic, but this is the block the ruling is preserved in.

**A-21. Trailing blank line inside the E1 paste (after E1-2).** Trivial; noted only because the block is presented as the exact after-state.

---

## Analytic ask B — better mechanisms

**B-1. Invert the discriminator so abort is the positive branch (E2-8, E2-14).** Test the S4 origin directly and leave every other state on existing behavior:

```mq5
if(prevDiv == ST_S4_ARMED)
  { GoAbort(ABORT_DIV_ABSENT, prevDiv); return; }
if(g_confirmFromState == ST_S3_ZONE_WAIT)
  {
   g_state = ST_S3_ZONE_WAIT;
   LogState(prevDiv, g_state);
   return;
  }
```

This makes "S4-origin only" true by construction, removes the default-to-abort exposure for `ST_IDLE` and the parked warmup edge, and closes A-6 and A-7's second half without needing to know anything the page does not contain. It also passes `prevDiv` rather than re-reading `g_state`, which is the same value here but stops being so the moment anything is inserted above.

**B-2. Extend the shadow record to the new reason (6314-6315).** Adding `|| reason == ABORT_DIV_FALLBACK` to the existing predicate costs one term and buys the counterfactual for every eviction: direction, anchor line, opening bar, session, all captured before `ResetSequence` wipes them. This is the measurement that decides whether eviction was worth it, and it is read-only, so it does not widen the change's risk surface.

**B-3. Add the census counter alongside 19c (6306-6308).** One `g_evict_divAborts++` under the same `InpDebugLog` gate gives a number that can be read against the fallback census directly, instead of depending on grep over a log format that is itself not pasted.

**B-4. Rename to the predicate (E1-2, consumed at 6301).** `ABORT_DIV_ABSENT` keeps `predicate=%s` honest and matches `class=ABSENT_DECLINED`, which is already hardcoded two lines up at 6300-6301.

**B-5. Drop `ABORT_POI_REPLACED` from E1 entirely.** It has no live call site. If the Task 91 comment at 7519 needs the name for the record, it already has it inside the comment. Not defining it keeps the overturned path unrepresentable and removes the redefinition question from S1's plate.

**B-6. Key A6REFUSED on the bar, not the clock (6299-6303).** Pass the evaluated bar time into `GoAbort` as a third parameter, or compute `a6rBT` from `iTime(_Symbol, PERIOD_CURRENT, barShift)` the way 7513-7514 already does. This fixes the `bar=` field, makes the dedupe key bar-stable, and makes DIV_FALLBACK rows joinable to the SUPPRESSED/POIREPLACE census. Wider than this packet, so it may belong in its own relay — but it is the difference between a countable eviction and an approximately-countable one.

**B-7. Longer-term: move abort reasons from `string` to an enum.** Reason is currently compared by string for control flow (6307, 6314) and formatted into two log lines. An enum plus one `AbortReasonName()` would remove the string compares, make the shadow-set and counter predicates exhaustive at compile time, and stop new reasons from silently defaulting out of both. Touches every `GoAbort` call site plus 6297-6321. Not for this build.

**Minimum to turn Q1 into a yes:** paste the DIV_WAIT emit with its position (blocking item 1), resolve `ABORT_POI_REPLACED` — preferably by deleting E1-1 (blocking item 2), correct the denominator in E2-2 to 4 distinct bars or 3 per run (A-13), and have S1 assert the `EvaluateClosedBar` signature next to the defines (A-7). B-1 and B-2 are one line each and I would take both in the same gated build; everything else in B can wait for its own packet.

## V252-EVICT END OPUS (verbatim close, nothing appended)

## V253-EVICT OPEN OPUS (his carry, Opus channel, relay v253, filed whole)

## Q1 verdict

**Discrepancy.**

The S4-origin test itself is sound and the stamp premise mostly holds, but four of the five clauses in the question cannot be ruled clear on this page:

| Q1 clause | Status |
|---|---|
| refused S4-origin holders abort | Yes, conditional on stamp enclosure (see D-9) — proposed L8-L11 |
| slot freed | Unverifiable on page — rests on GoAbort 6295-6329, referenced not carried |
| session marks unconsumed | Unverifiable **and** contradicted by the fold's own boundary (see D-3) — marks 1802-1817 referenced not carried |
| S3 kept | Unverifiable — the S3 stamp site is not on the page (see D-8) |
| unknowns censused | No — the census is `InpDebugLog`-gated (proposed L18) and the default is not fail-closed (see D-4) |

Plus one integration blocker independent of all of the above: the packet gives no replace-range, and the new block redeclares `prevDiv`, which is already declared at EA 8801 in the carried before-state (D-1).

---

## Analytic ask A — defects, gaps, imprecision

### Blocking

**D-1. Duplicate `prevDiv` declaration / no replace-range.** The before-state at EA 8792-8809 already contains `ENUM_SRJ_STATE prevDiv = g_state;` (8801). The after-shape declares it again at proposed L7. The header calls the after-shape "packet v3 **new lines**," and the fold says the before-state is carried "showing print + emit + old disposition whole" — neither states that 8801-8807 is deleted. As written, an insert produces `variable already defined` at compile, and leaves the old ternary disposition (8805-8806) unreachable-but-present. The packet needs an explicit range: *replace 8801-8807, leave 8792-8800 untouched.* This is the single cheapest fix on the page and it is the one thing that decides whether the build compiles.

**D-2. Slot-free claim rests entirely off-page.** Everything in "the squatter dies and the session slot frees" happens inside `GoAbort` (6295-6329) and `ResetSequence` (6266-6293), both carried "by labeled reference" only. What is actually on the page is `LogAbort` (1723-1729), which prints and nothing else. A page-only ruling cannot confirm that `GoAbort` transitions state, releases the holder slot, or calls `ResetSequence`. `GoAbort`'s **signature and arity are also unverified**, so `GoAbort(ABORT_DIV_FALLBACK, g_state)` at proposed L10 cannot be type-checked here. The fold asserts an evaluator signature at S1 6628 (Opus-A7) but never the abort surface's.

**D-3. "Session marks unconsumed" contradicts the carried boundary.** GLM-A6 as folded says "a session already marked used by an earlier SIGNAL stays used (marks persist)." Q1 asks to confirm marks are "unconsumed." Those are different claims. If the refused sequence never emitted a SIGNAL, it consumed nothing and the phrasing is harmless; but the value case depends on the freed slot being *usable*, which requires the session to be unmarked. In the FP counterfactual the 58 run's NYAM mark state at 17:35:01 is not shown, so eviction may free a slot into an already-consumed session and produce no take at all. The impact claim needs the session-mark state at the moment of each of the 4 refusals.

**D-4. The default branch is not fail-closed, and the census is not counted.** Proposed L18 gates the census behind `InpDebugLog`; a non-debug run produces no census row, which breaks GLM-A15's "run gate asserts invariant presence" for the unknown-origin path. Separately, the default at L23 sets `g_state = ST_S4_ARMED` — byte-identical to the else side of the existing ternary at 8805-8806. That preserves the exact squatter this packet exists to kill. "Fail closed" is defensible only in the narrow sense of *no take, no money*; it is fail-open with respect to the stated goal. Label it "no-take, holder retained, censused" and the page stops overclaiming.

**D-5. No proven clear on `g_confirmFromState` → stale-origin misfire.** Nothing on the page resets `g_confirmFromState` on any path, and it is absent from the clears-list (GLM-A5 names only `sessionAtEntry`). After an abort at L10, the field retains `ST_S4_ARMED`. Any later sequence that reaches the S5 block without re-stamping reads a prior sequence's origin and takes the ABORT branch on stale data. The positive test is only as strong as the field's lifetime, and that lifetime is established nowhere here. This is the most consequential logic gap after D-1.

### Fold-versus-code contradictions

**D-6.** `prevDiv` is declared at L7, at block top, not "scoped to the rollback branch" (Sonnet-A4/Opus-A8/Kimi-A-c, marked folded). The S4 branch never uses it.

**D-7.** L10 puts two statements on one line, contradicting Opus-A-10 (one statement per line, marked folded). L1-L5 plus L6 are two comment blocks, contradicting GLM-A13/Opus-A-9 (single comment block, marked folded). L1-L5 are also indented 7 spaces against L6-L25's 9, which reads as a different brace depth than the code it documents.

**D-8. S3 stamp site missing.** The S4 promotion stamp is carried (8741-8747); the S3 pre-bind stamp is not. If S3 promotions do not stamp, they fall through L12 into the unknown-origin default and get promoted to `ST_S4_ARMED` — a behavior change for the pre-bind path, i.e. the regression this packet claims to avoid. "S3 keeps rollback" is unproven on the page.

**D-9. The stamp-enclosure proof has a five-line hole.** The guard is carried at 8629-8630 and the continuous builder read is stated as 8636-8749. Lines 8631-8635 are neither carried nor covered. A closing brace there breaks the enclosure and with it the "S4 promotions stamp S4" premise. Extend the read to 8630-8749 and the premise is closed.

**D-10. GLM-A7's expected log shape contradicts the carried `LogAbort`.** The expectation reads `STATE S5_GATE_CHECK->ST_ABORT` with `predicate=DIV_FALLBACK`. `LogAbort` at 1725 emits `%s ABORT reason=%s state=%s poi=%s dir=%s` — `reason=`, not `predicate=`, and no `->` transition. Every carried STATE row (QF, EM, GQ, LF, CE, CO, RJ) prints names without the `ST_` prefix, so `ST_ABORT` would not match either. As written the run gate's grep fails against correct output. Either `GoAbort` also emits a `LogState` (not shown) or the expectation text is wrong.

**D-11.** The census token `EVICT_UNEXPECTED_ORIGIN` (L19) gets no baseline-absence assertion. GLM-A15 covers `DIV_FALLBACK` only.

### Evidence gaps in the carried rows

**D-12. The denominator's attribution is unproven.** The arithmetic checks out — 6 rows of `S5_GATE_CHECK->S4_ARMED` collapsing to 4 distinct events, with EM/RJ and GQ/CO as the 58/57 duplicates at 09.01 16:55 and 08.31 16:40:01. What the rows do not show is *why* each rolled back. They carry no reason field, and not one of the six is accompanied by a `CONFIRM_DIV_WAIT` print (8794) — the only row that would place it on the divergence path. If any other refusal in the S5 block rolls back to `ST_S4_ARMED`, some of the 6 belong to other predicates, and "0 of 4 distinct refusals" is measuring a set larger than the one being changed. That same uncertainty is the strongest argument for B-7 below.

**D-13. The stamping event has no row.** No `S4_ARMED->S5_GATE_CHECK` row appears for any of the 4 events — EM's rollback at 09.01 16:55 follows QF's `S3_ZONE_WAIT->S4_ARMED` at 16:50 with no S5 entry row between. Pulling those four rows would put the 8741 `LogState` on the page and make the stamp premise observational rather than structural.

**D-14. The cross-run pair is not established as a counterfactual.** FP/KL (58, wall 20:10:12.193) and EL/QI/RM/PD (57, wall 16:17:18.931) share server second 17:35:01, but nothing on the page states that RECON57 and RECON58 differ only in the respect under test. Without a stated config identity the pair is two observations, not a controlled comparison. Also, "takes flow through S5-pass only" has no supporting row: the 57 sequence shows `S1_REGIME->S2_LTF_ALIGN` (EL) and `SIGNAL` (QI) in the same second with no S3/S4/S5 rows at all.

**D-15. KL is mislabeled.** The rows header calls KL "the stuck 17:30 challenger evaluation vs the squatter." KL's own fields read `class=SELECTED ok=1 slot=9` — a successful selection. Nothing in that row says stuck. Relabel without changing the argument: the 17:30 seed was selected and slotted (KL) yet never signaled because the session slot was held (FP) — that contrast is the evidence, not stuckness.

**D-16. GL and FP describe two different suppression mechanisms; only one is addressed.** FP is `SUPPRESSED ... opp=0 higher=0 action=HELD` — suppressed purely because a holder existed, which eviction fixes. GL is `SIDE1H_WOULDPREEMPT ... newTier=4 heldTier=1 wouldPreempt=0` — a tier comparison. Citing both under one thesis blurs what the change buys.

**D-17. The impact denominator may be understated by an order of magnitude.** FP carries `cum_n=70 cum_opp=20 cum_hi=5 cum_both=4`, implying ~41 suppressions with no opposing or higher-tier reason. The packet reasons from 4 refusals. Only the subset of those 70 attributable to post-refusal S4 squatters is addressable, but that derivation is not on the page, and it is the number that actually sizes the change.

**D-18. Empirical claim baked into source.** L5 writes "0 of 4 distinct refusals across 57/58" into a code comment. Run-specific counts rot against the code they annotate; this belongs in the packet, not the file.

### Cosmetic (page-level, not parked)

**D-19.** Before-state 8797 (`DirName(g_dir), divVal);`) carries a stray leading space, and 8798-8801 sit at 10-space indent against 9 for the surrounding block. Pre-existing, adjacent to the edit, cheap to normalize while the region is open. The `#define` alignment at E1 is correct — both identifiers are 18 characters and the 5-space gap matches.

---

## Analytic ask B — better mechanisms

**B-1. Give the replace-range, not a shape.** `replace EA 8801-8807; 8792-8800 unchanged`. Removes D-1 entirely and makes the before/after pair mechanically checkable. Touches: packet text only.

**B-2. `switch` on the origin instead of an if-chain.** A `switch(g_confirmFromState)` with `case ST_S4_ARMED:` / `case ST_S3_ZONE_WAIT:` / `default:` gets one statement per line, one comment block, and the census into a syntactic `default` where it obviously belongs. Touches: proposed L7-L25 (EA 8801-8807 replacement).

**B-3. Sentinel the origin field — highest value on the page.** Add `ST_NONE` (or reuse an existing invalid member), set `g_confirmFromState = ST_NONE` in `ResetSequence`, and clear it at each consumption point in the S5 block. The unknown-origin branch then fires on a *known-absent* stamp instead of silently inheriting a prior sequence's value, which converts D-5 from a latent misfire into a counted event. Touches: 6266-6293 (ResetSequence), 8741-8747 (stamp), 8801-8807 (consumption), plus the enum declaration.

**B-4. Ungate the census.** Drop `if(InpDebugLog)` at proposed L18, or route the census through the same unconditional channel `LogAbort` uses (1723-1729). A fail-closed counter that disappears in production runs is not a counter. Add `(int)g_confirmFromState` alongside `StateName(...)` so an out-of-range value survives a `StateName` miss. Touches: proposed L18-L22.

**B-5. Reconcile the run gate with the actual print.** Either have `GoAbort` emit a `LogState(prev, ST_ABORT)` so `STATE S5_GATE_CHECK->ABORT` exists, or restate GLM-A7 as `ABORT reason=DIV_FALLBACK state=S5_GATE_CHECK` with no `ST_` prefix. Touches: 6295-6329 or the packet's log-shape line.

**B-6. Pull four rows before building.** The `S4_ARMED->S5_GATE_CHECK` rows and any `CONFIRM_DIV_WAIT` prints for the 08-27 / 08-31 / 09-01 / 09-04 events close D-12 and D-13 with no code change and no build. Zero-cost, and it is the difference between a structural argument and a measured one.

**B-7. Scope note — the general fix is a holder lease, not an origin test.** The defect class is "a holder occupies the slot indefinitely after any refusal." A bar-count or TTL lease checked at S4 entry covers every refusal predicate, needs no origin stamp, and is immune to D-5 and D-8 by construction. D-12 is exactly the symptom of the narrower framing: the page cannot currently tell how many of its own 6 observations belong to the divergence path. I would still ship DIV_FALLBACK first as the narrow, reviewable step, but the lease is where this line ends up, and naming it now keeps the origin test from accreting per-predicate branches. Touches: the S4 entry guard at 8629-8630 and the holder struct; a separate packet, not this one.

---

## What holds

Worth stating plainly, since most of the above is negative: one evidence chain on this page is clean and self-contained. EM shows `S5_GATE_CHECK->S4_ARMED` on Yearly-POC LONG at 09.01 16:55, GL confirms `heldState=S4_ARMED` on the same POI at 16:55, and FP still shows `heldPoi=Yearly-POC heldDir=LONG heldState=S4_ARMED` forty minutes later at 17:35:01, suppressing Monthly-VWAP with `opp=0 higher=0`. That is the squatter, observed persisting after a refusal and observed blocking a later setup, entirely within one run and without reference to disk. The mechanism the packet describes is real. What is not yet established on the page is that the proposed edit compiles, that the abort frees what it claims to free, and that the origin stamp it tests is reliably present and reliably fresh.

## V253-EVICT END OPUS (verbatim close, nothing appended)

## V254-EVICT OPEN OPUS (his carry, Opus channel, relay v254, filed whole)

## Q1 verdict

**Discrepancy.**

The S4-origin test itself is sound and the stamp premise mostly holds, but four of the five clauses in the question cannot be ruled clear on this page:

| Q1 clause | Status |
|---|---|
| refused S4-origin holders abort | Yes, conditional on stamp enclosure (see D-9) — proposed L8-L11 |
| slot freed | Unverifiable on page — rests on GoAbort 6295-6329, referenced not carried |
| session marks unconsumed | Unverifiable **and** contradicted by the fold's own boundary (see D-3) — marks 1802-1817 referenced not carried |
| S3 kept | Unverifiable — the S3 stamp site is not on the page (see D-8) |
| unknowns censused | No — the census is `InpDebugLog`-gated (proposed L18) and the default is not fail-closed (see D-4) |

Plus one integration blocker independent of all of the above: the packet gives no replace-range, and the new block redeclares `prevDiv`, which is already declared at EA 8801 in the carried before-state (D-1).

---

## Analytic ask A — defects, gaps, imprecisions

### Blocking

**D-1. Duplicate `prevDiv` declaration / no replace-range.** The before-state at EA 8792-8809 already contains `ENUM_SRJ_STATE prevDiv = g_state;` (8801). The after-shape declares it again at proposed L7. The header calls the after-shape "packet v3 **new lines**," and the fold says the before-state is carried "showing print + emit + old disposition whole" — neither states that 8801-8807 is deleted. As written, an insert produces `variable already defined` at compile, and leaves the old ternary disposition (8805-8806) unreachable-but-present. The packet needs an explicit range: *replace 8801-8807, leave 8792-8800 untouched.* This is the single cheapest fix on the page and it is the one thing that decides whether the build compiles.

**D-2. Slot-free claim rests entirely off-page.** Everything in "the squatter dies and the session slot frees" happens inside `GoAbort` (6295-6329) and `ResetSequence` (6266-6293), both carried "by labeled reference" only. What is actually on the page is `LogAbort` (1723-1729), which prints and nothing else. A page-only ruling cannot confirm that `GoAbort` transitions state, releases the holder slot, or calls `ResetSequence`. `GoAbort`'s **signature and arity are also unverified**, so `GoAbort(ABORT_DIV_FALLBACK, g_state)` at proposed L10 cannot be type-checked here. The fold asserts an evaluator signature at S1 6628 (Opus-A7) but never the abort surface's.

**D-3. "Session marks unconsumed" contradicts the carried boundary.** GLM-A6 as folded says "a session already marked used by an earlier SIGNAL stays used (marks persist)." Q1 asks to confirm marks are "unconsumed." Those are different claims. If the refused sequence never emitted a SIGNAL, it consumed nothing and the phrasing is harmless; but the value case depends on the freed slot being *usable*, which requires the session to be unmarked. In the FP counterfactual the 58 run's NYAM mark state at 17:35:01 is not shown, so eviction may free a slot into an already-consumed session and produce no take at all. The impact claim needs the session-mark state at the moment of each of the 4 refusals.

**D-4. The default branch is not fail-closed, and the census is not counted.** Proposed L18 gates the census behind `InpDebugLog`; a non-debug run produces no census row, which breaks GLM-A15's "run gate asserts invariant presence" for the unknown-origin path. Separately, the default at L23 sets `g_state = ST_S4_ARMED` — byte-identical to the else side of the existing ternary at 8805-8806. That preserves the exact squatter this packet exists to kill. "Fail closed" is defensible only in the narrow sense of *no take, no money*; it is fail-open with respect to the stated goal. Label it "no-take, holder retained, censused" and the page stops overclaiming.

**D-5. No proven clear on `g_confirmFromState` → stale-origin misfire.** Nothing on the page resets `g_confirmFromState` on any path, and it is absent from the clears-list (GLM-A5 names only `sessionAtEntry`). After an abort at L10, the field retains `ST_S4_ARMED`. Any later sequence that reaches the S5 block without re-stamping reads a prior sequence's origin and takes the ABORT branch on stale data. The positive test is only as strong as the field's lifetime, and that lifetime is established nowhere here. This is the most consequential logic gap after D-1.

### Fold-versus-code contradictions

**D-6.** `prevDiv` is declared at L7, at block top, not "scoped to the rollback branch" (Sonnet-A4/Opus-A8/Kimi-A-c, marked folded). The S4 branch never uses it.

**D-7.** L10 puts two statements on one line, contradicting Opus-A-10 (one statement per line, marked folded). L1-L5 plus L6 are two comment blocks, contradicting GLM-A13/Opus-A-9 (single comment block, marked folded). L1-L5 are also indented 7 spaces against L6-L25's 9, which reads as a different brace depth than the code it documents.

**D-8. S3 stamp site missing.** The S4 promotion stamp is carried (8741-8747); the S3 pre-bind stamp is not. If S3 promotions do not stamp, they fall through L12 into the unknown-origin default and get promoted to `ST_S4_ARMED` — a behavior change for the pre-bind path, i.e. the regression this packet claims to avoid. "S3 keeps rollback" is unproven on the page.

**D-9. The stamp-enclosure proof has a five-line hole.** The guard is carried at 8629-8630 and the continuous builder read is stated as 8636-8749. Lines 8631-8635 are neither carried nor covered. A closing brace there breaks the enclosure and with it the "S4 promotions stamp S4" premise. Extend the read to 8630-8749 and the premise is closed.

**D-10. GLM-A7's expected log shape contradicts the carried `LogAbort`.** The expectation reads `STATE S5_GATE_CHECK->ST_ABORT` with `predicate=DIV_FALLBACK`. `LogAbort` at 1725 emits `%s ABORT reason=%s state=%s poi=%s dir=%s` — `reason=`, not `predicate=`, and no `->` transition. Every carried STATE row (QF, EM, GQ, LF, CE, CO, RJ) prints names without the `ST_` prefix, so `ST_ABORT` would not match either. As written the run gate's grep fails against correct output. Either `GoAbort` also emits a `LogState` (not shown) or the expectation text is wrong.

**D-11.** The census token `EVICT_UNEXPECTED_ORIGIN` (L19) gets no baseline-absence assertion. GLM-A15 covers `DIV_FALLBACK` only.

### Evidence gaps in the carried rows

**D-12. The denominator's attribution is unproven.** The arithmetic checks out — 6 rows of `S5_GATE_CHECK->S4_ARMED` collapsing to 4 distinct events, with EM/RJ and GQ/CO as the 58/57 duplicates at 09.01 16:55 and 08.31 16:40:01. What the rows do not show is *why* each rolled back. They carry no reason field, and not one of the six is accompanied by a `CONFIRM_DIV_WAIT` print (8794) — the only row that would place it on the divergence path. If any other refusal in the S5 block rolls back to `ST_S4_ARMED`, some of the 6 belong to other predicates, and "0 of 4 distinct refusals" is measuring a set larger than the one being changed. That same uncertainty is the strongest argument for B-7 below.

**D-13. The stamping event has no row.** No `S4_ARMED->S5_GATE_CHECK` row appears for any of the 4 events — EM's rollback at 09.01 16:55 follows QF's `S3_ZONE_WAIT->S4_ARMED` at 16:50 with no S5 entry row between. Pulling those four rows would put the 8741 `LogState` on the page and make the stamp premise observational rather than structural.

**D-14. The cross-run pair is not established as a counterfactual.** FP/KL (58, wall 20:10:12.193) and EL/QI/RM/PD (57, wall 16:17:18.931) share server second 17:35:01, but nothing on the page states that RECON57 and RECON58 differ only in the respect under test. Without a stated config identity the pair is two observations, not a controlled comparison. Also, "takes flow through S5-pass only" has no supporting row: the 57 sequence shows `S1_REGIME->S2_LTF_ALIGN` (EL) and `SIGNAL` (QI) in the same second with no S3/S4/S5 rows at all.

**D-15. KL is mislabeled.** The rows header calls KL "the stuck 17:30 challenger evaluation vs the squatter." KL's own fields read `class=SELECTED ok=1 slot=9` — a successful selection. Nothing in that row says stuck. Relabel without changing the argument: the 17:30 seed was selected and slotted (KL) yet never signaled because the session slot was held (FP) — that contrast is the evidence, not stuckness.

**D-16. GL and FP describe two different suppression mechanisms; only one is addressed.** FP is `SUPPRESSED ... opp=0 higher=0 action=HELD` — suppressed purely because a holder existed, which eviction fixes. GL is `SIDE1H_WOULDPREEMPT ... newTier=4 heldTier=1 wouldPreempt=0` — a tier comparison. Citing both under one thesis blurs what the change buys.

**D-17. The impact denominator may be understated by an order of magnitude.** FP carries `cum_n=70 cum_opp=20 cum_hi=5 cum_both=4`, implying ~41 suppressions with no opposing or higher-tier reason. The packet reasons from 4 refusals. Only the subset of those 70 attributable to post-refusal S4 squatters is addressable, but that derivation is not on the page, and it is the number that actually sizes the change.

**D-18. Empirical claim baked into source.** L5 writes "0 of 4 distinct refusals across 57/58" into a code comment. Run-specific counts rot against the code they annotate; this belongs in the packet, not the file.

### Cosmetic (page-level, not parked)

**D-19.** Before-state 8797 (`DirName(g_dir), divVal);`) carries a stray leading space, and 8798-8801 sit at 10-space indent against 9 for the surrounding block. Pre-existing, adjacent to the edit, cheap to normalize while the region is open. The `#define` alignment at E1 is correct — both identifiers are 18 characters and the 5-space gap matches.

---

## Analytic ask B — better mechanisms

**B-1. Give the replace-range, not a shape.** `replace EA 8801-8808; 8792-8800 unchanged`. Removes D-1 entirely and makes the before/after pair mechanically checkable. Touches: packet text only.

**B-2. `switch` on the origin instead of an if-chain.** A `switch(g_confirmFromState)` with `case ST_S4_ARMED:` / `case ST_S3_ZONE_WAIT:` / `default:` gets one statement per line, one comment block, and the census into a syntactic `default` where it obviously belongs. Touches: proposed L7-L25 (EA 8801-8807 replacement).

**B-3. Sentinel the origin field — highest value on the page.** Add `ST_NONE` (or reuse an existing invalid member), set `g_confirmFromState = ST_NONE` in `ResetSequence`, and clear it at each consumption point in the S5 block. The unknown-origin branch then fires on a *known-absent* stamp instead of silently inheriting a prior sequence's value, which converts D-5 from a latent misfire into a counted event. Touches: 6266-6293 (ResetSequence), 8741-8747 (stamp), 8801-8807 (consumption), plus the enum declaration.

**B-4. Ungate the census.** Drop `if(InpDebugLog)` at proposed L18, or route the census through the same unconditional channel `LogAbort` uses (1723-1729). A fail-closed counter that disappears in production runs is not a counter. Add `(int)g_confirmFromState` alongside `StateName(...)` so an out-of-range value survives a `StateName` miss. Touches: proposed L18-L22.

**B-5. Reconcile the run gate with the actual print.** Either have `GoAbort` emit a `LogState(prev, ST_ABORT)` so `STATE S5_GATE_CHECK->ABORT` exists, or restate GLM-A7 as `ABORT reason=DIV_FALLBACK state=S5_GATE_CHECK` with no `ST_` prefix. Touches: 6295-6329 or the packet's log-shape line.

**B-6. Pull four rows before building.** The `S4_ARMED->S5_GATE_CHECK` rows and any `CONFIRM_DIV_WAIT` prints for the 08-27 / 08-31 / 09-01 / 09-04 events close D-12 and D-13 with no code change and no build. Zero-cost, and it is the difference between a structural argument and a measured one.

**B-6b. S1 pre-compile gate addition (from Kimi B-5 thread):** reconcile the acceptance gate pattern with GoAbort's actual output on disk before the tester run.

**B-7. Scope note — the general fix is a holder lease, not an origin test.** The defect class is "a holder occupies the slot indefinitely after any refusal." A bar-count or TTL lease checked at S4 entry covers every refusal predicate, needs no origin stamp, and is immune to D-5 and D-8 by construction. D-12 is exactly the symptom of the narrower framing: the page cannot currently tell how many of its own 6 observations belong to the divergence path. I would still ship DIV_FALLBACK first as the narrow, reviewable step, but the lease is where this line ends up, and naming it now keeps the origin test from accreting per-predicate branches. Touches: the S4 entry guard at 8629-8630 and the holder struct; a separate packet, not this one.

---

## What holds

Worth stating plainly, since most of the above is negative: one evidence chain on this page is clean and self-contained. EM shows `S5_GATE_CHECK->S4_ARMED` on Yearly-POC LONG at 09.01 16:55, GL confirms `heldState=S4_ARMED` on the same POI at 16:55, and FP still shows `heldPoi=Yearly-POC heldDir=LONG heldState=S4_ARMED` forty minutes later at 17:35:01, suppressing Monthly-VWAP with `opp=0 higher=0`. That is the squatter, observed persisting after a refusal and observed blocking a later setup, entirely within one run and without reference to disk. The mechanism the packet describes is real. What is not yet established on the page is that the proposed edit compiles, that the abort frees what it claims to free, and that the origin stamp it tests is reliably present and reliably fresh.

## V254-EVICT END OPUS (verbatim close, nothing appended)

## V255-EVICT OPEN OPUS (his carry, Opus channel, relay v255, filed whole)

## Q1 verdict

**Yes on the range — the fix is correct and complete. Discrepancy on packaging: E3 has no stated insertion point, and the fold's claimed reword is not in the code.**

Range check, which this page lets me do cross-version without disk access: the before-state block quoted as 8801-8808 is eight lines and is character-identical to the corresponding slice of the 8792-8809 window carried in v254, including the anomalous 10-space indent on 8801 and the ternary's two-line break at 8805-8806. Counting from `if(!divOk)` at 8792 puts `ENUM_SRJ_STATE prevDiv` at 8801 and `return;` at 8808. So:

- Old declaration (8801) absorbed. No duplicate decl — the after-shape's only `prevDiv` is scoped inside the S3 branch.
- Old `return;` (8808) absorbed. The v254 unreachable-code defect is gone.
- Old ternary (8805-8806) and its 3-line comment (8802-8804) gone whole.
- 8809 `}` survives, closing `if(!divOk)` at 8792. Brace count balances on the page.

Two packaging defects, both fixable in relay text with no code change:

1. **E3's anchor is unnamed.** E2 is declared to replace 8801-8808 and to leave 8792-8800 and 8809 untouched. E3's five comment lines therefore have nowhere stated to land. Intent is obviously "immediately above E2's block," but that is an insertion at 8801, which collides with E2's replace territory and makes both the splice and the post-write line count ambiguous. In v4 this was one contiguous edit and the question did not arise.
2. **"Reword accepted over merge" is not visible.** The fold says GLM's alternative was taken and "fold text matches code," but the one-liner in E2 and all five E3 lines are byte-identical to v4. Either the reword applied to the fold paragraph rather than the source comment, or it was dropped in the amend. As filed, the claim has no referent in the code.

One wording correction on the question itself: "after-shape terminal return the only return" is wrong as stated — the after-shape has **three** `return;` statements (new-block lines 5, 12, 20), one per path. What is singular is the terminal return at line 20. If S1's assert is written literally against "the only return," it will not match the block it is asserting about.

Scope note on "clear to build": the range and splice are clear on this page. The disposition's clearance is not re-established here — GoAbort, LogAbort, the stamp windows, the mark call sites, and the run rows are all by-reference this round. `GoAbort(ABORT_DIV_FALLBACK, g_state)` cannot be arity-checked from this page, and nothing here shows the `ABORT_` constant set. That is consistent with the fold's "no re-review asked," but the yes above is a yes on the amend, riding v254's fences.

---

## A. Defects, gaps, imprecisions

**This round's page**

1. **E3 anchor unstated** (above). The packet's own discipline is exact ranges; this is the one edit without one.
2. **Header omits E3.** "File / function / lines" names "E1 defines + E2 EvaluateClosedBar S5 block," then the body ships E3. Same mismatch in the run-cost line, which prices "define + disposition + comment" — so the comment is in scope, just missing from the header.
3. **E3 commits an inaccurate comment into the source.** Line 4 reads "A6REFUSED and STAND-DOWN gated (debug/armed)." Per v254's carried GoAbort body, A6REFUSED is behind `InpDebugLog` (6298) but STAND-DOWN is behind `InpAlertStandDown && g_alertedArmed && !g_alertedSignal` (6308) — no debug gate. The compound phrasing implies both are debug-conditional. This was V254 item 10, is not in the fold's ridden-nits list, and E3 was re-shipped "twin-checked" unchanged, so the wrong description lands permanently in the file.
4. **Post-write line count still unstated** (V254 item 3, unfolded and unnamed). E2 is 20 lines replacing 8 (+12), E3 is 5 (+5), E1 is 1 (+1): **11317 → 11335**, or 11336 if the trailing blank in the F1 block is part of the add. Note the number moved from my v254 figure precisely because the range grew by one line — which is why S1 should commit to one value against the 11317 / 622155 B baseline.
5. **F1's insertion line and trailing blank still unspecified** (V254 item 2, unfolded and unnamed). "F1:1 context already at EA 319" implies 320 but never says it, and the blank line's status decides item 4's ±1.
6. **No on-page evidence that `ABORT_DIV_FALLBACK` is undefined today** (V254 item 4). Weaker than last round: v254 at least showed `ABORT_NO_REGIME` and `ABORT_LTF_MISALIGN` in use at 6307/6317. A duplicate `#define` warns and silently takes the later value.
7. **The S5 enclosing guard has never appeared on any page in this line** (V254 item 5, carried open, not named as parked). The hardcoded `LogState(ST_S5_GATE_CHECK, ST_S4_ARMED)` at new-block line 19, the acceptance string's `state=S5_GATE_CHECK`, and the premise that `prevDiv` can only be S5_GATE_CHECK all rest on it.
8. **LogState's body is still uncarried and still unlisted** (V254 item 14). Half the acceptance criterion (`STATE S5_GATE_CHECK->ABORT`) is therefore unverified on-page in any version of this packet. The LogAbort half is solid.
9. **The fold's ridden-nits enumeration is incomplete.** It names one-liner, KL/pair wording, A6 class, shadow/counter, warmup, enum, B1-widening. Unaccounted for from V254: items 2, 3, 4, 5, 10, 14, 15, 16, 24, 25, and B-items 2, 5, 6. Against the standing "rounds end in amend or clear, never silent drift," a partial enumeration is how items go quiet — each should be folded, parked with a reason, or rejected with a reason.
10. **E3 indent still off by 2** (V254 item 24). E3 sits at 7 spaces; E2's one-liner and all statements sit at 9, matching disk 8794/8800.
11. **`prevDiv`/hardcode asymmetry retained** (V254 item 25, B-2 neither taken nor refused). The branch written on the premise "origin is not what we expect" is the one that hardcodes its from-state.
12. **"Retry converted 0 of 4 distinct refusals (57/58)" is being frozen into source.** Accurate as a retry-conversion statement, but adjacent to the eviction's description it invites reading all four as in-scope for the new branch. Per v254's rows, exactly one of the four (2026.09.01 16:55, Yearly-POC) has on-page S4-origin evidence via the preceding `S3_ZONE_WAIT->S4_ARMED` promotion; the other three carry no origin marker, so they may abort or merely census. A source comment should not carry a number whose scope is ambiguous without the run-row context that is not in the file.
13. **Filed v254 relay carries a bad cite.** Its fold text says "8743 S4"; in the carried 8741-8747 window 8743 is `ENUM_SRJ_STATE prev = g_state;` and the stamp `g_confirmFromState = prev;` is 8744. Same relay also calls it "the 8741 stamp." Not on this page, but it is now the referenced fence for the stamp proof.
14. **Packet arithmetic is checkable and slightly odd.** 11896 B → 12138 B (+242) with line count unchanged at 107. Only consistent if every edit was intra-line, which a fold rewrite plus a range change can be — flagging it as the kind of pair the operator can confirm on disk, not as an on-page defect.
15. **EA digest unchanged from v254** (`b01cba64…` / 622155 B / 11317), consistent with "superseded unbuilt." Noted as passing, not as a gap.

---

## B. Better mechanisms

1. **Merge E2 and E3 into one edit.** State: "replace 8801-8808 with the following 25 lines," E3's five first at 9-space indent, then E2's twenty. Removes defects 1, 2, and 10 in a single stroke, makes the net delta unambiguous (+17 code), and restores the v4 property that the comment and the branch cannot be spliced apart. Touches only the packet's range statement and E3's leading whitespace.
2. **Fix the gating sentence in E3.** Replace line 4 with two clauses: `//--- A6REFUSED is debug-gated; STAND-DOWN fires on this path when armed` . Corrects defect 3 at zero code risk. Separately, decide whether the STAND-DOWN alert on every eviction is wanted — if not, add `reason != ABORT_DIV_FALLBACK` at 6308.
3. **Re-carry two lines whenever Q1 says "clear to build."** GoAbort's signature (6295) plus one `ABORT_` constant use (6307) gives back on-page arity checking and a partial duplicate-define check for one line of relay length. A page that asks for a build clearance should carry the minimum that makes the call site checkable.
4. **Drop the hardcoded transition pair** (restating v254 B-2, unfolded): `ENUM_SRJ_STATE prevU = g_state; g_state = ST_S4_ARMED; LogState(prevU, ST_S4_ARMED);`. Same window, same one-statement-per-line rule, and it removes the last dependence on the uncarried S5 guard (defect 7).
5. **Anchor acceptance on LogAbort alone** (restating v254 B-4): key on `ABORT reason=DIV_FALLBACK state=S5_GATE_CHECK poi=<X> dir=<Y>` from 1723-1728 — unconditional and pre-`ResetSequence` — and match `poi=` against the SUPPRESSED row's `heldPoi=`. Makes the run's pass/fail independent of defect 8. Relay text only.
6. **Add `origin=%s` to `CONFIRM_DIV_WAIT`** (restating v254 B-6, unfolded and unnamed): inside the existing `InpDebugLog` gate at 8794-8798, so no new unconditional output. One debug run then classifies all six historical rollback rows as S4-origin vs unknown and turns defect 12's estimate into a count. This reopens "8792-8800 untouched," which is the operator's call — but it is still the highest-value single line available, and it should at least be parked with a reason rather than dropped silently.

No ruling here builds, runs, or clears anything; live activation remains untouched and unaddressed by this packet.

## V255-EVICT END OPUS (verbatim close, nothing appended)

## KEY OPUS EVICT-ASK OPEN (his carry, Opus channel, key ask on v255, filed whole - REFUSED; his paste wrapped "digest" as "di gest", transposition flagged, meaning kept)

here is opus intead:
I can't fill that. Two reasons, both standing rules from this packet line rather than anything new.

**Keys aren't mine to issue.** The review seat is analysis out, review-only, never keys — your seat-split, carried on every page including v255. A build-plus-run clearance with the packet ID and digest restated as an authorization artifact is a key. It comes from the key seat. My restating `427AAA0F / 12138 B` in that slot would also read as an attestation that the bytes on your disk match, which the verification split says no seat can answer from chat.

**"4/4 YES on v255" doesn't match what I sent.** My v255 line was yes on the range, discrepancy on packaging. The range fix is clean — 8801-8808 absorbs the old decl and the old return, ternary gone whole, 8809 close survives, brace count balances. Two items were left open:

- **E3 has no stated insertion line.** Five comment lines, no anchor. E2 is declared to replace 8801-8808 and to leave 8792-8800 and 8809 untouched, so E3 has nowhere named to land. That is a splice ambiguity in the build you're clearing, not a cosmetic.
- **The fold's "reword accepted over merge / fold text matches code" has no referent.** E2's one-liner and all five E3 lines are byte-identical to v4. Either the reword applied to the fold paragraph rather than the source comment, or it was dropped in the amend. As filed, the claim has no referent in the code.

Also unresolved and cheap: E3 line 4 commits "A6REFUSED and STAND-DOWN gated (debug/armed)" into the source, and STAND-DOWN is not debug-gated (6308). That comment is wrong the moment it lands.

If the other three seats returned clean YES on v255, the honest tally is 3 YES plus 1 discrepancy-on-packaging, and "zero conditions" isn't the state of the page. The fastest path to a real 4/4: merge E2 and E3 into one "replace 8801-8808 with these 25 lines" edit at 9-space indent, fix the gating sentence, state the post-write line count (11335, or 11336 if the F1 trailing blank is part of the add). That closes all three and I'd rule it clear without qualification.

Happy to re-review the amended page the moment it ships. The clearance line itself needs your word and the key seat.

## KEY OPUS EVICT-ASK END (verbatim close, REFUSED - no key granted)

## V260-RESQUAT-CLEAR OPEN OPUS (his carry, relay v260 clearance ask, filed whole 1x)

Opus:
## Q1. Re-squat half (E1-E4, +52)

**Q1 verdict: NOT CLEARED, because two defects in the twin would survive STAGE-1 and cost the run: (D1) E4's new block is described as placing the capture *after* `GoAbort`, which makes the suppression record a silent no-op; (D2) the Scope/G2 acceptance greps census families the edit set never emits.** Both are text-level, both repair inside one re-cut, and neither touches the adopted logic.

### D1 (blocking): E4 capture ordering

Packet E4 reads: "new = same with capture + record + EVICTSUPPRESS print after GoAbort (Opus-Q2 Edit D whole)."

`GoAbort` (C1, EA 6289-6330) ends `g_state = ST_ABORT; LogState(...); ResetSequence();`, and `ResetSequence` (C1, EA 6267) clears `g_anchorLine = -1`, `g_dir = DIR_NONE`, `g_sessionAtEntry = SESSION_NONE`. If the capture reads those three after `GoAbort` returns, the record stores `(-1, DIR_NONE, SESSION_NONE)`, E3's gate short-circuits on the empty test forever, `RESEED_BLOCKED` never prints, and G2 fails on its own suppression clause. The build is clean, the compile is clean, the 90 minutes are spent, and the failure looks like a logic miss rather than an ordering slip.

The referenced filing places the mark strictly above the `GoAbort` line with that clearing named in its comment, so the twin's summary and its own reference disagree. Record-and-print after `GoAbort` is fine and arguably better for row order (abort triple first, then `EVICTSUPPRESS`); only the **capture** must sit above the call.

Repair for v2: paste E4's new block verbatim with three locals assigned above `GoAbort(ABORT_DIV_FALLBACK, g_state);` and the four record writes plus the print below it, and add a STAGE-1 char-code assert that the capture lines precede the `GoAbort` line inside the new block.

### D2 (blocking): acceptance names no emitted row

| Emitted by edit set | Required by Scope / G2 | Pre-build fence |
|---|---|---|
| `EVICTSUPPRESS` (E4) | `EVICTMARK` count == DIV_FALLBACK S4-origin count | both 0 |
| `RESEED_BLOCKED` (E3) | `RESQUAT_SUPPRESS >= 1` on 9/1 | both 0 |
| `EVICTSUPPRESS_FIRE` (E2) | not graded | 0 |

The fold renamed the census families away from the filed names but left the acceptance on the filed names. Every fence entry is 0 pre-build, so the fence cannot disambiguate and the grader would read two satisfied-by-absence clauses as failures. Repair: re-cut Scope and G2 onto `EVICTSUPPRESS` / `RESEED_BLOCKED` / `EVICTSUPPRESS_FIRE`, and add the third family to the graded set (`EVICTSUPPRESS_FIRE` count == take count in the graded window, the fire leg's own proof).

### Rule preservation, one line per rule

- **R-a:** packet E2 inserts the FIRE arm inside `MarkSessionUsed` (old EA 1813-1818) and adds no mark write and removes none; `SessionAlreadyUsed` (EA 1803-1811) and C6's `SESSION_LIMIT` branch are outside the edit set, and "Untouched: ... session marks" states it. Holds **conditional on assert 8 below**: moving the clear inside `MarkSessionUsed` is equivalent to clearing on the two SIGNAL paths only if `MarkSessionUsed` has exactly two call sites, which the fence table counts for the definition (1) but not for the calls.
- **R-b:** E3's gate is four equality tests on (line, dir, sess, day) plus the `<0` empty test; E1 declares four plain scalars and no counter; EXPIRE is day-key mismatch at the read site, so there is no expiry constant, threshold, or bar count anywhere in E1-E4.
- **R-c:** held by the packet's own Authority ruling (S5-refused = `ABSENT_DECLINED` = not a valid setup under A+ strict, so F-a shrinks no valid set) plus "Untouched: ... R floor". This discharges my v259 flag 1: the narrow R-value reading is now ruled on record, and I do not re-open it.
- **R-d:** E3 is consumer-side, placed after the existing detector call and before the first state write; S1 asserts the `DetectPoiRetest` signature unchanged; fence `excludeMask 0` proves no detector-body mask rode in; "Untouched: E3 walk, R2 scope, Q3 arrival order, Task-91 removal + C4 fall-through" covers the rest.
- **R-e:** the Q2 half adds no order call, no `EmitAlert`, no indicator handle, no buffer index, no input; fence `PositionClose 0` confirms the only close surface arrives in the Q3 half.

### STAGE-1 asserts, restated as checkable conditions

1. Pre-hash: EA == `15A41634798A9307D2D38EB631946F1BCCDD07171544C053F986B9416A2E7739` / 622631 B / 11330 lines, else DIAGNOSE, never assume, never revert.
2. Anchor single-hits, exact counts as fenced: `bool SessionAlreadyUsed` 1, `void MarkSessionUsed` 1, `branch=RETEST inWin=1` 1, `s1g_legDir = pr.isLong` 1, `squatter GC` 1, `ABORT_DIV_FALLBACK` 2 (one `#define`, one use at the E4 site).
3. Identifier availability: `g_lineCode` 40, `POI_NLINES` 15, `SessionName` 10, `TC_DayStart` 6, `DirName` 111, all nonzero and all first-occurring above their new call sites.
4. New-name virginity, all 0 pre-build: `g_evictSuppressLine`, `EVICTSUPPRESS`, `EVICTSUPPRESS_FIRE`, `RESEED_BLOCKED`.
5. Old-anchor char-code assert, byte-exact, all four: E1 one line at 1803, E2 EA 1813-1818, E3 EA 7730-7732, E4 EA 8802-8808.
6. Buffers 48/48: `FlowLogic indicator_buffers` single-hit, `FlowLogic SetIndexBuffer(48` == 0.
7. Detector untouched: `DetectPoiRetest` signature byte-identical and call count 14 pre == 14 post (E3 adds no call).
8. **Add:** `MarkSessionUsed(` call-site count == 2, resolving to EA 10160 (C9a) and EA 10253 (C9b). This is the R-a proof for the E2 restructure and the fence table omits it.
9. **Add:** `ENUM_SRJ_DIR`, `ENUM_SRJ_SESSION`, `DIR_NONE`, `SESSION_NONE` all declared above EA 1803. MQL5 has no forward enum declaration, so E1's four typed globals at 1803 require it. The inference is sound from `DirName(g_dir)` at EA 1719, but it is an inference, not a measurement.
10. **Add:** E4 new-block internal ordering per D1.

Anchor numbering note: the packet's `7730-7732` is correct and my v259 labeling of the same two lines as `7731-7732` was off by one. Use the packet's.

---

## Q2. Exit-executor half (E5-E7, +54)

**Q2 verdict: NOT CLEARED, because (D3) E5 defines `MtCloseBrokerPosition` while E7 calls `MtCloseExecute`.** One name, one repair. S4 would catch it as an undeclared-identifier error, so the cost is a failed compile rather than a failed run, but it is a declared-verbatim edit set that cannot build as written.

Repair: pick one name, apply it to both blocks, and fence it once in v2 (the fence table currently carries `MtCloseBrokerPosition 0` and does not carry `MtCloseExecute` at all, so the table cannot catch this class of drift on its own).

### Rule preservation, one line per rule (R-e amended)

- **R-a:** Q3 writes no session mark and E5 reads none; the executed close does free `IsSessionPositionOpen(magic)` at E4 (EA 10171), which leaves C3's day-keyed mark as the sole one-take guard for the rest of that session. The packet carries this as acceptance; recommend one explicit graded item, since "any unpredicted election delta HALTS" detects it only indirectly: after an executed exit, a same-session candidate must produce a `SESSION_LIMIT` row and never a new `PRE-SEND`.
- **R-b:** E7 fires on verdicts E1 already computes on the closed bar; E6 adds a print field only; `vDAY` still derives from the existing `g_news_dayMarks` join with F3 unmodified, so no new mark array, constant, or bar count enters.
- **R-c:** no R, SL, or TP arithmetic is read or written; the `vSL`/`vTP` verdict branches and `slRef`/`tpRef` assignments are carried byte-identical; broker-owned legs untouched.
- **R-d:** E1's section-7 separation holds, the helper reads only `g_mtrade.dir` plus terminal position state, and no selection row changes except lots downstream of the two executed exits.
- **R-e amended:** the single close call sits behind the tester gate, live prints and returns false, `MT_HTF_EXIT` stays false with E3 outside the edit set, `CANCEL_BIAS` returns above the executor, and no buffer, handle, or input is added.

### Tester gate restated

Attempt a close only inside the strategy tester: `MQLInfoInteger(MQL_TESTER)` true. On false, print `MTCLOSE ... action=SKIPPED_LIVE_ALERT_ONLY` and return false, no order, so live remains alerts-only with zero send paths added.

One recommended tightening, not a blocker: the filed gate tests `MQL_TESTER` only, while the relay's own restatement reads "MODE_EXECUTE inside MQL_TESTER". Conjoining `InpMode == MODE_EXECUTE` makes the phrase literal and stops an alert-only tester run from emitting a `NO_POSITION` row on every BREAK and DAY_CLOSE verdict. S5 runs `InpMode 1` and RECON59 printed real fills, so the graded run is unaffected either way.

### Grading bar restated

- 8/28: `MTCLOSE leg=POI_BODY_BREAK ok=1` with retcode at bar 11:40, close near 1.16439, and the 17:00 stop fill (`order performed buy 2.38 at 1.16510`) absent from the segment.
- 9/4: `MTCLOSE leg=DAY_CLOSE ok=1` with retcode at bar 23:55, flat near 1.16093, and the 9/7 target fill (`order performed sell 0.57 at 1.16307`, deal at 1.16302) absent.
- 9/1 take plus 5 other takes identical bars and entries; **lots re-derived and graded second**, downstream of the changed balance path.
- 9/4-invalid still refused at S5; `MTCOLLISION` 0; `vDAY` field present on EXITVERDICT; zero `MTCLOSE` rows carrying SL, TP, HTF, or CANCEL legs; spread tolerance on fills at the bar-granularity standard already on record for the 11:35-versus-11:40 join.

G3 wording correction to fold with D2: `MTCLOSE` is a `PrintFormat` family, not an alert kind. The alert inventory stays SIGNAL / EXIT / HEADS-UP / STAND-DOWN exactly as today, and G3's "alert kinds ... MTCLOSE-family only" should move `MTCLOSE` into the print-family clause so the acceptance does not imply a new alert kind that would itself read as an R-e delta.

---

## What clears on v2

Nothing structural. All three defects are in the twin's presentation, and two of them share one cause worth fixing at the process level: the edit set is headed "exact verbatim" but only E1 pastes its new block. E2-E7 resolve by reference to labels (`Edit A/B/C/D`, `Edit 2/3`) that do not match the filed labels of the answer they adopt (Q2 was Edits 1-5 of 5, Q3 was Edits 1-3 of 3). D1 and D3 are both label-resolution slips. Paste all seven new blocks verbatim in the v2 twin and STAGE-1's exact-diff gets a self-contained source.

On the folded arithmetic: the recount is right and the drift was mine. My v259 Q2 verdict line said +65 while my own table totalled +64. The point is moot under the restructure, which legitimately recomputes to +52 (10+13+16+13), and +52 +54 = +106 against 11330 gives 11436 as claimed. S3's machine recount governs.

Two residuals to add to the watched list before the run, neither blocking:

- **Single-slot overwrite.** The record holds one (line, dir, session, day) tuple. A second eviction in the same session overwrites the first and un-suppresses that line. DIV_FALLBACK is 9 across the window, so two in one session is plausible but unproven. Graded join: any (session, day) carrying `EVICTSUPPRESS` more than once, checked against a later `ANCHOR_ELECT action=SEED` for the earlier tuple.
- **C4 transfer admission.** Already named in the packet as the opposite-dir residual; it stays watched by `POIREPLACE` and `SIDE1C_PREEMPT` set-diffs outside 9/1, and it is the reason direction stays in the key (W6c's Yearly-POC SHORT seed must survive).

Verification split honored: I judged the pasted twin and fence table only. Every count above is read from section 3 as given, and the three declaration-order conditions in asserts 3, 9, and the `g_trade` note below are inferences from spliced usage, not disk facts. On `g_trade`: fence `PositionClose 0` means the close surface is never exercised on the current tree, so S1 should also assert `g_trade`'s declared type exposes `PositionClose` and `ResultRetcode` rather than leaning on the `Buy`/`Sell` surface alone. 

## V260-RESQUAT-CLEAR END OPUS (verbatim close; filed whole 1x this turn, novel inbound)

## V262-RESQUAT-CLEAR3 OPEN OPUS (his carry, relay v262 clearance ask, filed whole 1x)

Opus:
## Independent recount first (the v261 halt item)

Counted mechanically from the pasted literals in section 2, one NET convention (new-site lines − old-site lines):

| Edit | old | new | NET |
|---|---|---|---|
| E1 | 1 | 11 | +10 |
| E2 | 6 | 19 | +13 |
| E3 | 3 | 19 | +16 |
| E4 | 7 | 20 | +13 |
| E5 | 1 | 49 | +48 |
| E6a | 1 | 1 | +0 |
| E6b | 1 | 1 | +0 |
| E7 | 0 | 5 | +5 |

Q2 = +52, Q3 = +53, combined **+105**, post 11330 → **11435**. Every figure agrees with the packet. The v2 arithmetic defect is repaired; E2's "print is 3 lines" and E5's "1 blank + 47 + 1 retained header" both check out against the pasted text. The `EVICTSUPPRESS bar=` vs `EVICTSUPPRESS_FIRE sess=` delimiter repair also holds — the ARM search string cannot match a FIRE row.

Both halves still halt, on different grounds.

---

## Q1. Re-squat half (E1–E4, +52)

**Q1 verdict: not cleared, because (a) G2's `EVICTSUPPRESS_FIRE == take count` is an identity the pasted E2 code cannot produce, (b) E4 indexes `g_lineCode[s4e_line]` unguarded, which can abort the run, and (c) the day key is written and compared through two different expressions.**

The edit set itself is sound — capture-before-abort is correct, the read gate returns into a free slot, the globals sit outside `ResetSequence`'s clear set by construction, and `MarkSessionUsed(` at 3 hits (2 calls + 1 def) means FIRE covers both SIGNAL paths. The three items below are all pre-build repairs at zero run cost.

### Rules

- **R-a (one-take-per-session):** held — FIRE clears only after `g_sessionUsed_*`/`g_sessionUsedDay_*` are set in E2, and G2 carries the explicit R-a item (SESSION_LIMIT row, never a new PRE-SEND).
- **R-b (no timing rules):** held — E3's EXPIRE arm is a calendar day-key mismatch ("no timer, no bar count"), and E4 keys on `TC_DayStart`, not elapsed bars.
- **R-c (R floor + replicate-all):** held for the filed case under the S5-refused RULING, but the tuple is (line, dir, session, day), so a later *independent* valid setup on the same tuple is also suppressed. That exposure is not in the named-residuals list (which carries only C4 transfer admission and single-slot overwrite). Add it as a named residual.
- **R-d (detection walk untouched):** held — E3 only *reads* `PoiRetestResult`; no walk body is edited, and S1 assert 5 pins signature AND body hash pre/post.
- **R-e (alert-only demo bounds):** not engaged by E1–E4; no order surface is touched in this half.

### STAGE-1 asserts restated as checkable conditions

1. Pre-hash equals `15A41634798A9307D2D38EB631946F1BCCDD07171544C053F986B9416A2E7739` / 622631 B / 11330 lines, or a DIAGNOSED successor. Never assumed.
2. One hit per exact edit anchor: `bool SessionAlreadyUsed` = 1, `void MarkSessionUsed` = 1, `branch=RETEST inWin=1` = 1, `s1g_legDir = pr.isLong` = 1, `squatter GC` = 1. All five confirmed in the fence table.
3. Identifier availability — **the filed list is incomplete for this half.** `g_anchorLine`, `g_dir`, `g_sessionAtEntry`, `pr.topLine`, and `barShift`-in-scope-at-C8 appear only in new text and are absent from both the S1 list and the fence table. Add all five as S1 rows before apply.
4. Char-code assert every OLD anchor (E1 one line, E2 six lines, E3 three lines, E4 seven lines).
5. Detector signature and body/shared-walk hash identical at S1-pre and S3-post.
6. Buffers: declaration VALUE 48, binding census identical pre/post (`FlowLogic SetIndexBuffer(48` = 0 confirms no 49th binding).
7. `MarkSessionUsed(` call count == 2 at @10160/@10253, def excluded, 3 total hits. Fence confirms 3.
8. `ENUM_SRJ_DIR`, `ENUM_SRJ_SESSION`, `DIR_NONE`, `SESSION_NONE` declared above EA 1803. Presence is fenced; the *ordering* claim is gate-only and stays gate-only.
9. E4 capture lines precede the `GoAbort` line — satisfied by the pasted block (lines 7–9 before line 10).
10. Scope E1–E4 only, NET +52, post-site counts 11/19/19/20.

### Repairs owed

- **G2 identity.** FIRE prints only when a record is armed *and* `sess`/`today` match. A take in a (session, day) with no prior eviction emits no FIRE row, so the true relation is `EVICTSUPPRESS_FIRE ≤ EVICTSUPPRESS(ARM) count`, with equality only against takes that fall inside an armed (session, day). Restate the bar that way in both Scope and G2, or the grade halts on a bar the code was never able to meet.
- **Array bound.** `g_lineCode[s4e_line]` in the ARM print is unguarded; `s4e_line = g_anchorLine` at a `GoAbort` path. If it is ever −1, MQL5 raises array-out-of-range and the tester run terminates — a full 90-minute spend lost. Guard with `s4e_line >= 0 && s4e_line < POI_NLINES` (both identifiers fenced), or add an S1/S2 assert that `g_anchorLine` is always valid at the C8 branch. Same guard question applies to `g_lineCode[pr.topLine]` in E3. E2's FIRE print is already safe behind `g_evictSuppressLine >= 0`.
- **Day-key expression.** E3 compares `TC_DayStart(barTime)`; E4 writes `TC_DayStart(iTime(_Symbol, PERIOD_CURRENT, barShift))`; E3's own new print uses the `iTime` form while its old anchor uses `barTime`. Pick one expression for the key and assert the two are the same instant at the E3 site. If they diverge, `RESEED_BLOCKED` silently never fires and G2's `>= 1 on 9/1 16:55-bar` fails only after the run is spent.

---

## Q2. Exit-executor half (E5–E7, +53)

**Q2 verdict: not cleared, because the E5 result `PrintFormat` is malformed (8 specifiers, 7 arguments, scrambled order), and `vDAY` — which E6b and E7 both depend on — is nowhere proven to exist.**

### Rules

- **R-a:** held — MTCLOSE closes a broker position; it never re-arms a session or emits a PRE-SEND.
- **R-b:** held — the close fires on the BREAK/DAY_CLOSE verdict at the `nextOpenPx` instant, with no timer or bar-count condition.
- **R-c:** held — no setup validity, R floor, or seed path is touched; lots are explicitly graded second in Scope and G4.
- **R-d:** held — E5 is a new function above EA 11095, E6a/E6b are format/argument lines, E7 is a call site. No detection-walk region is in scope; S1 assert 5 still pins it.
- **R-e (amended, tester-closes-only):** held *in the pasted gate*, and this is the strongest part of the half — see the called check below. Live remains alerts-only through the SKIP-NO-SEND return.

### Double gate restated as the called check

An order is sent only under the conjunction. The pasted guard is the negation of that conjunction:

```mql5
if(InpMode != MODE_EXECUTE || MQLInfoInteger(MQL_TESTER) == 0)
  { /* MTCLOSE ... action=SKIP-NO-SEND mode=%d tester=%d */ return false; }
```

so `send ⟺ (InpMode == MODE_EXECUTE) ∧ (MQLInfoInteger(MQL_TESTER) != 0)`. Correct as filed, and the skip row prints both operands, which makes the gate auditable in the log rather than assumed. Live and non-tester paths reach `return false` before any `g_trade` call. One gap: **S5 runs `InpMode 1`, and nothing asserts that `MODE_EXECUTE` evaluates to 1.** The fence gives 2 occurrences of the token, not its ordinal. Assert 4 already checks a declaration VALUE for buffers; add the same class of assert for `MODE_EXECUTE` against the S5 setting, or the gate skips silently and G4 grades zero fills after 90 minutes.

### Grading bar restated

- 8/28 **11:40** broker close near **1.16439**, prior stop fill at 1.16510 **gone**; `MTCLOSE leg=POI_BODY_BREAK ok=1 retcode=<recorded>`.
- 9/4 **23:55** flat near **1.16093**, prior target fill at 1.16302 on 9/7 **gone**; `MTCLOSE leg=DAY_CLOSE ok=1 retcode=<recorded>`.
- Zero SL/TP/HTF/CANCEL_BIAS legs reach a close; `MTCOLLISION` 0.
- Bars and reasons first; **lots re-derived downstream and graded second**; DAY_CLOSE counts re-derived; spread tolerance per the bar-granularity standard.
- MTCLOSE joins as a **print family in the print clause only** — never an alert kind; alert kinds stay SIGNAL/EXIT/HEADS-UP/STAND-DOWN. `vDAY` field present in the MTEXIT row.
- Exit figures stay target figures until fills print.

### Halt items

**1. The result print cannot be graded as written.** Format string carries 8 specifiers:

```
bar=%s leg=%s ticket=%I64u magic=%d ref=%s action=%s retcode=%d fill=%s
```

The argument list supplies 7: `TimeToString(...)`, `leg`, `ticket`, `(int)pmagic`, `(int)ok`, `(int)g_trade.ResultRetcode()`, `DoubleToString(refPx, _Digits)`. Past `magic=%d` everything shifts: `ref=%s` receives `(int)ok`, `action=%s` receives the retcode, `retcode=%d` receives a string, and `fill=%s` receives nothing. Either S4 fails the 0-warnings bar on the printf-style check, or the row that G3 and G4 are graded from is corrupt — and `retcode` is named evidence item (b) in the run-cost section. The other two prints in E5 are well-formed, which is what makes this look like a transcription slip rather than a design question. Repair, restate the count, and re-assert: E5 new site stays 49 lines only if the fix is argument-side, not line-side.

**2. `vDAY` is unproven.** The fence row `vDAY=%d | 0` proves the *format field* is absent — it is equally consistent with the variable not existing at all. There is no fence row for `vDAY` as an identifier, and it is absent from the S1 identifier list, yet E6b inserts `(int)vDAY` and E7 branches on `vBREAK || vDAY`. Both edits fail to compile if the symbol is not in scope at those sites. `vBREAK` is fenced at 12 and listed; `vDAY` needs the same treatment before apply.

**3. `GetCorrectFillingMode` is unfenced.** E5 calls it with `_Symbol`; it appears in neither the fence table nor the S1 identifier list. Its existence, signature, and return type feeding `g_trade.SetTypeFilling()` are all unproven.

**4. E6b's old anchor is unfenced.** `(int)vHTF, (int)MT_EXIT_SCOPE,` has no fence row, and `MT_EXIT_SCOPE` has none either. E6a's anchor is fenced at 1; E6b's uniqueness is asserted, not measured. Add the row.

**5. E7 is not an exact verbatim diff.** The edit-set header promises exact verbatim old/new, but E7 supplies new text only and describes its old anchor in prose ("between the MTEXIT PrintFormat statement and `if(InpDebugLog) MtLifeEmit();`"). The trailing anchor is fenced unique at 1, which makes placement determinable, but the leading anchor is not pasted, so STAGE-1 cannot char-code it. Paste both anchor lines.

**6. `bar=` prints `TimeCurrent()`, not the bar time,** while the grading bar is stated in bar terms (11:40, 23:55) and the comment promises "the same nextOpenPx instant the paper leg records." Align the printed time with whatever the paper MTEXIT row prints, or G4's timestamp match becomes an interpretation argument after the run rather than a check.

---

## What is owed back

Two not-cleared verdicts, nine named repairs, none of which require re-cutting the edit structure — E1–E4 stand as logic, E5's gate stands as filed, and the +105/11435 recount survives independent verification. Items Q1-1 (the FIRE identity) and Q2-1 (the malformed print) are the two that would otherwise corrupt a grade after the spend; the rest are S1 assert rows and fence rows that cost nothing to add. Nothing builds, runs, or commits on this relay; the Luna key and his run word remain owed regardless. 

## V262-RESQUAT-CLEAR3 END OPUS (verbatim close; filed whole 1x this turn, novel inbound)

## V263-RESQUAT-CLEAR4 OPEN OPUS (his carry, relay v263 clearance ask; pasted text follows verbatim)

## Q1. Re-squat half (E1–E4, +52)

**Q1 verdict: the re-squat half is cleared to build**, conditional on the four text-only S1 additions named under "Owed before apply" (no code change, no budget change, +52/11382 stands).

### Rules held, by packet line

- **R-a (one-take-per-session, marks SIGNAL-only)** — E2 installs the FIRE arm *inside* `MarkSessionUsed` only; no new call site is added, and `MarkSessionUsed( | 3` (S1 item 7: 2 calls @10160/@10253 + def) pins that. G2's R-a item holds the behavior: post-exit same-session candidate yields a SESSION_LIMIT row and never a new PRE-SEND.
- **R-b (no timing rules)** — the E3 gate keys on `(pr.topLine, rsq_dir, sess, TC_DayStart(barTime))` and nothing else; EXPIRE is a day-key mismatch fall-through, stated verbatim in the E3 comment ("no timer, no bar count (R-b)"). No bar counts, no elapsed-time term anywhere in E1–E4.
- **R-c (R floor 1.0 + replicate-all)** — the suppressed candidate is the S5-refused one, which the R-c RULING removes from the valid set, so no valid setup is suppressed by construction. Entry sizing, inputs, and the R floor are untouched. The residual is named, not hidden: "R-c tuple residual (later independent valid setup on the same tuple suppressed — watched via take-join, halt on valid-take loss)." G2's "other takes identical bars/entries" plus "9/4-invalid still refused" is the replicate-all check.
- **R-d (detection walk untouched)** — E3 inserts strictly *after* `DetectPoiRetest(barShift, pr)` returns and reads only `pr`; no edit lands inside the detector or the shared walk. S1 item 5 asserts signature **and** body/shared-walk hash unchanged, pre at S1 vs post at S3.
- **R-e (alert-only demo bounds, tester-closes-only)** — E1–E4 send no order, touch no position, and emit only three PrintFormat rows (EVICTSUPPRESS_FIRE, RESEED_BLOCKED, EVICTSUPPRESS). Held trivially.

### STAGE-1 asserts restated as checkable conditions

| # | Condition | Status from pasted text |
|---|---|---|
| 1 | EA pre-hash == `15A41634…E7739` / 622631 B / 11330 lines, or a DIAGNOSED successor | owed on disk |
| 2 | One hit per exact anchor: `bool SessionAlreadyUsed`, `void MarkSessionUsed`, `branch=RETEST inWin=1`, `s1g_legDir = pr.isLong`, `squatter GC` | all = 1 in section 3 ✓ |
| 3 | Char-code assert each OLD block incl. leading whitespace (E1 1, E2 6, E3 3, E4 7 lines) | owed on disk |
| 4 | Identifier availability for every symbol new code references | **incomplete** — see addenda |
| 5 | Detector signature + body/shared-walk hash identical S1 vs S3 | owed post-build |
| 6 | `indicator_buffers` VALUE 48 + binding census identical; `SetIndexBuffer(48` stays 0 | fenced 1 / 0 ✓; four plain globals are not buffers ✓ |
| 7 | `MarkSessionUsed(` == 3 (2 calls + def) | fenced 3 ✓ |
| 8 | `ENUM_SRJ_DIR`, `ENUM_SRJ_SESSION`, `DIR_NONE`, `SESSION_NONE` declared **above** EA 1803 | counts prove existence (56/13/15/6), not position — position check owed |
| 9 | The three `s4e_*` captures precede `GoAbort(ABORT_DIV_FALLBACK, g_state);`, the four record writes + print follow it | verified in the E4 literal ✓ |
| 10 | `g_anchorLine = -1` writers exactly {976 decl, 6274 ResetSequence→IDLE, 7787 R2→IDLE}, none reachable holding S5 | static, owed at S1 |
| 11 | Scope E1–E4 only; literal recount 10+13+16+13 = +52 | recount reproduced ✓ |

Recount reproduced line-by-line on the pasted literals: E1 new 11 / old 1 = +10; E2 new 19 / old 6 = +13; E3 new 19 / old 3 = +16; E4 new 20 / old 7 = +13. **+52 confirmed.** All three new PrintFormat calls are spec/arg balanced and type-aligned (3/3, 5/5, 5/5, every spec `%s` against a string-returning expression).

### Owed before apply (text-only, budget unchanged)

1. **Fence rows for five unfenced identifiers referenced by new code:** `pr.topLine`, `DIR_LONG`, `DIR_SHORT` (E3), `g_dir`, `g_sessionAtEntry` (E4). `pr.topLine` is the sharp one — it is a project struct member, appears in no fence row and in no S1 identifier list, and a name drift there fails E3 at S4. The v262 "S1 identifier gaps" item is only partly repaired.
2. **GoAbort re-entry assert:** `GoAbort` / `ResetSequence` must not call back into the IDLE seed block, otherwise the ARM write lands *after* a re-entered seed evaluation on the same bar and the 9/1 block slips. Static, one read.
3. **Upper-bound note on the index invariant:** item 10 licenses the unguarded `g_lineCode[s4e_line]` in E4 on the low side only; add `0 <= g_anchorLine < POI_NLINES` while holding S4. E2 and E3 are already guarded (`>= 0`, `pr.topLine`).
4. **Paste normalization:** in the twin, E4's `g_evictSuppressDay = TC_DayStart(barTime);` is rendered at 2-space indent against its three 12-space siblings (same artifact recurs on several E5 lines). Whitespace-irrelevant to the compiler, but it breaks the exact-verbatim discipline and any post-build diff. Normalize to sibling indent at S2; no line-count effect.

The FIRE-identity repair is correct as re-cut: `EVICTSUPPRESS_FIRE <= ARM count` with equality only for takes in armed sessions is the strongest statement the code can produce, since a record can EXPIRE by day-key mismatch with no FIRE row. v4's equality claim was unproducible; v5 fixes it.

## Q2. Exit-executor half (E5–E7, +53)

**Q2 verdict: not cleared** — because the double gate's `InpMode != MODE_EXECUTE` comparison is run-blind at S4 and the ordinal binding MODE_EXECUTE to S5's `InpMode 1` is asserted nowhere in the fence table or in S1, and it appears in neither the v3→v4 nor the v4→v5 repair map despite being a named v262 halt item.

### Rules held, by packet line

- **R-a** — E5–E7 never call `MarkSessionUsed`; a broker close marks no session. Held.
- **R-b** — E7 fires off the existing verdict booleans `vBREAK || vDAY` at the existing evaluation instant; no timing term is introduced.
- **R-c** — exits change realized outcomes, so lots re-derive downstream; the packet grades bars first, lots second (Scope + G2 + G4) and adds no input and no sizing change. Held as stated.
- **R-d** — the helper sits above EA 11095 and the call inside the managed-trade evaluation; the detector is untouched, with S1 item 5 confirming post-build. Declaration-before-use also holds (helper ~11095 precedes the E7 site >11160).
- **R-e (amended: alert-only demo bounds, tester-closes-only)** — structurally correct and fail-safe in the live direction: any mode mismatch routes to SKIP-NO-SEND, so live cannot send. The exposure is the opposite direction — a mismatch silently makes the whole run alert-only.

### The double gate as the called check

```
if(InpMode != MODE_EXECUTE || MQLInfoInteger(MQL_TESTER) == 0)  -> SKIP-NO-SEND, return false
```

De Morgan clean: a send requires `InpMode == MODE_EXECUTE` **and** `MQLInfoInteger(MQL_TESTER) != 0`, both evaluated before any `PositionClose`, with live staying alerts-only. The idiom is precedented on the tree (`MQLInfoInteger(MQL_TESTER) | 2`).

### Grading bar restated

8/28 BREAK close at 11:40 near 1.16439 with the 1.16510 stop fill gone; 9/4 DAY_CLOSE flat at 23:55 near 1.16093 with the 9/7 1.16302 target fill gone; other exits identical bars/reasons; DAY_CLOSE counts re-derived; lots graded second; MTCLOSE print-family joins on `ticket`/`magic`/`retcode` with `action=1` on both legs and zero SL/TP/HTF/CANCEL legs; spread tolerance per bar-granularity standard.

### What has to land before Q2 clears

1. **MODE_EXECUTE ordinal (the halt).** `MODE_EXECUTE | 2` means one declaration plus exactly one existing comparison. Add an S1 assert that reads the enum declaration and pins the ordinal to 1, and that names the single existing comparison as the entry send gate that passed at RECON59's `InpMode 1`. One grep. If the ordinal is not 1, E5 takes SKIP-NO-SEND for the full 90 minutes, G4 fails, and all three novel-evidence claims (b) and (c) die with a clean build and a clean compile — the exact failure S4 cannot see.
2. **`vDAY` identifier fence.** `vDAY=%d | 0` proves the *format fragment* is absent; it does not prove the variable exists. E6b and E7 both reference `vDAY`, and S1's identifier list names `vBREAK` but not `vDAY`. The v262 verification puts the bool decl at EA 11160 in prose only. One fence row closes it.
3. **E7 anchor pair, both halves.** Only `if(InpDebugLog) MtLifeEmit(); | 1` is pasted and fenced; the MTEXIT PrintFormat half is prose-only and unfenced. The single unique anchor is enough to *place* the insert deterministically, so this is not the halt, but S1 item 3 ("char-code assert every OLD anchor") is not satisfiable for E7 as written. Paste the MTEXIT statement literal or drop it from the anchor claim.
4. **`SetExpertMagicNumber` persistence.** E5 mutates shared `g_trade` state. `InpMagicBase | 2` and `SetExpertMagicNumber | 1` read consistently as one input declaration plus one parameterized call in the entry send path, which would make the mutation re-set before each entry and therefore safe. That is inference from counts, not proof. Assert that the existing call site executes before each `g_trade.Buy`/`g_trade.Sell`, not once at init; if it is init-only, a London close (+1) poisons the next NYAM entry's magic and the magic-joined census in G2/G3 degrades silently.
5. **G3 under-specification for non-`ok` MTCLOSE rows.** The bar predicts two `ok=1` rows and zero SL/TP/HTF/CANCEL legs, but says nothing about expected `NOTHING-TO-CLOSE` or `SKIP-NO-SEND` counts. A vDAY verdict landing on a bar where the broker already took TP/SL produces a legged MTCLOSE row that is neither an `ok=1` join nor a forbidden leg. State the expected count (0 if the invariant makes it unreachable) so the grade cannot be argued after the fact.

Items 2–5 are text-only. Item 1 is text-only as well; it is the halt because its failure mode is invisible to the build and spends the whole tester budget.

### Arithmetic if Q1 builds alone

Q1-only: +52 NET, expected post-build **11382 lines** (not 11435), S3 recount governs. E6a/E6b/E7 unapplied means `vDAY=%d` stays 0 and `MtCloseBrokerPosition` stays 0 post-build; S1 items 10 and 12 and the E5–E7 identifier subset become non-applicable; G1's budget line reads +52/11382; G3's MTCLOSE family and vDAY field and G4's exit rows drop out of the graded set, leaving G1, G2, and G3's non-exit count-identity against RECON59. G2's 9/1 take, suppression census, and election set-diff are all gradeable on the Q1-only tree, so the re-squat evidence (a) survives the Q2 halt intact.

## Verification boundary

I judged the pasted text only, per section 6. Reproduced here: all four Q1 and all three Q3 line counts from the literals, the +52/+53/+105 arithmetic against 11330→11435, every PrintFormat spec/arg pairing and type match across all six new prints, the De Morgan form of the double gate, anchor uniqueness against the fence table, and new-symbol collision-freedom (EVICTSUPPRESS, RESEED_BLOCKED, EVICTSUPPRESS_FIRE, g_evictSuppressLine, MtCloseBrokerPosition, MTCLOSE, PositionClose all 0). Not verifiable from text: the EA pre-hash, the twin digest `8FB7CC0E/20791/231`, all fence counts as machine-derived, anchor line positions, enum declaration positions and ordinals, and every claim about code regions riding labeled from prior relays. Those stay builder-disk and his-eyes.

No build, run, or commit is authorized by this answer; the Luna key and his run word remain owed.

## V263-RESQUAT-CLEAR4 END OPUS (verbatim close; filed whole 1x this turn, novel inbound)

## V264-RESQUAT-CLEAR5 OPEN OPUS (his carry, relay v264 clearance ask; pasted text follows verbatim)

## Verdicts

**Q1 CLEAR** — conditional on four text-only S1 additions (below, +0 code lines). If any of the four cannot be pinned pre-build, Q1 reverts to NOT-CLEAR.

**Q2 NOT-CLEAR** — two items: E5 position-selection identity (the either-magic scan vs. the asserted single-match invariant), and E6a/E6b having no anchor row, no line number, and no in-scope proof for `vDAY`.

---

## Q1 — re-squat half (E1–E4, +52)

Independently recounted from the literals on the page: E1 = 6 comment + 4 decl + 1 retained = 11 new vs 1 old (+10). E2 = 19 new vs 6 (+13). E3 = 19 new vs 3 (+16). E4 = 20 new vs 7 (+13). Sum +52. Combined with Q2's +53 → +105, post 11435. Arithmetic agrees with section 3's budget row.

The v6 delta is as declared: E4's change is whitespace-side only, and the absorbed asserts (13–18) add no lines.

Logic checks that pass on the page:

- E3's scope is self-proving: the retained old anchor already uses `sess`, `barTime`, `barShift` in the SEEDDIAG print, so every identifier the new gate needs is in scope at EA 7730.
- E2's FIRE arm cannot fire on an unarmed record (`g_evictSuppressLine >= 0` guard), and cannot fire on a stale day (`today == g_evictSuppressDay`).
- E4 captures before `GoAbort` and writes after it; assert 14 (GoAbort body EA 6296-6330 = LogAbort/LogState/ResetSequence only) closes the interleave question.

### Conditions (text-only, S1 additions)

1. **`barTime` / `barShift` in scope at E4 (EA 8802-8808).** The new E4 lines use both, and the old anchor block shows neither. The file demonstrably varies its naming — E1's own anchor is `SessionAlreadyUsed(ENUM_SRJ_SESSION sess, datetime barTimeServer)`, not `barTime`. S1 (2) is an identifier *census*, which does not establish a local's presence inside one function. Failure mode is a compile stop at S4, i.e. one burned build. Pin it with a fence row (one-hit for each token inside the C8 function body) or cite the earlier ledger row if it was already verified in v259/v260.
2. **`barTime` == `iTime(_Symbol, PERIOD_CURRENT, barShift)` at E3 and E4.** Both blocks key the day on `TC_DayStart(barTime)` but label the printed bar with `iTime(..., barShift)`. If those disagree, the ARM/SKIP rows carry a different bar than the record's day key, and G2's `RESEED_BLOCKED >= 1 on 9/1 16:55-bar` grades against the printed term. Section 3 pins `barTime`-in-scope at E7 only; there is no equivalence pin at E3/E4.
3. **Direction-convention identity between write site and read site.** E4 stores `g_dir`; E3 compares `pr.isLong ? DIR_LONG : DIR_SHORT`. The gate requires those two to encode the same sense. The page gives `DIR_LONG=1 / DIR_SHORT=-1` (EA 226) and the existing `s1g_legDir = pr.isLong ? 1 : -1`, but never the line where `g_dir` is assigned during the sequence. If the conventions are inverted, the gate never matches, RESEED_BLOCKED never prints, and the miss surfaces only after the 90-minute run.
4. **Extend assert 17 from index-validity to record-validity.** Assert 17 bounds `0 <= g_anchorLine < POI_NLINES` while holding S4, but not `g_dir != DIR_NONE` and `g_sessionAtEntry != SESSION_NONE`. An ARM with `SESSION_NONE` is a silent dead record: E2's FIRE can never match it (call sites pass real sessions), E3's gate can never match it, and yet the ARM row still counts toward G2's `EVICTSUPPRESS count == DIV_FALLBACK S4-origin count`. That converts a pre-build catch into a post-run G2 halt.

---

## Q2 — exit-executor half (E5–E7, +53)

Recount confirms E5 new site 49 (1 blank + 11 comment + 36 body + 1 retained header) vs 1 old = +48; E7 8 retained + 3 comment + 2 code = 13 vs 8 = +5; E6a/E6b +0. Q2 = +53.

**The v6 E7 repair holds.** I checked it against section 4 rather than the prose: `vDAY` is set at one site only (EA 11266) under `!vSL && !vTP && !vBREAK && !vHTF` (4b), so `exitReason == MT_EXIT_DAY_CLOSE` implies `vBREAK == false`, and `exitReason == MT_EXIT_POI_BODY_BREAK` requires `vBREAK == true` via the chain at 11288-11292. The surviving bare-`vBREAK` label ternary therefore cannot desync from the gated reason. An SL-winning bar with `vBREAK` true no longer reaches the call. Astra's v263 halt item is closed as stated.

Also verified as safe rather than assumed: E5 mutates shared `g_trade` state (`SetExpertMagicNumber`, `SetTypeFilling`) and never restores it, but the entry path re-sets both per entry — magic at EA 10214 (assert 15, "never init-only") and filling at EA 10215 (fence row `GetCorrectFillingMode | 2 | def EA 1656 + use EA 10215`). No leak.

### Halt item 1 — E5 target selection is not tied to the leg being closed

The scan accepts `m == InpMagicBase + 1 || m == InpMagicBase + 2` (either session), takes the first match walking down from `PositionsTotal()-1`, and carries no ticket, no direction test, and no time test. The header comment justifies this with "the single-record invariant bounds the scan to one match."

That invariant is the *paper* record. The premise of this entire half is that broker state diverges from paper state — X1 and X2 exist precisely because the position outlived the paper close (verdict 1.16439 on 8/28 vs. stop fill 1.16510; verdict 1.16093 on 9/4 vs. target fill 1.16302 on 9/7). So the paper-side single-record invariant cannot be used to bound a broker-side scan. Nothing on the page establishes at-most-one position with those magics: R-a permits one take per session, the magic scheme exists specifically to distinguish two sessions' positions, and no shown control flow blocks a second entry while a position is held.

Consequence is not caught by the safety nets. G3's `NOTHING-TO-CLOSE expected 0, any row HALTS` catches the empty case; it does not catch selecting the *wrong* position, which prints `action=1 retcode=<done>` and grades as a success. This is the same shape as the v263 halt: an exclusion asserted in prose but not established by the shown control flow, at the one site in the packet that sends an order.

Cheapest repairs, in order of strength: latch the entry ticket into `g_mtrade` at the entry path and close by ticket; or add `POSITION_TYPE` match against `g_mtrade.dir` plus `POSITION_TIME >= g_mtrade.fillBarTime` to the scan; or, if the at-most-one condition really is structural, prove it on the page (the entry-gate line that refuses a second entry while `g_mtrade.active`) and the proof carries the existing code unchanged.

### Halt item 2 — E6a/E6b have no anchor, no line, and no scope proof

Both edits are scribed from prose with no filed literal, which the packet discloses. What it does not supply is anything for STAGE-1 to act on: section 3 has no fence row for `"vTP=%d vBREAK=%s vHTF=%d scope=%d "` or for `(int)vHTF, (int)MT_EXIT_SCOPE,`, no line number, and no statement of which function the print lives in.

That last one matters concretely. `vDAY` is a local declared at EA 11160 inside the managed-trade evaluator (fence row: decl 11160, set 11266, guard 11283, assign 11292). If the E6 anchor sits inside `MtLifeEmit()` — plausible, given the row family and that `MtLifeEmit()` is called at EA 11301 — then `(int)vDAY` does not compile, and S4 eats the build. "STAGE-1/S4 gate it" is true of the compile, not of the anchor: STAGE-1 can only one-hit an anchor that has a fence row.

Repair is text-only: a fence row with the one-hit count for each E6 anchor, the enclosing function name, and a scope assert for `vDAY` at that site. If the anchor turns out to be in a different function, E6 needs a parameter or a global, which is a code change and a fresh budget line.

---

## Ask A — defects, gaps, imprecisions

- **Fence row `nextOpenPx`** cites "in-scope: anchor-block EA 11294 use." Section 4a shows the 11294-11301 block, and `nextOpenPx` does not appear in it; the token appears at 11290 and 11292. The scope conclusion is still satisfiable from those lines, but the citation as written is wrong. Text-only fix: cite EA 11290/11292.
- **E1 and E3 comments claim an EXPIRE clear that no line performs.** E1: "cleared on FIRE ... or by EXPIRE (day-key mismatch at the read site)." E3: "EXPIRE arm: any mismatch falls through." Falling through does not clear. Post-mismatch the record stays armed with a stale day indefinitely. Gating stays correct (a stale day can never match), so this is a doc defect, not a logic defect — but it makes the record's lifetime undecidable from the comments, and it interacts with the named single-slot-overwrite residual.
- **Fence row `vBREAK | 12 | decl + sets + uses (set EA 11232)`** says "sets" plural while naming one line. Every other multi-position row (`vDAY`) enumerates. Low consequence given the label tie runs through the else-if chain, not the count, but the census is not decidable as printed.
- **`MarkSessionUsed(` pin is count-only.** Fence and assert 7 pin 2 calls at 10160/10253 plus the def. Neither states that both call sites are SIGNAL-consume paths. The FIRE arm now lives inside the function, so a non-SIGNAL call site would emit `EVICTSUPPRESS_FIRE` without a take and break G2's "equality only for takes in armed sessions" reading.
- **E4 print precedes nothing, but the ARM precedes the print.** `g_lineCode[s4e_line]` executes after the four globals are already written. If assert 17's invariant ever fails, the record is armed and then the print faults, which is the worst ordering of the two.
- **E3's early return also skips whatever sits between the gate and the seed** on the suppressed bar. G3's "downstream of the 9/1 take" exception will absorb any resulting census delta silently. Ask that any such delta be attributed by name rather than absorbed.
- **Whitespace fidelity of the twin is not confirmable from this page.** Inside E4, the `g_evictSuppressDay = TC_DayStart(barTime);` line carries a different line-prefix form than its four siblings, and several E5 lines do the same; section 4a shows ragged indent in a region marked byte-verified (`   if(vSL)` at 3 spaces vs. `    else if(vTP)` at 4). Since v6's whole E4 delta was "indent normalized," that claim is not demonstrated here. Consequence is cosmetic — every affected line is new-side, and the only whitespace-critical old anchor (E7) is char-code asserted — but either the transport mangled the twin, in which case the diff-0 row in section 3 is measuring something other than what I was shown, or the normalization did not happen.
- **`magic=%d` with `(int)pmagic`** truncates if `InpMagicBase` (EA 29) exceeds 32 bits. Nit; `%I64d` on the `long` is exact.
- **G3's `NOTHING-TO-CLOSE expected 0` has a named reachable path** worth pre-writing the diagnosis for: `vTP` is `tpBookedTouch`-driven (EA 11186-11187), not a raw price test, so a broker-owned TP can fill on a bar where `vTP` is false and `vBREAK` is true. The broker side is then already flat while `exitReason == BREAK`. The halt-on-occurrence rule handles it correctly; knowing the path in advance saves a cycle.
- **MTCLOSE `ref=` is the paper reference, not the realized fill.** Already handled by the rename-table note (fills join via retcode plus segment deals) and G4's spread tolerance. Noted only so the G4 join is not read as a price assertion.

## Ask B — better mechanisms

- **Ticket latch instead of a scan.** Add a ticket field to `g_mtrade`, write it at the entry path (EA 10214-10222, right where the magic is already set), and replace E5's loop with `PositionSelectByTicket(g_mtrade.ticket)`. Touches the `g_mtrade` struct decl, EA 10220/10222, and E5 lines 14-24 (net roughly -6 in E5, +3 elsewhere). Deletes halt item 1, the `MTCOLLISION` dependency, and the single-record prose entirely.
- **Label from one source.** Call `MtCloseBrokerPosition(MtExitName(g_mtrade.exitReason), nextOpenPx, barTime)` instead of the `vBREAK` ternary. +0 lines, touches the one E7 call line. The label then cannot desync from the gate under any future predicate change, rather than being safe only because of 4b's `!vBREAK` guard.
- **Reuse the direction already computed at E3.** Hoist the existing `s1g_legDir` above the gate and compare against it instead of introducing `rsq_dir`. Touches E3's new line 8 and the retained final line; removes one of the two direction expressions and shrinks condition 3 above to a single convention.
- **Guard E4's ARM on index validity** rather than resting on a static reachability assert: wrap the four writes plus the print in `if(s4e_line >= 0 && s4e_line < POI_NLINES)`. Turns a possible array-out-of-range tester abort into a diagnosable no-arm. Costs +2 lines against the +105 budget.
- **Either implement the EXPIRE clear or drop the claim.** Two lines in E3's non-matching path make the record's lifetime match the comments and make the FIRE/ARM census closed. Dropping the language from E1 and E3 is +0 lines and equally honest.
- **One struct global instead of four.** Folding line/dir/session/day into a single record struct at E1 shortens the E1 block, makes "not in ResetSequence's clear set" a one-line statement about one symbol, and makes the clear/arm operations single assignments at E2/E3/E4. Cost-neutral to slightly negative on lines; touches all four Q1 edits, so it is a v7 candidate rather than a v6 patch.

## V264-RESQUAT-CLEAR5 END OPUS (verbatim close; filed whole 1x this turn, novel inbound)

## V265-RESQUAT-CLEAR6 OPEN OPUS (his carry, relay v265 clearance ask; pasted text follows verbatim)

## Verdicts

**Q1 CLEAR** — re-squat half (E1–E4, +74), with four S1 gate deltas named below (all +0 code lines, all mechanical greps) and one new residual.

**Q2 NOT-CLEAR** — ticket-executor half (E5–E8, +64). One defect, Q2-H1 below: in the EA's default mode (`InpMode=0`, alert-only, the R-e posture) every paper BREAK/DAY_CLOSE exit now emits `MTCLOSE ... action=NOTHING-TO-CLOSE` plus `MTCLOSE_FAIL`, i.e. two halt-class rows as normal output. The repair moves literals and the budget, so it cannot ride as a gate delta. Everything else in Q2 reads clear; the re-cut is small.

Budget recount, mechanical from the literals, done independently here: E1 12−1=+11, E2 21−6=+15, E3 31−3=+28, E4 27−7=+20 → **Q1 +74 confirmed**. E5 39−1=+38, E6a/E6b +0/+0, E7 17−8=+9, E8a +1, E8b +1, E8c 20−5=+15 → **Q2 +64 confirmed**. Combined +138, post 11330+138 = **11468 confirmed**.

---

## Q2-H1 (the halt, stated exactly)

E7 carries no mode gate by design — the mode/tester gate lives inside E5. E7's insert fires on `exitReason ∈ {MT_EXIT_POI_BODY_BREAK, MT_EXIT_DAY_CLOSE}` alone (twin E7 new-span, gate line 4 of the insert).

In `InpMode=0` no entry is ever sent, so `g_mtrade.ticket` stays 0 (E8b init). E5's first branch is `if(ticket == 0 || !PositionSelectByTicket(ticket))` → prints `action=NOTHING-TO-CLOSE`, returns false → E7 prints `MTCLOSE_FAIL`. G3 says "any FAIL/ok=0/SKIP/NOTHING row HALTS for diagnosis", so the default mode manufactures halt rows on correct behavior, and the alert-only log family the council reads for evidence gains a new print pair the packet never promises (Q2 rule line promises only "live stays alerts-only"; E7's comment promises "paper MTEXIT/MTLIFE/EXIT rows print regardless" — not new MTCLOSE rows).

Same shape one step out: in live/demo with a real position latched, the helper reaches `SKIP-NO-SEND`, returns false, and E7 again prints `MTCLOSE_FAIL`. A deliberate no-send is reported as a failure.

Repair (two parts, both required):

1. E5: move the `InpMode != MODE_EXECUTE || MQLInfoInteger(MQL_TESTER) == 0` block **above** the ticket check, so a no-send mode reports `SKIP-NO-SEND` and never `NOTHING-TO-CLOSE`. Reorder only, +0 lines, but the literal changes so the byte-diff and S1 assert 12 text change with it.
2. Make the status tri-state so E7 can tell no-send from failure. Cheapest form: change `bool MtCloseBrokerPosition` to `int` returning `-1` no-send / `0` send-failed / `1` sent-ok (E5 signature line, the three `return` lines, twin rename-table row), and E7's consume becomes `int mtexecRc = ...; if(mtexecRc == 0) PrintFormat(... MTCLOSE_FAIL ...);`. Net line delta 0 on E5, 0 on E7, but `bool ok` / `return ok` / `(int)ok` in the success print need the rewording, and `action=%d` should then print `mtexecRc` or keep `(int)ok` from a retained local — state which, because G3's "action=1" term reads off that field.

Keep `NOTHING-TO-CLOSE` as a genuine halt row for the case it was written for: ticket nonzero but unselectable, and ticket zero **while** tester+EXECUTE (a latch miss). The printed `ticket=%I64u` already distinguishes latch-miss from broker-already-flat, so that half of the design is sound and should survive the re-cut.

G3 then needs one word: `MTCLOSE_FAIL expected 0` stays, `NOTHING-TO-CLOSE expected 0` stays, and the new `SKIP-NO-SEND expected 0` term keeps its S5 pin. No acceptance term is lost.

---

## Analytic ask A — defects, gaps, imprecisions

**A1. S1 assert (6) says "+137 NET"; every other total on the page says +138.** Section 2 S2 line, the Canonical-files line, the status line, the section 3 budget row and my own literal recount all give +138. The gate that runs before apply carries a total that is one line wrong, and "S3 recount governs" does not repair an S1 assert that will be compared by hand. One digit; must be fixed before S2, not after.

**A2. Line-index domain equivalence is unpinned — the third leg of the tuple.** E4 stores `s4e_line = g_anchorLine`; E3 compares `rsq_bit` built from `pr.topLine`. The direction leg is pinned (assert 22, S2ResolveLive pass-through EA 3949-3956 / write EA 7739) and the time leg is pinned (assert 21, caller EA 11315-11319), but nothing pins that `g_anchorLine` and `pr.topLine` index the same 0..POI_NLINES-1 domain. Section 3's `g_anchorLine = -1` writer census {976, 6274, 7787} covers only the sentinel writers; the assigning writers are nowhere on the page. Struct 4a's neighbouring comment `int anchorLine; // POI_BUF_*` is the reason this matters — if the anchor carries a POI-buffer ordinal rather than a line ordinal, E4 arms one bit and E3 tests another, and `g_lineCode[s4e_line]` mislabels the EVICTSUPPRESS row while it does it. Failure is audible (RESEED_BLOCKED 0 → G2 halts) but costs the build plus the 90 minutes. **Gate delta, new S1 assert 25:** census the assigning writers of `g_anchorLine` and show each derives from a `pr.topLine`-class line index, or show an existing `g_lineCode[g_anchorLine]` use on disk (that use alone settles it).

**A3. `g_sessionAtEntry`'s declared type is unpinned and the 0-warning gate depends on it.** E4 writes `ENUM_SRJ_SESSION s4e_sess = g_sessionAtEntry;`. Section 3 gives decl EA 975 and assert 16 gives its position, neither gives its type. The precedent one struct away (4a: `int sessionAtEntry; // ENUM_SRJ_SESSION as int`) is exactly the case that would make this line an implicit int→enum conversion, i.e. an S4 warning against a 0-warnings gate. **Gate delta:** pin the decl type at 975; if `int`, E4's line needs `(ENUM_SRJ_SESSION)g_sessionAtEntry` (+0 lines).

**A4. `magic`'s scope and declared type at EA 10236 are unpinned, and E8c prints it `%I64d`.** E8c reads `magic` twice (the loop filter, the ENTRY_TICKET print) at 10236+. Assert 15 pins the *computation* at 10170 and `SetExpertMagicNumber(magic)` at 10214; assert 19 pins the anchor block; no assert puts the local `magic` in scope at the E8c site, and no row gives its type. The packet pins `barTime`, `vDAY`, `nextOpenPx`-adjacent scope and the `s4e_*` scope but skips this one. If `magic` is `int`, `%I64d` is a width mismatch (MQL5 will not warn); if `ulong`, `%I64u` is the correct specifier and `%I64d` is the folded nit surviving in the wrong direction. **Gate delta:** pin `magic` decl line + type, and match the specifier to it.

**A5. E6a and E6b are not pinned to the same `PrintFormat` statement, and the failure mode is silent.** Assert 20 pins one hit each (11272, 11280), the enclosing function (EvaluateManagedTrade def 11105, next def OnTick 11311) and `vDAY` same-body scope (decl 11160). It does not pin that the format line and the argument line belong to one statement. MQL5's `PrintFormat` is variadic and not format-checked at compile time, so if they are two statements, S4 passes at 0 warnings and the run prints a corrupted row: `scope=%d` consumes `(int)vDAY` and the real `MT_EXIT_SCOPE` value falls off the end. G3's term is only "vDAY field present", which a corrupted row satisfies. The on-page evidence is good — the fragment's trailing `scope=%d ` pairs with the arg line's trailing `(int)MT_EXIT_SCOPE,`, and neither line is statement-terminal — but good is not pinned. **Gate delta:** assert the nearest `PrintFormat(` above 11272 and the nearest `);` below 11280 bracket both lines with no intervening statement terminator.

**A6. The E6a/E6b parentheticals are stale.** Both still read "scribed from Opus prose spec; no filed literal exists; STAGE-1/S4 gate it", while section 3 now carries both anchors as measured-this-turn (11272, 11280) and section 4f prints them. The provenance sentence contradicts the fence two sections down. Text only.

**A7. E7's insert is 9 lines, labelled 8.** The parenthetical reads "anchor-block retained byte-identical + 8-line verdict-gated insert with result consume"; the literal is 3 comments + `if` + `{` + `bool mtexecOk` + `if(!mtexecOk)` + the FAIL print + `}` = 9, which is what the header's `old 8, new 17, +9` and the budget row both require. Assert 12 inherits the wrong count if anyone reads the parenthetical as the gate term. Text only.

**A8. The twin overclaims that the scan is gone.** E5's header comment says "the entry-latched broker ticket E8 — never a symbol/magic scan", the rename-table row says "E5 either-magic scan → ticket-latch close", and section 4's reading paragraph says "the ticket replaces the scan". E8c *is* a symbol + magic scan with a `POSITION_TIME` tiebreak (11 lines, `PositionsTotal()` loop). What v7 actually did is move the scan from the close leg to the fill leg, where it is far more defensible — but the page should say that, because a seat reading the prose alone would file "scan eliminated" and a seat reading the code would file the opposite. Name it as relocated-and-justified, not eliminated.

**A9. The latch's soundness argument is not written down, and its one hole is unnamed.** The fill-time scan is sound for the reason the page never states: the just-opened position necessarily holds the maximum `POSITION_TIME` among same-symbol same-magic positions, and a tie needs two sends inside one second, which the one-record boundary (4d) and R-a forbid. The hole: if the send's position is already gone by the time the loop runs (instant SL inside the fill tick in the tester), the loop latches the newest *stale* same-magic position from an earlier day, and E5 later closes that one. G3's join term — "every MTCLOSE ticket == an ENTRY_TICKET ticket" — cannot catch this, because the stale ticket is the one ENTRY_TICKET printed; the join is self-consistent by construction. **Add a freshness term:** every `ENTRY_TICKET` ticket is one not seen in any prior `ENTRY_TICKET` row, and its count equals the `EXECUTED` count. Or take B1 below and the hole closes structurally.

**A10. E3's index fail-open is silent where E4's is audible.** `rsq_bit = (pr.topLine >= 0 && pr.topLine < POI_NLINES) ? ... : -1` leaves `rsq_blocked` false on a bad index, so a re-squat passes the gate with no row. E4's matching guard is explicitly designed the other way ("a dead record skips ARM (no row) so G2 audibly mismatches"), and the count term catches it. No G2 term catches an E3 fail-open. Cheap fix: print a `RESEED_BLOCKED ... action=INDEX-INVALID` row, or state the asymmetry as accepted. (Not a build risk — the `g_lineCode[pr.topLine]` print is reached only when `rsq_bit >= 0`, so the print itself is index-safe. That part is correct.)

**A11. The day key is the abort day, not the seed day.** E4 takes `s4e_day = TC_DayStart(barTime)` at the eviction bar. If an S4-armed sequence seeded on day N aborts on day N+1, the ARM keys `(session, N+1)` and suppresses a day-N+1 setup on that line/dir that was never evicted on N+1. Audible (a RESEED_BLOCKED row naming `evictedDay`, and a take-count delta vs RECON59), but it is a distinct false-suppression path from the named R-c tuple residual and should be named next to it rather than folded into it.

**A12. `MarkSessionUsed`'s time base is unpinned, and a G2 term depends on it.** E2's FIRE fires only when `today == g_evictDayLon/NY`, where `today = TC_DayStart(barTimeServer)`. Assert 7 pins the call count and that both sites (10160, 10253) are signal-consume paths; nothing pins what the two callers pass as `barTimeServer`. If either passes a different time base than E3/E4's `barTime` (assert 21's equivalence covers E3/E4/E8c only), the FIRE row can go missing and G2's `EVICTSUPPRESS_FIRE <= ARM count` / "FIRE without take HALTS" terms grade against a row that never printed. **Gate delta:** extend assert 21 to the arguments at 10160 and 10253.

**A13. Post-build writer census for the four new globals is absent.** E1's comment makes a load-bearing claim — "deliberately NOT in ResetSequence's clear set, records must survive the reset they ride" — and assert 14 only shows ResetSequence (6267-6294) is state-clear-only pre-build. Mirror the `g_anchorLine` treatment: assert post-build that the writers of `g_evictBitsLon/NY` and `g_evictDayLon/NY` are exactly the E1 decls, E2 FIRE, E3 EXPIRE, E4 ARM. Cheap, and it is the check that would catch a stray paste.

**A14. S1's identifier availability list is inconsistent about platform symbols.** `POSITION_TIME` is listed "(platform enum)" while `PositionsTotal`, `PositionGetTicket`, `PositionSelectByTicket`, `PositionGetInteger`, `PositionGetString`, `POSITION_SYMBOL`, `POSITION_MAGIC`, `MQLInfoInteger` and `MQL_TESTER` — all newly used by E5/E8c — are not. Harmless (builtins), but it makes the list look like a census when it is a sample.

**A15. Redundant select inside E8c's loop.** `PositionGetTicket(pi)` already selects; `!PositionSelectByTicket(pt)` re-selects. Correct, just two evaluations where one does, and it leaves the "selected position" state pointing at whatever the loop last touched — irrelevant here because E5 re-selects by ticket, worth knowing if anything is later appended after the loop.

**A16. Orphan exposure at MTCOLLISION is worth one sentence.** 4d replaces the paper record with `exitReason = MT_EXIT_REPLACED` and does not clear `g_mtrade.ticket`; the executor gate excludes REPLACED, so no wrong close happens, but the replaced record's broker position becomes unreachable to E5 until the next fill overwrites the latch. MTCOLLISION 0 is expected and any row halts, so this is a boundary note, not a defect — the scope line "the ticket re-latches per fill so the executor always targets the current record" is true but does not say the previous one is then unaddressable.

**A17. G3's NOTHING-TO-CLOSE term is internally two-voiced.** It says "expected 0" and, in the same clause, pre-diagnoses a reachable path producing it (broker-owned TP fills on a bar where `vTP` false and `vBREAK` true). That is honest but reads as a contradiction; write it as "expected 0; one known cause, if it prints, halt and attribute to the TP-while-BREAK path" so the grade cannot be waved.

---

## Analytic ask B — better mechanisms

**B1. Derive the position identity from the send result instead of scanning (E8c, 20 lines → ~6; removes A9 and A8 both).** The entry path already holds the exact identity at 10214-10222: after `g_trade.Buy/Sell`, `g_trade.ResultOrder()` is the opening order ticket and `g_trade.ResultDeal()` is the opening deal. In hedging the position ticket equals the opening order ticket, and the mode-independent form is `HistoryDealSelect(g_trade.ResultDeal())` → `HistoryDealGetInteger(deal, DEAL_POSITION_ID)`. Either way the latch becomes a direct read with no loop, no `PositionsTotal()` walk, no `POSITION_TIME` tiebreak, no same-magic ambiguity, and no dependence on the position still being open when the latch runs. Touches: E8c only (drop the loop, keep `g_mtrade.ticket = ...` and the ENTRY_TICKET print), plus an S1 row for `ResultOrder`/`ResultDeal` on the `g_trade` surface next to the existing `ResultRetcode` row, plus the E8c literal count and the Q2 budget (−9 or so). It also makes the ENTRY_TICKET freshness term unnecessary, because the id cannot be an old position's. Given the re-cut Q2-H1 already forces, this is the moment to take it.

**B2. Make the helper's status tri-state rather than boolean (E5 signature + three returns, E7 consume).** Detailed in Q2-H1. Beyond fixing the false FAIL rows, it lets the three outcomes carry three distinct row names with no overlap — `SKIP-NO-SEND` (by policy), `NOTHING-TO-CLOSE` (identity miss), `MTCLOSE ... action=0/retcode` (broker refusal) — which is what G3 already wants to count separately.

**B3. Gate E7 on mode at the call site as well (E7 insert, +1 condition, +0 lines).** Adding `&& InpMode == MODE_EXECUTE && MQLInfoInteger(MQL_TESTER)` to the E7 `if` makes alert-only emit no MTCLOSE family at all, which is the cleanest possible answer to Q2-H1 and keeps the alert-only log byte-comparable to RECON59's non-exit families. Tradeoff against B2: the helper's internal gate then becomes belt-and-braces and no `SKIP-NO-SEND` row ever prints, so you lose the positive evidence that the no-send policy was exercised. B2 alone is enough; B2+B3 is defensible if the operator prefers zero new rows in the default mode over a policy-exercised row. Pick one and say which in the re-cut — do not ship both silently.

**B4. Fold the two per-session bitset branches into small arrays (E2, E3, E4; roughly −8 lines across the three).** `int g_evictBits[2]; datetime g_evictDay[2];` with `int si = (sess == SESSION_LONDON) ? 0 : 1` collapses each of the three duplicated London/NYAM branches to one body. It removes the copy-paste class outright (the FIRE print is currently written twice, identically, in E2), shrinks the diff the operator has to eyeball, and makes the "blessed London+NY exception" mentioned in 4d a width change rather than a third branch. Cost: `sess` must be mapped once per site, and the S1 identifier rows change from four globals to two arrays. Optional — the current form is correct, this is a size-and-duplication argument, and it does move E1's literal counts, so it is only worth taking if Q1 is re-cut for another reason.

**B5. Have the E4 guard print its rejection (E4, +2 lines).** The guard is deliberately silent so that a dead record makes G2's count mismatch. A one-line `EVICTSUPPRESS_SKIP ... cause=dead-record` row converts that from "count mismatch, cause to be determined" into "cause already on the page", at the cost of two lines and one more G2 term. Same argument applies to A10's E3 fail-open. Both are diagnosis-quality improvements, not correctness fixes, and both are cheaper to add now than to add after a run that mismatches.

**B6. Fence the F-a rule's own claim rather than the anchors only.** The strongest single assert this packet could add is post-build and mechanical: on the S5 log, every `RESEED_BLOCKED` row's `(poi, dir, sess, evictedDay)` matches some earlier `EVICTSUPPRESS bar=` row's `(poi, dir, sess, untilDay)`. That is a tuple-level join, it proves the ARM-to-gate key convention end-to-end on real rows, and it makes A2, A11 and A12 all visible in the grade rather than inferred from a census. Touches no code — a G2 term only.

## V265-RESQUAT-CLEAR6 END OPUS (verbatim close; filed whole 1x this turn, novel inbound)

## V266-RESQUAT-CLEAR7 OPEN OPUS (his carry, relay v266 clearance ask; pasted text follows verbatim)

Q1 NOT-CLEAR
Q2 NOT-CLEAR

Both halts are page-mechanical. Neither is a logic objection to the F-a set or the deal-derived latch — the v265 causes are genuinely repaired (the writer censuses do close the session/direction/line bridges; `DEAL_POSITION_ID` → `PositionSelectByTicket` is deal identity, not a time proxy; the E5 reorder does keep default mode out of the FAIL rows). What halts is a stale number in the gate that governs both halves, plus three unpinned or internally inconsistent literals on the Q2 side.

## Halt items

**H1 (both halves) — S1(6) reads +138 against a +141 budget everywhere else.**
Twin, Stages S1 clause (6): "recount +138 NET". Every other total on the page says +141: canonical-files line (81 + 60), S2 ("net +141: +81 Q1, +60 Q2"), G1, section 3 budget row, relay section 0. Recount from the pasted literals: E1 12−1=+11, E2 21−6=+15, E3 36−3=+33, E4 29−7=+22 → Q1 +81; E5 39−1=+38, E6a/E6b +0, E7 17−8=+9, E8a +1, E8b +1, E8c 16−5=+11 → Q2 +60; total +141, and 11330+141 = 11471 which matches the post-total. So +141 is right and S1(6) is the outlier. The v265 halt item was the same field reading 137; the one-digit repair was applied while the budget moved +3 (E3 INDEX-INVALID) and +2 (E4 guard) underneath it. S1(6) gates E1–E8, so a builder following the gate literally must DIAGNOSE at S1 and the cycle is spent before S2.

**H2 (Q1) — G2's `RESEED_BLOCKED >= 1` term is not delimiter-anchored, and E3 now emits two row kinds under that name.**
E3 new lines 15 and 30 both print `RESEED_BLOCKED`: `action=INDEX-INVALID` and `action=SKIP`. G2 anchors the index rows for their own expected-0 term, and the required-evidence term ("RESEED_BLOCKED >= 1 on 9/1 16:55-bar") and the F-a tuple-join term are anchored to the bare name. An INDEX-INVALID row satisfies `>= 1`. The packet already applies exactly this discipline to EVICTSUPPRESS ("anchored `EVICTSUPPRESS bar=`, never FIRE rows") and did not carry it to the row it just split. Fix is text-only: anchor the `>= 1` and tuple-join terms to `action=SKIP`, or give the index row its own name.

**H3 (Q2) — E8c's NEW block cannot be both byte-identical to EA 10236-10240 and internally consistent.**
Section 3 fences the OLD block at 15/27sp, and the OLD quote matches that. In the NEW block the five retained EXECUTED-print lines carry one more leading space than the OLD quote (16/28), and one more than the nine new code lines beneath them in the same `if(fill > 0.0)` body (`ulong entryDeal ...` at 15). Both cannot hold. This is the v265 defect with the sides swapped: the OLD side was re-pulled, the NEW side was retyped. Relay transport makes whitespace the least trustworthy thing on the page, so treat the absolute counts as mine-to-be-checked; the *relative* inconsistency inside section 2 is the page evidence and does not depend on transport. E7 states "anchor-block retained byte-identical" for its retained span; E8c has no such clause and no fence row asserting NEW-retained == OLD-retained.

**H4 (Q2) — `nextOpenPx` is unpinned at the E7 insert point.**
The E7 insert (new line 12) passes `nextOpenPx` at what becomes ~11301. The page gives it only a use-count (17) and two use sites at 11290/11292, both *above* the anchor block and described as "inside the priority chain". A use earlier in the same function does not establish block scope at the insert line if those uses sit inside a nested `{ }` that closed before 11294. Compare the treatment of `barTime`: S1(18) pins it by its use inside the anchor block itself, and S1(21) pins the parameter scope at three sites. No equivalent assert exists for `nextOpenPx` — not declaration line, not type, not enclosing scope. This is the v263 class ("MODE_EXECUTE ordinal unpinned in S1/fence") and it is the one dependency in the Q2 insert that S4 alone protects. See B1 for a repair that deletes the dependency instead of pinning it.

**H5 (Q2) — S1(10)'s CTrade surface assert omits two members E5/E8c now require.**
S1(10): "g_trade declared CTrade exposing PositionClose + ResultRetcode". E5 new line 31 calls `SetTypeFilling`, E8c new line 8 calls `ResultDeal`. Section 3 lists `ResultDeal` among "platform surface builtins" at count 0 — but `ResultDeal` and `SetTypeFilling` are CTrade members from Trade.mqh, not builtins, so a 0 tree-count is not availability evidence for them the way it is for `HistoryDealSelect`. `SetTypeFilling` has no fence row at all. Add both to S1(10).

## Addenda (named, no halt)

- **A1 — E3's INDEX-INVALID `return` is a refusal the Rule paragraph does not authorize.** New lines 13-17 abort the seed on a non-F-a condition. Protective (it prevents the OOB `g_lineCode[pr.topLine]` at new line 32), fenced expected-0, but the Q1 F-a rule text describes only tuple suppression. One sentence in the Rule paragraph closes it.
- **A2 — dead re-check.** E3 new lines 21 and 26 re-test `rsq_bit >= 0` after lines 13-17 already returned on that condition.
- **A3 — E3/E4 audit asymmetry.** A `sess` that is neither LONDON nor NYAM covers no branch: E3 falls through with `rsq_blocked = false` and prints nothing; the same condition at E4 prints EVICTSUPPRESS_SKIP. One side is audible, the other silent.
- **A4 — one cause token for three conditions.** E4 new line 27 prints `cause=dead-record` for line-OOB, `DIR_NONE`, and non-live session alike, against a G2 term that halts on the row. Print the three captured values.
- **A5 — G2's FIRE equality clause is stale against the set design.** "equality holds for takes in armed sessions" was true of the v6 singleton; with a multi-tuple set one FIRE clears N ARMs, so FIRE < ARM is normal whenever a session arms twice. The halt trigger (the inequality) is correct; only the expectation text is wrong.
- **A6 — the cross-day key edge is declared but has no G2 row that detects it.** E2's day key is `TC_DayStart(g_anchorBarTime)` (call args at 10160/10253), E3/E4's is `TC_DayStart(barTime)`. The page pushes this to "graded at G2" without a term. It is observable for free: EVICTSUPPRESS prints `untilDay`, EVICTSUPPRESS_FIRE prints `day`. Add the join.
- **A7 — `action=` is polymorphic across the MTCLOSE family.** Two rows carry status tokens (`SKIP-NO-SEND`, `NOTHING-TO-CLOSE`), one carries `(int)ok` ∈ {0,1}; the return is tri-state {−1,0,1} and −1 never appears in an `action=` field. G3's counts are separable but need three distinct patterns, not one.
- **A8 — section 4f is not a contiguous region.** It is labelled "whole contiguous regions" and delivers 11271 and 11281 with nine lines elided and no ellipsis. The zero-semicolons pin is the claim those nine lines would prove. E6's arity survives anyway: +1 specifier inserted immediately after `vHTF=%d` and +1 arg immediately after `(int)vHTF`, with `(int)vHTF, (int)MT_EXIT_SCOPE,` mirroring `vHTF=%d scope=%d`, preserves any prior balance. Paste the statement and the pin is shown rather than asserted.
- **A9 — "Double-battery recount (this turn, mechanical...)" in the Authority block carries v2-era totals** (+52/+53/+105, post 11435) under a "this turn" label. Provenance-only per the label map, but a history line claiming this turn while contradicting the live budget is the same reading hazard as H1.
- **A10 — E5 adds a second call site for two fenced identifiers without stating the post-build expectation.** `SetExpertMagicNumber | 1 | EA 10214 per-entry` and `GetCorrectFillingMode | 2` become 2 and 3 after E5. Other rows state post-build values explicitly ("E5-only post-build").
- **A11 — the direction bridge rests on a carried conditional.** Section 4a's own comment describes 7739 as an "ABSTAIN pass-through" contingent on live rows carrying no declared class; the region that would show it unconditional (3949-3956) is presence-asserted, not pasted. Within evidence discipline, and G2's missing-RESEED_BLOCKED term would catch a break — but it is the weakest link in an otherwise closed Q1 census, and it is the one that fails silently.
- **A12 — `MarkSessionUsed`'s time base is unpinned, and a G2 term depends on it.** E2's FIRE fires only when `today == g_evictDayLon/NY`, where `today = TC_DayStart(barTimeServer)`. Assert 7 pins the call count and that both sites (10160, 10253) are signal-consume paths; nothing pins what the two callers pass as `barTimeServer`. If either passes a different time base than E3/E4's `barTime` (assert 21's equivalence covers E3/E4/E8c only), the FIRE row can go missing and G2's `EVICTSUPPRESS_FIRE <= ARM count` / "FIRE without take HALTS" terms grade against a row that never printed. **Gate delta:** extend assert 21 to the arguments at 10160 and 10253.
- **A13 — Post-build writer census for the four new globals is absent.** E1's comment makes a load-bearing claim — "deliberately NOT in ResetSequence's clear set, records must survive the reset they ride" — and assert 14 only shows ResetSequence (6267-6294) is state-clear-only pre-build. Mirror the `g_anchorLine` treatment: assert post-build that the writers of `g_evictBitsLon/NY` and `g_evictDayLon/NY` are exactly the E1 decls, E2 FIRE, E3 EXPIRE, E4 ARM. Cheap, and it is the check that would catch a stray paste.
- **A14 — S1's identifier availability list is inconsistent about platform symbols.** `POSITION_TIME` is listed "(platform enum)" while `PositionsTotal`, `PositionGetTicket`, `PositionSelectByTicket`, `PositionGetInteger`, `PositionGetString`, `POSITION_SYMBOL`, `POSITION_MAGIC`, `MQLInfoInteger` and `MQL_TESTER` — all newly used by E5/E8c — are not. Harmless (builtins), but it makes the list look like a census when it is a sample.
- **A15 — Redundant select inside E8c's loop.** `PositionGetTicket(pi)` already selects; `!PositionSelectByTicket(pt)` re-selects. Correct, just two evaluations where one does, and it leaves the "selected position" state pointing at whatever the loop last touched — irrelevant here because E5 re-selects by ticket, worth knowing if anything is later appended after the loop.
- **A16 — Orphan exposure at MTCOLLISION is worth one sentence.** 4d replaces the paper record with `exitReason = MT_EXIT_REPLACED` and does not clear `g_mtrade.ticket`; the executor gate excludes REPLACED, so no wrong close happens, but the replaced record's broker position becomes unreachable to E5 until the next fill overwrites the latch. MTCOLLISION 0 is expected and any row halts, so this is a boundary note, not a defect — the scope line "the ticket re-latches per fill so the executor always targets the current record" is true but does not say the previous one is then unaddressable.
- **A17 — G3's NOTHING-TO-CLOSE term is internally two-voiced.** It says "expected 0" and, in the same clause, pre-diagnoses a reachable path producing it (broker-owned TP fills on a bar where `vTP` false and `vBREAK` true). That is honest but reads as a contradiction; write it as "expected 0; one known cause, if it prints, halt and attribute to the TP-while-BREAK path" so the grade cannot be waved.

---

## Analytic ask B — better mechanisms

**B1 — pass `g_mtrade.exitPrice` instead of `nextOpenPx` at the E7 call (E7 new line 12; +0 lines).** Section 3 puts the `nextOpenPx` uses at 11290/11292, the same lines that assign `exitReason` for BREAK and DAY_CLOSE, and the retained MTEXIT row at 11300 already prints `g_mtrade.exitPrice` — so for exactly the two legs E7 gates, the two values are the same number, and `g_mtrade` is a global with no scope question. This deletes H4 rather than pinning it, and it makes the MTCLOSE `ref=` column join the MTEXIT `exit=` column byte-for-byte instead of by argument. The comment line "Price printed = nextOpenPx" and G3's ref-column language would change with it.

**B2 — split the failure code four ways (E5 new lines 22-28, E7 new line 13, G3 mapping).** `ticket == 0` is an E8c latch defect; `PositionSelectByTicket` failing on a nonzero ticket is the broker already being flat, which is the documented TP-while-BREAK path and is *correct* behaviour under broker-owned SL/TP; a `PositionClose` refusal is a third thing. All three currently return 0 and all three print MTCLOSE_FAIL. The tri-state was introduced precisely so that deliberate outcomes stop reporting as failures, and the already-flat case is the remaining one that still does. The rows do distinguish them, so this is about the code the halt logic reads, not about evidence loss.

**B3 — drop the `SetExpertMagicNumber`/`SetTypeFilling` mutation from E5 (new lines 30-31).** `PositionClose(ticket)` closes by ticket; the magic on the closing order is attribution only. Keeping `pmagic = PositionGetInteger(POSITION_MAGIC)` for the log gives the same evidence without leaving shared `g_trade` state pointing at a closed position's magic. It is safe today only because the entry path re-sets both at 10214/10222 — a dependency on an untouched region that does not need to exist.

**B4 — paste 11271-11281 whole into 4f.** Zero code cost, closes A8, and the same move would have caught the E6 arity question before it needed arguing.

Nothing here builds, runs, or commits. The Q1 half is one text fix (H1) plus an anchoring fix (H2) from clear on my read; the Q2 half needs H3 re-pulled mechanically and H4/H5 pinned, and B1 would be the cheaper route to H4.

## V266-RESQUAT-CLEAR7 END OPUS (verbatim close; filed whole 1x this turn, novel inbound)

## V267-RESQUAT-CLEAR8 OPEN OPUS (his carry, relay v267 clearance ask; pasted text follows verbatim)

## Verdicts

**Q1 CLEAR** — re-squat half (E1–E4, +74), with four S1 gate deltas named below (all +0 code lines, all mechanical greps) and one new residual.

**Q2 NOT-CLEAR** — two items: E5 position-selection identity (the either-magic scan vs. the asserted single-match invariant), and E6a/E6b having no anchor row, no line number, and no in-scope proof for `vDAY`.

---

## Q1 — re-squat half (E1–E4, +74)

Independently recounted from the literals on the page: E1 = 6 comment + 4 decl + 1 retained = 11 new vs 1 old (+10). E2 = 19 new vs 6 (+13). E3 = 19 new vs 3 (+16). E4 = 20 new vs 7 (+13). Sum +52. Combined with Q2's +53 → +105, post 11435. Arithmetic agrees with section 3's budget row.

The v6 delta is as declared: E4's change is whitespace-side only, and the absorbed asserts (13–18) add no lines.

Logic checks that pass on the page:

- E3's scope is self-proving: the retained old anchor already uses `sess`, `barTime`, `barShift` in the SEEDDIAG print, so every identifier the new gate needs is in scope at EA 7730.
- E2's FIRE arm cannot fire on an unarmed record (`g_evictSuppressLine >= 0` guard), and cannot fire on a stale day (`today == g_evictSuppressDay`).
- E4 captures before `GoAbort` and writes after it; assert 14 (GoAbort body EA 6296-6330 = LogAbort/LogState/ResetSequence only) closes the interleave question.

### Conditions (text-only, S1 additions)

1. **`barTime` / `barShift` in scope at E4 (EA 8802-8808).** The new E4 lines use both, and the old anchor block shows neither. The file demonstrably varies its naming — E1's own anchor is `SessionAlreadyUsed(ENUM_SRJ_SESSION sess, datetime barTimeServer)`, not `barTime`. S1 (2) is an identifier *census*, which does not establish a local's presence inside one function. Failure mode is a compile stop at S4, i.e. one burned build. Pin it with a fence row (one-hit for each token inside the C8 function body) or cite the earlier ledger row if it was already verified in v259/v260.
2. **`barTime` == `iTime(_Symbol, PERIOD_CURRENT, barShift)` at E3 and E4.** Both blocks key the day on `TC_DayStart(barTime)` but label the printed bar with `iTime(..., barShift)`. If those disagree, the ARM/SKIP rows carry a different bar than the record's day key, and G2's `RESEED_BLOCKED >= 1 on 9/1 16:55-bar` grades against the printed term. Section 3 pins `barTime`-in-scope at E7 only; there is no equivalence pin at E3/E4.
3. **Direction-convention identity between write site and read site.** E4 stores `g_dir`; E3 compares `pr.isLong ? DIR_LONG : DIR_SHORT`. The gate requires those two to encode the same sense. The page gives `DIR_LONG=1 / DIR_SHORT=-1` (EA 226) and the existing `s1g_legDir = pr.isLong ? 1 : -1`, but never the line where `g_dir` is assigned during the sequence. If the conventions are inverted, the gate never matches, RESEED_BLOCKED never prints, and the miss surfaces only after the 90-minute run.
4. **Extend assert 17 from index-validity to record-validity.** Assert 17 bounds `0 <= g_anchorLine < POI_NLINES` while holding S4, but not `g_dir != DIR_NONE` and `g_sessionAtEntry != SESSION_NONE`. An ARM with `SESSION_NONE` is a silent dead record: E2's FIRE can never match it (call sites pass real sessions), E3's gate can never match it, and yet the ARM row still counts toward G2's `EVICTSUPPRESS count == DIV_FALLBACK S4-origin count`. That converts a pre-build catch into a post-run G2 halt.

---

## Q2 — exit-executor half (E5–E7, +53)

Recount confirms E5 new site 49 (1 blank + 11 comment + 36 body + 1 retained header) vs 1 old = +48; E7 8 retained + 3 comment + 2 code = 13 vs 8 = +5; E6a/E6b +0. Q2 = +53.

**The v6 E7 repair holds.** I checked it against section 4 rather than the prose: `vDAY` is set at one site only (EA 11266) under `!vSL && !vTP && !vBREAK && !vHTF` (4b), so `exitReason == MT_EXIT_DAY_CLOSE` implies `vBREAK == false`, and `exitReason == MT_EXIT_POI_BODY_BREAK` requires `vBREAK == true` via the chain at 11288-11292. The surviving bare-`vBREAK` label ternary therefore cannot desync from the gated reason. An SL-winning bar with `vBREAK` true no longer reaches the call. Astra's v263 halt item is closed as stated.

Also verified as safe rather than assumed: E5 mutates shared `g_trade` state (`SetExpertMagicNumber`, `SetTypeFilling`) and never restores it, but the entry path re-sets both per entry — magic at EA 10214 (assert 15, "never init-only") and filling at EA 10215 (fence row `GetCorrectFillingMode | 2 | def EA 1656 + use EA 10215`). No leak.

### Halt item 1 — E5 target selection is not tied to the leg being closed

The scan accepts `m == InpMagicBase + 1 || m == InpMagicBase + 2` (either session), takes the first match walking down from `PositionsTotal()-1`, and carries no ticket, no direction test, and no time test. The header comment justifies this with "the single-record invariant bounds the scan to one match."

That invariant is the *paper* record. The premise of this entire half is that broker state diverges from paper state — X1 and X2 exist precisely because the position outlived the paper close (verdict 1.16439 on 8/28 vs. stop fill 1.16510; verdict 1.16093 on 9/4 vs. target fill 1.16302 on 9/7). So the paper-side single-record invariant cannot be used to bound a broker-side scan. Nothing on the page establishes at-most-one position with those magics: R-a permits one take per session, the magic scheme exists specifically to distinguish two sessions' positions, and no shown control flow blocks a second entry while a position is held.

Consequence is not caught by the safety nets. G3's `NOTHING-TO-CLOSE expected 0, any row HALTS` catches the empty case; it does not catch selecting the *wrong* position, which prints `action=1 retcode=<done>` and grades as a success. This is the same shape as the v263 halt: an exclusion asserted in prose but not established by the shown control flow, at the one site in the packet that sends an order.

Cheapest repairs, in order of strength: latch the entry ticket into `g_mtrade` at the entry path and close by ticket; or add `POSITION_TYPE` match against `g_mtrade.dir` plus `POSITION_TIME >= g_mtrade.fillBarTime` to the scan; or, if the at-most-one condition really is structural, prove it on the page (the entry-gate line that refuses a second entry while `g_mtrade.active`) and the proof carries the existing code unchanged.

### Halt item 2 — E6a/E6b have no anchor, no line, and no scope proof

Both edits are scribed from prose with no filed literal, which the packet discloses. What it does not supply is anything for STAGE-1 to act on: section 3 has no fence row for `"vTP=%d vBREAK=%s vHTF=%d scope=%d "` or for `(int)vHTF, (int)MT_EXIT_SCOPE,`, no line number, and no statement of which function the print lives in.

That last one matters concretely. `vDAY` is a local declared at EA 11160 inside the managed-trade evaluator (fence row: decl 11160, set 11266, guard 11283, assign 11292). If the E6 anchor sits inside `MtLifeEmit()` — plausible, given the row family and that `MtLifeEmit()` is called at EA 11301 — then `(int)vDAY` does not compile, and S4 eats the build. "STAGE-1/S4 gate it" is true of the compile, not of the anchor: STAGE-1 can only one-hit an anchor that has a fence row.

Repair is text-only: a fence row with the one-hit count for each E6 anchor, the enclosing function name, and a scope assert for `vDAY` at that site. If the anchor turns out to be in a different function, E6 needs a parameter or a global, which is a code change and a fresh budget line.

---

## Ask A — defects, gaps, imprecisions

- **Fence row `nextOpenPx`** cites "in-scope: anchor-block EA 11294 use." Section 4a shows the 11294-11301 block, and `nextOpenPx` does not appear in it; the token appears at 11290 and 11292. The scope conclusion is still satisfiable from those lines, but the citation as written is wrong. Text-only fix: cite EA 11290/11292.
- **E1 and E3 comments claim an EXPIRE clear that no line performs.** E1: "cleared on FIRE ... or by EXPIRE (day-key mismatch at the read site)." E3: "EXPIRE arm: any mismatch falls through." Falling through does not clear. Post-mismatch the record stays armed with a stale day indefinitely. Gating stays correct (a stale day can never match), so this is a doc defect, not a logic defect — but it makes the record's lifetime undecidable from the comments, and it interacts with the named single-slot-overwrite residual.
- **Fence row `vBREAK | 12 | decl + sets + uses (set EA 11232)`** says "sets" plural while naming one line. Every other multi-position row (`vDAY`) enumerates. Low consequence given the label tie runs through the else-if chain, not the count, but the census is not decidable as printed.
- **`MarkSessionUsed(` pin is count-only.** Fence and assert 7 pin 2 calls at 10160/10253 plus the def. Neither states that both call sites are SIGNAL-consume paths. The FIRE arm now lives inside the function, so a non-SIGNAL call site would emit `EVICTSUPPRESS_FIRE` without a take and break G2's "equality only for takes in armed sessions" reading.
- **E4 print precedes nothing, but the ARM precedes the print.** `g_lineCode[s4e_line]` executes after the four globals are already written. If assert 17's invariant ever fails, the record is armed and then the print faults, which is the worst ordering of the two.
- **E3's early return also skips whatever sits between the gate and the seed** on the suppressed bar. G3's "downstream of the 9/1 take" exception will absorb any resulting census delta silently. Ask that any such delta be attributed by name rather than absorbed.
- **Whitespace fidelity of the twin is not confirmable from this page.** Inside E4, the `g_evictSuppressDay = TC_DayStart(barTime);` line carries a different line-prefix form than its four siblings, and several E5 lines do the same; section 4a shows ragged indent in a region marked byte-verified (`   if(vSL)` at 3 spaces vs. `    else if(vTP)` at 4). Since v6's whole E4 delta was "indent normalized," that claim is not demonstrated here. Conformity of the twin is unaffected — every affected line is new-side, and the only whitespace-critical old anchor (E7) is char-code asserted — but either the transport mangled the twin, in which case the diff-0 row in section 3 is measuring something other than what I was shown, or the normalization did not happen.
- **`magic=%d` with `(int)pmagic`** truncates if `InpMagicBase` (EA 29) exceeds 32 bits. Nit; `%I64d` on the `long` is exact.
- **G3's `NOTHING-TO-CLOSE expected 0` has a named reachable path** worth pre-writing the diagnosis for: `vTP` is `tpBookedTouch`-driven (EA 11186-11187), not a raw price test, so a broker-owned TP can fill on a bar where `vTP` is false and `vBREAK` is true. The broker side is then already flat while `exitReason == BREAK`. The halt-on-occurrence rule handles it correctly; knowing the path in advance saves a cycle.
- **MTCLOSE `ref=` is the paper reference, not the realized fill.** Already handled by the rename-table note (fills join via retcode plus segment deals) and G4's spread tolerance. Noted only so the G4 join is not read as a price assertion.

## Ask B — better mechanisms

- **Ticket latch instead of a scan.** Add a ticket field to `g_mtrade`, write it at the entry path (EA 10214-10222, right where the magic is already set), and replace E5's loop with `PositionSelectByTicket(g_mtrade.ticket)`. Touches the `g_mtrade` struct decl, EA 10220/10222, and E5 lines 14-24 (net roughly -6 in E5, +3 elsewhere). Deletes halt item 1, the `MTCOLLISION` dependency, and the single-record prose entirely.
- **Label from one source.** Call `MtCloseBrokerPosition(MtExitName(g_mtrade.exitReason), nextOpenPx, barTime)` instead of the `vBREAK` ternary. +0 lines, touches the one E7 call line. The label then cannot desync from the gate under any future predicate change, rather than being safe only because of 4b's `!vBREAK` guard.
- **Reuse the direction already computed at E3.** Hoist the existing `s1g_legDir` above the gate and compare against it instead of introducing `rsq_dir`. Touches E3's new line 8 and the retained final line; removes one of the two direction expressions and shrinks condition 3 above to a single convention.
- **Guard E4's ARM on index validity** rather than resting on a static reachability assert: wrap the four writes plus the print in `if(s4e_line >= 0 && s4e_line < POI_NLINES)`. Turns a possible array-out-of-range tester abort into a diagnosable no-arm. Costs +2 lines against the +105 budget.
- **Either implement the EXPIRE clear or drop the claim.** Two lines in E3's non-matching path make the record's lifetime match the comments and make the FIRE/ARM census closed. Dropping the language from E1 and E3 is +0 lines and equally honest.
- **One struct global instead of four.** Folding line/dir/session/day into a single record struct at E1 shortens the E1 block, makes "not in ResetSequence's clear set" a one-line statement about one symbol, and makes the clear/arm operations single assignments at E2/E3/E4. Cost-neutral to slightly negative on lines; touches all four Q1 edits, so it is a v7 candidate rather than a v6 patch.

## V267-RESQUAT-CLEAR8 END OPUS (verbatim close; filed whole 1x this turn, novel inbound)

## V268-RESQUAT-CLEAR9 OPEN OPUS (his carry, relay v268 clearance ask; pasted text follows verbatim)

## Verdicts

**Q1 CLEAR** — re-squat half (E1-E4, +81), with two named text-only gate deltas owed before S2 (no logic change, no literal re-cut):
1. **S1 owes a VALUE pin on `POI_NLINES`** (fence row reads `POI_NLINES | 15 | bound for the index invariant`, which in that table's own convention is a *hit count*, not a value — compare `DIR_LONG | 144`). The whole bitset encoding rests on the value: `bit = line*2 + dirIdx`, max bit 29, and `int` gives 31 usable. E1:L2-L3 assert 15 in a comment only. This is the same class as the MODE_EXECUTE ordinal pin that halted v263 and that S1(13) now carries; S1(4) already distinguishes "declaration VALUE 48" from a census, so the packet knows the difference. Add: *`POI_NLINES` declaration VALUE == 15 asserted pre-apply; bit domain `line*2+dir` ≤ 29 < 31.* Plus a fence VALUE row.
2. **Day-key source asymmetry stays a must-grade, named louder.** E4:L10 keys ARM on `TC_DayStart(barTime)` (evaluated bar) and E3:L12 compares the same; E2:L3 keys FIRE on `TC_DayStart(barTimeServer)`, and both call sites pass `g_anchorBarTime` (fence: `MarkSessionUsed( | 3`). S1(21) names the edge and defers it to G2, which is acceptable because both failure shapes are audible (a missed FIRE self-heals at the next day's EXPIRE-clear; a stale FIRE trips the G2 day-key join). What is *not* on the page is the premise that makes it unreachable: that neither session window straddles server midnight. Name it in G2 as a false-halt cause for the day-key join, or pin the window premise.

Everything else in E1-E4 checks out on the page: budget mechanical (12-1=11, 21-6=15, 36-3=33, 29-7=22 = +81, and 81+97 = 178, 11330+178 = 11508); bit domain safe (`DIR_NONE=0` excluded by the E4:L14 record-validity guard, so `DIR_SHORT → 1`); E4 captures precede `GoAbort` (E4:L7-L10 before L11); the dead-record branch prints rather than silently skipping (E4:L27); every new-span line in E1-E4 wears the col-0 backtick form S1(23) demands; all seven print sites have specifier/arg parity and type match (I checked each: 5/5 ARM, 4/4 SKIP, 5/5 RESEED SKIP, 1/1 INDEX-INVALID, 2/2 FIRE).

**Q2 NOT-CLEAR** — deal-executor half (E5-E8, +97). Four items, two of them hard stops.

### Q2-1 (STOP — a named S1 rule is contradicted on the page)
S1(23) asserts *"every new-span code line backtick-col-0; audit 0 flags; old-spans 2sp+backtick; **E8 spans included**"*. The **E8a new span (3 lines) and E8b new span (5 lines) are written in the old 2sp+backtick form**. E5, E7, E8c, E1-E4 and E6a/E6b are all col-0; only the E8 struct/reset spans drift. That is 8 new-span lines contradicting the gate, and it is the fourth occurrence of the hand-transcription class in this packet's history (v264's 18 old-form lines, the S1(6) 137→138 token, the E8c 16/28sp whitespace). Per binding rules, a contradicted rule must be named with a stop. Repair is mechanical, +0 lines.

Credit where due: the **E8c and E7 retained-line whitespace is correct this round** — E8c new-span retained lines carry 15sp/27sp matching EA 10236-10240, E7 retained carries 4sp/16sp matching EA 11294-11301. The GLM-A3 embedded gate holds where it failed in v266.

### Q2-2 (STOP — uncensused bare locals against a 0-warning gate)
S1(2b) enumerates new names and the fence gives 0-hit rows for `mtexecRc / entryDeal / entryPid / closerc / closepid / closeentry`. **Neither lists `pi`, `pt`, `pmagic`, `ticket`, or `ok`.** For E5 that is cosmetic (helper-local scope, collision-free by construction). For **E8c it is a build-gate risk**: E8c:L16 declares `int pi` and E8c:L18 declares `ulong pt` inside `EvaluateClosedBar` (def EA 6629, still in scope at the 10236 capture site per S1(21)) — a function spanning thousands of lines with no census for either name. An outer `pi`/`pt` in that body yields a shadow-declaration warning, and **S4 demands 0 warnings**, so an uncensused two-letter local can fail the build gate. This is the third consecutive round where the inventory list has come up short (v10 was cut to repair exactly this for `closedeal`, Luna-A3/Astra-A8).

Repair, +0 lines: rename to the packet's own prefix discipline — `mtc_pi/mtc_pt` in E5:L26/L28, `e8c_pi/e8c_pt` in E8c:L16/L18 — and add `pmagic`, `ticket`, `ok` plus the renamed loop vars to S1(2b) and the fence. Also missing from the S1(2a) builtin list while used in code: **`PositionsTotal`, `PositionGetTicket`, `DEAL_ENTRY_OUT`** (E5:L26/L28/L60, E8c:L16/L18). S1(2a) says builtins aren't censused, so this has no gate effect, but the list purports to enumerate the surface E5/E8c touch and does not.

### Q2-3 (STOP — G3 claims completion the code never proves)
G3 defines `1` as a **"completed-close result (ok AND retcode DONE AND closepid == entry pid AND closeentry == exit class)"**. E5:L60 implements exactly those four terms and **no volume or flatness term**. A partial fill satisfies all four — retcode DONE, `DEAL_ENTRY_OUT`, pid match — while the broker position survives. The run would then grade 8/28 11:40 and 9/4 23:55 as executed exits with the position still open, and G4's "stop fill gone / target fill gone" rows would contradict a `action=1` row with no census able to say which is true. This is the identical class that halted v266 (action=1 is not execution) and v267 (retcode is not identity): the predicate is one term short of the claim it licenses.

Cheapest correct repair is flatness, not volume equality (no float tolerance, no partial-fill arithmetic): after E5:L60's predicate passes, re-resolve by pid and require nothing live.

```cpp
   if(!(ok && closerc == TRADE_RETCODE_DONE && closepid == entryPid && closeentry == DEAL_ENTRY_OUT)) return 0;
   if(MtPidToTicket(entryPid) != 0) return 0;   // partial/failed close: position still live
   return 1;
```
That is +1 line if the resolver is extracted (Analytic B1); +11 duplicated lines if not. Either way S3's budget moves off +97/+178 and must be recounted, and G3's "1 = completed-close" wording gains the flatness term.

### Q2-4 (text-only — a G3 join term contradicts v10's own premise)
G3 reads *"deal-ticket-identifier join: **every MTCLOSE ticket == an ENTRY_TICKET ticket** AND that ENTRY_TICKET's pid == the DEAL_POSITION_ID of the entry deal"*. But v10's whole rationale (E5:L7-L9, rename table, v266 authority line citing the MQL5 position/deal property pages) is that **`POSITION_TICKET` can change on service operations while `DEAL_POSITION_ID` cannot** — which is precisely why E5 stopped trusting `g_mtrade.ticket` and re-resolves. So the first conjunct asks the grade to halt on the one scenario the code was rebuilt to survive: pid matches, re-resolved ticket differs from the latched ticket, close is correct, join fails. Demote it: join on **`MTCLOSE closepid == ENTRY_TICKET pid`**, keep the ticket fields as informational, and if they differ, attribute to a service re-ticket rather than halting.

---

## D2 ruling: **TEXT-ONLY**

No `HistorySelect`-family call is owed. `HistoryDealSelect(ulong ticket)` selects a single deal by its ticket and does not depend on a prior range request; the `HistorySelect` / `HistorySelectByPosition` + `HistoryDealsTotal` / `HistoryDealGetTicket` family exists for *enumeration over a range*, which neither E8c nor E5 performs — both hold an explicit deal ticket from `ResultDeal()`. The Luna-B pid persist and the executable close-deal check do subsume the identity half of the concern. What they do **not** subsume is the `ResultDeal() == 0` path, and the page should say so rather than leave it inferred. Sentence to add at S1(2a) or the E5/E8c comment block:

> The history reads select a single deal by explicit ticket (`HistoryDealSelect(closedeal)` E5:L51, `HistoryDealSelect(entryDeal)` E8c:L12), so no `HistorySelect` range request is required or made; a `ResultDeal()` of 0 or a failed select leaves `entryPid`/`closepid` at 0, which fails the E5 predicate and prints `NOTHING-TO-CLOSE` or `MTCLOSE_FAIL` for diagnosis — a `HistorySelectByPosition` fallback is declined for this build as future-only.

One qualifier: the reference-file citation (`03_SPECIFICATIONS/.../mql5-reference.md` lines 385-392) is a disk claim. I rule on the page; I have not seen that file and am not treating its line range as verified.

---

## Analytic ask A — defects, gaps, imprecisions

Convention: `E{n}:L{k}` = k-th line of that edit's new span as printed in section 2; absolute EA lines where the packet supplies them.

**Provenance / version coherence**

- **A1. The twin's Status paragraph folds the wrong round.** Section 2 line 3 describes *"Q1 NOT-CLEAR Luna (bridges unproved on the page + S1-138 contradiction) vs Astra + Opus-conditional + GLM clear; Q2 NOT-CLEAR Luna + Astra + Opus (E8c latest-time is not deal identity; Opus Q2-H1 default-mode FAIL rows) vs GLM clear"* and *"GLM paste determined v265 replay, adopted, v266 ruling owed"* and *"Changes: S1(6) +138 to +152 one-token fix FIRST"*. Those are v265/v266-era facts. Relay section 0 records v267 as Luna Q1-CLEAR/Q2-CLEAR, Astra Q1-CLEAR/Q2-NOT-CLEAR, Opus and GLM no ruling. The same paragraph's budget clause (+178/11508, Q1 +81, Q2 +97) *is* v10-correct, so the paragraph is half-updated. This is the exact version-incoherence that voided the Opus v267 ruling, now inside the object under clearance. Text-only, but it is the packet's own provenance record.
- **A2. S1(6) no longer says what A1 claims.** S1(6) reads "recount +178 NET"; the Status line's "+138 to +152" describes a superseded figure.
- **A3. Successor-sentence chain off by one.** The v266 authority bullet ends *"This v10 persists entryPid…"* while v263→v6, v264→v7, v265→v8 follow the pattern bullet-N names successor N+1. The v266 bullet should name v9; the v267 bullet (which names no successor) should carry the v10 sentence.
- **A4. Section 4's reading paragraph says "the v9 proof in one paragraph"** in a v10 relay. Stale label.

**Q2 code**

- **A5.** S1(23) contradicted by E8a:L1-L3 and E8b:L1-L5 (old 2sp+backtick form). = Q2-1.
- **A6.** `pi`, `pt` uncensused at E8c:L16/L18 inside `EvaluateClosedBar` (EA 6629) against S4's 0-warning gate; `pmagic`, `ticket`, `ok` absent from S1(2b) and the fence. = Q2-2.
- **A7.** `PositionsTotal`, `PositionGetTicket`, `DEAL_ENTRY_OUT` used (E5:L26/L28/L60, E8c:L16/L18) but absent from the S1(2a) enumerated builtin surface.
- **A8.** No completion term; G3 calls the 4-term predicate a "completed-close result". = Q2-3.
- **A9.** G3's ticket-equality join term contradicts the pid-not-ticket premise. = Q2-4.
- **A10. `NOTHING-TO-CLOSE` (E5:L38-L40) cannot be attributed from its own row.** It prints `ticket` (0 whenever the pid scan found nothing) but never `entryPid`. G3 demands the row be attributed to the known TP-while-BREAK path on sight; as written, the log cannot distinguish "E8c latch failed, pid was 0" from "pid found no live position because a broker TP already filled". Add `pid=%I64d` to the existing format and arg lines — +0 lines.
- **A11. `MTCLOSE_FAIL` (E7:L8) prints `g_mtrade.ticket`, not the resolved ticket or the pid.** On the `NOTHING-TO-CLOSE` path the MTCLOSE row prints `ticket=0` while the paired FAIL row prints the latched ticket: two ticket values for one event, feeding directly into A9's join ambiguity. Print `entryPid` there, or the resolved ticket.
- **A12. `SKIP-NO-SEND` (E5:L18) consumes `g_mtrade.ticket`** while E5:L9 claims *"never a stored-ticket trust"*. The row is expected 0 under S5, so this is a claim/code mismatch, not a behavior risk — but it is on the page.
- **A13. Dead condition** at E5:L36 and E8c: the `ticket == 0` / `entryPid > 0` guards make part of the downstream test redundant; and E5:L35 `long pmagic = 0;` is initialized only to be overwritten at L43, since no path between them reads it. Cosmetic.
- **A14. Two verbatim copies of the pid-resolution loop** (E5:L26-L33, E8c:L16-L23) hand-transcribed. Given that this packet has been halted three times for hand-transcription drift, duplicating the one region that defines *identity* is the highest-risk structural choice on the page. See B1.

**Q1 code**

- **A15.** `POI_NLINES` value unpinned while the bit encoding depends on it. = Q1 delta 1.
- **A16.** Day-key source asymmetry E2:L3 vs E3:L12/E4:L10. = Q1 delta 2.
- **A17. Redundant `rsq_bit >= 0` at E3:L21 and E3:L26** — unreachable as false, since E3:L13-L17 returns on `rsq_bit < 0`. Harmless, but it reads as if the INDEX-INVALID return were not there.
- **A18. Mixed bar-time sources in row keys.** E3:L15, E3:L30, E4:L22, E4:L27 print `iTime(_Symbol, PERIOD_CURRENT, barShift)`; E2:L11 prints `today`; E5/E7 print the passed `barTime`. S1(21) proves `barTime == iTime(barShift)` at all three sites, so the values agree — but `iTime` re-reads the series and returns 0 on a series error, stamping a row `1970.01.01` in the middle of a join the grade depends on. Prefer the passed `barTime` in every new row; +0 lines.

**Fence / section 3**

- **A19.** Row *"E8c NEW retained 5 lines **+ pid-persist line** | byte-match E8c OLD 5 lines, 0 orphans"* conflates a retained-line byte gate with a new line. The pid-persist line has no old-side counterpart and cannot be part of a retained-line match.
- **A20.** No fence row for `PositionCloseBy` / `DEAL_ENTRY_OUT_BY`. E5:L60 requires `closeentry == DEAL_ENTRY_OUT` exactly; the reason `OUT_BY` is unreachable (no close-by call exists on the tree) is true but unstated. One 0-hit row closes it.
- **A21.** The TWIN row (366/366) and every "carried" row are disk claims. I am not ruling them; per the verification split they are unanswerable from chat.

---

## Analytic ask B — better mechanism

**B1. Extract the pid resolver. One definition, three uses.** This is the single change that most reduces risk on this page, because it deletes the duplicated identity code (A14) and makes Q2-3's flatness check cost one line instead of eleven.

```cpp
//--- [P-EXITEXEC-1] sole position-identity resolver (pid -> live ticket, 0 = none)
ulong MtPidToTicket(const long pid)
  {
   if(pid <= 0) return 0;
   for(int mtp_i = PositionsTotal() - 1; mtp_i >= 0; mtp_i--)
     {
      ulong mtp_t = PositionGetTicket(mtp_i);
      if(mtp_t == 0 || !PositionSelectByTicket(mtp_t)) continue;
      if(PositionGetString(POSITION_SYMBOL) != _Symbol) continue;
      if(PositionGetInteger(POSITION_IDENTIFIER) != pid) continue;
      return mtp_t;
     }
   return 0;
  }
```

Lines it touches: **E5:L22-L34 collapse to `ulong ticket = MtPidToTicket(g_mtrade.entryPid);`** (−12); **E8c:L14-L24 collapse to `entryTick = MtPidToTicket(entryPid);`** (−10); helper defined above the E5 block (+13); flatness check E5 post-L60 (+1). Net roughly −8 against v10, so Q2 lands near +89 and the combined near +170 — S3 recount governs, and S1 gains one new name (`MtPidToTicket`, `mtp_i`, `mtp_t`) and one anchor. Side benefit: `pi`/`pt` disappear from `EvaluateClosedBar` entirely, which retires Q2-2's warning risk rather than renaming around it.

**B1. Extract the pid resolver. One definition, three uses.** This is the single change that most reduces risk on this page, because it deletes the duplicated identity code (A14) and makes Q2-3's flatness check cost one line instead of eleven.

```cpp
//--- [P-EXITEXEC-1] sole position-identity resolver (pid -> live ticket, 0 = none)
ulong MtPidToTicket(const long pid)
  {
   if(pid <= 0) return 0;
   for(int mtp_i = PositionsTotal() - 1; mtp_i >= 0; mtp_i--)
     {
      ulong mtp_t = PositionGetTicket(mtp_i);
      if(mtp_t == 0 || !PositionSelectByTicket(mtp_t)) continue;
      if(PositionGetString(POSITION_SYMBOL) != _Symbol) continue;
      if(PositionGetInteger(POSITION_IDENTIFIER) != pid) continue;
      return mtp_t;
     }
   return 0;
  }
```

Lines it touches: **E5:L22-L34 collapse to `ulong ticket = MtPidToTicket(g_mtrade.entryPid);`** (−12); **E8c:L14-L24 collapse to `entryTick = MtPidToTicket(entryPid);`** (−10); helper defined above the E5 block (+13); flatness check E5 post-L60 (+1). Net roughly −8 against v10, so Q2 lands near +89 and the combined near +170 — S3 recount governs, and S1 gains one new name (`MtPidToTicket`, `mtp_i`, `mtp_t`) and one anchor. Side benefit: `pi`/`pt` disappear from `EvaluateClosedBar` entirely, which retires Q2-2's warning risk rather than renaming around it.

**B2. Prove flatness, don't infer it.** With B1 in place, `if(MtPidToTicket(entryPid) != 0) return 0;` after the E5:L60 predicate is a complete completion proof — no volume tolerance, no partial-fill arithmetic, no assumption about how the server reports the close. Strictly stronger than a `DEAL_VOLUME == POSITION_VOLUME` comparison, which needs a step-based epsilon and still misses a same-bar re-open.

**B3. Make the volume visible even though the predicate no longer needs it.** Capture `double pvol = PositionGetDouble(POSITION_VOLUME);` right after the E5:L36 guard (+1) and `HistoryDealGetDouble(closedeal, DEAL_VOLUME)` inside the existing E5:L51 block (+1), then append `vol=%.2f/%.2f` to the existing MTCLOSE format and arg lines (+0). A partial close then shows in the log as a number rather than as an absent halt.

**B4. Join on pid, print ticket.** G3's join key becomes `MTCLOSE closepid == ENTRY_TICKET pid == DEAL_POSITION_ID of the entry deal`, three terms all lifecycle-stable. Ticket fields stay in both rows as diagnostics; a ticket difference with a pid match is attributed, not halted. Text-only.

**B5. Consider retiring `g_mtrade.ticket`.** v10 no longer trusts it for anything but three print fields (E5:L18, E7:L8, and the ENTRY_TICKET row). Carrying two identities in one record is what produced the v266 and v267 halts and A11/A12 above. Dropping the field (E8a −1, E8b −1, prints switch to `entryPid`) leaves exactly one identity on the page. I raise this as an option, not a demand — the standing declined list already refuses several field-drops, and the operator may prefer the ticket visible in the log for terminal-side cross-reference.

**B6. Future-only, declined now:** a `HistorySelectByPosition(entryPid)` fallback would convert the `ResultDeal() == 0` FAIL class into a recoverable identity path. Not owed for this build (see the D2 sentence), worth a named residual row.

---

## What this ruling does not do

No build, no run, nothing spent. Q1's clearance carries two text-only gate deltas and no change to any E1-E4 literal; Q2 halts on four items, three of which are +0-line mechanical repairs and one (Q2-3) which adds a line and moves the budget off +97/+178. If B1 is taken, both the Q2-2 rename and the Q2-3 flatness line are absorbed into a smaller diff than v10's — which is the first time in this packet's history that a repair round would reduce the line count.

## V268-RESQUAT-CLEAR9 END OPUS (verbatim close; filed whole 1x this turn, novel inbound)
## V274-USDJPY-CLEAR1 OPEN OPUS (verbatim open; filed whole 1x this turn, novel inbound)
## Verdict Q1

**DISCREPANCY** — does not clear as pasted. Six page-level blockers, each with lines:

1. **E4's own code contradicts its stated scope.** P019 asserts "The LTF-align requirement is NOT removed (a still-unaligned seed stays; the 6/5 venue advances only where aligned)." The pasted code does the opposite: P112 `if(!aligned)` → P116 confirm → P120 `g_state = ST_S5_GATE_CHECK`. That is firing while unaligned, by construction. The rows prove A1 *requires* it: row IL shows `FRESHSKIP ... state=S2_LTF_ALIGN` at 09:45 and row HR shows `STAND-DOWN ... LTF_MISALIGN` at 11:00 — the 6/5 venue was never aligned, so "advances only where aligned" delivers nothing. The prose and the edit cannot both be ruled.
2. **E1 cannot deliver A3.** Row MH (6/11 14:45) prints `oppCandle=1 bodyDir=0 body=1pts touchAttr=1 confirm=0` with `term=A2_CLOSE_BREAK`. A2 is checked at C2224-C2225, *before* B_BODY at C2226-C2229. Removing the A2 veto for POC anchors (P042) simply advances the failure to `B_BODY` (`bodyDir=0` → `if(isDoji || !bodyDir)` fails, C2229). No S5 arrival on that bar, so A3 (P144) is unreachable and the run cannot prove or disprove the confirm fix. The packet reads only the printed `failTerm` and never reads `bodyDir=0` in the same row (P011, P017, P144).
3. **The edit set contains three identifiers that are nowhere on the page:** `g_fallbackBufs` (P080), `ReadFlow` (P080), `POI_NLINES` (P040). The only proven buffer reader on the page is `ReadBuf1(g_hPoi, anchorLine, L, barShift)` (C2207) — a different shape (handle + line index, not a buffer id). P092 itself concedes `g_fallbackBufs` is unshaped ("council rules the exact share-vs-copy form"). An edit set that is declared "exact verbatim old/new, STAGE-1 exact-diff gated" (P028) but will not compile cannot authorize "exactly one build."
4. **"The S5 1R gate stays the SOLE refusal" (P018) is false on the disk rows.** Row FL: `2026.06.11 15:25:00 ABORT reason=NO_TP_TARGET state=S4_ARMED`. That abort fires from S4_ARMED, not from the S2 poll site E2 patches (C7307). At least one other `NO_TP_TARGET` call path exists and is untouched, so A1/A3 can resolve as `NO_TP_TARGET` aborts instead of R-resolutions, and "never an empty pool" (P009, P018) is not achieved by the pasted scope.
5. **A5's regression anchor contradicts the packet's own intent.** P010 makes RECON62 EU zero-delta the thing "every future build re-proves"; P146 then requires 7 identical takes *and* permits new takes at the 4 `NO_TP_TARGET` venues. All three edits are behavior-widening on EURUSD by design: E2 resolves formerly-aborted venues, E1 relaxes A2 for every POC-anchored EU setup, E4 fires S2 candidates that previously waited. EU cannot be zero-delta and cannot be "7 takes identical, rejects silent." A5 as written halts on the intended change.
6. **Anchors cited in the edit set are not on the page, against the header's "contiguous, zero elisions" claim.** Missing: `ComputeNearestTpTarget` body and its 18 buffer ids (cited P043, P092 as EA 2356-2364, insert point EA 2481), the S5 R gate comparison (cited P018 as EA 10041 — the pasted region starts at C10081, the latch, not the gate), the `CONFIRMPOLL` print site (the primary evidence source for A1/A3), and the whole S5 gate block (C8817-C10080). Seven disjoint islands are pasted; "contiguous" is not a true description of them.

---

## Analytic ask A — defects, gaps, imprecisions

### Material (beyond the six above)

- **E4 promotes to S5 having skipped zone binding, and the packet never names S5's inputs (P019, P107-P132, C8067-C8077).** The S3-prebind precedent (C8655-C8680) at least promotes from a state where the zone exists; an S2-origin promotion has no bound zone. The 6/3 take shows `slPts=43` (row KS) — an SL with structural provenance. If the S5 gate derives `slRef` or `tpTarget` from zone/S4 context, an S2 promotion latches on unset state or aborts `UPSTREAM_UNREADY`. Unrulable here because C8817-C10080 is elided; it is the largest functional risk in the packet and appears nowhere in Run-cost (P152).
- **`g_confirmFromState = prevS2` introduces a value no downstream consumer on the page is proven to handle (P119).** If any consumer switches on S3/S4 only, S2 falls through silently. Consumers are not pasted.
- **Miss-2 root cause is never established (P011, P018, row GH).** `TPCENSUS #86` prints `winner=NONE` *with five in-direction lines admitted* (`PDH:66 NYH:254 PMH:24 YNYH:20 YPMH:24`). The pool was not empty — admitted candidates were rejected downstream of admission. Compare `#147` (row KQ), which admits and names a winner at 3pts. So the rejecting rule is in the winner-selection step and is unnamed, while P018 lists the retained filters as "direction, in-zone, swept/live mask, tier-rank." E2 adds a parallel walker on the assumption of emptiness. If the true cause is a distance cap or rank rule in the winner step, the fallback masks it; if it is in the shared read path, the fallback reproduces it.
- **A2 is satisfiable degenerately (P143).** With filters off and no exclusion of the entry anchor, the nearest in-direction line can be the anchor itself a few points away — note `#147` prints `Daily-POC*:4` with an asterisk, i.e. the first pass already marks an excluded line. A 3-point book plus a sub-1R refuse would print a `TPFALLBACK` row and pass A2 while never producing a take. A2 grades "a row exists," not "the right line was booked."
- **`TPFALLBACK` is non-diagnostic (P066-P068).** It prints bar/dir/tp only — no line identity, distance, or rank. The acceptance row it feeds (P143) cannot be audited against `#86`'s admitted list.
- **The 18-buffer scope of the fallback is unproven and may exclude POC/VWAP (P077, P092).** `#86`'s admitted set is all session/PD highs; `#147` includes `Daily-POC` and `Daily-VWAP`. If the 18 ids are session/PD only, the fallback structurally cannot book the nearest POC/VWAP — which is the line family his POC-supremacy rule elevates.
- **E1 silently changes the P-SLDEF-1 counter semantics (C2211-C2215, C2225, P017).** After E1, `g_n1_pocInv` can no longer be incremented from the A2 term, so POC invalidation counts are not comparable across builds. P017 says "A_OPP/B_BODY/C_TOUCH unchanged" and says nothing about the instrumentation those comments declare.
- **E1 implements half of his rule (P009, P017).** PRIOR-CLOSE-IRRELEVANT has two halves: the prior close never judges, *and* "retest-open side + next-close-hold judges; break-then-reclaim is the setup." E1 is only the deletion of the veto. Nothing in the edit set tests the reclaim. For POC anchors the only remaining tether to the line is `C_TOUCH` (±1 point wick, C2230), so a candle that closes far through the POC now confirms on a wick.
- **E4's new block breaks the file's indentation and its own (P107-P132).** The disk block is 3/5/6/8 spaces (C8067-C8077). The new block is 4/6/7/8 with `bool aligned;` at 7 (P109) but `if(!CheckLtfAlign` still at 6 (P110), and the `if(!aligned)` block opens at 8 (P113) and closes at 9 (P129). Braces balance, so it compiles, but it needlessly rewrites the bytes of otherwise-unchanged lines (P107 vs C8067) — exactly what the S1 char-code assert (P137) exists to catch. E1 claims "indentation matched" (P036) and delivers it; E4 makes no such claim and does not.
- **A4's grading field is unnamed and the rows disagree (P145).** Row KS/ND give `entry=159.932 / fill=159.932`; row OI (`MTEXIT`) gives `entry=159.929`, a 3-point difference on the same trade. "identical bar/entry/fill" can pass or fail depending on which row is read. Row ND also carries `R_executed=1.19` vs `R_logged_at_signal=1.35 delta=-0.16`, and A4 pins neither, nor the exit (`reason=TP_TOUCH exit=159.983`).
- **Venue labels are inconsistent for the same event.** Miss-2: `16:10` (P011), `16:05` (P057), `16:15` (P024, P143). Miss-3: `14:45` (P011) vs `14:40` (P024, P144). Rows fix the facts — miss-2 aborts at the 16:10 pass on bar 16:05; miss-3 fails on bar 14:45 at the 14:50 pass. A1 names its venue by entry bar (09:45), A3 names its by seed bar (14:40); one convention, applied once, or the acceptance rows are not machine-checkable.
- **EU window disagrees with itself: `8/26-9/9` (P010) vs `8/26-9/10` (header, P024, P146, P151).** A take-level join against RECON62 requires the identical span.
- **P151's "E1 +3" contradicts P030 and P138 ("new: 6 lines; NET +2"; "E1 +2").** The S3 budget arithmetic is otherwise correct: +2 +8 +21 +15 = +46; 11506 + 46 = 11552 (P138). Block counts verify: E1 old 4 / new 6 (P032-P035, P037-P042); E2 old 8 / new 16 (P045-P052, P054-P069) plus helper 21 (P071-P091); E4 old 11 / new 26 (P095-P105, P107-P132). Old text matches disk byte-for-byte including indentation at all three sites (C2222-C2225, C7306-C7313, C8067-C8077).
- **E1's bound guard diverges from its immediate neighbours (P040 vs C2219-C2220).** Two lines above, `g_lineCode[anchorLine]` is dereferenced with no `POI_NLINES` check, protected only by the `anchorLine < 0` return at C2197. P040 adds both a redundant `anchorLine >= 0` and an unproven `POI_NLINES`.
- **E4 evaluates the confirm predicate a second time in the same pass (P116 vs row DL).** A `CONFIRMPOLL` row already prints `confirm=1` at S2 from an unlocated site. Two evaluations of the same predicate at the same bar is a divergence surface, and the poll site's line numbers are not on the page.
- **No confirm-age instrument (P019, P137, rows DK/IL/HR).** A candidate seeded 09:35 and retained unaligned until the 11:00 stand-down gets a confirm attempt on every bar in between. Under ask A's default that is correct behaviour, but nothing records seed-to-confirm bar age or unaligned duration, so the operator cannot see a 75-minute-stale fire in the rows.
- **P026 "Stated-unmeasurable: none" is not supportable** while A3's mechanism is blocked (finding 2), A5's join is self-contradictory (finding 5), and the S5-from-S2 input provenance is elided.

### Standing opens — my rulings

- **Staleness:** keep the default (age never disqualifies). The swept/live mask already retires dead levels on the first pass, and his NEAREST-ONLY-TP makes the 1R gate the sole refusal; an age veto would be a new refusal term outside his words. Mechanically it matters at miss-2: with the default the fallback books `YNYH` at 20pts; with an age veto the nearest becomes `PMH` at 24pts. Both likely refuse on the 6/5 16:05 face, so this open does not gate the build — record it, do not legislate it.
- **E4 aggressive corner:** the corner is not optional. The S3-only keep leaves miss-1 unfixed (rows IL/DL/HR), so there is no "conservative E4" that satisfies A1. Take the corner explicitly and delete the P019 claim that alignment is preserved — or park E4 and say so plainly. What it costs should be stated: the S2 LTF-align gate becomes advisory for any confirm-bearing candidate.
- **`g_fallbackBufs` share-vs-copy:** neither. Copying invites list drift; a shared static still duplicates the traversal. See ask B.
- **E1 bound style:** neighbour form, and hoisted — see ask B.

---

## Analytic ask B — better mechanisms

**B1. Fold the fallback into the existing walker instead of adding a parallel one.** Add a `bool filtersOff = false` parameter to `ComputeNearestTpTarget` (EA ~2356-2481) and gate its validity filters on it; the S2 site becomes a second call with `true` on first-pass failure. Touches: `ComputeNearestTpTarget` signature/filters (EA 2356-2481), C7306-C7313. Deletes the 21-line helper (P071-P091), `g_fallbackBufs` (P080), `ReadFlow` (P080), the magic `18` (P077), and P092's open question, and it guarantees one buffer-id list forever. Cost: it modifies a proven function, so its body must come onto the page for exact-diff. That is the right trade — the current form asks you to duplicate an 18-id list you cannot see.

**B2. Replace the A2 exemption with a reclaim test, which is what "break-then-reclaim is the setup" actually says.** For POC anchors, instead of skipping the close-side term, require the *confirm* bar to close back on the setup side: `(dir == DIR_LONG) ? (c0 >= L) : (c0 <= L)`. Touches C2224-C2225. This keeps a positive structural test rather than deleting a guard, and it settles finding 2 on the rows: miss-3's `TPCENSUS #147` puts `Daily-POC*` 4pts from `close=160.519`, i.e. POC ≈ 160.515 and the 14:45 close is above it — a reclaim. The 14:40 close was below (hence `A2_CLOSE_BREAK`). So a reclaim term fires miss-3 while the current `B_BODY` term (`c0 > o0`, and the bar is `body=1pts` with `bodyDir=0`) still refuses it. **The council must therefore rule B_BODY for POC anchors as well, or A3 is unreachable under either form.** Confirm the POC value against disk before adopting the arithmetic — 4pts is the census distance, not a printed line value.

**B3. Hoist the POC flag once and reuse it.** Compute `bool anchorIsPoc = (StringFind(g_lineCode[anchorLine], "POC") >= 0);` above C2217, use it at C2220 in place of the second `StringFind`, and use it at C2225. Touches C2216-C2220, C2224-C2225. Net +1 instead of +2, one `StringFind` fewer, no `POI_NLINES`, and the bound-style open disappears.

**B4. Patch the abort at the abort, not at one call site.** Row FL proves a second `NO_TP_TARGET` path from S4_ARMED. Put the fallback behind the target computation itself (B1) so every call site inherits it, then let `GoAbort(ABORT_NO_TP_TARGET, …)` mean only "no in-direction line exists at all." Touches the `ComputeNearestTpTarget` body plus C7307 and the S4-side call site (line numbers not on the page — they must be pasted).

**B5. Make the new rows carry their own evidence.** `TPFALLBACK` should print `line=`, `distPts=`, `rank=` and whether the booked line is the entry anchor, matching the `Daily-POC*:4` convention in `#147`; `CONFIRM_PREBIND_S2` should print the confirm term set and the seed-to-confirm bar age. Touches P066-P068 and P123-P125. Without this, A2 and A1 grade the existence of a row rather than the correctness of a decision.

**B6. Restate A5 as a superset join, not zero-delta.** Prior 7 EU takes bit-identical on bar/entry/exit; each new EU take journal-matched and attributed to E1, E2, or E4 by a row tag; each of the 4 former `NO_TP_TARGET` venues resolving take-or-refuse with its row. Touches P146 and P010's anchor language. As written, the fence and the fix contradict each other and the run has no pass condition.

**B7. Reuse the existing S2 poll result rather than adding a third predicate call (P116).** The `CONFIRMPOLL` site already computes `confirm` at S2 (row DL). Acting on that value keeps one evaluation per bar per candidate. Requires pasting the poll site.

Minimum to re-present: fix findings 1-4, name S5's SL/zone provenance for an S2-origin promotion, paste the elided anchors (EA 2356-2481, the S5 gate block, the `CONFIRMPOLL` site, the S4-side abort site), and restate A3 and A5 so both have reachable pass conditions. Nothing here builds, runs, or spends.
## V274-USDJPY-CLEAR1 END OPUS (verbatim close; filed whole 1x this turn, novel inbound)
## V281-USDJPY-GUARDS OPEN OPUS (verbatim open; filed whole 1x this turn, novel inbound)
# RELAY v281 — VERDICT on PACKET_P-USDJPY-2 v1

Scope acknowledged: page-only ruling. No build, no run, no commit, no money move, no key handling, no disk-genuineness claim. Digests/counts above are taken as your machine's truth, not re-derived here.

---

## Q1 (E6a flip gate) — **DISCREPANCY**

Three sub-claims, different answers.

**(a) "ORDER census newness predicate verbatim" — YES.** Term-for-term match:

| new | census |
|---|---|
| P068 `antiNow=-1, antiPrev=-1` | C5119 |
| P069 `want = (LONG)?1:-1` | C5117 |
| P071 triple read at `barShift` | C5120 |
| P073-P076 counting `== -want` | C5122-C5125 |
| P078-P085 prior bar at `barShift+1` | C5127-C5134 |
| P086 `antiNow>=2 && antiPrev>=0 && antiPrev<2` | C5135 |

`bool` vs `int` return is the only difference; semantics identical.

**(b) "correct reading of his S3.3 flip-kill" — DISCREPANCY.** P010 records S3.3 Step 2 as a **5m flip** against the locked direction. E6a tests **HTF leg census** (P071/P079, FL_BUF_HTF_HIGH/MID/LOW). Those are different signals on different timeframes. The substitution is forced, and the packet does not say so: the E4b branch is entered from `!aligned` (P064), so the 5m/LTF bias is *already* opposed on every E4b promotion by construction — a literal 5m-flip gate would kill the entire E4b path including A1, which his CONFIRM-ONCE ruling preserves (P012). So the HTF census is a **proxy chosen because it separates the three ruled rows**, not a reading of S3.3. That is defensible engineering; calling it "his S3.3 rule" in the code comment (P067) and rule text (P018) is a substitution presented as a citation. Amend the wording, keep the mechanism.

The row evidence for the proxy is real and I credit it: at the confirm bars the census already printed `flipNewThisBar=1` for 6/04 16:15 (`biasAtGate=2`) and 6/08 09:30 (`biasAtGate=3`), and `0` for A1 6/05 09:40 (`biasAtGate=1`) and A4 6/03 09:05. Same `barShift` (all rows `bar=1`), same pass, same reads — E6a will reproduce that split. B1/B2/B3 hold for E6a on the page.

**(c) "S2WAIT-retain is the right disposition" — NO.** This is the material defect of the packet.

The newness predicate **self-clears on the next bar**. Block at bar N with `antiNow>=2, antiPrev<2`; the candidate is retained at S2 (P114 `return`, no state change, no invalidation). At bar N+1 `antiPrev` is now `>=2`, so P086 is false — and the promotion is permitted **with the HTF opposition still fully standing**. 6/08 is the worst case: `biasAtGate=3`. Three legs opposed, blocked once, then waved through.

So E6a is not a kill, it is a one-bar deferral conditional on a fresh confirmation candle. S3.3 as recorded at P010 says the flip **kills**. Retain is not that. Correct dispositions, either of:
- kill the candidate (invalidate at S2, per "kills"), or
- gate on **standing** opposition rather than newness, so retain is harmless because the block persists while the opposition does.

The second is cheap and already has a name in your own code: `oOpp` / `biasOpposedAtGate` at C5141 (`antiNow>=2`). See Analytic B, item 1.

Acceptance cannot catch this: B1 (P143) and B2 (P144) test only "NO SIGNAL at 16:20" and "NO SIGNAL at 09:35". Both pass while the ruled violation reappears at 16:25 / 09:40.

---

## Q2 (E6b POI-break guard) — **DISCREPANCY**; E4b-only scope — **YES, acceptable**

**Correct as read:**
- Walk range. P089-P092 walks `barShift+1 .. seedShift` inclusive, i.e. bars strictly newer than seed excluded at the far end, confirm bar excluded at the near end. Excluded? bars strictly newer than seed excluded at the far end — wait, `barShift+1 .. seedShift` INCLUDES seedShift and everything between; confirm bar (barShift) excluded. The parenthetical is slightly garbled but the verdict's meaning (confirm excluded, seed included) matches the code. Confirm bar excluded at the near end. Excluding the confirm bar is right: for a SHORT the against-direction test is `crossUp` (P101), and the confirm bar's own close beyond the POI is the confirmation, not a break.
- `iBarShift` failure. P089 returning `-1` fails `> barShift` at P090, so the walk is skipped and no gate fires. "Unreadable seed = no gate" is implemented, though only incidentally by the comparison — there is no explicit check.
- `seedShift == barShift` (confirm on the seed bar) correctly yields no walk: nothing intervening.
- Per-bar skip on EMPTY/zero (P095, P098) is implemented as stated.

**Correct as read:** (repeated header in his paste - filed as received)
- Walk range. P089-P092 walks `barShift+1 .. seedShift` inclusive, i.e. bars strictly newer than seed excluded at the far end, confirm bar excluded at the near end. Excluded? bars strictly newer than seed excluded at the far end — wait, `barShift+1 .. seedShift` INCLUDES seedShift and everything between; confirm bar (barShift) excluded. The parenthetical is slightly garbled but the verdict's meaning (confirm excluded, seed included) matches the code. Confirm bar excluded at the near end. Excluding the confirm bar is right: for a SHORT the against-direction test is `crossUp` (P101), and the confirm bar's own close beyond the POI is the confirmation, not a break.
- `iBarShift` failure. P089 returning `-1` fails `> barShift` at P090, so the walk is skipped and no gate fires. "Unreadable seed = no gate" is implemented, though only incidentally by the comparison — there is no explicit check.
- `seedShift == barShift` (confirm on the seed bar) correctly yields no walk: nothing intervening.
- Per-bar skip on EMPTY/zero (P095, P098) is implemented as stated.

**Discrepancies:**

1. **The "behind gate" is dead logic.** P099 LONG: `behind = (v <= o)`. P100 `crossDn = (o >= v && c < v)` — its first term is the same condition. SHORT mirrors exactly: P099 `behind = (v >= o)`, P101 `crossUp = (o <= v && c > v)`. So `behind && against` ≡ `against` in both directions, and P103 is unchanged if P099 is deleted. There is no independent behind gate. This directly voids disclosure (3): the "per-bar open-relative side, not a latched side" describes a term with no effect on the outcome. Either drop P099 or make the side real (latched at arming / at the seed bar) — but the latter changes behavior and needs re-argument.

2. **Prose vs code on seed inclusivity.** Your change sentence says "body cross **between** seed and confirm bars"; P092 walks `<= seedShift`, **including** the seed bar. For 6/04 that means 16:10, 16:05, 16:00 are all tested. Small, but it is exactly the drift this relay exists to catch — pick one and make P019 and the brief agree.

3. **Seed walk is unbounded and unsanitized.** P089 uses `iBarShift` with default `exact=false` and there is no `g_anchorBarTime > 0` check and no lookback cap. If the anchor time is ever unset/zero, `iBarShift` resolves to the oldest available bar and P092 walks the entire history against a POI buffer, fail-open in the wrong direction (a spurious `pobreak=1` anywhere in history kills the promotion). Add `g_anchorBarTime>0` and a bound at P089-P092.

4. **The only E6b evidence instance has no predicted outcome.** Per P009, 6/08 is the flip case ("killed by post-retest flip") and 6/04 is the body-break case ("voided by pre-confirmation-close POI body-break"). So E6b's motivating row count is **one**, and B1 (P143) records it as "pobreak per walk" — unfalsifiable. B2 (P144) does not mention pobreak. E6a alone satisfies B1 and B2. **E6b ships with zero predicted-positive acceptance.** That is a shipping-blind guard on a critical-severity finding.

5. **B3's E6b-clean claim is not carried by the cited row.** A1: seed 09:35, confirm 09:40, so the walk tests exactly one bar — 09:35. P014 offers the **09:40-bar** RETESTDIAG (`nearAbove=Daily-POC:4.0pts`) as proof of "no break 09:35->09:40". That row states the confirm bar's proximity, not the 09:35 bar's open/close against the Daily-POC, which is what P099-P103 actually evaluate. A1 preservation under E6b is asserted, not proved on the page. (A1 preservation under E6a *is* proved: `biasAtGate=1`.)

6. **Historical POI semantics are assumed.** P095 reads the POI buffer at past shifts. Whether that value is the level in force **at that bar** or the current level plotted back is not established on the page; P138's precedent establishes the call pattern (`ReadBuf1` on the POI handle at the walker site), not the historical semantics. Related: if seed and confirm straddle a daily rollover, a Daily-POC value changes across the walk and the bodies are compared against different levels — anchor identity drift. Out of scope for this packet (refinement) but noted as residue.

7. **Zero as the OHLC error sentinel.** P098 `e6b_o == 0.0 || e6b_c == 0.0` conflates "iOpen/iClose errored" with "price is zero". Safe for USDJPY/EURUSD, not portable. A rates read with a returned-count check is the correct form.

8. **`crossUp`/`crossDn` both computed, one used** (P100-P102). Harmless; note only because the packet and Q2 say "both directions," which means both *candidate* directions, not both crossings. Worth precision in P019.

**E4b-only scope — YES.** Both ruled instances rode E4b (P011), the refinement-phase order is his (P009, P022-P024), and the parking is explicit (P019). Accepted with one thing on the record: per P013 there is **no pre-confirmation POI guard anywhere in the EA** (PRECONFIRM/BEHIND_BROKEN/POI_SIDE, 0 hits), while the S3/S4 paths *do* face an LTF-flip analogue at C7119-C7130. So after this round the S3.3-flavored hole is partly covered on S3/S4 and the **S5.4 hole is uncovered on every path except E4b**. B4/B5 (P146-P147) pass by construction on untouched paths and cannot detect it. "S4/S3 identical" is a parity check, not evidence of cleanliness — do not let it read as one in the grade.

---

## Analytic ask A — defects, gaps, imprecisions

**Arithmetic and assembly (clean):**

- A1. Old block P031-P057 matches disk C8086-C8112 line for line, 27 lines. ✓
- A2. New block P059-P134 = 76 lines; insert P067-P115 = 49 lines; NET +49; 11552+49 = 11601 (P139). All check. ✓
- A3. No new inputs, buffers, abort codes, counters, or call-site classes (P059-P134 vs P005). ✓ Print-name E4B_GUARD not verifiable here (P138).

**Logic:**

- A4. **One-bar self-clearing gate** (P086, P114). Detailed in Q1(c). Headline defect.
- A5. **Timeframe substitution** (P010 "5m flip" vs P067/P071/P079 HTF legs). Detailed in Q1(b).
- A6. **Dead behind gate** (P099 subsumed by P100/P101). Voids disclosure (3).
- A7. **Fail-open with no trace.** Both guards fail open (P071/P079 unreadable → `antiNow/antiPrev = -1` → P086 false; P090 no walk; P095/P098 `continue`). The E4B_GUARD print exists **only inside the fire branch** (P106-P115). A promotion that proceeded because a read failed is byte-identical in the journal to a promotion that proceeded because the bars were clean. You cannot grade gate coverage, and B3/B7 cannot distinguish "gate evaluated, clean" from "gate never evaluated". This is the single cheapest thing to fix and it makes every other acceptance line stronger.
- A8. **Retain print is duplicated, not fallen into.** P018/P019 say the block "falls into the existing S2WAIT retain"; P114's text reads "LTF bias unaligned, candidate RETAINED (Stage 3a)" — the cause of *this* retain is the guard, not the LTF bias. Readable only in conjunction with the preceding E4B_GUARD row.
- A9. **Guard-kill rows are mislabeled in the journal.** P114's text reads "LTF bias unaligned, candidate RETAINED (Stage 3a)" — the cause of *this* retain is the guard, not the LTF bias. Readable only in conjunction with the preceding E4B_GUARD row.
- A10. **Guards run on bars with no promotion to block.** E6a/E6b are evaluated at P068-P105, before `IsConfirmationCandle` at P117. On any retained-S2 unaligned bar with no confirm candle, a fired guard prints E4B_GUARD and returns — a "blocked promotion" row where no promotion was pending. This inflates kill-row counts and directly undercuts B7's attribution rule ("each killed take carries its E4B_GUARD row", P149): the converse will not hold. It also runs the POI walk on every unaligned retain bar for no reason.
- A11. **Unbounded/unsanitized seed walk** (P089-P092). See Q2 item 3.
- A12. **`seedShift < barShift` is silent.** P090 skips with no anomaly print; if the anchor is ever re-seeded forward, the guard vanishes without a trace.
- A13. **Breaking bar is not reported.** P103 breaks on first hit; P109-P113 print `pobreak=1` only. On a critical entry-logic guard, the breaking bar's time, anchor value, open and close *are* the evidence. Without them B1's "pobreak per walk" cannot be adjudicated even after the run.
- A14. **`g_anchorBarTime` stability across retained S2 bars** is assumed, not stated (P089 vs P050/P127). If the anchor re-seeds while retained, the walk's far end moves between bars and the guard's coverage window changes silently.
- A15. **Disclosure (1) is materially incomplete** (P018, disclosure 1). The class that still promotes is not "never-aligned"; it is "fewer than 2 opposing legs now **OR** already ≥2 opposing on the prior bar". A1 is preserved because `biasAtGate=1`, not because it was never aligned. The second sub-class — standing maximal opposition — is not the A1 shape, is not covered by CONFIRM-ONCE, and includes the 6/04 and 6/08 shapes one bar later. As written the disclosure reads as "only the ruled class is blocked"; the code blocks only the *transition* into the ruled class.
- A16. **B1/B2 are one-bar-scoped** (P143-P144). They cannot detect A4. They need a window assertion: no SIGNAL on that candidate for the remainder of its S2 retention, or explicit invalidation.
- A17. **B1 does not predict pobreak; B2 does not mention it** (P143-P144). Only E6b evidence instance left unpredicted — see Q2 item 4.
- A18. **P014's controls are mismatched.** A1's cited RETESTDIAG is the confirm bar, not the walked seed bar (Q2 item 5). A4 is an S4-path row and E6b is E4b-only, so A4's "S5.4-clean" control is irrelevant to this packet — over-claimed at P014/P146.
- A19. **B7 is internally inconsistent** (P149). "His TAKEN rows must still take (guard-kill on his row = REGRESSION halt)" forbids exactly what the guards exist to do; the same line then provides for attributing killed takes. If a EURUSD baseline take carries a genuine fresh flip or a genuine pre-confirmation body-break, killing it is the guard working, not a regression. P150 half-fixes this with "attributed-or-halted". Collapse to one rule: killed EU takes are adjudicated on row evidence against S3.3/S5.4, halt only on an unattributable kill.
- A20. **"A walk-away halt with cause also satisfies" (P143)** is loose enough to pass B1 without either guard firing. Name the admissible causes or drop it.
- A21. **Grading depends on `InpDebugLog`.** Guard control flow is unconditional (correct), but the *only* observable is debug-gated (P108, P114) and no counter is added (P005). Fine under P025/P138's pinned `InpDebugLog=true`; state it as a grading precondition rather than leaving it implicit.
- A22. **Pre-existing print misattribution now load-bearing.** The three E4b rows carry `seqStamp=SEQ_UNSTAMPED seqCause=S4S5_NOBIAS` (C5142-C5143). The cause string names an S4→S5 origin; the actual cause on these rows is the S2→S5 jump (P013). Out of scope to fix, named because your bypass proof leans on those rows and the label contradicts the claim it is being used to support.

---

## Analytic ask B — better mechanisms

1. **Gate on standing opposition, not newness** — closes A4 without new machinery. Replace the block condition at P086/P106 with the state boolean your code already defines: `oOpp` / `biasOpposedAtGate` = `antiNow >= 2` (C5141). Keep `flipNewThisBar` as a print field (its correct role, C5135/C5144). Checked against all four evidence rows: A1 `biasAtGate=1` → 0, promotes ✓; A4 `biasAtGate=1` → 0, untouched ✓; 6/04 `biasAtGate=2` → 1, killed ✓; 6/08 `biasAtGate=3` → 1, killed ✓. Strictly safer, passes every row the newness predicate passes, and makes S2WAIT-retain a sound disposition because the block persists while the opposition does. Cost: more EURUSD takes may die under B7, which is diagnostic, not a regression. Touches P068-P086, P106, P109-P113 (print both fields), P018, P143-P144, P149.

2. **Move both guards inside the confirm-true branch** — fixes A10 and B7's attribution, and removes the POI walk from every unaligned retain bar. Evaluate P068-P105 after `IsConfirmationCandle` succeeds at P117, before the state assignment at P121. Then a fired guard is by definition a blocked promotion, one-to-one with a would-be take.

3. **Unconditional census/walk diagnostic** — fixes A7 and unblocks B3/B7 auditing. Print one row per E4b promotion attempt with `antiNow`, `antiPrev`, `seedShift`, bars walked, and `poiReads`, whether or not the gate fires. Reuse the E4B_GUARD name with a `fired=` field, or add `E4B_GATEDIAG`. Touches P106-P115 plus one new print-name entry at P138.

4. **Report the breaking bar** — fixes A13. Carry `e6b_s`, `iTime(...,e6b_s)`, `e6b_v`, `e6b_o`, `e6b_c` out of the loop at P103 and into the print at P109-P113. Makes B1's pobreak leg adjudicable post-run.

5. **Sanitize and bound the seed resolution** — fixes A11/A12. At P089: require `g_anchorBarTime > 0`, use `iBarShift(..., true)` or validate the resolved time against `g_anchorBarTime`, cap `seedShift - barShift` at a stated maximum, and print an anomaly row on `seedShift < barShift` or cap-exceeded instead of silently skipping.

6. **Make the behind term real or delete it** — fixes A6/disclosure (3). Delete P099 (behavior-identical, one less line to defend), or latch the side once at the seed bar and test `behind` against that, which is a genuine gate and a genuine behavior change needing its own row evidence. Do not keep a no-op term described in a disclosure as if it were doing work.

7. **Record the insertion site for the parked S3/S4 extension** — the LTF invariant block at C7119-C7130 already runs for `ST_S3_ZONE_WAIT..ST_S5_GATE_CHECK`, already holds a `CheckLtfAlign` + `GoAbort`, and is exactly the block E4b bypasses (P013). Naming it now costs nothing and gives the parked item a single site instead of a re-survey next round. Note in P019/P024 only; no edit this round.

8. **Factor the retain print** — fixes A8/A9. One helper emitting the S2WAIT row with a cause argument (`LTF_UNALIGNED` / `E4B_GUARD`), called from both P114 and P130. Removes the duplicated literal and makes guard kills separable in the journal without a second grep.

---

## Rulings on the open disclosures

| # | Disclosure | Ruling |
|---|---|---|
| 1 | Never-aligned candidates still promote; only fresh flips block | **AMEND.** Materially incomplete. The pass-through class also includes standing ≥2-leg opposition, which is not the A1 shape and not covered by CONFIRM-ONCE. A1 survives because `biasAtGate=1`, not because it was never aligned. See A15, A4. |
| 2 | Unreadable reads = no gate, both guards | **AMEND.** The fail direction is arguable ("unprovable is not a break"), but the convention is being carried from a **print** site (C5136-C5146, harmless) to a **control** site (P106, not harmless), and no-gate promotions currently leave no journal trace. Acceptable only with Analytic-B item 3 attached, and the transfer itself wants his word rather than convention inheritance. |
| 3 | E6b behind gate uses per-bar open-relative side | **AMEND.** Describes a term with no effect on the outcome: P099 is subsumed by the first conjunct of P100/P101 in both directions. |
| 4 | E4b-only scope, S3/S4 at baseline by design | **ACCEPT**, with it on the record that S5.4 then has zero coverage on every path (P013) and that B4/B5 are parity checks which cannot detect that exposure. |

---

## Disposition

**AMEND.** Not clear.

Blocking before transport: **A4** (one-bar self-clearing gate — the packet does not deliver a kill), **A7** (fail-open with no trace), **A17** (E6b has no predicted-positive acceptance on its single motivating row), **A19** (B7 self-contradictory).

Correct and creditable as built: old-block fidelity to C8086-C8112, the +49 arithmetic, verbatim census reuse against C5117-C5135, the confirm-bar exclusion at P092, `iBarShift` failure falling to no-gate at P090, and the row-level discrimination proof — `flipNewThisBar=1` on both ruled instances, `0` on A1 and A4 — which does carry E6a's B1/B2/B3 claims on the page.

Everything above is a page ruling. Nothing here builds, runs, commits, spends, or clears live activation.
## V281-USDJPY-GUARDS END OPUS (verbatim close; filed whole 1x this turn, novel inbound)
## V284-USDJPY-GUARDS4 OPEN OPUS (verbatim open; filed whole 1x this turn, novel inbound)
# RELAY v284 — PACKET_P-USDJPY-2 v4 — verdict

## Q1 (E6a amended): **YES**

The narrowed proof plus the SKIP print satisfies Q1 without the shared helper. Checked element by element against the pasted ORDER site:

| element | packet | ORDER | result |
|---|---|---|---|
| want | P074 | C5117 | identical |
| −1 init | P073 | C5119 | identical |
| now-bundle read | P076 | C5120 | identical (HIGH/MID/LOW, `barShift`) |
| now count | P078–P081 | C5122–C5125 | identical, term for term |
| prev-bundle read | P084 | C5128 | identical (`barShift + 1`) |
| prev count | P086–P089 | C5130–C5133 | identical |
| flip predicate | P091 | C5135 | identical (bool vs int ternary, same terms) |
| gate | P092 | C5141 | block-equivalent (below) |

**Narrowed claim is true as written.** `oOpp` (C5141) is `1` iff `oAntiNow >= 2`; `e6a_block` (P092) is `true` iff `e6a_antiNow >= 2`. Therefore `e6a_block == (oOpp == 1)` on every input, including `antiNow == -1`, where both are no-kill. The v283 objection (LUNA-Q1/A1/A15, SONNET-Q1/A2, GLM-A1 — all labeled as priors) was against "same outputs on all inputs"; P013 and P017 now assert only identical block/no-block truth value, with the `-1` state carried in the raw fields. That is the exact statement the code supports.

**−1 remains adjudicable outside the gate bool:** `anti=%d/%d` prints raw `e6a_antiNow`/`e6a_antiPrev` at P128; nothing reads `e6a_unread` (P093) as a gate — P129 reads `e6a_block` only.

**SKIP print present and gated:** P093–P095, `reason=HTF`, `InpDebugLog`-gated, print-only, no control-flow effect.

**Disposition:** P129 `GoAbort(ABORT_LTF_MISALIGN, g_state)`, existing define C307, no new code.

**Two-emitter separability holds on the page:** the E4b kill fires with `g_state == ST_S2_LTF_ALIGN` (P129 executes before the transition at P133); the invariant emitter sits in the `ST_S3_ZONE_WAIT..ST_S5_GATE_CHECK` range (C7119) and reaches `GoAbort` at C7129 only through the state-range guard. `LogAbort` prints `state=%s` (C1730–C1732), so the ABORT row carries the discriminant. Comment P163–P167 states exactly this and drops the "now unambiguous" claim.

**Helper deferral honored:** no new function surface; E6a recomputes at P073–P090 (P013).

Imprecisions in this area are in Ask A items 1, 2, 9, 10 — none change the verdict.

## Q2 (E6b amended): **YES** for this round, against the paraphrase

**Tripwire fixed.** P122 `else if(e6b_seedShift >= 0 && e6b_seedShift < barShift)`. Full branch table with P103 and P108 upstream:

| seedShift | branch | output |
|---|---|---|
| `< 0` | P103 | SKIP `reason=SEED` (P106) |
| `> barShift` | P108 | walk (P110–P120) |
| `0 <= s < barShift` | P122 | SKIP `reason=SEEDORDER` (P125) |
| `== barShift` | none | silent fall-through to P127 |

Equal now genuinely falls through all three branches. The v283 blocking defect (LUNA-Q2/A2, SONNET-Q2/A1, GLM-Q2 — priors) is closed, and closed with both bounds explicit rather than relying on branch order, so a future reorder cannot silently re-break it.

**Predicate conforms.** Seed exact with the time guard: P101–P102 (`iBarShift(..., true)`, `g_anchorBarTime > 0`). Walk bounds seed-inclusive / confirm-exclusive: P110 (`barShift + 1 .. e6b_seedShift`), matching the P019 and P096 prose. Plain dir-matched body cross, no behind term anywhere in P097–P126: P118 (LONG `o >= v && c < v`; SHORT `o <= v && c > v`), and the asymmetry is now stated in prose at P019 and P096. Anchor value read per bar at P114, stated at P184.

**Raw fields conform.** P097–P100 inits; `e6b_walked++` every iteration P112; `e6b_skipped++` on bad POI read/EMPTY P114 and bad OHLC P117; breaking-bar capture P119 (`bt`/`bv`/`bo`/`bc`); all emitted at P128 as `anti=%d/%d seed=%d walked=%d skipped=%d bbar=%s bpx=%s/%s/%s`. A fully unreadable walk (`walked=N skipped=N`) is distinguishable from a clean one (`walked=N skipped=0`).

**Abort code conforms.** P130 `GoAbort(ABORT_S54_POIBREAK, g_state)`; define P155 with the ratified name; insert anchors P152–P153 match C323–C324 token and spacing as transported; comment line P154 carries no bare token. Attribution order P129 → P130 preserved, with both causes visible in the P128 row.

**Scope conforms.** Everything lives inside the confirm-true body opened at P070 and closed at P140. The else arm P141–P142 matches C8107–C8108; the fall-through P144–P146 matches C8110–C8112; no S3/S4 path, ORDER/DIV gate, counter, buffer, or input is touched. Abort control flow is unconditional; GUARD and SKIP rows are debug-gated; ABORT rows print unconditionally through C1728–C1733.

**Counts check against the pasted blocks.** New E4b block P061–P146 = 86 lines, old P033–P059 = 27, NET +59; defines 4−2 = +2; comment 5−4 = +1; total +62; post 11614. P031, P172 and the relay header all agree. No arithmetic contradiction this round.

**Caveat on the basis, not the verdict:** S5.4's authoritative text is still not on the page (P019–P020, P096 paraphrase plus the labeled finding 8EF27EF8). Per the verification split I rule against the paraphrase; if the paraphrase is wrong, my Q2 is wrong with it.

---

# Analytic ask A — defects, gaps, imprecisions

## Blocking-class for the acceptance battery (not for Q1/Q2)

**A1. B1 pre-declares `anti=2/1`, and the rows cannot pin the prev digit (P176, cf. P012, C5135).**
Row HJ gives `biasAtGate=2 flipNewThisBar=1`. `flipNewThisBar=1` at C5135 means `antiPrev >= 0 && antiPrev < 2`, i.e. `antiPrev ∈ {0,1}` — not `1`. B1 states `anti=2/1` as an expectation, and P182's global mismatch rule makes any evidence-field mismatch a halt. An `anti=2/0` row would therefore halt a grade that is otherwise exactly the ruled behavior. Same defect in B3 (P178, `anti=1/1`): row PN gives `biasAtGate=1 flipNewThisBar=0`, and with `antiNow=1` the flip predicate is false for every `antiPrev`, so `antiPrev` is completely unconstrained by the page. Fix: write `anti=2/{0,1}` and `anti=1/*`, or move the prev digit to adjudicated.

**A2. B1 pre-declares `pobreak=1` with no on-page price evidence (P176).**
B2 explicitly leaves `pobreak` adjudicated (P177), B1 does not. For 6/04 the walk covers shifts for 16:10, 16:05, 16:00 (seedbar 16:00 from row GG, confirm 16:15), so `walked=3` is derivable — but whether any of those three bars body-crossed the Daily-POC is nowhere on the page. Under P182, `pobreak=0` at 6/04 halts, even though E6a alone delivers the ruled kill (`opposed=1 anti=2`). B1 should mirror B2.

**A3. No clause for the ORDER row disappearing at the kill minutes (P176, P177, cf. rows HJ/RE).**
With the guard installed, 6/04 16:20 and 6/08 09:35 abort at S2 and never reach C5117–C5146, so `ORDER fields=10` rows at those minutes vanish. B1/B2 say nothing about it, and P182 treats any evidence-field expectation mismatch as a halt. Absence of an expected row is exactly the case the mismatch rule is worded to catch. State the absence as expected.

**A4. B4's "fills 159.932/159.929/159.983" mixes three different field kinds and contains an unexplained entry discrepancy (P179, P012, rows MH/KK/GM).**
Row MH: `EXECUTED fill=159.932 slPts=43 tpPts=51`; row KK: `SL 159.889 TP 159.983`. The point distances corroborate 159.932 as the entry basis (159.932 − 0.043 = 159.889; + 0.051 = 159.983). Row GM then reports `MTEXIT ... entry=159.929 exit=159.983`. So 159.929 is now on the page (closing the v283 GLM-A12 evidence gap as a citation), but it contradicts the EXECUTED fill for the same trade by 0.3 pip, and 159.983 is an exit, not a fill. Either it is a second/partial fill, or the MTEXIT entry field is sourced differently. P012's parenthetical "(A4 second fill)" asserts the first reading without evidence. B4 is a parity check, so this does not block, but a three-value equality expectation built on a self-inconsistent triple will produce an unresolvable halt. Route to the carry-check and restate B4 as `EXECUTED fill=159.932 ... MTEXIT entry=159.929 exit=159.983`, field-named.

**A5. B3's `TP_TOUCH 159.899` has no pasted row (P178, rows KS/HS).**
The only MTEXIT row on the page is GM (6/03). For A1, 159.899 appears solely as the ALERT's TP level (row KS), not as a touched exit. Page-evidence gap in the same lane as A4.

## Demands-ledger integrity

**A6. The GLM ruling column is mis-paired with its demands across at least seven items (relay demands block).**
- GLM-A2 (P119 equal-case defect) → "pairs corrected to bias/opposed with flip stated" — that is GLM-A3's remedy.
- GLM-A3 (P012 garbled sequence) → "renamed opposition kill with two emitters" — that is the LUNA-A6/B5 remedy.
- GLM-A4 (SKIP prints carry no numbers) → "ADOPTED as explicit tripwire" — that is the A2 remedy.
- GLM-A5 (open==POI equality unstated) → "S1 states trailing-space boundaries with SKIP subtracted" — census remedy, unrelated.
- GLM-A7 (census counts unpinned) → "ADOPTED as global mismatch clause" — unrelated, and see A13 below: the census is still unpinned.
- GLM-A8 (duplicate `GJ` token) → "B2 notes E6a-primary with pobreak adjudicated" — unrelated, and the collision persists (see A7).
- GLM-A10 (v9/v2 naming drift) → "ADOPTED as epoch-sentinel clause" — unrelated, and the drift persists (see A8).
- GLM-B1 (shared helper) → "ADOPTED as raw fields (plus skipped count)"; GLM-B2 (three-state break result) → "ADOPTED as explicit tripwire". Both read as adoptions of mechanisms that are *not* in the code: there is no helper (P073–P090 recomputes) and no three-state break result (P097 is a bool). P013 correctly says the helper stays DEFERRED, so the ledger contradicts the packet.
The code and packet came out right anyway — the tripwire, the P012 pair correction, and the prose clauses all landed — so nothing was built on a mis-paired ruling. The damage is to the carry-check itself: the operator compares what a seat sent against what was filed, and this column no longer supports that comparison. Two demands (GLM-A8, GLM-A10) are effectively **unruled** while appearing ruled, and GLM-A9 is recorded as "noted as grade-tested assumption" when its positive predicate was in fact executed at P182. Re-pair before the next round.

**A7. Duplicate row token `GJ` persists (rows fence).** `GJ` labels both `CONFIRM_PREBIND_FAIL` 6/05 16:10 and `TP_RR_FAIL_LATCH` 6/03 18:40. Citations by token are ambiguous, which is precisely what the fence exists to prevent.

**A8. Two live numbering schemes for the same artifacts (P003, P013, P190, relay priors).** P003 calls the superseded file v3 (25D60185) while the priors call the same digest "packet v10"; the ruling texts say the proof was "narrowed in v11" while this file is v4; P190 compares cost to "v10". If v4 == v11 the statements are consistent, but the page never says so. Add a one-line mapping, or drop one scheme.

**A9. P011 attributes the HTF SKIP print to "Sonnet-B1", which is not among the quoted v283 demands.** The quoted Sonnet B-items are B-Q2fix, B-Q1wording, B-durable. The SKIP print appears in the LUNA-A3 ruling text instead. Under "nothing built on unruled demands," the attribution should point at a quoted item or be recorded as builder-originated, the way the v9-header find was handled.

**A10. P012 corrects the pairs but drops the row tokens.** GLM-A3's corrected form was tied to PN/HJ/RE/RF; P012 writes clock/date labels only. Cite the tokens so the carry-check is mechanical. Related: P174 requires event tuples, never bare clock labels, yet B3 says "A1 09:40" and B5 says "A2 16:50" with no date (the rows put them at 6/05).

## Code-level imprecisions

**A11. `E4B_GUARD_SKIP reason=HTF` can co-print with a kill, and "SKIP" overstates what happens (P093–P095, P129).**
`e6a_unread` is `antiNow < 0 || antiPrev < 0`, but only `antiNow` gates (P092). With `antiNow = 2` and `antiPrev = -1` the row prints `reason=HTF` and the bar still aborts at P129. Nothing is skipped: the gate ran and killed. The prose at P018 ("HTF-unreadable prints ... reason=HTF") permits this reading, so it is not a discrepancy, but the token invites a grader to read a SKIP row as "guard did not decide." The `reason` value also does not say which of now/prev failed, nor which leg (the aggregate-unreadability gap recorded as a prior at LUNA-A8 in v283).

**A12. `e6b_walked` still counts attempts, not reads (P112 before P114).**
B3 now conjoins `skipped=0` (P178), and `walked>=1 ∧ skipped=0` does prove coverage, so the acceptance clause is sound. What remains unexecuted is the naming/semantics: P019 says "walked/skipped counters out" without defining that `walked` is bars attempted and `read = walked − skipped`. P185's epoch clause covers `bbar` and `anti/seed` but not the walked/skipped semantics. One sentence closes it.

**A13. P171's census is still not mechanically decidable (GLM-A7 residual).** No expected counts are pinned. Post-edit the page implies: `E4B_GUARD ` (trailing-space form) = 1 (P128); `E4B_GUARD_SKIP` = 3 (P095, P106, P125 — up from 2 in v3, because the HTF reason is new); `ABORT_S54_POIBREAK` = 2 (define P155 + call P130); `ReadFlow` HTF-leg calls = 12 post-build (6 at P076/P084 plus 6 at C5120/C5128), plus any pre-existing site not on this page. The trailing-space discriminator at P171 does work — `"E4B_GUARD "` cannot match `E4B_GUARD_SKIP` — but S1 cannot pass or fail a count that was never written down.

**A14. P005 "No counter touches" still contradicts P099 (LUNA-A7 residual, recorded as ruled).** Two function-local counters are added. The intended meaning is no existing or global strategy counter; say that.

**A15. SKIP rows still carry no numbers (P106, P125; GLM-A4/B3 residual).** Adjudication works, but only through the GUARD row: P128 prints `seed=%d` and both `bar=%s` and `seedbar=%s`, so `seed < barShift`, `seed == barShift`, and `seed < 0` are each recoverable by comparing the two times under the M5 pin. That is a time-arithmetic join, not a field read, and `barShift` itself is never printed as an integer anywhere in the row.

**A16. Which break is recorded is unstated (P110, P119, P182, P185).** The loop runs from `barShift + 1` toward the seed, i.e. newest to oldest, and `break`s on the first hit. So `bbar`/`bpx` capture the break **nearest the confirm bar**, not the earliest break, and a walk with several crossings is indistinguishable from one with a single crossing. B7's `bbar not epoch ∧ bpx populated` predicate is unaffected, but the prose should say which break the fields describe.

**A17. `reason=SEED` still covers two causes (P101, P103; GLM-A6 residual).** Anchor-time unset (`g_anchorBarTime <= 0`, seedShift stays −1 from P100) and `iBarShift` failure land on the same label. This *is* adjudicable, because P128 prints `seedbar=%s` and the unset case prints the 1970 epoch — but P185's epoch clause names only `bbar`, not `seedbar`. Extend the clause and the cause is fully separable.

**A18. Float-equality idioms (P114, P117).** `e6b_v == EMPTY_VALUE` and `e6b_o == 0.0 || e6b_c == 0.0` are exact double compares. Both are defensible here (`EMPTY_VALUE` is an assigned sentinel; a zero FX price is not reachable), and they follow existing practice, but they are the two places where a silent `skipped++` could hide a real value if a future buffer used a computed empty.

**A19. The walk has no span bound (P110).** `seedShift` is whatever `iBarShift` returns for the anchor bar. A long-retained anchor produces a proportionally long scan on every confirm-true bar. Only reachable on confirm-true, so the cost is bounded in practice by retention length, but nothing on the page caps it and no field reports the span independently of `walked`.

**A20. Abort rows still carry no cause fields (P129–P130, C1728–C1733).** Documented as a pairing procedure at P182, so not a logic error. Worth recording that the pairing is safe only because the print order within one pass is fixed — SKIP(HTF) → SKIP(SEED|SEEDORDER) → GUARD (P128) → ABORT — so the GUARD row is always immediately adjacent to its ABORT row. `LogAbort` prints `TimeCurrent()` and no bar identifier (C1730–C1732), so the join is by adjacency alone. That holds for single-symbol runs; it is an assumption, not a guarantee.

**A21. B8 remains a run-grade property (P183, P129–P130, C1728–C1733).** The excerpt proves `GoAbort(...); return;` and nothing about what `GoAbort` does after. Correctly treated as an acceptance check; noted so the basis stays explicit (a prior recorded at LUNA-A14 in v283).

**A22. Transport artifact at C318** (`Ã¢â‚¬â€` for an em-dash) is outside every edit anchor; the insert anchors C323–C324 are clean. Carry-check note only, so it is not mistaken for EA corruption.

**A23. Whitespace on the fall-through lines cannot be verified from chat (P144–P146 vs C8110–C8112).** The tokens match; leading-space counts arrive through transport. P171's char-code assert on every old anchor and insert byte is the only thing that can settle it, which is where it belongs.

## Confirmed executed from v283 (no action)

Epoch-sentinel clause P185; dynamic-anchor clause P184; B7 positive field predicate P182 (`opposed=1 ∧ anti>=2`; `pobreak=1 ∧ bbar≠epoch ∧ bpx populated`) plus the global mismatch rule; abort-pairing procedure P182; opposition-kill / POI-break rename P018, P163–P167, P176–P177, P182; asymmetric strictness stated P019, P096; parked site named EA 7119-7130 at P026; WAIVED pair pasted (rows EQ/GK, `hits=2 pair`, bar 16:00 / print 16:05 — P012 says "16:05", which is the print minute, worth stating as such since three other `A2_WAIVED_POC` rows exist at HF, DN, QL and "count 2" scopes to that one minute only); MTEXIT row pasted (GM), subject to A4.

---

# Analytic ask B — better mechanisms

**B1. Tri-state opposition helper, consumed by both sites** (touches C5117–C5141 and replaces P073–P090). Returns `-1/0/1`; E6a becomes `bool e6a_block = (SrjHtfOpposition(barShift, g_dir, antiNow, antiPrev) == 1);`. This retires the equivalence argument entirely — no proof to narrow, no drift point to re-verify each round. New function surface, so it stays deferred pending his scope word; recording it as still the durable fix.

**B2. Split the HTF skip reason and gate it on the gating leg** (P093–P095). `reason=HTF_NOW` when `antiNow < 0`, `reason=HTF_PREV` when only `antiPrev < 0`. Then a SKIP row never co-occurs with a kill under a label that implies no decision was made (A11), and the row says which read failed. Two literals, no new fields.

**B3. Emit the read count** (P099 init, P128 format). `int e6b_read = e6b_walked - e6b_skipped;` printed as `read=%d`, with B3 at P178 requiring `read>=1`. The acceptance clause then proves coverage from one field instead of a conjunction a future edit could drop.

**B4. Self-adjudicating SKIP rows** (P106, P125). Add `seed=%d cbar=%d` to both prints. `SEED`, `SEEDORDER`-inverted, and the ruled-silent equal case become classifiable from the SKIP row alone, and the tripwire stays audit-proof even if the branch is later reordered. No new function surface; this is the cheapest remaining hardening on the page.

**B5. Span cap with its own reason** (P108–P121). `else if(e6b_seedShift > barShift && e6b_seedShift - barShift <= InpMaxWalk)` is out of scope (new input), but a literal cap with `reason=SEEDSPAN` and the span in the row bounds A19 and makes a pathological anchor visible instead of expensive.

**B6. Crossing count instead of a single capture** (P110–P120, P128). Keep `break` for control flow, add `e6b_hits++` before it or drop the break and count, printing `hits=%d`. Distinguishes one crossing from several and tells the grader unambiguously that `bbar` is the nearest-to-confirm one (A16).

**B7. `seqStamp` as a free E4b-path discriminator** (P176–P179 acceptance text, evidence C5142–C5146). The three E4b-exception instances on the page are exactly the `SEQ_UNSTAMPED` / `S4S5_NOBIAS` rows (PN, HJ, RE, each paired with a `CONFIRM_PREBIND_S2` row — CM, GG, EJ), while A4 is `STAMPED` (RF) with no PREBIND row, because it reached the confirm bar already at S3+ and never took the exception. So B4 can state positively that **no `E4B_GUARD` row is expected at A4**, and B1/B2/B3 can each assert a GUARD row exists. That converts "S4 path untouched" from an assertion into a row-checkable expectation at zero code cost.

**B8. Abort rows carrying their own cause** (C1728–C1733, call sites P129–P130). An optional evidence parameter on `LogAbort` — defaulted empty so the other ~20 call sites are untouched — would let the two E4b aborts print `opposed`/`pobreak`/`anti`/`seed` inline and retire the GUARD-pairing join dependency (A20) and its adjacency assumption. Changes a shared function signature, so deferred-class, needs his scope word.

Nothing above re-petitions a parked item: no latched side, no retain-print helper, no S3/S4 extension.
## V284-USDJPY-GUARDS4 END OPUS (verbatim close; filed whole 1x this turn, novel inbound)

## V329-IMPL2-14 OPEN OPUS (filed whole 1x this turn, novel inbound; 4-seat 28-Sep paste, Opus text as received; byte-exact as received incl. transport glyphs; parked seat, advisory, zero weight; see ledger)

Opus:
# Q1 - H2b day-check with fail flag

**CONFIRM** — The day-equality guards plus uj_histFail flag with reason plus UJHISTFAIL row plus tmpT drop close the V328 evidence gaps as stated.

**Reasoning:**
- **Day-equality enforcement:** P368 refresh guard `uj_hdayt != uj_histToday && uj_hdayt > 0 && UjDayKey(iTime(_Symbol, PERIOD_D1, 0)) == uj_hdayk` ensures refresh only on M5-day rollover matching D1-day rollover
- P420 consult guard `uj_histToday == uj_hdayt && uj_hdayt > 0 && ... && UjDayKey(iTime(_Symbol, PERIOD_D1, 0)) == uj_hdayk` ensures consult only when refresh succeeded same-day
- Sentinels `uj_hdayt > 0` at both gates prevent dead-clock mode from consulting empty stores (P368/P420)
- **Fail flag mechanism:** P359/P360 declare uj_histFail + uj_histWhy at file scope
- P379/P392/P397/P408 set failures with reasons EMPTY/INVALID/COMMIT
- P418 sets WITNESS failure when yesterday/today D1 reads fail integrity
- P419 prints UJHISTFAIL with reason on any failure
- P404 clears flag on commit success, P408 sets flag on commit fail
- **tmpT removal:** P383 comment explicitly states "v16: uj_tmpT retired (ordering uses uj_prevT/uj_hasP locals)"
- P384 shows uj_prevT/uj_hasP per-fill locals replacing the temp array
- P391/P394 use uj_prevT/uj_hasP for strictly-decreasing D1 time validation
- **Prove-window behavior unchanged:** Day-equality on prove windows (June/August fixed dates) means refresh runs once at window-open then consults succeed throughout; failure modes (EMPTY/INVALID/WITNESS) cannot occur on static tester history with valid D1 data

No defects in the mechanism.

---

# Q2 - P033 t133 with G2 prebind and census evidence

**CONFIRM** — The P033 t133-operative wording plus G2 prebind route plus census proof plus R46/R54/R42 reconciliation are consistent as stated.

**Reasoning:**
- **P033 t133 operative claim:** P033 states t133 BAR test at EA-8715 sets s31_inPlay, triggering the arming-if at EA-8784, which skips UJALIGN when held
- EA-8664-8670 shows t133 verdict locals init false
- EA-8740-8784 shows INPLAYCOMMIT region ending with arming-if test `if((haveFvg || haveXob) && s31_inPlay)`
- EA-8813-8828 shows else-branch containing UJALIGN
- Conditional logic confirmed: arming-if holds → UJALIGN skipped; arming-if fails → UJALIGN runs
- **G2 prebind route:** P315 states prebind route as "S3/prebind route, skipping the S4-to-S5 edge"
- EA-8841-8863 shows prebind confirmation at S3_ZONE_WAIT transitioning S3→S5 with CONFIRM_PREBIND print
- EA-8990-9002 shows S4→S5 edge with CONFIRM_STRUCT_FAIL on failure
- Routes distinguished: prebind prints CONFIRM_PREBIND, split-bar prints nothing on PASS or CONFIRM_STRUCT_FAIL on failure
- **Census winner proof:** P315 states "Census-winner NONE expected there (print-only local)"
- EA-2557-2610 shows winner local set EA-2573/2585/2600, used only in TPCENSUS print EA-2597-2609
- EA-11420-11428 shows UJREELECT using separate mechanism (TpTargetUpdateBest → best/haveBest), printing winner=NONE on !haveBest
- Census winner never gates anything; election uses best/haveBest globals set by UpdateBest calls
- **R46/R54/R42 reconciliation:** P027 explicitly states "R45 splices #45 and R46 splices #20; #46 exists unspliced"
- R45 row shows TPCENSUS #45 with bar=14:35
- P465 notes #46 at bar=14:40 is post-entry (ENTRY-BAR ruling), segment-verified but relay-unspliced
- R54 shows wsrc=ASH where P461 notes YASH is RECON63 label; "parity on values" reconciles label divergence
- R42 shows LEGTOUCH bar=14:35 as evaluated bar, bounds-only, explicitly NOT touch evidence per P315 term-4

All statements internally consistent.

---

# R1 - purge-verified plus labels rider

**CONFIRM** — The stale purge plus v16 label bumps plus authoritative names paragraph are consistent as stated.

**Reasoning:**
- **Stale purge:** P473 design history shows v8→v16 progression with numbered Fix-letters A/B/C/D/E/F/G1/G2/H1/H2
- P352 states v16 authoritative names: live list uj_histHi/uj_histLo/...uj_histWhy + v14 carried names
- P352 retired list: uj_dcount/uj_dd (v12), uj_runM/... (v13), uj_tmpT (v14)
- P003 Status line shows v16 digest 6F337E27 with v15 V328 fold complete
- **Version labels current:** P461 shows A-SL1-PRESERVE, P462 A-S2P-RETAKE, P463 A-POIV-RETAKE, P464 A-FB-RETAKE, P465 A-EU-PRESERVE
- P473 annex shows IMPL-2 v1→v16 progression with V316→V329 fold markers
- **Authoritative names:** P352 explicitly states "v16 authoritative names (battery census this turn)" with complete live/retired split
- P003 shows v16 DRAFT status with V328 fold plus amendments list
- P458 budget reconciliation shows NET +149 with line-by-line accounting

No label drift or stale references remain in operative prose.

---

# Analytic Notes (Consolidated)

**A1. H2b refresh halt-on-any-invalid is strict but correct**
- P391 validation: ANY invalid record (time/hi/lo/order) fails entire refresh via P392 `uj_hok = false; uj_histWhy = "INVALID"; break`
- Consequence: one corrupt D1 bar blocks consult even if 99 valid days exist
- Justification: declared at P354 "fill validates time+hi+lo+order per read and ANY invalid available record fails the refresh"
- Alternative would be truncate-to-valid-prefix (keep valid records, stop at first invalid)
- Current design prioritizes data integrity over availability; acceptable for alert-only + prove-window scope

**A2. UJHISTFAIL reason taxonomy incomplete**
- P359-P360 declare uj_histWhy as string
- P379/P392/P397 set reasons EMPTY/INVALID/COMMIT
- P418 sets WITNESS
- No SENTINEL reason despite P368/P420 using `uj_hdayt > 0` guards
- If sentinel fires (dead M5 clock), failure is silent (uj_histFail stays previous value)
- Impact: minimal (prove windows have valid clocks; live-terminal dead-clock already degrades)
- Recommendation: add `if(uj_hdayt <= 0) { uj_histFail = true; uj_histWhy = "SENTINEL"; }` before P379

**A3. Swept-record filter duplicates running-max logic in refresh and consult**
- P385-P395 refresh fill computes uj_prevT/uj_hasP for strictly-decreasing time validation
- P420-P435 consult computes uj_cRun as direction-dependent running max/min for swept detection
- Both iterate same data structure with similar patterns
- Alternative: compute swept mask during refresh, store in parallel array, consult reads mask
- Current design re-scans on every consult; acceptable for alert-only (consult runs once per day max on prove windows)

**A4. P033 fallback-gate wording preserved despite diagnosis declaring it operative**
- P033 final sentence: "Fallback if council still OBJECTs: gate UJALIGN to ST_S3_ZONE_WAIT (code, stated now so the next round needs no new design)"
- Diagnosis declares t133 BAR test operative, so fallback should be moot
- Recommendation: strike fallback sentence or clarify it as "if diagnosis proves wrong"

**A5. G2 RETEST_CORROBORATED term-6 (cascade-pass touch absence) is fragile**
- P315 term-6: "cascade-pass touch absence as route-consistency check: zero UJTOUCHSEEN/LEGTOUCH prints expected ON the cascade evaluation pass only"
- Relies on absence-of-print as evidence
- If print is accidentally present (code error, extra call), term-6 fails even if terms 1-5 pass
- Alternative: positive route marker (UJCONFIRMCARRY already exists for cascade route)
- Current design uses negative evidence for consistency check; acceptable as cross-check not primary proof

**B1. Refresh could batch-validate and commit atomically**
Current flow (P378-P409):
1. Probe count available D1 bars → uj_dcap
2. Resize temps, fill with validation
3. Resize target arrays, copy from temps

Alternative single-pass:
```mql5
// Resize targets directly to probed count, fill with validation, rollback on any fail
if(uj_dcap > 0 && ArrayResize(uj_histHi, uj_dcap) == uj_dcap && ...)
  {
   for(int uj_dr = 0; uj_dr < uj_dcap && uj_hok; uj_dr++)
     {
      // Fill directly into uj_histHi[uj_dr], validate inline
      // On fail: ArrayResize all to 0, break
     }
  }
```

Touches: P378-P409 (refresh block)
Benefit: eliminates temp arrays, one fewer copy loop
Cost: rollback on fail is slightly more complex (must resize 3 arrays to 0)
Current design is more conservative (temps insulate target arrays from partial fills); acceptable.

**B2. UJALIGN could helper-wrap the M15-agree test**
- EA-8223-8233 (FIX C), EA-7224-7235 (FIX F), EA-8301-8311 (FIX G1), EA-8820-8829 (UJALIGN) all read FL_BUF_HTF_LOW and compare to want-value
- Identical pattern repeated 4 times
- Alternative: `bool UjM15Agrees(int barShift, ENUM_SRJ_DIR dir, double &m15Out)` returning true if readable and matches
- Touches: all 4 M15-read sites
- Benefit: single-source M15 semantics, easier to change buffer if needed
- Cost: one more function, 4 call-site changes
- Current design is explicit and auditable; refactor churn acknowledged at P452

---

All three questions confirmed. Packet internally consistent. Analytic notes flag minor improvements, none blocking.

## V329-IMPL2-14 END OPUS
## V355-UJFIX4-1 OPEN OPUS
Opus:
I need to carefully verify the four proposed telemetry insertions against the actual source, checking line numbers and surrounding context for each one to catch any discrepancies before giving my verdict on Q1. Starting with the CARRY-DECL insertion, I'm examining the declaration region to see whether the target line actually matches what's described.

Now I'm checking the CARRY-SET insertion, comparing the old and new blocks around the `uj_memo_valid = false;` assignment to confirm the anchor line and indentation line up correctly.

I notice a discrepancy: the closing brace's indentation shifted by one space between old and new blocks. Since the packet claims a pure-insert, zero-deletion splice, that whitespace change on an existing line technically violates the exact-match invariant even though it's compiler-harmless, so I'm flagging it as a discrepancy worth noting.

I'm checking another line-indentation discrepancy: the original condition line had 9 leading spaces, but the new version shows 10 spaces plus an inserted debug-log line before it, confirming another whitespace-level splice defect.

Beyond that formatting concern, I'm now questioning the actual placement logic of the CARRY-PROV print statement -- since it's unconditional relative to the S2 edge, it fires every pass through the region rather than only when the value genuinely changes, which conflicts with the claimed "fresh vs stale" semantics.

But there's a more meaningful gap: without logging the state of `uj_m15r`/`uj_m15b` alongside this print, the UJRESEEDPROV row alone can't tell you whether a given pass hit the kill path, the promote path, or neither -- you'd need to cross-reference the adjacent S2PROMOTE_M15 and S2SEEDBIAS_KILL rows to reconstruct what happened.

Also, the acceptance claim that the set is observed at H1 depends entirely on the S2-edge print firing, since there's no print at the SET site itself. I need to check whether the H1 branch that clears memo_valid is actually the same branch that emits the UJRESEED row -- that correspondence isn't guaranteed just because both happen at H1.

Looking at region R-H1SET more closely, it shows g_latchedR, g_latchBarTime, g_confirmFromState, and uj_memo_valid being reset, which looks like a latch-clear block inside the H1 reseed path. But the packet's claim that "barTime is in scope per the neighboring anchor assignment" doesn't hold up -- the actual lines reference g_latchBarTime, not barTime, so that particular assertion is unverifiable from the given six-line span.

By contrast, the CARRY-CLEAR region does show `g_mtrade.uj_admitBarTime = barTime;`, confirming barTime is genuinely in scope there. I'm also noting a separate gap: whether the SET site only fires on a successful reseed or also on failed overwrite attempts isn't determinable from the visible lines, which matters for whether provenance could get set without an actual reseed occurring.

Checking P052's format string against its arguments, the four specifiers (bar, dir, reseedBar, seedBiasAl) line up correctly with the four args, and the %d usage with s1g_seedBiasAl matches the pattern already used elsewhere in R-S2EDGE, so that's consistent. The supporting values like DirName(g_dir), TimeToString, and barShift are all confirmed in scope from neighboring lines.

Verifying the net line count now: adding 4 lines brings the total from 12291 to 12295, matching P080's claim, and the print statement itself is a single long line as expected.

I'm also noting a minor naming inconsistency — the new variable g_ujOpReseedBarTime uses a "g_uj" prefix while neighboring file-scope variables use just "uj_", though this doesn't rise to the level of an actual defect. Its declaration placement is also slightly odd, sitting in the middle of the uj_memo_* block rather than after it.

More importantly, there's a deeper staleness issue beyond what P064 acknowledges: the S2 kill path calls GoAbort and returns without clearing the variable, so on days where that path fires, the old reseed bar time carries over into the next session's prints. Since clearing only happens on ADMIT and admits are rare, this variable stays stale for nearly every print in the run, meaning you can't tell fresh from stale just by looking at the row alone — you'd need to cross-reference against UJRESEED rows.

So P070's claim that "fresh vs stale barTimes" are visible is an overclaim — only the raw value is visible, freshness has to be derived externally. A better approach would be printing a monotonic reseed counter or bar-delta inline, or including the seed's identity so each row is self-describing, or clearing the variable exactly when the seed itself dies rather than maintaining a separate lifecycle.

Actually, if `uj_memo_barTime` already exists in the decl region and gets updated on the H1 reseed path, provenance may already be derivable from existing fields — meaning the new global is redundant and a single print line could satisfy the goal without introducing new state or lifecycle management. I can't fully verify from the page whether that field is maintained correctly, though.

I'm also weighing a log-volume concern: the P052 print is gated on InpDebugLog (which acceptance criteria set true), but unlike existing branch-gated prints, this one fires on every S2 pass across the whole June window — potentially adding thousands of rows to a segment that's already 6+ million bytes, which could materially affect grading throughput.

I should note this as a defect with specific line references (P052, P070, P085), while being careful not to overstate the volume estimate since I'm not certain how often the S2 edge actually triggers. I'm also checking the exact insertion point relative to the existing ReadFlow and uj_wantb lines to confirm placement.

Now I'm questioning whether the anchor line for the CARRY-SET pattern is actually unique across the file — the page claims each anchor is "spliced once by match" but doesn't provide per-anchor counts, and `uj_memo_valid = false;` likely recurs in multiple places (declaration, H1SET, abort/IDLE reset paths), so uniqueness isn't guaranteed.

I'm also examining the CARRY-CLEAR placement, which sits right after the admission-tuple publish line, before the tradeSeq assignment — behaviorally fine, but I'm wondering whether clearing provenance at admission time (rather than after order confirmation) could leave things inconsistent if the order send later fails.

Then I'm double-checking the region line counts one by one: R-CARRY-DECL, R-H1SET, and R-S2EDGE all match their claimed line ranges and listed contents.

Continuing verification: R-ADMIT matches its 7-line range, total lines across all regions confirm the stated sum, and the twin/row/take counts all check out against their listed entries. The balance figures in the prose also align consistently with the takes sheet, though I'm noting a timestamp oddity in a couple of rows worth flagging.

Checking the timestamps more closely, R01-R04 belong to the v26 REF run and R05-R06 to the v28 KILL run, and their wall-clock ordering is consistent since v26's earlier timestamp precedes v28's. I'm now cross-referencing R04's confirm bar timing against R01's admit bar and matching that against P023's stated confirm conditions.

I also notice a discrepancy: P024 mentions kills at the 09:30/09:35 bars for the S2SEEDBIAS_KILL event, but only the 09:15 row (R06) actually appears among the carried rows, so that claim isn't fully supported by the data present.

Additionally, P024 attributes "sb=0" to the kill row itself, but the actual kill print format only carries bar/dir/poi fields — the sb=0 is really an inference from the else-if branch logic, not something explicitly printed. That's a precision issue worth flagging separately from the reseed row claim, which checks out fine (single row, al=0 ok=1).

I also want to verify the unset timestamp: TimeToString with those format flags in MQL5 returns "1970.01.01 00:00" for an unset value, which self-describes as never-reseeded — that checks out.

Then there's a naming collision concern: the print tag "UJRESEEDPROV" shares a prefix with the existing "UJRESEED" tag, so any log parser matching on that prefix could accidentally sweep up both into the same counter, corrupting census/grading batteries. That's a real defect worth flagging, and I'd recommend renaming to something more distinct like "UJPROV" to avoid the collision.

The claim that S5's election logic is untouched checks out fine with the insert-only pattern. But P005's "zero deleted lines" claim is only technically true — a brace/indentation change means a line was replaced, not literally deleted, so I'd call that a modified-line discrepancy worth noting. Similarly, the "mechanical splice, battery-verified diff 0" claim is undermined since the new-block anchors don't reproduce the old-block's whitespace exactly, even though the quoted regions themselves are 0-diff against the EA.

I also realize the green battery check only verifies twin equals packet, not that the new-block edit itself is a pure insert against the old blocks — that's the meta-point the whitespace drift analysis exposes. And acceptance criteria seem to have gaps too: nothing bounds the UJRESEEDPROV row count, nothing checks that no other log row shifted, and there's no negative check ruling out the never-reseeded 1970-row value showing up on June 8th.

I'm inclined toward objecting rather than confirming, given the two whitespace-modification discrepancies and the unverifiable in-scope staleness claim — the question specifically asks me to either confirm the decl/set/print/clear match their specified inserts with the stated limitation, or object with defects and line numbers.

All four are behavior-neutral declaration/assignment/print operations, so behavior change isn't the concern. But two of the new blocks alter the preserved anchor line's indentation, which breaks the exact-insert discipline specified at P005/P027 — that's a narrow, mechanically-fixable defect worth flagging with line numbers rather than a full rejection. The barTime in-scope claim at the SET site is separately unverifiable from the carried regions, which I should note as a gap rather than a confirmed defect.

Checking the R-S2EDGE barShift print statement, all referenced variables (barShift, g_dir, s1g_seedBiasAl) are in scope based on neighboring lines, and the insertion point before the if statement doesn't create any brace or dangling-else issues since the preceding if is self-contained.

Actually, checking the preceding lines, they're declaration statements like `bool uj_m15r = ...;`, and declarations aren't valid as the sole body of a braceless if in C++/MQL5 — so the block must already be braced, confirming the insertion is safe.

The CLEAR insertion and SET insertion similarly land in blocks with multiple assignment statements followed by a closing brace, so they're braced too. The DECL insertion is at file scope, so it's safe regardless.

I also need to account for line-number drift: since the DECL and SET insertions add lines earlier in the file, the quoted region line numbers (7894, 8408, 10721) shift downward after edits — S2EDGE anchors move by +2 and ADMIT by +3 post-edit.

Any future round citing EA-line numbers needs to state whether it's using pre- or post-edit line numbers, since the packet's citation of 12291→12295 doesn't specify that basis — that's worth flagging for Analytic ask A.

For Analytic ask B on better mechanisms, I'm considering reusing the existing bar-time memo variable if it's maintained on the reseed path, which would need just one line and no separate lifecycle tracking — though I need to verify the reseed path actually updates it. Alternatively, adding a reseed sequence counter or printing seed identity captured at reseed time would make each row self-describing without needing a join.

I'm also weighing whether to place the clear at the single choke point where the seed dies rather than where it's admitted, keeping GoAbort untouched — perhaps by printing both the reseed bar time and current bar for offline freshness comparison rather than clearing state directly, or self-invalidating at read time by checking the bar date, though that adds logic. Another option is emitting provenance separately inside the promote and kill branches so each row ties unambiguously to its outcome, trading off some log volume for clarity.

The cheapest approach turns out to be appending the reseed bar field directly onto the two existing print calls at the decision points — zero new lines, zero new rows, no tag collisions, provenance right where it belongs — but this modifies existing lines and row formats, which risks breaking downstream parsers, so I want to flag that trade-off clearly when I write this up.

Now I'm structuring the writeup: verdict first, then defects with line numbers, then the better mechanisms, keeping it thorough since they didn't ask for brevity on defects. I'm also double-checking the admit region assignment for file-wide uniqueness, since the same census gap could apply there, and noting the region's existing indentation inconsistency isn't something the new line needs to fix.

Confirming the CLEAR and DECL blocks are clean inserts with no anchor drift, so any drift is confined to SET and PROV. I check the new declaration lines against the existing type-padding convention (columns aligned to 9 chars) and confirm they match, then move to writing up the final answer, flagging one more claim about the observed set that needs scrutiny.

I realize the "set observed at H1" acceptance claim is actually unverifiable since nothing prints at the set site — but the existing UJRESEED row already logs the bar time at reseed, meaning the provenance value is already fully observable there. So the new global variable's only real purpose is to carry that value forward to the S2 edge, which an offline join between UJRESEED and S2 rows could accomplish just as well without adding new state.

This weakens the round's justification: the claimed novel evidence ("no prior run carries reseed provenance") is arguably false, since joining the existing rows already demonstrates that provenance chain. The truly new evidence is only the in-EA lifecycle tracking, which is instrumentation about the instrument rather than actual strategy evidence — so I should flag that the stated goal may already be satisfiable offline, making the extra code and new global low-value unless the v15 exemption design needs to read provenance at runtime.

My verdict is heading toward OBJECT, citing two splice-fidelity defects at P045 and P053, with everything else confirmed behavior-neutral aside from one unverified scope claim. I need to carefully verify the spacing discrepancy at those two lines, framing it as the preserved anchor line carrying one extra leading space relative to the EA region, which should be a reliable claim since the twin is ASCII.

I'll hedge this though: the drift only matters if the packet's whitespace rendering is authoritative and claimed to round-trip exactly. Now let me write it up with that conditional stated clearly.

## Q1 verdict: OBJECT

Two of the four new-blocks do not reproduce their preserved anchor line byte-for-byte, so the edit set is not the pure-insert set claimed at P005 and P027. Behavior-neutrality itself holds — all four sites are declaration, assignment, or gated print — but the "all inserts, zero deleted lines" invariant is broken at two sites, and one scope claim is unverifiable from the carried regions.

### Blocking defects

**D1. CARRY-SET alters the preserved closing brace (P045 vs R-H1SET line 5, EA 7898).**
The old-block trailing line is `                }` (16 leading spaces, per the 0-diff region). The new block re-emits it as `                 }` (17 spaces). That is a modified line, not an untouched one. Net line count is still +1, so P080 arithmetic survives, but the site is insert+modify and a strict exact-insert splice on the old-block text will not match on the way back out.

**D2. CARRY-PROV alters the preserved `if` line (P053 vs R-S2EDGE line 3, EA 8410).**
Old block P049 carries `         if(uj_m15r && uj_m15b == uj_wantb && s1g_seedBiasAl != 0)` at 9 leading spaces, matching the region. New block P053 re-emits the same line at 10 spaces. Same class as D1.

Both are whitespace-only and carry zero compile or runtime consequence. I am flagging them because the GREEN battery cited in Status does not cover them: twin 85/85 diff 0 compares the twin to the packet, and the 4 region spans are 0-diff versus the EA, but nothing in that battery compares each *new*-block against its *old*-block. The one invariant the round most needs (pure insert) is the one the battery does not test. Fix: re-emit P045 and P053 byte-identical to their old-block form, and add an old-vs-new prefix-identity check to the battery.

### Unverifiable claim (gap, not proven defect)

**G1. `barTime` in scope at the CARRY-SET site (P037, P044).**
P037 justifies scope "per the neighboring anchor assignment," but the carried region R-H1SET (EA 7894-7899) contains no `barTime` reference. The nearest assignment is `g_latchBarTime = 0;` — a literal, not `barTime`. So the page cannot support the scope claim at EA 7898. Contrast CARRY-CLEAR, where R-ADMIT line 3 does show `g_mtrade.uj_admitBarTime = barTime;` and scope is proven on the page. Fix: widen R-H1SET upward to the enclosing function signature or to the first `barTime` use.

**G2. No per-anchor occurrence census.** P027 says "STAGE-1 censuses each," but no site states n=1. `uj_memo_valid = false;` is precisely the kind of string that recurs across clear paths (it already appears twice in the carried regions alone — EA 302 and EA 7897), and the CARRY-SET old-block disambiguates only by a following `}`. Publish the file-wide occurrence count for all four old-blocks before any build.

### Verified clean

- **Dangling-else / braceless-body hazard at CARRY-PROV: absent.** Inserting a statement immediately before an `if/else if` chain is the classic way to silently re-bind an enclosing braceless `if` body. Here R-S2EDGE lines 1-2 are declaration statements preceding the `if` in the same block, and a declaration cannot be the sole substatement of a braceless `if`, so the block is necessarily braced and the insert cannot steal a body. The inserted `if(InpDebugLog) PrintFormat(...);` is semicolon-terminated, so the `else if` at EA 8415 still binds to EA 8410. Same reasoning clears CARRY-SET and CARRY-CLEAR (both land in multi-statement blocks).
- **Specifier/argument parity at P052:** 4 specifiers (`%s %s %s %d`), 4 arguments. `s1g_seedBiasAl` under `%d` matches its existing use in the S2PROMOTE_M15 call (R-S2EDGE line 7). `DirName`, `TimeToString`, `iTime`, `barShift`, `g_dir` all in scope per neighbors. P055 is correct that `TimeToString(0, ...)` renders `1970.01.01 00:00`.
- **Declaration style at P035:** `datetime ` padding matches the block convention (EA 300-306). Good.
- **Region and count arithmetic:** 7+6+9+7 = 29 lines in 4 spans, as claimed; twin P001-P085 = 85; rows R01-R08 = 8; budget 12291 +4 = 12295.
- **Settled-rules audit (P065):** consistent with the four sites. No gate, predicate, promotion, exit, or booking surface is touched. S5 election untouched.

### Analytic ask A — further defects and imprecisions

**A1. Tag namespace collision (P052 vs R05).** The new tag `UJRESEEDPROV` contains the existing tag `UJRESEED` as a prefix. Any grader, census counter, or grep that matches `UJRESEED` by prefix will now absorb the new rows and inflate the reseed count. This directly threatens the census discipline the packet otherwise enforces. Rename to something non-prefixing, e.g. `UJPROV` or `S2PROV`.

**A2. P070 claims an unobservable acceptance criterion.** "set observed at H1 passes" — there is no print at the CARRY-SET site (P044), so the set event is never directly observed. What the run will show is the value *as read at the S2 edge*, one or more passes later. Reword to "set inferred by joining UJRESEED rows to the next PROV row," or the criterion cannot be graded.

**A3. P070 overclaims "fresh vs stale barTimes visible."** The row carries a raw datetime and nothing to date it against except the `bar=` field in the same row. Freshness is therefore *derived* by an external join to UJRESEED rows, not visible in the row. Given P064 (no clear on abort/IDLE) and only 2 admits in the whole window, the value will be stale on the overwhelming majority of prints — so the default reading of any PROV row is "unknown provenance until joined." State that plainly, or make the row self-dating (see B2).

**A4. Log-volume growth is unbudgeted (P052, P084, P085).** The insert is placed *before* the `if`, so it fires on every S2-edge pass, whereas both existing prints are branch-gated. RECON76 came in at 32,026 rows / 6,162,087 bytes. I cannot estimate the new row count from the page — it depends on how many bars reach S2_LTF_ALIGN — but the packet should state an expected bound, because segment size feeds the grade battery and the census counters.

**A5. PROV row cannot be attributed to an outcome.** The row omits `uj_m15r`, `uj_m15b`, and state, and it prints before the branch. Pairing a PROV row to promote-vs-kill-vs-neither requires joining on bar+dir to the adjacent row. Either add the branch inputs or move the print into the branches (B4).

**A6. P024 attributes `sb=0` to the kill row; the kill row has no such field.** The S2SEEDBIAS_KILL format (R-S2EDGE line 9, EA-8416) prints `bar`, `dir`, `poi` only — confirmed by R06 and R07. `sb=0` is an inference from the else-if branch logic, not something explicitly printed. Label it as inference.

**A7. P024 asserts "kills at 09:30/09:35 bars"; no such rows are carried.** The only 6/5 kill on the page is R06 at bar 09:15. Either splice the 09:30/09:35 rows or downgrade the claim to segment-resident-but-not-carried.

**A8. EA line numbers are pre-edit and the page never says so.** After the DECL insert at EA 303, everything below shifts +1; after CARRY-SET, the S2 span shifts +2; ADMIT lands at +3. Any v15 packet citing EA-7868/8408/10721 must state the basis or the references will silently drift. Add a post-edit column to P080.

**A9. Clear placement precedes order dispatch (P061-P062, EA 10723).** The clear fires at admission-tuple publication. If the send fails after that point, provenance is already gone and the failed admit has no reseed attribution in the log. Low impact given alert-only, but it makes the clear a publication event rather than a trade event.

**A10. Declaration splits a coherent block (P035, EA 300-306).** The new global lands between `uj_memo_valid` and `uj_memo_anchor`, inside the `uj_memo_*` group, and uses a `g_uj` prefix while its neighbors use `uj_`. Cosmetic, but it makes the memo block look like it owns a field it does not.

**A11. Acceptance has no negative checks (P069-P072).** Missing: expected `1970.01.01 00:00` rows before the first reseed of each day; an explicit expected-stale census for 8 June (the very limitation P064 admits); and a check that no *existing* row format or count changed. Without the last one, "byte-identical takes" does not prove "byte-identical log surface."

**A12. Standing-brief consistency.** Nothing in the edit set touches gating, so the alert-only and no-live-activation posture is unaffected. Confirmed rather than assumed.

### Analytic ask B — better mechanisms

**B1. Test whether the new global is redundant before spending it.** R05 already prints `UJRESEED bar=2026.06.05 09:15`, which *is* the reseed bar time, and R06 prints the kill on the same pass. The set-side provenance is therefore already fully observable in RECON76's existing segment, and set-to-S2 carriage is reconstructible offline by joining on bar+dir. If the goal is lifecycle *evidence* for the v15 exemption design (P072), that evidence may already exist on disk at zero cost. The new global is only genuinely required if the v15 exemption predicate will *read* provenance at runtime — which the packet never states. Resolve that dependency first; it decides whether this round is needed at all. Lines touched: none (offline analysis of B802287F / FB7C37F9).

**B2. Make the row self-dating instead of clearing it.** Add `int g_ujOpReseedSeq` beside P035, increment at P044, and print both seq and the bar delta at P052. Freshness then reads off a single row with no join and no reset discipline, which also retires the P064 limitation without touching GoAbort. Cost: +1 line at the decl site, +1 at the set site, 2 more specifiers at P052 — and it makes the admit-clear at P062 optional rather than load-bearing.

**B3. Carry provenance on the existing decision rows (cheapest, zero new rows).** Append `reseedBar=%s` to the two PrintFormat calls already at the S2 edge (EA 8412 promote, EA 8414 kill). Provenance then appears exactly at both decisions, attribution is unambiguous, log volume does not grow, and the tag collision in A1 disappears. Tradeoff to weigh openly: this modifies two existing lines and changes two established row formats, which may break existing parsers — the opposite tradeoff from the current design, which adds lines but leaves formats frozen. If format stability is the higher value, keep the separate row but move it inside the branches (two inserts, +2 lines) for the same attribution benefit.

**B4. Reuse `uj_memo_barTime` (EA 305) if the reseed path maintains it.** If it does, provenance needs only the print (+1 line total, not +4), with no new state and no lifecycle at all. I cannot settle this from the page — the CARRY-SET site sits in a block that sets `uj_memo_valid = false`, which suggests the memo is being invalidated there and its barTime may be stale or unwritten. Widening R-H1SET per G1 would answer it, and would also confirm whether the set fires on refused reseeds (`al=0` paths) as well as successful ones. If it does fire on refused attempts, the current design records provenance for a reseed that never happened.

**Summary of what would flip this to CONFIRM:** re-emit P045 and P053 byte-identical to their old-block forms; widen R-H1SET to prove `barTime` scope and set-path conditionality; publish n=1 anchor censuses for all four old-blocks; rename the tag off the `UJRESEED` prefix; and reword P070 to match what the run can actually show. The four inserts themselves are behavior-neutral as written — that part holds.
## V355-UJFIX4-1 END OPUS

