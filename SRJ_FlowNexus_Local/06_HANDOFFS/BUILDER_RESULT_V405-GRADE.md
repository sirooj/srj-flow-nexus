# V405 council grade - packet P-RECON78-UJ-EXEC-1 v16

Date: 2026-10-03. Lane: SRJ Flow Nexus. Graded from filed bytes. No EA source was edited, no build, test, tester run, key, live action, commit, or push.

Relay `BUILDER_RELAY_COUNCIL_v405-UJ-EXEC-17.md`: SHA-256 `B1A84C3A6BD274D486F26AA85CE1D50C2B8A7EEE4B59AFE2005066817CDA5C10` (582985 bytes / 7122 LF lines; measured this turn).
Packet `PACKET_P-RECON78-UJ-EXEC-1v16.md`: SHA-256 `2A3795E299C3FF8514E498B2ECFF99765D63DA676A28B81B8352FB961BAC45F4` (527473 bytes / 7078 LF lines; measured this turn).

## 1. Intake - three complete replies, one round

Novelty was proved before staging, on two differently-formed probe sets, across all ten verdict files: nine markdown-bearing probes (one per distinctive passage, three per seat) returned zero hits everywhere, and the round token `V405-UJ-EXEC-18` returned zero hits in all ten files. Two bare-word probes returned non-zero and were discarded as unfit probe choices, not as findings: `classification` (242 hits) and `EA 8438` (13 hits) are recurring phrases in older filed text, and `proposed` (475) is a common word. Every staged element was counted at 1x before use.

| Seat | Intake SHA-256 (measured; staged input, not a filed artifact - the filed copy is proved byte-identical below) | Bytes | Verdict file | OPEN / END line (measured after filing) | Filed file SHA-256 (measured) | Filed bytes / LF lines |
| --- | --- | --- | --- | --- | --- | --- |
| Luna | `C53D4A460C7F7B6327C3814D82BDE6997A832FA7A356E4F5ECD30E0D61852633` | 6355 | `BUILDER_VERDICTS_LUNA.md` | 18138 / 18208 | `A2CEB0BFB8AF743C75C9746E74F80C77306471B2644F2E0BB70CD165ABC07720` | 1264168 / 18208 |
| Sonnet | `379BCF57DA253BE37E4518E693B2F4B6B14B1A792463CF76F90821A1576E40FA` | 9479 | `BUILDER_VERDICTS_SONNET.md` | 8470 / 8553 | `0D62F905179E8911AA48F7F9705A1536FF6697C2D594E61448DF2DA97298884E` | 968711 / 8553 |
| GLM | `08480E3CCB1B938E28CD3D45551F4AE6FCCF04927E31C4717A1B8C95CF261E0F` | 24681 | `BUILDER_VERDICTS_GLM.md` | 11114 / 11208 | `1EF59BECEF0C2BAEBFA29131363703AAAF0E3A2425253E5248FE1572ED0E7CB7` | 2046278 / 11208 |

Filing proof: each append carried a pre-write gate on the measured pre-state digest, an asserted byte delta equal to the measured block length (6425, 9553, 24749), markers OPEN=1 END=1 in its own file, and zero occurrences of the round token in the other seven verdict files (measured sweep after filing: 1/1 in Luna, Sonnet and GLM; 0/0 in ASTRA, DEEPSEEK, KIMI, OPUS, QWEN, SLDEF4-5 and SOL). Each filed block was then extracted back out of the saved file and compared byte-for-byte against the staged intake: identical for all three seats (Luna 6312 chars, Sonnet 9475, GLM 24579, each re-hashing to its intake digest), and each block is the last content in its file with the LF terminator intact. The three intake digests are digests of the staged Temp inputs; they are not filed artifacts and no live record file carries them, which is why the filed-file column beside each one is the identity that matters.

## 2. Tally - each question graded on its own

| Question | Luna | Sonnet | GLM | Grade |
| --- | --- | --- | --- | --- |
| Q1 - closed-session target revisions and the day-close leg | DISCREPANCY | DISCREPANCY | DISCREPANCY | **AMEND** |
| Q3 - the June 11 LONG through ordinary same-pass admission | DISCREPANCY | DISCREPANCY | DISCREPANCY | **AMEND** |

