# V409 council grade - packet P-RECON78-UJ-EXEC-1 v20

Date: 2026-10-03. Lane: SRJ Flow Nexus. Graded from filed bytes. No EA source was edited, no build, test, tester run, key, live action, commit, or push.

Relay `BUILDER_RELAY_COUNCIL_v409-UJ-EXEC-25.md`: SHA-256 `7ED1D76290DF03F5EFB6943402AFE0214DA5C587F32D1B63D9969170B6955EE6` (644346 bytes / 7404 LF lines; measured this turn).
Packet `PACKET_P-RECON78-UJ-EXEC-1v20.md`: SHA-256 `A79BC8BC79173B170A995E43F1531F780AD5733D9CAB041F818E4E3C9A446974` (587718 bytes / 7367 LF lines; measured this turn).

## 1. Intake - three complete replies, one round

Novelty was proved before staging across all ten verdict files: round token `V409-UJ-EXEC-26` returned zero hits in all ten before filing, and after filing the token count is exactly 2 in each seat's own file.

| Seat | Verdict file | OPEN / END line (measured) | Filed file SHA-256 (measured) | Filed bytes / LF lines |
| --- | --- | --- | --- | --- |
| Luna | `BUILDER_VERDICTS_LUNA.md` | 18460 / 18572 | `60D470162BA55ECD0AEBD9F934C67308B8602C4717EE8692E4EF6D4C90CB0CEF` | 1294643 / 18572 |
| Sonnet | `BUILDER_VERDICTS_SONNET.md` | 8885 / 9030 | `824E3947B8748310460769C920DF0E03F866CD0D6860046D70414CC4C0D33709` | 1007708 / 9030 |
| GLM | `BUILDER_VERDICTS_GLM.md` | 11460 / 11545 | `7676E1F210F219A0E359083D9AB3E789D757F7A151804A69A8F0E9A32A98F250` | 2111437 / 11545 |

Filing proof: pre-write gate on each measured pre-state digest (`A4807348...`, `02CBDA5C...`, `056F7F97...`), markers OPEN=1 END=1 per seat's own file, the round token exactly twice per file and zero times in the other seven; appended LF-only so each file's CR count held (14572 / 5608 / 9270). Each block was extracted back out of the saved file and compared byte-for-byte against its staged intake: identical for all three seats.

## 2. Tally - each question graded on its own

| Question | Luna | Sonnet | GLM | Grade |
| --- | --- | --- | --- | --- |
| Q1 - closed-session target revisions and the day-close leg | DISCREPANCY | DISCREPANCY | DISCREPANCY | **AMEND** |
| Q3 - the June 11 LONG through ordinary same-pass admission | CONFIRM | DISCREPANCY | CONFIRM | **CONDITIONAL CONFIRM** |

Q2 stays closed and is re-asked by no seat. No OBJECT and no NO anywhere. Q1 is a unanimous DISCREPANCY triple, so it grades AMEND. **Q3 carries two CONFIRM seats for the first time in this design thread** (Luna and GLM), against Sonnet's page-text DISCREPANCY; under the section 47 rule a YES+YES pair confirms the design and the lone DISCREPANCY is page text, so Q3 grades CONDITIONAL CONFIRM. This is real movement: the Q3 mechanism and acceptance are affirmed by two source-checking seats, and Sonnet himself affirms every Q3 condition as page text, not design.

**The Q1 hold is now narrow and named.** Luna confirms the TP branch is tightly specified and holds Q1 only on the standing four open defects (the day-mark pilot window chief among them), not on the fold. Sonnet and GLM both hold Q1 on page-text defects in the v20 fold itself - and the sharpest of them is a defect this fold introduced.

## 3. The operator's standing order, measured against this round

The order is that the same defects stop repeating. This round the gate found no defect in the carried text, but the fold's own edit introduced one, and the seats caught it independently:

