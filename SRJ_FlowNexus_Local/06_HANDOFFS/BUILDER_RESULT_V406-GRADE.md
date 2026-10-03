# V406 council grade - packet P-RECON78-UJ-EXEC-1 v17

Date: 2026-10-03. Lane: SRJ Flow Nexus. Graded from filed bytes. No EA source was edited, no build, test, tester run, key, live action, commit, or push.

Relay `BUILDER_RELAY_COUNCIL_v406-UJ-EXEC-19.md`: SHA-256 `AB3E7DD9F65145D64F8A50E2A0A68D8A06033AF5D85607FC7227B6279EF5F86C` (610152 bytes / 7207 LF lines; measured this turn).
Packet `PACKET_P-RECON78-UJ-EXEC-1v17.md`: SHA-256 `2D34A40633D3338F93A0C19AFC5D2A0B15195FCFD1C3DF36AEF6D04D0BC02509` (552204 bytes / 7166 LF lines; measured this turn).

## 1. Intake - three complete replies, one round

Novelty was proved before staging on two differently-formed probe sets across all ten verdict files: eight distinctive-prose probes, two per seat plus two more, returned zero hits everywhere, and the round token `V406-UJ-EXEC-20` returned zero hits in all ten. Two bare-token probes returned non-zero and were discarded as unfit probe choices rather than filed as findings: `EA 8137` (1 hit) and `g_n1_tpRecomputeSupp` (36 hits) are recurring source references in older filed text. Staged elements were counted before use; one probe expected `**Verdict: CONFIRM.**` exactly once and measured 2x, which is correct - Luna states that verdict once under each question - and was re-read as a count-of-two rather than treated as a staging fault.

| Seat | Intake SHA-256 (measured; staged input, not a filed artifact) | Bytes | Verdict file | OPEN / END line (measured after filing) | Filed file SHA-256 (measured) | Filed bytes / LF lines |
| --- | --- | --- | --- | --- | --- | --- |
| Luna | `12C3D3961D3F2DED8817C6B4168EBBE6171E9507B87E8F2DDE57BB7067F06246` | 7150 | `BUILDER_VERDICTS_LUNA.md` | 18209 / 18307 | `A85803F602FF5EFC502768DD947C779F0E5FAEDEEE99B09EA6D8BD195173BE4C` | 1271388 / 18307 |
| Sonnet | `B569FBEA8E29A9480D490C5D89825B9E72B6E6F2A0F514AC9E60B4E64B0E6929` | 12154 | `BUILDER_VERDICTS_SONNET.md` | 8554 / 8701 | `D3010C677A4C26B4D9A9B807F2FE176D835DDD9FE7FD82A54FA65FC4B2177F92` | 980939 / 8701 |
| GLM | `903AE9DDC7B268D88A3D459866C056822B92C2A3AE38B51EB1DA50F6BFAA199B` | 18512 | `BUILDER_VERDICTS_GLM.md` | 11209 / 11300 | `D1C707AC069B975A0241085A38FB52F4699F0A05F7BC19CD24752896EBBA72A9` | 2064858 / 11300 |

Filing proof: pre-write gate on each measured pre-state digest, asserted byte deltas 7220, 12228 and 18580, markers OPEN=1 END=1 in each seat's own file, the round token exactly twice per file, and zero occurrences of the round token in the other seven verdict files. Each filed block was extracted back out of the saved file and compared byte-for-byte against its staged intake: identical for all three seats.

## 2. Tally - each question graded on its own

| Question | Luna | Sonnet | GLM | Grade |
| --- | --- | --- | --- | --- |
| Q1 - closed-session target revisions and the day-close leg | CONFIRM | DISCREPANCY | DISCREPANCY | **AMEND** |
| Q3 - the June 11 LONG through ordinary same-pass admission | CONFIRM | DISCREPANCY | DISCREPANCY | **AMEND** |

Q2 stays closed and is re-asked by no seat. No OBJECT and no NO anywhere. Both questions carry a DISCREPANCY pair, so both grade AMEND under the section 47 tie-fix. **This is the third consecutive AMEND on both questions, and the seat-level movement is real this time: Luna moved CONFIRM on both.** Sonnet's own summary of what would close both questions is that one more fold fixing the page text and splicing EA 6939 would do it, and GLM grades its own items "enumeration and citation fixes" that are "cheap to close". The distance between here and CONFIRM is now page consistency, not design.

Luna's confirms are not unconditional and her Answer B is deliberately a design-versus-acceptance distinction: she closes both questions "at the design-review level" while stating their acceptance predicates remain future-run obligations. Her remaining conditions are acceptance-run obligations and the four preserved open defects, not page defects.

## 3. The operator's standing instruction, and what this round proves about it

The operator's order for this round was explicit: do not repeat the same defects, so the project goal arrives faster. Measured against that order, this round is a **partial repeat and the repeat is structural, not accidental**. Of the twenty-one distinct conditions below, at least nine are instances of classes this workflow already gates:

- **Summary cell contradicting the controlling text.** Sonnet Q1-1: the T2 census cell still said the earlier check "only advances the latch" after 15.3.3 had been rewritten to make it a full evaluation. That is the same class as the v16 Status line I caught while building v17, and I recorded that catch last turn as closed by a head-and-body sweep. The sweep was real but it was a **version-and-label sweep**, and a census cell is not a version label - so the gate as written could not see it.
- **Promise on the page with no home in the acceptance.** GLM Q3-D1: 15.5.3 promises each mirror's class flips are "named in the acceptance as mirror rows" and the acceptance contains no mirror-row term; the contender-confirm change is named "as its own DIFF CLASS" and the acceptance's named-classes list does not contain it. The acceptance-is-load-bearing gate I banked last turn checks that the acceptance **exists**, not that every promise **on the page resolves inside it**.
- **Promise on the page with no home in the acceptance, second shape.** GLM Q1-D2: the gapped-POC detector is a named revision-record source and 15.4.7 has no row set for it.
- **Enumerated list whose labels are not true.** Sonnet Q3-5 and GLM Q3-D2, D3: the surv/inv list calls EA 2121, EA 2143 and EA 11968 readers when all three are `+=` writes of counters in different families from the ones being removed; the evict list calls twelve lines "writes" when EA 1961, EA 1967, EA 8112 and EA 8117 are reads.
- **Census resting on unspliced evidence.** Sonnet Q3-7 and GLM: the F11 state-coverage census cites EA 6939, which EX-31 itself says is not spliced.
- **Reachability claim not checked against the gate that governs it.** Sonnet Q1-4: "the same-fill-bar mark stays eligible" is unreachable in the primary form because EA 11849 returns before it, and the primary form's fill term is redundant for the same reason.

The honest root cause is that every gate I banked tests an **artifact** - does the acceptance exist, is the polarity right, does the prohibition match its prescription - while these defects are **relations between artifacts**: a cell against the prose it summarizes, a promise against the acceptance that must honour it, a label against the line it names, a census against the splice that must support it. A fourth and fifth clause in the same shape would not have caught any of them, and adding one is exactly the near-duplicate the workflow forbids.

**The fix is one relation-checking gate, and it is banked as such in the ledger with the fold.** EDIT-SET CLOSURE: for every line a fold changes, every other line on the page that references its subsection id or a distinctive phrase of it must be in the fold's edit set or proven unaffected; every normative promise phrase ("is named in", "appears in", "rides in", "carried unchanged", "every reader", "NOT emitted", "is spliced") must have its referent asserted present by count on the same page; and every enumerated EA-line list inside a census cell must be re-classified mechanically from the EA at fold time, with the classification printed beside it. That single check covers all six classes above.

## 4. Condition crosswalk - twenty-one distinct items, each with my verification

Verified (V) means I read the cited EA line or packet line this turn and the seat's reading holds. Carried (C) means accepted as stated.

**Q1 (eleven items)**

| # | Condition | Seat | Status |
| --- | --- | --- | --- |
| 1 | Restate the T2 census cell to the 15.3.3 resolution | Sonnet Q1-1 | V - the cell carries the withdrawn latch-only wording while 15.3.3 makes it a full evaluation |
| 2 | Resolve the day-mark scope contradiction: 15.3.1 requires a pilot-free derivation while the preserved-defect list keeps the pilot window open | Sonnet Q1-2 | V - `SRJ_PILOT_FROM/TO` at EA 10882-10883, loop EA 11005-11006 capped at 32, close EA 11021-11022; the June window has no marks, so no June fixture can grade DAY_CLOSE until that separate defect closes |
| 3 | Restate the gapped-POC predicate with the target ahead of price, and fix the geometry citation | Sonnet Q1-3 | V - v17's LONG clause puts the target behind price, which lands in row 6 every time, and EA 2368 is `o1<=L && c0>=o1`, an open at or below the line, not at or above |
| 4 | Drop the unreachable same-fill-bar eligibility from the primary form, mark the primary fill term redundant against EA 11849, and name `mark <= barTime` in the forbidden form | Sonnet Q1-4 | V - `if(barTime < g_mtrade.fillBarTime) return;` at EA 11849; EA 12017 is `fillBarTime <= mark && mark <= barTime` |
| 5 | Name the Q1 counter readers the page claims are named | Sonnet Q1-5, GLM Q1-D1 | V - `uj_tradeSeqNext` written EA 10731 and read in the EA 10700 and EA 10737 rows, `uj_admitCount` written EA 10732 read EA 12227, `g_mtrade.uj_tradeSeq` read EA 11635, EA 11684, EA 11691, EA 11921, EA 11923, and the recompute counter read EA 12032 |
| 6 | State one double-actor rule instead of "the host is authoritative" beside a first-running check | Sonnet Q1-6 | V - as printed the two clauses produce either two closes or an ignored latch |
| 7 | Add a gapped-POC acceptance row set, or declare it NOT GRADED | Sonnet B, GLM Q1-D2 | C - a row set is added, since the detector is in scope |
| 8 | Add a LATE day-close fixture and a row recording which host acted | Sonnet B | C - acceptance additions |
| 9 | Bind the gapped-POC operand to a named line or buffer before implementation | GLM | C - named as an implementation prerequisite beside 15.4.6 |
| 10 | Fix the containment sentence: the entry session's run keeps EA 1927's admission containment, each later session's run is bound by close-at-or-after-fill eligibility | GLM Q1-D3 | V - as printed, "each walked run tested for its own admission bar" rejects every non-entry session and negates the YES in the same sentence |
| 11 | Splice EA 1130-1148 so the N1 census rows are page-verifiable, and classify EA 2121 and EA 2143 correctly | GLM | V - EA 2121 and EA 2143 are `+=` writes |
| 12 | ASIA/PM exclusion census stays owed | Sonnet Q1-7 | C - carried |

