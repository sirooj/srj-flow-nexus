# BUILDER RESULT B-97 - provenance repaired, same diagnostic repeated, DIAGNOSTIC-EXPORT-PROVEN, RESTORED

Trader summary: B-96 proved the diagnostic export can carry the live XOB collection, including 84 records on one bar, adjacent-bar identity, promotion, invalidation and EA readability. It remains PARTIAL only because the build stamp printed `(non-string passed)`. B-97 fixes that reporting defect, reruns the same 5 June diagnostic, and restores everything again. No trading gate or entry behavior changes.

## Part 0 - fresh-session start

- 0.1 Relay skill loaded whole first (67 lines). Strategy skill NOT loaded (provenance repair only, no trading rule touched).
- 0.2 `git ls-remote https://github.com/sirooj/srj-flow-nexus.git builder/B-96` = `39abb59b2c514c27693590d45fc8fdca0e8d2a11` (verified). Cut `builder/B-97` from it. Push via `backup`, never `origin`.
- 0.3 Read in order on `builder/B-96`: pointer (20 lines); RESULT_B96 (65) + SLICE_B96 head (90-line file, authored prior turn, unchanged); RESULT_B95 head (86-line file, known whole, unchanged); PLANNER_CONTEXT tail (B-92..B-96 lessons; 108 lines total with head known); PLANNER_HANDOFF whole (48 lines); relay skill whole; live sources verified via K2 SHA gate (byte-identical to B-96 pre-edit state, so B-96 region reads stand); `launch_b96_diag.ps1` whole (12 lines, mirrored into `launch_b97_diag.ps1`); `launch_june0525_b69_run.ps1` (pattern known from B-96 read).
- 0.4 Names per relay: export `SRJ_B96_DiagExport`; census `SrjB96DiagCensus`; file `XOBDIAG.csv`; window USDJPY 2026-06-05→2026-06-06; prior `B96-XOB-DIAGNOSTIC-EXPORT` item `1241`; this tag `B97-XOB-PROVENANCE-FIX`, item `1242`; kept EA `137076D9CF85` / EX5 `FA4C924978F6`; kept indicator src `956BF3E3ADB7` / EX5 `27B5F272DCFA`; verdict RESTORED.
- 0.5 Start gate: `git log -1` = `39abb59b2c514c27693590d45fc8fdca0e8d2a11` (B-96 head). `git diff 39abb59b2c514c27693590d45fc8fdca0e8d2a11 --` EMPTY on every committed file named (pointer, RESULT/SLICE B96, RESULT B95, PLANNER_CONTEXT, PLANNER_HANDOFF). `git status --short` = 371 lines (B-96 artifacts added since: .preB96×4, .B96XOBEXPORT×2, launch/ini/STATUS/DONE; preserved, untouched). EA/EX5 + indicator src/EX5 prefixes verified at K2. terminal64 count 0 before edit/compile. terminal.ini content preserved (`.preB97` = `EACA0870...`; see T3 note). Tester dates already exact B-96 window (read back, no edit). No STOP.
- 0.6 Scope: one provenance-format fix + one compile per artifact + one repeat run + restoration + text records.

## Part B - banking

- B1 The operator message carries the B-97 relay order only; it contains no new trading-rule words. Record `no new rule words`; appended nothing.

## Part K - provenance fix

