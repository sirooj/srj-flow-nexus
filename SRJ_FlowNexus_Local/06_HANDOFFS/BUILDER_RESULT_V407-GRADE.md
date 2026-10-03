# V407 council grade - packet P-RECON78-UJ-EXEC-1 v18

Date: 2026-10-03. Lane: SRJ Flow Nexus. Graded from filed bytes. No EA source was edited, no build, test, tester run, key, live action, commit, or push.

Relay `BUILDER_RELAY_COUNCIL_v407-UJ-EXEC-21.md`: SHA-256 `5BB4329AA752064FD31424D3529FA8A6066AC0BB4D3C471DA402A3CA86E7E747` (621613 bytes / 7242 LF lines; measured this turn).
Packet `PACKET_P-RECON78-UJ-EXEC-1v18.md`: SHA-256 `86C187A3374CA21A1F04DF3CA7E97812864383F96A3BB37101A657A7400DBDC9` (562553 bytes / 7201 LF lines; measured this turn).

## 1. Intake - three complete replies, one round

Novelty was proved before staging across all ten verdict files: eight distinctive-prose probes, two per seat plus two more, returned zero hits everywhere, and the round token `V407-UJ-EXEC-22` returned zero hits in all ten.

| Seat | Intake SHA-256 (measured; staged input, not a filed artifact) | Bytes | Verdict file | OPEN / END line (measured after filing) | Filed file SHA-256 (measured) | Filed bytes / LF lines |
| --- | --- | --- | --- | --- | --- | --- |
| Luna | `54C315FEFF62887CD43798A070725FCFDADBDE433A3E17E1A1A0CECE01911304` | 10221 | `BUILDER_VERDICTS_LUNA.md` | 18308 / 18416 | `6566C44D2C30F3C4FD538D47E400EE31C30FC38346A8C8504E5DAAD524D076CC` | 1281679 / 18416 |
| Sonnet | `495CF36608CCE0E1974E55B940D2AF2183EAFA5D21ACBEBE8DA1576A38C9DA9E` | 8944 | `BUILDER_VERDICTS_SONNET.md` | 8702 / 8806 | `D6A39AEE75DE3993ABF6971C9DB39C0B3219FCE67ED9D3EC93409410C94B85B5` | 989957 / 8806 |
| GLM | `3DD913B717BE8E0BC7B5764E1F85E792692E52478C9FA5CF64B03F5F5C752B44` | 13585 | `BUILDER_VERDICTS_GLM.md` | 11301 / 11377 | `F3FEDEF9B3C43AA301EE0A9C5FCDF35188C610E525D76580A4ADAA9334328F36` | 2078511 / 11377 |

Filing proof: pre-write gate on each measured pre-state digest, asserted byte deltas 10291, 9018 and 13653, markers OPEN=1 END=1 in each seat's own file, the round token exactly twice per file, and zero occurrences of the round token in the other seven verdict files. Each filed block was extracted back out of the saved file and compared byte-for-byte against its staged intake: identical for all three seats.

## 2. Tally - each question graded on its own

| Question | Luna | Sonnet | GLM | Grade |
| --- | --- | --- | --- | --- |
| Q1 - closed-session target revisions and the day-close leg | DISCREPANCY | DISCREPANCY | DISCREPANCY | **AMEND** |
| Q3 - the June 11 LONG through ordinary same-pass admission | CONFIRM | DISCREPANCY | DISCREPANCY | **AMEND** |

Q2 stays closed and is re-asked by no seat. No OBJECT and no NO anywhere. Both questions carry a DISCREPANCY pair, so both grade AMEND under the section 47 tie-fix. Fourth consecutive AMEND on both questions.

**Luna's Q3 CONFIRM is the first single-seat CONFIRM of this design thread on either question, and her reason for withholding it on Q1 is the substantive finding of the round.** She closes Q3 "at the design-contract level without claiming the June 11 trade occurred", and separates Q1 because the page itself leaves two things open: the day-close leg still depends on a source defect the page itself names - the marks are pilot-bounded, so the June window carries none - and 15.4.6 leaves the execution-reference decisions unbound. A seat declining to confirm because the packet is honest about its own gaps is the correct posture, and her Answer B accepts the acceptance as materially sufficient and correctly framed as future-only.

## 3. The operator's standing order, measured against this round