Q2 stays closed and is not re-asked by any seat. No OBJECT and no NO was returned anywhere in this round.

Both questions carry a DISCREPANCY from every seat, so both grade AMEND under the section 47 tie-fix (two DISCREPANCYs amend; a DISCREPANCY plus a CONFIRM does not clear). Luna states the shape explicitly in her own close: "DISCREPANCY + DISCREPANCY -> amends". **This is the second consecutive round that grades AMEND on both questions, and the movement is entirely page-side: no seat moved on strategy evidence, and no seat objects to a pin.** Luna's Q1 is a bounded form of the same verdict - she writes that the diagnosis is coherent and the architecture internally consistent, and that the discrepancy is that the contract leaves implementation-critical facts open, so "Q1 is not an OBJECT ... but it is not yet a fully closed implementation contract."

## 3. What the round confirms, with credit

The seats converge on a large confirmed surface, and the convergence is itself the useful signal: the v15 defects are repaired and the contract's spine holds against the spliced source.

- **GLM** verified the day-close trigger end to end against the bindings (P6828, P6020, P6844-P6845, P6837) and confirmed the v15 interval defect is genuinely repaired, that the writer's firing tick with the re-based walk is sound and consistent with the pin at 15.1 pin 33, that the record-versus-booked vocabulary cleanly separates what earlier rounds conflated, that all sixteen transition-table rows are internally consistent and match the source's verdict order, that the registration counters are correctly disposed, and that the set-site consume is **necessary, not merely preferable** - adding a third reason the packet does not state (under the corrected predicate the contender probes run before the apply site, so a consume at the apply site would route the registered case through the yield).
- **Sonnet** independently re-derived the trigger interval and the catch-up and found them holding, confirmed the thirteen-site caller census against the source, confirmed the held-direction carve keeps the June 11 SHORT holder unconfirmed under the corrected rule, and confirmed the 5 June London 09:45 SHORT at 159.948 as the preservation control that the polarity defect would break.
- **Luna** confirmed the Q1 architecture end to end - RECORD to PENDING_SYNC to BOOKED only after exact synchronization, the model-touch versus broker-deal split, unsynchronized touches never outranking other exit legs, both O6 gates placed before seed and before signal side effects - and confirmed the Q3 census and route split, including that the flip-killed route correctly does not emit yield, drop or apply.

## 4. Builder defects this round, each verified on disk by me before grading

**(a) D19 RESTATED-RULE DRIFT, REPEAT, and the most serious page defect in this round's packet: a polarity inversion in the retained prior-candle term. Caught independently by Sonnet (Q3-1) and GLM (Q3-1).** The packet at P7048 reads "AND, in the general form only, R's own body **does not close against** setup-bias direction, which is the retained prior-candle term." The source at EA 2366-2367 requires the opposite: `bool oppCandle = (dir == DIR_LONG) ? (c1 < o1) : (c1 > o1); if(!oppCandle) { failTerm = "A_OPP"; ... return false; }` - the arm PASSES when the prior candle closes against setup bias, and fails with `A_OPP` when it does not. The packet therefore states the negation of the arm it claims to retain, and the negation also admits a doji the source rejects (Sonnet). The diff is not cosmetic: under the literal page text every retracement-shaped general-form setup flips confirmed-to-refused, and the packet's own preservation control at P7066 ("5 June London 09:45 at 159.948") fails, surfacing as an unexplained confirmed-to-refused flip in the full-journal diff. Verified by me this turn: P7048 read from the saved packet, EA 2366-2367 read from the saved EA, and the positive form "closes against setup-bias direction" returning zero hits in the whole packet. GLM expressly does not reopen the per-form disposition and affirms it; no pin reading differs, because pins 86, 105/112 and 107 are silent on the retest bar's candle direction in the general form.

**(b) A "what is forbidden" sentence that forbids its own required form (GLM Q1-4).** P6966 reads "any interval whose endpoints are measured against the evaluated bar's own time, because that is the defect being repaired" - and the required primary form at P6964 is `barTime + one period <= mark < barTime + two periods`, whose endpoints are exactly that. The intended reading exists only in the T1 census row (P7038). Verified by me this turn at P6964 and P6966.

