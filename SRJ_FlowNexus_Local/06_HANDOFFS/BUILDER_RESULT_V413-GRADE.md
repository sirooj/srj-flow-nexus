# BUILDER RESULT - V413 ROUND GRADED: Q1 AMEND AND Q3 AMEND, AND THE FOLD'S OWN DELIVERY RECORD IS FALSE

Round: relay `BUILDER_RELAY_COUNCIL_v413-UJ-EXEC-32.md` carrying packet `PACKET_P-RECON78-UJ-EXEC-1v24.md`. Three seats returned complete replies, filed whole under round token `V413-UJ-EXEC-33`.

Every figure below is copied from this turn's own unfiltered measurement of the file it names.

## 1. Intake, measured after the last write to each file

| Artifact | Bytes | LF lines | OPEN | END | SHA-256 |
| --- | --- | --- | --- | --- | --- |
| `06_HANDOFFS\BUILDER_VERDICTS_LUNA.md` | 1311813 | 18737 | 18708 | 18737 | `0AE1E834DCE7D350BF09FEF79AF89AE135A0CA0257F45116879DA2A882B10A73` |
| `06_HANDOFFS\BUILDER_VERDICTS_SONNET.md` | 1039685 | 9308 | 9173 | 9308 | `0571D9446B028E27F7394D2E17526C725F48BEC782B0B08E87E2998EF913B707` |
| `06_HANDOFFS\BUILDER_VERDICTS_GLM.md` | 2157187 | 11751 | 11677 | 11751 | `6914C56071B19469FAA535BB4EB2EE9A4615CB911085ADFD8610DD4E5ABD1EF5` |

Round token `V413-UJ-EXEC-33` occurs **2** times in each of the three and **0** times in the other seven verdict files. Each filed seat text was extracted back from between its own markers and is byte-identical to its staged intake: Luna 3272 B `A0A560E89072EB300EC3ACFD2448302A824ED9566EFFD68356745A9161BFE6B9`, Sonnet 14305 B `FFD29CC54C4B7F7E3610044C595EF89804776616FEFEAC9F19CE1A5CE2539A51`, GLM 15367 B `5513EE37E90A1E3B55FFB943E21326ECCF5B32B47190F45B2F031D45B5932389`.

**Prior-round integrity after this filing:** `V409-UJ-EXEC-26`, `V410-UJ-EXEC-28` and `V412-UJ-EXEC-31` are each still 2 hits in all three files, zero failures.

## 2. Tally, region-scoped from filed bytes

**Q1** - Luna line 18709 `Q1: CONFIRM`; Sonnet's verdict in region, DISCREPANCY=2; GLM's Q1 verdict, DISCREPANCY counted at 3 across the region. One CONFIRM, two DISCREPANCY, zero OBJECT. **Q1 = AMEND.**

**Q3** - Luna line 18720 `Q3: CONFIRM`; Sonnet and GLM both DISCREPANCY. One CONFIRM, two DISCREPANCY, zero OBJECT. **Q3 = AMEND.**

**Q2** stays closed; no seat reopens it. No OBJECT and no NO from any seat.

Under section 47 TIE-FIXED, confirmation needs two YES or better, so one CONFIRM cannot carry either question. Both AMEND.

**This is the first round in which any seat confirmed anything, and it does not change the grade.** Luna's CONFIRM is the outlier on both questions. She graded the RULE, which is correct and which she confirms is single-sourced; she had no way to know that the fold's delivery record describing HOW the rule was installed is false. Both source-checking seats graded the page and found the record untrue.

## 3. The finding that matters: the v24 fold's delivery record is false

Sonnet and GLM independently found the same thing, and it is the most serious defect of this thread.

**Packet v24's Section 20 asserts edits "in cell" that were never made.** Named claims, checked by both seats against the P-block:

