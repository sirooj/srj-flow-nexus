# V399 council grade - packet P-RECON78-UJ-EXEC-1 v11

Date: 2026-10-03. Lane: SRJ Flow Nexus. Graded read-only from filed bytes; no EA source was read for this grade, no source edit, build, test, tester run, key, live action, commit, or push.

Relay `BUILDER_RELAY_COUNCIL_v399-UJ-EXEC-9.md`: SHA-256 `06D78F91A3D2C8461B20F2B610446812F4207E9ABB15C6ABF9A2D78070762043` (228359 bytes / 2471 physical lines).
Packet `PACKET_P-RECON78-UJ-EXEC-1v11.md`: SHA-256 `A4A8D5A6E5478D7339C083D4FC6B6847AFB1CD7A357C869A93CDFE17224114A3` (210052 bytes / 2450 physical lines).
Both digests re-measured this turn against disk and unchanged. Twin re-derived this turn: P-lines 2450 = packet lines 2450, P-sequence P001-P2450 unbroken, prefix-reconstruction mismatches 0, ellipsis 0 in both files.

## 1. Intake - three complete replies, one round

The operator returned three replies to the single V399 relay. Seat attribution is his declaration; each text was filed whole under the round token in its own file.

| Seat | Intake SHA-256 | Bytes / split-lines / non-ASCII | Verdict file | OPEN / END line | Filed file SHA-256 | Filed bytes / physical lines |
| --- | --- | --- | --- | --- | --- | --- |
| Luna | `47DDBE61BC02CB5D8266B15BE98CC31603F0566B0C3FCC91901AD346B2DB8DF7` | 5824 / 44 / 11 | `BUILDER_VERDICTS_LUNA.md` | 17824 / 17869 | `275796843914BA704A3FA1F5A06314B8E1D45101791D01CFF53CBBD0861CF8C7` | 1231975 / 17869 |
| Sonnet | `0F059F42395804F677DB4E9A358053487109D1C3202A77493523915110BEF24C` | 19975 / 226 / 7 | `BUILDER_VERDICTS_SONNET.md` | 7535 / 7762 | `9AD56BD32B66BC3504418BA3535CCAEA9335D4467BAD12F34DB7AF4943611485` | 899020 / 7762 |
| GLM | `8A60ADA5259DA81D79D565A779FEBD015CE06F8B0831521692549987F9D793D9` | 17867 / 103 / 88 | `BUILDER_VERDICTS_GLM.md` | 10607 / 10711 | `4ADB9C290163212D703F71B1AA80BC7EEFF202632F9A8824531490EB040ABEBC` | 1936626 / 10711 |

Filing proof, all three: each OPEN and END marker occurs exactly 1x in its own file and the round token occurs 0x in the other seven verdict files; the append byte-delta equalled the asserted staged-plus-marker length exactly (Luna +5892, Sonnet +20047, GLM +17933); each filed body is byte-identical to its staged intake file; each file tail reads back with the new END marker as the final line and a final LF byte. Intake element census green before use: 28 checks (Luna), 54 (Sonnet), 56 (GLM), zero deviations, probes taken from the visible inbound text.

Declared normalization, disclosed rather than claimed byte-exact: trailing spaces at line ends were trimmed, and two routing header lines (`SEAT:` and `REPLY TO:`) were added per file. No wording, number, verdict word, tag, or condition was altered, added, or dropped.

## 2. Tally under the packet's own review rule (section 47 TIE-FIXED, applied per question)

| Question | Luna | Sonnet | GLM | Grade |
| --- | --- | --- | --- | --- |
| Q1 - dynamic closed-session TP revisions and day-close regression | DISCREPANCY | DISCREPANCY | CONFIRM (YES) | AMEND |
| Q3 - settled June 11 LONG through same-pass admission | DISCREPANCY | DISCREPANCY | CONFIRM (YES) | AMEND |
| Q2 - June 5 NY 16:15 entry | not reviewed | not reviewed | not reviewed | closed; no tally, no reopening |

Q1 carries a DISCREPANCY+DISCREPANCY pair, so it grades AMEND. Q3 carries the same pair, so it grades AMEND. No seat returned OBJECT and no seat returned NO on either question, so no amend-with-halt. GLM stated its own per-question rows as YES and asked for the combine; the combine is recorded here, not delegated to the seats. Apply the mapping separately per question: one question's disposition never carries the other.

