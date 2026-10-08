# BUILDER RESULT B-106 - June XOB rows recovered for the ruled-out comparison, JUNE-XOB-ROWS-RECOVERED, RESTORED

Trader summary: B-105 proved the June counts and candle prices but had no rows to read. This relay reran the June diagnostic once, copied both files before any overwrite, and pulled every requested candle: 123 rows at the 2 June touch candle, 139 on the 4 June path plus 130 at the 09:55 fire, and 122/123/123 across the 5 June retest, confirmation and entry. The valid 5 June retest touches two of its own-direction zones; both ruled-out cases touch none of theirs. No gate, grade or rule change was made.

## Relay order (B-106, June recovery only)

- Part 0 fresh start on builder/B-105 at 409ceac0005aea7c4b9ad8ac0185cfb7f1cab3c7, both skills loaded whole first.
- Part B banking (no new rule words). Part K proven-diagnostic reapply + one compile per artifact. Part T one June run + immediate copy/hash/extract/classify + restore. Part R decision. Part X records (ledger 1251). Part F file + push builder/B-106 via backup.

## Part 0 - fresh-session start

- 0.1 Relay skill loaded whole first (67-line SKILL.md, known whole, untouched). Strategy skill loaded whole second (64 KB; consulted by grep, never edited).
- 0.2 `git ls-remote https://github.com/sirooj/srj-flow-nexus.git builder/B-105` = `409ceac0005aea7c4b9ad8ac0185cfb7f1cab3c7` (verified exact). Cut `builder/B-106` from it. Push via `backup`, never `origin`.
- 0.3 Read in order on `builder/B-105`: pointer (20 lines); RESULT_B105 head (98-line file, authored prior turn, unchanged); SLICE_B105 head (71-line file, authored prior turn, unchanged); RESULT_B104 section (103-line file, authored two turns ago, unchanged); RESULT_B102 T-section (84-line file, unchanged); PLANNER_CONTEXT section-4 tail (126-line file, B-105 lesson present); PLANNER_HANDOFF section-3 tail (66-line file, B-105 line present); relay SKILL.md whole; strategy SKILL.md whole (s178/B-70/B-91/JUN05NY lines re-verified by prior greps on identical bytes); spec v4.2 (35807 B, identical bytes, whole-reads carried); register (11072 B, identical bytes: A directions, C tester-only rows, B 5 June path); live sources verified via gate SHAs (restored-kept, zero diagnostic identifiers by grep); `USDJPY_DEMO_JUNE.ini` whole (19 lines: USDJPY M5, Model=4, InpDebugLog=true, FromDate 2026.06.01/ToDate 2026.06.13, unchanged); June launch pattern `launch_june0525_b101.ps1` whole (11 lines, mirrored into `launch_june0525_b106.ps1`).
- 0.4 Names per relay: export `SRJ_B96_DiagExport`; census `SrjB96DiagCensus`; copies `XOBDIAG_JUNE_FRESH.csv` / `XOBDIAG_JUNE_INCREMENTAL.csv`; cases 2 June 14:20 + 15:35 LONG (ruled out), 4 June 09:10 + 09:55 SHORT (ruled out), 5 June 16:00 + 16:10 + 16:15 LONG (valid); prior `JUNE-XOB-SEPARATOR-PARTIAL` item `1250`; this tag `B106-JUNE-XOB-ROWS-RECOVERY`, item `1251`; kept EA `137076D9CF85` / EX5 `FA4C924978F6` / indicator `956BF3E3ADB7` / EX5 `27B5F272DCFA`; verdict RESTORED.
- 0.5 Start gate: `git log -1` = `409ceac B-105 June XOB review for ruled-out cases beside 5 June valid (relay B-105)` (verified head). `git diff 409ceac0005aea7c4b9ad8ac0185cfb7f1cab3c7 --` EMPTY (every committed file named). `git status --short` = 414 lines (prior artifacts + `b104_measure.ps1`, preserved untouched). Kept prefixes verified (EA disk `137076d9...` LF-only / EX5 `fa4c924978f6...` / indicator disk `956bf3e3...` / EX5 `27b5f272...`). terminal64 count 0. terminal.ini content preserved (`terminal.ini.preB106` SHA ef713a7b, RECON62-leftover state) + full `Profiles.preB106` backup before edit/launch. June window confirmed before launch (terminal.ini [Tester] Symbol USDJPY, DateFrom 1779667200, DateTo 1781308800, Period M5, read back exact). No STOP.
- 0.6 Scope: proven reapply + one compile per artifact + one June run + immediate copy/extract/classify + restore + text records.

