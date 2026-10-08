# BUILDER SLICE B-97 - contexts, diff, compile, run evidence, provenance, restoration (provenance fix, RESTORED)

Scope: one provenance-format fix + one compile per artifact + one repeat run (XOBDIAG-B97) + restore. No gate change, no trade grade. Live files only.

## START GATE (raw)

- `git ls-remote ... builder/B-96` = `39abb59b2c514c27693590d45fc8fdca0e8d2a11` (verified; cut builder/B-97 here).
- `git log -1` = `39abb59b2c514c27693590d45fc8fdca0e8d2a11 B-96 diagnostic XOB export proven partial, 84-record bars EA-readable, build-stamp defect owned (relay B-96)`.
- `git status --short` line count = 371 (B-96 artifacts added; preserved, untouched).
- `git diff 39abb59b... --` EMPTY on: pointer, RESULT/SLICE B96, RESULT B95, PLANNER_CONTEXT, PLANNER_HANDOFF.
- EA src `137076D9CF85160AB8CD8379575AFD4801E71098CE97C0B10D88A42C7BF59671` / EX5 `FA4C924978F6A1D5C57B725F2AB530BBB5DC5B1E0D1D0B51FB0172E80D8C41B5` (prefixes match).
- Indicator src `956BF3E3ADB7064DAD89A0D2F97BFCAC6D706E40E39B6817EFB29F1A04418342` (required full SHA ✓, LF-only).
- terminal64 count 0. Tester dates already exact (`USDJPY`, `1780617600`/`1780704000`, read back — no edit).
- No STOP.

## PART B GREPS (before/after)

- Operator message = B-97 relay order only; no new trading-rule words. Record `no new rule words`; appended nothing.
- `B-97-XOB-PROVENANCE-FIX` in 99_WORKFLOW 0→1 (context X1). `B-97` in 99_WORKFLOW 0→1 (handoff X2).
- `B97-XOB-PROVENANCE-FIX` in SRJ_FlowNexus_Local 0→1 (ledger 1242). `^1242.` 0→1; `^1241.` = 1 beside.

## K1 DEFECT (from committed B-96 records)

- Header + 167638 rows + EA `eaBuild` printed `(non-string passed)` (B-96 R2/T4).
- Source used `%s` with `__DATETIME__` (datetime constant, not a string).
- B-96 correction: `TimeToString(__DATETIME__)` or `%I64d` seconds. Applied the former (codebase idiom).
- Nothing else reopened (fields, timing, walk, buffers, gates identical by diff).

## RAW CONTEXTS (by text; live files restored-kept, defect text from `.B96XOBEXPORT`)

- Header format (`.B96XOBEXPORT:898`): `"HEADER;%s;%d;%d;%s;%I64d\n", ..., __DATETIME__, ...` → fixed to `..., B96Build(), ...`.
- Row format (`.B96XOBEXPORT:914-920`): `..., B96Dbl(ob.invalidationLevel), __DATETIME__));` → fixed to `..., B96Build()));`.
- EA census (`.B96XOBEXPORT`): `eaBuild=%s", ..., __DATETIME__` → fixed to `..., TimeToString(__DATETIME__, TIME_DATE|TIME_SECONDS)` via local `eaBuild`.
- New helper: `string B96Build(void) { return(TimeToString(__DATETIME__, TIME_DATE|TIME_SECONDS)); }` (same value, valid string; no new identifier).
- Existing `SRJ BUILD` print (`FlowLogic:671`, concatenation form) never broken — untouched.
- Live-file anchors re-verified by K2 SHAs (byte-identical to B-96 pre-edit state).

## DIFF (vs `.preB97`, complete)

- Indicator +83/-0 (81-line block incl. `B96Build` + 2-line call). EA +150/-0 (census incl. fixed `eaBuild` + call + maxN lines).
- `.B97PROV` copies = edited SHAs (indicator `4E3EDC082540ED3EE0A67933C4CED24A9277FDE957B72AF416A6F93CDD13A45D`, EA `4F9EDCF8DA4B5903CEDB2953A81D23F535D78DBD305976B818C3F2D78DAAC83E`; LF-only).
- Verb-type check: header `%s;%d;%d;%s;%I64d` ✓; row 2×`%I64d` + `%s` strings + 3×`%d` ✓; census `%I64d`/`%s`/`%d` ✓. Additions only — buffers/gates/handles untouched.

