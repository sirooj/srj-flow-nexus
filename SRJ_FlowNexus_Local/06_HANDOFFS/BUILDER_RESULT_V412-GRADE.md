# BUILDER RESULT - V412 ROUND GRADED: Q1 AMEND AND Q3 AMEND

Round: relay `BUILDER_RELAY_COUNCIL_v411-UJ-EXEC-30.md` carrying packet `PACKET_P-RECON78-UJ-EXEC-1v22.md`. Three seats returned complete replies, filed whole under round token `V412-UJ-EXEC-31`.

Every figure below is copied from this turn's own unfiltered measurement of the file it names.

## 1. Intake, measured after the last write to each file

| Artifact | Bytes | LF lines | OPEN | END | SHA-256 |
| --- | --- | --- | --- | --- | --- |
| `06_HANDOFFS\BUILDER_VERDICTS_LUNA.md` | 1308472 | 18707 | 18684 | 18707 | `DCBC88E4291BB2FB8212A92DADE1EA6F011E61CCC1B086C8877075AC5B73BCCD` |
| `06_HANDOFFS\BUILDER_VERDICTS_SONNET.md` | 1025307 | 9172 | 9098 | 9172 | `2D8020791C15720A82447047DCE4139843724113A5974E38984EC57935F95157` |
| `06_HANDOFFS\BUILDER_VERDICTS_GLM.md` | 2141753 | 11676 | 11615 | 11676 | `8043DA5391DF186551BBD2256D75C5DF298303C321899B63ACF33E61EDB45853` |

Round token `V412-UJ-EXEC-31` occurs **2** times in each of the three and **0** times in the other seven verdict files. Each filed seat text was extracted back from between its own markers and is byte-identical to its staged intake: Luna 4324 B `12B33349DB903033B437D37F0D42BBD939BBF41B54885B1561CEF7175288F3D0`, Sonnet 10923 B `A38CD01704EBBDD50BBE85457E29C61ABD8131543C4BA44243A603C38173BDD9`, GLM 17326 B `CBC31F34A7D9E6C7CC732110E0F395D72127B46244B33621929C7AAEED296C94`.

**Integrity check across rounds.** Each file was re-probed for its earlier blocks after this filing. V409-UJ-EXEC-26 and V410-UJ-EXEC-26/28 are each still 2 hits with intact markers, and the V410 seat texts still hash to `6DBA72733D0FD6E05B4D65A172CA3A7532C4F3247E8E28DB744E18ABBACBA3D9` (Luna), `98F8439A465FB95E49B5F7E9682B5E56CD070D201F15AF83FAABC330A153997C` (Sonnet) and `DF3A20D1BEF215A942D86D9E131BB6BEC1BF0CC4A1856CEEF941622C9AD61889` (GLM) - byte-identical to the V410 filing. One transient was recorded and cleared: a read taken immediately after the Luna write returned 1299733 B against the settled 1308472 B, an under-read rather than a loss, and the three-block integrity probe above is the proof that nothing was truncated.

## 2. Tally, region-scoped from filed bytes

Whole-file counts are inadmissible here, so every count is taken strictly inside each seat's `V412-UJ-EXEC-31` region.

**Q1** - Luna line 18685 `Q1: DISCREPANCY`; Sonnet's Answer A verdict at 9099 onward; GLM line 11618 `# Q1: DISCREPANCY`. Three DISCREPANCY, zero CONFIRM, zero OBJECT. **Q1 = AMEND.**

**Q3** - Luna line 18696 `Q3: DISCREPANCY`; Sonnet's Q3 verdict in region; GLM line 11653 `# Q3: DISCREPANCY`. Three DISCREPANCY, zero CONFIRM, zero OBJECT. **Q3 = AMEND.**

**Q2** stays closed. Luna and GLM each record spending nothing on it and Sonnet does not raise it.

No seat returned CONFIRM, OBJECT or NO. This is the most convergent round of the thread: three DISCREPANCY on both questions, and all three seats reach the same core diagnosis.

### Tie rule applied

`srj-council` section 47 TIE-FIXED: confirmation needs two YES or better; DISCREPANCY+DISCREPANCY amends; any OBJECT amends; any NO amends-with-halt; each question tallied separately. Both questions are three DISCREPANCY, so both AMEND. Nothing here authorises a build, a tester run, a key, a commit or a push.

## 3. What the seats agree on, and it is against me

