# BUILDER RESULT B-105 - June XOB review for ruled-out cases beside the 5 June valid case, JUNE-XOB-SEPARATOR-PARTIAL, MEASURED

Trader summary: B-104 could not finish its ruled-out comparison because C-1530 has no direction and the 2/4 June rulings are USDJPY. This relay reviewed the existing June artifacts for those exact cases. The candle prices are all on record, and the old run counted 123 rows at the 2 June touch candle, 139 at the 4 June path and 122 at the 5 June retest — but the row files themselves were deleted after B-101, so no per-row reading can be measured and no separator can be claimed. No source edit, compile, run, gate or rule decision was made.

## Relay order (B-105, read-only June review)

- Part 0 fresh start on builder/B-104 at e7f7192fdc9c3d4023ac9a41ed74d779847c9413, both skills loaded whole first.
- Part B banking (no new rule words). Part R June review (R1 inventory, R2 candles, R3 OHLC, R4 populations, R5 rulings, R6 readings, R7 comparison, R8 decision, R9 boundary). Part X records (ledger 1250). Part F file + push builder/B-105 via backup.

## Part 0 - fresh-session start

- 0.1 Relay skill loaded whole first (67-line SKILL.md, known whole, untouched). Strategy skill loaded whole second (64 KB banked-words file; consulted by grep for the cited rulings, never edited).
- 0.2 `git ls-remote https://github.com/sirooj/srj-flow-nexus.git builder/B-104` = `e7f7192fdc9c3d4023ac9a41ed74d779847c9413` (verified exact). Cut `builder/B-105` from it. Push via `backup`, never `origin`.
- 0.3 Read in order on `builder/B-104`: pointer (20 lines); RESULT_B104 head (103-line file, authored prior turn, unchanged); SLICE_B104 head (81-line file, authored prior turn, unchanged); RESULT_B103 section (84-line file, authored two turns ago, unchanged); RESULT_B102 head (84-line file, unchanged); RESULT_B101 June section (73-line file: T5 counts + samples + provenance, unchanged); PLANNER_CONTEXT section-4 tail (124-line file, B-104 lesson present); PLANNER_HANDOFF section-3 tail (64-line file, B-104 line present); relay SKILL.md whole; strategy SKILL.md whole (grep-verified: s178 line 178; B-70 veto line 198; B-91 lines 202/204; JUN05NY-ENTRY-1615 line 151; 5m-flip words line 170; B-61 paraphrase lines 172/174; C-1530 direction search already exhausted in B-104); spec v4.2 (35807 B, read whole on identical bytes, anchor re-verified); register (11072 B, read whole on identical bytes: A-row directions, C-row tester-only rows, B-row 5 June path); `XOBDIAG_RECON62_INCREMENTAL.csv` confirmed present (48 MB, EURUSD artifact, not a June source); existing June artifacts inventoried below (R1); operator journal grepped for 2/4/5 June (rows 302/303/304/308/311/314 carry rulings and entry/target prices; row 311 gives 10 June 15:45 open/close only; no 2/4/5 June counted-candle OHLC in the journal).
- 0.4 Names per relay: June source = existing B-101/B-102 June artifacts (R1); cases 2 June 14:20 touch + 15:35 LONG fire (ruled out), 4 June 09:10 path + 09:55 SHORT fire (ruled out), 5 June 16:00 retest + 16:10 confirmation + 16:15 LONG (valid); prior `OFFLINE-SEPARATOR-NOT-FOUND` item `1249`; this tag `B105-JUNE-XOB-RULEDOUT-REVIEW`, item `1250`; kept EA `137076D9CF85` / EX5 `FA4C924978F6`; verdict MEASURED.
- 0.5 Start gate: `git log -1` = `e7f7192 B-104 offline XOB separator measurement across all 13 EU candles (relay B-104)` (verified head). `git diff e7f7192fdc9c3d4023ac9a41ed74d779847c9413 --` EMPTY (every committed file named). `git status --short` = 414 lines (prior artifacts + `b104_measure.ps1`, preserved untouched). Kept EA disk `137076d9...` (LF-only, normalized identical) / EX5 `fa4c924978f6...` (prefixes match). No terminal64 launched, no compile, no tester run (read-only turn). June evidence basis confirmed present (R1: filed counts + samples + census + OHLC + STATUS/DONE + hashes-as-records); the absent per-candle row files are exactly what R8-PARTIAL covers, so no STOP - regenerating them is forbidden and STOP would file nothing. No STOP.
- 0.6 Scope: read-only review of existing June XOB rows, candle OHLC records, register, skill, spec and journal; B-105 text records only.

