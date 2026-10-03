# V402 council grade - packet P-RECON78-UJ-EXEC-1 v13

Date: 2026-10-03. Lane: SRJ Flow Nexus. Graded from filed bytes plus read-only source verification. No EA source was edited, no build, test, tester run, key, live action, commit, or push.

Relay `BUILDER_RELAY_COUNCIL_v401-UJ-EXEC-11.md`: SHA-256 `8AE8BFCF4E2893D5D0D6D3B4DC3823C812F24D282724B114AA446359AE20CBBB` (550264 bytes / 6426 physical lines).
Packet `PACKET_P-RECON78-UJ-EXEC-1v13.md`: SHA-256 `DBA60AFF9BB268DDE4D23CD7CB5359A1B8FD4B96210FC3BEFEF4698F527CF79A` (497878 bytes / 6382 physical lines).

## 1. Intake - three complete replies, one round

Novelty proved before filing: nineteen message-true probes plus the round token were zero across all ten verdict files, and the V401 markers stood at exactly one pair per file.

| Seat | Intake SHA-256 (measured) | Bytes / lines | Verdict file | OPEN / END line (measured) | Filed file SHA-256 | Filed bytes / lines |
| --- | --- | --- | --- | --- | --- | --- |
| Luna | `9C59F4C8437A651842CCF6F5A4E4DD4CBF177AD6969317221347630E53867A89` | 4456 / 42 | `BUILDER_VERDICTS_LUNA.md` | 17915 / 17958 | `771666F306C3AEC02E3A865BB871EFFD0F54C1957B9CA9DC5CCA24525A8C4C33` | 1241690 / 17958 |
| Sonnet | `B0F1F57BECC48F821260F5EE7F1BC9395F51645F5C1B5C07CF0911A6B192271F` | 11264 / 84 | `BUILDER_VERDICTS_SONNET.md` | 8032 / 8117 | `675C3FF265F3953BC93CDD84861E0B4A8E9026F65E042FD1D6541D5D98F34557` | 927895 / 8117 |
| GLM | `1B9C31EA68F41286211501390F9E194101796EF625F4027E52288F8D677AC3D1` | 21746 / 94 | `BUILDER_VERDICTS_GLM.md` | 10829 / 10924 | `F4AC3C4DE525A80C6461308C90E905B3FA47C260813C3B839898B3967B02AA8A` | 1984582 / 10924 |

Intake element census green before use: 21 checks (Luna), 47 (Sonnet), 71 (GLM), zero deviations. Each body is byte-identical to its staged intake file; each append's byte delta equalled the asserted length; each file tail reads back with its new END marker and a final LF; the round token occurs zero times in the other seven verdict files. Disclosed normalization as before: trailing spaces trimmed, two routing header lines added per file, no wording, number, verdict word or condition altered.

## 2. Tally under section 47 TIE-FIXED, per question

| Question | Luna | Sonnet | GLM | Grade |
| --- | --- | --- | --- | --- |
| Q1 - closed-session target revisions and the day-close leg | DISCREPANCY | DISCREPANCY | CONFIRM (YES) | AMEND |
| Q3 - the June 11 LONG through ordinary same-pass admission | DISCREPANCY | DISCREPANCY | DISCREPANCY | AMEND |
| Q2 - June 5 NY 16:15 entry | not reviewed | not reviewed | not reviewed | closed |

Both questions carry a DISCREPANCY+DISCREPANCY pair, so both grade AMEND. No OBJECT and no NO was returned by any seat. **GLM moved on Q3**: CONFIRM at V400 and V401, DISCREPANCY now. That movement is caused by a defect on the page, not by new strategy evidence, and it is the most consequential finding of this round.

## 3. The builder defect this round: my restated confirmation rule was one-sided and would have confirmed setups that never touched the line

This is the most serious page defect in the project to date, because it is a RELAXATION of the confirmation gate in the direction that admits invalid setups, and because two seats caught it independently.

What v13 said: the TOUCH arm reads "B's high is at or above L for a LONG and B's low is at or below L for a SHORT".

What the saved source says (EA 2374, spliced and on the page): `bool touch = (h1 >= L - _Point && l1 <= L + _Point);` - a two-conjunct, direction-neutral CONTAINMENT. The bar's range must span the line. Removing the one-point margin yields `high >= L && low <= L` on the touching bar, for both directions.