**(c) CLAIMED-CARRY, second shape: the Q1 acceptance is cited, not printed, inside the fold that replaced section 15 (GLM Q1-5).** P6982 states the fold's own discipline - "It is printed here rather than cited from an earlier section because this fold replaces section 15 entirely, and a claim of carry is not a carry" - yet the Q1 acceptance still lives in section 14.2 at P2045 and is carried into the controlling fold by reference. The content census run before transport covered tables, censuses and gate lists; the acceptance paragraph was not in its artifact set. Verified by me this turn at P2045 and P6982. This is the same class as the v16 defect caught before transport last round, in a new location, and it is why the acceptance paragraph is now named in the gate rather than left to the fold author's memory of what is load-bearing.

**(d) Grammar-level self-contradiction the battery read as clean (Sonnet Q3-2).** P7046 opens "CONFIRMED(B) if the retest bar's OPEN is on the setup side of the line, inclusive of equality ... and then either:", a prefix that governs both arms by grammar, while P7048 states the term attaches to the touch arm only. As printed the break arm is unsatisfiable, which is the exact defect the same-bar/touch-arm repair was made to avoid. Verified by me this turn at P7046 and P7048.

**(e) A one-token notation collision (Luna Q3-1 and Sonnet Q3-4, convergent).** P7044 reads "let B be the evaluated bar ... and the forming bar is B+1; let R be the retest bar, which is B in the same-bar form and B+1 in the general form". In the general form that makes the retest bar the forming bar. Verified by me this turn at P7044; "B+1" occurs once in the whole packet, so the fix is a rewrite of that one sentence, not a sweep.

**(f) A cross-reference that names nothing (GLM Q3-2).** The S9 row promises the single `allowReclaim` call site "is named in 15.5.4"; 15.5.4 at P7055 names no call site. The four occurrences of 8438 in the packet are at P63, P349, P1847 and P5711 - header identity and code exhibits - none in 15.5.x. Verified by me this turn.

**(g) An ordering claim contradicted by the cited line numbers (Sonnet Q3-7, and GLM Q3-5 with the third reason).** P7062 states "the holder's own evaluation runs first, which is what 'keeps current order' means here", but the consume sits at EA 7454 and the contender probes are at EA 8438-8439, so for a contender-confirm case the holder's contender evaluation has not run yet. Both seats read this the same way; GLM adds that the placement is still correct and necessary. The amendment is to state that the tie means holder-confirm only and to name the contender-confirm change as its own diff class.

**(h) A missing preservation control (GLM Q3-3).** The June 8 refusal control is not in the acceptance at P7066: "June 8" and "S2SEEDBIAS_KILL" each return zero occurrences inside that paragraph, while the packet mentions June 8 elsewhere five times. Verified by me this turn.

**(i) Count slack, non-blocking (GLM, minor note).** The preamble's "eighteen predicate rows plus three new rows" and "four variable-binding exhibits" against nineteen carried rows plus T1-T3 and eight listed bindings. The rows and blocks are complete; the arithmetic sentence is not. Carried as a wording fix, explicitly not a content defect.

## 5. Condition crosswalk - every seat condition, deduped, each marked how it was verified

Verified by me on the saved packet this turn (V) means the cited packet line was read and the seat's reading is confirmed; carried (C) means the seat's condition is accepted as stated and the fold must add or print what it names. Credit names every seat that raised the same item.

**Q1 (17 distinct items after dedupe)**