## Part B - banking

- B1 The current operator message contains the B-105 relay order only; it carries no new trading-rule words. Record `no new rule words`; appended nothing.

## Part R - June ruled-out and valid-case review

- R1 Existing June artifact inventory (nothing regenerated; each item FOUND, NOT FOUND or CONTRADICTED):
  - June INC agent CSV (`Tester/.../Agent-127.0.0.1-3003/MQL5/Files/XOBDIAG_INCREMENTAL.csv`, 4320 bars / 534596 recs, runPass 2): file NOT FOUND on disk (deleted in B-102 after hash capture; hash record `c304cabb...` / 77909963 B FOUND in B-102). Zero contradictions.
  - June FRESH agent CSV (2999 bars / 181464 recs, runPass 1): file NOT FOUND on disk (same lifecycle; hash record `8fc753ae...` / 25334084 B FOUND).
  - June EA census (day log `Tester/logs/20261008.log`, EA pass stamp 20:06:50.896): FOUND - FRESH `bars=2999 recs=181464 maxPerBar=98 atBar=2026.05.22 23:25 headerBuild=2026.10.08 19:45:38 eaBuild=2026.10.08 19:45:50 pathBad=0`; INC `bars=4320 recs=534596 maxPerBar=162 atBar=2026.06.11 06:45` same builds; PROV symMatch=1 perMatch=1 both paths, USDJPY/300.
  - June run label/window/ini: run JUNE0525-B101 Core 04, STATUS/DONE FOUND in working dir (`RESULT=PASSED DONE=2026-10-08 20:07:07`, wrapper PID 4016, same ini/symbol); ini `USDJPY_DEMO_JUNE.ini` FOUND (USDJPY M5, Model=4, InpDebugLog=true, FromDate 2026.06.01/ToDate 2026.06.13); terminal window 1779667200/1781308800 (5/25 start, graded 6/01-6/12) per B-101; builds header+row 19:45:38 / EA 19:45:50.
  - June sources: EA/EA-indicator diagnostic sources are the `.B101FULLWINDOW` bytes = `.B102RECON62` bytes (ind `45682CAB...` / EA `B5BE962A...`) FOUND; June diagnostic EX5 SHAs NOT FOUND (never captured in B-101; journal sizes 475312/240115 B substitute, filed).
  - June per-candle counts (B-101 record, INC file): F1 (06-02 14:20) 123 / F3a (06-04 09:10) 139 / F3b (06-04 09:45) 131 / B2 (06-05 16:00) 122 / B1 (06-05 ~09:45) 137 / C3 (06-03 ~09:00) 139 / F4 (06-10 ~15:30) 153 / B3a-b (06-11 ~14:05/14:30) 160/159 - all FOUND as filed counts with server-clock epochs (anchor 1779373200@05-21-14:20). Sample rows id=10 (B;1;1;0) + id=17 (S;0;0;0) identical at 6/2, 6/5, 6/11 FOUND as filed samples (within-run persistence only).
  - `MQL5/Files/XOBDIAG*.csv` (XOBDIAG.csv 19.75 MB build 18:27:06; FRESH 22 MB + INC 150 KB builds 20:34:34): present on disk but EXCLUDED - September/October bar times with mismatched builds, not June-window relay artifacts, provenance unknown (possibly non-relay activity); never used, never reconstructed.
  - Requested-row coverage: NO full per-candle row population for any of the three cases survives on disk (counts + 2 samples only). This is the PARTIAL basis, stated before any reading.