What v13's sentence did instead: it kept one conjunct per direction and dropped the other. For a LONG at a line below price, "high at or above L" is satisfied by essentially every bar at or above the line, and the reach test is never evaluated. Sonnet's demonstration: a SHORT whose retest bar never reaches the resistance line fails the saved test but passes v13's version, because "low at or below L" is trivially true below the line and a down-close satisfies the bias term. GLM's demonstration is the same from the other side. So the v13 page would have confirmed a setup that never touched the line - the opposite of the pin, and the packet's own stated highest-risk direction.

Cause, named: at V401 I adopted a seat's restated confirmation rule onto the page and did not re-derive it from the spliced source. I read the restatement as a tightening because it removed the one-point band, and shipped it without a conjunct-by-conjunct comparison against EA 2366-2378. The V401 grade even recorded that I was restating rather than re-deriving, and I treated that as a bookkeeping note instead of the defect it was.

Second, smaller instance of the same class in the same section: v13 bound the line value to the wrong bar. The source reads the line at the evaluated bar (EA 2351, and the telemetry read at the same shift), while v13 said "L read at B+1". For the same-bar form the retest bar is B, so that binding is wrong for the June 11 shape.

Both are now classified and gated rather than merely corrected: defect class D19 RESTATED-RULE DRIFT in srj-defect, battery item SEALED-RESTATEMENT in srj-council, and the universal OWN-DEFECT-AUTO-TIGHTEN rule in the loaded workflow contract, all filed earlier today and verified by read-back and machine count. The corrective discipline for the next fold is therefore already in force: every rule sentence is re-derived from the spliced source and the pinned words, never from a seat's summary, and printed beside the source.

The corrected predicate, as both seats converge on it and as the source supports, is: on the retest bar R - R = B in the same-bar form, R = B+1 in the general form - the touch arm requires R's range to contain the line exactly with no margin (`high(R) >= L && low(R) <= L`), the confirmation bar B to close into setup-bias direction, and B's close to hold on the setup side of the line, equality holding and not breaking; the break arm requires B's body to close strictly through the line in setup-bias direction, equality not breaking. The line is bound per form rather than to a fixed shift, and its relationship to the stored anchor price is stated. GLM verified that on the registered evidence the 14:35 bar satisfies both the as-written and the corrected forms, so the correction changes nothing about the settled June 11 outcome - what it changes is the journal-wide silence of never-touched setups.

One further item is NOT resolved by either seat and must not be silently adopted: Sonnet asks which pin removes the opposite-candle arm, and observes that the prior-close pin concerns the prior CLOSE while that arm tests the prior bar's body direction. No quoted pin removes it. It is therefore retained and diffed separately rather than deleted on my own authority.

## 4. The design consequence nobody had yet derived: June 11 may not exercise the release mechanism at all

Sonnet's Q3 condition 6 is the most consequential open item of the round and it is new. Working from the exhibits: with the prior-close arm removed, the contender probe for the LONG succeeds while the SHORT holder's own confirmation fails, so the holder-yield condition holds and the yield fires BEFORE the deferred abort is examined - after which the abort simply drops. On that reading the registered identity takes the YIELD branch, not the CONSUME branch, and the consume-and-release mechanism I specified in 15.5.2 would not be exercised by the June 11 acceptance at all. Sonnet further observes that the yield leaves the state armed with the zone zeroed, that the zone re-read then compares against zero, and that from the exhibits no promotion follows on that pass, so no 14:40 entry would occur - while noting that one touch helper is not on the page, so he cannot rule out a touch discovery.

This is not a defect claim against the source; it is a derivation neither I nor either seat had done, and it puts the whole Q3 release design in question. It routes to council with a recommendation, not to the operator: no pin is in question, the pin on the flip-plus-confirm tie keeps current order, and the correct next step is to exhibit the missing touch helper and derive which branch the registered identity actually takes before the mechanism is specified further. It is carried as an open design condition in the fold, not silently designed around.

## 5. Rulings the seats made on the page's own open choices

GLM ruled four, and each removes an open choice rather than adding a question: ASIA and PM are EXCLUDED from the revision set for this build, on semantics - a previous-day buffer flips at the day rollover, hours after the window closed, so the revision event would not be the session close the pin names; their levels are not silenced because the entry-time election already admits them as candidates. The day-mark repair takes the first disposition, marks derived from the evaluated bar's own date with no pilot bound. The cadence form is accepted as amended, with the guard sharpened to two-sided plus a once-per-instance latch, a stated rule for marks landing off a bar open, and an explicit post-failure action. BREAK-branch acceptance is ADOPTED in the same shape as the day-close leg.

## 6. Additional conditions verified on disk this turn