| # | Condition | Seats | Status |
| --- | --- | --- | --- |
| 1 | Add the source's fill-containment term ("first mark at or after the fill") to both the primary trigger (P6964) and the LATE catch-up (P6972) | GLM | V - P6972's catch-up carries no fill-containment term |
| 2 | Specify the gapped-POC revision source: detection predicate and producer site; repair the P6978 cross-reference | GLM | V - P6980 names only record, sync, touch and recompute, none a gapped POC detector |
| 3 | Resolve the early-check inconsistency: either it books or sends earlier in the tick with the closed-bar host authoritative, or it is dropped | Sonnet, GLM | V - P6970 gives latency as the reason, P7039 has the earlier check advancing only the latch |
| 4 | Tighten the forbidden-form sentence to the T1 reading so the required form is not self-forbidden | GLM | V - see defect (b) |
| 5 | Restate the Q1 acceptance inside the controlling fold, amended for the trigger, the latch, the LATE row and its own reference, and row 13's price reference | GLM | V - see defect (c) |
| 6 | Disposition the superseded pending revision in row 2: its state label, and whether an unconfirmed superseded revision emits an EXIT-UNSYNCED row | GLM | V - P6987 names neither |
| 7 | Pin the modify/close retcodes, the CTrade overload and sync behaviour, the hedging/netting posture, and bounded history-resolution behaviour for POSITION_CLOSED | Luna, GLM | C - P7011 already forbids binding any of it from memory and marks the retryable classes proposed until verified against the reference and the account |
| 8 | Run the TP acceptance for both June 5 positions with exact PID, volume, unchanged SL, readback and full-volume same-PID deal proof | Luna | C - acceptance run, unchanged from P2045 |
| 9 | Run the separate DAY_CLOSE fixture proving actual broker closure, with the executable fill price kept as a separate observation | Luna | C - acceptance run |
| 10 | Name the comparison baseline for a new revision: the nearest of the booked and pending targets, not the booked target alone | Sonnet | V - P6987 cancels the previous revision's budget with no baseline named |
| 11 | State the pin's answer on whether a later session's close may revise a still-open trade | Sonnet | V - P6978 says the pin answers it and never says the answer |
| 12 | Give the writer's new pins explicitly for the re-based walk, including that the forming-bar test reads iTime(...,0) and the exclusive session end | Sonnet | V - P6974 reverses both helper pins with no replacement given |
| 13 | Give the retarget a visible LATE path or declare the loss | Sonnet | V - the catch-up at P6972 is day-close only |
| 14 | Name the OnDeinit readers of the counters in the migration list | Sonnet | V - P7055 says "deferred readers" with no list |
| 15 | Require the June 5 retarget rows to print the closed-session value at the new first-tick pass and the walk's first and last bar, with 159.908 and 160.298 as the policing baselines | Sonnet | C - acceptance row addition |
| 16 | Require the PENDING_SYNC row to show the last in-session bar's touch evaluation used the old booked target | Sonnet | C - acceptance row addition |
| 17 | Split the DAY_CLOSE fixture into LATE and non-LATE cases with first-tick latency as class two | Sonnet | C - acceptance row addition |
| 18 | Preserve the ASIA/PM exclusion census owed, and keep the four open defects separate and unclaimed | Luna, GLM | C - carried unchanged |

**Q3 (17 distinct items after dedupe)**