## Part B - banking

- B1 The current operator message contains the B-106 relay order only; it carries no new trading-rule words. Record `no new rule words`; appended nothing.

## Part K - restore the proven diagnostic only

- K1 B-105 gaps confirmed (RESULT_B105 R1/R2/R4): June counts + OHLC + census + samples survive; per-row CSVs absent (deleted post-B-101); 2/4/5 June readings UNKNOWN; counts/samples never substitute for populations (observed).
- K2 Backups `.preB106` before editing: EA `137076d9...` = `137076D9CF85` PASS; indicator `956bf3e3...` = `956BF3E3ADB7` PASS; kept EX5s live-verified alongside. Proceed, no STOP.
- K3 Reapplied EXACTLY the proven B-101 additions (`.B101FULLWINDOW` bytes verbatim: ind `45682CAB...`, EA `B5BE962A...`): dual files, calcPath, runPass, direction/startT/createT/hi/lo, promoT, validity, activation, promotion state, validationT, invalidationT, invalidation level, valid `B100Build` rendering, corrected row-derived counters, read-only EA census (tags stay `B101FRESH`/`B101INC`). No new field; no meaning changed.
- K4 Before compiling: raw contexts verified (indicator `void OnDeinit` tail / `OnCalculate` head / `g_bufXobPromoTime` publish + FVG-leg block; EA `OnInit` tail / `OnDeinit` pool-finalize block; call site re-read at indicator lines 1333-1334, identical to B-102). Complete diff vs `.preB106`: EA +159/-0 pure additions; indicator +103/-3 (98-line block + helpers + 2-line call + 3 whitespace-only brace re-indents). `.B106JUNE` copies = edited SHAs (EA disk+LF `b5be962a...`; indicator disk `45682cab...`, LF `d23c8621...`). Buffer publication 48/48 unchanged; zero gate/call-site lines added; verbs match (same verified families on identical bytes). No STOP.
- K5 Compiled exactly once per artifact, no retries: indicator ok=true 0 errors 0 warnings binary fresh; EA ok=true 0 errors 0 warnings binary fresh (6811 ms; `Result: 0 errors, 0 warnings`). Exact artifact SHAs (new B106 builds): EA EX5 `722a8175cedd4d72104e79afdf526a20fb601dfbfec0848cc23b439fc745bb6e` (475210 B); indicator EX5 `07a551937b81226310d8d793749355e2949d0eea22cdc3aba7df5382122f37f8` (240910 B). No STOP.

## Part T - June recovery only (evidence, NO trade grade)

