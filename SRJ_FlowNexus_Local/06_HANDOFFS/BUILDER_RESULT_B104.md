# BUILDER RESULT B-104 - offline XOB separator measurement across all 13 EU candles, OFFLINE-SEPARATOR-NOT-FOUND, MEASURED

Trader summary: B-103 left all 13 EU counted candles with complete rows and provenance, ready for design. This relay measured your recorded "XOB retracement or touch" evidence against the full live XOB population at each counted candle, offline only. Relevance is everywhere (34-41 relevant valid XOBs per candle, 11-25 matching the trade direction), but the counted candle touches none of them on any of the 13 candles, and the ruled-out candle looks the same — so no reading separates. No EA edit, compile, run, gate or rule decision was made.

## Relay order (B-104, offline measurement only)

- Part 0 fresh start on builder/B-103 at 9368ae5e8eb97c5242efaab810831c216f4188a1, both skills loaded whole first.
- Part B banking (no new rule words). Part R offline separator (R1 population, R2 OHLC, R3 condition, R4 groups, R5 readings, R6 comparisons, R7 classifications, R8 matrix, R9 decision; no Part K, no Part T). Part X records (ledger 1249). Part F file + push builder/B-104 via backup.

## Part 0 - fresh-session start

- 0.1 Relay skill loaded whole first (67-line SKILL.md, known whole, untouched). Strategy skill loaded whole second (64 KB banked-words file; consulted by grep for the cited rulings, never edited).
- 0.2 `git ls-remote https://github.com/sirooj/srj-flow-nexus.git builder/B-103` = `9368ae5e8eb97c5242efaab810831c216f4188a1` (verified exact). Cut `builder/B-104` from it. Push via `backup`, never `origin`.
- 0.3 Read in order on `builder/B-103`: pointer (20 lines); RESULT_B103 head (84-line file, authored prior turn, unchanged); SLICE_B103 head (72-line file, authored prior turn, unchanged); RESULT_B102 tail (84-line file, authored two turns ago, unchanged); RESULT_B101 head (73-line file, unchanged); PLANNER_CONTEXT section-4 tail (122-line file, B-103 lesson present); PLANNER_HANDOFF section-3 tail (62-line file, B-103 line present); relay SKILL.md whole; strategy SKILL.md whole (grep-verified: s178 line 178, B-70 veto line 198, B-91 lines 202/204; C-1530 direction search: only 10 June hits, none on the 1 Sep take); spec v4.2 (396 lines, 35807 B, read whole prior turn on identical bytes, anchor line 133 re-verified); register (65 lines, 11072 B, read whole prior turn on identical bytes); `XOBDIAG_RECON62_EU_TARGETS.csv` verified (1446 lines, header + 1445 rows); `XOBDIAG_RECON62_INCREMENTAL.csv` spot-checked (A1 112, A7 109, exact); operator journal grepped for all 13 candle times/sessions (rows 301/303/304/313 carry rulings and entry/target prices, no counted-candle OHLC).
- 0.4 Names per relay: EU artifact `XOBDIAG_RECON62_EU_TARGETS.csv`; source `XOBDIAG_RECON62_INCREMENTAL.csv`; candle source existing journal/diagnostic candle records only (UJBARMAP EA-diagnostic per-bar prints, see R2); prior `EU-XOB-EVIDENCE-READY-FOR-PLANNER-DESIGN` item `1248`; this tag `B104-OFFLINE-XOB-SEPARATOR`, item `1249`; kept EA `137076D9CF85` / EX5 `FA4C924978F6`; verdict MEASURED.
- 0.5 Start gate: `git log -1` = `9368ae5 B-103 EU XOB record review of recovered RECON62 rows (relay B-103)` (verified head). `git diff 9368ae5e8eb97c5242efaab810831c216f4188a1 --` EMPTY (every committed file named). `git status --short` = 413 lines (prior artifacts, preserved untouched). Kept EA disk `137076d9...` (LF-only, normalized identical) / EX5 `fa4c924978f6...` (prefixes match). No terminal64 launched, no compile, no tester run (read-only turn). Both recovered CSVs present with B-102/B-103 SHAs (EU_TARGETS `623ce07d...`, INC `12f08bd0...` re-verified). No STOP.
- 0.6 Scope: offline analysis of existing XOB rows, existing candle OHLC records, register and banked rules; B-104 text records only.

## Part B - banking

- B1 The current operator message contains the B-104 relay order only; it carries no new trading-rule words. Record `no new rule words`; appended nothing.

## Part R - offline separator measurement

