# BUILDER SLICE B-102 - contexts, diff, compile, hashes, EU rows, corrected counts, provenance, restoration (RECON62 recovery, RESTORED)

Scope: proven-B-101-diagnostic reapply + one compile per artifact + one RECON62 run + immediate EU extraction + exact SHA capture + restore. No gate, no grade, no June. Live files only.

## START GATE (raw)

- `git ls-remote ... builder/B-101` = `87e3474508cede6539ac5abfc6d17ebd3b2a60b0` (verified; cut builder/B-102 here).
- `git log -1` = `87e3474 B-101 full-window XOB census on RECON62 and June, counters fixed and verified (relay B-101)`.
- `git status --short` line count = 400 (prior artifacts; preserved, untouched).
- `git diff 87e3474508cede6539ac5abfc6d17ebd3b2a60b0 --` EMPTY on every committed file named.
- EA disk `137076d9cf85160ab8cd8379575afd4801e71098ce97c0b10d88a42c7bf59671` LF same (0 CR, LF-only). Indicator disk `956bf3e3adb7064dad89a0d2f97bfcac6d706e40e39b6817efb29f1a04418342` LF `5f31118e6f51cc6700ce267cceec5042b5894952ebff69cb4b2570ab90622a39` (1467 CR). EX5s `FA4C924978F6...` / `27B5F272DCF...` live-verified.
- Live sources zero diagnostic identifiers (grep `SRJ_B96_Diag|SRJ_B100_|XOBDIAG|B101FRESH|B101INC|SrjB96Diag` = 0).
- terminal.ini pre-run `4a98dd481bd1f6630a9c33f65c59d8bf459bf4e8243b6611e7b93d166cb123bd` (June-window state; content copy `terminal.ini.preB102` + full `Profiles.preB102` backup before edit/launch).
- terminal64 count 0 before edit/compile/launch. No STOP.

## PART B GREPS (before/after)

- Operator message = B-102 relay order only; no new trading-rule words. Record `no new rule words`; appended nothing.
- `B-102-RECON62-COVERAGE-HASHES` in 99_WORKFLOW 0->1 (context X1). `B-102` in 99_WORKFLOW 0->1 (handoff X2).
- `B102-RECON62-COVERAGE-HASHES` in SRJ_FlowNexus_Local 0->1 (ledger 1247). `^1247.` 0->1; `^1246.` = 1 beside.

## K1 GAPS (B-101 quoted)

- RECON62 census complete (FRESH 2999/190906, INC 3168/346246). EU candle-level rows UNKNOWN (files superseded by June run). Diag EX5 SHAs uncaptured (journal sizes 475312/240115 substituted). June not rerun in B-102.

## RAW CONTEXTS (pre-edit `.preB102`, by text)

- Indicator 841-849 `void OnDeinit`: SWINGIMB_CENSUS PrintFormat + `SRJ_DeleteAllObjects(); SRJ_Panels_Destroy();` (insertion point: B100 dual-file block + helpers after line 849).
- Indicator 851-860 `int OnCalculate` head (rates_total/prev_calculated/time/open/high/low/close...; insertion uses `target,time,rates_total,barClosed,prevCalc` at the publish site).
- Indicator 1225-1234 `g_bufXobPromoTime[target]` publish block + `}` closers (call `SRJ_B100_DiagExport(target, time, rates_total, barClosed, prevCalc)` inserted after; 3 closers re-indented one space - whitespace only).
- Indicator 1236-1247 FVG-leg block head (`g_bufFvgLegZoneHigh/Low`, `g_bufFvgObjId = 0.0`, `currentLegHasXOB` gate; untouched).
- EA 11560-11570 `OnInit` tail (ORIGIN_MANIFEST prints + `return INIT_SUCCEEDED;`; census function inserted after).
- EA 11871-11885 `OnDeinit` pool-finalize block (`SrjSelEndOfRun`, `SrjUjPoolFinalize()`; dual `SrjB96DiagCensus("XOBDIAG_FRESH.csv","B101FRESH","FRESH")` + INC calls inserted `InpDebugLog`-gated before handle release).

## DIFF (vs `.preB102`, complete; full text recoverable from on-disk `.preB102`/`.B102RECON62` pairs)

- EA +159/-0 pure additions (census incl. transition+final-close counter fix + dual OnDeinit calls). Indicator +103/-3 (98-line dual-file block + helpers + 2-line export call + 3 whitespace-only brace re-indents; B-101 "+100/-0" shorthand corrected).
- `.B102RECON62` = `.B101FULLWINDOW` SHAs exactly (indicator `45682cab...`, EA `b5be962a...`; LF indicator `d23c8621...`, EA LF-only identical).
- Buffer publication 6/6 unchanged; EA adds zero gate/call-site lines. Verbs: header `%s;%d;%d;%s;%I64d;%s;%s` vs (str,int,int,str,long,str,str); row `XOBDIAG;%I64d;%I64d;%s;%s;%s;%s;%s;%s;%d;%d;%d;%s;%s;%s;%s;%s;%s` vs (long,long,str x6,%d x3,str x6 incl builds/paths, nf<18 guard); census `%I64d/%s/%d` vs (long/str/int). All match.

