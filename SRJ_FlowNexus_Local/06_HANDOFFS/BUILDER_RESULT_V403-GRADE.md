# V403 council grade - packet P-RECON78-UJ-EXEC-1 v14

Date: 2026-10-03. Lane: SRJ Flow Nexus. Graded from filed bytes. No EA source was edited, no build, test, tester run, key, live action, commit, or push.

Relay `BUILDER_RELAY_COUNCIL_v402-UJ-EXEC-13.md`: SHA-256 `F409FCE55010D616FD576F27A0266B83321F95185E4A0CDEA4F6C6594352FFFD` (553797 bytes / 6587 physical lines).
Packet `PACKET_P-RECON78-UJ-EXEC-1v14.md`: SHA-256 `90414E34949C2178D93E29BBBC576D037772B9C24D415C28818941BC967B62DD` (499254 bytes / 6532 physical lines).

## 1. Intake - three complete replies, one round

Novelty proved before filing: fifteen message-true probes plus the round token were zero across all ten verdict files. One probe hit - the phrase about the day-close booleans - was traced to line 10866 of the GLM file, which lies inside the V402 block and is text I filed last round, so it is a recurring technical phrase and not evidence of a prior filing.

| Seat | Intake SHA-256 (measured) | Bytes / lines | Verdict file | OPEN / END line (measured) | Filed file SHA-256 | Filed bytes / lines |
| --- | --- | --- | --- | --- | --- | --- |
| Luna | `6AFA8F16D83A3C836CF608569988379EF98009A01357BD37296351A300367751` | 6996 / 66 | `BUILDER_VERDICTS_LUNA.md` | 17959 / 18026 | `8C409D3B966154FA7EE29B253F0E2EBC0C4EF91E85BE580362DAE9B2BF98E8CE` | 1248756 / 18026 |
| Sonnet | `5E59343A7A077A96D35207970DFBDDC7145F94AAEB04310235EE92D4C82BC901` | 16165 / 184 | `BUILDER_VERDICTS_SONNET.md` | 8118 / 8303 | `0005D3007DDDD993153AC0B8AB717424EC3DC1BE6C5D9B776E8A23085750CC13` | 944134 / 8303 |
| GLM | `5F87FD7D4536FF16FE5653C152FDA0EC1F2C66B18FCB686473FE31CDBC6489C1` | 18989 / 97 | `BUILDER_VERDICTS_GLM.md` | 10925 / 11023 | `5864391ABDCB401F6CF3FCA16F8EA8BBBC033E40AECC0D6317384B8157BD555D` | 2003639 / 11023 |

Intake element census green before use: 28 checks (Luna), 36 (Sonnet), 49 (GLM), zero deviations. Each body is byte-identical to its staged intake file; each append's byte delta equalled the asserted length; each tail reads back with its new END marker and a final LF; the round token occurs zero times in the other seven verdict files. Disclosed normalization as before: trailing spaces trimmed, two routing header lines added per file, no wording, number, verdict word or condition altered.

One near-miss owned: while censusing the GLM text I read a quoted ellipsis as a period and began to "correct" it. A char-code dump showed the character was U+2026, the ellipsis, and that the file was already correct - the console rendering was the only thing wrong. The transcription was right and the proposed edit was wrong; the edit was blocked before it was applied. This is the display-literal class recurring as a near-miss rather than a shipped defect.

## 2. Tally under section 47 TIE-FIXED, per question

| Question | Luna | Sonnet | GLM | Grade |
| --- | --- | --- | --- | --- |
| Q1 - closed-session target revisions and the day-close leg | CONFIRM (YES) | DISCREPANCY | CONFIRM (YES) | CONDITIONAL-CONFIRM |
| Q3 - the June 11 LONG through ordinary same-pass admission | CONFIRM (YES) | DISCREPANCY | CONFIRM (YES) | CONDITIONAL-CONFIRM |
| Q2 - June 5 NY 16:15 entry | not reviewed | not reviewed | not reviewed | closed |

Both questions carry YES plus DISCREPANCY, so both grade CONDITIONAL-CONFIRM. No OBJECT and no NO was returned by any seat. **This is the first round in which two seats CONFIRM either question.** A conditional-confirm is not implementation clearance: the named conditions bind the fold.

## 3. Realized delta against the V402 grade