- R2 Requested candles from existing artifacts (no nearby substitution; F3b 09:45 is explicitly NOT a stand-in for the 09:55 fire):
  - 2 June New York 14:20 counted touch (epoch 1780410000 = 06-02 14:20 UTC exact): count 123 FOUND (B-101 F1, INC runPass 2); full rows NOT FOUND (file deleted; reconstruction forbidden).
  - 4 June London 09:10 counted path (epoch 1780564200 = 06-04 09:10 UTC exact): count 139 FOUND (B-101 F3a, INC runPass 2); full rows NOT FOUND. 09:55 SHORT tester fire (register: entry 159.868): rows NOT FOUND (never extracted; no filed count).
  - 5 June New York 16:00 counted retest (epoch 1780675200 = 06-05 16:00 UTC exact): count 122 FOUND (B-101 B2, INC runPass 2); full rows NOT FOUND. 16:10 confirmation / 16:15 entry: rows NOT FOUND (never extracted).
- R3 OHLC from existing diagnostic journal rows only (all 6 FOUND; none inferred from entry/target prices; no post-entry candles used). Source: UJBARMAP EA-diagnostic per-bar prints in the B-101 June segment of the day log (20:05 block, JUNE0525-B101, Core 04; identical values corroborated across the 00:58/06:11/07:09/18:17/18:29/19:24 runs - same deterministic feed):

| case | timestamp (UTC) | open | high | low | close | source path | source run |
|---|---|---|---|---|---|---|---|
| 2 June ruled out | 2026-06-02 14:20 | 159.721 | 159.727 | 159.716 | 159.727 | UJBARMAP, Tester/logs/20261008.log | JUNE0525-B101 Core 04 |
| 4 June ruled out | 2026-06-04 09:10 | 159.876 | 159.888 | 159.866 | 159.879 | UJBARMAP, Tester/logs/20261008.log | JUNE0525-B101 Core 04 |
| 4 June ruled out | 2026-06-04 09:55 | 159.868 | 159.906 | 159.867 | 159.901 | UJBARMAP, Tester/logs/20261008.log | JUNE0525-B101 Core 04 |
| 5 June valid | 2026-06-05 16:00 | 160.216 | 160.262 | 159.726 | 160.034 | UJBARMAP, Tester/logs/20261008.log | JUNE0525-B101 Core 04 |
| 5 June valid | 2026-06-05 16:10 | 160.009 | 160.062 | 159.981 | 160.058 | UJBARMAP, Tester/logs/20261008.log | JUNE0525-B101 Core 04 |
| 5 June valid | 2026-06-05 16:15 | 160.059 | 160.082 | 160.022 | 160.073 | UJBARMAP, Tester/logs/20261008.log | JUNE0525-B101 Core 04 |

Corroboration (never substitution): 09:55 open 159.868 = register 09:55 entry; 16:00/16:10 ltf -1.0 -> +1.0 matches his "16:00 flipped bearish and 16:05 flipped back bullish"; 16:15 open 160.059 matches the banked 16:15 entry. The 16:00 range (53.6 points) is reported as-measured, never smoothed.
- R4 Full-population classification per requested candle (B-104 field meanings; relevance = promoted=1 + promoT present + promoT <= candle; validity at candle; touch = range intersect; row directions from export fields; no touch rejection; no bias aging; no kill-bar language):

| case | counted candle | total rows | relevant-valid rows | touching relevant rows | non-touch relevant rows | long rows | short rows | direction-side rows | source provenance |
|---|---|---|---|---|---|---|---|---|---|
| 2 June ruled out | 06-02 14:20 | 123 (filed) | UNKNOWN (rows absent; 2 samples: id=10 B valid, id=17 S invalid, promoted flags 0/0 - not a population) | UNKNOWN | UNKNOWN | UNKNOWN | UNKNOWN | UNKNOWN | B101 June INC runPass 2, file deleted (hash c304cabb), count filed |
| 4 June ruled out | 06-04 09:10 | 139 (filed) | UNKNOWN (rows absent) | UNKNOWN | UNKNOWN | UNKNOWN | UNKNOWN | UNKNOWN | same provenance |
| 4 June ruled out | 06-04 09:55 | NOT FOUND (never extracted) | UNKNOWN | UNKNOWN | UNKNOWN | UNKNOWN | UNKNOWN | UNKNOWN | no extraction exists |
| 5 June valid | 06-05 16:00 | 122 (filed) | UNKNOWN (rows absent) | UNKNOWN | UNKNOWN | UNKNOWN | UNKNOWN | UNKNOWN | same provenance |
| 5 June valid | 06-05 16:10 | NOT FOUND (never extracted) | UNKNOWN | UNKNOWN | UNKNOWN | UNKNOWN | UNKNOWN | UNKNOWN | no extraction exists |
| 5 June valid | 06-05 16:15 | NOT FOUND (never extracted) | UNKNOWN | UNKNOWN | UNKNOWN | UNKNOWN | UNKNOWN | UNKNOWN | no extraction exists |

