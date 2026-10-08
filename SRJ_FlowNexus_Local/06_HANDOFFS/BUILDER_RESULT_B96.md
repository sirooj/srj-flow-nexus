# BUILDER RESULT B-96 - diagnostic XOB export: 84-record bars proven EA-readable, build-stamp defect owned, DIAGNOSTIC-EXPORT-PARTIAL, RESTORED

Trader summary: B-95 proved the internal XOB objects contain the needed fields, but the EA only receives one selected XOB per bar and the print rows cannot be joined reliably across recalculation or runs. This relay adds no trading rule and does not enable the XOB gate. The builder creates the smallest provenance-preserving diagnostic export needed to expose the complete live-XOB records by historical bar, then proves it compiles and can be read without changing admission behavior.

## Part 0 - fresh-session start

- 0.1 Relay skill loaded whole first (67 lines). Strategy skill NOT loaded (diagnostic export, no trading rule touched).
- 0.2 `git ls-remote https://github.com/sirooj/srj-flow-nexus.git builder/B-95` = `fa6226d73d498253a643b5d6666db70506d60edc` (verified). Cut `builder/B-96` from it. Push via `backup`, never `origin`.
- 0.3 Read in order on `builder/B-95`: pointer (20 lines); RESULT_B95 (86) + SLICE_B95 head (90-line file, full text known from authorship, unchanged); RESULT_B94 head (64-line file, known whole, unchanged); SLICE_B94 head (79-line file, known whole, unchanged); PLANNER_CONTEXT tail (B-92..B-95 lessons; 106 lines total with head known); PLANNER_HANDOFF whole (46 lines); relay skill whole; spec v4.2 whole (covered across B-93..B-95 whole reads on the unchanged file — spec never edited). Source regions read by text: indicator export block `:1195-1269`, loop/freshcalc `:876-987`, publish vicinity `:1064-1133`, build stamp `:671`, OnDeinit `:841-851`, OnCalculate head `:851-875`; Types factory `:240-304`; State reset `:425-524`; EA OnDeinit `:11572-11891`; launch script `launch_june0525_b69_run.ps1` whole (12 lines, mirrored).
- 0.4 Names per relay: indicator `Indicators/SRJ_FlowLogic.mq5`; type `COrderblock`; collection `g_orderblocks`; kept EA prefix `137076D9CF85`; kept EX5 prefix `FA4C924978F6`; indicator disk SHA `956BF3E3ADB7064DAD89A0D2F97BFCAC6D706E40E39B6817EFB29F1A04418342`; prior `B95-XOB-PERSISTENCE-PROVENANCE` item `1240`; this tag `B96-XOB-DIAGNOSTIC-EXPORT`, item `1241`; result/slice B-96; verdict RESTORED.
- 0.5 Start gate: `git log -1` = `fa6226d73d498253a643b5d6666db70506d60edc` (B-95 head). `git diff fa6226d73d498253a643b5d6666db70506d60edc --` EMPTY on every committed file named (pointer, RESULT/SLICE B95, RESULT/SLICE B94, PLANNER_CONTEXT, PLANNER_HANDOFF). `git status --short` = 359 lines (preserved drift + untracked dirt, untouched). EA disk SHA `137076D9CF85160AB8CD8379575AFD4801E71098CE97C0B10D88A42C7BF59671` (prefix matches; LF-only). EX5 disk SHA `FA4C924978F6A1D5C57B725F2AB530BBB5DC5B1E0D1D0B51FB0172E80D8C41B5` (prefix matches; binary). Indicator + include SHAs recorded at K7. terminal64 count 0 before compile/launch. terminal.ini semantics preserved (content copy + restore, T6). No STOP.
- 0.6 Scope: narrow export + read-only consumer + one compile attempt per artifact + one diagnostic run + text records (details below per relay order).

## Part B - banking

- B1 The operator message carries the B-96 relay order only; it contains no new trading-rule words. Record `no new rule words`; appended nothing.

## Part K - diagnostic export

