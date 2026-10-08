# BUILDER RESULT B-107 - June XOB separator classification, JUNE-XOB-SEPARATOR-FOUND-OFFLINE, MEASURED

Trader summary: B-106 recovered every requested June candle with full rows. This relay re-measured them independently and compared like against like: your valid 5 June retest touches two of its own-direction zones, while the ruled-out 2 June and 4 June candles touch none of theirs. That single touch-at-the-counted-retest reading separates cleanly, with nothing missing and no contradictions. This is offline evidence only — no gate was built and no rule was changed.

## Relay order (B-107, offline classification only)

- Part 0 fresh start on builder/B-106 at 91c4eaee6cb82adad9804ebb9572ca649eb99ae0, both skills loaded whole first.
- Part B banking (no new rule words). Part R classification (R1 provenance, R2 recompute, R3 comparison, R4 lifecycle, R5 readings, R6 words, R7 matrix, R8 decision, R9 boundary). Part X records (ledger 1252). Part F file + push builder/B-107 via backup.

## Part 0 - fresh-session start

- 0.1 Relay skill loaded whole first (67-line SKILL.md, known whole, untouched). Strategy skill loaded whole second (64 KB; consulted by grep, never edited).
- 0.2 `git ls-remote https://github.com/sirooj/srj-flow-nexus.git builder/B-106` = `91c4eaee6cb82adad9804ebb9572ca649eb99ae0` (verified exact). Cut `builder/B-107` from it. Push via `backup`, never `origin`.
- 0.3 Read in order on `builder/B-106`: pointer (20 lines); RESULT_B106 head (89-line file, authored prior turn, unchanged); SLICE_B106 head (96-line file, authored prior turn, unchanged); RESULT_B105 section (98-line file, unchanged); RESULT_B104 tail (103-line file, authored three turns ago, unchanged); RESULT_B103 section (84-line file, unchanged); PLANNER_CONTEXT section-4 tail (128-line file, B-106 lesson present); PLANNER_HANDOFF section-3 tail (68-line file, B-106 line present); relay SKILL.md whole; strategy SKILL.md whole (s178/B-70/B-91/JUN05NY lines re-verified by prior greps on identical bytes); spec v4.2 (35807 B, identical bytes, whole-reads carried); register (11072 B, identical bytes: 2 June row 310, 4 June row 314 + row 13, 5 June rows 17/306/307/308); `XOBDIAG_JUNE_TARGETS.csv` verified (761 lines, SHA `36844a2b...`); `XOBDIAG_JUNE_INCREMENTAL.csv` re-hashed identical (`6ec47f5d...`, 77909963 B); operator journal grepped for the three cases + adjacent candles (rows 5/13/17 session context; row 306 VALID 5 June 16:15 LONG; rows 307/308 5 June London context; row 310 INVALID 2 June 15:35 LONG with his touch words; row 314 NOT-HIS-TAKE 4 June 09:55 SHORT with the three reasons).
- 0.4 Names per relay: target `XOBDIAG_JUNE_TARGETS.csv`; source `XOBDIAG_JUNE_INCREMENTAL.csv`; prior `JUNE-XOB-ROWS-RECOVERED` item `1251`; this tag `B107-JUNE-XOB-SEPARATOR-CLASSIFICATION`, item `1252`; kept EA `137076D9CF85` / EX5 `FA4C924978F6`; verdict MEASURED.
- 0.5 Start gate: `git log -1` = `91c4eae B-106 June XOB rows recovered for ruled-out comparison (relay B-106)` (verified head). `git diff 91c4eaee6cb82adad9804ebb9572ca649eb99ae0 --` EMPTY (every committed file named). `git status --short` = 427 lines (prior artifacts + B106 June files/scripts, preserved untouched). Kept EA disk `137076d9...` (LF-only, normalized identical) / EX5 `fa4c924978f6...` (prefixes match). Both June CSVs present with B-106 SHAs (no NOT FOUND, no regen). No terminal64 launched, no compile, no tester run (read-only turn). No STOP.
- 0.6 Scope: offline classification of recovered June rows, existing OHLC, register, spec and banked words; B-107 text records only.

## Part B - banking

- B1 The current operator message contains the B-107 relay order only; it carries no new trading-rule words. Record `no new rule words`; appended nothing.

## Part R - June separator classification

