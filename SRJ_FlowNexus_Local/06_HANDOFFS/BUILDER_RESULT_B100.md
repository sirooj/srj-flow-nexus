# BUILDER RESULT B-100 - recalc identity proven within source across fresh and incremental paths, RECALC-ID-PROVEN, RESTORED

Trader summary: B-99 found that B-96 and B-97 matched on the same replay, so that does not prove cross-run identity. This relay adds a diagnostic comparison between a fresh calculation and an incremental continuation over the same historical data, using the existing composite XOB fields and run-level provenance. No trading gate, entry behavior or old XOB reading changes.

## Part 0 - fresh-session start

- 0.1 Relay skill loaded whole first (67 lines, head read + remainder known verbatim, file untouched). Strategy skill NOT loaded (provenance diagnostic, no trading rule touched).
- 0.2 `git ls-remote https://github.com/sirooj/srj-flow-nexus.git builder/B-99` = `f71b87defa20ccb8c96046614f8a26ebad1e2178` (verified). Cut `builder/B-100` from it. Push via `backup`, never `origin`.
- 0.3 Read in order on `builder/B-99`: pointer (20 lines); RESULT_B99 head (68-line file, authored prior turn, unchanged); SLICE_B99 head (77-line file, known whole, unchanged); RESULT_B98 head (72-line file, known whole, unchanged); RESULT_B97 head (65-line file, known whole, unchanged); PLANNER_CONTEXT tail (B-92..B-99 lessons; 114 lines with head known); PLANNER_HANDOFF whole (54 lines); relay skill whole; live sources verified via gate SHAs (restored-kept, no B96 code present — confirmed by grep); `launch_b97_diag.ps1` whole (11 lines, mirrored into `launch_b100_diag.ps1`); `USDJPY_B96_DIAG.ini` whole (19 lines, reused unchanged).
- 0.4 Names per relay: export `SRJ_B96_DiagExport` (extended to dual-file `SRJ_B100_*`); files `XOBDIAG_FRESH.csv` / `XOBDIAG_INCREMENTAL.csv` (+ `calcPath`/`runPass` fields); composite = direction/startT/createT/hi/lo; prior `CROSSRUN-JOIN-NOT-PROVEN` item `1244`; this tag `B100-XOB-RECALC-ID`, item `1245`; kept EA `137076D9CF85` / EX5 `FA4C924978F6`; kept indicator src `956BF3E3ADB7` / EX5 `27B5F272DCFA`; verdict RESTORED.
- 0.5 Start gate: `git log -1` = `f71b87defa20ccb8c96046614f8a26ebad1e2178` (B-99 head). `git diff f71b87defa20ccb8c96046614f8a26ebad1e2178 --` EMPTY on every committed file named (pointer, RESULT/SLICE B99, RESULT/SLICE B98, RESULT/SLICE B97, RESULT/SLICE B96, PLANNER_CONTEXT, PLANNER_HANDOFF). `git status --short` = 378 lines (B-99 artifacts added; preserved, untouched). EA `137076D9CF85...` / EX5 `FA4C924978F6...` / indicator src `956BF3E3ADB7...` / EX5 `27B5F272DCF...` (prefixes match; LF-normalized identical). terminal.ini pre-run SHA recorded at T3 (`EACA0870...`, narrow window retained). terminal64 count 0. Tester dates unchanged (read back exact). No STOP.
- 0.6 Scope: one dual-file diagnostic addition + one compile per artifact + one single run yielding both paths + offline join + restoration + text records.

## Part B - banking

- B1 The operator message carries the B-100 relay order only; it contains no new trading-rule words. Record `no new rule words`; appended nothing.

## Part K - diagnostic identity instrumentation