1. **The v20 rewording of the LATE clause is inverted, and three discharge claims are false with it.** Sonnet (#1) and GLM (its Q1 discrepancy) both measure it: 16.3 reworded 15.4.7 addition (1) to "required UNLESS a pass-skipping fault can be named ... in which case NOT GRADED", which is the OPPOSITE polarity to crosswalk row 6's "NOT GRADED unless a pass-skipping fault is named", while 16.3, the relay header and crosswalk row 8 all claim the two "now match exactly". This is the exact defect class (a crosswalk row contradicting the cell it points at) the DISPOSITION SWEEP was built to catch - committed by the sweep's own edit. It is condition 1 for the next fold.
2. **Three crosswalk rows point at text that does not exist.** Sonnet rows 15 and 17; GLM rows 6, 7 and 8; and the split of 15.4.1's unstruck fragment. The crosswalk was printed so a seat could check discharge one row at a time; three rows do not resolve on the page.
3. **Overlay residue survives in place.** P7162 still reads "eighteen", P7206 "left the state IDLE", and 15.5.7 "SIX classes"; these are corrected only by the Section 16 overlay. Sonnet asks that the next fold fold them in place.

The disposition: the DISPOSITION SWEEP principle held (the gapped-POC residue and the latch scope were discharged cleanly), but the fold applied it to the wrong clause and did not re-check its own crosswalk rows against the page. The lesson for the next fold is that a rewrite must be re-read against the row that cites it before the row claims agreement.

## 4. Condition crosswalk - every named condition, one row each

**Q1 - the day-close leg and the closed-session target revisions.**

| # | Condition | Seat | Where it stands |
| --- | --- | --- | --- |
| 1 | The 16.3 LATE rewording inverts the polarity against crosswalk row 6, and three discharge claims are false | Sonnet 1; GLM disc | Open - carry one polarity in both places (row 6's form is the domain-correct one) |
| 2 | 15.4.1 still carries "detection predicate and its producer are now named" | GLM 2 | Open - strike or re-scope |
| 3 | 15.4.7 "THREE ADDITIONS" is stale after addition (2) is struck | GLM 3; Sonnet B | Open - re-count or annotate |
| 4 | Crosswalk row 15 claims the SHORT bid/Ask distinction "carried in rows 8-10"; rows 8-10 do not carry it | Sonnet 4; GLM note | Open - name 16.6 as its home or add it to the rows |
| 5 | Crosswalk row 17 places EA 10732 on the "confirmed-fill path"; it sits in the pre-fill snapshot | Sonnet 3; GLM note | Open - state `uj_admitCount` placement in one voice (not-released disposition stands) |
| 6 | The earlier-check read order's consequence is undrawn | Sonnet 8; GLM note | Open - state whether the stale `uj_pool` read is accepted or the refresh moves first |
| 7 | Crosswalk row 7 attributes the EX-32/EX-33 provenance correction to 16.4, which carries only EX-34/EX-35 | GLM 7 | Open - fix the pointer |
| 8 | P0001/P0003/P0005 still read "v19"/"v20 DRAFT"/"the V406 seats"/EX-32 "new at this fold" | Sonnet 10; GLM 8 | Open - head-note as v20; quarantine the carried P0003 phrase |
| 9 | The LATE disposition was not swept in place: 15.4.7 "two cases" and 15.7 "both detectors listed" | Sonnet 2 | Open - re-scope both |
| 10 | The declared-loss retarget row is promised by 15.3.5 and row 5 but is not in 15.4.7 | Sonnet 5 | Open - add the requirement or drop the promise |
| 11 | Row 2's nearest rule v SYNC_FAILED: the model touch reference is undefined | Sonnet 6 | Open - define the reference |
| 12 | Rows 8-10 and 14-16 are execute-mode only; alert-only is silent | Sonnet 7 | Open - scope the rows and state the alert-only retirement |
| 13 | "Gapped POC" is defined by the page (session POC), not by the pin | Sonnet 9 | Open - operator question raised (see below) |
| 14 | The four open defects (June 5 target-touch retirement; RECON57 model-v-broker close; day-close price reference; day-mark pilot window) | Luna; GLM 9 | Carried, unchanged - Q1 cannot close on these |

**Note on Q1 (Luna).** Luna's Q1 DISCREPANCY rests ONLY on condition 14 (the standing four defects, chiefly the day-mark pilot window making the DAY_CLOSE branch ungradeable on a June fixture) and on the implementation prerequisite at 15.4.6; she affirms the TP branch as exact and the whole fold's Q1 diagnosis as genuine closure. So the fold's page-text items are Sonnet's and GLM's; Luna's hold is the standing source state.

**Q3 - the June 11 LONG through ordinary same-pass admission.**

| # | Condition | Seat | Where it stands |
| --- | --- | --- | --- |
| 15 | EA 1961/1967 are fire-clear guards, not day-change clears; "four clears" undercounts (EA 9323/9325 also clear) | Sonnet Q3-1 | Open - correct the label; this belongs to the Q3 eviction proof, not Q1 |
| 16 | The "exactly one set site" grep is asserted, not on the page; `uj_saAbort` reads at EA 8463, not only 8465 | Sonnet Q3-2; GLM Q3-1 | Open - print the grep (span EA 6944-7379 unspliced) and list both reads |
| 17 | EA 8240 is already on the Eq-read list; only the Surv/Inv list was missing it | Sonnet Q3-3; GLM Q3-2 | Open - narrow the claim |
| 18 | The challenger `UJSBTELEM` row (EA 8442) is gated on reaching S3; make it conditional, not a missing row | Sonnet Q3-4; GLM Q3-4 | Open - scope the row |
| 19 | The seventh diff class has no exclusivity rule (overlaps close-side and band removal) | Sonnet Q3-5 | Open - give a precedence rule or declare multi-label |
| 20 | Overlay residue in place: P7162 "eighteen", P7206 "left the state IDLE", 15.5.7 "SIX classes" | Sonnet Q3-6 | Open - fold the three in place |

**Q3 is affirmed by Luna and GLM with these six page-text conditions only; Sonnet affirms every one of them as page text.** No design item is reopened: the consume at EA 7454, the polarity restoration, the single set site, the mirror migration and the eviction isolation all stand.

## 5. What the round confirms, with credit

Luna and GLM both confirm Q3 outright. GLM re-verified the corrected rule against the source arm (EA 2366-2367), the registration and reader lists, the F11 census, the one-row-set-per-route with the consume at the single set site, and the acceptance additions, and found no pin reading that differs. Luna confirmed the flip-killed route (abort SET at EA 7454, consumed, fresh IDLE seed), the fresh initialization, the narrowed ordering claim to the holder-confirm tie, and the correctly-separated O6 gates. Sonnet re-derived the registered case (o0=160.523 from the printed operands) and affirmed the consume-at-set-site mechanism, the seven classes, and the two-disjunct form. The standing Q1 reason (Luna) is unchanged and is the source state, not the page.

## 6. Standing limits

Q1 AMEND. Q3 CONDITIONAL CONFIRM (Luna CONFIRM, GLM CONFIRM, Sonnet DISCREPANCY). Q2 closed. No implementation authority is granted or inferred: no EA source edit, build, test, tester run, key, live action, commit or push. The RECON78 one-run authorization remains consumed. SRJ stays alert-only and the dirty working tree is preserved. June 11 validity is settled and not re-derived: 14:35 New York USDJPY Daily-POC retest plus confirmation, entry at the 14:40 open exactly 160.524, 14:45 and later post-entry. The four open defects stay separate: June 5 target-touch management retirement, the RECON57 day-close model-versus-broker close, the day-close price reference, and the day-mark pilot window - the fourth is why Luna withholds Q1 and is not itself a page defect.

## 7. Operator questions raised by the seats (his-carrier; batch, do not send)

Sonnet raises two strategy-framing questions (both marked not-a-blocker). They are his-carrier and are batched here, not sent anywhere:

1. **"Gapped POC" scope (pin 32).** Did the operator mean (a) the POC of a closed London or NYAM session - under which there is no source in the EA and NOT GRADED is correct - or (b) one of the existing POC lines (Daily, Weekly, Monthly, and so on) that price has gapped away from - under which the lines already exist and the "unsourced" declaration is wrong? The page adopted (a) without saying so; the operator's words do not decide it.
2. **The pin-117 reading.** After the corrected predicate, June 11 is itself a flip-killed holder with a confirmed challenger on the same bar, which pin 117 calls "unexercised, keeps current order". The page reads the pin as the holder-confirm case only. Confirm the intended reading.