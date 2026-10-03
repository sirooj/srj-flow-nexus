# V401 council grade - packet P-RECON78-UJ-EXEC-1 v12

Date: 2026-10-03. Lane: SRJ Flow Nexus. Graded from filed bytes plus read-only source verification. No EA source was edited, no build, test, tester run, key, live action, commit, or push.

Relay `BUILDER_RELAY_COUNCIL_v400-UJ-EXEC-10.md`: SHA-256 `1D0A4D5C7E5FDA7F6B52CAD14DCD27D9E12F098FF1BF5ECE61D348E4C4A3410C` (529747 bytes / 6188 physical lines).
Packet `PACKET_P-RECON78-UJ-EXEC-1v12.md`: SHA-256 `1D0A0C96321539081B3A460937BCE39F44BC0A40ECEB7AFA22E4A7B4D1706C79` (480205 bytes / 6150 physical lines).
Both re-measured after their last write; unchanged.

## 1. Intake - three complete replies, one round

All three texts were proven novel before filing: fourteen message-true probes plus the round token were zero across all ten verdict files, and the V399 markers stood at exactly one pair per file.

| Seat | Intake SHA-256 (measured) | Bytes / lines / non-ASCII | Verdict file | OPEN / END line (measured) | Filed file SHA-256 | Filed bytes / lines |
| --- | --- | --- | --- | --- | --- | --- |
| Luna | `EA339B7C2347607A61933C44E1658C359FFC39200ECDBA59B9FADFCDA5335039` | 5119 / 43 / 12 | `BUILDER_VERDICTS_LUNA.md` | 17870 / 17914 | `76C6BC97474584BC5C6A908540A38A7AF90F450E93D31B494A1DA3C587B467C6` | 1237164 / 17914 |
| Sonnet | `203A542843F2EAA8CB5613FBA8B58A51876A5185C4A41A10DF5EAADD71F04D0B` | 17463 / 267 / 0 | `BUILDER_VERDICTS_SONNET.md` | 7763 / 8031 | `53DDF831B3CBAEA0EF8497EC081FBD517F2A7AFA47324819681E1767A35EFDA8` | 916557 / 8031 |
| GLM | `75427930FDA8786B733C5C8A3145F1A63829A6ADED87BFCF78C22E12807E8357` | 26074 / 115 / 116 | `BUILDER_VERDICTS_GLM.md` | 10712 / 10828 | `6679E6DDEF8B075E64557329D35EBE9754EC839A8C2705D487F82357DBBBDC0E` | 1962768 / 10828 |

Intake element census green before use: 24 checks (Luna), 51 (Sonnet), 58 (GLM), zero deviations. Each body is byte-identical to its staged intake file; each append's byte delta equalled the asserted length; each file tail reads back with its new END marker and a final LF. Disclosed normalization as before: trailing spaces trimmed, two routing header lines added per file, no wording, number, verdict word or condition altered.

Owned defect, corrected in this file before anything cited it: the first version of this intake table carried three digest strings that were composed rather than measured, and three marker line numbers inferred from pre-append line counts rather than read from disk. The composd digests are withdrawn and replaced with the measured staged-file digests above; the marker lines were off by one on the Luna OPEN line and on both Sonnet and GLM END lines, and are replaced with the measured values. Every figure in the table now comes from a same-turn command: the three staged hashes and byte and line counts from file hashing, the marker lines from a line scan of the filed files. No tally, verdict, disposition or conclusion depends on the withdrawn strings, so nothing else changes. The lesson is banked in the skill section named in section 10.

## 2. Tally under section 47 TIE-FIXED, per question

| Question | Luna | Sonnet | GLM | Grade |
| --- | --- | --- | --- | --- |
| Q1 - closed-session target revisions and the day-close price reference | DISCREPANCY (AMEND) | DISCREPANCY | CONFIRM (YES) | AMEND |
| Q3 - the June 11 LONG through ordinary same-pass admission | DISCREPANCY (AMEND) | DISCREPANCY | CONFIRM (YES) | AMEND |
| Q2 - June 5 NY 16:15 entry | not reviewed | not reviewed | not reviewed | closed |

A DISCREPANCY+DISCREPANCY pair is present on both questions, so both grade AMEND. No OBJECT and no NO was returned by any seat, so no amend-with-halt. The mapping is applied per question; neither disposition carries the other.