**The core defect, found independently by all three: the v23 fold struck the gapped-POC branch at its head cells and never ran the disposition sweep on its own strike.** GLM's formulation is the one to keep - *a fold that strikes a branch must run the sweep on its own strike, and a verification sentence that prints false arithmetic is worse than no verification sentence.* GLM confirms the rule itself is single-sourced and correct and raises no question against it; Sonnet says the same on the substance while reporting live residue against it. The defect is the strike's completeness, not the rule.

**The census arithmetic is my error, and GLM's reconstruction of it is correct on disk.** Section 15.5.7a addition (6) now enumerates fourteen distinct sites - four declarations at EA 1939-1942, four clears at EA 1965, EA 1971, EA 8111 and EA 8116, two bit-set clears at EA 9323 and EA 9325, and four reads at EA 1961, EA 1967, EA 8112 and EA 8117. The prose total still reads "twelve touch points" and section 18.3 still prints "four plus four plus two plus four is twelve", which is false: the four enumerated categories sum to fourteen. The class tally "four declare, six clear, two set bits, four read" sums to sixteen, because EA 9323 and EA 9325 are counted once as clears and again as set bits. Origin, reconstructed by GLM and confirmed against my own edit set: v20's total of twelve was correct under the classification in force then, where EA 1961 and EA 1967 were clear guards and the blocking reads proper were EA 8112 and EA 8117 only, giving 4+4+2+2. My v22 edit re-added EA 1961 and EA 1967 as blocking reads and named four declarations instead of two, which raised the enumeration to fourteen, and I never updated the prose total. Luna, Sonnet and GLM each caught the same false sum independently.

**A second live self-contradiction, found by Sonnet:** 15.5.5 declares the consume placement "decided here" while 18.6 and 19.6 declare it the single open mechanism decision "deliberately not pre-empted". Both cannot stand, and Sonnet is right that the registered June 11 case is itself the tie, so the choice changes how that case grades.

**A substantive diff-window error, found by Sonnet and adopted:** 15.4.7 starts the TP diff at June 5 London 12:05, but under 15.3.5 the revision fires on the first tick of the 12:00 bar - the pass that evaluates the last in-session bar - and 19:00 New York. 12:05 is the baseline's retarget pass, so the first changed behaviour would fall outside the diff window.

**Labelling conflicts, found by Sonnet and adopted:** EA 1965 and EA 1971 are SIGNAL-consumption clears per EX-33's own comments, not day-change clears; only EA 8111 and EA 8116 are day-change clears. EA 1961 and EA 1967 are clear guards, not blocking reads - 16.6 and 17.4b already say so, so 15.5.7a(6) and 18.3 are the stale cells.

**Duplication, found by all three:** the numbered addition "(3) A row records WHICH host acted on the day-close tick..." is printed twice verbatim in 15.4.7, in the order (3), (4), (3), against a heading that reads FOUR ADDITIONS. GLM adds the reason it escaped: it is roughly 185 characters, under the 15.8 de-duplication gate's 200-character threshold.

## 4. Condition crosswalk, one row per distinct page-side item

Thirty-five numbered conditions were filed across the three seats. They resolve to **twenty distinct page-side items**; where seats overlap, each is credited. `v24` answers all twenty.