Filed counts are totals only (no relevance/validity/touch/direction split survives). The id=10/id=17 samples prove two identities' fields at 6/2 (and persistence to 6/5, 6/11), never a population reading.
- R5 Record-first rulings (banked words quoted; register + skill are the ruling source; rows are evidence only):
  - 2 June (skill s178, grep-verified): `"there is no valid XOB retracement or touch there, so no setup ever forms for me"` and `"a touch I do not count"`. The machine's 15:35 LONG (159.774, aiming at the 30 April high) is ruled out. Export relevance: 123 rows were captured at the 14:20 candle (existence + build + runPass proven), but per-row retracement/touch inspection is unavailable - the words are preserved verifiable, the row evidence for them is partial (count + 2 samples only).
  - 4 June (B-70 veto message, grep-verified, veto not exercised): `"at that candlestick there is not yet a valid bias for short, it is an invalid CQD divergence, and there is no retest of XOB in play."` Three reasons kept separate: (1) no short bias - NOT XOB evidence, never treated as such (journal row 13: 4H bear/1H bull/15m bull, bias bullish); (2) invalid CQD divergence - NOT XOB evidence, never treated as such; (3) no XOB retest in play - the XOB statement, for which 139 rows were captured at 09:10 (count only) and nothing at 09:55.
  - 5 June (banked valid path, grep-verified skill lines 151/170/172/174): 16:00 retest, 16:05 5m bullish bias flip ("16:00 flipped bearish and 16:05 flipped back bullish" verbatim), 16:10 confirmation, 16:15 open entry ("5 June New York long entry is the 16:15 candle open" verbatim). The 5m flip is NOT reinterpreted as XOB evidence (kept strictly separate per the relay and the B-61 ruling). Export relevance: 122 rows captured at the 16:00 retest (count only); 16:10/16:15 have no rows.
  - Row counts alone decide no rule (observed throughout).
- R6 Offline readings per case (kept separate from B-104; MET/NOT MET/UNKNOWN with counts + provenance; 4 June bias/CQD reasons excluded from XOB readings):
  - 2 June: ANY-DIRECTION-RELEVANT UNKNOWN (123 rows existed, relevance per row unmeasurable); TRADE-DIRECTION-RELEVANT UNKNOWN (machine fire was LONG, but direction-side relevance needs rows); TRADE-DIRECTION-TOUCH UNKNOWN; TRADE-DIRECTION-NONTOUCH UNKNOWN. Provenance: B101 June INC (deleted file, hash c304cabb) + day-log census.
  - 4 June: all four readings UNKNOWN (09:10: 139 rows existed, rows absent; 09:55: no rows at all). Bias/CQD reasons remain separate operator reasons, never XOB readings.
  - 5 June: all four readings UNKNOWN (16:00: 122 rows existed, rows absent; 16:10/16:15: no rows at all). Valid path stated for the record, never converted into a reading outcome.
- R7 Classified comparison (audited labels only; B-104 EU groups cited as prior evidence only, never merged): valid = 5 June New York (16:00 count known, rows absent); ruled out = 2 June New York (14:20 count known, rows absent) and 4 June London (09:10 count known, 09:55 absent entirely). No row-level reading is measurable on any of the three cases, so no separator can be claimed even where only one side were measurable (observed: neither side is).