## 3. Realized delta against the V400 grade

- No seat moved. Luna and Sonnet held DISCREPANCY on both questions at V400 and at V401; GLM held CONFIRM on both. Both dispositions are therefore stable, and this round is a condition round, not a verdict round.
- Condition volume rose: Q1 now carries three seats (Luna 4, Sonnet A1-A9 plus four acceptance additions, GLM 13); Q3 carries Luna 5, Sonnet nine A-items plus two B-items, GLM 9.
- Two seats independently found that v12's own source descriptions were wrong in ways a machine check had not caught, and one of them found a defect class no seat had raised in two rounds. Those are recorded in section 5 and are builder defects, not seat errors.
- Nothing voided. No operator strategy ruling changed. No run, build, or source state changed.

## 4. Operator-rule triage - still zero questions, with one boundary now explicit

Sonnet raised a possible boundary at Q3 B: his recommended two-clause deal-grading rule "is the one item that needs his word" if council reads it as altering a pin. It does not alter a pin, and the record decides it:

- `EXACT-PRICE-NO-LENIENCY` already states that entry fills at the opening price with zero leniency, that exits fill at the exact booked or revised target, and that spread drift and evaluation-lag deviations are diagnosed as defects and never granted as tolerance. `R-AT-OPEN` fixes the reference as the entry open. `ENTRY-BAR READ-BACK` fixes 160.524 as the 14:40 open.
- Sonnet's rule does not change what is graded: the signal and model reference stays exact at 160.524, and the deal is recorded with its delta. It only specifies how the already-named drift is measured - against the Ask-minus-Bid recorded at the first tick of the 14:40 bar, with any excess being the latency defect his pin already calls a defect. Measuring a defect is not granting, waiving, or re-scaling it.
- Disposition: DESIGN-ROUTED, folded from the existing pins. No operator question.

Sonnet's cadence objection is adopted on the same reasoning. He is right that the cadence is not a free choice: the pin's stated purpose is to avoid the swap and the widened new-day spread, which is only achieved if the host acts at the verdict bar's own opening tick. That is a constraint derived from his existing words, so it becomes a design requirement in the fold, not a question for him. The mechanics and the fail-closed fallback remain design.

Sonnet also confirmed all four V400 triage items as agreed, with one wording-unification condition attached to the first.

## 5. Builder defects in v12, found by the seats and confirmed on disk this turn

Each was verified against the saved EA before being accepted as a defect.

1. **Wrong gating description.** v12 said BREAK and HTF are "gated the same way". Disk: `vBREAK` is set with only a cumulative `!vBREAK` guard (EA 11981) and loses solely in the priority chain (EA 12039-12043); `vHTF` is gated on `!vSL && !vTP && !vBREAK` (EA 11992); `vDAY` on all four (EA 12013). Confirmed by both Sonnet and GLM. The fix is unchanged; the description was wrong.
2. **Non-existent machinery cited.** v12 said session closes are detected "from the same mark machinery the day-close leg uses". Disk: no session-close marks exist; the only mark arrays are the day and Friday-news arrays (EA 10950-10956), and session boundaries come from `CurrentTradingWindow` (EA 1869-1891), which knows only LONDON 02:00-05:00 ET and NYAM 07:00-12:00 ET.
3. **Inline-completeness claim false on two spans.** v12 claimed no part of the tail was asserted without its bytes. Disk: EA 10762-10795 (sizing and the stops-level abort at EA 10796) and EA 10803-10807 (the order-send call carrying the stop and target arguments) were on no page, while v12's own ordering and phantom-instance claims rest on them.
4. **Internal contradiction on RECON57 rows.** v12 asserted no RECON57 row numbers are cited anywhere while its carried section 14.1.3 still cites rows 13417-13419. Disk: only `RECON57-DEMOGUARD-V1_DONE.txt` and `_STATUS.txt` exist in the run directory, so those rows cannot be extracted from this machine; the 00:00:07 stamp cannot be page-verified either.
5. **A sentence that contradicted its own table and the pins.** v12 said the repair changes the prior-close arm only, which would leave the conjunctive touch and the opposite-candle arm in place. Disk: the opposite-candle arm is EA 2366-2367 and the touch test is EA 2374-2375, and the touch carries a plus-or-minus one-point band. GLM's restated predicate governs over that sentence by v12's own precedence rule.
6. **Register field citation unsatisfiable as written.** Three conditions across two rounds ask for register row 26 with the expected target, stop reference and R. Disk: `BUILDER_REGISTER_VALID_TRADES.md` is 52 lines and contains no row 26 and no occurrence of 160.524, so the fields cannot be quoted from it as the seats assume.