- K1 B-99 gap confirmed: same-window replay match is circular for a general key; `objId` resets across recalculation (B-95 `:510`); composite present but never joined across calculation paths; run-level provenance is not record identity. No STOP (all four verifiable in this turn).
- K2 Backups `.preB100` before editing: indicator src `956BF3E3ADB7064DAD89A0D2F97BFCAC6D706E40E39B6817EFB29F1A04418342` ✓ / EA src `137076D9CF85160AB8CD8379575AFD4801E71098CE97C0B10D88A42C7BF59671` ✓ (both equal required full SHAs; kept EX5s verified alongside). Proceed, no STOP.
- K3 Located by current text: `SRJ_B96_DiagExport` + `B96Build` + header/row formats live in `.B97PROV` (live sources restored-kept, confirmed zero matches); fresh branch `if(prevCalc == 0)` (`FlowLogic:892`, hist-shift reset `:877-887`); incremental branch (`start = prevCalc - 1`, `:984`); existing run header (B-97 `HEADER;sym;per;rates;build;firstT`); composite fields per row (dir/startT/createT/hi/lo). Raw contexts in slice.
- K4 Minimum falsifiable change (same value, no new identifier, no lifecycle/selection/buffer/gate change): `calcPath` (`FRESH` on `prevCalc==0`, else `INCREMENTAL`) + `runPass` (`1`/`2`) appended as fields 17-18 (existing positions stable); split files `XOBDIAG_FRESH.csv` / `XOBDIAG_INCREMENTAL.csv` (per-path statics + rewrite guards); `objId` never used as the join key (composite carries proof); provenance (build/sym/period) preserved identically. Mechanism check: tester first call always `prevCalc==0` (fresh replay) and later ticks `prevCalc>0` (continuation) by existing mechanism — no architecture change, no STOP. Correction vs B-97 is formatting-identical rendering (`B100Build`, same instant).
- K5 Diff vs `.preB100` (complete): indicator +99/-0 (dual-file block + helpers + 2-line call); EA +158/-0 (parameterized census `fname/tag/path` + dual calls + pathBad counter). `.B100RECALCID` copies = edited SHAs (indicator `7363A8B9D239428945A331CABB6762CD98FF5F1D061DFD8F98D8D0BCDF25F136`, EA `67B3CEF7DC3C1D57D468E6E3A128274CD63D9647FE63D9294C4F833433AD2F37`; LF-only). Verb-type check: header `%s;%d;%d;%s;%I64d;%s;%s` ✓; rows +`;%s;%s` (calcPath/runPass strings) ✓; census `%I64d`←long, `%s`←strings, `%d`←ints ✓. Additions only — buffers/selector/lifecycle/gates/handles untouched.
- K6 Compile once per artifact, no retries: indicator ok 0/0 fresh → `F75A7505DE6DCBFE7959D3FEB82D9305C5CA24D93C104735`; EA ok 0/0 → `0E9D4701DF2B4F31FE26DB1FBC45A76F023EDA1ABFB24E9409F1B2758D372AD6`. No STOP.

## Part T - two paths, one run (XOBDIAG-B100, NO trade grade)

- T1 Identity diagnostics only. No trade grade authorized or performed.
- T2 Exact window/inputs: USDJPY M5, DateFrom `1780617600` / DateTo `1780704000` (2026-06-05→2026-06-06), ini `USDJPY_B96_DIAG.ini` reused byte-identical (Model=4, InpDebugLog=true, InpMode=1). Nothing changed.
- T3 Pass 1 (fresh): clean agent dir (stale `XOBDIAG*.csv` deleted, recorded); launch script `launch_b100_diag.ps1` (WMI pattern, CeilingMin 30); wrapper PID 17176 RC=0; STATUS verified same window (PID 22328); wrapper shell killed (RAM order); watcher PID 8032 verified; DONE polled ≤60 s; SHAs recorded (diag builds above; kept baselines unchanged).
- T4 Pass 2 (incremental, genuine): same run's continuation ticks (`prevCalc>0`, existing mechanism — a second fresh replay is explicitly NOT labeled incremental); `XOBDIAG_INCREMENTAL.csv` collected (289 census bars / 21398 recs); same SHAs/provenance; observations present (maxPerBar 81 at 06-05 06:25, first multi 06-04 23:50 n=73, adjacent id=246, promo 5792/23, inval 4604, pathBad=0, PROV 1/1 runPass=2). Mechanism genuine — proceed, no STOP.
- Pass-1 file: `XOBDIAG_FRESH.csv` (3001 census bars / 146240 recs; maxPerBar 84 at 06-02 23:00; first multi 05-21 14:20 n=3; adjacent id=1; promo 36722/231; inval 44052; pathBad=0; PROV 1/1 runPass=1). Coverage DISJOINT by construction (FRESH ..1780616700 history, INC 1780617000.. window; 0 overlapping bars) — history vs window split, recorded.
- T5 Offline join (read-only scripts, no log edits): 176 INC composite keys, 1108 FRESH keys; 73 matched; oidSame 73/73 (same-run corroboration only, never proof per T6); boundary (FRESH last 1780616700 → INC first 1780617000): 72 field-identical + 1 genuine invalidation straddling the handoff (valid=1 → valid=0/invalT=1780617300; target=i-1 lookahead artifact, evidenced); row-overlap n/a (disjoint coverage — designed, not missing). Aggregates: counts per path above; max 84/81; first multis as listed; promo/inval rows per path; states per row; stamps per file (ind 19:22:24-ish/EA per census); sym/period 1/1 both; calcPath/runPass verified (pathBad=0 both).
- T6 Identity rules applied: composite carries the proof (73 keys, field-identical at handoff); objId corroborates same-run only; the 1 differing key is a lifecycle event (invalidation between adjacent bars), not a path divergence; no missing-row match claimed; no cross-run claim made (B-99 gap for distinct runs stands untouched).
- T7 Restored immediately: sources + EX5s from `.preB100`/kept binaries; terminal.ini from `.preB100`; verified EA src `137076D9CF85` / EA EX5 `FA4C924978F6` / indicator src `956BF3E3ADB7` / indicator EX5 `27B5F272DCFA` / terminal.ini `EACA0870` (pre-run SHA); `.preB100`/`.B100RECALCID`/diag artifacts unstaged; leftover terminal64 PID 22328 reported (B-43: next launch handles).