## 3. Realized delta against V398

- Q1 moved from CONDITIONAL-CONFIRM to AMEND. V398 was Sonnet DISCREPANCY plus GLM YES; a second independent seat (Luna) now returns DISCREPANCY on Q1, so the conditional-confirm no longer holds.
- Q3 stays AMEND. V398 was Sonnet DISCREPANCY plus GLM DISCREPANCY; GLM moved to CONFIRM this round, but Luna and Sonnet both hold DISCREPANCY, so the disposition is unchanged.
- GLM is the first seat movement of the round: Q3 DISCREPANCY (V398) to CONFIRM (V399). Its twelve Q1 and twelve Q3 conditions are new text and bind the fold.
- Nothing voided. No operator strategy ruling changed. No run, build, or source state changed.
- Condition volume grew: Q1 now carries three seats (Luna 6 conditions, Sonnet C1-C10 plus a 16-row transition table plus acceptance amendments, GLM C1-C12); Q3 carries Luna 6, Sonnet D1-D5 plus seven acceptance amendments, GLM D1-D12.

## 4. Operator-rule triage - no new trade-rule question survives

Sonnet flagged three Q1 items and one Q3 item as needing an operator rule. Record-first was run against the strategy pins before anything reached the operator; none of the four survives as a question.

- Sonnet C2 (a retarget target already passed, then no modify, revision unaccepted, position kept): answered on record. `MANAGE-NEAREST` exits on the nearest VALID target, `RETARGET-CLOSED-AM` and `SYMMETRY-NEAREST` bind the retarget object to the closed-session extreme in the trade's direction, and a price not ahead of the position is not a valid target. Sonnet's own C1 asks for that validity predicate to be stated from existing rules. Disposition: design item, folded from existing pins, no operator ask.
- Sonnet C3 (the day-close trigger runs on a closed-bar host, so a close can never print at the 23:55 open; Friday marks execute after the weekend): the operator's reference is already pinned and unchanged - the leg executes at the 23:55 verdict-day bar open, Friday included. Whether the host can act at that price is a mechanism and cadence question. Disposition: AUTHORITY-BOUND plus design; the pin is restated, the cadence is a council/builder design item, never an operator ask.
- Sonnet C6 (for a SHORT, does "target touched" mean the chart low or Ask): answered on record by the model-versus-broker separation the packet already carries - the model evaluates its own chart series, the acceptance is a broker deal at the operative target, and the two are reported separately. Disposition: design item, no operator ask.
- Sonnet D5 (the EA reads Ask for LONG, so a deal at exactly 160.524 is structurally impossible as acceptance is written): answered on record by `EXACT-PRICE-NO-LENIENCY`, `R-AT-OPEN` and `ENTRY-BAR READ-BACK`, and independently by GLM condition D9 - 160.524 stays the exact signal and model entry reference, the actual deal is reported separately with its spread delta, and any divergence is a defect under no-leniency rather than a waiver. Disposition: ALREADY-CORRECT in intent, with the Ask-read entry-execution design presented for review. No operator ask.

One operator-side item remains, and it is a carried evidence gap rather than a new question: the June 11 New York USDJPY 14:30 high/low, the 14:35 open/high/low, and the Daily-POC line values at shifts 1 and 2. Sonnet and GLM both ask for them from the chart or indicator rather than the journal. Only his chart or terminal can supply them; the archive does not hold them. Nothing else is owed by him on this round.

## 5. Strategy authority controls the reading of both seats

The June 11 New York USDJPY Daily-POC LONG is settled valid on his words: 14:35 retest plus confirmation on one bar, entry at the 14:40 open exactly 160.524, 14:45 and later barred from selection. `TOUCH-OR-BREAK` / `CONFIRMATION-CANONICAL` and `PRIOR-CLOSE-IRRELEVANT` govern the confirmation question, and the 14:30 close cannot veto the 14:35 retest. `confC=0` with `A2_CLOSE_BREAK` on the June row is the current code predicate's prior-close clause failing, exactly as GLM and Sonnet both state; it is not a verdict on the setup and it does not reopen the ruling. The day-close reference at the 23:55 verdict-day bar open, Friday included, is likewise pinned. No seat asked to change either ruling, and none is put to the operator.

## 6. The two open regressions stay separate, and a third defect is not merged into them