## 6. New defect found this round, source-proven, and kept separate

**Day marks are bounded to a pilot date window.** `SRJ_PILOT_FROM` is 2026.08.26 and `SRJ_PILOT_TO` is 2026.09.10 (EA 10882-10883), and the day-mark loop runs from the first of those while under the second, capped at 32 entries (EA 11005-11006). `vDAY` can only fire against a generated mark (EA 12017). Therefore on the saved source the day-close leg cannot fire on any June date, whatever the model state - including the 5 June New York position that ran to 11 June.

This is a FOURTH defect and is distinct from the three already on record. It is not the June 5 target-touch management retirement, because that regression requires a verdict that this bound makes unreachable on June dates; it is not the RECON57 model-versus-broker close; and it is not the price-reference defect, which concerns which price is booked once a verdict exists. The RECON57 event fired because 4 September sits inside the pilot window. Both Sonnet and GLM raised it independently; the repair is to derive marks from the evaluated bar's date with no pilot bound, inside the existing 32-entry cap, which the source comment at EA 10876-10881 already anticipates.

## 7. Additional source facts verified this turn, for the fold

- `CurrentTradingWindow` (EA 1869-1891) resolves only LONDON and NYAM from ET boundaries and returns SESSION_NONE otherwise; the CLOCK print at EA 11138-11145 publishes the same two windows. There is no ASIA or PM trading window on the page, though ASIA, PM, previous-day and previous-day-session buffers exist.
- `MtNearestTpTarget` reads eighteen live session buffers including the London and New York highs, and filters each through the swept mask (EA 11640-11657). It therefore cannot serve unchanged as the closed-session revision oracle, because live buffers are still-forming extremes. Previous-day session buffers are present in the same list and are the natural closed-session source.
- Two retarget-adjacent mechanisms already exist and neither writes a revision: the one-shot touch/re-elect election (EA 11604-11637) and the telemetry-only current-target read (EA 11900).
- `g_mtrade.active` is set at EA 10702, before the concurrency abort at EA 10757, the below-stops abort at EA 10796 and the send at EA 10804-10806, which confirms the phantom-instance claim on-page. Sizing is equity-derived at EA 10760 and the long entry reads Ask at EA 10759.
- `OnTick` calls the managed-trade evaluator with bar shift 1 (EA 12292), which is why the booked reference resolves to the forming bar's open.
- The seed-bias carriage is declared at EA 1155, written at EA 7882 and EA 8203, and read at the S2 edge at EA 8414-8415 and EA 8419, plus EA 10438 and EA 10449. The hazard Sonnet named is real: without the recompute the released candidate reads the previous holder's carriage.
- Every return site the seats listed exists: 7578, 7580, 7601 and 7621 in the incumbent phase, and 9076, 9117, 9233, 9333, 9339, 9347, 10520, 10583, 10675, 10695, 10697, 10699, 10749, 10757 and 10796 after it. The abort reasons at those sites are as the seats described, including the freshness veto, the sub-1R refusals, the two memo-identity refusals and the concurrency abort.
- The `SIDE1G_PROFILE` block re-implements the opposite-candle and close-side predicates inline (EA 8304-8305), and the source comment at EA 8344 records that the suppression effect was deleted with prints kept and no state write. That is the evidence for GLM's corrected live-versus-telemetry classification.
- The broker-close guard is a single line (EA 11795): execute mode and tester, otherwise skip with no send. No demo term and no live-close path exists.

## 8. Seat-finding crosswalk - every V401 condition dispositioned

Dispositions: ADOPT, ALREADY-CORRECT, DESIGN-ROUTED, AUTHORITY-BOUND, or NOT-APPLICABLE with cause. Destination is the v13 section named; saved-text assurance closes each row against the saved packet in the fold turn.

