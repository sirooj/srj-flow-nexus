# BUILDER SLICE B-106 - contexts, diff, compile, hashes, case rows, readings, restoration (June recovery, RESTORED)

Scope: proven-diagnostic reapply + one compile per artifact + one June run + immediate copy/extract/classify + restore. No gate, no grade, no second window. Live files only.

## START GATE (raw)

- `git ls-remote ... builder/B-105` = `409ceac0005aea7c4b9ad8ac0185cfb7f1cab3c7` (verified; cut builder/B-106 here).
- `git log -1` = `409ceac B-105 June XOB review for ruled-out cases beside 5 June valid (relay B-105)`.
- `git status --short` line count = 414 (prior artifacts + b104_measure.ps1; preserved, untouched).
- `git diff 409ceac0005aea7c4b9ad8ac0185cfb7f1cab3c7 --` EMPTY on every committed file named.
- EA disk `137076d9cf85160ab8cd8379575afd4801e71098ce97c0b10d88a42c7bf59671` LF same (LF-only). EX5 `fa4c924978f6...`. Indicator disk `956bf3e3...` / EX5 `27b5f272...`.
- terminal64 count 0 before edit/compile/launch. terminal.ini content preserved (`terminal.ini.preB106` ef713a7b) + full `Profiles.preB106` backup. June window set + read back (USDJPY 1779667200/1781308800 M5). No STOP.

## PART B GREPS (before/after)

- Operator message = B-106 relay order only; no new trading-rule words. Record `no new rule words`; appended nothing.
- `B-106-JUNE-XOB-ROWS-RECOVERY` in 99_WORKFLOW 0->1 (context X1). `B-106` in 99_WORKFLOW 0->1 (handoff X2).
- `B106-JUNE-XOB-ROWS-RECOVERY` in SRJ_FlowNexus_Local 0->1 (ledger 1251). `^1251.` 0->1; `^1250.` = 1 beside.

## K1 GAPS (B-105 quoted)

- June counts + OHLC + census + samples survive; per-row CSVs absent (deleted post-B-101); 2/4/5 June readings UNKNOWN; counts/samples never substitute (observed).

## RAW CONTEXTS (pre-edit `.preB106` = kept; edited = `.B101FULLWINDOW` bytes)

- Indicator `void OnDeinit` tail (SWINGIMB census + DeleteAllObjects/PanelsDestroy) -> dual-file block + helpers inserted after; `OnCalculate` head unchanged; publish site re-read live at lines 1333-1334 (`//--- [B100-DIAG] snapshot...` + `SRJ_B100_DiagExport(target, time, rates_total, barClosed, prevCalc);` after `g_bufXobPromoTime` publish, before FVG-leg block).
- EA `OnInit` tail (ORIGIN_MANIFEST + `return INIT_SUCCEEDED;`) -> census function inserted after; `OnDeinit` pool-finalize (`SrjSelEndOfRun`, `SrjUjPoolFinalize()`) -> dual `SrjB96DiagCensus` calls (`InpDebugLog`-gated, tags `B101FRESH`/`B101INC`) before handle release.

## DIFF (vs `.preB106`, complete; full text recoverable from on-disk pairs)

- EA +159/-0 pure additions (census incl. transition+final-close fix + dual calls). Indicator +103/-3 (98-line block + helpers + 2-line call + 3 whitespace-only brace re-indents).
- `.B106JUNE` = `.B101FULLWINDOW` SHAs exactly (EA disk+LF `b5be962a...`; indicator disk `45682cab...`, LF `d23c8621...`).
- Buffer publication 48/48 unchanged; zero gate/call-site lines added (8 diag identifier hits = 4 defs + 4 calls). Verbs match (verified families on identical bytes).

## BACKUPS + COMPILE (raw)

- `.preB106` SHAs: EA `137076d9...` / indicator `956bf3e3...` (= kept). No pre-compile EX5 backup (owned gap, same as B102; kept binaries via identical `.preB96` copies, SHA-verified).
- Indicator compile: ok=true, 0 errors, 0 warnings, binary fresh (240910 B). EA compile: ok=true, 0 errors, 0 warnings, binary fresh, 6811 ms (`Result: 0 errors, 0 warnings`). One attempt each, no retries.
- B106 diag EX5 SHAs: EA `722a8175cedd4d72104e79afdf526a20fb601dfbc0848cc23b439fc745bb6e`; indicator `07a551937b81226310d8d793749355e2949d0eea22cdc3aba7df5382122f37f8`.

## JUNE0525-B106 RUN (USDJPY M5 1779667200/1781308800, PASSED)

- ini `USDJPY_DEMO_JUNE.ini` byte-identical; wrapper WMI_PID=12388 RC=0; STATUS PID 19120 same window (SWINGIMB 2026.05.25); 740873 ticks/4320 bars; `Test passed in 0:06:24.773` (over 5 min, reported, no timing STOP); EA stamp 21:34:11.601; DONE genuine (RUN/RESULT/DONE + full GATE block; wrapper self-exited, PID 12388 gone).
- Owned deviations: wrapper kill + watcher start skipped again (`resume` gap; run finished between turns); tighten stands (kill immediately post-verify). Stale agent CSVs: none present (nothing removed).

## COPIED FILES (before any second run; no RECON62/second window launched)