## BACKUPS + COMPILE (raw)

- `.preB97` SHAs: indicator src `956BF3E3...`; EA src `137076D9...` (both = required full SHAs).
- Indicator compile: ok=true, 0 errors, 0 warnings, binary fresh → `05BD52B0D2FD27A45FDC6A2CF68836B9D7C6873B4A8D7DDD48CDD995A2B3751A`.
- EA compile: ok=true, 0 errors, 0 warnings → `182E24C3C66C75D894865F957F636FCBEDA63C3FD5EDBE2EE08F8262408EB7C3`.
- One attempt each, no retries. No STOP.

## RUN EVIDENCE (XOBDIAG-B97, USDJPY 2026.06.05, PASSED)

- Launch WMI RC=0; STATUS verified same window (PID 9092); wrapper shell killed; watcher PID 9936 verified; DONE ≤60 s cycles; launch 18:28:13 → DONE 18:30:01.
- `B96DIAG_FILE bars=3289 recs=167638 maxPerBar=84 atBar=2026.06.02 23:00` (identical to B-96).
- `B96DIAG_MULTI bar=2026.05.21 14:20 n=3` (ids 1/3/4). `B96DIAG_ADJACENT id=1 ... diffSec=300`.
- `B96DIAG_PROMO rows=42514 atBar=254`. `B96DIAG_INVAL rows=48656`.
- `headerBuild=2026.10.08 18:27:06 eaBuild=2026.10.08 18:27:18` — VALID (was `(non-string passed)`).
- Sampled rows carry `2026.10.08 18:27:06`. `PROV symMatch=1 perMatch=1`.
- Completion line present; balance line present, never compared (no trade grade).

## PROVENANCE ROWS (exact, B-97 run)

- `HEADER;USDJPY;300;106332;2026.10.08 18:27:06;1735776000`
- `XOBDIAG;1779373200;1;S;159.13500000;159.09300000;1779371100;1779371700;NA;1;1;0;1779372000;NA;159.11400000;2026.10.08 18:27:06`
- T6 STOP checks: fields valid ✓; observations present ✓; no buffer/gate change ✓; exact source+journal tie ✓; no failures ✓ — proceed.

## RESTORATION (T7, byte-verified)

- From `.preB97`/kept ex5s: EA src `137076D9...` / EA ex5 `FA4C924978F6...` / indicator src `956BF3E3...` / indicator ex5 `27B5F272...` / terminal.ini `EACA0870...` (pre-run narrow-window state; 5F0336A0 remains last committed gate value, drift lineage recorded).
- Leftover terminal64 PID 9092 reported (B-43: next launch handles). Nothing diagnostic staged.

## RECORD LINES (exact)

- X1 context §4 appended once: `- B-97-XOB-PROVENANCE-FIX (planner lesson 2026-10-08, B-97): repaired the B-96 diagnostic build-stamp formatting defect and repeated the same diagnostic without enabling a trading gate.`
- X2 handoff §3 appended once: `- B-97: repaired the diagnostic provenance formatting defect and repeated the same XOB export run; no trading gate was enabled.`
- X3 ledger `1242.` appended once (tag `B97-XOB-PROVENANCE-FIX`; files+SHAs, correction, compile/run, evidence, R2, restoration, no gate).
- X4 pointer 20→20 lines (cap 35): latest B-97 RESTORED; PROVEN; artifacts restored; no gate; next reviews corrected evidence.
- Pre-commit re-check: X1/X2/X3 counts 1; `^1241.` = 1; staged set = 6 relay files only; no source diff; no run tables.
- R2: `DIAGNOSTIC-EXPORT-PROVEN` — evidence only, never permission.

(End of slice)