- K1 B-96 defect confirmed from committed result/slice: header + all 167638 rows + EA `eaBuild` printed `(non-string passed)`; source used `%s` with `__DATETIME__` (a datetime constant, not a string); B-96 named `TimeToString(__DATETIME__)` or `%I64d` seconds as the correction; nothing else reopened.
- K2 Backups `.preB97` before editing (indicator src `956BF3E3ADB7064DAD89A0D2F97BFCAC6D706E40E39B6817EFB29F1A04418342` ✓, EA src `137076D9CF85160AB8CD8379575AFD4801E71098CE97C0B10D88A42C7BF59671` ✓ — both equal required full SHAs, proceed, no STOP). Kept EX5s verified (`FA4C924978F6...`, `27B5F272DCF...`).
- K3 Located by current text: header format in `.B96XOBEXPORT:898` (`"HEADER;%s;%d;%d;%s;%I64d\n", ..., __DATETIME__, ...`); row format in `.B96XOBEXPORT:914-920` (`..., B96Dbl(ob.invalidationLevel), __DATETIME__));`); EA census `eaBuild` in `.B96XOBEXPORT` (`eaBuild=%s", ..., __DATETIME__`); existing `SRJ BUILD` print (`FlowLogic:671`, `Print("SRJ BUILD ", __DATETIME__, ...)` — concatenation form, never broken, left untouched).
- K4 Correction applied (same value, valid string, no new identifier, no cross-run key): new `B96Build()` helper = `TimeToString(__DATETIME__, TIME_DATE|TIME_SECONDS)`; used in header, every row and EA `eaBuild`. Re-applied the 4 B-96 hunks with the fix baked in (files were restored-kept; identical anchors verified by K2 SHAs). No collection/field/timing/buffer/gate change — no STOP.
- K5 Diff vs `.preB97` (complete): indicator +83/-0 (81-line block incl. helper + 2-line call); EA +150/-0 (census incl. fixed `eaBuild` + call + maxN lines). `.B97PROV` copies = edited SHAs (indicator `4E3EDC082540ED3EE0A67933C4CED24A9277FDE957B72AF416A6F93CDD13A45D`, EA `4F9EDCF8DA4B5903CEDB2953A81D23F535D78DBD305976B818C3F2D78DAAC83E`; LF-only). Verb-type check: header `%s;%d;%d;%s;%I64d` ← string/int/int/string/long ✓; row 2×`%I64d` ← long/long ✓, `%s` ← strings (B/S, Dbl/BarT/NA, B96Build) ✓, 3×`%d` ← int ternaries ✓; census `%I64d` ← long counters ✓, `%s` ← TimeToString/strings ✓, `%d` ← int counters ✓. Diagnostic-only confirmed (additions only).
- K6 Compile once per artifact, no retries: indicator ok 0/0 fresh → `05BD52B0D2FD27A45FDC6A2CF68836B9D7C6873B4A8D7DDD48CDD995A2B3751A`; EA ok 0/0 → `182E24C3C66C75D894865F957F636FCBEDA63C3FD5EDBE2EE08F8262408EB7C3`. No STOP.

## Part T - repeat diagnostic (XOBDIAG-B97, same window, NO trade grade)

- T2 Exact B-96 window: USDJPY M5, DateFrom `1780617600` / DateTo `1780704000` (2026-06-05 00:00→2026-06-06 00:00), inputs mirrored from `USDJPY_B96_DIAG.ini` (Model=4, InpDebugLog=true, InpMode=1). Window unchanged.
- T3 Pre-launch: terminal64 count 0; terminal.ini preserved (`.preB97` = `EACA0870...` — note: narrow-window state retained by post-B-96 terminal re-save after the B-96 restore-verification; TesterTab/RefreshDate UI noise beside); charts: 0 files on disk; artifacts verified (diag ex5s above); terminal.ini dates read back exact (`Symbol=USDJPY`, `1780617600`/`1780704000` — already correct, no edit); launch script `launch_b97_diag.ps1` (WMI pattern, CeilingMin 30); wrapper PID 23420 RC=0; STATUS verified start (same window, PID 9092); wrapper shell killed (RAM order); watcher PID 9936 verified; DONE polled ≤60 s cycles; run under five minutes (launch 18:28:13 → DONE 18:30:01, RESULT=PASSED).
- T4 Evidence only (EA pass stamp 18:29:59.958; counts identical to B-96, stamps now valid):
  - bars=3289, recs=167638, maxPerBar=84 (same bar; direct-count method stands).
  - first multi bar 2026.05.21 14:20 n=3 (ids 1/3/4).
  - adjacent id=1 across 300 s bars.
  - promo 42514 rows (254 atBar).
  - inval 48656 rows.
  - `headerBuild=2026.10.08 18:27:06 eaBuild=2026.10.08 18:27:18` — VALID (indicator compiled 18:27:06, EA 18:27:18); every sampled row carries `2026.10.08 18:27:06`.
  - `PROV symMatch=1 perMatch=1` (fileSym=USDJPY eaSym=USDJPY, 300/300).
  - Completion: test PASSED; balance line present, never compared.
