# BUILDER RESULT - V410 ROUND GRADED: Q1 AMEND AND Q3 AMEND

Round: relay `BUILDER_RELAY_COUNCIL_v410-UJ-EXEC-27.md` carrying packet `PACKET_P-RECON78-UJ-EXEC-1v21.md`.
Replies filed whole under round token `V410-UJ-EXEC-28`. Three seats returned: Luna, Sonnet, GLM.
No OBJECT and no NO from any seat. Q2 stays closed and was not reopened by any seat.

Every figure below is copied from this turn's own unfiltered measurement of the file it names.

## 1. Intake (measured this turn, after the last write to each file)

| Artifact | Bytes | Physical lines | OPEN line | END line | SHA-256 |
| --- | --- | --- | --- | --- | --- |
| `SRJ_FlowNexus_Local\06_HANDOFFS\BUILDER_VERDICTS_LUNA.md` | 1304079 | 18683 | 18573 | 18683 | `1D418E0B739EE1A3779805ED20DE8714D2C6685918BC199E53526AF54D1D2E98` |
| `SRJ_FlowNexus_Local\06_HANDOFFS\BUILDER_VERDICTS_SONNET.md` | 1014311 | 9097 | 9031 | 9097 | `6D6AA44067DC783838493546F03DCA0815ECCC146C2AFE4645A8046D9C08A17C` |
| `SRJ_FlowNexus_Local\06_HANDOFFS\BUILDER_VERDICTS_GLM.md` | 2124360 | 11614 | 11546 | 11614 | `369033F5D8D6B9257E9E5EBFE1AA7332B4A77E563F0868C54E2F010C1084EE47` |

Marker census over all ten verdict files: the round token `V410-UJ-EXEC-28` occurs **2** times in each of Luna, Sonnet and GLM and **0** times in the other seven (ASTRA, DEEPSEEK, KIMI, OPUS, QWEN, SLDEF4-5, SOL). Each seat's OPEN and END marker occurs exactly once in its own file.

Fidelity: each seat's filed text was extracted back out of its file between its own OPEN and END lines and compared byte-for-byte against the staged intake. All three are byte-identical.

| Seat | Filed seat-text bytes | SHA-256 of the filed seat text | Byte-equal to staged |
| --- | --- | --- | --- |
| Luna | 9367 | `6DBA72733D0FD6E05B4D65A172CA3A7532C4F3247E8E28DB744E18ABBACBA3D9` | yes |
| Sonnet | 6530 | `98F8439A465FB95E49B5F7E9682B5E56CD070D201F15AF83FAABC330A153997C` | yes |
| GLM | 12856 | `DF3A20D1BEF215A942D86D9E131BB6BEC1BF0CC4A1856CEEF941622C9AD61889` | yes |

Line-count convention as used by every seat below: **physical lines, title is line 1**.

## 2. Tally, region-scoped, derived from filed bytes only

Whole-file word counts are inadmissible here (the same strings occur in earlier rounds), so every count below is taken strictly inside each seat's `V410-UJ-EXEC-28` OPEN..END region and every verdict is quoted from its filed line.

**Q1 - closed-session target revisions and the day-close leg**

| Seat | Filed verdict line | Verdict |
| --- | --- | --- |
| Luna | line 18590 `**DISCREPANCY.**` (heading line 18586 `## Q1 - DISCREPANCY`, conclusion line 18621, disposition table line 18676) | DISCREPANCY |
| Sonnet | line 9036 `**Verdict: DISCREPANCY**` (closed line 9058 `**Q1 closed:** DISCREPANCY.`) | DISCREPANCY |
| GLM | line 11555 `**Verdict: DISCREPANCY.** Under SS47 TIE-FIXED ...` (closed line 11582) | DISCREPANCY |

**Q1 = three DISCREPANCY, zero CONFIRM, zero OBJECT => AMEND.**

**Q3 - the June 11 LONG through same-pass admission**

| Seat | Filed verdict line | Verdict |
| --- | --- | --- |
| Luna | line 18629 `**CONFIRM.**` (heading line 18625 `## Q3 - CONFIRM`, conclusion line 18666 `**Q3 = CONFIRM.**`, disposition table line 18677) | CONFIRM |
| Sonnet | line 9062 `**Verdict: DISCREPANCY**` (closed line 9094 `**Q3 closed:** DISCREPANCY.`) | DISCREPANCY |
| GLM | line 11588 `**Verdict: DISCREPANCY (narrow - one false delivery claim; the substance is confirmed).**` (closed line 11607) | DISCREPANCY |

