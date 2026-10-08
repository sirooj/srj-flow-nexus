# BUILDER SLICE B-100 - contexts, diff, compile, path evidence, join rows, restoration (recalc-id, RESTORED)

Scope: dual-file diagnostic addition + one compile per artifact + one single run yielding fresh + incremental paths + offline join + restore. No gate change, no trade grade. Live files only.

## START GATE (raw)

- `git ls-remote ... builder/B-99` = `f71b87defa20ccb8c96046614f8a26ebad1e2178` (verified; cut builder/B-100 here).
- `git log -1` = `f71b87defa20ccb8c96046614f8a26ebad1e2178 B-99 cross-run XOB join not proven on identical replay, mechanical match only (relay B-99)`.
- `git status --short` line count = 378 (B-99 artifacts added; preserved, untouched).
- `git diff f71b87de... --` EMPTY on: pointer, RESULT/SLICE B99, RESULT/SLICE B98, RESULT/SLICE B97, RESULT/SLICE B96, PLANNER_CONTEXT, PLANNER_HANDOFF.
- EA `137076D9CF85...` / EX5 `FA4C924978F6...` / indicator src `956BF3E3ADB7...` / EX5 `27B5F272DCF...` (prefixes match; LF-normalized identical).
- Live indicator/EA contain zero B96/B100 identifiers (restored state; matches only in `.B96XOBEXPORT`/`.B97PROV` copies).
- terminal.ini pre-run SHA `EACA0870...` (narrow window retained; dates read back exact, no edit). terminal64 count 0.
- No STOP.

## PART B GREPS (before/after)

- Operator message = B-100 relay order only; no new trading-rule words. Record `no new rule words`; appended nothing.
- `B-100-XOB-RECALC-ID` in 99_WORKFLOW 0→1 (context X1). `B-100` in 99_WORKFLOW 0→1 (handoff X2).
- `B100-XOB-RECALC-ID` in SRJ_FlowNexus_Local 0→1 (ledger 1245). `^1245.` 0→1; `^1244.` = 1 beside.

## K1 GAP (B-99, quoted)

- Same-window replay match is circular for a general key; `objId` resets across recalculation (B-95 `:510`); composite present but never joined across calculation paths; run-level provenance is not record identity.

## RAW CONTEXTS (by text)

- Fresh branch: `if(prevCalc == 0)` + hist-shift reset (`FlowLogic:877-892`, `start=2`).
- Incremental branch: `start = prevCalc - 1` (`:984`); per-tick newest bars (B-95 R1).
- Existing header: `HEADER;sym;per;rates;build;firstT` (B-97 format; extended with `;calcPath;runPass`).
- Composite fields per row: dir/startT/createT/hi/lo (+promo/flags/times/build).
- B-96/B-97 region reads stand (files byte-identical per K2 SHAs).

## TRANSPORT DECISION (K4/K5)

- Single run yields both paths (first call `prevCalc==0` = fresh replay; later ticks = continuation) — existing tester mechanism, no architecture change, no STOP.
- Split files (`XOBDIAG_FRESH.csv` runPass 1 / `XOBDIAG_INCREMENTAL.csv` runPass 2) + `calcPath`/`runPass` appended (18 fields, positions stable).
- `objId` never the join key. Buffers/selector/lifecycle/gates/handles untouched.
- EA dual census (`B100FRESH`/`B100INC`, `fname/tag/path` params, pathBad counter). Offline join by builder (read-only scripts).

## DIFF (vs `.preB100`, complete)

- Indicator +99/-0 (dual-file block + helpers + 2-line call). EA +158/-0 (parameterized census + dual calls + pathBad).
- `.B100RECALCID` copies = edited SHAs (indicator `7363A8B9...`, EA `67B3CEF7...`; LF-only).
- Verb check: header `%s;%d;%d;%s;%I64d;%s;%s` ✓; rows +`;%s;%s` ✓; census `%I64d`/`%s`/`%d` ✓. Additions only.

## BACKUPS + COMPILE (raw)