- T1 Evidence recovery only. No valid/invalid trade graded anywhere in this relay.
- T2 Exact window: USDJPY M5, DateFrom `1779667200` / DateTo `1781308800` (5/25 start, graded 6/01-6/12), ini `USDJPY_DEMO_JUNE.ini` reused byte-identical (Model=4, InpDebugLog=true, InpMode=1); terminal.ini dates + Symbol read back exact; launch `launch_june0525_b106.ps1` (WMI pattern, CeilingMin 90, run `JUNE0525-B106`). No date/input change.
- T3 Before launch: terminal64 count 0; terminal.ini + Profiles content preserved; diag artifacts verified (EA src B5BE962A / ind src 45682CAB / EA EX5 722a8175 / ind EX5 07a55193); stale agent CSVs: none present (nothing removed, reported); wrapper WMI_PID=12388 RC=0; STATUS verified RUNNING PID 19120 same window (SWINGIMB 2026.05.25). Completion arrived as genuine wrapper DONE (RUN=JUNE0525-B106 RESULT=PASSED DONE=2026-10-08 21:34:34, full GATE block, this run's 740873 ticks/4320 bars, `Test passed in 0:06:24.773`). Owned deviations: wrapper kill + watcher start skipped again (the `resume` gap meant the run finished between turns; wrapper self-exited, PID 12388 gone; tighten stands: kill immediately post-verify). Run took 6:24 (over five minutes; reported, no timing STOP exists; same ticks/bars as B101's 5:06 - machine-load variance).
- T4 Copies BEFORE any other run (no second window launched): agent `XOBDIAG_FRESH.csv` -> `XOBDIAG_JUNE_FRESH.csv` (25334084 B, 181465 lines, SHA `cf83f50c5e46ea06b7ea0b139c1fd41835561ba47eeb6b78d42e599081f63bcd`); agent `XOBDIAG_INCREMENTAL.csv` -> `XOBDIAG_JUNE_INCREMENTAL.csv` (77909963 B, 534597 lines, SHA `6ec47f5d6ea550040f0add4f806d62f0d93c0e06c0b8ebdc89c523b8aa40d695`). Census (printed == recount both files): FRESH 2999 bars/181464 recs/maxPerBar 98 @05-22 23:25/first multi 05-08 14:10 n=3/adjacent id=2 (13:55->14:00)/promo 50134+248/inval 46954/states 0/1/0:12835 0/1/1:3661 0/0/0:30458 1/1/1:46473 1/1/0:88037; INC 4320 bars (= All weekday bars)/534596 recs/maxPerBar 162 @06-11 06:45/first multi 05-22 23:50 n=95/adjacent id=10 (23:50->23:55)/promo 146224+339/inval 110740/states 0/1/0:19021 0/1/1:5109 0/0/0:86610 1/1/1:141115 1/1/0:282741; PROV symMatch=1 perMatch=1 runPass 1/2 pathBad=0 both. Provenance: headers + rows `2026.10.08 21:25:54`, EA census `2026.10.08 21:26:07`, USDJPY/300, journal 21:34:11 Core 04, run JUNE0525-B106 PASSED. Counts match B101 June exactly (mechanism corroboration, never a cross-run claim). Targets preserved (`XOBDIAG_JUNE_TARGETS.csv`, 761 lines = 760 rows + header).
- T5 Requested populations (UTC; INC file; FRESH 0 on all six per disjoint mechanism; no nearby substitution - F3b 09:45 was never used for 09:55):
  - 2 June 14:20 (1780410000): 123 rows. Sample: `XOBDIAG;1780410000;10;B;156.82700000;156.51900000;1778254200;1778254500;NA;1;1;0;1778461200;NA;156.67300000;2026.10.08 21:25:54;INCREMENTAL;2` (id=10 persists, as in B101).
  - 4 June 09:10 (1780564200): 139 rows.
  - 4 June 09:55 (1780566900): 130 rows (first-ever extraction; B101 never pulled it).
  - 5 June 16:00 (1780675200): 122 rows.
  - 5 June 16:10 (1780675800): 123 rows (first-ever extraction).
  - 5 June 16:15 (1780676100): 123 rows (first-ever extraction).
  Full per-row field sets (objId/dir/hi/lo/startT/createT/promoT/valid/active/promoted/validationT/invalidationT/level/build/calcPath/runPass) preserved row-for-row in `XOBDIAG_JUNE_TARGETS.csv`. No timestamp NOT FOUND.
- T6 Offline classification from copied files only (relevance = promoted=1 + promoT present + promoT <= candle; validity at candle; touch = range intersect; row directions; full + trade-direction populations; no touch rejection; no 5m-bias aging; no kill-bar language). OHLC per B105 UJBARMAP (14:20 159.716-159.727; 09:10 159.866-159.888; 09:55 159.867-159.906; 16:00 159.726-160.262; 16:10 159.981-160.062; 16:15 160.022-160.082):