- R1 B-106 provenance re-verified (every item FOUND; zero NOT FOUND): target artifact 761 lines (760 rows + header), SHA `36844a2b8c7ecf305bb49488a3f72698e0e0548dcad66897c8e9457228fb8170`; source artifact 77909963 B, SHA `6ec47f5d6ea550040f0add4f806d62f0d93c0e06c0b8ebdc89c523b8aa40d695` (re-hashed identical); all six candles present with exact rows (123/139/130/122/123/123, sum 760); single build `2026.10.08 21:25:54` and path `INCREMENTAL2` on every recomputed row; every row carries direction, zone, promoT, validity, activation, promotion state, validationT, invalidationT, invalidation level, build, calcPath, runPass (18-field schema re-verified in the recompute).
- R2 Recomputed from the copied rows only (independent clean-loop rerun; relevance = promoted=1 + promoT present + promoT <= candle; validity at candle; touch = range intersect on B105 UJBARMAP OHLC; row directions; no touch rejection; no bias aging/POI killing; no kill-bar relabeling). No forcing was needed - every cell matches the B-106 expected values exactly.
- R3 Primary comparison (trade directions per record: 2 June LONG machine fire, 4 June SHORT tester fire, 5 June LONG valid path):

| case | candle | total rows | relevant-valid rows | trade direction | trade-direction relevant rows | trade-direction touch rows | trade-direction non-touch rows | reading |
|---|---|---|---|---|---|---|---|---|
| 2 June ruled out | 06-02 14:20 | 123 | 30 | LONG | 30 | 0 | 30 | recomputed, matches expected |
| 4 June ruled out | 06-04 09:10 | 139 | 34 | SHORT | 3 | 0 | 3 | recomputed, matches expected |
| 4 June ruled out | 06-04 09:55 | 130 | 34 | SHORT | 3 | 0 | 3 | recomputed, matches expected |
| 5 June valid | 06-05 16:00 | 122 | 32 | LONG | 32 | 2 | 30 | recomputed, matches expected |
| 5 June valid | 06-05 16:10 | 123 | 32 | LONG | 32 | 0 | 32 | recomputed, matches expected (context) |
| 5 June valid | 06-05 16:15 | 123 | 32 | LONG | 32 | 0 | 32 | recomputed, matches expected (context) |

Touch rows row-verified: 5JUN1600 ids 3150 (zone 159.853-159.820, promoT 1780589100) + 3308 (159.916-159.881, promoT 1780674000), both B-direction, both relevant-valid; 4JUN0910/0955 id 3099 (zone 159.868-159.797, promoT 1780560900), B-direction (opposite to the SHORT fires), 1-point edge touches - hence trade-direction touch 0 on both ruled-out candles.
- R4 Lifecycle timing kept separate: 16:00 is the counted retest candle (the classification anchor); 16:10 is the confirmation candle; 16:15 is the entry-open candle. Their touch-absence (0/0) is lifecycle context, never a failure of the 16:00 retest. No post-entry bar used as selection evidence. The 5m bullish bias flip is never used as XOB evidence (observed).
- R5 Four readings (MET/NOT MET/UNKNOWN + counts; primary candidate = touch at the counted retest only; confirmation/entry = diagnostic context):
  - `TRADE-DIRECTION-RELEVANT`: 2JUN MET (30); 4JUN0910 MET (3); 4JUN0955 MET (3); 5JUN1600 MET (32); 5JUN1610 MET (32); 5JUN1615 MET (32).
  - `TRADE-DIRECTION-TOUCH-AT-COUNTED-RETEST`: 2JUN1420 NOT MET (0); 4JUN0910 NOT MET (0); 5JUN1600 MET (2). (09:55/16:10/16:15 are not retest candles - excluded from this reading by definition.)
  - `TRADE-DIRECTION-NONTOUCH-AT-COUNTED-RETEST`: 2JUN MET (30); 4JUN0910 MET (33); 5JUN1600 MET (30).
  - `TOUCH-AT-CONFIRMATION-OR-ENTRY`: 4JUN0955 NOT MET (0); 5JUN1610 NOT MET (0); 5JUN1615 NOT MET (0); 2 June n/a (no confirmation/entry candle requested) UNKNOWN. Context only, never a replacement for the retest reading.
- R6 Banked words applied unchanged (grep-verified): 2 June `"there is no valid XOB retracement or touch there, so no setup ever forms for me"` + `"a touch I do not count"` (measured: 30 LONG relevant-valid, 0 touched - his "no touch" reads exactly onto the count); 4 June `"at that candlestick there is not yet a valid bias for short, it is an invalid CQD divergence, and there is no retest of XOB in play."` (bias + CQD kept separate, never XOB evidence; measured: 3 SHORT relevant-valid per candle, 0 touched); 5 June 16:00 retest + 16:05 flip + 16:10 confirmation + 16:15 open (measured: 32 LONG relevant-valid at 16:00 with 2 touched); B-91 `"what i meant by retrace and in play are the same thing."` (single-condition reading preserved). XOB touch stays permitted and never disqualifying (§3.6 + §10 - the separator uses touch as a positive discriminator on trade-direction rows, never as a rejection of touching rows).
- R7 Separator matrix (valid = 5 June 16:00 retest only; ruled out = 2 June 14:20 + 4 June 09:10/09:55; 16:10/16:15 lifecycle context, never separate classifications):

