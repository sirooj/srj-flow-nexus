# BUILDER SLICE B-101 - contexts, diff, compile, window evidence, corrected counts, provenance, coverage, restoration (full-window census, RESTORED)

Scope: proven-diagnostic reapply + counter fix + one compile per artifact + RECON62 run + June run + offline extraction + restore. No gate change, no trade grade. Live files only.

## START GATE (raw)

- `git ls-remote ... builder/B-100` = `1dfdad0a89eb22fc1e65d24b4053edc0c4d9c28d` (verified; cut builder/B-101 here).
- `git log -1` = `1dfdad0a89eb22fc1e65d24b4053edc0c4d9c28d B-100 recalc identity proven within source across fresh and incremental paths (relay B-100)`.
- `git status --short` line count = 389 (B-100 artifacts added; preserved, untouched).
- `git diff 1dfdad0a... --` EMPTY on: pointer, RESULT/SLICE B100, RESULT/SLICE B99, RESULT/SLICE B98, RESULT/SLICE B97, RESULT/SLICE B96, PLANNER_CONTEXT, PLANNER_HANDOFF.
- EA `137076D9CF85...` / EX5 `FA4C924978F6...` / indicator src `956BF3E3ADB7...` / EX5 `27B5F272DCF...` (prefixes match; LF-normalized identical).
- Live sources contain zero diagnostic identifiers (restored state; matches only in `.B96XOBEXPORT`/`.B97PROV`/`.B100RECALCID` copies).
- terminal.ini pre-run `EACA0870...` lineage noted below (`.preB101` raced the RECON62 date edit — owned parallel-call defect; end-state restored to lineage-verified narrow SHA instead).
- terminal64 count 0 before edit/compile/launch. No STOP.

## PART B GREPS (before/after)

- Operator message = B-101 relay order only; no new trading-rule words. Record `no new rule words`; appended nothing.
- `B-101-XOB-FULLWINDOW-CENSUS` in 99_WORKFLOW 0→1 (context X1). `B-101` in 99_WORKFLOW 0→1 (handoff X2).
- `B101-XOB-FULLWINDOW-CENSUS` in SRJ_FlowNexus_Local 0→1 (ledger 1246). `^1246.` 0→1; `^1245.` = 1 beside.

## K1 SCOPE (B-100 quoted)

- Paths genuine (prevCalc==0 replay vs continuation ticks, one run); 73 composite keys, 72 field-identical + 1 lawful invalidation; provenance/lifecycle passed; N+1 counter defect owned and fixed here, never reused.

## RAW CONTEXTS (by text; B-100 regions re-verified by K2 SHAs)

- Dual-file block + `SRJ_B100_DiagWritePath` (per-path statics/rewrite guards) + `SRJ_B100_DiagExport(target,time,rates_total,barClosed,prevCalc)`; call after `:1234` publish inside `if(target>=0)`.
- Parameterized census (`fname/tag/path`, `nf<18`, pathBad counter, runPass print) + dual `OnDeinit` calls (`B101FRESH`/`B101INC`, `InpDebugLog`-gated).
- Counter fix: bars increment on transition-close + final-close only (first-line `else bars++` deleted).

## DIFF (vs `.preB101`, complete)

- Indicator +100/-0 (dual-file block + helpers + call). EA +159/-0 (census incl. fix + calls).
- `.B101FULLWINDOW` copies = edited SHAs (indicator `45682CAB...`, EA `B5BE962A...`; LF-only).
- Verb check: header `%s;%d;%d;%s;%I64d;%s;%s` ✓; rows +`;%s;%s` ✓; census `%I64d`/`%s`/`%d` ✓. Additions only — buffers/selector/lifecycle/gates/handles untouched.

## BACKUPS + COMPILE (raw)

- `.preB101` SHAs: indicator `956BF3E3...` / EA `137076D9...` (= required full SHAs).
- Indicator compile: ok=true, 0 errors, 0 warnings, binary fresh. EA compile: ok=true, 0 errors, 0 warnings.
- One attempt each, no retries. Journal artifact-load lines: EA ex5 475312 B / FlowLogic ex5 240115 B, identical both runs (diag-ex5-SHA capture gap owned; sizes substitute).

## RECON62 EVIDENCE (EURUSD 8/26-9/9, PASSED; EA stamp 19:52:15.981)