- R1 Source population verification (zero mismatches; no STOP): exactly 13 counted-candle groups present (13 distinct barT, each an exact requested epoch, none from a nearby candle); every row from the B-102 RECON62 incremental path, runPass 2 (1445/1445 `INCREMENTAL;2`); every row carries the 18-field schema (srcFile;barT;objId;direction;hi;lo;startT;createT;promoT;valid;active;promoted;validationT;invalidationT;invalidationLevel;build;calcPath;runPass); source build `2026.10.08 20:34:34` single on all rows; provenance matches B-102 (headers/EA census/journal SHAs per RESULT_B102, re-verified copies `4487afe3...`/`12f08bd0...`).
- R2 Candle OHLC from existing records only (all 13 FOUND; none inferred from a neighboring candle). Source: UJBARMAP EA-diagnostic per-bar prints (`bar=... o= h= l= c=`) in the archived `RECON62-B102_JOURNAL.log` (the name is a legacy label; values are this run's EURUSD; same journal, Core 04, EA build 20:34:52 as the XOB rows). Operator-journal grep carries rulings and entry/target prices but no counted-candle OHLC (rows 301/303/304/313 noted, none usable as OHLC):

| register row | timestamp (UTC) | open | high | low | close | candle source | source run |
|---|---|---|---|---|---|---|---|
| F2 | 2026-08-26 16:25 | 1.16572 | 1.16578 | 1.16552 | 1.16570 | UJBARMAP EA journal | RECON62-B102 Core 04 |
| A1 | 2026-08-28 09:55 | 1.16473 | 1.16491 | 1.16473 | 1.16482 | UJBARMAP EA journal | RECON62-B102 Core 04 |
| C-1530 | 2026-09-01 15:25 | 1.15931 | 1.15943 | 1.15920 | 1.15922 | UJBARMAP EA journal | RECON62-B102 Core 04 |
| A2 | 2026-09-01 16:45 | 1.16013 | 1.16013 | 1.15975 | 1.15990 | UJBARMAP EA journal | RECON62-B102 Core 04 |
| A2 | 2026-09-01 17:25 | 1.16064 | 1.16066 | 1.16009 | 1.16011 | UJBARMAP EA journal | RECON62-B102 Core 04 |
| A3 | 2026-09-03 15:40 | 1.16227 | 1.16227 | 1.16178 | 1.16188 | UJBARMAP EA journal | RECON62-B102 Core 04 |
| A3 | 2026-09-03 15:50 | 1.16232 | 1.16301 | 1.16208 | 1.16286 | UJBARMAP EA journal | RECON62-B102 Core 04 |
| A4 | 2026-09-07 09:00 | 1.16143 | 1.16143 | 1.16103 | 1.16116 | UJBARMAP EA journal | RECON62-B102 Core 04 |
| A4 | 2026-09-07 09:10 | 1.16116 | 1.16119 | 1.16102 | 1.16114 | UJBARMAP EA journal | RECON62-B102 Core 04 |
| A5 | 2026-09-07 16:05 | 1.16247 | 1.16251 | 1.16238 | 1.16245 | UJBARMAP EA journal | RECON62-B102 Core 04 |
| A5 | 2026-09-07 16:35 | 1.16261 | 1.16263 | 1.16246 | 1.16250 | UJBARMAP EA journal | RECON62-B102 Core 04 |
| A6 | 2026-09-08 10:00 | 1.16210 | 1.16229 | 1.16198 | 1.16223 | UJBARMAP EA journal | RECON62-B102 Core 04 |
| A7 | 2026-09-08 16:50 | 1.16218 | 1.16233 | 1.16208 | 1.16225 | UJBARMAP EA journal | RECON62-B102 Core 04 |

Continuity spot-checks hold (A4 09:00 close 1.16116 = 09:10 open; A5 16:05 close 1.16245 vs 16:35 open 1.16261 across the half-hour gap, lawful). One regex typo under-matched 09:10 on the first pass (owned, no harm: re-grepped exactly, FOUND).
- R3 `FULL-XOB-RETRACE-OR-TOUCH` measured offline per row (script `b102`-family `b104_measure.ps1`, rows only; no EA gate): relevance = `promoted=1` AND `promoT` not `NA` AND `promoT` no later than the counted candle; validity required at the counted candle (invalid rows kept in the population table, never relabeled as kills); TOUCH = candle range intersects the XOB zone (`max(low,lo) <= min(high,hi)`), recorded for the full population per §3.6 (a touching XOB is never rejected); no depth/recency/distance/size/tolerance condition added; no 5m bias flip used. Independently re-verified on A1 (35 relevant-valid zones: 13 entirely above, 22 entirely below the 1.16473-1.16491 range, 0 intersecting) so the zero-touch outcome is measured, not a script bug.
- R4 Register groups (directions: register A rows A1 S, A2-A5 B, A6-A7 S; F2 S per this relay's own "26 August short" label; C-1530 direction UNKNOWN from register/banked words/journal after record-first search; full population preserved beside every direction cut):

| register row | counted candle | total | relevant valid | touch | non-touch relevant | long relevant | short relevant | direction-side rows | full-population result | evidence status |
|---|---|---|---|---|---|---|---|---|---|---|
| F2 | 08-26 16:25 | 102 | 34 | 0 | 34 | - | 11 | 11 (S) | 34 relevant-valid, all non-touch | EVIDENCE-PRESERVED |
| A1 | 08-28 09:55 | 112 | 35 | 0 | 35 | - | 13 | 13 (S) | 35 relevant-valid, all non-touch | EVIDENCE-PRESERVED |
| C-1530 | 09-01 15:25 | 111 | 36 | 0 | 36 | - | - | UNKNOWN (no direction) | 36 relevant-valid, all non-touch | EVIDENCE-PRESERVED |
| A2 | 09-01 16:45 | 110 | 37 | 0 | 37 | 18 | - | 18 (B) | 37 relevant-valid, all non-touch | EVIDENCE-PRESERVED |
| A2 | 09-01 17:25 | 112 | 39 | 0 | 39 | 20 | - | 20 (B) | 39 relevant-valid, all non-touch | EVIDENCE-PRESERVED |
| A3 | 09-03 15:40 | 102 | 32 | 0 | 32 | 18 | - | 18 (B) | 32 relevant-valid, all non-touch | EVIDENCE-PRESERVED |
| A3 | 09-03 15:50 | 103 | 32 | 0 | 32 | 18 | - | 18 (B) | 32 relevant-valid, all non-touch | EVIDENCE-PRESERVED |
| A4 | 09-07 09:00 | 118 | 38 | 0 | 38 | 20 | - | 20 (B) | 38 relevant-valid, all non-touch | EVIDENCE-PRESERVED |
| A4 | 09-07 09:10 | 118 | 38 | 0 | 38 | 20 | - | 20 (B) | 38 relevant-valid, all non-touch | EVIDENCE-PRESERVED |
| A5 | 09-07 16:05 | 116 | 41 | 0 | 41 | 25 | - | 25 (B) | 41 relevant-valid, all non-touch | EVIDENCE-PRESERVED |
| A5 | 09-07 16:35 | 119 | 41 | 0 | 41 | 25 | - | 25 (B) | 41 relevant-valid, all non-touch | EVIDENCE-PRESERVED |
| A6 | 09-08 10:00 | 113 | 40 | 0 | 40 | - | 16 | 16 (S) | 40 relevant-valid, all non-touch | EVIDENCE-PRESERVED |
| A7 | 09-08 16:50 | 109 | 36 | 0 | 36 | - | 16 | 16 (S) | 36 relevant-valid, all non-touch | EVIDENCE-PRESERVED |

- R5 Four readings, per group with counts (MET / NOT MET / UNKNOWN):
  - `ANY-DIRECTION-RELEVANT` (any relevant valid XOB at the candle): MET on all 13 (F2 34, A1 35, C-1530 36, A2 37/39, A3 32/32, A4 38/38, A5 41/41, A6 40, A7 36). Zero NOT MET, zero UNKNOWN.
  - `TRADE-DIRECTION-RELEVANT` (relevant valid XOB matches the register direction): MET on all 12 direction-known groups (F2 11, A1 13, A2 18/20, A3 18/18, A4 20/20, A5 25/25, A6 16, A7 16); C-1530 UNKNOWN (no register direction after record-first search of register, skill and journal).
  - `TRADE-DIRECTION-TOUCH` (trade-direction relevant XOB touched by the candle): NOT MET on all 12 direction-known groups (0 touches each); C-1530 UNKNOWN (no direction; full-population touch count is likewise 0, reported as fact, not as a reading).
  - `TRADE-DIRECTION-NONTOUCH` (trade-direction relevant XOB not touched): MET on all 12 (11, 13, 18, 20, 18, 18, 20, 20, 25, 25, 16, 16); C-1530 UNKNOWN.
- R6 Record-first comparison (register + banked words rule; export is evidence):
  - F2 (26 August short): full population 102 rows / 34 relevant-valid, all non-touch; trade-direction (S) population 11 relevant-valid, 0 touch / 11 non-touch. Compared without treating this as his rule (no ruling attaches).
  - A1 (28 August 09:55): full population preserved at the counted candle (112 rows); every field is an at-bar snapshot plus absolute historical times, so no post-entry bar is used.
  - A2, A3, A4, A5, A6, A7: each counted candle preserved separately (16:45/17:25, 15:40/15:50, 09:00/09:10, 16:05/16:35, 10:00, 16:50); adjacent candles never merged.
  - C-1530: tester-only status preserved exactly (register section C: NOT his); measured for full-population readings only, never promoted into his valid set.
  - 2 June / 4 June rulings: NOT IN THIS POPULATION (June USDJPY candles are absent from this EURUSD artifact; no ruling graded here).
- R7 Classifications for the separator test (audited labels only): operator-valid = register section-A takes (11 candle-groups: A1x1, A2x2, A3x2, A4x2, A5x2, A6x1, A7x1); ruled-out = C-1530 (tester-only, NOT his, per register section C); ruling absent = F2 (measured, excluded from the valid/ruled-out comparison, reported UNKNOWN). A reading matching one group without the full comparison is not a separator (observed throughout). No conclusion chooses any of the four prior B-91 readings.
- R8 Separator matrix:

| reading | valid groups MET/NOT MET/UNKNOWN | ruled-out groups MET/NOT MET/UNKNOWN | contradictory groups | separator status |
|---|---|---|---|---|
| ANY-DIRECTION-RELEVANT | 11/0/0 | 1/0/0 (C-1530 MET, 36 rows) | none | DOES-NOT-SEPARATE |
| TRADE-DIRECTION-RELEVANT | 11/0/0 | 0/0/1 (C-1530 UNKNOWN, no direction) | none | UNKNOWN |
| TRADE-DIRECTION-TOUCH | 0/11/0 | 0/0/1 (C-1530 UNKNOWN) | none | DOES-NOT-SEPARATE |
| TRADE-DIRECTION-NONTOUCH | 11/0/0 | 0/0/1 (C-1530 UNKNOWN) | none | UNKNOWN |

ANY fires on the ruled-out candle too (36 relevant-valid rows), so it cannot separate. TOUCH never fires on any valid take (0/11), so it cannot separate either. The directional pair is unresolvable without a ruled-out direction. F2 (11 S-direction relevant-valid, 0 touch) stands outside the comparison as UNKNOWN.
- R9 Exactly one: `OFFLINE-SEPARATOR-NOT-FOUND` - every reading either fires on both sides, fires on neither valid side, or faces an unresolved ruled-out direction. Nothing was missing (13/13 groups, 13/13 OHLC present), so this is NOT-FOUND, not PARTIAL. Offline evidence only; authorizes no EA gate. Subsidiary measured fact (not a rule): on all 11 valid-take candles the trade-direction relevant XOBs exist (11-25 rows) and are uniformly non-touching - the §3.6-permitted, §9.12-until-now-unmeasured case, now measured at 100% non-touch in this population.

## Part X - records

- X1 `PLANNER_CONTEXT.md` section 4 grep `B-104-OFFLINE-XOB-SEPARATOR` = 0 -> appended exactly one lesson (verified 1). No duplicate.
- X2 `PLANNER_HANDOFF.md` section 3 grep `B-104` = 0 -> appended `- B-104: measured one offline full-population XOB separator across the recovered EU counted candles; no gate or trade grade was performed.` (verified 1). No duplicate.
- X3 Ledger grep `B104-OFFLINE-XOB-SEPARATOR` = 0 and `^1249.` = 0 -> appended item `1249` (source artifacts+hashes, OHLC provenance, 13 classifications, four reading matrices, separator matrix, R9, no edit/compile/run/gate/grade). `^1248.` = 1 beside. No duplicate.
- X4 Pointer 20 -> 20 lines (cap 35): latest B-104 MEASURED, NOT-FOUND decision, kept EA/EX5 unchanged, no compile or runs, no gate/grade, next follows the offline result.

## Part F - file, push, reply

- F1 this result. F2 slice `BUILDER_SLICE_B104.md` (raw artifact checks, exact OHLC records, group classifications, reading matrices, separator matrix, before/after lines; under 600 lines; no source diff, no run tables). F3 ledger 1249. F4 pointer per X4. F5 stages only the 6 relay files. F6 commit + push `builder/B-104` via `backup` + ls-remote check. Reply MEASURED.

## Final disk state (MEASURED turn; kept RKD build on disk, uncommitted)

- EA `137076D9CF85160AB8CD8379575AFD4801E71098CE97C0B10D88A42C7BF59671` (695359 B, LF-only, verified-kept; never edited this turn) + all prior `.preB*`/`.B*` copies kept uncommitted. EX5 `FA4C924978F6A1D5C57B725F2AB530BBB5DC5B1E0D1D0B51FB0172E80D8C41B5` (verified-kept). Indicator src/ex5 at gate SHAs, untouched. No compile, no launch, no tester run, no terminal/config/chart modification (analysis scripts `b104_measure.ps1` + prior artifacts unstaged). Strategy skill, journal CSV, register, spec untouched (all read-only; journal greps only). Diagnostic copies/artifacts unstaged. No edit stands beyond the relay's text records.

No carried note (no STOP; nothing to ask him).