| case | counted candle | total rows | relevant-valid rows | touch rows | non-touch relevant rows | long rows | short rows | direction-side rows | provenance |
|---|---|---|---|---|---|---|---|---|---|
| 2 June ruled out | 06-02 14:20 | 123 | 30 | 0 | 30 | 95 | 28 | 30 (B) | JUNE INC runPass 2, build 21:25:54 |
| 4 June ruled out | 06-04 09:10 | 139 | 34 | 1 (id 3099 B) | 33 | 111 | 28 | 3 (S) | same |
| 4 June ruled out | 06-04 09:55 | 130 | 34 | 1 (id 3099 B) | 33 | 102 | 28 | 3 (S) | same |
| 5 June valid | 06-05 16:00 | 122 | 32 | 2 (ids 3150, 3308, both B) | 30 | 102 | 20 | 32 (B) | same |
| 5 June valid | 06-05 16:10 | 123 | 32 | 0 | 32 | 103 | 20 | 32 (B) | same |
| 5 June valid | 06-05 16:15 | 123 | 32 | 0 | 32 | 103 | 20 | 32 (B) | same |

Touch rows verified row-by-row (id 3099 zone 159.868-159.797 touches both 4 June candles at the 1-point edge 159.867-159.868; ids 3150/3308 zones 159.853-159.820 and 159.916-159.881 inside the wide 16:00 range). Owned script defect: the first classifier printed 5JUN1600 tdTouch/tdNon as 0/32; row-level verification + a clean rerun corrected it to 2/30 (all other cells identical across both runs; corrected values filed).
- T7 Four readings (MET/NOT MET/UNKNOWN + counts):
  - 2 June: ANY-DIRECTION-RELEVANT MET (30); TRADE-DIRECTION-RELEVANT (B) MET (30); TRADE-DIRECTION-TOUCH NOT MET (0); TRADE-DIRECTION-NONTOUCH MET (30).
  - 4 June 09:10: ANY MET (34); TD-REL (S) MET (3); TD-TOUCH NOT MET (0); TD-NONTOUCH MET (3).
  - 4 June 09:55: ANY MET (34); TD-REL (S) MET (3); TD-TOUCH NOT MET (0); TD-NONTOUCH MET (3).
  - 5 June 16:00: ANY MET (32); TD-REL (B) MET (32); TD-TOUCH MET (2); TD-NONTOUCH MET (30).
  - 5 June 16:10: ANY MET (32); TD-REL MET (32); TD-TOUCH NOT MET (0); TD-NONTOUCH MET (32).
  - 5 June 16:15: ANY MET (32); TD-REL MET (32); TD-TOUCH NOT MET (0); TD-NONTOUCH MET (32).
- T8 Rulings kept separate (quoted banked words, no conversion): 2 June `"there is no valid XOB retracement or touch there, so no setup ever forms for me"` + `"a touch I do not count"` (rows: 30 B-direction relevant-valid, 0 touched); 4 June `"at that candlestick there is not yet a valid bias for short, it is an invalid CQD divergence, and there is no retest of XOB in play."` (bias/CQD never XOB evidence; XOB rows: 3 S-direction relevant-valid per candle, 0 touched); 5 June 16:00 retest + 16:05 bullish flip + 16:10 confirmation + 16:15 open (5m flip never XOB evidence; XOB rows: 32 B-direction relevant-valid at 16:00 with 2 touched, 32/0 at 16:10 and 16:15). Row evidence is reported beside the words, never as the rule.
- T9 STOP checks: all 6 requested timestamps FOUND with rows; both copied-file hashes present; provenance well-formed (headers/rows/EA builds + sym/period + journal stamp + STATUS/DONE); lifecycle present both paths; no buffer/flow change; no grade; single window; compile+run OK. Proceed, no STOP.
- T10 Restored immediately: sources from `.preB106`; EX5s from kept-binary copies (`.preB96`, SHA-verified; same owned no-pre-compile-backup gap as B102); terminal.ini from `.preB106` content copy; Profiles from `Profiles.preB106`. Verified: EA src `137076D9CF85` / EA EX5 `FA4C924978F6` / indicator src `956BF3E3ADB7` / indicator EX5 `27B5F272DCFA` / terminal.ini pre-run `ef713a7b`. Restored sources grep 0 diagnostic identifiers. Copies, backups, `.B106JUNE` copies, launch scripts, STATUS/DONE, artifacts left unstaged. Leftover terminal64 PID 19120 reported (B-43: next launch handles).