- June 5 New York USDJPY TP_TOUCH management retirement: the model retired management while the broker position stayed open. Open, unchanged, no fix made.
- RECON57 day-close model versus broker close: a model DAY_CLOSE verdict fired at 23:55 on a real position while the broker deal happened later on 7 September. Model verdict and broker close remain distinct acceptance facts, and no close reason is inferred. Open, unchanged.
- The 23:55 reference versus `nextOpenPx` price mapping raised by Luna condition 3, Sonnet condition 3 and GLM conditions C1 and D9 is a THIRD and separate defect: the day-close exit reference the code builds. It is not folded into either regression above, and folding it in would hide it. Both seats that examined it read it as a price-reference mapping defect to be exhibited and corrected against the pinned 23:55 reference.

## 7. Seat-finding crosswalk - every condition dispositioned

One row per proposition, per seat. `DEST` is the destination in packet v12 section 15, to be closed against the saved packet text in the fold turn (saved-text assurance); no row is closed by intention alone.

### Q1

| Seat | ID | Proposition | Disposition | DEST |
| --- | --- | --- | --- | --- |
| Luna | 1 | Superseded broker-TP classification must be defined, not merely listed as "to state" | ADOPT | 15.4 sync/supersession table |
| Luna | 2 | Retcode numeric meanings must be verified against the current MQL5 reference before encoding | ADOPT | 15.4 retcode classes |
| Luna | 3 | 23:55 verdict-day bar open versus the source `nextOpenPx` mapping must be reconciled | ADOPT | 15.3 price reference |
| Luna | 4 | Design must prevent a later signal replacing or resetting another open PID; retirement only after broker resolution | ADOPT | 15.4 instance registry |
| Luna | 5 | Day-close broker proof needs its own no-target fixture; RECON57 is model-level only | ADOPT | 15.4 fixture |
| Luna | 6 | Source, EX5 and RECON78 run linkage stays separately evidenced and unproven | ADOPT | 15.6 provenance |
| Sonnet | C1 | Eligible-session table, pre-entry bar question, comparator base, retarget validity predicate | ADOPT | 15.4 target evaluation |
| Sonnet | C2 | Target already passed / inside stops or freeze | DESIGN-ROUTED (record answers; see section 4) | 15.4 no-modify states |
| Sonnet | C3 | Day-close trigger timing versus the pinned 23:55 reference | AUTHORITY-BOUND plus design | 15.3 price reference |
| Sonnet | C4 | Stale-versus-valid fill contradiction; classification split from acceptance | ADOPT | 15.4 supersession and acceptance |
| Sonnet | C5 | `!vTP` gates still mask other legs; vTP must split into synced and telemetry | ADOPT | 15.4 verdict computation |
| Sonnet | C6 | SHORT chart-low touch versus broker Ask-side execution | DESIGN-ROUTED (record answers) | 15.4 state table |
| Sonnet | C7 | Sizing is path-dependent; acceptance should compare closing volume to that PID's opening volume | ADOPT | 15.5 acceptance |
| Sonnet | C8 | Mode predicates, paper-instance key, phantom active instance, reset before the concurrency gate | ADOPT | 15.4 modes and O6 |
| Sonnet | C9 | HTF is non-executing and safe only while off; acceptance must record HTF-off | ADOPT | 15.4 acceptance |
| Sonnet | C10 | RECON57 row-number citation is wrong; deal pairing is by symbol and volume; no DEAL_REASON inferred; `MtCloseBrokerPosition` post-dates RECON57 | ADOPT | 15.3 evidence hygiene |
| Sonnet | 11 | MQL5 retcode memory matches but is not browsed; classes must be restated in the implementation packet; async must be pinned off | ADOPT | 15.4 retcode classes |
| Sonnet | table | 16-row instance transition table with same-bar precedence | ADOPT | 15.4 transition table |
| Sonnet | B | Fixture identity from deal history, unconditional rows, volume rule, fail conditions, diff start, day-close branch, mode check | ADOPT | 15.5 acceptance |
| GLM | C1 | Exhibit `nextOpenPx` and reconcile the day-close reference, correcting it as a source regression if it points at the following bar | ADOPT | 15.3 price reference |
| GLM | C2 | Generalize target evaluation beyond the current helper; never an open-session extreme; no new post-entry 1R gate | ADOPT | 15.4 target evaluation |
| GLM | C3 | Restructure managed state so an open broker PID keeps evaluation alive; deliver the transition table | ADOPT | 15.4 state table |
| GLM | C4 | Migrate the singleton to a PID-keyed registry; carry V396 (a)-(i) | ADOPT | 15.4 instance registry |
| GLM | C5 | Exhibit the full managed-trade verdict body | ADOPT | 15.2 exhibits |
| GLM | C6 | Implement the sync helper; verify retcodes; state supersession classification; name the expected close reason | ADOPT | 15.4 sync and retcodes |
| GLM | C7 | Author the day-close no-target fixture specification before any run | ADOPT | 15.4 fixture |
| GLM | C8 | Place O6 before the IDLE seed and before side effects, older positions included | ADOPT | 15.4 modes and O6 |
| GLM | C9 | Pin hedging/netting, synchronous CTrade, ticket overload, tester/demo policy | ADOPT | 15.4 modes |
| GLM | C10 | Carry all V398 and Sonnet A1-A9 conditions verbatim | ADOPT | 15.1 carried conditions |
| GLM | C11 | Bind source, EX5 and run provenance separately | ADOPT | 15.6 provenance |
| GLM | C12 | Acceptance uses future-run rows only; diff starts 5 June London 12:05 | ADOPT | 15.5 acceptance |

