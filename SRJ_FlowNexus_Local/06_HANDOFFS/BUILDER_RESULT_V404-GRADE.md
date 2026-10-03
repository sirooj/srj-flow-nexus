# V404 council grade - packet P-RECON78-UJ-EXEC-1 v15

Date: 2026-10-03. Lane: SRJ Flow Nexus. Graded from filed bytes. No EA source was edited, no build, test, tester run, key, live action, commit, or push.

Relay `BUILDER_RELAY_COUNCIL_v403-UJ-EXEC-15.md`: SHA-256 `BC5CCFE058C74F6580AEF707F1C200F51BA59E4EEA3DC9496B86C37FF63F196A` (575216 bytes / 7064 physical lines).
Packet `PACKET_P-RECON78-UJ-EXEC-1v15.md`: SHA-256 `094F4B6BB5596448625DAA492EFCE2114D0285249CDDA32E5AF1A0FF71A3BB9A` (519620 bytes / 7020 physical lines).

## 1. Intake - three complete replies, one round

Novelty was proved before staging: thirteen of fourteen message-true probes were zero across all ten verdict files, the round token `V404-UJ-EXEC-16` was zero everywhere, and the single probe hit was traced to line 16892 of the Luna file - far above the V403 block that begins at 18027 - so it is a recurring phrase in older filed text and not a prior filing of this round.

| Seat | Intake SHA-256 (measured) | Bytes / lines | Verdict file | OPEN / END line (measured) | Filed file SHA-256 | Filed bytes / lines |
| --- | --- | --- | --- | --- | --- | --- |
| Luna | `A0FBFE66E49F7ACF166C91A1BC8F885E0AC3C6608013F0AA5108B50357DAC950` | 8917 / 109 | `BUILDER_VERDICTS_LUNA.md` | 18027 / 18137 | `B18AD44A28B5D2469DF56F1F519CE41818DE399A05379440BE2B9194CFBEE3A0` | 1257743 / 18137 |
| Sonnet | `B33FAD5DD4E3D3F95AFA8B8919F086D7A20ABD11B7851C8214F04D569AA6952B` | 14950 / 164 | `BUILDER_VERDICTS_SONNET.md` | 8304 / 8469 | `4B3FDFA61210686C1BDD68A842EA98609B8CA7684B2C4F69E0093FFCD4AD14B6` | 959158 / 8469 |
| GLM | `D739B62C17C41683F741913BE42317D437F348E271690F78A97FAABE8579374F` | 17822 / 88 | `BUILDER_VERDICTS_GLM.md` | 11024 / 11113 | `D32103BC28BD8E510C01DBAE155DB60F23CE45F15181A1AE368A00A477D5C287` | 2021529 / 11113 |

Intake element census green before use: 31 checks (Luna), 44 (Sonnet), 37 (GLM), zero deviations. Each body byte-identical to its staged intake file; each append's byte delta equalled the asserted length; each tail reads back with its new END marker and a final LF; the round token occurs zero times in the other seven verdict files. Disclosed normalization as before: trailing spaces trimmed, two routing header lines added per file, no wording, number, verdict word or condition altered.

## 2. Tally under section 47 TIE-FIXED, per question

| Question | Luna | Sonnet | GLM | Grade |
| --- | --- | --- | --- | --- |
| Q1 - closed-session target revisions and the day-close leg | CONFIRM (YES) | DISCREPANCY | DISCREPANCY | AMEND |
| Q3 - the June 11 LONG through ordinary same-pass admission | CONFIRM (YES) | DISCREPANCY | DISCREPANCY | AMEND |
| Q2 - June 5 NY 16:15 entry | not reviewed | not reviewed | not reviewed | closed |

Both questions carry a DISCREPANCY+DISCREPANCY pair, so both grade AMEND. No OBJECT and no NO was returned by any seat. **Both questions move back from CONDITIONAL-CONFIRM to AMEND.** Luna's confirm does not survive the round: she graded against the page's stated contract, and both source-checking seats found that the contract's most load-bearing sentence is wrong in a way that would reproduce the defect it repairs.

## 3. Realized delta against the V403 grade