- Q1 moved AMEND to CONDITIONAL-CONFIRM; Q3 moved AMEND to CONDITIONAL-CONFIRM. The design has converged far enough that two seats will confirm it, and one seat's conditions are specific, source-cited and mostly correctable by amendment rather than redesign.
- The branch question is no longer open as a question. Two seats rule that a same-pass path from the yielded state to ordinary promotion IS required and IS a mechanism detail under the existing pins rather than a new rule. That closes the largest open design item of the previous round.
- One mechanism disagreement survives: all three agree the path is required, but Sonnet recommends the matching flip-killed abort going first with a fresh re-seed, while GLM specifies a prebind-shaped path with no stale-carriage reads and rejects accidental behaviour. GLM and Luna additionally rule that June 11 is graded as yield-then-drop-then-ordinary-continuation, while Sonnet's A7 and Luna's condition 3 put the consume-and-release acceptance on a separate registered case. Those two positions are compatible and are folded as stated.
- Nothing voided. No operator strategy ruling changed. No run, build, or source state changed.

## 4. Two defects of v14 found this round, both mine

1. **The corrected predicate is still incomplete, and it would refuse the settled trade.** Sonnet derives from the page that June 11 is an equality case: the retained telemetry gives a body of three points against a 14:35 close of 160.526, and the terms printer shows the body-side satisfied, so the 14:35 open is 160.523, which is exactly the line. The 14:35 bar therefore OPENS ON THE LINE. The operator's pin requires the retest bar's open side to be judged, and the v14 predicate has no open-side term at all - its only equality statement concerns the close. A strict reading would refuse the settled June 11 trade on a technicality. This is the third successive defect of the same sentence across three folds, and its root is the same each time: the rule is being written from a summary rather than from every term the pin and the source actually impose.
2. **A disposition I asserted is wrong.** v14 says the prior-candle arm is retained because no quoted pin removes it. Sonnet cites the confirmation-canonical pin - the retest bar confirms if and only if it closes into setup-bias direction - which does remove that arm for the same-bar form, because in that form the arm cannot bind to the retest bar at all; it binds to the bar before the retest, which the prior-close pin says never judges. So the arm is retained by silence only for the general form, and must be disposed per form rather than as a single retained conjunct.

Both are recorded rather than corrected here, because the correction belongs in the fold and must be re-derived from source, not written from this grade's prose.

## 5. The branch ruling as adopted

The ruling, in the seats' own grounds: the June 11 short holder was flip-killed, and the governing pin says a flip-killed holder never vetoes a challenger because the new trade does not wait. Under the yield the challenger holds the slot but machine residue - an armed state with a zeroed zone - prevents it firing on its own bar, which is the veto the pin forbids arrived at by residue. The pin settles the outcome; the state the machine must be left in is mechanism. GLM additionally relies on the operator ruling embedded verbatim in the spliced source that the trade must be taken on the confirmation candle whenever it appears even while its own preparation is unfinished, and on same-candle being the settled shape for 11 June.

Accordingly June 11 is graded as: incumbent evaluation, yield, abort identity no longer matches, deferred abort dropped, ordinary continuation of the yielded candidate. Not as an invented special promotion path, and not as re-keying the abort into a consume. Luna adds that the release mechanism's acceptance evidence must come from a different registered case that actually exercises consume-and-release. Sonnet agrees the path is required under either reading of the pin and explicitly declines to assert which reading of the tie governs, which is the correct posture for a seat that sees an ambiguity rather than a ruling.

Binding sub-conditions adopted from GLM: the extension is recorded as a council-ruled scoping decision and never presented to the operator as a new-rule proposal; the path is designed, never an accident of the unspliced touch-discovery body, which must be spliced and classified; no stale-carriage reads, naming the stop reference and the seed-leg and reseed carriers, with the prebind shape satisfying this by construction where a stage-one reset would not; once-only counters extend to the yield path; and the consume-branch acceptance obligation stands on its own case or a declared synthetic fixture.

## 6. Further Q1 conditions, source-cited