- K1 Rule/scope check: B-95 R7 `PERSISTENCE-MISSING-PROVENANCE-MISSING` — fields exist internally, but complete historical multi-XOB persistence and record-level provenance were not proven. This relay exports evidence only: the file writer and the end-of-run census feed no admission, confirmation, target, stop or exit decision (verified by diff: additions only, no gate call site touched). Selected buffers 22/23/31/33/34 keep exact meanings (publish block `:1206-1234` byte-identical). No trading control flow changes — proceed, no STOP.
- K2 Required content: every record dumps barT/objId/dir(B/S)/hi/lo/startT/createT/promoT-or-NA/valid/act/prom/valT-or-NA/invalT-or-NA/invalLvl-or-NA/build; invalidationBar never relabeled (no kill vocabulary anywhere); unset fields emit literal `NA` (never a nearby substitute); header carries symbol/periodSec/rates/build/firstBarT.
- K3 Identity/provenance: objId carried per row but never used as a cross-recalc/run key (census joins adjacency within one segment only); composite material present per row (dir/startT/createT/bounds); run/build provenance = header sym/period/build + per-row build + same-journal read; no stable cross-run join key invented (none claimed); within-segment adjacent-bar stability observed (see T4).
- K4 Snapshot: export call sits after the `:1206-1234` selected publish (post-mutation: all mutators ran by `:1062`), inside `if(target>=0)`, keyed at `bt[target]` (same slot the buffers publish); whole collection dumped (no `SRJ_NearestPromotedOBIndex` filter); multiple records per bar preserved (max 84 observed); collection never deleted/pruned/reordered for export; `g_orderblocks` lifecycle untouched; selected publish block untouched.
- K5 Mechanism: per-bar flat file `XOBDIAG.csv` (tester agent Files dir) — chosen because indicator buffers carry one value per bar (cannot hold unbounded multi-record history) and prints are log-only (explicitly excluded as EA-readable); files are additive only (no buffer/handle/gate/lifecycle change). EA consumer = `SrjB96DiagCensus()` in existing `OnDeinit` (handles still valid), `InpDebugLog`-gated, streaming single pass, print-only. No operator question asked.
- K6 Contexts (raw in slice): `COrderblock` (`Types:37-92`), `g_orderblocks` decl (`State:269`), pass order (`FlowLogic:1023-1062`, ascending `for(i=start...)`, fresh `start=2` vs incremental `prevCalc-1`), publish block (`:1202-1234`, `target=i-1`), export point (new call after `:1234`), build stamp (`:671` log-only print), EA `OnDeinit` tail (`:11871-11885`, releases after census). Diff vs `.preB96`: indicator +77/-0 (75-line block + 2-line call; 3 lines gained one leading space, proven whitespace-only via `--ignore-all-space` = +77/-0); EA +149/-0 (145-line census + 2-line call + 2 maxN fixes inside the new function). `.B96XOBEXPORT` copies = edited SHAs. Disk SHAs: edited indicator `A4E66570F9BB3ABD1A448F23E5C9E70D14E9F93B620AEDC20CFBE678CA9E1342`; edited EA `11B58FD863A511E785CEA1ACCBE872C72F4DE0F1C2343B3C6359423E93D99A70` (LF-only, normalized identical). Selected buffers + every gate call site unchanged (additions only).
- K7 Backups before compile: `SRJ_FlowLogic.mq5.preB96` = `956BF3E3ADB7064DAD89A0D2F97BFCAC6D706E40E39B6817EFB29F1A04418342`; `SRJ_FlowNexus_EA.mq5.preB96` = `137076D9CF85160AB8CD8379575AFD4801E71098CE97C0B10D88A42C7BF59671`; ex5 backups `27B5F272DCFAF6089CBE6E74DB2D61A1EBA49904720EB2C41FF56A22B46DDF90` (indicator) + `FA4C924978F6A1D5C57B725F2AB530BBB5DC5B1E0D1D0B51FB0172E80D8C41B5` (EA). Compile attempt 1 (indicator): ok, 0 errors, 0 warnings, binary fresh → diag ex5 `638CC25E51667DFF54056B9D837069C69C92372AC7D64DDB6F3B268155EB21B1`; attempt 2 (EA): ok, 0 errors, 0 warnings, 6931 ms → diag ex5 `E7A417468F332359E17A838AC2D0B9D9F18484F2AEC94F12684506F438D08738`. No retries. No STOP.

## Part T - one diagnostic run (XOBDIAG-B96, NOT a kept trial, NO trade grade)

- T2 Window: USDJPY 2026.06.05 day only (FromDate 2026.06.05 / ToDate 2026.06.06; terminal.ini DateFrom `1780617600` / DateTo `1780704000`, read back; 5 June named in B-40/B-59/B-75 with promotions, kills and flips). New ini `USDJPY_B96_DIAG.ini` (June inputs mirrored: Model=4, InpDebugLog=true, InpMode=1). No existing narrower window named — 5 June identified from records, no STOP.
- T3 Pre-launch: terminal64 count 0; content copies (`terminal.ini.preB96` = `5F0336A0...`, charts: 0 files on disk, recorded); artifacts verified (diag ex5 SHAs above); terminal.ini dates written + read back (`Symbol=USDJPY`, `1780617600`/`1780704000`); launch via new script `launch_b96_diag.ps1` (WMI pattern mirrored from `launch_june0525_b69_run.ps1`, CeilingMin 30); wrapper PID 5908 RC=0; STATUS verified start (`testing ... from 2026.06.05 00:00 to 2026.06.06 00:00`, PID 18332, journal growing); wrapper shell killed per RAM order; watcher PID 23244 verified; DONE polled in ≤60 s cycles.
- T4 Diagnostic evidence only (journal `Tester/logs/20261008.log`, EA pass stamp 18:17:32.998; direct CSV at `Tester/.../Agent-127.0.0.1-3003/MQL5/Files/XOBDIAG.csv`, 22081976 B / 167639 lines):
  - multi-record bar: `B96DIAG_FILE bars=3289 recs=167638 maxPerBar=84 atBar=2026.06.02 23:00` — 84 verified by direct count at barT `1780441200` (anchor-derived from the MULTI pair, no tz guessing).
  - first multi bar: `B96DIAG_MULTI bar=2026.05.21 14:20 n=3` (ids 1/3/4 raw, same barT 1779373200).
  - adjacent-bar same record: `B96DIAG_ADJACENT id=1 t1=2026.05.21 13:50 t2=2026.05.21 13:55 diffSec=300` — matches CSV rows (id=1 at 1779371400 + 1779371700).
  - promotion: `B96DIAG_PROMO rows=42514 atBar=254` (eg id=4 flags 1;1;1, promoT==barT).
  - invalidation: `B96DIAG_INVAL rows=48656` (eg id=1 flags 0;0;0; zone/level on row).
  - provenance: `B96DIAG_PROV fileSym=USDJPY eaSym=USDJPY symMatch=1 filePer=300 eaPer=300 perMatch=1`.
  - EA readability: census printed from the same-run file in the same journal — file sharing proven (no NOT FOUND).
  - Completion: `USDJPY,M5: 61072 ticks, 288 bars ... Test passed in 0:01:23.791`; RESULT=PASSED. Balance line present, never compared (no trade grade per T1/T5).
