# V408 council grade - packet P-RECON78-UJ-EXEC-1 v19

Date: 2026-10-03. Lane: SRJ Flow Nexus. Graded from filed bytes. No EA source was edited, no build, test, tester run, key, live action, commit, or push.

Relay `BUILDER_RELAY_COUNCIL_v408-UJ-EXEC-23.md`: SHA-256 `08986DE6843C8D47F2AB572B26D50555A6110F27858BA19CDBDC6F13B291877E` (634048 bytes / 7296 LF lines; measured this turn).
Packet `PACKET_P-RECON78-UJ-EXEC-1v19.md`: SHA-256 `18D71F386768E094671F1105FBECD880E9AE25374C5E5BA337A0269E4EE02619` (574665 bytes / 7253 LF lines; measured this turn).

## 1. Intake - three complete replies, one round

Novelty was proved before staging across all ten verdict files: the round token `V408-UJ-EXEC-24` returned zero hits in all ten before filing, and after filing the token count is exactly 2 in each seat's own file (its OPEN and END markers).

| Seat | Verdict file | OPEN / END line (measured) | Filed file SHA-256 (measured) | Filed bytes / LF lines |
| --- | --- | --- | --- | --- |
| Luna | `BUILDER_VERDICTS_LUNA.md` | 18417 / 18459 | `A480734833B77153AE426E916B9F902C0D47FB7B03860FBA32B4891143B5D554` | 1285927 / 18459 |
| Sonnet | `BUILDER_VERDICTS_SONNET.md` | 8807 / 8884 | `02CBDA5C5D69790AF003B81D8E0B7DC6ECCC30ED908FFE8E2C20A723C50AD9A5` | 996586 / 8884 |
| GLM | `BUILDER_VERDICTS_GLM.md` | 11378 / 11459 | `056F7F97FCDDB5547431C1C0EAD0E6CF7F1EBFF3CC8B4CB535B8C93FF9E7EFA3` | 2092548 / 11459 |

Filing proof: pre-write gate on each measured pre-state digest (`6566C44D...`, `D6A39AEE...`, `F3FEDEF9...`), markers OPEN=1 END=1 in each seat's own file, the round token exactly twice per file and zero times in the other seven; the appended lines are LF-only so each file's CR count is unchanged (14572 / 5608 / 9270). Each block was extracted back out of the saved file and compared byte-for-byte against its staged intake: identical for all three seats. The replies are filed with no markers inside their bodies and no seat text altered.

## 2. Tally - each question graded on its own

| Question | Luna | Sonnet | GLM | Grade |
| --- | --- | --- | --- | --- |
| Q1 - closed-session target revisions and the day-close leg | DISCREPANCY | DISCREPANCY | DISCREPANCY | **AMEND** |
| Q3 - the June 11 LONG through ordinary same-pass admission | CONFIRM | DISCREPANCY | DISCREPANCY | **AMEND** |

Q2 stays closed and is re-asked by no seat. No OBJECT and no NO anywhere. Q1 carries a unanimous DISCREPANCY triple and Q3 carries Luna's CONFIRM against a DISCREPANCY pair, so both grade AMEND under the section 47 tie-fix.

**The movement is real and convergent, and the disagreements are now almost entirely page relations rather than design.** Luna holds her Q3 CONFIRM at the design-contract level and names exactly what blocks Q1: the day-close leg still depends on the pilot-bounded marks, and 15.4.6 leaves the execution-reference decisions unbound. Sonnet and GLM both confirm the substantive contract in substance and then file page-side conditions. The single largest convergent finding is the gapped-POC residue: Luna, Sonnet and GLM independently say that the section which declares the detector UNSOURCED and NOT GRADED still carries live-recorder sentences elsewhere on the same page, so the fold half-changed its mind in place.

## 3. The operator's standing order, measured against this round

The order was that the same defects stop repeating. This round the repeat is again a relation class, and the seats name the exact cells the bidirectional gate still could not see. That is the finding, and it is recorded rather than smoothed:

1. **The declaration was changed in one place and left live in others.** 15.4.1/15.4.2 declare the gapped-POC detector unsourced, but 15.4.3 row 2 still lists "or gapped POC" as a transition event, 15.4.7 addition (2) still requires a gapped-POC fixture, and 15.7 still asks the seats to check a "gapped-POC predicate and its producer named". The backward sweep fingerprinted replaced phrases and so could not see a normative clause elsewhere that still presumes the old disposition.
2. **A crosswalk row pointed at content that does not exist.** GLM's D2 and Sonnet's C4 both measure it: crosswalk row 6 says 15.4.7 marks the LATE fixture NOT GRADED, while 15.4.7 addition (1) requires it and carries no such marking. Requirement-resolution tested that a phrase existed, not that the pointed-at requirement matched the claim.
3. **A census preamble still miscounts its own table.** Sonnet Q3-C1 and GLM D5 both measure the same cell: 15.5.1 says "eighteen predicate rows" over a table of nineteen.
4. **The round narration still describes an earlier round.** Sonnet's hygiene note and GLM D3 both measure it: 15.0 still narrates V405, and the Status line body still says "the V406 seats".

The disposition is not another clause. It is the same EDIT-SET-CLOSURE family extended by one step - a declared disposition must be swept for live premises of the OLD disposition, not only for the phrase that changed - and the two relation gates banked this round (COUNT-VS-ENUMERATION and CROSSWALK-COVERAGE) already name two of the four above. Both are applied to the next fold.

## 4. Condition crosswalk - every named condition, one row each

**Q1 - the day-close leg and the closed-session target revisions.**

