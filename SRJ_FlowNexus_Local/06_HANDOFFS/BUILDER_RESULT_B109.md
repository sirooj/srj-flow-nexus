# BUILDER RESULT B-109 - smallest upstream XOB evidence payload, EVIDENCE-PAYLOAD-DEFINED-NEXT-IMPLEMENTATION-REVIEW, MEASURED

Trader summary: B-108 showed the EA can only see one picked zone per bar while the measurement needs every live zone. This relay defines exactly what the smallest upstream evidence package must contain — one snapshot row per live zone with its identity, direction, bounds, timing, lifecycle state and run provenance — and the checks any future build must pass. No transport was chosen, no buffer was picked, no logic was changed and no gate was built.

## Relay order (B-109, read-only payload definition)

- Part 0 fresh start on builder/B-108 at c6c9d562e82973b09ca7f2f6bdc559a6018525c8, relay skill loaded whole first (strategy skill NOT loaded: evidence-contract relay, no rule change).
- Part B banking (no new rule words). Part R payload definition (R1 source facts, R2 schema, R3 evidence-vs-derived, R4 identity/provenance, R5 lifecycle placement, R6 acceptance, R7 must-nots, R8 decision). Part X records (ledger 1254). Part F file + push builder/B-109 via backup.

## Part 0 - fresh-session start

- 0.1 Relay skill loaded whole first (67-line SKILL.md, known whole, untouched). Strategy skill NOT loaded (read-only evidence-contract relay, not a rule change).
- 0.2 `git ls-remote https://github.com/sirooj/srj-flow-nexus.git builder/B-108` = `c6c9d562e82973b09ca7f2f6bdc559a6018525c8` (verified exact). Cut `builder/B-109` from it. Push via `backup`, never `origin`.
- 0.3 Read in order on `builder/B-108`: pointer (20 lines); RESULT_B108 head (70-line file, authored prior turn, unchanged); SLICE_B108 head (77-line file, authored prior turn, unchanged); RESULT_B107 head (74-line file, unchanged); RESULT_B106 T-section (89-line file, unchanged); RESULT_B105 section (98-line file, unchanged); RESULT_B95 head (86-line file: lifecycle refs, persistence/provenance lineage, unchanged); RESULT_B96 head (65-line file: export design K4/K5 rationale, unchanged); RESULT_B97 head (65-line file: provenance fix, unchanged); RESULT_B100 K/T section (59-line file: dual-path precedent, unchanged); PLANNER_CONTEXT section-4 tail (132-line file, B-108 lesson present); PLANNER_HANDOFF section-3 tail (72-line file, B-108 line present); relay SKILL.md whole; `SRJ_Types.mqh` (COrderblock fields + Task-98a/110 notes, inspected); `SRJ_State.mqh` (collection decl + reset refs verified live); `SRJ_OrderblockMgr.mqh` (lifecycle refs verified live); `SRJ_FlowLogic.mq5` (48-buffer map + publish sites + GetOB internal use, inspected); `SRJ_FlowNexus_EA.mq5` (FL_BUF defines + ReadFlow selected reads + own direction + rates reads, inspected); spec v4.2 (35807 B, identical bytes, §§3.5/3.5.1/3.6/10 anchors re-verified).
- 0.4 Names per relay: collection `g_orderblocks`; record `COrderblock`; selected buffers 22/23/31/33; provenance buffer 34; precedent `SRJ_B96_DiagExport` / `XOBDIAG.csv`; prior `OFFLINE-SEPARATOR-AUTHORIZED-NOT-BUILDABLE` item `1253`; this tag `B109-XOB-EVIDENCE-PAYLOAD`, item `1254`; kept EA `137076D9CF85` / EX5 `FA4C924978F6` / indicator `956BF3E3ADB7` / EX5 `27B5F272DCFA`; verdict MEASURED.
- 0.5 Start gate: `git log -1` = `c6c9d56 B-108 XOB touch separator authority and buildability review (relay B-108)` (verified head). `git diff c6c9d562e82973b09ca7f2f6bdc559a6018525c8 --` EMPTY (every committed file named). `git status --short` = 427 lines (prior artifacts + B106-B108 files/scripts, preserved untouched). Kept EA disk `137076d9...` (LF-only, normalized identical) / EX5 `fa4c924978f6...` / indicator disk `956bf3e3...` / EX5 `27b5f272...` (prefixes match). No terminal64 launched, no compile, no tester run (read-only turn). No STOP.
- 0.6 Scope: read-only inspection + payload definition + acceptance checks + text records only.

