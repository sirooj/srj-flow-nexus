# BUILDER RESULT B-62 - when a retest goes stale: 27 Aug 17:05 short vs 5 June 16:15 long (read-only, MEASURED)

Trader summary: the 27 August short the new touch confirmed is the same trade your journal already rules invalid - same 17:05 entry, same short, same 1.16524 fill, and your own note points at the 16:25 high, which is exactly the retest candle the machine used. So that extra fire stays dead under your ruled-invalid row, no new question needed there. On when a retest goes stale, your words on record cover two cases: a retest dies when a later candle closes through its line (your 8/27 ruling: the 18:05 retest died on the 18:10 and 18:15 closes), and seeds carry across quiet candles with no expiry stated. Measured side by side: your 5 June retest waited 2 candles with no touch in between and the 5m with the trade; the 27 August retest waited 7 candles, got touched again at 16:35, got closed through at 16:30, and waited most of it with the 5m against the trade. Nothing was edited, compiled or run.

## Part 0 - fresh-session start
- 0.1 relay skill loaded first, whole. His terms everywhere (s15 TERMS-HIS): "5m bullish bias flip", "5m bearish bias flip", "OB", "OB invalidation", "setup", "potential", "retest", "stale".
- 0.2 ls-remote builder/B-61 returns `e9f9a7ee5991acc44f7140c8800a9fdc561c4503`. Cut builder/B-62 at it. Dirty tree kept (283 lines; count only). No git config/remote change. Push via `backup` (never `origin`).
- 0.3 read in order: pointer; RESULT_B61 whole + SLICE_B61 whole; strategy s2, s5, s7, s8, s10, s11, s13, s15, both Rulings; register whole (all sections); PLANNER_CONTEXT.md whole. Ledger/AGENTS/.clinerules by grep only.
- 0.4 start gate: git log -1 = e9f9a7e. Explicit-list diff EMPTY on all 8 files + ledger (never a directory diff). Ledger `^1204\.` = 1, `^1205\.` = 0, `B61-BUILD-CRETEST` present. Journal 1061 lines. Disk SHAs all match B-61 final state: EA D00F93BB (683671 B); .B61DIAG 5BFBF504 (687642 B, present); ex5 9A522F05 (rebuilt provenance); FlowLogic 956BF3E3 / ex5 27B5F272; HTFEngine D5FD5B06, BiasEngine 3B1D9D3D, OrderblockMgr 5D14FCE2, Draw FD2B3716; MARKER 79859EDC / ex5 f0890c0b; terminal.ini 88a0deb1 STD_JUNE; j27 DD3E6855 (66904), j28 29BC5DBA (71417), j29 FDD4D79A (71227), j30 ED024B24 (71169), j31 AD254E6D (76755), j32 RECON62-B61 AA728CC7 (67094). No terminal64 running. No STOP.
- 0.5/0.6 as relayed (X27 shape, REG_C27 text, B2 shape, tags C27_MATCH/RETEST_LIFE_HIS/GAP_TABLE, ledger 1205 B62-MEAS-RETESTLIFE; read-only, text records only, one push, no second attempt).

## Part R - read-only
- R1 is X27 the REG_C27 trade? Record-first hits (raws in slice):
  - Ledger 789 (2026-09-26, paraphrase-record of his chart+words): "8/27 entry WRONG (last valid retest 18:05, dead by 18:10+18:15 closes)".
  - Ledger 1159 (2026-10-04): his W1 VERBATIM in full (27 aug NY invalid; nearest target D VWAP below 1R; "is it not at 16:25 high? i journaled this trade as invalid").
  - Journal row 302 (8/27 NY): "INVALID 17:05 SHORT off Daily POC; nearest valid target D VWAP below 1R so skipped ... EA j3 fired this as deal #2 at 1.16524" + his W1 words verbatim. Row 305 (R2 gap answer, his A-Q1 verbatim - target-race topic, not this trade).
  - Findings RETEST-INVALIDATION-V1:37: his Ruling 3 VERBATIM (8/27 venue): "8/27 that is the correct exit, but the entry is WRONG! the last valid retest is at 18:05 and the bearish retest is invalidated by breaking it with a candle body close at 18:10 and 18:15." RECON14-OFFLOG:28 (old 8/27 17:00 diagnostic, no his-words).
  - Register section C: "27 Aug take (tester-only): ruled INVALID entry by him (last valid retest 18:05, dead by 18:10/18:15 closes)". Strategy skill: no 8/27-fill hits (W1 lives at s11:130-135, target-race topic).
  - REG_C27's trade from the hits: 17:05 SHORT @ 1.16524 (journal 302 names the exact fill "deal #2 at 1.16524"); his 16:25-high pointer (W1) = X27's retest candle.
  - C27_MATCH = SAME_TRADE. Proof beyond a date match: same 17:05 entry time + SHORT + 1.16524 fill (his journal row 302 names that exact fill as the ruled-INVALID one) + his 16:25-high pointer matching X27's 16:25 retest candle. One naming difference on record: his row says "off Daily POC" while the machine anchored Weekly-VWAP (j32 B60C; 16:25 UJDTTERMS shows Daily-POC Lno-penetration, only Weekly-VWAP LHIT) - same fill, different anchor names.
