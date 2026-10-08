# BUILDER SLICE B-99 - artifact paths/hashes, comparison rows, key evidence, provenance, before/after lines (cross-run review, MEASURED)

Scope: read-only comparison of existing B-96/B-97 artifacts + records. No edit, compile, launch, run, regeneration, re-grade. Live files only.

## START GATE (raw)

- `git ls-remote ... builder/B-98` = `0c3228bd84a0c3fed6b17e88c99dd3ccf0cdfcf5` (verified; cut builder/B-99 here).
- `git log -1` = `0c3228bd84a0c3fed6b17e88c99dd3ccf0cdfcf5 B-98 spec review of proven XOB export, contract partial on cross-run joins (relay B-98)`.
- `git status --short` line count = 378 (B-98 artifacts added; preserved, untouched).
- `git diff 0c3228bd... --` EMPTY on: pointer, RESULT/SLICE B98, RESULT/SLICE B97, RESULT/SLICE B96, PLANNER_CONTEXT, PLANNER_HANDOFF.
- EA `137076D9CF85...` / EX5 `FA4C924978F6...` / indicator src `956BF3E3ADB7...` / EX5 `27B5F272DCF...` (prefixes match; LF-normalized identical).
- No terminal64. No compile. No tester run.

## PART B GREPS (before/after)

- Operator message = B-99 relay order only; no new trading-rule words. Record `no new rule words`; appended nothing.
- `B-99-XOB-CROSSRUN-PROVENANCE` in 99_WORKFLOW 0→1 (context X1). `B-99` in 99_WORKFLOW 0→1 (handoff X2).
- `B99-XOB-CROSSRUN-PROVENANCE` in SRJ_FlowNexus_Local 0→1 (ledger 1244). `^1244.` 0→1; `^1243.` = 1 beside.

## R1 ARTIFACTS (local disk, read-only)

- B-96 CSV: NOT FOUND as B-96 content (same agent path overwritten by B-97; current header = B-97 build). B-96 evidence = journal rows (pass stamp 18:17:32.998) + STATUS/DONE (both FOUND, RESULT=PASSED) + B-96 records.
- B-97 CSV: FOUND (`Tester/.../Agent-127.0.0.1-3003/MQL5/Files/XOBDIAG.csv`, 22081976 B / 167639 lines, header `HEADER;USDJPY;300;106332;2026.10.08 18:27:06;1735776000`).
- Sources: `.B96XOBEXPORT` (ind `A4E66570` / EA `11B58FD8`) + `.B97PROV` (ind `4E3EDC08` / EA `4F9EDCF8`) both FOUND.
- Diag builds differ: B-96 ind `638CC25E` / EA `E7A41746` vs B-97 ind `05BD52B0` / EA `182E24C3`.
- Completions (day log): B-96 `61072 ticks, 288 bars ... Test passed in 0:01:23.791`; B-97 `61072 ticks, 288 bars ... Test passed in 0:01:06.981` (identical feed).
- Window both: USDJPY M5 2026.06.05→2026.06.06 (1780617600/1780704000), period 300.
- Counts both: bars 3289 / recs 167638 / maxPerBar 84. Kept SHAs unchanged both runs.

## R2 COMPARISON (observation | B-96 | B-97 | join)

- first multi: `14:20 n=3 (1/3/4)` | identical rows modulo build | mechanical FOUND, never proof.
- max bar: `23:00 n=84` (84 direct-counted at 1780441200) | identical | mechanical FOUND, never proof.
- adjacent id=1 (13:50→13:55, 300 s) | identical (CSV 1779371400/1779371700) | mechanical FOUND, never proof.
- promo ex id=4 (1;1;1, promoT==barT) | identical fields | mechanical FOUND, never proof.
- inval ex id=1 (0;0;0) | identical fields | mechanical FOUND, never proof.
- header/row/EA stamps: `(non-string passed)` | `2026.10.08 18:27:06` / `...18:27:18` | DISTINGUISHING by design.
- sym/period: USDJPY/300 both | match, never identity proof.

## R3 KEYS (key | both | reuse | within | across | class)

- `objId`: yes | restarts at 0/run (B-95 `:510`) | stable | UNPROVEN (recurring values excluded; circular).
- dir+startT: yes | same rows | stable | UNPROVEN (timestamps never proof; cross-window untested).
- dir+createT: yes | same | stable | UNPROVEN (same).
- dir+startT+createT+bounds: yes; samples match exactly | stable | UNPROVEN (no joined pair in artifacts; same-window replay circular).
- Types composite (dir, startBar time, creation/detection time, bounds): design only | n/a | by claim | UNPROVEN (no join record).

## R4 STAMPS (same-stamp analysis)

- Different SHAs YES (all four diag SHAs differ). Different stamps YES (uninformative vs timed).
- Same-second-different-build collision possible in principle (1-s `__DATETIME__`; B-63 precedent unrefuted) → NOT disproven.
- Run tuple (EA+ind+EX5 SHAs + `XOBDIAG-B96/B97` labels + window) distinguishes THESE runs — run-level only (rows carry stamps, never SHAs), never a record key.

## R5 JOINS (existing artifacts only)

- Adjacent B-96: FOUND (id=1). Adjacent B-97: FOUND (id=1).
- B-96→B-97 object/promo/inval: NOT FOUND (no joined pair; recurring ids excluded).

## R6 TABLE (item | evidence | status | consequence)

- identity: same-window match; cross-window untested; ids unstable | NOT PROVEN | register joins need a key.
- record provenance: B-97 rows valid; B-96 uninformative | NOT PROVEN generally | run tuple disambiguates here.
- same-stamp: differ here; same-second possible | NOT PROVEN | stamp alone never suffices.
- promo join: 42514/254 match; no pair | NOT PROVEN | same.
- inval join: 48656 match; no pair | NOT PROVEN | same.
- multi-window: one UJ day | NOT TESTED | no session/feed claim.

## R7 + RECORD LINES

- R7: `CROSSRUN-JOIN-NOT-PROVEN` — comparison performable; no stable join. Provenance only; never a gate/run.
- X1 context §4 appended once: `- B-99-XOB-CROSSRUN-PROVENANCE (planner lesson 2026-10-08, B-99): compared existing diagnostic artifacts for cross-run XOB identity and provenance without reopening readings or enabling a gate.`
- X2 handoff §3 appended once: `- B-99: compared existing B-96/B-97 diagnostic artifacts for cross-run XOB identity and provenance; no source edit or run.`
- X3 ledger `1244.` appended once (tag `B99-XOB-CROSSRUN-PROVENANCE`; inventory, keys, stamps, joins, R7, no edit/compile/run, EA/EX5 SHAs).
- X4 pointer 20→20 lines (cap 35): latest B-99 MEASURED; NOT-PROVEN; EA/EX5 unchanged; no compile/runs/gate; next follows cross-run result.
- Pre-commit re-check: X1/X2/X3 counts 1; `^1243.` = 1; staged set = 6 relay files only; no source diff; no run tables.

(End of slice)