- `XOBDIAG_JUNE_FRESH.csv`: 25334084 B, 181465 lines, SHA `cf83f50c5e46ea06b7ea0b139c1fd41835561ba47eeb6b78d42e599081f63bcd`.
- `XOBDIAG_JUNE_INCREMENTAL.csv`: 77909963 B, 534597 lines, SHA `6ec47f5d6ea550040f0add4f806d62f0d93c0e06c0b8ebdc89c523b8aa40d695`.
- `XOBDIAG_JUNE_TARGETS.csv`: 761 lines (760 rows + header).
- Census printed==recount: FRESH 2999/181464/98@05-22 23:25/multi 05-08 n=3/adj id=2/promo 50134+248/inval 46954; INC 4320/534596/162@06-11 06:45/multi 05-22 n=95/adj id=10/promo 146224+339/inval 110740; PROV 1/1 runPass 1/2 pathBad=0. Builds header+row 21:25:54, EA 21:26:07. USDJPY/300. Journal 21:34:11 Core 04. Counts match B101 June exactly.

## CASE ROWS (UTC; INC file; FRESH 0 all six; F3b 09:45 never substituted)

- 2 June 14:20 (1780410000): 123 rows. Sample id=10 row: `XOBDIAG;1780410000;10;B;156.82700000;156.51900000;1778254200;1778254500;NA;1;1;0;1778461200;NA;156.67300000;2026.10.08 21:25:54;INCREMENTAL;2`.
- 4 June 09:10 (1780564200): 139 rows. Touch row id 3099: `XOBDIAG;1780564200;3099;B;159.86800000;159.79700000;1780558800;1780559100;1780560900;1;1;1;1780559100;NA;159.83250000;2026.10.08 21:25:54;INCREMENTAL;2` (1-point edge touch 159.867-159.868).
- 4 June 09:55 (1780566900): 130 rows (first-ever extraction). Touch row id 3099, same zone.
- 5 June 16:00 (1780675200): 122 rows. Touch rows id 3150 (`159.853-159.820`, promoT 1780589100, valid) + id 3308 (`159.916-159.881`, promoT 1780674000, valid), both B.
- 5 June 16:10 (1780675800): 123 rows (first-ever). 5 June 16:15 (1780676100): 123 rows (first-ever).
- Full field sets preserved row-for-row in `XOBDIAG_JUNE_TARGETS.csv`. No timestamp NOT FOUND.

## CLASSIFICATIONS (relevance = promoted=1 + promoT<=candle; touch = range intersect; row dirs)

- 2JUN1420 (B): total 123, 95B/28S, rel 31, relV 30, touch 0, nontouch 30, td 30/0/30.
- 4JUN0910 (S): 139, 111B/28S, rel 39, relV 34, touch 1, nontouch 33, td 3/0/3.
- 4JUN0955 (S): 130, 102B/28S, rel 36, relV 34, touch 1, nontouch 33, td 3/0/3.
- 5JUN1600 (B): 122, 102B/20S, rel 32, relV 32, touch 2, nontouch 30, td 32/2/30.
- 5JUN1610 (B): 123, rel 32, relV 32, touch 0, nontouch 32, td 32/0/32.
- 5JUN1615 (B): 123, rel 32, relV 32, touch 0, nontouch 32, td 32/0/32.
- Owned script defect: first classifier printed 5JUN1600 tdTouch/tdNon 0/32; row-level verification + clean rerun corrected to 2/30 (all other cells identical; filed values are the corrected ones).

## FOUR READINGS (counts = rows)

- 2 June: ANY MET (30); TD-REL (B) MET (30); TD-TOUCH NOT MET (0); TD-NONTOUCH MET (30).
- 4 June 09:10: ANY MET (34); TD-REL (S) MET (3); TD-TOUCH NOT MET (0); TD-NONTOUCH MET (3).
- 4 June 09:55: ANY MET (34); TD-REL (S) MET (3); TD-TOUCH NOT MET (0); TD-NONTOUCH MET (3).
- 5 June 16:00: ANY MET (32); TD-REL (B) MET (32); TD-TOUCH MET (2); TD-NONTOUCH MET (30).
- 5 June 16:10: ANY MET (32); TD-REL MET (32); TD-TOUCH NOT MET (0); TD-NONTOUCH MET (32).
- 5 June 16:15: ANY MET (32); TD-REL MET (32); TD-TOUCH NOT MET (0); TD-NONTOUCH MET (32).
- Rulings beside (never as): 2 June no-retracement-or-touch words (30 B relV, 0 touched); 4 June three reasons with bias/CQD excluded (3 S relV per candle, 0 touched); 5 June path with flip excluded (32 B relV at 16:00, 2 touched; 32/0 at 16:10/16:15).

## RESTORATION (T10, byte-verified)

- EA src `137076d9...` / EA EX5 `fa4c924978f6...` (via `.preB96`) / indicator src `956bf3e3...` / indicator EX5 `27b5f272...` (via `.preB96`) / terminal.ini `ef713a7b` (pre-run SHA) / Profiles content restored.
- Restored sources grep 0 diagnostic identifiers. Leftover terminal64 PID 19120 reported (B-43). Nothing diagnostic staged.

## RECORD LINES (exact)

- X1 context §4 appended once: `- B-106-JUNE-XOB-ROWS-RECOVERY (planner lesson 2026-10-08, B-106): recovered the deleted June XOB row populations for the 2 June, 4 June and 5 June cases without enabling a trading gate.`
- X2 handoff §3 appended once: `- B-106: recovered the June XOB row populations for the ruled-out and valid cases; no gate or trade grade was performed.`
- X3 ledger `1251.` appended once (tag `B106-JUNE-XOB-ROWS-RECOVERY`; hashes, counts, populations, readings, lifecycle/provenance, R2, restoration, no-gate/no-grade).
- X4 pointer 20->20 lines (cap 35): latest B-106 RESTORED; RECOVERED; kept EA/EX5 restored; no gate/grade; next classifies June rows.
- Pre-commit re-check: X1/X2/X3 counts 1; `^1250.` = 1; staged set = 6 relay files only; no source diff; no run tables.
- R2: `JUNE-XOB-ROWS-RECOVERED` - all required cases and exact artifacts present.

(End of slice)