- T5 No valid/invalid trade graded; export never called complete from one XOB (84-record max observed); print rows never treated as EA-readable.
- T6 Restored immediately: sources + ex5s + terminal.ini from `.preB96`; verified `137076D9CF85...` / `FA4C924978F6...` / `956BF3E3ADB7...` / `27B5F272DCFA...` / `5F0336A0...` (all byte-identical to backups); leftover terminal64 PID 18332 reported (B-43: next launch handles); no diagnostic source/artifact staged (all untracked; F3 stages only the 6 text records).

## Part R - evidence decision

- R1 Observations: multi-record history FOUND (84/bar, 167638/3289); adjacent-bar identity FOUND (id=1, 300 s step); promotion FOUND (42514 rows, 254 at-bar); invalidation FOUND (48656 rows); run provenance sym/period FOUND, build stamp NOT FOUND as informative text (defect below); EA readability FOUND.
- R2 Exactly one: `DIAGNOSTIC-EXPORT-PARTIAL` — the export works end to end (fields, multi-record history, adjacency, lifecycle events, sym/period provenance, EA read), but the build-stamp field is missing: `__DATETIME__` is a datetime constant, so `%s` renders `(non-string passed)` in the header, every row and the EA `eaBuild` (defect owned, builder format-string error; caught by the run evidence; no retry per K7, filed as-is). This decision authorizes no trading gate; a separate relay reviews the evidence first.
- DEFECT OWNED (B-96): `%s` + `__DATETIME__` (datetime, not string) → `(non-string passed)`; correct form is `TimeToString(__DATETIME__)` or `%I64d` seconds. Skill gate to tighten: verify every `StringFormat` verb against its argument type before compiling (a print that cannot render its provenance proves nothing).

## Part X - records

- X1 `PLANNER_CONTEXT.md` section 4 grep `B-96-XOB-DIAGNOSTIC-EXPORT` = 0 -> appended exactly one lesson (verified 1). No duplicate.
- X2 `PLANNER_HANDOFF.md` section 3 grep `B-96` = 0 -> appended `- B-96: attempted a diagnostic-only upstream XOB export; no trading gate was enabled; next relay reviews the export evidence.` (verified 1). No duplicate.
- X3 Ledger grep `B96-XOB-DIAGNOSTIC-EXPORT` = 0 and `^1241.` = 0 -> appended item `1241` (sources + SHAs, fields, compile/run, observations, R2, restoration, no gate). `^1240.` = 1 beside. No duplicate.
- X4 Pointer 20 -> 20 lines (cap 35): latest B-96 RESTORED, PARTIAL decision, kept artifacts restored, no gate, next relay reviews evidence.

## Part F - file, push, reply

- F1 this result. F2 slice `BUILDER_SLICE_B96.md` (contexts, diff, compile, run evidence, provenance rows, restoration SHAs, before/after lines; under 600 lines). F3 ledger 1241. F4 pointer per X4. F5 stages only the 6 relay files. F6 commit + push `builder/B-96` via `backup` + ls-remote check. Reply RESTORED.

## Final disk state (RESTORED turn; kept RKD build on disk, uncommitted)

- EA `137076D9CF85160AB8CD8379575AFD4801E71098CE97C0B10D88A42C7BF59671` (695359 B, LF-only, restored-verified; ` M` vs stale blob = expected uncommitted lag, never staged) + `.preB87`/`.B87PICKXOB`/`.preB96`/`.B96XOBEXPORT` kept uncommitted. EX5 `FA4C924978F6A1D5C57B725F2AB530BBB5DC5B1E0D1D0B51FB0172E80D8C41B5` (restored-verified). Indicator src/ex5 restored-verified (`956BF3E3...`/`27B5F272...`). terminal.ini restored-verified (`5F0336A0...`). Strategy skill, journal CSV, register, spec untouched. No terminal64 action beyond reporting PID 18332. No edit stands beyond the relay's text records.

No carried note (no STOP; nothing to ask him).