### Q3

| Seat | ID | Proposition | Disposition | DEST |
| --- | --- | --- | --- | --- |
| Luna | 1 | Same-pass replacement sequence from deferred SHORT abort to fresh LONG seed is not specified | ADOPT | 15.5 state map |
| Luna | 2 | Current abort path is terminal; the repair must consume the abort and reach IDLE seed without a second pass | ADOPT | 15.5 state map |
| Luna | 3 | Holder-scoped fresh-state clearing census, exactly once | ADOPT | 15.5 state map |
| Luna | 4 | Eviction and provenance census keyed so a consumed SHORT Daily-POC cannot block LONG Daily-POC | ADOPT | 15.5 eviction census |
| Luna | 5 | Counter and branch exclusivity census not exhibited | ADOPT | 15.5 counters |
| Luna | 6 | O6 placement must be source-proven | ADOPT | 15.4 modes and O6 |
| Luna | para | `IsConfirmationCandle` returns on `A2_CLOSE_BREAK` before the touch-or-break logic; repaired transformation not exhibited | ADOPT | 15.2 exhibits and 15.5 predicate |
| Sonnet | D1 | Path evidence EA 8477-10617 and the named helpers are not exhibited | ADOPT | 15.2 exhibits |
| Sonnet | D2 | Replacement predicate unspecified; caller sites span hold, displace and yield; needs verbatim text, truth table, per-call-site diff | ADOPT | 15.5 predicate and 15.2 exhibits |
| Sonnet | D3 | One-point A2 miss may be a mixed-bar comparison; OHLC and line series are a second evidence gap | ADOPT | 15.3 evidence gap |
| Sonnet | D4 | Same-pass depth unresolved; latch and memo timing; holder-scoped reset | ADOPT | 15.5 state map |
| Sonnet | D5 | Seed-bar locals are computed before the abort and would not fire | ADOPT | 15.5 state map |
| Sonnet | D6 | Return census incomplete; pending-abort disposition per return | ADOPT | 15.5 return census |
| Sonnet | D7 | Eviction read key resolved; writers unexhibited | ADOPT | 15.5 eviction census |
| Sonnet | D8 | Suppression labeling must be neutral on the release bar; counters need a keying scheme | ADOPT | 15.5 counters |
| Sonnet | D9 | June 11 acceptance is conditional on Q1 closing the earlier New York position | ALREADY-CORRECT (carried in 15.5) | 15.5 acceptance |
| Sonnet | B1 | Entry-side convention: reference exact, deal reported separately | ALREADY-CORRECT plus design (see section 4) | 15.5 acceptance |
| Sonnet | B2 | Register fields for expected target, stop reference, R and sizing must be carried | ADOPT | 15.1 register |
| Sonnet | B3 | Confirmation proof rows plus chart OHLC and line values, and LTF alignment true | ADOPT | 15.5 acceptance and 15.3 gap |
| Sonnet | B4 | Branch rows for the consume and yield paths | ADOPT | 15.5 counters |
| Sonnet | B5 | Preservation controls: June 8, June 9, June 5 London, June 3, seven EURUSD takes, one per pair/session, no 14:45+ | ADOPT | 15.5 acceptance |
| Sonnet | B6 | Full-journal confirmation diff plus downstream diff after Q1 | ADOPT | 15.5 acceptance |
| Sonnet | B7 | Ordering: June 11 acceptance requires the earlier Q1 close first | ALREADY-CORRECT | 15.5 acceptance |
| GLM | D1 | Exhibit EA 8477-10617 in full before implementation | ADOPT | 15.2 exhibits |
| GLM | D2 | Quote the strategy sections verbatim and map each clause to repaired predicate terms | ADOPT | 15.1 pins |
| GLM | D3 | Complete confirmation-predicate caller census, live gate versus telemetry, with preservation proof | ADOPT | 15.5 predicate |
| GLM | D4 | Repaired bar mapping for same-bar retest plus confirmation, without changing unrelated consumers | ADOPT | 15.5 predicate |
| GLM | D5 | Same-pass state map, return census, counter reconciliation, neutral suppression | ADOPT | 15.5 state map and counters |
| GLM | D6 | Exhibit every eviction writer with its key and prove the SHORT identity cannot block the LONG | ADOPT | 15.5 eviction census |
| GLM | D7 | Poll-before-seed memo availability in the same pass | ADOPT | 15.5 state map |
| GLM | D8 | O6 before seed, record mutation and side effects; June 11 conditional | ALREADY-CORRECT plus ADOPT | 15.4 and 15.5 |
| GLM | D9 | Keep 160.524 exact; report the deal separately; present the Ask-read entry design | ALREADY-CORRECT plus design | 15.5 acceptance |
| GLM | D10 | Carry the missing 14:30 and 14:35 values as an open gap; never fabricate them | ADOPT | 15.3 evidence gap |
| GLM | D11 | Reconcile source, EX5 and run provenance | ADOPT | 15.6 provenance |
| GLM | D12 | Acceptance items are future predicates only | ADOPT | 15.5 acceptance |