## Part R - June evidence decision

- R1: June full census FOUND (printed==recount both paths). 2 June 14:20 full rows FOUND (123). 4 June 09:10 FOUND (139). 4 June 09:55 FOUND (130). 5 June 16:00 FOUND (122). 5 June 16:10/16:15 FOUND (123/123). Exact diagnostic hashes FOUND (sources B5BE962A/45682CAB; EX5s 722a8175/07a55193; copies cf83f50c/6ec47f5d). Lifecycle FOUND. Provenance FOUND.
- R2 Exactly one: `JUNE-XOB-ROWS-RECOVERED` - all required cases and exact artifacts are present.
- R3 Boundary: no XOB gate enabled; no trading rule changed; no trade graded; B-104 EU `OFFLINE-SEPARATOR-NOT-FOUND` unchanged; B-105 `JUNE-XOB-SEPARATOR-PARTIAL` updated only by this recovery (row populations now exist); a separate relay must classify the recovered June rows before any gate is considered.

## Part X - records

- X1 `PLANNER_CONTEXT.md` section 4 grep `B-106-JUNE-XOB-ROWS-RECOVERY` = 0 -> appended exactly one lesson (verified 1). No duplicate.
- X2 `PLANNER_HANDOFF.md` section 3 grep `B-106` = 0 -> appended `- B-106: recovered the June XOB row populations for the ruled-out and valid cases; no gate or trade grade was performed.` (verified 1). No duplicate.
- X3 Ledger grep `B106-JUNE-XOB-ROWS-RECOVERY` = 0 and `^1251.` = 0 -> appended item `1251` (source/artifact hashes, copied-file hashes+counts, six case populations, four readings, lifecycle/provenance, R2, restoration SHAs, no-gate/no-grade). `^1250.` = 1 beside. No duplicate.
- X4 Pointer 20 -> 20 lines (cap 35): latest B-106 RESTORED, RECOVERED decision, kept EA/EX5 restored, no gate/grade, next classifies the June rows.

## Part F - file, push, reply

- F1 this result. F2 slice `BUILDER_SLICE_B106.md` (raw contexts, diff, compile output, copied-file hashes, exact case rows, four readings, restoration SHAs, before/after lines; under 600 lines). F3 ledger 1251. F4 pointer per X4. F5 stages only the 6 relay files. F6 commit + push `builder/B-106` via `backup` + ls-remote check. Reply RESTORED.

## Final disk state (RESTORED turn; kept RKD build on disk, uncommitted)

- EA `137076D9CF85160AB8CD8379575AFD4801E71098CE97C0B10D88A42C7BF59671` (695359 B, LF-only, restored-verified) + `.preB106`/`.B106JUNE`/prior copies kept uncommitted. EX5 `FA4C924978F6A1D5C57B725F2AB530BBB5DC5B1E0D1D0B51FB0172E80D8C41B5` (restored-verified via .preB96 copy). Indicator src/ex5 restored-verified. terminal.ini restored-verified (`ef713a7b`, RECON62-leftover pre-run state). Strategy skill, journal CSV, register, spec untouched. Leftover terminal64 PID 19120 reported, not reinterpreted. Copies, backups, launch scripts, STATUS/DONE, artifacts unstaged. No edit stands beyond the relay's text records.

No carried note (no STOP; nothing to ask him).