| Section 20 claim | Actual state on the saved page | Seat |
| --- | --- | --- |
| 20.6 "Both cells are annotated" (15.1 and 15.4.1) | 15.4.1 is annotated; **15.1 is not** - it still names two dynamic retargets | GLM Q1-2, Sonnet Q1-1 |
| 20.7 18.5 "is struck and replaced by a pointer to 19.1 and 19.2" | **not struck** - the operator question and "none may ship until he answers" stand live | GLM Q1-1, Sonnet Q1-4 |
| 20.2 "All are now struck or annotated in cell" (17.x) | **17.1's first bullet, 17.1's P7381, 17.2's heading and bullets 1, 2, 6 and 7 are unannotated** | GLM Q1-3, Q1-4; Sonnet Q1-2 |
| 20.7 17.4a's additions sentence annotated | **live and doubly stale** against FOUR ADDITIONS | GLM Q1-5, Sonnet Q1-2 |
| 20.2 and 15.7 "15.7 is added to the 19.2 table" | **the 19.2 table carries no 15.7 row** | GLM Q1-11, Sonnet Q1-2 |
| 20.7 the New York re-keying clause added | **absent from 15.4.7 and 15.5.7** | GLM Q1-8, Sonnet Q1-13 |
| 20.7 rows 8-10 corrections written in | **P7138-P7140 contain neither the bid/Ask note nor the execute scoping** | GLM Q1-9, Sonnet Q1-12 |
| 20.7 15.4.2's duplicated opening corrected | **the opening sentence is still doubled at P7125** | Sonnet Q1-6, GLM Q1-10 |
| 20.5 "The rule lives at 15.4.1 and nowhere else" | **15.4.1 carries the weak comparator**; the strong form and the VALID definition live only at 20.5 | GLM Q1-7, Sonnet Q1-7 |

**Root cause, and it is not carelessness.** The v24 fold's edit set contained sixteen anchors and every one was applied and verified. But Section 20 - which I authored as the fold's own summary - described roughly nine further edits that I never wrote into the edit set at all. The fold's prose asserted a delivery the edit log does not support.

This is exactly the class my own `srj-council` section 56 SAVED-TEXT-ASSURANCE gate exists to prevent: after the final packet write, reopen the SAVED packet and close every claimed disposition against the actual saved line. **I did not execute it.** I wrote the fold's summary of what it did and shipped it without reading the saved page back.

It is the third appearance of this class in four rounds - 17.4d in v410, 20.2 in v412, and now Section 20 - which is why it is banked as an executable gate this turn rather than noted.

**A second instance of the same failure inside the census.** Section 20.3's own cell still reads "The proof runs over the twelve touch points" and 18.3's claim that "the figure twelve is not used anywhere on this page" is false - twelve appears at P6958, P7215 and P7245. A verification sentence asserting a fact the page contradicts, which is the class I named one round ago as worse than no verification sentence.

## 4. Four changes to the contract, not the page

Sonnet raised these and they are adopted; three of them correct errors in my own Section 20.

1. **20.5's definition of "valid" names a filter that cannot apply to its object.** I wrote that the tier filter and `UjPoiTargetValid` apply to a revision target as at entry. `UjPoiTargetValid(k, anchor)` takes a POI line index (EX-35), and a closed-session extreme has no index. The filter that governs session levels at entry is `TpSessionLevelFiltered` and the swept mask, and 15.4.1 itself already says the swept mask does not apply to the own-bar walk. My definition is replaced.
2. **The touch carrier must not govern on the detection pass.** Revision detection runs before the touch local in the same pass. The evaluated bar's own extreme defined the revision, so for a LONG it sits at or above it and a touch is true by construction at equality. The carrier governs from the first bar AFTER the detection pass, and no model touch is booked on the detection pass from that bar's own extreme.
3. **`SYNC_FAILED` must be excluded in row 2 itself**, not only in the 16.6 overlay, with the interaction against the model-touch reference stated - otherwise a looser later revision is accepted while the model reference stays on a failed nearer one, which is a model/broker split.
4. **An eighth diff class is required.** Every baseline `UJDEFERAPPLY` ended in `GoAbort; return`, freeing the slot on the next pass; with the consume at EA 7454 the slot frees on the same pass and a fresh seed runs, including a same-direction retest of the killed holder's own line because `ABORT_LTF_MISALIGN` writes no eviction bit. Class 6 covers contender-confirm only, so without an eighth class "zero unexplained flips" will flag every such case.

Sonnet also shows the **restored-current-order alternative cannot reproduce the 14:40 entry**: on that path the yield leaves the zone and touch flags zeroed while the state stays `S4_ARMED`, the S4 re-read at EA 9138 needs `s35_zLo <= g_zoneLo + 0.5pt` which is false against a zero, `FindLegTouch` returns false on a zero zone, and 14:35 is bullish so the single-bar touch test cannot fire. Calling it a live alternative is therefore misleading, and 20.4's own alternative pointer at 18.6 is false because 18.6 names no alternative. The page will state it as the non-viable alternative for the registered case.

## 5. Condition crosswalk

Thirty-one numbered conditions were filed. They resolve to **fourteen distinct page-side items** plus the four contract changes above.

