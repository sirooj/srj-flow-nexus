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
