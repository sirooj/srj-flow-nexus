# BUILDER RESULT B-99 - cross-run XOB identity unproven on identical replay, CROSSRUN-JOIN-NOT-PROVEN, MEASURED

Trader summary: B-98 found the diagnostic export satisfies the row-level XOB contract, but one run is not enough to prove the same XOB can be joined across runs. This relay compares the existing B-96 and B-97 diagnostic artifacts only, using their exact source, indicator, EA, journal and build provenance. No new run, source edit or trading gate is authorized.

## Part 0 - fresh-session start

- 0.1 Relay skill loaded whole first (67 lines, head read + remainder known verbatim, file untouched). Strategy skill NOT loaded (provenance comparison, no trading rule touched).
- 0.2 `git ls-remote https://github.com/sirooj/srj-flow-nexus.git builder/B-98` = `0c3228bd84a0c3fed6b17e88c99dd3ccf0cdfcf5` (verified). Cut `builder/B-99` from it. Push via `backup`, never `origin`.
- 0.3 Read in order on `builder/B-98`: pointer (20 lines); RESULT_B98 head (72-line file, authored prior turn, unchanged); SLICE_B98 head (78-line file, known whole, unchanged); RESULT_B97 head (65-line file, known whole, unchanged); SLICE_B97 head (known whole, unchanged); RESULT_B96 head (65-line file, known whole, unchanged); SLICE_B96 head (90-line file, known whole, unchanged); PLANNER_CONTEXT tail (B-92..B-98 lessons; 112 lines with head known); PLANNER_HANDOFF whole (52 lines); relay skill whole. Local artifacts inspected as named (STATUS/DONE files, agent CSV, `.B96XOBEXPORT`/`.B97PROV` copies, day-log rows). No run created, no file regenerated.
- 0.4 Names per relay: B-96 `XOBDIAG-B96`; B-97 `XOBDIAG-B97`; file `XOBDIAG.csv`; prior `EVIDENCE-CONTRACT-PARTIAL` item `1243`; this tag `B99-XOB-CROSSRUN-PROVENANCE`, item `1244`; kept EA `137076D9CF85` / EX5 `FA4C924978F6`; kept indicator src `956BF3E3ADB7` / EX5 `27B5F272DCFA`; verdict MEASURED.
- 0.5 Start gate: `git log -1` = `0c3228bd84a0c3fed6b17e88c99dd3ccf0cdfcf5` (B-98 head). `git diff 0c3228bd84a0c3fed6b17e88c99dd3ccf0cdfcf5 --` EMPTY on every committed file named (pointer, RESULT/SLICE B98, RESULT/SLICE B97, RESULT/SLICE B96, PLANNER_CONTEXT, PLANNER_HANDOFF). `git status --short` = 378 lines (B-98 artifacts added since; preserved, untouched). EA `137076D9CF85...` / EX5 `FA4C924978F6...` / indicator src `956BF3E3ADB7...` / EX5 `27B5F272DCF...` (prefixes match; LF-normalized identical). No terminal64. No compile. No tester run. No STOP.
- 0.6 Scope: read-only artifact/record comparison + classifications + text records (details below per relay order).

## Part B - banking

- B1 The operator message carries the B-99 relay order only; it contains no new trading-rule words. Record `no new rule words`; appended nothing.

## Part R - cross-run comparison