| # | Condition | Seat | Where it is answered / status |
| --- | --- | --- | --- |
| 1 | The detector is declared UNSOURCED, yet live-recorder premises remain on the page | Luna; Sonnet C1; GLM D1 | Open - 15.4.1/15.4.2 declare it unsourced; sweep the live premises |
| 2 | 15.4.3 row 2 still lists "or gapped POC" as a transition event | Sonnet C1; GLM D1 | Open |
| 3 | 15.4.7 addition (2) still requires a gapped-POC fixture | Sonnet C1; GLM D1 | Open - becomes NOT GRADED |
| 4 | 15.7 still asks for "the gapped-POC predicate and its producer named" | Sonnet C1 | Open |
| 5 | 15.0 narrates the V405 round | Sonnet; GLM D3 | Open - rewrite 15.0 as the V407 fold |
| 6 | P0003 says "the V406 seats" | Sonnet; GLM D3 | Open - should read V407 |
| 7 | P0005 calls EX-32 "new at this fold" and omits EX-33 | Sonnet | Open |
| 8 | Crosswalk row 6 claims a 15.4.7 LATE NOT-GRADED marking that does not exist | Sonnet C4; GLM D2 | Open - align row 6 with 15.4.7 |
| 9 | EA 93-104 cited but only EA 103-104 spliced | Sonnet C2; GLM D4 | Open - splice the range whole |
| 10 | `POI_NLINES` / `UjPoiTargetValid` unspliced | Sonnet C2 | Open |
| 11 | 15.3.3 states three latch scopes | Sonnet C3 | Open - pick one |
| 12 | "read at exactly one place" false; EA 10731 also reads the global | Sonnet D5 | Open - add EA 10731 |
| 13 | State the earlier check's read order; `MtNearestTpTarget` reads `uj_pool` | Sonnet C6 | Open |
| 14 | Whether a SYNC_FAILED revision counts as booked/pending at row 2 | Sonnet C6 | Open |
| 15 | The SHORT bid-chart touch vs Ask-side TP distinction dropped from rows 8-10 | Sonnet C6 | Open |
| 16 | The DAY_CLOSE fixture must sit inside the pilot window | Sonnet C6 | Open |
| 17 | Minor - is `uj_admitCount` released on a pre-fill abort (EA 12227) | GLM (v) | Open |
| 18 | Minor - EA 1961/1967 labelled "blocking reads" | GLM (vi) | Open |

Luna's own Q1 remaining list is the same family plus the four standing defects: correct the producer contradiction, close the day-mark pilot window, resolve the day-close price reference and RECON57, resolve June 5 target-touch management, then exercise the LATE fixture. Luna's Answer B accepts the TP branch as exact and the DAY_CLOSE branch as deliberately future-only.

**Q3 - the June 11 LONG through ordinary same-pass admission.**

| # | Condition | Seat | Where it is answered / status |
| --- | --- | --- | --- |
| 19 | 15.5.1 preamble "eighteen predicate rows" against a table of nineteen | Sonnet Q3-C1; GLM D5 | Open - correct the count |
| 20 | Reader census omits EA 8240 | Sonnet Q3-C2 | Open - add EA 8240 |
| 21 | "exactly one" set site is asserted, not shown | Sonnet Q3-C3 | Open - print the grep list or splice it |
| 22 | Add the challenger `UJSBTELEM` row; "left the state IDLE" wording | Sonnet Q3-C4; GLM (minor) | Open |
| 23 | "both opens stated as derivations" is half-delivered | GLM D6 | Open - reword or show both derivations |
| 24 | Diff class for same-bar-form-only admissions | GLM | Open - name it or show it cannot occur |

Luna's Q3 CONFIRM states its remaining items as acceptance predicates rather than design defects: the future run must prove the exact 160.524 admission/deal path, Q1's prerequisite must be satisfied, the preservation cases must stay unchanged, and an unexercised contender-confirm tie must remain NOT GRADED. Sonnet Q3 Answer B is "exact and gradeable" subject to adding the challenger `UJSBTELEM` row. GLM Q3 Answer B is "gradeable" subject to the same-bar diff-class condition.

## 5. What the round confirms, with credit

Sonnet re-derived and confirmed the polarity against EA 2366-2367, the S3 close-side failure at EA 2368 with `confC=0`, the 14:35 open derivation to 160.523, both disjuncts and the break arm, the 13-site caller split, the six-row field reader list, and the re-based walk policed by 159.908 and 160.298. GLM verified the twelve eviction touch points, the single bit-set writer at EA 9316, the `topLine*2` bit separation, the mirror-row addition (7), EX-33's splice of EA 1955-1975, the F11 consume placement at EA 7454 and every ordering claim against the spliced control flow, and the counter dispositions line by line. Luna confirms Q3 outright at the design-contract level. All three seats confirm the corrected rule, the polarity restoration, the consume placement and the route row sets, and none reopens the per-form disposition, the EA 7454 placement or the polarity.

## 6. Standing limits

Q1 AMEND. Q3 AMEND. Q2 closed. No implementation authority is granted or inferred: no EA source edit, build, test, tester run, key, live action, commit or push. The RECON78 one-run authorization remains consumed. SRJ stays alert-only and the dirty working tree is preserved. June 11 validity is settled and not re-derived: 14:35 New York USDJPY Daily-POC retest plus confirmation, entry at the 14:40 open exactly 160.524, 14:45 and later post-entry. The four open defects stay separate: June 5 target-touch management retirement, the RECON57 day-close model-versus-broker close, the day-close price reference, and the day-mark pilot window - and that last one is why Luna withholds Q1 and is not itself a page defect. A council clearance never replaces an authorization assigned to the builder.