No OBJECT and no NO were returned, so no row is blocked by a halt; every condition above is adopted, already-correct with proof, authority-bounded, or routed to design from the record.

## 8. Builder defects owned this turn

1. Session statement missing from the V399 transport set. Measured this turn: `CONTINUE` 0 occurrences and `NEW council session` 0 occurrences across the whole V399 relay, the whole v11 packet, and the whole transport memo. The banked session-outright rule requires that statement on the relay page and the memo. The relay's line convention survived only inside the twin at P005. This is a non-execution of an existing gate, not a missing gate. Repair: the v400 relay states the session verdict outright in relay prose, outside the twin, and the transport memo repeats it.
2. Probe defects owned, none of them page defects. The first twin probe matched only three-digit P labels and stopped at P999; corrected to three-to-four digits it reports 2450/2450 with zero mismatches. Three intake-census expectation values were carried over wrongly (IsConfirmationCandle, nextOpenPx and 160.524 in the Luna list; GoAbort and ResetSequence, which are Luna's wording, in the Sonnet list; 159.725 and 159.726, each twice, in the GLM list) and were corrected against the visible inbound text. PowerShell consumed the inline JSON argument, so expectation lists moved to their own files. `Set-Content -Encoding UTF8` wrote a byte-order mark into one expectation file, which the JSON probe then rejected.
3. Process violation owned. That byte-order mark made the GLM census probe exit non-zero, and the chained command still ran the append, so GLM's body was filed before its census gate was green. Retro-proof: the census was re-run after the fix and printed green with 56 checks and zero deviations, and the filed GLM body is byte-identical to the staged intake file, so the filed text is proven. The defect is the ordering, not the content: a failed probe must hard-stop every dependent write, and the probe script now exits non-zero with no chained write.

## 9. Close and authority

Q1 AMEND. Q3 AMEND. Q2 closed. The three seats granted no implementation authority and none is inferred: no EA source edit, build, test, tester run, key, live action, commit, or push. The RECON78 one-run authorization remains consumed. SRJ stays alert-only. The dirty working tree is preserved.

The next artifacts are builder-side and need nothing from the operator: packet v12 folding every adopted condition above with its evidence spliced from disk, then relay v400 with the session statement added and the complete twin, then the battery, then the transport memo. The only item that needs him is the June 11 chart values, and it stays an open evidence gap until he supplies them; it blocks nothing in the fold.