- R1 Artifact inventory (local disk, read-only; missing = NOT FOUND, never regenerated):
  - B-96 (`XOBDIAG-B96`): CSV overwritten by B-97 (same agent path) → file NOT FOUND as B-96 content; evidence survives in day-log census rows (pass stamp 18:17:32.998), `XOBDIAG-B96_STATUS.txt` FOUND, `XOBDIAG-B96_DONE.txt` FOUND (RESULT=PASSED), B-96 result/slice/ledger records. Sources: `.B96XOBEXPORT` copies FOUND (indicator `A4E66570...`, EA `11B58FD8...`). Diag builds: indicator `638CC25E`, EA `E7A41746`. Completion: 61072 ticks / 288 bars, passed 0:01:23.791. Window USDJPY M5 2026.06.05→2026.06.06, period 300. Counts: bars 3289 / recs 167638 / maxPerBar 84.
  - B-97 (`XOBDIAG-B97`): CSV FOUND (`Tester/.../Agent-127.0.0.1-3003/MQL5/Files/XOBDIAG.csv`, 22081976 B / 167639 lines, header build `2026.10.08 18:27:06`). Sources: `.B97PROV` copies FOUND (indicator `4E3EDC08`, EA `4F9EDCF8`). Diag builds: indicator `05BD52B0`, EA `182E24C3`. Journal rows (pass stamp 18:29:59.958), STATUS/DONE FOUND (RESULT=PASSED). Completion: 61072 ticks / 288 bars (identical feed), passed 0:01:06.981. Same window/symbol/period. Counts identical: 3289 / 167638 / 84.
  - Kept artifacts (both runs' restore baseline): EA src `137076D9...`, EX5 `FA4C924978F6...`, indicator src `956BF3E3...`, EX5 `27B5F272...` — unchanged by either run (restored + verified).
- R2 Same-observation comparison (B-96 value | B-97 value | same material | same event/bar | join | evidence):
  - first multi bar: `2026.05.21 14:20 n=3 (ids 1/3/4)` | identical (same three rows modulo build field) | objId/startT/createT/bounds identical | same barT 1779373200 | mechanical match FOUND, never called proof | B-96 slice excerpts + B-97 rows.
  - max bar: `2026.06.02 23:00 n=84` | identical (84 direct-counted at 1780441200) | same | same bar | mechanical match FOUND, never proof | B-96/B-97 T4 + direct counts.
  - adjacent id=1 (13:50→13:55, 300 s) | identical | same rows 1779371400/1779371700 | same bars | mechanical match FOUND, never proof | both censuses + CSV.
  - promotion ex (id=4, 1;1;1, promoT==barT) | identical fields | same | same bar 1779374700 | mechanical match FOUND, never proof | both PROMO excerpts.
  - invalidation ex (id=1, 0;0;0) | identical fields | same | same bar 1779371400 | mechanical match FOUND, never proof | both INVAL excerpts.
  - header stamp: `(non-string passed)` | `2026.10.08 18:27:06` | different rendering by design (the B-97 fix) | n/a | DISTINGUISHING, not joining | both headers.
  - per-row stamp: `(non-string passed)` | `2026.10.08 18:27:06` | different by design | n/a | DISTINGUISHING | sampled rows.
  - EA stamp: `(non-string passed)` | `2026.10.08 18:27:18` | different by design | n/a | DISTINGUISHING | both FILE lines.
  - sym/period: USDJPY/300 | identical | same | n/a | match, never identity proof | both PROV lines.
- R3 Identity keys (present-both | collision/reuse | within-run | across B-96/B-97 | class; plausible ≠ proven):
  - `objId` alone: yes | ids restart at 0 every run (B-95 `:510`; same ids recur by construction on identical replay) | stable (adjacency) | UNPROVEN (recurring values excluded by rule; circular on same ticks).
  - dir+startT: yes | same rows both runs | stable | UNPROVEN (timestamps never proof; untested across windows).
  - dir+createT: yes | same | stable | UNPROVEN (same reason).
  - dir+startT+createT+bounds: yes; sample rows match exactly | stable | UNPROVEN (mechanical match on identical replay is circular for a general key; no joined pair exists in artifacts).
  - `SRJ_Types.mqh` composite (direction, startBar time, creation/detection time, bounds): design statement only; no join record | n/a | stable by design claim | UNPROVEN (no existing join; cross-window untested).
- R4 Same-stamp disambiguation: different source/artifact SHAs YES (all four diag SHAs differ); different build stamps YES (`(non-string passed)` vs timed stamps); same-second-different-build collision still possible in principle (1-second `__DATETIME__` resolution; B-63 same-stamp precedent stands unrefuted) → NOT disproven. Run tuple (EA+indicator+EX5 SHAs + labels `XOBDIAG-B96/B97` + window) DOES distinguish these two runs — but it is run-level provenance only (rows carry stamps, never SHAs), never a record-level join key.
- R5 Lifecycle joins (existing artifacts only; no joined pair → NOT FOUND):
  - adjacent within B-96: FOUND (id=1). Adjacent within B-97: FOUND (id=1). B-96→B-97 same object: NOT FOUND (recurring ids excluded; no joined pair). Promotion cross-run: NOT FOUND. Invalidation cross-run: NOT FOUND.
- R6 Missing-evidence table (item | B-96/B-97 evidence | status | consequence):
  - cross-run stable identity: same-window rows match; cross-window untested; objId unstable by design | NOT PROVEN | register-wide joins need a proven key.
  - record-level build provenance: B-97 rows valid; B-96 rows uninformative | NOT PROVEN generally (pairwise distinguishable) | run tuple carries disambiguation here.
  - same-stamp disambiguation: stamps+SHAs differ this pair; same-second case possible | NOT PROVEN | stamp alone never suffices.
  - cross-run promotion join: counts match (42514/254); no joined pair | NOT PROVEN | same.
  - cross-run invalidation join: counts match (48656); no joined pair | NOT PROVEN | same.
  - multi-window generality: single UJ day only | NOT TESTED | no session/feed claim.
- R7 Exactly one: `CROSSRUN-JOIN-NOT-PROVEN` — artifacts available and comparison performable, but no stable cross-run record join is proven. Provenance only; never a gate or a run.
- R8 No Part K, no Part T, no `.preB99` backups (none created).

## Part X - records

- X1 `PLANNER_CONTEXT.md` section 4 grep `B-99-XOB-CROSSRUN-PROVENANCE` = 0 -> appended exactly one lesson (verified 1). No duplicate.
- X2 `PLANNER_HANDOFF.md` section 3 grep `B-99` = 0 -> appended `- B-99: compared existing B-96/B-97 diagnostic artifacts for cross-run XOB identity and provenance; no source edit or run.` (verified 1). No duplicate.
- X3 Ledger grep `B99-XOB-CROSSRUN-PROVENANCE` = 0 and `^1244.` = 0 -> appended item `1244` (inventory, keys, stamps, joins, R7, no edit/compile/run, EA/EX5 SHAs). `^1243.` = 1 beside. No duplicate.
- X4 Pointer 20 -> 20 lines (cap 35): latest B-99 MEASURED, NOT-PROVEN decision, EA/EX5 unchanged, no compile/runs/gate, next follows cross-run result.

## Part F - file, push, reply

- F1 this result. F2 slice `BUILDER_SLICE_B99.md` (paths/hashes, comparison rows, key evidence, provenance, before/after lines; under 600 lines; no source diff, no run tables). F3 ledger 1244. F4 pointer per X4. F5 stages only the 6 relay files. F6 commit + push `builder/B-99` via `backup` + ls-remote check. Reply MEASURED.

## Final disk state (MEASURED turn; kept RKD build on disk, uncommitted)

- EA `137076D9CF85160AB8CD8379575AFD4801E71098CE97C0B10D88A42C7BF59671` (695359 B, LF-only, untouched; ` M` vs stale blob = expected uncommitted lag, never staged) + `.preB87`/`.B87PICKXOB`/`.preB96`/`.B96XOBEXPORT`/`.preB97`/`.B97PROV` kept uncommitted. EX5 `FA4C924978F6A1D5C57B725F2AB530BBB5DC5B1E0D1D0B51FB0172E80D8C41B5` (matching kept source). Indicator src/ex5 at gate SHAs, untouched. No source edit/compile/launch/run this turn (verified: SHAs equal B-98 gate values; no terminal64 action). Journal CSV, register, spec, skill untouched. terminal.ini + charts untouched.

No carried note (no STOP; nothing to ask him).