The order was that the same defects stop repeating. This round is a partial repeat again, and the seats identified exactly which parts of the gate I banked last round could not see them. That is the finding, and it is recorded rather than smoothed:

1. **The gate was one-directional.** It fingerprinted the phrases a fold replaced, so it could not see a sentence nobody edited that still describes a corrected thing. Sonnet found one verbatim: a sentence reading "a single value as 15.5.1 S8 now states" while S8 itself had been rewritten in the same fold to say the line is read per shift. The fold changed S8 and missed the sentence citing it.
2. **The promise check tested the phrase, not the requirement.** My own check asserted that the phrase "the mirror-row term this paragraph promised" existed. The requirement did not. GLM found it: 15.5.7a carried six numbered additions and none was the mirror-row term, so a named ask was claimed discharged while it was not - the same promise-without-a-home family the fold claimed to close.
3. **No duplicate check and no splice-coverage check.** GLM found a paragraph printed twice inside one line, and Sonnet and GLM independently found censuses resting on lines cited but not spliced.

Both source-checking seats also recorded what did hold: GLM verified all seven Q1 named items and nine Q3 named items in substance, including the T2 cell, the gapped-POC direction with EA 2368 quoted exactly, the two containment forms, FIRST WRITER WINS, the day-mark design/source separation measured at EA 10882-10883 and EA 11005-11006, the polarity restoration with both cases, the `A_OPP` flat-bar attribution, the break arm's genuinely narrow population, the route row sets and EX-31/EX-32. Sonnet confirmed seven items with no condition. Neither reopens the per-form disposition, the consume placement or the polarity.

The disposition is therefore not another clause: the gate becomes **bidirectional**, with a backward reference sweep, a requirement-resolution check, splice coverage and de-duplication, and - the seat's own request - the gate and the condition crosswalk are printed **inside the packet** so a seat can re-run them instead of trusting the builder.

## 4. Condition crosswalk - nineteen distinct items, each with my verification

Verified (V) means I read the cited EA line or packet line this turn and the seat's reading holds.

**Q1 (seven items)**

| # | Condition | Seat | Status |
| --- | --- | --- | --- |
| 1 | The gapped-POC predicate is vacuous and its value has no source | Sonnet Q1-1 | V - the POI line universe is exactly EA 93-104, twelve FOMC/Yearly/Quarterly/Monthly/Weekly/Daily POC and VWAP entries, and NONE is a London or NYAM session POC; for a LONG the open clause is implied by open <= high, so the predicate reduced to "POC >= high". There is no buffer to read and no producer to write one, so the detector is unsourced |
| 2 | 15.3.2 forbids what 15.3.4 prescribes | Sonnet Q1-2 | V - the forbidden `mark <= barTime` was unscoped while the catch-up prescribes exactly that comparison plus fill containment at EA 12017 |
| 3 | First-writer-wins covers only the day-close latch | Sonnet Q1-3 | V - the earlier check evaluates five legs; the close helper returns NOTHING-TO-CLOSE at EA 11808-11811 and the caller prints MTCLOSE_FAIL on a zero return at EA 12058-12059, so a double close on one tick produces a spurious failure row |
| 4 | Counter readers mislabelled | Sonnet Q1-4, GLM Q1-D2 | V - EA 10700 reads `uj_tradeSeqNext`; EA 10737, EA 11635, EA 11684, EA 11691, EA 11921 and EA 11923 read the instance field `g_mtrade.uj_tradeSeq` |
| 5 | The LATE retarget cannot be produced by the pins | Sonnet Q1-5 | V - pin (1) tests the bar after the evaluated one, which holds only on the firing pass where the evaluated bar is the last in-session bar |
| 6 | The LATE day-close fixture has no inducing mechanism | Sonnet Q1-B | C - accepted as stated; the fixture needs a named pass-skipping fault or it is NOT GRADED |
| 7 | 15.0 narrated the wrong review round, and the page carried no crosswalk and no re-runnable gate | GLM Q1-D1, Sonnet hygiene | V - 15.0 still described the V405 round and its markers while the header named V406 |

**Q3 (twelve items)**