## Part B - banking

- B1 The current operator message contains the B-109 relay order only; it carries no new trading-rule words. Record `no new rule words`; appended nothing.

## Part R - minimum evidence payload

- R1 Live source facts reconfirmed (each FOUND with exact evidence; zero NOT FOUND; zero CONTRADICTED):
  - `g_orderblocks` is a runtime `CArrayObj` of `COrderblock`: decl `SRJ_State.mqh:269`; record fields `SRJ_Types.mqh:37-88` (high/low :43-44, isBullish :48, isActivated :49, isValid :50, validationBar :51, invalidationBar :52, isPromoted :56, promotionBar :59, objId :63; Task-98a identity + Task-110 promotion notes) - FOUND.
  - Selected publish block chooses one in-bias XOB: selector filter `SRJ_OrderblockMgr.mqh:1098` (`if(!ob.isPromoted) continue; // must be an XOB`); publish `FlowLogic` ~1206-1234 (zone hi/lo lines 1218-1219, objId line 1220, promo-time line 1230; FVG-leg block from 1236) - FOUND.
  - EA reads only the selected zone/id/promotion fields: defines `FL_BUF_XOB_ZONE_HIGH 22` / `LOW 23` (EA:206-207), `FL_BUF_XOB_OBJ_ID 31` (EA:2048), `FL_BUF_XOB_PROMO_TIME 33` (EA:2063); reads at EA:6904/6911-6912/7500 via ReadFlow - FOUND.
  - B-96/B-97 exposed the full collection without feeding a gate: per-bar file writer over the whole collection (no selector filter) + print-only EA census consumer; additions-only diffs; publish block byte-identical (B96 K4/K5) - FOUND.
  - B-108 full population not on the live EA path: R4 inventory + pointer R7 (`NOT-BUILDABLE-FULL-XOB-MAP`) - FOUND.
  - Lifecycle mechanics carried from B-95 on identical-kept sources (re-verified live refs): Add `SRJ_OrderblockMgr.mqh:260/:365`; promotion writes `:817` + `:894`/`:949`; pruning `SRJ_OB_PruningPass :1108-1119` + Delete `:1122`/`:1134` via `SRJ_OBOverCap :1128`; reset `SRJ_State.mqh:486` Clear with id restart `:509-510` (ids recur across recalcs/runs as different objects); per-bar mutation order ending in pruning; no per-bar multi-record history retained in state (selected buffers only).