**Q3 = one CONFIRM plus two DISCREPANCY => AMEND.**

**Q2** stays closed. Luna records it at filed line 18678 (`**STAYS CLOSED / NOT REOPENED**`), Sonnet at line 9096, GLM at line 11549 and line 11613.

### Tie rule applied, and why Q3 is not CONDITIONAL

`srj-council` section 47 TIE-FIXED is the governing table: YES+YES confirm; YES+DISCREPANCY conditional; DISCREPANCY+DISCREPANCY amend; any OBJECT amend; any NO amend-with-halt; each question tallied and graded separately.

- Q1 is three DISCREPANCY. AMEND.
- Q3 is one CONFIRM and two DISCREPANCY. Confirmation requires two YES or better, so a single YES cannot carry it. AMEND.
- The V409 precedent is the same rule read the other way: V409 graded Q3 CONDITIONAL CONFIRM on **two** CONFIRMs (Luna and GLM) against one DISCREPANCY. V410 has **one** CONFIRM against two DISCREPANCY, which is the mirror image and lands on AMEND.
- This is a **regression against V409 on Q3**, and it is worth naming plainly: v21 improved the gapped-POC reversal but introduced a false delivery claim in 17.4d, which is the class the DISPOSITION SWEEP exists to catch. Two seats independently caught it.

No seat returned OBJECT. No seat returned NO. No build, run, key, commit or push authority follows from this grade.

## 3. Seat claims adjudicated against packet v21 bytes

Both source-checking seats confined their objections to page text; every checkable claim was re-derived this turn against `PACKET_P-RECON78-UJ-EXEC-1v21.md` (`8E8510A52012FF81D51DB7C6161D178DBC396A94D31423AFB7B55B6B9980B335`, 599784 B, 7435 lines). Thirty-two claim probes ran; **29 matched expectation and 3 returned a different count, each of which refines rather than overturns its seat's claim.** P-line numbers below are packet physical lines.

### Q1 claims - all confirmed on disk except one characterization

| # | Claim (seat) | Probe | Result |
| --- | --- | --- | --- |
| 1 | Restored predicate is still vacuous (Sonnet Q1-1, GLM D1) | P7394 reads `at or ABOVE the current bar's HIGH` and `open at or BELOW` | **CONFIRMED.** Full line: "for a LONG the POC line lies at or ABOVE the current bar's HIGH with that bar's open at or BELOW it, and for a SHORT the mirror." Since open <= high always, the open clause is implied and the conjunction reduces to *line beyond the evaluated bar's extreme*. Nothing tests a gap-through. |
| 2 | Anchor-tier admission and validity unspecified (Sonnet Q1-2) | P7379 | **CONFIRMED.** The restored cell names the six POC lines and no tier filter; the existing scan's filter (EA 11671-11672) and `UjPoiTargetValid` (EA 11673) are never mentioned. |
| 3 | Detector shift not named, value not frozen (Sonnet Q1-3) | P7173 S8 row vs P7158 | **CONFIRMED IN PART.** P7173 does say the anchor "is an INDEX whose price is read per shift ... the detector reads it at its own shift (EA 2098)" - that is the **anchor** line, not the POC line the revision target uses. The POC-line read used as the exact revision price is still unnamed and unfrozen. |
| 4 | Branch gradeable with no fixture (Sonnet Q1-4) | P7158 contains `session POC value read` | **CONFIRMED.** Addition (2) still reads that phrase; only 17.2 re-points it in the overlay. |
| 5 | P7150 contradicts 17.4b on EA 12227 (Sonnet Q1-5) | P7150 hits `EA 12227` twice | **CONFIRMED.** P7150: "Releasing the sequence on a pre-fill abort changes what EA 10700 and EA 12227 print, so both are named as affected rows." P7333 says the opposite: EA 12227 "is unaffected by the sequence release". 17.4b does not name P7150's cell. |
| 6 | 16.3 left live with the inverted LATE polarity (Sonnet Q1-6) | P7278 full text; P7158 `required as its own case` | **SPLIT.** The inversion is at **P7158**, confirmed: addition (1) still reads "A LATE day-close fixture is required as its own case, so the catch-up path is exercised rather than described", against 17.4a's "NOT GRADED unless a pass-skipping fault can be named without source hooks". The seat's characterization of **16.3 itself is refuted**: P7278 states the *corrected* polarity and says the section and row 6 "now match". 16.3 is an unstruck overlay cell, not an inverted one. |
| 7 | Declared-loss retarget row claimed but absent (Sonnet Q1-7, GLM D4) | P7158 `declared-loss` 0, `declared loss` 0 | **CONFIRMED.** The requirement lives only at 15.3.5 (P7119). |
| D2 | Reversal swept 16.2's strikes but not the v19 body (GLM D2) | P7123 and P7125 | **CONFIRMED.** P7123 still defines the object as "the POC of an eligible closed session" and still closes "What remains in scope and printable is the closed-session branch alone". P7125 still carries "declared UNSOURCED and NOT GRADED" and "no revision record is promised". |
| D3 | 17.4c's head-note claim is not on the page (GLM D3) | P7429 claim vs P0001/P0003/P0005 | **CONFIRMED.** P0001 reads "v19", P0003 reads "v19 DRAFT", P0005 reads "Section 15 is the controlling v19 scope". Crosswalk row 8 (P7411) additionally misquotes P0003 as "v20 DRAFT". |
| - | Model-touch carrier field unnamed (GLM, carried list) | P7202 | **CARRIED, page-side.** 15.4.2 writes the booked target only on confirmed sync while 17.4b defines the model-touch reference as "nearest of all revisions regardless of sync state"; the carrier field and its migration are unnamed. |