| # | Item | Seats and filed lines | Disposition in v24 |
| --- | --- | --- | --- |
| 1 | 15.7's Q1 summary line still reads "the gapped-POC predicate and its producer named ... both detectors listed" | Luna 1 (18706 region), Sonnet 4 (9109 region), GLM 1 (11627) | ADOPTED - struck in cell, 15.7 added to the strike table |
| 2 | 18.5's open-authority block stands live against 19.6's "Nothing" | Luna 2, Sonnet 6, GLM 7 | ADOPTED - struck, replaced by a pointer to 19.1/19.2 |
| 3 | 15.4.1's interior still carries four contrary sentences | Luna 3, Sonnet 1 and 2, GLM 3 and 4 | ADOPTED - four sentences struck in cell |
| 4 | 15.4.7's duplicated "(3) A row records WHICH host acted..." | Luna 4, Sonnet 10, GLM 8 | ADOPTED - second copy deleted |
| 5 | 15.5.7a(6) count-versus-list failure | Luna Q3 1, Sonnet Q3 1, GLM Q3 1 | ADOPTED - role table, fourteen sites, sixteen class-assignments |
| 6 | 18.3's false "four plus four plus two plus four is twelve" | Luna Q3 2, Sonnet Q3 1, GLM Q3 2 | ADOPTED - arithmetic corrected |
| 7 | 15.6's provenance sentence still says twelve touch points, two declarations | Luna Q3 3, Sonnet Q3 2, GLM Q3 3 | ADOPTED - corrected to the adopted basis |
| 8 | EA 1965/1971 mislabelled day-change clears; EA 1961/1967 mislabelled blocking reads | Sonnet Q3 2, GLM Q3 1 | ADOPTED - relabelled, one term used across 16.6, 17.4 and 15.5.7a |
| 9 | 15.5.5 "decided here" against 18.6/19.6 "not pre-empted" | Sonnet Q3 3 | ADOPTED - one resolution named, the other kept as the explicit alternative |
| 10 | Diff window starts at London 12:05 instead of the 12:00 firing pass | Sonnet 9 | ADOPTED - window moved, New York equivalent named |
| 11 | 15.4.2's last clause and its duplicated opening sentence | Sonnet 3 | ADOPTED |
| 12 | 15.1's closing and 15.4.1's bold clause resting on the pin's pre-correction parenthetical | Sonnet 1, GLM 5 | ADOPTED - annotated, and the pin correction recorded in the packet |
| 13 | 17.1 first bullet, the four 17.2 bullets and its heading, 17.4a's THREE-ADDITIONS sentence, 17.5's close | Sonnet 5, GLM 2 and 6 | ADOPTED - each annotated as reversed by section 19 |
| 14 | 19.0's "Sections 1-17 are untouched" and the 19.3/19.5 cross-reference | Sonnet 6, GLM 9 | ADOPTED |
| 15 | 19.2's "15.5.7a row S8" address does not exist | Sonnet 7 | ADOPTED - corrected |
| 16 | The revision rule stated in two homes; "valid" undefined for a revision target | Sonnet 8, GLM (single-sourcing noted) | ADOPTED - one home, three pointers, one-line definition of valid |
| 17 | New York branch fixture exists only if Q3 leaves the June 5 New York take set alone | Sonnet 11 | ADOPTED - re-keying clause added, no silent regrade |
| 18 | 16.6/17.4b claim three corrections live in rows 8-10 that those cells do not carry | Sonnet 12 | ADOPTED - content added to the cells |
| 19 | 15.5.7's "the two added classes" beside a seven-class list | Sonnet Q3 4 | ADOPTED - classes 5 and 6 named |
| 20 | 15.4.7's "reported in two cases" missing "where gradeable" against 17.4a's claim | GLM 8 | ADOPTED - restored |

GLM's suggestion that the de-duplication check be threshold-free for numbered additions is adopted as a workflow change, not a page change, and is recorded in the skills with the other gates.

## 5. Defects owned by the builder this round

1. **Strike without sweep.** The v23 fold reversed a branch and left live sentences naming it in nine unlisted places, including the cell a reviewer reads first. Class: the disposition-sweep class the packet itself defines at 16.1, non-executed on the fold's own strike.
2. **A verification sentence printing false arithmetic.** "four plus four plus two plus four is twelve" shipped in two cells and passed my own battery because no gate re-adds an enumeration against its stated total. Class: the count-versus-enumeration family, and the sharper form GLM named - a false verification sentence is worse than none.
3. **A duplication that a threshold let through.** A numbered addition printed twice at 185 characters under a 200-character de-duplication threshold.
4. **A stale cross-reference across two sections.** 19.0 pointed at 19.3 for dispositions that 19.5 holds.
5. **A diff window that excludes the first changed behaviour.**

All five are page-side and all five are mine. No strategy rule, no EA source, and no operator decision is in dispute: the revision rule itself is confirmed single-sourced by GLM and unchallenged by all three.

## 6. Disposition

**Q1 = AMEND. Q3 = AMEND. Q2 closed. No CONFIRM, no OBJECT, no NO.**

All twenty items are page-consistency except two: the diff-window start, which is a substantive acceptance error, and the 15.5.5/18.6 placement contradiction, which decides how the registered June 11 case grades. Neither needs an operator decision - the first is corrected against 15.3.5 as written, and the second is builder authority inside the two paths both seats accept.

The four open defects stay separate and undischarged, and the DAY_CLOSE branch stays ungradeable on any June fixture because the day-mark pilot window is the fourth of them.

**Next artifact:** packet `PACKET_P-RECON78-UJ-EXEC-1v24.md` answering all twenty items, then its relay twin. Both are builder-side and owed now.