## BACKUPS + COMPILE (raw)

- `.preB102` SHAs: indicator `956bf3e3...` / EA `137076d9...` (= required kept SHAs). No pre-compile EX5 backup taken (owned gap; kept binaries recovered via identical `.preB96` copies, SHA-verified).
- Indicator compile: ok=true, 0 errors, 0 warnings, binary fresh (`SRJ_FlowLogic.ex5` 240384 B). EA compile: ok=true, 0 errors, 0 warnings, binary fresh, 6862 ms (`SRJ_FlowNexus_EA.ex5` 474474 B; Result line: `0 errors, 0 warnings`). One attempt each, no retries.
- Exact diag artifact SHAs (B-101 gap closed): EA EX5 `4eeed526bdafff9c8bb2623dbf4203564ad9a773105629ed76eb7493e63154b9`; indicator EX5 `f8d85ea96ec36e5426f8549a949631b954b821897d2db1d861ed8a1c2851aee5`.

## RECON62-B102 RUN (EURUSD M5 1787702400/1788998400, PASSED)

- ini `RECON50_DEMO_USD.ini` byte-identical (j43 baseline); terminal.ini dates+Symbol read back exact; wrapper WMI_PID=24200 RC=0; STATUS PID 23332 same window; 563338 ticks/3168 bars; `Test passed in 0:04:58.531`; EA stamp 20:42:51.890; DONE genuine (RUN/RESULT/DONE + full GATE block; wrapper self-exited, PID 24200 gone).
- Owned deviation: RAM-order wrapper kill + tail-watcher start skipped after STATUS verify (his detection remark arrived mid-run; completion already DONE-genuine at next check). Tighten: kill wrapper + start watcher immediately post-verify.
- Agent June files recorded (FRESH 8fc753ae 25334084 B / INC c304cabb 77909963 B; June evidence filed B-101) then cleaned for clean provenance.

## COPIED FILES (before any second run; no June launched)

- `XOBDIAG_RECON62_FRESH.csv`: 25532783 B, 190907 lines, SHA `4487afe3a3ea6cd0a8fbaf7ff595daa55a8ed11e161d161a11f873ce4824c8fc`.
- `XOBDIAG_RECON62_INCREMENTAL.csv`: 48497150 B, 346247 lines, SHA `12f08bd09960d8a4e7a0c79be2b3376228d25e201986f4f62f5d68c01671b43b`.
- `XOBDIAG_RECON62_EU_TARGETS.csv`: 1446 lines (1445 target rows + header), row format `srcFile;barT;objId;dir;hi;lo;startT;createT;promoT;valid;active;promoted;validationT;invalidationT;invalidationLevel;build;calcPath;runPass`.
- Producing artifacts: EA src B5BE962A / ind src 45682CAB / EA EX5 4eeed526 / ind EX5 f8d85ea9. Builds header+row `2026.10.08 20:34:34`, EA `2026.10.08 20:34:52`. EURUSD/300/window 1787702400-1788998400.

## CORRECTED COUNTS (copied-file recount; printed EA census identical both files)

- FRESH: bars 2999 / recs 190906 / maxPerBar 119 @2026-08-25 08:00 UTC / first multi 2026-08-11 14:05 n=2 / adjacent id=1 (13:55->14:00, 300 s) / promo 59081+230 / inval 57112 / states 0/1/0:12717 0/1/1:3204 0/0/0:41191 1/1/1:55877 1/1/0:77917 / PROV 1/1 runPass=1 pathBad=0.
- INC: bars 3168 (11 weekday x 288) / recs 346246 / maxPerBar 128 @2026-09-08 02:25 UTC (also max multi bar) / first multi 2026-08-25 23:50 n=110 / adjacent id=189 (23:50->23:55, 300 s) / promo 117339+239 / inval 90417 / states 0/1/0:13612 0/1/1:3575 0/0/0:73230 1/1/1:113764 1/1/0:142065 / PROV 1/1 runPass=2 pathBad=0.

## EU COUNTED CANDLES (UTC; all INC file; FRESH 0 each per disjoint-coverage mechanism)