- T5 Selected buffers byte-identical in source (diff additions-only); no gate reads the export (census post-run, print-only); no trade/balance/profitability grade; completeness rests on 84-record max + full counts, never one XOB.
- T6 STOP checks: build fields valid (no malformed/missing/empty/UNKNOWN) ✓; all lifecycle observations present ✓; no buffer/control-flow change ✓; tied to exact source + journal ✓; no compile/run failure ✓ — proceed, no STOP.
- T7 Restored immediately: sources + ex5s from `.preB97`/`.preB96`-era kept ex5s; terminal.ini from `.preB97`; verified EA src `137076D9CF85` / EA EX5 `FA4C924978F6` / indicator src `956BF3E3ADB7` / indicator EX5 `27B5F272DCFA` / terminal.ini `EACA0870` (pre-run SHA); `.preB97`/`.B97PROV`/diag ex5s/artifacts unstaged; leftover terminal64 PID 9092 reported (B-43: next launch handles).

## Part R - evidence decision

- R1: header provenance FOUND (`2026.10.08 18:27:06`); per-row provenance FOUND (same stamp every sampled row); EA census provenance FOUND (`2026.10.08 18:27:18`); multi-record history FOUND (84/bar); adjacent-bar identity FOUND (id=1, 300 s); promotion FOUND (42514/254); invalidation FOUND (48656); sym/period provenance FOUND (1/1).
- R2 Exactly one: `DIAGNOSTIC-EXPORT-PROVEN` — all B-96 required fields, lifecycle observations and valid build provenance are present.
- R3 No trading gate authorized. A separate relay must review this evidence against the specification before any trading-path work.

## Part X - records

- X1 `PLANNER_CONTEXT.md` section 4 grep `B-97-XOB-PROVENANCE-FIX` = 0 -> appended exactly one lesson (verified 1). No duplicate.
- X2 `PLANNER_HANDOFF.md` section 3 grep `B-97` = 0 -> appended `- B-97: repaired the diagnostic provenance formatting defect and repeated the same XOB export run; no trading gate was enabled.` (verified 1). No duplicate.
- X3 Ledger grep `B97-XOB-PROVENANCE-FIX` = 0 and `^1242.` = 0 -> appended item `1242` (files+SHAs, correction, compile/run, evidence, R2, restoration, no gate). `^1241.` = 1 beside. No duplicate.
- X4 Pointer 20 -> 20 lines (cap 35): latest B-97 RESTORED, PROVEN decision, kept artifacts restored, no gate, next reviews corrected evidence.

## Part F - file, push, reply

- F1 this result. F2 slice `BUILDER_SLICE_B97.md` (contexts, diff, compile, evidence, provenance rows, restoration SHAs, before/after lines; under 600 lines). F3 ledger 1242. F4 pointer per X4. F5 stages only the 6 relay files. F6 commit + push `builder/B-97` via `backup` + ls-remote check. Reply RESTORED.

## Final disk state (RESTORED turn; kept RKD build on disk, uncommitted)

- EA `137076D9CF85160AB8CD8379575AFD4801E71098CE97C0B10D88A42C7BF59671` (695359 B, LF-only, restored-verified; ` M` vs stale blob = expected uncommitted lag, never staged) + `.preB87`/`.B87PICKXOB`/`.preB96`/`.B96XOBEXPORT`/`.preB97`/`.B97PROV` kept uncommitted. EX5 `FA4C924978F6A1D5C57B725F2AB530BBB5DC5B1E0D1D0B51FB0172E80D8C41B5` (restored-verified). Indicator src/ex5 restored-verified (`956BF3E3...`/`27B5F272...`). terminal.ini restored-verified (`EACA0870...`). Strategy skill, journal CSV, register, spec untouched. Leftover terminal64 PID 9092 reported, not reinterpreted. No edit stands beyond the relay's text records.

No carried note (no STOP; nothing to ask him).