- R2 Payload schema, field by field (minimum that preserves each live record at the counted candle; nothing added for convenience):
  - snapshot bar timestamp (barT): REQUIRED (anchors relevance, validity, touch; every derived reading keys to it).
  - object identity material (`objId` + composite formation material below, with the explicit caveat that `objId` alone is not cross-run stable per B-95 :509-510 and B-99): REQUIRED (within-run adjacency needs it; B100 proved the composite carries cross-path joins).
  - direction (isBullish as B/S): REQUIRED (trade-direction match needs it; no direction buffer exists, so the payload is its only carrier).
  - zone high / zone low: REQUIRED (touch needs bounds; projection needs them per §3.5).
  - formation time from proven fields (startBar->startT; creationBar->createT; Types:58, factory-stamped, guard-read per B-95): REQUIRED (relevance/age per §3.5; both fields proven, never inferred).
  - promotion time or explicit not-promoted state (promotionBar->promoT or literal `NA`): REQUIRED (§3.5.1 relevance needs it; `NA` preserves the unpromoted distinction per B-96 K2).
  - validity state (isValid): REQUIRED (validity at the counted candle).
  - activation state (isActivated): OPTIONAL (proven lifecycle field documenting traversal; consumed by no derived reading in R3 - kept for lifecycle completeness, never as a condition).
  - promotion state (isPromoted flag): REQUIRED (relevance needs it alongside promoT).
  - validation time or explicit unavailable (validationBar->validationT or `NA`): REQUIRED (relevance ordering + lifecycle evidence).
  - invalidation time or explicit unavailable (invalidationBar->invalidationT or `NA`): REQUIRED (projection-until-invalidated per §3.5 needs the event time).
  - invalidation level or explicit unavailable: OPTIONAL (proven threshold field documenting the midline rule; consumed by no derived reading - kept for threshold evidence, never as a condition).
  - run/build provenance (header sym/period/rates/build/firstT + per-row build + same-journal tie, per B-96 K3/B-97): REQUIRED (distinguishes the diagnostic source from any other run; B-97/B-99 lesson).
  - symbol + period provenance: REQUIRED (match check; PROV symMatch/perMatch precedent).
  - calculation path + run pass (calcPath/runPass, when the diagnostic emits per-path streams): REQUIRED (FRESH/INCREMENTAL disambiguation is load-bearing for the disjoint-coverage mechanism; B-100..B-102 all relied on it).
  - NOT-AUTHORIZED (named so none is ever added): any "valid setup" / "trade taken" / "kill bar" / "separator" / "gate verdict" field; any tolerance, distance, size, width, depth or bar-count threshold; any entry/stop/target price; any CQD/bias verdict; any replacement meaning for a listed field. Each would invent a strategy condition, threshold, gate result or meaning the source never stated.