- A1 2026-08-28 09:55 (1787910900): 112 rows, B:64/S:48, valid 82, promo 36, ids 189-2173.
- A2 2026-09-01 16:45 (1788281100): 110 rows, B:49/S:61, valid 82, promo 37, ids 189-2549.
- A2 2026-09-01 17:25 (1788283500): 112 rows, B:50/S:62, valid 81, promo 39, ids 189-2551.
- A3 2026-09-03 15:40 (1788450000): 102 rows, B:50/S:52, valid 75, promo 34, ids 189-2864.
- A3 2026-09-03 15:50 (1788450600): 103 rows, B:51/S:52, valid 75, promo 34, ids 189-2867.
- A4 2026-09-07 09:00 (1788771600): 118 rows, B:56/S:62, valid 85, promo 38, ids 189-3132.
- A4 2026-09-07 09:10 (1788772200): 118 rows, B:57/S:61, valid 85, promo 38, ids 189-3133.
- A5 2026-09-07 16:05 (1788797100): 116 rows, B:61/S:55, valid 87, promo 41, ids 189-3183.
- A5 2026-09-07 16:35 (1788798900): 119 rows, B:62/S:57, valid 88, promo 41, ids 189-3187.
- A6 2026-09-08 10:00 (1788861600): 113 rows, B:62/S:51, valid 84, promo 41, ids 189-3297.
- A7 2026-09-08 16:50 (1788886200): 109 rows, B:54/S:55, valid 80, promo 38, ids 189-3340.
- C-1530 2026-09-01 15:25 (1788276300): 111 rows, B:50/S:61, valid 84, promo 37, ids 189-2539.
- F2 2026-08-26 16:25 (1787761500): 102 rows, B:65/S:37, valid 73, promo 35, ids 189-1893.
- All builds `2026.10.08 20:34:34`, calcPath INCREMENTAL runPass 2. Object 189 on every candle (within-run persistence only). Sample (A1 first row): `XOBDIAG;1787910900;189;B;1.15612000;1.15500000;1786551000;1786551600;1786717500;1;1;1;1786716900;NA;1.15556000;2026.10.08 20:34:34;INCREMENTAL;2`.
- Nothing NOT FOUND; nothing inferred from a nearby candle.

## PROVENANCE ROWS (exact, journal 20:42:51.890 Core 04)

- `B101FRESH_FILE bars=2999 recs=190906 maxPerBar=119 atBar=2026.08.25 08:00 headerSym=EURUSD headerPer=300 headerBuild=2026.10.08 20:34:34 eaBuild=2026.10.08 20:34:52 pathBad=0`
- `B101FRESH_MULTI bar=2026.08.11 14:05 n=2 ex=XOBDIAG;1786457100;1;B;...` (ids 1/3)
- `B101FRESH_ADJACENT id=1 t1=2026.08.11 13:55 t2=2026.08.11 14:00 diffSec=300`
- `B101FRESH_PROMO rows=59081 atBar=230 ...` / `B101FRESH_INVAL rows=57112 ...` / `B101FRESH_PROV ... symMatch=1 ... perMatch=1 runPass=1`
- `B101INC_FILE bars=3168 recs=346246 maxPerBar=128 atBar=2026.09.08 02:25 headerSym=EURUSD headerPer=300 headerBuild=2026.10.08 20:34:34 eaBuild=2026.10.08 20:34:52 pathBad=0`
- `B101INC_MULTI bar=2026.08.25 23:50 n=110 ex=XOBDIAG;1787701800;189;B;1.15612000;1.15500000;...`
- `B101INC_ADJACENT id=189 t1=2026.08.25 23:50 t2=2026.08.25 23:55 diffSec=300`
- `B101INC_PROMO rows=117339 atBar=239 ...` / `B101INC_INVAL rows=90417 ...` / `B101INC_PROV ... symMatch=1 ... perMatch=1 runPass=2`
- Census tags read `B101FRESH/B101INC` (code is verbatim B-101; documented, not a new run).

## RESTORATION (T8, byte-verified)

- EA src `137076d9...` / EA EX5 `fa4c924978f6...` (via `.preB96` copy) / indicator src `956bf3e3...` (LF `5f31118e...`) / indicator EX5 `27b5f272...` (via `.preB96` copy) / terminal.ini `4a98dd48` (pre-run June-window SHA) / Profiles content restored.
- Restored sources grep 0 diagnostic identifiers. Leftover terminal64 PID 23332 reported (B-43). Nothing diagnostic staged.

## RECORD LINES (exact)

- X1 context section 4 appended once: `- B-102-RECON62-COVERAGE-HASHES (planner lesson 2026-10-08, B-102): recovered RECON62 counted-candle XOB rows and exact diagnostic artifact hashes without enabling a trading gate.`
- X2 handoff section 3 appended once: `- B-102: recovered RECON62 counted-candle XOB rows and exact diagnostic hashes; no gate or trade grade was performed.`
- X3 ledger `1247.` appended once (tag `B102-RECON62-COVERAGE-HASHES`; SHAs, sizes, EU table, counts, provenance, R2, restoration, no gate/grade, owned deviations).
- X4 pointer 20->20 lines (cap 35): latest B-102 RESTORED; PROVEN; artifacts restored; no gate/grade; June not rerun; next reviews recovered EU rows.
- Pre-commit re-check: X1/X2/X3 counts 1; `^1246.` = 1; staged set = 6 relay files only; no source diff; no trade grade.
- R2: `RECON62-COVERAGE-AND-HASHES-PROVEN` - 13/13 EU candles extracted, exact diag hashes captured, census complete.

(End of slice)
