# BUILDER SLICE B-96 - contexts, diff, compile, run evidence, provenance, restoration (diagnostic export, RESTORED)

Scope: one narrow file export + one read-only EA census + one compile attempt per artifact + one diagnostic run (XOBDIAG-B96) + restore. No gate change, no trade grade. Live files only.

## START GATE (raw)

- `git ls-remote ... builder/B-95` = `fa6226d73d498253a643b5d6666db70506d60edc` (verified; cut builder/B-96 here).
- `git log -1` = `fa6226d73d498253a643b5d6666db70506d60edc B-95 XOB persistence and provenance traced, both gaps proven missing (relay B-95)`.
- `git status --short` line count = 359 (preserved drift + untracked dirt, untouched).
- `git diff fa6226d7... --` EMPTY on: pointer, RESULT/SLICE B95, RESULT/SLICE B94, PLANNER_CONTEXT, PLANNER_HANDOFF.
- EA disk SHA `137076D9CF85160AB8CD8379575AFD4801E71098CE97C0B10D88A42C7BF59671` (695359 B, LF-only; prefix matches).
- EX5 disk SHA `FA4C924978F6A1D5C57B725F2AB530BBB5DC5B1E0D1D0B51FB0172E80D8C41B5` (prefix matches).
- Indicator disk SHA `956BF3E3ADB7064DAD89A0D2F97BFCAC6D706E40E39B6817EFB29F1A04418342` (matches pointer gate SHA).
- terminal64 count 0 before compile/launch. terminal.ini semantics preserved via content copy + restore.
- No STOP.

## PART B GREPS (before/after)

- Operator message = B-96 relay order only; no new trading-rule words. Record `no new rule words`; appended nothing.
- `B-96-XOB-DIAGNOSTIC-EXPORT` in 99_WORKFLOW 0→1 (context X1). `B-96` in 99_WORKFLOW 0→1 (handoff X2).
- `B96-XOB-DIAGNOSTIC-EXPORT` in SRJ_FlowNexus_Local 0→1 (ledger 1241). `^1241.` 0→1; `^1240.` = 1 beside.

## K1 CHECKS

- B-95 R7 quoted: `PERSISTENCE-MISSING-PROVENANCE-MISSING` — fields internally present; complete historical multi-XOB persistence + record-level provenance unproven.
- Evidence-only: file writer + end-of-run census; zero gate reads new code (diff proves additions-only).
- Selected buffers 22/23/31/33/34 byte-identical (publish block untouched by diff).
- No control-flow change (no gate/enumeration/buffer/handle/lifecycle edit) — proceed, no STOP.

## RAW CONTEXTS (live files, by text)

- `COrderblock` (`Include/SRJ/SRJ_Types.mqh:37-92`): startBar/endBar/swingBar/high/low/open/midpoint/invalidationLevel/isBullish/isActivated/isValid/validationBar/invalidationBar/names/isExtreme/isPromoted/hasDrivenRenewal/creationBar/promotionBar(NA_INT=never)/objId (B-94 R1, re-verified by grep this turn).
- `g_orderblocks` decl (`Include/SRJ/SRJ_State.mqh:269`): `CArrayObj g_orderblocks;`.
- Pass order (`Indicators/SRJ_FlowLogic.mq5:1023-1062`): Creation→BiasReset→ActivationInvalidation→CounterAgg→InactivePrune→OpposingCache→WeakFlipLatch→StructureDetection→DecisionBlock→DeferredPromotion→Pruning; ascending `for(i=start;...)`, fresh `start=2`, incremental `prevCalc-1`; snapshot/rollback last-bar only (`:996-1011`).
- Publish block (`:1202-1234`): `target=i-1` (`:1072`), EMPTY/0.0 defaults (`:1206-1209`), one in-bias pick via `:1212`, zone/id/promo writes (`:1218-1230`).
- Export point: new call `SRJ_B96_DiagExport(target, time, rates_total, barClosed);` after `:1234`, inside `if(target>=0)` (post-mutation, post-publish, same slot).
- Build source (`:671`): `Print("SRJ BUILD ", __DATETIME__, " refOk=invOnly diag=v9_perm");` — log-only.
- EA `OnDeinit` tail (`:11871-11885`): shadow eval (handles valid) → `SrjUjPoolFinalize();` → NEW `if(InpDebugLog) SrjB96DiagCensus();` → handle releases. EA has no `OnTester` (grep 0 in live file).

## TRANSPORT CHOICE (K5)

- Buffers carry one value per bar (60-145 live records/bar per B-75) — bounded slots cannot satisfy K4; prints are log-only (explicitly excluded as EA-readable); files are additive-only (no buffer/handle/gate/lifecycle change). File transport chosen; no operator question; no print reconstruction.

## DIFF (vs `.preB96`, complete)