| reading | 5 June valid | 2 June ruled out | 4 June ruled out | contradiction | separator status |
|---|---|---|---|---|---|
| ANY-DIRECTION-RELEVANT | UNKNOWN (rows absent) | UNKNOWN (rows absent) | UNKNOWN (rows absent) | none | NOT-TESTABLE |
| TRADE-DIRECTION-RELEVANT | UNKNOWN | UNKNOWN | UNKNOWN | none | NOT-TESTABLE |
| TRADE-DIRECTION-TOUCH | UNKNOWN | UNKNOWN | UNKNOWN | none | NOT-TESTABLE |
| TRADE-DIRECTION-NONTOUCH | UNKNOWN | UNKNOWN | UNKNOWN | none | NOT-TESTABLE |

- R8 Exactly one: `JUNE-XOB-SEPARATOR-PARTIAL` - one reading cannot be formed because the target case rows are unavailable (counts + OHLC + census + samples survive; per-row populations do not). This is offline evidence only and authorizes no EA gate. (Spelling of the FOUND option is the relay's own `JUNE-XOB-SEPARETOR-FOUND`; not used here.)
- R9 Boundary: B-104's EU `OFFLINE-SEPARATOR-NOT-FOUND` stands unchanged (different population, different outcome, no conflict). The four B-91 readings stay unreopened. No reading becomes an EA gate. No trade outcome graded. With the June comparison complete at PARTIAL, the next relay decides whether the XOB path has enough evidence for a planner design or remains parked (the row files for 2/4/5 June would need a fresh authorized diagnostic run to exist - never inferred or reconstructed).

## Part X - records

- X1 `PLANNER_CONTEXT.md` section 4 grep `B-105-JUNE-XOB-RULEDOUT-REVIEW` = 0 -> appended exactly one lesson (verified 1). No duplicate.
- X2 `PLANNER_HANDOFF.md` section 3 grep `B-105` = 0 -> appended `- B-105: reviewed existing June XOB rows for the 2 June and 4 June ruled-out cases beside 5 June valid; no gate or trade grade was performed.` (verified 1). No duplicate.
- X3 Ledger grep `B105-JUNE-XOB-RULEDOUT-REVIEW` = 0 and `^1250.` = 0 -> appended item `1250` (June inventory + hashes, OHLC provenance, three case classifications, four-reading matrix, comparison, R8, no edit/compile/run/gate/grade). `^1249.` = 1 beside. No duplicate.
- X4 Pointer 20 -> 20 lines (cap 35): latest B-105 MEASURED, PARTIAL decision, kept EA/EX5 unchanged, no compile or runs, no gate/grade, next follows the June comparison.

## Part F - file, push, reply

- F1 this result. F2 slice `BUILDER_SLICE_B105.md` (raw artifact checks, exact OHLC rows, case classifications, four-reading matrix, comparison, before/after lines; under 600 lines; no source diff, no run tables). F3 ledger 1250. F4 pointer per X4. F5 stages only the 6 relay files. F6 commit + push `builder/B-105` via `backup` + ls-remote check. Reply MEASURED.

## Final disk state (MEASURED turn; kept RKD build on disk, uncommitted)

- EA `137076D9CF85160AB8CD8379575AFD4801E71098CE97C0B10D88A42C7BF59671` (695359 B, LF-only, verified-kept; never edited this turn) + all prior `.preB*`/`.B*` copies kept uncommitted. EX5 `FA4C924978F6A1D5C57B725F2AB530BBB5DC5B1E0D1D0B51FB0172E80D8C41B5` (verified-kept). Indicator src/ex5 at gate SHAs, untouched. No compile, no launch, no tester run, no terminal/config/chart modification (analysis script `b104_measure.ps1` + prior artifacts unstaged). Strategy skill, journal CSV, register, spec untouched (all read-only; journal greps only). June agent CSVs remain absent (deleted B102, hashes filed); MQL5/Files XOBDIAG copies remain excluded (non-June/unknown provenance). No edit stands beyond the relay's text records.

No carried note (no STOP; nothing to ask him).