| # | Condition | Seat | Status |
| --- | --- | --- | --- |
| 8 | 15.5.2 contradicts S8 on the line | Sonnet Q3-1 | V - the sentence claimed a single value while S8 and 15.5.2 itself said per shift; the governing read is the predicate's at EA 2351 |
| 9 | The mirror-row promise has no home | Sonnet Q3-2, GLM Q3-D4 | V - 15.5.7a carried six additions and none was the mirror-row term; only the diff-class name existed |
| 10 | The 15.5.4 counter lists are still wrong | Sonnet Q3-3, GLM Q3-D5 | V - EA 1130-1131 and EA 1139-1148 are `int x = 0` declarations; only EA 1143-1146 are the VWAP and POC partners; EA 1139-1142 and EA 1147-1148 are retained entry and exit counters; EA 11968 writes `g_n1_exitBodyInv/Surv` and does not belong in the removal list; of the EA 11333-11336 pair block only EA 11335 is VWAP and POC |
| 11 | The eviction census rests on unspliced lines and EX-29 over-claims | Sonnet Q3-4, GLM Q3-D6 | V - EA 1961 and EA 1967 appear nowhere on the page; the day variables are declared at EA 1941-1942 and assigned at EA 9323 and EA 9325, so "no other assignment" is false for them; only `ABORT_DIV_FALLBACK` at EA 9316 reaches the bit-set writers |
| 12 | The S3 cell and the withdrawn open claim are contradicted by the page's own rows | Sonnet Q3-5 | V - the telemetry row carries `confC=0` for `sbDir=LONG`, so EA 8438 did evaluate the LONG contender predicate; and the poll row's `bodyDir=0` with a three-point body plus the printed close at 160.526 derives the 14:35 open to 160.523, which is the line - a derivation, not a measurement, and the registered bar also sits in the break arm's population on that derivation |
| 13 | "Exactly one" set site rests on partial splices | Sonnet Q3-6 | C - accepted; the claim becomes a builder-disk grep count with the spliced regions named |
| 14 | The yield-row cross-reference points at a section with no such reason, and the fresh candidate's contender row is missing | Sonnet Q3-6 | C - accepted; the reason is named at its actual location and the contender row added |
| 15 | 15.5.4 still lists declarations as reads and mixes families | GLM Q3-D5 | V - same evidence as item 10; labelling only, scope already correct |
| 16 | The supersession paragraph is printed twice in one line | GLM Q1-D3 | V - measured twice verbatim; a mechanical edit artifact |
| 17 | The relation gate lives only in the relay header | Sonnet hygiene | V - a seat cannot re-run what is not on the page it reads |
| 18 | No crosswalk of the conditions on the page | Sonnet hygiene | C - printed at 15.8 |
| 19 | The contender-confirm reading of pin 117 is a reading, not a scoped pin | Sonnet note | C - carried as a reading, already covered by the NOT GRADED clause for the unexercised tie |

## 5. What the round confirms, with credit

Sonnet confirmed seven items with no condition, including the retained arm's polarity with both cases, the day-close interval booking the forming bar's open, the pilot-window consequence measured at EA 10882-10883, the writer walk re-base reproducing both baseline values because the new walk covers the same bars, EA 8438 as the sole reclaim call site, and the two NOT-emitted gates vanishing once the consume leaves the state IDLE. GLM confirmed the substantive contract in both questions and confined every objection to enumeration and citation. Luna confirmed all sixteen Q3 conditions individually and named exactly what blocks Q1.

The convergence matters: the design is not what is keeping this open. Sonnet's own summary is that both questions would close after a fold that fixes page text and splices EA 6939 - and EA 6939 is now spliced at EX-32.

## 6. Standing limits

Q1 AMEND. Q3 AMEND. Q2 closed. No implementation authority is granted or inferred: no EA source edit, build, test, tester run, key, live action, commit or push. The RECON78 one-run authorization remains consumed. SRJ stays alert-only and the dirty working tree is preserved. June 11 validity is settled and not re-derived: 14:35 New York USDJPY Daily-POC retest plus confirmation, entry at the 14:40 open exactly 160.524, 14:45 and later post-entry. The four open defects stay separate: June 5 target-touch management retirement, the RECON57 day-close model-versus-broker close, the day-close price reference, the day-mark pilot window - and this round's measurement stands, that the June window carries no day marks at all, so no June fixture can grade the DAY_CLOSE branch until that defect is closed. That is also why Luna could not confirm Q1 and it is not a page defect.