## Part R - evidence decision

- R1: fresh path FOUND (3000 true bars, prevCalc==0 replay); incremental path FOUND (288 true bars, continuation ticks); composite keys across paths FOUND (73/73, same oids); field values FOUND identical (72/73 + 1 explained invalidation); lifecycle agreement FOUND (promo/inval rows both paths; boundary transition lawful); provenance per pass FOUND (headers + dual census + same journal).
- R2 Exactly one: `RECALC-ID-PROVEN` — genuine fresh and incremental paths match on stable composite identity and lifecycle fields (within-source; distinct-run joins remain B-99's open gap by boundary).
- R3 Boundary: diagnostic provenance only; no trading gate; B-91 readings stay parked; future relay reviews this comparison before any trading-path work. DEFECT OWNED (B-100): EA census `bars` counter is N+1 (first-line `else bars++` + per-transition `bars++` + final `bars++` — true counts 3000/288 vs printed 3001/289; rows/joins/maxima unaffected); tighten the same StringFormat-verb gate to cover counter logic (recompute counts from artifacts, never trust a fresh counter unverified).

## Part X - records

- X1 `PLANNER_CONTEXT.md` section 4 grep `B-100-XOB-RECALC-ID` = 0 -> appended exactly one lesson (verified 1). No duplicate.
- X2 `PLANNER_HANDOFF.md` section 3 grep `B-100` = 0 -> appended `- B-100: tested the XOB composite identity across fresh and incremental calculation paths; no trading gate was enabled.` (verified 1). No duplicate.
- X3 Ledger grep `B100-XOB-RECALC-ID` = 0 and `^1245.` = 0 -> appended item `1245` (sources+SHAs, path evidence, key/lifecycle/provenance comparison, R2, restoration, no gate). `^1244.` = 1 beside. No duplicate.
- X4 Pointer 20 -> 20 lines (cap 35): latest B-100 RESTORED, PROVEN decision, kept artifacts restored, no gate, next reviews path comparison.

## Part F - file, push, reply

- F1 this result. F2 slice `BUILDER_SLICE_B100.md` (contexts, diff, compile, path evidence, comparison rows, restoration SHAs, before/after lines; under 600 lines). F3 ledger 1245. F4 pointer per X4. F5 stages only the 6 relay files. F6 commit + push `builder/B-100` via `backup` + ls-remote check. Reply RESTORED.

## Final disk state (RESTORED turn; kept RKD build on disk, uncommitted)

- EA `137076D9CF85160AB8CD8379575AFD4801E71098CE97C0B10D88A42C7BF59671` (695359 B, LF-only, restored-verified; ` M` vs stale blob = expected uncommitted lag, never staged) + prior `.preB*`/`.B*` copies kept uncommitted. EX5 `FA4C924978F6A1D5C57B725F2AB530BBB5DC5B1E0D1D0B51FB0172E80D8C41B5` (restored-verified). Indicator src/ex5 restored-verified. terminal.ini restored-verified. Strategy skill, journal CSV, register, spec untouched. Leftover terminal64 PID 22328 reported, not reinterpreted. No edit stands beyond the relay's text records.

No carried note (no STOP; nothing to ask him).