- FRESH: bars=2999 / recs=190906 / maxPerBar=119@08-25 / first multi 08-11 n=2 / adjacent id=1 / promo 59081+230 / inval 57112 / pathBad=0 / PROV 1/1 runPass=1.
- INC: bars=3168 / recs=346246 / maxPerBar=128@09-08 / first multi 08-25 n=110 / adjacent id=189 / promo 117339+239 / inval 90417 / pathBad=0 / PROV 1/1 runPass=2.
- Builds valid both files. Counts via fix-verified mechanism (files superseded by June run — documented lifecycle).
- Launch: ini `RECON50_DEMO_USD.ini` (j43 baseline, byte-identical); terminal.ini dates read back exact; wrapper PID 22388 RC=0; STATUS verified (PID 14432); wrapper killed; watcher PID 17852 verified; DONE ≤60 s.

## JUNE EVIDENCE (USDJPY 5/25-6/12, PASSED 20:07:07; EA stamp 20:06:50.896)

- FRESH: bars=2999 / recs=181464 / maxPerBar=98@05-22 / first multi 05-08 n=3 / adjacent id=2 / promo 50134+248 / inval 46954 / pathBad=0 / PROV 1/1 runPass=1.
- INC: bars=4320 / recs=534596 / maxPerBar=162@06-11 / first multi 05-22 n=95 / adjacent id=10 / promo 146224+339 / inval 110740 / pathBad=0 / PROV 1/1 runPass=2.
- Direct recount VERIFIES fix (printed==row-derived: 2999, 4320). Per-day: 05-22 tail 2 bars; 05-25..06-11 full 288 ×14; 06-12 286 bars (final 2 forming bars absent at test end); weekends absent. Every window weekday has rows.
- State splits (rows): FRESH notProm 131330/inval 46954/live 46473; INC notProm 388372/inval 110740/live 141115 (overlapping categories, documented).
- Leftover terminal64 PID 14432 stopped by PID before June launch (B-43); agent CSVs cleaned. Launch `launch_june0525_b101.ps1` (ini `USDJPY_DEMO_JUNE.ini`, CeilingMin 90); wrapper PID 4016 RC=0; STATUS verified (PID 22396); wrapper killed; watcher PID 20024 verified; DONE ≤60 s.

## COUNTED CANDLES (server epochs via 1779373200@05-21-14:20 anchor; INC file)

- B1 1780652700:137 / B2 1780675200:122 / B3a 1781186700:160 / B3b 1781188200:159 / C3 1780477200:139 / F1 1780410000:123 / F3a 1780564200:139 / F3b 1780566300:131 / F4 1781105400:153 rows (FRESH 0 each — window bars arrive via incremental ticks, B-100 disjoint finding).
- Samples (id=10 B;1;1;0 + id=17 S;0;0;0 identical at 6/2, 6/5, 6/11): within-run persistence, never a cross-run claim.
- EU candles: window-level FOUND (INC 3168 distinct bars with rows ≈ 3168 window weekday bars; max 128 + multi n=110 on counted dates 09-08/08-25); candle-level UNKNOWN (files superseded).

## PROVENANCE ROWS (exact)

- June header + rows carry per-path builds; `PROV symMatch=1 perMatch=1` both files; `pathBad=0` both.
- `HEADER;USDJPY;300;106332;2026.10.08 18:27:06;1735776000` (B-97 format reference; B-101 headers verified via census `headerBuild`).

## RESTORATION (T7, byte-verified)

- Sources + EX5s + terminal.ini: EA src `137076D9...` / EA ex5 `FA4C924978F6...` / indicator src `956BF3E3...` / indicator ex5 `27B5F272...` / terminal.ini `EACA0870...` (lineage-verified narrow state; `.preB101` raced post-edit — owned, documented).
- Leftover terminal64 PID 22396 reported (B-43: next launch handles). Nothing diagnostic staged.

## RECORD LINES (exact)

- X1 context §4 appended once: `- B-101-XOB-FULLWINDOW-CENSUS (planner lesson 2026-10-08, B-101): extended the proven diagnostic export across RECON62 and June windows with corrected row-derived counts; no trading gate was enabled.`
- X2 handoff §3 appended once: `- B-101: extended the proven XOB diagnostic across RECON62 and June windows; no trade grade or gate was performed.`
- X3 ledger `1246.` appended once (tag `B101-XOB-FULLWINDOW-CENSUS`; sources+SHAs, windows+counts, lifecycle/provenance, coverage, R4, restoration, no gate/grade).
- X4 pointer 20→20 lines (cap 35): latest B-101 RESTORED; PARTIAL; artifacts restored; no gate/grade; next reviews census.
- Pre-commit re-check: X1/X2/X3 counts 1; `^1245.` = 1; staged set = 6 relay files only; no source diff; no run tables.
- R4: `FULLWINDOW-DIAGNOSTIC-PARTIAL` — missing: EU candle-level rows (RECON62-only re-run + immediate extraction recovers); diag-ex5 SHAs (journal sizes substitute). Evidence only, never permission.

(End of slice)