- The 32-entry mark cap and the lazy init defeat the full-journal goal: init runs at the end of OnTick and `vDAY` requires the init flag, so both dependencies must go with the pilot bound.
- The fail-closed rule has no observable: the pass is the first tick after a new bar appears, so "no tick lands at the open" needs a stated test, and a latency threshold would contradict the exact-price pin.
- The swept-mask filter is indexed by buffer slot, so it cannot apply to an own-bar extreme; either the rule is restated or it is dropped for the own-bar path, and the new writer must reproduce both baseline revisions as regression rows.
- The day-close fail condition as written is unsatisfiable for a short, because a short closes on the ask against a bid chart; the two-clause deal structure applies there too.
- The migration census omits the news-open reader and the fill-side ticket and PID writes; the census wording "neither writes anything" is false, since the one-shot touch writes its own latch fields which migrate per instance.
- The active-flag rule as written leaves the alert-only paper instance unregistered, so the rule must be stated per mode.

## 7. Operator-rule triage - still zero questions

No seat asks the operator anything this round. Sonnet's Q3 B acceptance that the deal-grading rule needs no operator word is adopted for the same reason recorded at V401: the exact-price pin already fixes the reference and already names spread drift a defect that is diagnosed and never granted leniency, so the rule measures a defect he has already named. The June 11 chart values remain the single operator-side evidence gap and block nothing. June 11 setup validity remains settled and unasked.

## 8. Crosswalk - every V402 condition dispositioned

