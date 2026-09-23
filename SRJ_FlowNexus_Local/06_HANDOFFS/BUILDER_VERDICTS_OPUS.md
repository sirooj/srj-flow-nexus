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
