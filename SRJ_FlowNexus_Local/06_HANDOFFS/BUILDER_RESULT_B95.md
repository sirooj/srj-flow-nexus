# BUILDER RESULT B-95 - XOB persistence and provenance: print-only multi-record events, no complete map, PERSISTENCE-MISSING-PROVENANCE-MISSING, MEASURED

Trader summary: B-94 found that the indicator internally has the XOB fields we need, but it did not prove that every live XOB survives as a historical per-bar record or that a record can be joined to a specific build and journal run. This relay investigates those two gaps directly from existing source and records. No source edit, export, compile, tester run, or XOB gate is authorized until the evidence is proven.

## Part 0 - fresh-session start

- 0.1 Relay skill loaded whole first (67 lines). Strategy skill NOT loaded (persistence/provenance investigation, no trading rule touched).
- 0.2 `git ls-remote https://github.com/sirooj/srj-flow-nexus.git builder/B-94` = `887b48f5deacd01b3232fb90d4486579c3a8a53a` (verified). Cut `builder/B-95` from it. Push via `backup`, never `origin`.
- 0.3 Read in order on `builder/B-94`: pointer (20 lines); RESULT_B94 (64) + SLICE_B94 (79) whole; RESULT_B93 head (78-line file, full text known from the B-93/B-94 whole reads, unchanged); PLANNER_CONTEXT tail (B-92..B-94 lessons) + head known (104 lines total); PLANNER_HANDOFF whole (44 lines); relay skill whole; spec v4.2 whole (covered across the B-93/B-94 whole reads on the unchanged file — spec never edited, gate diff empty on all relay paths). Inspected live `Indicators/SRJ_FlowLogic.mq5`, `Include/SRJ/SRJ_Types.mqh`, `Include/SRJ/SRJ_OrderblockMgr.mqh`, `Experts/SRJ_FlowNexus_EA.mq5` plus existing B-series records and the journal evidence they name.
- 0.4 Names per relay: indicator `Indicators/SRJ_FlowLogic.mq5`; type `COrderblock`; collection `g_orderblocks`; buffers 22/23/31/33 (+34 provenance); 11 internal fields as listed; kept EA prefix `137076D9CF85`; kept EX5 prefix `FA4C924978F6`; prior `B94-XOB-EVIDENCE-CONTRACT` item `1239`; this tag `B95-XOB-PERSISTENCE-PROVENANCE`, item `1240`; result/slice B-95; verdict MEASURED.
- 0.5 Start gate: `git log -1` = `887b48f5deacd01b3232fb90d4486579c3a8a53a` (B-94 head). `git diff 887b48f5deacd01b3232fb90d4486579c3a8a53a --` EMPTY on every committed file named (pointer, RESULT/SLICE B94, RESULT B93, PLANNER_CONTEXT, PLANNER_HANDOFF). `git status --short` = 359 lines (preserved drift + untracked dirt, untouched). EA disk SHA `137076D9CF85160AB8CD8379575AFD4801E71098CE97C0B10D88A42C7BF59671` (695359 B; LF-only; prefix matches). EX5 disk SHA `FA4C924978F6A1D5C57B725F2AB530BBB5DC5B1E0D1D0B51FB0172E80D8C41B5` (prefix matches; binary). No terminal64. No compile. No tester run. No STOP.
- 0.6 Scope MEASURED (read-only inspection + classification; B-95 text records only). No Part K, no Part T, no `.preB95` backups.

## Part B - banking

- B1 The operator message carries the B-95 relay order only; it contains no new trading-rule words. Record `no new rule words`; appended nothing.

## Part R - persistence and provenance investigation