- R3 Required evidence vs derived readings (separation observed): required = the raw record payload above + the counted candle's OHLC + timestamp (both EA-readable market data, never stored in the payload). Derived later, computed only, never stored: relevance, validity at the counted candle, trade-direction match, touch, non-touch, lifecycle ordering, separator status. The payload must never contain a precomputed verdict field (see NOT-AUTHORIZED list).
- R4 Identity and provenance rules: preserve direction + formation material (startT/createT) + creation/detection bars + zone bounds as the composite identity material (B-100 proved this composite carries joins); preserve `objId` strictly as within-run diagnostic information (adjacent-bar stability within one uninterrupted run segment only); state plainly that `objId` alone is not a cross-run key (B-95 reset :509-510; B-99 CROSSRUN-JOIN-NOT-PROVEN); preserve run/build provenance sufficient to tell the diagnostic source apart from any other run (B-97 fix + B-99 disambiguation); never claim a cross-run stable identity the source does not prove; preserve explicit `UNKNOWN`/`NA` states instead of substituting nearby values (B-96 K2 literal-`NA` rule).
- R5 Lifecycle placement: the existing bar-processing point is after the mutation stage and the selected-buffer publish (per-bar order ends in pruning; publish ~1206-1234; the proven B-96 call site sat immediately after inside `if(target>=0)` keyed at `bt[target]`, the same slot the buffers publish). The snapshot must observe the post-mutation collection (all mutators ran; B-95 consequence recorded). It must change nothing: no creation/activation/validation/promotion/invalidation/pruning/reset/selector/selected-buffer behavior (additions-only precedent B-96..B-102). No new function name, file format, buffer number or serialization mechanism is prescribed here (R7 observance).
- R6 Acceptance checks for a future implementation (statuses per relay vocabulary):
  - multiple live records emitted for one counted candle: PROVEN BY B-96/B-97 (max 84 B-96; 98-162 since).
  - adjacent-bar identity within one uninterrupted run segment: PROVEN BY B-96/B-97 (300 s adjacencies; B100-B102 corroborate).
  - promotion event rows: PROVEN BY B-96/B-97 (promoT-bearing rows + atBar counts every run).
  - invalidation event rows: PROVEN BY B-96/B-97 (valid=0 rows + examples every run).
  - explicit not-promoted and invalidated/live distinctions: PROVEN BY B-96/B-97 (literal-`NA` + valid flag + state splits).
  - exact counted-candle timestamp and OHLC beside the payload: REQUIRED (barT-half already proven per row in B-96/B-97; OHLC-half paired offline in B-104..B-106 via UJBARMAP but never emitted jointly by an implementation - the future build must show both together).
  - symbol and period match: PROVEN BY B-96/B-97 (PROV symMatch/perMatch lines).
  - valid build/source provenance: PROVEN BY B-96/B-97 (headers + per-row builds + same-journal tie).
  - no selected-buffer or trading-control-flow change: PROVEN BY B-96/B-97 (byte-identical publish block, additions-only diffs; every future implementation re-demonstrates this by diff).
  - no gate reads the payload: REQUIRED (future consumer must stay evidence-only/print-only as B-96's census was).
  - restoration leaves kept EA/EX5 and selected buffers unchanged: PROVEN BY B-96/B-97 (origin precedent; unbroken restoration lineage B-96 through B-108).
- R7 Must-nots (each observed, none done): no future transport chosen; no buffer numbers chosen; no EA gate requested; no tester run requested; no trade graded; four B-91 readings unreopened; no decision on production-entry sufficiency (that belongs to a later authority review, never this definition).
- R8 Exactly one: `EVIDENCE-PAYLOAD-DEFINED-NEXT-IMPLEMENTATION-REVIEW` - every required field maps to a proven source field, every derived reading stays computed-only, lifecycle placement reuses the proven point without behavior change, and no mechanism choice or new rule was made. Definition only; authorizes no source edit.

## Part X - records

- X1 `PLANNER_CONTEXT.md` section 4 grep `B-109-XOB-EVIDENCE-PAYLOAD` = 0 -> appended exactly one lesson (verified 1). No duplicate.
- X2 `PLANNER_HANDOFF.md` section 3 grep `B-109` = 0 -> appended `- B-109: defined the raw upstream XOB evidence payload and acceptance checks; no source edit or gate was performed.` (verified 1). No duplicate.
- X3 Ledger grep `B109-XOB-EVIDENCE-PAYLOAD` = 0 and `^1254.` = 0 -> appended item `1254` (source facts, field schema, derived separation, identity/provenance rules, lifecycle placement, acceptance checks, R8, no edit/compile/run/gate). `^1253.` = 1 beside. No duplicate.
- X4 Pointer 20 -> 20 lines (cap 35): latest B-109 MEASURED, DEFINED decision, kept EA/EX5 unchanged, no compile or runs, no gate and no project-complete claim, next follows R8 (implementation review).

## Part F - file, push, reply

- F1 this result. F2 slice `BUILDER_SLICE_B109.md` (raw source refs, payload fields + classifications, identity/provenance evidence, lifecycle placement, acceptance checks, before/after lines; under 600 lines; no source diff, no run tables). F3 ledger 1254. F4 pointer per X4. F5 stages only the 6 relay files. F6 commit + push `builder/B-109` via `backup` + ls-remote check. Reply MEASURED.

## Final disk state (MEASURED turn; kept RKD build on disk, uncommitted)

- EA `137076D9CF85160AB8CD8379575AFD4801E71098CE97C0B10D88A42C7BF59671` (695359 B, LF-only, verified-kept; never edited this turn) + all prior `.preB*`/`.B*` copies kept uncommitted. EX5 `FA4C924978F6A1D5C57B725F2AB530BBB5DC5B1E0D1D0B51FB0172E80D8C41B5` (verified-kept). Indicator src/ex5 at gate SHAs, untouched. No compile, no launch, no tester run, no terminal/config/chart modification (prior analysis scripts + artifacts unstaged). Strategy skill NOT loaded and untouched, journal CSV, register, spec, includes untouched (all read-only; greps only). No edit stands beyond the relay's text records.

No carried note (no STOP; nothing to ask him).