- R2 27 Aug NY table 16:20-17:10 (j32 EA 5BFBF504, UJBARMAP rows; j28 EA D00F93BB UJBARMAP byte-identical - same data feed; full raws in slice):

| Candle | Open | High | Low | Close | 5m | W-VWAP touch (exact) | Break (close through) | Stage | A/A2/B (SHORT) | C prior / C retest |
|---|---|---|---|---|---|---|---|---|---|---|
| 16:20 | 1.16502 | 1.16583 | 1.16502 | 1.16575 | +1.0 | TOUCH (1.16566) | - | - | - | - |
| 16:25 | 1.16577 | 1.16598 | 1.16561 | 1.16583 | +1.0 | TOUCH (retest) | - | - | seed S1 | - |
| 16:30 | 1.16582 | 1.16594 | 1.16564 | 1.16565 | +1.0 | TOUCH | BREAK_DOWN (1.16583 above -> 1.16565 below 1.16566) | S1 | A pass, A2 fail (prior close through) | - |
| 16:35 | 1.16564 | 1.16568 | 1.16534 | 1.16534 | +1.0 | TOUCH (retest again, hits=1) | - | S1 | A fail (prior closes up) | - |
| 16:40 | 1.16534 | 1.16540 | 1.16516 | 1.16525 | +1.0 | NONE | - | S1->S2 | A fail | - |
| 16:45 | 1.16524 | 1.16549 | 1.16503 | 1.16528 | +1.0 | NONE | - | S2WAIT | A fail | - |
| 16:50 | 1.16526 | 1.16548 | 1.16517 | 1.16539 | +1.0 | NONE | - | S2WAIT | A pass, A2 pass, B fail (closes up) | - |
| 16:55 | 1.16539 | 1.16552 | 1.16528 | 1.16540 | +1.0 | NONE | - | S2WAIT | A pass, A2 pass, B fail (closes up 1pt) | - |
| 17:00 | 1.16538 | 1.16542 | 1.16514 | 1.16526 | -1.0 | NONE | - | S2->S3->S5 (j32) / S2->S3 (j28) | A pass (1pt), A2 pass, B pass (12pt down) | prior: fail (16:55 untouched); retest 16:25: TOUCH -> confirm (j32 only) |
| 17:05 | 1.16524 | 1.16572 | 1.16498 | 1.16556 | -1.0 | TOUCH | - | fired (j32) / S3 waiting (j28: A fail) | - | - |
| 17:10 | 1.16556 | 1.16561 | 1.16513 | 1.16513 | -1.0 | NONE | - | - | - | - |

  - Other lines touched 16:20-17:10 (UJDTTERMS LHIT, j32): only Weekly-VWAP, only on 16:25. All other lines Lno-penetration every bar.
  - RETESTBOOK hits: 16:25 x1 (Weekly-VWAP), 16:35 x1 (Weekly-VWAP), 16:55 x1 (Daily-POC), 17:00 x1 (Daily-POC), 17:05 x1 (Weekly-VWAP); 0 on 16:20/16:30/16:40/16:45/16:50/17:10. CONFIRMPOLL anchor Weekly-VWAP throughout (dir LONG at 16:30 seed, SHORT from 16:40; touchAttr 1 on 16:25/16:30/16:35 bars, 0 after; confirm=0 every bar).
  - (a) Alive at 17:00 in both runs by the same code: S1 60-minute holder expiry (EA:8471-8474 UJHOLDEXPIRE - seed 16:25 dies no earlier than 17:25) then S2WAIT retain (EA:8505-8506: 15m disagrees -> "candidate RETAINED", return; no S2 timeout exists) - j32 S2WAIT x5 + j28 S2WAIT x5 on the same bars (16:35-16:55). Design comment EA:7424-7430 documents S2WAIT retention as built (Stage 3a). S2 gate byte-identical across all three builds.
  - (b) 16:30-16:55: touches on 16:30 + 16:35 only; one close through (16:30 BREAK_DOWN 1pt); A/A2/B never all-pass on any of these candles (A2 fails 16:30 on the broken prior close; A fails 16:35/16:40/16:45; B fails 16:50/16:55 on up closes).
  - (c) 17:00 is the first bar where A+B pass together (prior 16:55 closed up 1pt; 12pt down body; A2 holds) AND a touch exists anywhere the C rule looks: prior (16:55) untouched, so old C refuses (j28 PREBIND_FAIL C_TOUCH) while retest-OR-prior C accepts via the 16:25 touch (j32 B60C RETEST + CONFIRM_PREBIND + fire).