- `.preB100` SHAs: indicator `956BF3E3...` / EA `137076D9...` (= required full SHAs).
- Indicator compile: ok=true, 0/0, fresh → `F75A7505DE6DCBFE7959D3FEB82D9305C5CA24D93C104735`.
- EA compile: ok=true, 0/0 → `0E9D4701DF2B4F31FE26DB1FBC45A76F023EDA1ABFB24E9409F1B2758D372AD6`.
- One attempt each, no retries. Agent dir cleaned of stale `XOBDIAG*.csv` (recorded).

## RUN EVIDENCE (XOBDIAG-B100, USDJPY 2026.06.05, 61072 ticks/288 bars, PASSED)

- Launch WMI RC=0; STATUS verified same window (PID 22328); wrapper killed; watcher PID 8032 verified; DONE ≤60 s; launch 19:23:12 → DONE 19:25:26.
- FRESH: bars=3001 (3000 true — census +1 defect owned, rows exact) / recs=146240; maxPerBar 84 at 06-02 23:00; first multi 05-21 14:20 n=3; adjacent id=1; promo 36722/231; inval 44052; pathBad=0; PROV 1/1 runPass=1.
- INC: bars=289 (288 true, same defect) / recs=21398; maxPerBar 81 at 06-05 06:25; first multi 06-04 23:50 n=73; adjacent id=246; promo 5792/23; inval 4604; pathBad=0; PROV 1/1 runPass=2.
- Coverage DISJOINT by construction (FRESH ..1780616700 history; INC 1780617000.. window; 0 shared bars) — genuine paths, not a second replay.
- Files: FRESH 20422014 B / INC 3129533 B (agent dir). Completion line present; balance never compared.

## JOIN ROWS (offline, read-only; T5/T6 rules)

- 176 INC keys, 1108 FRESH keys; 73 matched; oidSame 73/73 (same-run corroboration only).
- Boundary (FRESH last 1780616700 → INC first 1780617000): 72 field-identical + 1 genuine invalidation (`B|1780612200|...`: valid=1 → valid=0/invalT=1780617300; target=i-1 lookahead, evidenced).
- Sample: `B|1779780300|1779780600|158.949|158.932` freshOid=419 incOid=419 incSpan 1780617000..1780703100 n=288.
- Row-overlap n/a (disjoint coverage — designed). Missing rows NOT FOUND, never matches. No cross-run claim (B-99 stands).

## PROVENANCE ROWS (exact)

- FRESH header + rows carry per-path build; EA census prints both builds + `runPass=1/2`; `PROV symMatch=1 perMatch=1` both files.
- `pathBad=0` both files (no misfiled rows).

## RESTORATION (T7, byte-verified)

- Sources + EX5s + terminal.ini from `.preB100`/kept binaries: EA src `137076D9...` / EA ex5 `FA4C924978F6...` / indicator src `956BF3E3...` / indicator ex5 `27B5F272...` / terminal.ini `EACA0870...` (pre-run SHA).
- Leftover terminal64 PID 22328 reported (B-43: next launch handles). Nothing diagnostic staged.

## RECORD LINES (exact)

- X1 context §4 appended once: `- B-100-XOB-RECALC-ID (planner lesson 2026-10-08, B-100): tested XOB composite identity across genuine fresh and incremental calculation paths without enabling a trading gate.`
- X2 handoff §3 appended once: `- B-100: tested the XOB composite identity across fresh and incremental calculation paths; no trading gate was enabled.`
- X3 ledger `1245.` appended once (tag `B100-XOB-RECALC-ID`; sources+SHAs, paths, key/lifecycle/provenance comparison, R2, restoration, no gate).
- X4 pointer 20→20 lines (cap 35): latest B-100 RESTORED; PROVEN; artifacts restored; no gate; next reviews path comparison.
- Pre-commit re-check: X1/X2/X3 counts 1; `^1244.` = 1; staged set = 6 relay files only; no source diff; no run tables.
- R2: `RECALC-ID-PROVEN` (within-source) — evidence only, never permission. DEFECT OWNED: census `bars` = N+1 (triple-count); rows/joins exact; verify counters against artifacts.

(End of slice)