- The day-close trigger is one pass late and the naming is inconsistent: the only defective term is the predicate at the day-close test, because the pass whose forming bar is the 23:55 bar already has the correct opening price as its local. GLM's condition 1 and Sonnet's A1 converge on the same correction, stated as the mark equalling the forming bar's open, with the fail-closed fallback in that local made visible for the day-close leg.
- The revision lag contradicts itself in the v14 text: one bar after the close boundary and the opening-tick principle cannot both stand. GLM's condition 2 reconciles it - the writer fires at the close-boundary opening tick on the same terms as day-close, and the "one bar after" sentence describes the current host rather than the contract, with target-passed re-scoped accordingly. Sonnet prefers shifting the first-out-bar pin so the revision fires at the first tick of the first out-of-session bar, which moves the regression row labels; the two are the same correction with different labelling, and the label move is a council choice, not a rule.
- The tick host needs a named insertion point ahead of the new-bar early return, a latch proven to span both hosts without double fire, and tick-level close requests racing a broker stop or target resolved through the existing pending rows.
- The managed snapshot is written before the alert-only return and before the concurrency, lot, stop and no-trade aborts, and the reset has already destroyed a live record before the concurrency check. Registration must move after the confirmed fill, and the sequence and admission counters consumed before the fill need their disposition stated.
- The day-close and week-close booleans in the life emitter use a strict inequality against the exit bar time while the verdict uses an inclusive one, so that boolean cannot read true for its own day-close exit and stays zero under the repair. Fix it or stop using it as evidence.
- The ASIA and PM exclusion is a disclosed narrowing of a symmetric pin, not a settled rule; it is carried as a known gap with a journal census of whether any such extreme would have been nearer on any trade.
- The contract must not rest on history: the transition table and the retcode proposal are to be printed as one block inside section 15.

## 7. Further Q3 conditions, source-cited

- The baseline failing term is derivable from the page and must be stated: the prior-candle arm passes, the close-side arm fails by one point, and the reclaim variant also fails, so the June 11 miss is exactly the term the prior-close pin removes.
- The retest bar's open side must be added to the predicate with inclusive equality, and the registered case recorded as an equality case.
- The one-point band removal is a tightening and must appear by name in the old-versus-new diff; the inline mirror still carries the band and must be migrated or declared void; the confirmation-poll row may be a third mirror and must be in the census; and the reclaim argument plus the equality counters lose their referent once the close-side arm is gone, so their disposition must be stated.
- Form selection must be stated as an or over both candidate retest bars, and the line-binding relationship promised but never stated must be stated, with three distinct values in play on the page.
- The v14 phrase "zeroes every latch" is overstated: the yield leaves the state, regime, session, divergence latch, alert-armed flag and the seed-leg carriers untouched; the challenger skips fresh initialization and inherits the short's regime and stage-two status, which contradicts the normal-initialization acceptance; no stand-down, refused-candidate or shadow record is written for the holder because the abort never runs; and the stage-four zone re-read has a derived asymmetry in which a long cannot rebind a zeroed lower bound while a short always can.
- The break arm's geometry, the R-binding mechanism across all thirteen sites and the mirror, the o0 proof row, the mid-term-bias carriage shape, the divergence proof row, and the zero-bound asymmetry hazard are each named as binding conditions.
- The historical "register row 26" citation in section 2 is superseded by the measured fact that no such row exists, and is to be struck rather than left standing in a section the fold does not mark superseded.

## 8. Operator-rule triage - still zero questions

No seat asks the operator anything. Sonnet states that if council reads the tie as challenger-confirm then the reading touches order and the operator word would be that reader's responsibility, and explicitly declines to assert it; GLM and Luna rule the same question a mechanism detail under the existing pins. That disagreement is a design choice between two source-grounded candidates and routes to council and the builder, never to him - mechanism and compute scope are never his to settle, and no pin is in question. The June 11 chart values remain the single operator-side evidence gap and block nothing. June 11 setup validity remains settled and unasked.

## 9. Close and authority

Q1 CONDITIONAL-CONFIRM. Q3 CONDITIONAL-CONFIRM. Q2 closed. No implementation authority is granted or inferred: no EA source edit, build, test, tester run, key, live action, commit, or push. The RECON78 one-run authorization remains consumed. SRJ stays alert-only and the dirty working tree is preserved. June 11 setup validity remains settled; the June 5 target-touch regression, the RECON57 day-close model-versus-broker close, the day-close price-reference defect and the day-mark pilot-window defect remain four separate open items, none closed by this grade.

The fold is the next artifact and it must re-derive the predicate from the source including the open-side term, dispose the prior-candle arm per form, resolve the mechanism disagreement explicitly, and splice the bodies now known to be missing: the touch-discovery body, the qualifying-zone and zone-adoption bodies, the shadow poll and retest-book bodies, the retest detection body, and the modify and close-deal helper bodies.