### Q3 claims - all confirmed on disk

| # | Claim (seat) | Probe | Result |
| --- | --- | --- | --- |
| 1 | 17.3 does not hold "no pin reading changes" (Sonnet Q3-1) | P2124 vs P7398 | **CONFIRMED.** Pin 117 records the flip-plus-confirm same-bar tie as "stays unexercised and keeps current order"; the operator's June 11 fact (P7398) makes the registered case that tie. 15.5.7a(4) still marks it NOT GRADED "if the run does not exercise it". |
| 2 | Overlay residues not folded in place (Sonnet Q3-2, GLM D5) | P7162, P7206, P7213 | **CONFIRMED, all three.** P7162 still reads "The eighteen predicate rows"; P7206 still reads "left the state IDLE"; P7213 still reads "SIX named classes". 17.4d (P7431) claims "the corrected values printed in place" and **prints none** - its full text names the three cells and stops. |
| 3 | Eviction census not re-tested (Sonnet Q3-3) | P7215 | **CONFIRMED.** P7215 still reads "only EA 9323 and EA 9325 set bits, four clear, two declare, and four read"; `1942` occurs 0 times on that line, so the fourth declaration at EA 1939-1942 is not named. 17.4b counts six clears. |
| 4 | Surv/Inv reader list omits EA 8240 (Sonnet Q3-4, GLM) | P7202 `8240` 1 hit; P5684 | **CONFIRMED.** The single hit in P7202 is inside the **equality**-counter reader list ("read at EA 11329, EA 8240, ..."). The code at EA 8240 (P5684) reads all six counters including `g_n1_vwapInv` and `g_n1_pocInv`, so it belongs on the Surv/Inv reader list too and is absent from it. |
| 5 | Registered-case bar roles ambiguous (Sonnet Q3-5) | P7398 vs P2104 | **CONFIRMED as a page gap.** P7398 puts retest, confirmation and flip on the 14:35 bar; pin 86 (P2104) judges the retest at 14:30 against 14:35's open; the acceptance does not record which bar the retest-bar term was evaluated on. |

### The load-bearing cell behind condition 2, verified on disk

GLM is right that the IDLE residue is not cosmetic. The consume **enters** IDLE at the set site: `EA 7454` sets `uj_saAbort` (P7097), and the clear path runs through `GoAbort` to `ResetSequence()` at `EA 6633` (P5572), which is why the `g_state > ST_IDLE` gate at EA 7814 then fails. The stale cell at P7206 implies the opposite mechanism, so an implementation packet reading it would build the wrong path.

### One seat sentence refuted by disk, recorded and not netted

Luna's Q3 CONFIRM rests partly on the sentence (filed line 18651) that the three overlay residues are "folded back into their own controlling cells rather than left as silent contradictions". **Disk refutes it:** all three residues are still live at their own cells (P7162, P7206, P7213). Per the source-wins rule the packet bytes govern and this sentence is recorded as refuted in the grade, in the fold and in the ledger. **Luna's verdict is not altered and the tally is unaffected** - her Q3 CONFIRM is counted as filed, and Q3 is AMEND on the other two seats regardless.