- R3 his words on retest staleness (record-first; raws in slice):
  - Skill title-hits only (no lifetime content): POST-ENTRY s2:54, SEED-CARRY s2:81, FRESH-SWEEP s2:82, ONE-TAKE s5:84, CONFIRM-ONCE s5:85, VENUE s5:88, RETARGET s5:90, TAKEN-LINE s10:126; "dead" hits are FVG-validity/venue topics; his "rejected or gone stale" (relay 0.1 attribute) has ZERO hits in skill and journal - noted.
  - Substance: (1) his Ruling 3 VERBATIM (findings RETEST-INVALIDATION-V1:37, 2026-09-26): "the last valid retest is at 18:05 and the bearish retest is invalidated by breaking it with a candle body close at 18:10 and 18:15" - a retest dies by candle-body-close break (8/27 venue instance, no candle-count given). (2) SEED-CARRY EXPECTATION (his challenge "how did the 5th build take it": seeds persist across unconfirmed bars to confirmation - 09:55-to-10:00, 14:55-to-16:40 carries) - carry across quiet bars, no expiry stated. (3) SESSION-BOUNDARY DISCIPLINE (his words via ledger 835: "stale claims must die by POI line break or 5m structure flip").
  - RETEST_LIFE_HIS = FOUND (Ruling 3 verbatim + date + file:line; scoped: death-by-break instance, no general candle-count lifetime rule of his on record).
- R4 side by side, measured only (B2 j29/j31 rows vs X27 j32 rows):
  - Candles between retest and confirmation: B2 one (16:05) + confirm 16:10 (2 bars after retest); X27 six (16:30-16:55) + confirm 17:00 (7 bars after retest).
  - In-between touch: B2 none (RETESTBOOK 0 on 16:05; UJDTTERMS Lno-penetration); X27 one re-touch (16:35 hits=1 Weekly-VWAP).
  - In-between close through: B2 none (closes above all lines); X27 one (16:30 BREAK_DOWN 1pt through Weekly-VWAP).
  - In-between A/A2/B pass: B2 16:05 passes A+A2, fails B; X27 never all-pass on any 16:30-16:55 bar (see R2).
  - 5m: B2 bullish (+1.0) with the LONG on every bar 16:05-16:10; X27 bullish (+1.0) AGAINST the SHORT on every bar 16:30-16:55, flipping to -1.0 on the 17:00 confirm bar.
  - Seed path: B2 reseed-after-abort only (B-60 C1; normal seed impossible, slot held); X27 normal seed (IDLE slot, ANCHOR_ELECT 16:25 LONG, direction resolved SHORT by 16:40).
  - R3 coverage: his break-death quote covers X27's 16:30 close-through as an invalidation event (the machine kept the potential alive through it - S2WAIT has no break check); SEED-CARRY covers staying alive across quiet bars (both); no his-quote distinguishes 5m-against waiting (X27) from 5m-aligned waiting (B2).