- R1 `g_orderblocks` lifecycle by text (raw excerpts in slice; persistence never inferred from existence alone):
  - declaration/type: `CArrayObj g_orderblocks;` (`Include/SRJ/SRJ_State.mqh:269`). Consequence: runtime multi-object store, no history semantics of its own.
  - creation: `NewOrderblock(...)` factory (`Include/SRJ/SRJ_Types.mqh:252-280`) — `new COrderblock()`, all fields stamped, `objId = SRJ_NextObjId()` (`:278`). Consequence: identity minted at discovery; ids ascend within a run segment.
  - insertion: `g_orderblocks.Add(ob)` (`Include/SRJ/SRJ_OrderblockMgr.mqh:260/:365`). Consequence: collection grows at discovery.
  - mutation: validation `isValid=true/validationBar` (`:114-115` replay, `:459-460` discovery); invalidation `isValid=false/invalidationBar` (`:132-133` replay, `:514-515` discovery); activation `isActivated=true` (`:113`, `:458`); promotion `isPromoted=true` (`:817`) + `promotionBar=i` at both call sites (`:894`, `:949`). Consequence: fields evolve in place on the same object across bars while it survives.
  - deletion: `g_orderblocks.Delete(k)` (`:1122` pruning, `:1134` over-cap via `SRJ_OBOverCap` `:1128`). Consequence: objects vanish; no tombstone retained.
  - pruning: `SRJ_OB_PruningPass` (`:1108-1119`, called `FlowLogic:1062`) + `SRJ_OB_InactiveLinePrunePass` (`FlowLogic:1036`). Consequence: history bounded by lookback by deletion.
  - reset: `SRJ_StateInit()` (`SRJ_State.mqh:315-513`) frees (`:471-485`) and clears all collections incl. `g_orderblocks.Clear()` (`:486`), restarts `g_objSeq`/`g_srjObjIdSeq` (`:509-510`, "ids restart with the object arrays"); called `FlowLogic:810` (init) and `:973` (recalc path). Consequence: full recalc destroys every object and re-mints ids from 0 — ids recur across recalcs/runs as different objects (agrees with B-49: ids are per-run objects).
  - bar/tick order per bar (`FlowLogic:1023-1062`): Creation → BiasReset → ActivationInvalidation → CounterAgg → InactivePrune → OpposingCache → WeakFlipLatch → StructureDetection → DecisionBlock → DeferredPromotion → Pruning. Consequence: one ordered mutation sequence per bar; export block reads post-promotion state (`:1206-1230`).
  - retained vs rebuilt: retained incrementally between bars (`prevCalc`, `FlowLogic:876`; loop covers only new bars per B-59); destroyed + rebuilt on recalc. Consequence: cross-bar identity holds only within a run segment.
  - historical snapshot: NOT retained — per-bar persistence is buffers 22/23/31/33 (one selected pick) only. Consequence: no per-bar multi-record history exists in state.
- R2 Field write/read table (survives-bars / survives-reset / historical-access = FOUND / NOT FOUND / UNKNOWN):
  - startBar: write factory `Types:260` | reads selector nearby/diagnostics | survives-bars FOUND | survives-reset NOT FOUND | historical-access NOT FOUND (print-only per event).
  - creationBar: factory `:277` | reads `:510` guard | FOUND | NOT FOUND | NOT FOUND.
  - promotionBar: `:894`/`:949` | reads `:1225` + buffer-33 publish | FOUND | NOT FOUND | NOT FOUND as map (print-only per promotion).
  - validationBar: `:115`/`:460` | reads same-bar guards `:137`/`:509-524` | FOUND | NOT FOUND | NOT FOUND.
  - invalidationBar: `:133`/`:515` | reads: none as gate (kill-held via prints) | FOUND | NOT FOUND | NOT FOUND.
  - invalidationLevel: factory `:267` | reads invalidation tests | FOUND | NOT FOUND | NOT FOUND.
  - isBullish: factory `:268` | reads selector `:1095-1096` | FOUND | NOT FOUND | NOT FOUND.
  - isValid: `:114`/`:132`/`:459`/`:514` | reads `:1099` + prints | FOUND | NOT FOUND | NOT FOUND.
  - isActivated: `:113`/`:458` | reads `:1100` + prints | FOUND | NOT FOUND | NOT FOUND.
  - isPromoted: `:817` (via `SRJ_ApplyPromotion`) | reads `:1098` | FOUND | NOT FOUND | NOT FOUND.
  - objId: factory `:278` | reads prints/buffers | FOUND within segment | NOT FOUND (restart `:510`) | NOT FOUND (unstable across recalc/runs).
- R3 Historical-map question — exactly one: `PRINT-ONLY-MULTI-RECORD`. Buffers 22/23/31/33/34 persist ONE selected record per bar (init EMPTY/0.0 `:928-953`, per-target writes `:1206-1230`) — selected-projection-only, never a map. Prints carry per-event multi-record rows from the SAME runtime collection: `XOB-PROMOCENSUS` per promotion (`OrderblockMgr:910/:956`, objId/obStart/obVal/obInval/promoBar/promoT) and `OBPROV` codes 1-4 per object event (`:177/:187/:559/:569`, id+bar; codes 5-8 carry id=0). No single row carries a full live set for a bar (B-75 joined them into census tables with unzoned=NOROW gaps). Prints are never EA-readable (B-84 K3 stands).
- R4 Build/run provenance (scope + stability + exact evidence):
  - indicator build stamp `Print("SRJ BUILD ", __DATETIME__, ...)` (`FlowLogic:671`): run scope (log line per run); NOT stable across recompiles by construction; cannot distinguish same-stamp builds (B-63: identical stamp j27/j28/j29).
  - EA SHA / indicator SHA / gate SHAs (pointer line 9: EA 137076D9..., FlowLogic 956BF3E3/ex5 27B5F272, MARKER...): run scope (disk-file identity); stable across runs of unchanged files; not attached to any XOB record.
  - journal headers / tester identifiers / window ticks-bars / balance lines: run scope; stable per run; not per-record.
  - run labels (j43/j44/RECON names): run scope; stable per run; not per-record.
  - `objId`: record scope but run-segment scope stability; NOT stable across recalculation (`:510` restart; `Types:22-30`); NOT stable across runs (ids recur as different objects, B-49).
  - composite key (direction, startBar time, creation/detection time, bounds): recalc-stable BY DESIGN STATEMENT (`Types:28-29`); cross-run join UNPROVEN (no existing record joins on it).