- Indicator +77/-0 (75-line `SRJ_B96_DiagExport` + helpers + 2-line call; 3 lines +1 leading space, proven whitespace-only: `--ignore-all-space` = +77/-0). Buffers/gates/handles untouched.
- EA +149/-0 (145-line `SrjB96DiagCensus` + 2-line call + 2 maxN lines inside the new function). No gate touched.
- `.B96XOBEXPORT` copies = edited SHAs (`A4E66570...` / `11B58FD8...`; LF-only, normalized identical).

## BACKUPS + COMPILE (raw)

- `.preB96` SHAs: EA src `137076D9...`; indicator src `956BF3E3...`; EA ex5 `FA4C924978F6...`; indicator ex5 `27B5F272DCF...`.
- Indicator compile: ok=true, 0 errors, 0 warnings, binary fresh → `638CC25E51667DFF54056B9D837069C69C92372AC7D64DDB6F3B268155EB21B1`.
- EA compile: ok=true, 0 errors, 0 warnings, 6931 ms → `E7A417468F332359E17A838AC2D0B9D9F18484F2AEC94F12684506F438D08738`.
- One attempt each, no retries. No STOP.

## RUN EVIDENCE (XOBDIAG-B96, USDJPY 2026.06.05 day, 61072 ticks/288 bars, PASSED 0:01:23)

- Launch: WMI PID 5908 RC=0; STATUS verified `testing ... from 2026.06.05 00:00 to 2026.06.06 00:00` (PID 18332); wrapper shell killed (RAM order); watcher PID 23244 verified; DONE polled ≤60 s cycles; RESULT=PASSED 18:17:39.
- `B96DIAG_FILE bars=3289 recs=167638 maxPerBar=84 atBar=2026.06.02 23:00` (84 verified by direct count at barT 1780441200).
- `B96DIAG_MULTI bar=2026.05.21 14:20 n=3` (ids 1/3/4, same barT 1779373200).
- `B96DIAG_ADJACENT id=1 t1=2026.05.21 13:50 t2=2026.05.21 13:55 diffSec=300` (CSV rows 1779371400/1779371700 confirm).
- `B96DIAG_PROMO rows=42514 atBar=254` (eg id=4 1;1;1, promoT==barT).
- `B96DIAG_INVAL rows=48656` (eg id=1 0;0;0 with zone/level on row).
- `B96DIAG_PROV fileSym=USDJPY eaSym=USDJPY symMatch=1 filePer=300 eaPer=300 perMatch=1`.
- CSV direct: `Tester/.../Agent-127.0.0.1-3003/MQL5/Files/XOBDIAG.csv`, 22081976 B / 167639 lines (header + 167638 = EA count).
- Completion: `USDJPY,M5: 61072 ticks, 288 bars ... Test passed in 0:01:23.791`. Balance line present, never compared (T1/T5: no trade grade).

## PROVENANCE ROWS (exact)

- `HEADER;USDJPY;300;106332;(non-string passed);1735776000`
- `XOBDIAG;1779371400;1;S;159.13500000;159.09300000;1779371100;1779371700;NA;0;0;0;NA;NA;159.11400000;(non-string passed)`
- `XOBDIAG;1779371700;1;S;159.13500000;159.09300000;1779371100;1779371700;NA;1;1;0;1779372000;NA;159.11400000;(non-string passed)`
- DEFECT OWNED: `__DATETIME__` is datetime, `%s` renders `(non-string passed)` (header + rows + EA eaBuild). Correct form: `TimeToString(__DATETIME__)` or seconds. No retry per K7; linkage rests on sym/period + same journal.

## RESTORATION (T6, byte-verified)

- Sources + ex5s + terminal.ini from `.preB96`: EA src `137076D9...` / EA ex5 `FA4C924978F6...` / indicator src `956BF3E3...` / indicator ex5 `27B5F272...` / terminal.ini `5F0336A0...` — all equal backups.
- Leftover terminal64 PID 18332 reported (B-43: next launch handles). No diagnostic source/artifact staged.

## RECORD LINES (exact)

- X1 context §4 appended once: `- B-96-XOB-DIAGNOSTIC-EXPORT (planner lesson 2026-10-08, B-96): the first upstream diagnostic export attempt records whether internal multi-XOB history and run provenance can be exposed without enabling the trading gate.`
- X2 handoff §3 appended once: `- B-96: attempted a diagnostic-only upstream XOB export; no trading gate was enabled; next relay reviews the export evidence.`
- X3 ledger `1241.` appended once (tag `B96-XOB-DIAGNOSTIC-EXPORT`; sources+SHAs, fields, compile/run, observations, R2, restoration, no gate).
- X4 pointer 20→20 lines (cap 35): latest B-96 RESTORED; PARTIAL; artifacts restored; no gate; next reviews evidence.
- Pre-commit re-check: X1/X2/X3 counts 1; `^1240.` = 1; staged set = 6 relay files only; no source diff; no run tables.
- R2: `DIAGNOSTIC-EXPORT-PARTIAL` — evidence only, never permission.

(End of slice)