- Q1 and Q3 both revert from CONDITIONAL-CONFIRM to AMEND. The V403 grade's "first round with two confirms" did not survive contact with the source.
- The per-term census is endorsed. Luna confirms it as the controlling admission gate and states there is no unclassified row; GLM re-ran it against the twin and confirmed every row resolves, including the per-form disposition of the prior-candle arm, with **no differing pin reading and no diff following**. That item is closed by two seats and is not reopened.
- The branch question is closed as a mechanism question. Both source-checking seats agree a same-pass path is required and agree it is a mechanism detail under the existing pins rather than a new rule.
- One live design disagreement survives and is now sharper: Sonnet and GLM both accept that the flip-killed case must reach ordinary promotion, but GLM requires the mechanism decision to be re-keyed to the mechanism, while Sonnet requires the consume to sit at or before the seed-gated block. The fold must pick one and justify it.
- Nothing voided at the strategy level. No operator ruling changed. No run, build or source state changed.

## 4. Defect one: the day-close trigger interval as written reproduces the defect it repairs

This is mine, and it is the most load-bearing sentence in the Q1 contract. Sonnet's Q1-1 and GLM's Q1 A1 found it independently and with the same reasoning.

v15 wrote: fire and book only when the mark equals the forming bar's open, that is `barTime <= mark < barTime + PeriodSeconds`. Inside `EvaluateManagedTrade`, `barTime` is the EVALUATED closed bar time. The forming bar's open is therefore `barTime + PeriodSeconds`, which that half-open interval excludes. Because day marks align to M5 opens at 23:55, no mark can lie strictly inside the stated interval, so the formula fires exactly when `mark == barTime` - the same pass as the defective test at the day-close gate, booking the 00:00 open. Encoded literally, the correction reinstates the regression.

GLM's required restatement is adopted: with evaluated-bar `barTime`, the condition is `barTime + PeriodSeconds <= mark < barTime + 2*PeriodSeconds`, the verdict bar is named as the forming bar, and the price is booked from the existing local on that pass. The alternative - re-binding the interval explicitly to the forming bar's own open time and stating what remains of the existing test in the closed-bar host - is recorded as the second permitted form. Sonnet's form, which names the same source expression, is consistent.

This is the FOURTH consecutive instance of one class: a rule sentence written from a summary rather than from every term the source and the pin impose, following the one-sided touch, the missing open-side term, and the wrong prior-candle disposition. The eighteen-row census did not catch it because the trigger's terms were never enumerated the way the predicate's were. That is a gap in the census's SCOPE, not in its discipline, and the scope must extend to the trigger interval, the tick host and the writer tick.

## 5. Defect two: the page gives two mutually exclusive row sequences for the same registered case

Sonnet's Q3-1 and GLM's Q3 A1 found this, and Luna states it directly in her own text: June 11's short holder IS flip-killed, so under the repaired rule June 11 is the CONSUME route, and the v15 narrative that grades it as yield is stale and must be struck.

v15 does both things. The narrative and the first sentence of the branch section describe yield, then abort-identity mismatch, then drop - rows `SIDE1C_YIELD` and `UJDEFERDROP`. The mechanism decision and the acceptance route the flip-killed case as consume before yield, then a fresh seed - rows `UJDEFERCONSUME`, one stand-down, and the fresh-initialization rows. A consume resets the holder, so the yield cannot fire and the mismatch and drop never occur. The two sequences are mutually exclusive.

Required: one row set pinned per route. GLM's reading is adopted as the working disposition and is stated as such rather than as a conclusion: the flip-killed route emits the consume disposition rows plus the fresh-seed rows and neither yield nor drop row; the non-flip-killed family keeps the yield row plus its own designed-path rows; and the "takes yield" wording is corrected to describe the analysis rather than the emitted rows. Sonnet's placement point is also adopted: the consume must sit at or before the seed-gated block, because consuming at the later apply site would skip the ordinary seed entirely.

## 6. Further Q1 conditions