- R5 Existing-record comparisons (NOT FOUND unless already present; nothing generated, nothing invented):
  - adjacent bars (same XOB tracked bar-to-bar): NOT FOUND (PROMOCENSUS rows are single per-promotion events; buffer 31 carries ids per bar but no journal logs the per-bar id stream).
  - promotion event (object joined to its promotion): FOUND (`XOB-PROMOCENSUS` rows carry objId+promoBar+promoT+obStart, `Mgr:910/:956`).
  - invalidation event (object joined to its kill): FOUND as event rows (`OBPROV` code 3/4 carry id+bar, `:559/:569`) WITHOUT zone/level (B-40: zone/mid/close NOT_PRINTED everywhere).
  - reset/pruning (same object across): NOT FOUND (only B-75's set-level kill comparison: 0 picks of 562 bulk-killed ids after run start, 0 overlap with 643 live-killed ids — sets, not objects).
  - two runs (same XOB across): NOT FOUND (no cross-run join exists; ids recur).
- R6 Contract reclassification (B-94 fields → historical lens):
  - identity: NOT-PROVEN-HISTORICALLY (recalc instability proven `:510`; composite key unproven as join key).
  - direction: PROVEN-PRINT-ONLY (per-event `bias=` in PROMOCENSUS rows).
  - zone high/low: PROVEN-SELECTED-ONLY (buffers; multi-record NOT-PROVEN-HISTORICALLY — B-75 NOROW gaps).
  - formation: PROVEN-PRINT-ONLY (`obStart/obStartT` per promotion).
  - promotion time: PROVEN-PRINT-ONLY (`promoBar/promoT` per promotion; plus selected-only buffer).
  - invalidation state + event time: PROVEN-PRINT-ONLY (`OBPROV` code 3/4 id+bar; no zone/level).
  - historical bar/timestamp: PROVEN-PRINT-ONLY (bar indices + time strings in rows).
  - multi-record coexistence: PROVEN-INTERNAL at runtime / NOT-PROVEN-HISTORICALLY persisted.
  - four-state distinction: PROVEN-INTERNAL as logic / NOT-PROVEN-HISTORICALLY per record.
  - run/build provenance per record: UNKNOWN (no per-record join key proven).
- R7 Decision — exactly one: `PERSISTENCE-MISSING-PROVENANCE-MISSING` (no complete per-bar multi-XOB map: NOROW gaps + recalc-unstable ids; provenance also unproven). Evidence only; never permission.
- R8 No Part K, no Part T, no `.preB95` backups.

## Part X - records

- X1 `PLANNER_CONTEXT.md` section 4 grep `B-95-XOB-PERSISTENCE-PROVENANCE` = 0 -> appended exactly one lesson (verified 1). No duplicate.
- X2 `PLANNER_HANDOFF.md` section 3 grep `B-95` = 0 -> appended `- B-95: traced internal XOB persistence and run provenance without source edits or runs; the separator remains parked pending proof of both.` (verified 1). No duplicate.
- X3 Ledger grep `B95-XOB-PERSISTENCE-PROVENANCE` = 0 and `^1240.` = 0 -> appended item `1240` (lifecycle, field table, map + provenance classifications, contract classes, R7, no edit/compile/run, EA/EX5 SHAs). `^1239.` = 1 beside. No duplicate.
- X4 Pointer 20 -> 20 lines (cap 35): latest B-95 MEASURED, R7 PERSISTENCE-MISSING-PROVENANCE-MISSING, EA/EX5 unchanged, no compile/runs, separator parked, next per evidence decision.

## Part F - file, push, reply

- F1 this result. F2 slice `BUILDER_SLICE_B95.md` (raw searches, lifecycle/field/provenance excerpts, contract table, before/after lines; under 600 lines; no source diff, no run tables). F3 ledger 1240. F4 pointer per X4. F5 stages only the 6 relay files. F6 commit + push `builder/B-95` via `backup` + ls-remote check. Reply MEASURED.

## Final disk state (MEASURED turn; kept RKD build on disk, uncommitted)

- EA `137076D9CF85160AB8CD8379575AFD4801E71098CE97C0B10D88A42C7BF59671` (695359 B, LF-only, untouched; ` M` vs stale blob = expected uncommitted lag, never staged) + `.preB87`/`.B87PICKXOB` kept uncommitted. EX5 `FA4C924978F6A1D5C57B725F2AB530BBB5DC5B1E0D1D0B51FB0172E80D8C41B5` (matching kept source). Indicator + includes inspected read-only (lines cited, nothing edited). Strategy skill untouched (not loaded). Journal CSV, register, spec untouched. terminal.ini + charts untouched. No terminal64. No edit/compile/run beyond the relay's text records.

No carried note (no STOP; nothing to ask him).