- R5 GAP_TABLE (retest | confirmation | candles between; run + EA SHA per row; UNKNOWN where rows don't show it):
  - A1: 10:00 | 10:00 | 0 (his s2 words; j28 A6FIRED 10:00, EA D00F93BB).
  - A2: 17:30 | 17:30 | 0 (his timing rule + register; j28 A6FIRED 17:30).
  - A3: UNKNOWN (register) | 15:55 (j28 A6FIRED) | UNKNOWN (seeds 15:30/15:40 precede on j28).
  - A4: UNKNOWN pinned (his chart proof: W POC retest "latest") | 09:15 (j28 A6FIRED 09:15) | UNKNOWN.
  - A5: 16:40 (his chart proof, retest latest) | 16:40 | 0 (seed carried from 14:55; j28 A6FIRED 16:40).
  - A6: UNKNOWN pinned | 10:05 (j28 A6FIRED) | UNKNOWN (seeds 09:15-09:40 precede).
  - A7: 16:55 | 16:55 | 0 (s2 CONFIRMATION-BAR; j28 A6FIRED 16:55).
  - B3: 14:35 | 14:35 | 0 (banked; j29 A6FIRED 14:35, EA 84F6CE11... wait j29 EA is A2A47B9F per B-57 (ex5; source 958D5AA1). Name run + EA SHA: j29 FDD4D79A, EA 958D5AA1.
  - C-3June: 09:00 (j29 ANCHOR_ELECT) | 09:05 (j29 A6FIRED) | 0.
  - C-rows fired on disk: 8/27 17:05 SHORT: 16:25 | 17:00 | 6 (j32 AA728CC7, EA 5BFBF504 attempt). 6/5 London 09:45 SHORT: 09:35 | 09:40 | 0 (RECON74-V11-UJ, EA 8C6468F4 v26 tree). 6/8 09:35 SHORT: 09:25 (seed bar) | 09:30 | 0 (RECON74-V11-UJ, 8C6468F4). 8/28 16:25: fired FAMILYPASS-V4 et al (EA UNKNOWN; register names E6E90831 demoted for it) - cells UNKNOWN. 9/8 16:45: fired FAMILYPASS-V4 et al (EA UNKNOWN) - cells UNKNOWN. 9/4 10:40 + 9/1 15:30: never fired in any journal on disk - cells UNKNOWN.

## Part T - trader table
- T1 B2 + X27 rows with his-words column (verbatim only):

| Trade | Retest | Confirm | Entry | Gap | In-between | 5m on wait | His words (verbatim) |
|---|---|---|---|---|---|---|---|
| B2 5 Jun NY LONG (owed) | 16:00 all six | 16:10 | 16:15 open 160.059 | 1 candle, no touch, no break | A+A2 pass, B fails on 16:05 | bullish with trade | "5 June New York long entry is the 16:15 candle open." (s13) + "5 June NY Long, the entry line POI was based of the M POC and M VWAP ... at 16:00." (Ruling 2026-10-06) |
| X27 27 Aug NY SHORT (ruled INVALID) | 16:25 W-VWAP | 17:00 | 17:05 open 1.16524 | 6 candles, re-touch 16:35, break 16:30 | A/A2/B never all-pass 16:30-16:55 | bullish against trade, flips at confirm | "i journaled this trade as invalid." (W1) + "the last valid retest is at 18:05 and the bearish retest is invalidated by breaking it with a candle body close at 18:10 and 18:15." (Ruling 3, death-by-break) |

- T2 provenance: B2 rows j29 FDD4D79A (EA 958D5AA1) + j31 AD254E6D (EA 4CD7CB49, MCAND 15/15 identical); X27 rows j32 AA728CC7 (EA 5BFBF504 attempt); his words from skill s13/Ruling 2026-10-06/Ruling 3/findings RETEST-INVALIDATION-V1:37/journal row 302/ledger 789/1159.

## Part F - file, push, reply
- F1 this result. F2 slice BUILDER_SLICE_B62.md (R1-R5 raws).
- F3 ledger item 1205 tag B62-MEAS-RETESTLIFE (grep `^1205\.` 0 and `B62-MEAS-RETESTLIFE` 0 -> appended; see below).
- F4 pointer (latest B-62 MEASURED; planner = SuperApp session for relay B-62; disk SHAs unchanged from B-61; Next = relay B-63 from the planner (retest-life guard from R1/R3 or his answer to the carried note); 35-line cap).
- F5 PLANNER_CONTEXT.md: appended nothing.
- F6 stage explicit paths only (result, slice, ledger, pointer). Never EA/includes/ex5/journals/logs/inis/backups. Commit "B-62 retest staleness: 27 Aug vs 5 June, MEASURED (relay B-62)". Push builder/B-62 via `backup`.
- F7 final disk state: same SHAs as 0.4, untouched; no terminal64 running. Disk + LF-normalized SHA per gated text file: result 784acc55/784acc55 (pre-finalization figure), slice 5c7e9b7e/5c7e9b7e, ledger 2d945db1/0255ad85, pointer 877817a2/877817a2.
- F8 ls-remote under the reply line. No carried-note suffix (see Carried note).

## Carried note
- None. C27_MATCH = SAME_TRADE (his INVALID ruling already covers X27 - no question needed there). RETEST_LIFE_HIS = FOUND (Ruling 3 verbatim: death-by-break; plus SEED-CARRY carry, no expiry). So neither chart call fires: Call 1 needs DIFFERENT_TRADE/UNKNOWN; Call 2 needs NO_RULING_FOUND.