| reading | valid 5 June | ruled-out 2 June | ruled-out 4 June | contradiction | separator status |
|---|---|---|---|---|---|
| TRADE-DIRECTION-RELEVANT | MET (32) | MET (30) | MET (3) / MET (3) | none | DOES-NOT-SEPARATE |
| TRADE-DIRECTION-TOUCH-AT-COUNTED-RETEST | MET (2) | NOT MET (0) | NOT MET (0) / NOT MET (0) | none | SEPARATES |
| TRADE-DIRECTION-NONTOUCH-AT-COUNTED-RETEST | MET (30) | MET (30) | MET (33) / MET (33) | none | DOES-NOT-SEPARATE |
| TOUCH-AT-CONFIRMATION-OR-ENTRY | context (0/0) | n/a UNKNOWN | NOT MET (0) | none | UNKNOWN (context, not a setup classification) |

The ruled-out candles are not empty (34/34 relevant-valid at 4 June, 30 at 2 June) - they fail specifically on trade-direction touch, the same narrow condition the valid retest meets. The 4 June touches that do exist are opposite-direction (id 3099 B vs SHORT fires); the 2 June population has no touch at all.
- R8 Exactly one: `JUNE-XOB-SEPARATOR-FOUND-OFFLINE` - the counted-retest trade-direction touch reading (5JUN1600 MET 2 vs 2JUN NOT MET 0, 4JUN0910 NOT MET 0, 4JUN0955 NOT MET 0) separates the valid 5 June case from both ruled-out cases, with complete provenance (B106 hashes/builds/journal/run re-verified) and no contradiction. Offline evidence only; authorizes no EA gate. Thin-margin note (filed, not a hedge): the separation rests on 2 trade-direction touch rows at one candle (ids 3150/3308) against zeros elsewhere - the next relay must weigh buildability and rule-authority before any edit is considered.
- R9 Boundary: B-104 EU `OFFLINE-SEPARATOR-NOT-FOUND` unchanged (different population, opposite outcome, no conflict - EU takes never touch, the June valid retest does). The four B-91 readings stay unreopened. No EA gate added or enabled. No profitability, take rate or trade outcome graded. With the offline separator found, the next relay reviews buildability and rule-authority before any source edit is considered.

## Part X - records

- X1 `PLANNER_CONTEXT.md` section 4 grep `B-107-JUNE-XOB-SEPARATOR-CLASSIFICATION` = 0 -> appended exactly one lesson (verified 1). No duplicate.
- X2 `PLANNER_HANDOFF.md` section 3 grep `B-107` = 0 -> appended `- B-107: classified the recovered June XOB rows; no gate or trade grade was performed.` (verified 1). No duplicate.
- X3 Ledger grep `B107-JUNE-XOB-SEPARATOR-CLASSIFICATION` = 0 and `^1252.` = 0 -> appended item `1252` (artifact hashes, six-candle provenance, primary comparison, four-reading matrix, separator matrix, R8, no edit/compile/run/gate/grade). `^1251.` = 1 beside. No duplicate.
- X4 Pointer 20 -> 20 lines (cap 35): latest B-107 MEASURED, FOUND-OFFLINE decision, kept EA/EX5 unchanged, no compile or runs, no gate/grade, next reviews buildability + rule-authority.

## Part F - file, push, reply

- F1 this result. F2 slice `BUILDER_SLICE_B107.md` (raw artifact checks, exact case rows, reading matrix, separator matrix, before/after lines; under 600 lines; no source diff, no run tables). F3 ledger 1252. F4 pointer per X4. F5 stages only the 6 relay files. F6 commit + push `builder/B-107` via `backup` + ls-remote check. Reply MEASURED.

## Final disk state (MEASURED turn; kept RKD build on disk, uncommitted)

- EA `137076D9CF85160AB8CD8379575AFD4801E71098CE97C0B10D88A42C7BF59671` (695359 B, LF-only, verified-kept; never edited this turn) + all prior `.preB*`/`.B*` copies kept uncommitted. EX5 `FA4C924978F6A1D5C57B725F2AB530BBB5DC5B1E0D1D0B51FB0172E80D8C41B5` (verified-kept). Indicator src/ex5 at gate SHAs, untouched. No compile, no launch, no tester run, no terminal/config/chart modification (B106 analysis scripts + June artifacts unstaged). Strategy skill, journal CSV, register, spec untouched (all read-only; journal greps only). No edit stands beyond the relay's text records.

No carried note (no STOP; nothing to ask him).