- The tick host's stated reason is wrong. The closed-bar host's new-bar guard passes exactly on the first tick of the verdict bar, so timing alone does not require a tick host; the real case is latency against the pool refresh and working-set load that run first. The division of labour between the two hosts must be stated, and a check inserted ahead of the new-bar guard runs on every tick and therefore needs its own opening-tick detection.
- An equality-only day-close can silently miss and hold overnight, which is the regression itself. A visible late day-close catch-up with its own reference is required, named in the fail-soft sentence.
- The gapped-POC revision source has no spliced pin and no writer. Either the pin text is spliced and the writer named, or the source is dropped from the fold. It is not carried on my say-so.
- The closed-session helper is hard-wired to the entry session at four sites, so whether a later session's close may revise an open trade is unstated. The parameter change or an explicit refusal is required.
- The registration counter dispositions are promised and absent: the sequence and admission counters consumed at the snapshot leave a consumed sequence and an admission row with no instance on a failed entry.
- The already-passed case is graded settled when it is not: at the opening tick a closed-session extreme is often inside the stops level, the modify is refused, and the position can stop out after the model reported a target touch. That class must grade FAIL.
- Table row ten conflates lifecycle validity with acceptance, and the pending-revision readback-confirmation case is undefined.
- The close-pending latch is under-specified: retries must persist on the latched verdict, not a recomputed one, and the retry reference price must be pinned.
- The migration list must include the flag's producers, and the re-pinned writer's walk must include the evaluated in-session bar or the session extreme can miss the final bar - which the exact regression values police.

## 7. Further Q3 conditions

- The corrected rule text drops the term the census retains: in the general form the retained prior-candle arm has no corresponding term in the rule bullets, so a bullish retest bar in that form would confirm. The term must be restored.
- The open-side equality is typed differently from the convention it cites: the detector uses a float guard at the thousandth of a point, and the registered case is exact equality, so a last-bit difference between a buffer double and a bar open would refuse the settled trade. The guard must be stated for the open side, the touch containment and the hold, and must be described as a float guard and not a margin.
- The break arm is undefined and its conjunction with the open-side term is ill-formed, because a body closing through from the far side contradicts the open-side term. The open-side term attaches to the touch arm, or the break arm gets its own retest-bar definition from the pin text; either way it is new logic and needs its own diff class.
- The same-bar removal of the prior-candle arm is attributed to the wrong pin. The supportable reason is the recorded amended-point sentence that the bar before the retest never judges, not the sentence about whether the retest bar confirms. The resulting journal diff is named: every same-bar setup whose prior bar did not close against direction flips from refused to confirmed, and each must map to a register row.
- The tie in the flip-kill pin is used in two senses, and the page must state which the mechanism relies on, because the challenger reading reverses current order for exactly this class.
- Only two of eight live call sites were classified; the holder carve, the displace probes, the carry, the prebind and the S4-to-S5 sites are live gates and each needs a diff class.
- The prebind path for the non-flip-killed family is adopted with no state map, so it cannot be graded.
- The eviction writer census is not exhibited in full, and the guard terms plus the counter family need explicit dispositions including the deferred readers and the save and restore wrappers.

## 8. Operator-rule triage - still zero questions

No seat asks the operator anything. Both source-checking seats treat the two decisive discrepancies as builder-text amendments and route the remaining items - the eligibility census and the gapped-POC pin citation - to builder and council. The mechanism choice between candidates is a design decision inside builder authority and touches no pin. June 11 chart values remain the single operator-side evidence gap and block nothing. June 11 setup validity remains settled and unasked.

## 9. Close and authority

Q1 AMEND. Q3 AMEND. Q2 closed. No implementation authority is granted or inferred: no EA source edit, build, test, tester run, key, live action, commit or push. The RECON78 one-run authorization remains consumed. SRJ stays alert-only and the dirty working tree is preserved. June 11 validity remains settled; the June 5 target-touch regression, the RECON57 day-close model-versus-broker close, the day-close price reference and the day-mark pilot window remain four separate open items, none closed here.

The next artifact is packet v16. It must extend the census scope to the trigger interval, the tick host and the writer tick; restate the interval against the evaluated-bar variable with the forming-bar naming; pin one row set per route and strike the stale yield narrative; restore the general-form term; state the float guard as a guard and not a margin; attach the open-side term to the touch arm and pin the break arm's own retest definition; place the consume at or before the seed-gated block and state what the holder's stage-two values would otherwise carry; classify all eight live sites; splice the gapped-POC pin or drop the source; exhibit the F11 block head and the deferred counter readers; and name the float-guard and equality constants from source rather than from the seats' prose.