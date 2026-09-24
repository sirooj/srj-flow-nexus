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