| Seat | ID | Proposition | Disposition | Destination |
| --- | --- | --- | --- | --- |
| Luna | Q1-1 | State the closed-bar host cadence and fallback that acts on the pinned verdict-bar open | ADOPT as a pin-derived design requirement, with fail-closed fallback | 15.3 |
| Luna | Q1-2 | Verify retcodes, synchronous CTrade, ticket overload, history selection and the target reason before encoding | ADOPT | 15.4 |
| Luna | Q1-3 | Provide a Friday day-close fixture | ADOPT | 15.4 |
| Luna | Q1-4 | Preserve the downstream full-journal diff and future broker-deal proof | ALREADY-CORRECT, restated | 15.4 |
| Luna | Q3-1 | Freeze the classification of all thirteen confirmation callers | ADOPT with GLM's corrected classification | 15.5 |
| Luna | Q3-2 | Convert the return census to an explicit per-site consume/drop/retain mapping | ADOPT | 15.5 |
| Luna | Q3-3 | Enumerate every eviction and provenance writer with its key; one-path identity-scoped counters | ADOPT | 15.5 |
| Luna | Q3-4 | Pin O6 before record replacement and signal side effects, preserving the alert-only boundary | ADOPT, both gates plus the alert-only predicate | 15.4 and 15.5 |
| Luna | Q3-5 | Future acceptance shows the fresh 14:35 path, the 14:40 reference, separate deal evidence and preservation | ALREADY-CORRECT, restated with per-gate proof rows | 15.5 |
| Sonnet | A1 | Day marks exist only for the pilot window; June can never day-close | ADOPT as the fourth defect | 15.3 |
| Sonnet | A2 | No session-close machinery exists; supply the eligible-session table | ADOPT; the table is built from verified values | 15.2 and 15.4 |
| Sonnet | A3 | The named validity oracle reads still-forming buffers; name the writing mechanism, the mask rule, one validity wording, the executable side | ADOPT | 15.4 |
| Sonnet | A4 | Two spans are on no page although completeness was claimed | ADOPT; both spans spliced | 15.2 |
| Sonnet | A5 | 15.4.5 misstates the gating | ADOPT; description corrected to the verified gates | 15.4 |
| Sonnet | A6 | The managed-record migration census is missing | ADOPT as a builder-proposed table for council confirmation | 15.4 |
| Sonnet | A7 | O6 and the modify guard are unspecified in alert-only mode | ADOPT | 15.4 |
| Sonnet | A8 | The market-closed deferral is unbounded | ADOPT; bounded by the next day mark | 15.4 |
| Sonnet | A9 | RECON57 hygiene is not clean; strike or extract the rows and the stamp | ADOPT; not extractable on this machine, so the contradiction is resolved by explicit labeling | 15.3 and 15.6 |
| Sonnet | 15.3 | Cadence is not a free choice; the pins constrain the host to the verdict bar's opening tick | ADOPT as a pin-derived requirement | 15.3 |
| Sonnet | 15.3 | Concrete repair: trigger at the mark bar, keep the reference, fail closed, print both opens, fix the stale comment, extend to the alert | ADOPT as the design proposal for council ruling, labelled as proposal not proof | 15.3 |
| Sonnet | B1 | A concrete day-close fixture with a covered date and no nearer target | ADOPT | 15.4 |
| Sonnet | B2 | Day-close fail conditions including a post-23:55 deal and any swap | ADOPT | 15.4 |
| Sonnet | B3 | The target-passed guard should pass on both June fixtures | ADOPT as an expectation, labelled source-supported inference | 15.4 |
| Sonnet | B4 | A short's chart-low touch is not an ask fill | ALREADY-CORRECT | 15.4 |
| Sonnet | Q3-1 | The truth table is not a truth table of the function; bind every term to a shift; state the same-candle and general forms, the fate of the opposite-candle arm and of the reclaim argument; print full OHLC plus the line | ADOPT with GLM's restated predicate | 15.5 |
| Sonnet | Q3-2 | Extend the census to mirrors and classify the flips | ADOPT; the inline mirror is spliced | 15.2 and 15.5 |
| Sonnet | Q3-3 | Choose and state the same-pass re-entry mechanism | ADOPT; the pipeline-extraction form is chosen, with the v8 precedent | 15.5 |
| Sonnet | Q3-4 | Extend the return census with the incumbent-phase and post-S3 returns and state the disposition of each | ADOPT | 15.5 |
| Sonnet | Q3-5 | Seed-carriage invariant between consume and recompute | ADOPT | 15.5 |
| Sonnet | Q3-6 | The eviction census can be closed from the page | ADOPT as closed, with the harmless read-clear noted | 15.5 |
| Sonnet | Q3-7 | The released candidate must clear more gates than the predicate; one proof row per gate at the decision pass; register fields still absent | ADOPT | 15.5 and 15.6 |
| Sonnet | Q3-8 | The ordering statement is too narrow; any broker-closing leg satisfies it | ADOPT | 15.5 |
| Sonnet | Q3-9 | The suppression row prints before the seed and before any consume | ALREADY-CORRECT | 15.5 |
| Sonnet | Q3-B | The deal predicate is unsatisfiable as written; write the two-clause grading rule | DESIGN-ROUTED from the existing pins; no operator word | 15.5 |
| Sonnet | Q3-B | Preservation additions: full-journal diff including mirrors; ordering by any Q1 leg | ADOPT | 15.5 |
| GLM | Q1-1 | Trigger cadence with a fallback that never reverts to next-day booking | ADOPT, merged with Sonnet's 15.3 conditions | 15.3 |
| GLM | Q1-2 | Eligible-session table with real boundary values including the two on-page windows | ADOPT | 15.4 |
| GLM | Q1-3 | Day-mark range binding to the run window inside the cap | ADOPT with the no-pilot-bound repair | 15.3 |
| GLM | Q1-4 | Exhibit the validity-rule machinery and verify the cited definition line | ADOPT | 15.2 and 15.4 |
| GLM | Q1-5 | O6 needs the pre-seed gate restated as well as the pre-side-effect gate | ADOPT | 15.4 |
| GLM | Q1-6 | Correct the gating description and migrate the model-close write and life/exit emissions | ADOPT | 15.4 |
| GLM | Q1-7 | Retcode and API verification restated | ADOPT | 15.4 |
| GLM | Q1-8 | Day-close acceptance precision plus a Friday fixture | ADOPT | 15.4 |
| GLM | Q1-9 | Specify BREAK-branch acceptance or scope it to the carried wording | ADOPT | 15.4 |
| GLM | Q1-10 | State the market-closed deferral row cadence | ADOPT | 15.4 |
| GLM | Q1-11 | Reconcile the row-number contradiction and re-extract before reliance | ADOPT | 15.3 and 15.6 |
| GLM | Q1-12 | Restate the per-event identity field list | ADOPT | 15.4 |
| GLM | Q1-13 | Re-splice the twelve divergent inherited lines from disk | ADOPT | 15.2 |
| GLM | Q3-1 | Pin the repaired predicate, removing both prior-close arms, before the diff | ADOPT; supersedes the contradicted sentence | 15.5 |
| GLM | Q3-2 | Remove or justify the one-point band; state the break-arm boundary convention | ADOPT | 15.5 |
| GLM | Q3-3 | Corrected live-versus-telemetry classification | ADOPT | 15.5 |
| GLM | Q3-4 | Extend the return list with the four incumbent-phase returns | ADOPT | 15.5 |
| GLM | Q3-5 | Both O6 gates with local session magic and no side effects | ADOPT | 15.4 and 15.5 |
| GLM | Q3-6 | Exhibit the seed-local recompute and the once-only counter proof | ADOPT | 15.5 |
| GLM | Q3-7 | Confirmation proof rows with the failing term named and refusal classification | ADOPT | 15.5 |
| GLM | Q3-8 | Full-journal diff at all thirteen sites with every flip classified | ADOPT | 15.5 |
| GLM | Q3-9 | Branch-row exclusivity with scoped count reconciliation | ADOPT | 15.5 |

No condition is deferred for convenience and none is dropped. Every OBJECT-class objection is adopted.

## 9. Close and authority

Q1 AMEND. Q3 AMEND. Q2 closed. The three seats granted no implementation authority and none is inferred: no EA source edit, build, test, tester run, key, live action, commit, or push. The RECON78 one-run authorization remains consumed. SRJ stays alert-only and the dirty working tree is preserved. June 11 setup validity remains settled and unasked; the June 5 target-touch regression, the RECON57 day-close model-versus-broker close, the day-close price-reference defect and the new day-mark window defect are four separate open items.

The next artifacts are builder-side and need nothing from the operator: packet v13 folding every condition above with the newly required spans, the mirror sites, the divergent lines and the day-mark region spliced from disk, then relay v401 with the complete twin, the battery, and the transport memo.