| Seat | ID | Proposition | Disposition |
| --- | --- | --- | --- |
| Luna | Q1-1 | Day-mark scope is future work, not existing behaviour | ALREADY-CORRECT; stated as a source change |
| Luna | Q1-2 | ASIA/PM eligibility unresolved | RESOLVED by GLM's exclusion ruling |
| Luna | Q1-3 | Broker-sync details unbound | ADOPT as a pre-encode verification gate |
| Luna | Q1-4 | Day-close trigger is a proposal, not exhibited behaviour | ADOPT as pin-derived requirement plus amended guard |
| Luna | Q1-5 | BREAK acceptance unchosen | RESOLVED by GLM's adopt ruling |
| Luna | Q3-1 | Mirror and poll bodies not exhibited | ADOPT as required exhibits |
| Luna | Q3-2 | Full old-versus-new journal diff outstanding | ADOPT as a future proof obligation |
| Luna | Q3-3 | Release must be one explicit call | ADOPT; now joined by the branch-derivation condition |
| Luna | Q3-4 | Register acceptance fields unresolved | ADOPT as an either-source-or-drop choice |
| Sonnet | Q1-1 | 32-cap defeats the full-journal goal; init and init-flag dependencies | ADOPT |
| Sonnet | Q1-2 | Fail-closed has no observable | ADOPT as a stated test, no latency threshold |
| Sonnet | Q1-3 | Eligible set undefined; fill-before-close clause; gapped-POC source silent | ADOPT all three |
| Sonnet | Q1-4 | Retarget lag one bar after the close boundary | ADOPT as a disposition question |
| Sonnet | Q1-5 | Swept mask cannot apply to an own-bar walk; reproduce baseline revisions | ADOPT both |
| Sonnet | Q1-6 | Existing writer's disposition missing | ADOPT |
| Sonnet | Q1-7 | Active-flag rule conflicts with alert-only | ADOPT as per-mode rule |
| Sonnet | Q1-8 | Migration census incomplete | ADOPT both omitted site groups |
| Sonnet | Q1-9 | Day-close fail condition unsatisfiable for shorts | ADOPT the two-clause structure there |
| Sonnet | Q1-B1 | Day-close fixture not concrete | ADOPT; name a position or declare it synthetic |
| Sonnet | Q1-B2 | Weekend marks need a no-verdict row | ADOPT |
| Sonnet | Q1-B3 | Friday fixture accepted, must show the opening-tick pass | ADOPT |
| Sonnet | Q1-B4 | TP branch accepted; short model touch stays MODEL_ONLY | ALREADY-CORRECT |
| Sonnet | Q1-B5 | BREAK: adopt the same-shape acceptance | RESOLVED by GLM's adopt ruling |
| Sonnet | Q3-1 | TOUCH arm reversed and one-sided | ADOPT; the defect of section 3 |
| Sonnet | Q3-2 | The close-holding term is missing | ADOPT |
| Sonnet | Q3-3 | Line bound to the wrong shift | ADOPT; the second defect of section 3 |
| Sonnet | Q3-4 | Opposite-candle removal not required by any pin | ADOPT as retained-and-diffed, not deleted |
| Sonnet | Q3-5 | Two LIVE call sites unclassified; reclaim site not named | ADOPT both |
| Sonnet | Q3-6 | June 11 branch not derived; yield not consume; release untested | ADOPT as the open design condition of section 4 |
| Sonnet | Q3-7 | Return-table label wrong | ADOPT the corrected label |
| Sonnet | Q3-8 | Release mechanism and carriage invariant accepted | ALREADY-CORRECT |
| Sonnet | Q3-B1 | Deal rule measures but does not grade | ADOPT the two named classes with statuses |
| Sonnet | Q3-B2 | Branch rows must be stated | ADOPT, joined to the branch derivation |
| Sonnet | Q3-B3 | Register fields: drop unless a real row carries them | ADOPT |
| Sonnet | Q3-B4 | Require zero unexplained flips | ADOPT |
| Sonnet | Q3-B5 | Proof rows and widened ordering accepted | ALREADY-CORRECT |
| GLM | Q1-1 | Four defects real and separate | ALREADY-CORRECT |
| GLM | Q1-2 | Price reference correctly diagnosed | ALREADY-CORRECT |
| GLM | Q1-3 | Corrected gating verified | ALREADY-CORRECT |
| GLM | Q1-4 | Eligible-session table source-grounded | ALREADY-CORRECT |
| GLM | Q1-5 | Phantom-instance ordering verified | ALREADY-CORRECT |
| GLM | Q1-6 | Migration census accepted as corrected | ADOPT the corrections |
| GLM | Q1-7 | Bounded deferral and both O6 gates accepted | ALREADY-CORRECT |
| GLM | ruling | ASIA/PM exclusion | ADOPTED as a ruling |
| GLM | ruling | Day-mark repair takes the first disposition | ADOPTED as a ruling |
| GLM | ruling | Cadence form accepted as amended | ADOPTED as a ruling plus the sharpened guard |
| GLM | ruling | BREAK acceptance adopted | ADOPTED as a ruling |
| GLM | cond-1 | Revision-trigger generalization; admission-containment disposition; walk generalization | ADOPT all three |
| GLM | cond-2 | Alert-only revision writer branch | ADOPT; the guard and the single writer conflict in alert-only |
| GLM | cond-3 | Mark-derivation mechanics; cap sufficiency; census array and boolean dispositions | ADOPT all three |
| GLM | cond-4 | Cadence guard sharpened: two-sided, latch, off-open marks, post-failure action | ADOPT all four |
| GLM | cond-5 | Migration census corrections | ADOPT both |
| GLM | cond-6 | Wording fix: neither writes a target revision | ADOPT |
| GLM | cond-7 | Defect 2 stays open with a diagnosability condition | ADOPT |
| GLM | Q1-B8-11 | Fixture date and coverage; weekend bound; BREAK exactness; target-passed stays a labelled expectation | ADOPT all four |
| GLM | Q3-1 | TOUCH arm inequality inverted | ADOPT; the defect of section 3 |
| GLM | Q3-2 | Close-holding term missing | ADOPT |
| GLM | Q3-3 | Equality convention not delivered | ADOPT |
| GLM | Q3-4 | Line binding per form and its relation to the stored anchor price | ADOPT |
| GLM | Q3-5 | Two LIVE call sites omitted | ADOPT |
| GLM | Q3-6 | Four returns carry no disposition | ADOPT |
| GLM | Q3-7 | Wording fix on the pre-seed gate row | ADOPT |
| GLM | Q3-B8-11 | Diff against the corrected predicate; mirror exhibits; register fields; S3 zone evidence row | ADOPT all four |

No condition is deferred for convenience and none is dropped. Every OBJECT-class objection is adopted.

## 9. Close and authority

Q1 AMEND. Q3 AMEND. Q2 closed. No implementation authority is granted or inferred: no EA source edit, build, test, tester run, key, live action, commit, or push. The RECON78 one-run authorization remains consumed. SRJ stays alert-only and the dirty working tree is preserved. June 11 setup validity remains settled and unasked; the June 5 target-touch regression, the RECON57 day-close model-versus-broker close, the day-close price-reference defect and the day-mark pilot-window defect remain four separate open items, none closed by this grade.

**Not produced this session, stated plainly:** packet v14, relay v402 and their batteries are NOT written. The fold must first re-derive the corrected predicate from the spliced source, absorb the seat rulings and the six further conditions above, and exhibit the sites now known to be missing (the touch helper, the poll bodies, the news-init and news-open sites, the fill-side identity writes, and the admission-containment test). No fold will be shipped on a restatement, which is the defect that caused this round.