| # | Item | Seats | Disposition in v25 |
| --- | --- | --- | --- |
| 1 | 18.5's operator question and "none may ship until he answers", plus 18.0's heading | GLM 1, Sonnet 4 | ADOPTED - struck, pointer to 19.1/19.2 |
| 2 | 15.1's closing sentence naming two dynamic retargets | GLM 2, Sonnet 1 | ADOPTED - annotated |
| 3 | 17.1 first bullet and P7381; 17.2 heading and bullets 1, 2, 6, 7 | GLM 3, 4; Sonnet 2 | ADOPTED - each annotated as reversed by section 19 |
| 4 | 17.4a's THREE-ADDITIONS sentence | GLM 5, Sonnet 2 | ADOPTED - struck |
| 5 | 15.4.7 addition (1) inverse LATE polarity, and 16.3 quoting the inverse while claiming agreement | GLM 6, Sonnet 9 | ADOPTED - rewritten to 17.4a's and row 6's single polarity; 18.2 Q1-6's delivery claim corrected |
| 6 | the rule stated once, in the strong comparator, with VALID defined | GLM 7, Sonnet 7 | ADOPTED - housed at 15.4.1; 19.1 and 20.5 become pointers |
| 7 | the NY fixture re-keying clause | GLM 8, Sonnet 13 | ADOPTED - written into 15.4.7 |
| 8 | rows 8-10 and 14-16 binding notes, or retract the carry claims | GLM 9, Sonnet 12 | ADOPTED - content written into the rows |
| 9 | 15.4.2's duplicated opening | Sonnet 6, GLM 10 | ADOPTED - deleted |
| 10 | 19.2's missing 15.7 row, and the false "added to the table" claims | GLM 11 | ADOPTED - row added and the claims made true |
| 11 | 18.2 rows Q1-8, Q1-9, Q1-18 and Q3-4 stale against 19.5 and 20.3 | Sonnet 3 and Q3, GLM Q3-3 | ADOPTED - re-pointed |
| 12 | 15.5.7a(6)'s "twelve touch points", "all twelve sites", the unreconciled v22 tally, and the fused splice | GLM Q3-1, Q3-2, Sonnet Q3-1, Q3-2 | ADOPTED - all reconciled to the role table's bucketing |
| 13 | 15.6, EX-33 and 18.2's stale twelve-point forms | Sonnet Q3-1, GLM Q3-1 | ADOPTED |
| 14 | 18.6 and 19.6 still calling the placement open; 15.5.5's false pointer to 18.6 | GLM Q3-4, Q3-5, Sonnet Q1-9, Q3-7 | ADOPTED - annotated withdrawn, the alternative re-homed where 15.5.5 says it is |
| - | 15.5.5 versus 15.5.7a(4) on whether a pin is in question, and which reading of "flip-plus-confirm" the page uses | Sonnet Q3-6 | ADOPTED - stated once |

Luna's four conditions are future-run and implementation obligations, not page defects, and are recorded as carried with no wording change.

## 6. Defects owned by the builder

1. **A fold's own delivery record asserted edits that were never made** - nine named items. Root cause: the fold's summary was authored from the plan rather than closed against the saved page, which is the non-execution of SAVED-TEXT-ASSURANCE.
2. **A verification sentence asserting a page fact the page contradicts** - "the figure twelve is not used anywhere on this page", with twelve still at three places.
3. **A contract definition naming a filter undefined for its object** - `UjPoiTargetValid` on a closed-session extreme.
4. **An omitted eighth diff class** that will make "zero unexplained flips" flag a legitimate same-pass release.
5. **A false cross-reference** - 15.5.5 points at 18.6 for an alternative that 18.6 does not contain.
6. **A repeated friction stop**: the builder ended the previous turn with six builder-side items open and no operator item owed, which is the stop class the operator had already corrected once in the same session.

All six are mine. No strategy rule, no EA source, and no operator decision is in dispute; Luna confirms the rule itself is single-sourced and correct.

## 7. Disposition

**Q1 = AMEND. Q3 = AMEND. Q2 closed. No OBJECT, no NO.**

The four open defects stay separate and undischarged, and the DAY_CLOSE branch stays ungradeable on any June fixture because the day-mark pilot window is the fourth of them.

**Next artifact:** packet `PACKET_P-RECON78-UJ-EXEC-1v25.md` executing all fourteen items and all four contract changes, then its relay twin. Both are builder-side and owed now.