## 4. The one item that is the operator's to answer, not the page's

Both Sonnet Q1-1 and GLM D1 land on the same predicate question, and the failed-source trail was run before it was treated as anything but a page defect:

1. Operator ruling `BUILDER_DECISION_GAPPEDPOC-PIN117_2026-10-03.md` - his verbatim is "POC = point of control from the anchored volume profile, B." plus "it's all of them 6." plus the session-H/L sentence. He defined **which** lines. He did not define the gap geometry.
2. The same memo's line 9 states the geometry "stands" and line 15(c) says to "re-derive the detector's predicate". The fold re-derived it and reproduced the identical form, so the memo's own tension was never resolved.
3. `srj-strategy` was searched: no pin defines "gapped". The nearest are RETARGET (a closed-session high/low becomes the nearest valid target), OWN-SOURCE-EXCLUSION and POC-SUPREMACY, none of which is about a gap.
4. Packet 15.4.1 (P7123) already recorded the vacuity finding and it was never withdrawn.

So the geometry is **unpinned**, and `srj-council` GATE-NEEDS-PIN forbids shipping a predicate with no quotable pin. **No new predicate is written in v22.** The existing form is left byte-unchanged, the stale "not a gap test either" finding is re-framed as an open authority question instead of a live contradiction, and the question is batched for him in plain words. This is the same class the pointer already records for pin 117, where he declined the code-technical reading.

## 5. Disposition

**Q1 = AMEND. Q3 = AMEND. Q2 closed. No OBJECT, no NO.**

Both questions are page-side and narrow; none of them needs a source edit, and nothing here authorizes a build, a tester run, a key, a commit or a push. RECON78's one-run authorization stays consumed. SRJ stays alert-only and the dirty working tree is preserved.

The four open defects stay separate and unresolved by this fold, exactly as the pointer records them: June 5 target-touch management retirement; RECON57 day-close model-versus-broker close; day-close price reference; day-mark pilot window. Luna and GLM both decline to hold them against the page, and the day-mark pilot window keeps the DAY_CLOSE branch ungradeable on the June fixtures - so Q1 cannot close as a build contract while they stand, which is the seats' agreed position and not a page defect.

**Next artifact:** packet `PACKET_P-RECON78-UJ-EXEC-1v22.md` answering every condition in section 3, then its relay twin. Both are builder-side and owed now.

## 6. Figures this grade pins, all measured this turn

| Artifact | Bytes | LF lines | SHA-256 |
| --- | --- | --- | --- |
| `Experts\SRJ_FlowNexus_EA.mq5` (untouched all turn) | 685026 | 12297 | `E80FF0C24149AB0946EB6A4341C0503A79BFE82E9843867CEF0DBA89BF587BBC` |
| `Experts\SRJ_FlowNexus_EA.ex5` (untouched all turn) | 452284 | 1766 | `DDA3257042354F0BCCB816FB52E7B78E3E47F323F54A29DD54DC0441F5E1B705` |
| `01_TASKS\PACKET_P-RECON78-UJ-EXEC-1v21.md` (the graded page) | 599784 | 7435 | `8E8510A52012FF81D51DB7C6161D178DBC396A94D31423AFB7B55B6B9980B335` |
| `06_HANDOFFS\BUILDER_RELAY_COUNCIL_v410-UJ-EXEC-27.md` (the graded relay) | 657127 | 7472 | `8AC59AB0BD202A0DB44A034677C0ED4C44CBD3089C3B5C804B6CABC322B99A90` |
| `06_HANDOFFS\BUILDER_TRANSPORT_MEMO_COUNCIL_v410-UJ-EXEC-27.md` | 3444 | 17 | `DFBAE303D1FC71D4B1C064A21BEDAEFF3BE2CA0F92C42763A30656655B761FAC` |
| `06_HANDOFFS\SRJ_FLOW_NEXUS_LEDGER.md` (after item 1148) | 1063544 | 6842 | `F05F76C4D2F9CC9851F89745844FE11DE6C89FA9FBAC81C49A67467F7C82C0F6` |
| `.opencode\skills\srj-council\SKILL.md` (section 57 added) | 138015 | 515 | `E8C959630BAA068A249DB6500841A63E0F91764144AC2EF746D43D542F82C0F0` |
| `.opencode\skills\srj-defect\SKILL.md` (two clauses added) | 44185 | 95 | `ADA896DE4EB781DE3A02C1F2E540FBE91C3701D5C8CFC2BE4BCFD5472115EEB4` |