| # | Condition | Seats | Status |
| --- | --- | --- | --- |
| 1 | Correct P7048's retained general-form term to "R's own body closes against setup-bias direction" | Sonnet, GLM | V - see defect (a); the most serious item in the round |
| 2 | Rewrite the B/R temporal convention so the forming bar and the general-form retest bar cannot share one symbol | Luna, Sonnet | V - see defect (e) |
| 3 | Restructure P7046-P7048 so the open-side term attaches to the touch arm only in the printed grammar | Sonnet | V - see defect (d) |
| 4 | Give the break arm its retest definition and say whether it reproduces the removed reclaim variant, with its diff class | Sonnet | V - P7049 gives the body-close form only |
| 5 | Pin the break arm's crossing operand set: the bar's own open-close or the T161K open-to-next-open, and the crossing test | GLM | V - P7049 says it is pinned without naming the convention |
| 6 | Give the line-read pin per form; S8's own cell is self-contradictory | Sonnet | V - P7026 retains at the evaluated bar and binds to the retest bar in one cell; P7051 says pinned per form without the pin |
| 7 | Strike "the open of the 14:35 bar equals the line"; the retest row implies only open >= 160.523, and the close's direction is unproven | Sonnet, GLM | V - P7051 asserts it; no spliced row carries that open |
| 8 | Repair S9's cross-reference: name EA 8438 as the single allowReclaim=true call site in 15.5.4 | GLM | V - see defect (f) |
| 9 | Give ONE final disposition for the inline mirror and the confirmation-poll body; "migrate or declare independent" is not a closed choice, and the polarity correction applies to their rendering of the prior-candle term | Luna, GLM | V - P7053 offers the alternative |
| 10 | State that the flip-plus-confirm tie means holder-confirm only, and name the contender-confirm change as its own diff class | Sonnet, GLM | V - see defect (g) |
| 11 | Splice the F11 block head (the packet splices only the set-site lines), including state range, scope, guard and the locals the seed relies on after a mid-function GoAbort | Sonnet | C - splice requirement; not asserted verified |
| 12 | Correct the claim that the challenger carries the stage-two guards: the stop-reference and memo block is skipped, the fire-site memo fallback covers it, and S5 re-derives target and stop | Sonnet | C - correction requirement |
| 13 | Fix the expected rows: no deferred abort survives a set-site consume, UJDEFERAPPLY and UJDEFERDROP are unreachable on that route, and the holder's CONFIRMPOLL row is replaced by the challenger's | Sonnet | C - see the reconciliation note below |
| 14 | List every reader of the equality counters and the surv/inv family, and decide the N1PAIR fields explicitly | Sonnet, GLM | V - P7055 names no reader and no field |
| 15 | Restore the June 8 preservation control to the acceptance and clarify what "5 June New York silence on its observed kill" denotes | GLM | V - see defect (h) |
| 16 | "Which form fired" must permit both disjuncts true: under the corrected polarity the registered case satisfies both the same-bar and the general form | GLM | V - P7066 requires a single fired form |
| 17 | Remove or prove dead the apply/drop sites under the set-site consume, and census the F11 block's state coverage so every defer-set path reaches the consume | GLM | C - design consequence to discharge |
| 18 | Add the fresh-seed route's absence of SUPPRESSED action=HELD for the challenger; declare the contender-confirm tie not graded rather than preserved if unexercised; rows for the pass must show o0 | Sonnet | C - acceptance row additions |
| 19 | Prove the complete once-only (barTime, phase, candidate identity) execution census, and prove every g_evictBits write cannot let the consumed SHORT identity suppress or evict the new LONG identity | Luna | C - acceptance proofs |
| 20 | Preserve the negative controls and the no-14:45-or-later rule | Luna | C - carried unchanged |

One cross-seat nuance is recorded rather than adjudicated here, because both readings can be true of different moments on the route: GLM lists `UJDEFERABORT` among the flip-killed route's emitted rows because the baseline emits it at the set site (SEG 22631), while Sonnet states that after a set-site consume no deferred abort survives and the row's "abort deferred past evaluation" text is false. The fold must state the exact row set once, in order, from the set site through the consume, and each seat's reading must be traceable to a line in that sequence.

## 6. What the next fold owes, and what it may not touch

Produce packet v17 as a fold of v16 that discharges items 1-18 on Q1 and 1-20 on Q3 above, with defect (a) first because it is the one item that changes behaviour on a preserved take. Two gates are non-negotiable for this fold and are the direct lesson of this round: every restated predicate term is re-derived by substituting the source expression and testing one passing and one failing case (the polarity check), and the acceptance paragraph of each question is printed in the controlling fold rather than cited (the acceptance is a load-bearing artifact). Q2 stays closed; the four open defects stay separate and unclaimed; the June 5 target-touch management retirement, the RECON57 day-close model-versus-broker close, the day-close price reference and the day-mark pilot window are not resolved by this fold and no condition above is read as resolving them. June 11's validity is settled and is not re-derived: 14:35 New York USDJPY Daily-POC retest plus confirmation, entry at the 14:40 open exactly 160.524, 14:45 and later post-entry.

## 7. Standing limits

Q1 AMEND. Q3 AMEND. Q2 closed. No implementation authority is granted or inferred: no EA source edit, build, test, tester run, key, live action, commit or push. The RECON78 one-run authorization remains consumed. SRJ stays alert-only and the dirty working tree is preserved. Nothing in this grade claims that any modification, revised-target deal, broker day-close close, or June 11 alert, admission or deal occurred.