**Q3 (ten items)**

| # | Condition | Seat | Status |
| --- | --- | --- | --- |
| 13 | The anchor is an index and the line is re-read per shift: state each read and delete the no-drift claim | Sonnet Q3-1 | V - EA 2351 reads the price at the passed shift, EA 8137 stores `g_anchorPrice` at the seed shift, EA 2098 is the detector read, EA 8302 is the mirror read; three reads can differ for a moving line |
| 14 | A prior-candle doji fails `A_OPP` at EA 2367, not `B_BODY` | Sonnet Q3-2, GLM Q3-D2 | V - `c1==o1` makes `oppCandle` false, so the retained arm returns before the current-bar doji test is reached |
| 15 | Name the equality clause as load-bearing for the registered case, require both opens printed, and report arms as well as form disjuncts | Sonnet Q3-3 | C - and his own derivation is labelled a derivation, not a printed `o0` |
| 16 | Soften the S3 census cell: the LONG ordinary predicate never ran, so `A2` is consistent by derivation and not a measured failing term | Sonnet Q3-3 | C - wording fix |
| 17 | State the break arm's true population and name it as a narrow diff class | Sonnet Q3-4 | C - the detector's own floor bounds the arm's population |
| 18 | Scope the counter removal to `g_n1_vwap*` and `g_n1_poc*`; the entry and exit body and wick counters are retained | Sonnet Q3-5 | V - EA 2121, EA 2143 and EA 11968 write counters in other families |
| 19 | Reconcile the evict list with EX-29 and label reads as reads | Sonnet Q3-6, GLM Q3-D3 | V - declarations EA 1939-1940, clears EA 1965, EA 1971, EA 8111, EA 8116, bit-set writes EA 9323 and EA 9325, reads EA 1961, EA 1967, EA 8112, EA 8117 |
| 20 | Splice EA 6939 | Sonnet Q3-7, GLM | V - it is the declaration the coverage census depends on and EX-31 says it is not spliced |
| 21 | Add `SIDE1H_WOULDPREEMPT` to the NOT-emitted list, and add the mirror-row requirement and the contender-confirm diff class to the acceptance | Sonnet Q3-8, GLM Q3-D1 | V - EA 7834 sits under the `g_state > ST_IDLE` gate at EA 7814, so it vanishes on the consume route |

## 5. What the round confirms, with credit

Sonnet verified the polarity cases, the trigger arithmetic, the forbidden-form self-exclusion, the consume placement against the gated blocks and the seed order, the evict-bit writers, the caller census and the sync conjunction, and found nothing OBJECT-grade. GLM verified the trigger bindings, the forbidden form, the earlier check, the LATE catch-up, the writer pins against the journal stamps, the pin's answer, the recorders, row 2, the route row sets against the spliced pass order, the ordering claim, EX-31 and the yield's leavings, and expressly did not reject the consume placement, the per-form disposition or the break arm. Luna confirms both questions and closes them at the design level with the acceptance predicates left as future-run obligations.

The convergence matters for the operator's instruction: both source-checking seats independently state that the remaining work is page consistency and citation, not design, and that no pin, design branch or authority line needs to move.

## 6. Standing limits

Q1 AMEND. Q3 AMEND. Q2 closed. No implementation authority is granted or inferred: no EA source edit, build, test, tester run, key, live action, commit or push. The RECON78 one-run authorization remains consumed. SRJ stays alert-only and the dirty working tree is preserved. June 11 validity is settled and not re-derived: 14:35 New York USDJPY Daily-POC retest plus confirmation, entry at the 14:40 open exactly 160.524, 14:45 and later post-entry. The four open defects stay separate: June 5 target-touch management retirement, the RECON57 day-close model-versus-broker close, the day-close price reference, the day-mark pilot window - and this round adds measured precision to the fourth, that the June window carries no day marks at all, so the DAY_CLOSE branch cannot be graded on any June fixture until it is closed.