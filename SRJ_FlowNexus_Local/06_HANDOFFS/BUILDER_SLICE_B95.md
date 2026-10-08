# BUILDER SLICE B-95 - raw searches, lifecycle/field/provenance excerpts, contract table, before/after lines (persistence/provenance, MEASURED)

Scope: read-only inspection of live `Indicators/SRJ_FlowLogic.mq5`, `Include/SRJ/SRJ_Types.mqh`, `Include/SRJ/SRJ_OrderblockMgr.mqh`, `Include/SRJ/SRJ_State.mqh`, `Experts/SRJ_FlowNexus_EA.mq5` + existing B-series records. No edit, no export, no reconstruction, no re-grade, no compile, no run. Live files only.

## START GATE (raw)

- `git ls-remote ... builder/B-94` = `887b48f5deacd01b3232fb90d4486579c3a8a53a` (verified; cut builder/B-95 here).
- `git log -1` = `887b48f5deacd01b3232fb90d4486579c3a8a53a B-94 minimum upstream XOB evidence contract, internal source unknown on provenance (relay B-94)`.
- `git status --short` line count = 359 (preserved drift + untracked dirt, untouched).
- `git diff 887b48f5... --` EMPTY on: pointer, RESULT/SLICE B94, RESULT B93, PLANNER_CONTEXT, PLANNER_HANDOFF.
- EA disk SHA `137076D9CF85160AB8CD8379575AFD4801E71098CE97C0B10D88A42C7BF59671` (695359 B, LF-only; prefix matches).
- EX5 disk SHA `FA4C924978F6A1D5C57B725F2AB530BBB5DC5B1E0D1D0B51FB0172E80D8C41B5` (prefix matches).
- No terminal64. No compile. No tester run.

## PART B GREPS (before/after)

- Operator message = B-95 relay order only; no new trading-rule words. Record `no new rule words`; appended nothing.
- `B-95-XOB-PERSISTENCE-PROVENANCE` in 99_WORKFLOW 0→1 (context X1). `B-95` in 99_WORKFLOW 0→1 (handoff X2).
- `B95-XOB-PERSISTENCE-PROVENANCE` in SRJ_FlowNexus_Local 0→1 (ledger 1240). `^1240.` 0→1; `^1239.` = 1 beside.

## R1 SEARCHES (live files; identifier + nearby text)

- `g_orderblocks` in live `SRJ_OrderblockMgr.mqh`: 32 matches — `:260/:365` Add; `:443/:654/:674/:733/:774/:843/:932/:1057/:1089` Total/GetOB loops; `:1060/:1079` selector/prune notes; `:1110-1134` pruning deletes; `:948` all-branch loop note; `:988` lock read.
- `CArrayObj g_orderblocks|new COrderblock|Clear|DeleteAll` in `Include/`: `SRJ_State.mqh:269` declare; `SRJ_Types.mqh:259` new; `SRJ_State.mqh:486` Clear (+ siblings); `SRJ_Draw.mqh:328` unrelated chart-object delete (never a collection reset).
- Field writes in `Include/`: `isValid/validationBar` (`SRJ_OrderblockMgr.mqh:114-115` replay, `:459-460` discovery; HTF engine `:182-183` separate engine, never conflated); `isValid=false/invalidationBar` (`:132-133`, `:514-515`); `isPromoted=true` (`:817`); `promotionBar=i` (`:894`, `:949`); factory stamps (`SRJ_Types.mqh:260-278`).
- `isActivated` writes in live Mgr: `:113` (replay), `:458` (discovery). No other writers.
- Pass order in live `SRJ_FlowLogic.mq5`: `:810` StateInit; `:852` OnCalculate signature; `:876` prevCalc; `:973` StateInit recalc path; `:1023` Creation; `:1029` BiasReset; `:1031` ActivationInvalidation; `:1034` CounterAgg; `:1036` InactivePrune; `:1038` OpposingCache; `:1040` WeakFlipLatch; `:1049` StructureDetection; `:1052` DecisionBlock; `:1055` DeferredPromotion; `:1062` Pruning.
- `g_srjObjIdSeq = 0|void SRJ_StateInit` in `SRJ_State.mqh`: `:315` def; `:510` restart ("ids restart with the object arrays").
- `PROMOCENSUS` in kept EA: NO match (print lives indicator-side). `XOB-PROMOCENSUS` in `Include/`: live `SRJ_OrderblockMgr.mqh:910/:956` (+ `.preB44`/`.B44DIAG` copies, not evidence).
- `PROMOCENSUS|XOBINPLAY|OBPROV` in live indicator: NO match (prints live in the compiled-in include, found above).
- `OBPROV` in live Mgr: `:177/:187` codes 1/2 (discovery bar, `id=ob.objId`); `:559/:569` codes 3/4 (bar i, `id=ob.objId`); codes 5-8 carry id=0 (ImbalanceMgr/BiasEngine per B-40/B-155 records).
- `code=4|OBPROV` in handoffs: B-40 codebook (code=3 in-bias invalidated, code=4 opposing; zone/mid/close NOT_PRINTED); B-75 census method (kill = code=4 + bar-time; bulk-kill set check); B-84 K3 (prints not EA-readable); B-86 (0 OBPROV reads); B-155 records (8 literals incl. codes 5-8 id=0).

## LIFECYCLE EXCERPTS (live files, by text)

- `SRJ_State.mqh:269`: `CArrayObj g_orderblocks;` — declaration.
- `SRJ_Types.mqh:252-280`: `NewOrderblock(...)` — `new COrderblock()`, all-field stamp, `objId = SRJ_NextObjId()` (`:278`).
- `SRJ_OrderblockMgr.mqh:260/:365`: `g_orderblocks.Add(ob);` — insertion.
- `SRJ_OrderblockMgr.mqh:1122/:1134`: `g_orderblocks.Delete(k);` — pruning + over-cap (`SRJ_OBOverCap` `:1128`); no tombstone.
- `SRJ_State.mqh:315-513`: `SRJ_StateInit()` — full reset; `:471-485` FreeMode; `:486` `g_orderblocks.Clear()`; `:509-510` id restart.
- `SRJ_FlowLogic.mq5:810/:973`: init + recalc calls. `:876`: `prevCalc` incremental path (retained between bars; rebuilt on recalc per B-59).
- `SRJ_OrderblockMgr.mqh:910-925/:956-967`: PROMOCENSUS rows — per-promotion event, objId/obStart/obVal/obInval/promoBar/promoT, from the same collection (nearest lockedOB / all-branch loop).

## FIELD TABLE (R2; write | survive-bars | survive-reset | historical-access)

- startBar: factory `:260` | FOUND | NOT FOUND | NOT FOUND. creationBar: `:277` | FOUND | NOT FOUND | NOT FOUND.
- promotionBar: `:894/:949` | FOUND | NOT FOUND | NOT FOUND (print-only). validationBar: `:115/:460` | FOUND | NOT FOUND | NOT FOUND.
- invalidationBar: `:133/:515` | FOUND | NOT FOUND | NOT FOUND. invalidationLevel: `:267` | FOUND | NOT FOUND | NOT FOUND.
- isBullish: `:268` | FOUND | NOT FOUND | NOT FOUND. isValid: `:114/:132/:459/:514` | FOUND | NOT FOUND | NOT FOUND.
- isActivated: `:113/:458` | FOUND | NOT FOUND | NOT FOUND. isPromoted: `:817` | FOUND | NOT FOUND | NOT FOUND.
- objId: `:278` | FOUND in-segment | NOT FOUND (`:510`) | NOT FOUND (recur per B-49).

## PROVENANCE EXCERPTS (R4; scope | recalc-stable | cross-run | evidence)

- Build stamp `:671`: run | n/a (compile-time) | NO (same stamp across builds, B-63) | `Print("SRJ BUILD ", __DATETIME__, ...)`.
- EA/indicator SHAs (pointer:9): run | yes if files unchanged | yes | gate SHAs.
- Journal/tester headers + labels: run | per-run | per-run | RECON rows in B-series results.
- objId: record-in-segment | NO (`:510`, Types `:22-30`) | NO (recur, B-49) | `SRJ_NextObjId`, restart comment.
- Composite key: record-designed | YES by design (`Types:28-29`) | UNPROVEN as join | no existing join record.

## R5 RESULTS (existing records only; nothing generated)

- Adjacent bars: NOT FOUND. Promotion event: FOUND (PROMOCENSUS objId+promo rows). Invalidation event: FOUND w/o zone (OBPROV 3/4 id+bar; B-40).
- Reset/pruning same-object: NOT FOUND (B-75 set-level only). Cross-run same-object: NOT FOUND.

## CONTRACT TABLE (R6)

| field | class | why |
|---|---|---|
| identity | NOT-PROVEN-HISTORICALLY | recalc restart proven; key unproven |
| direction | PROVEN-PRINT-ONLY | per-event bias= rows |
| zone | PROVEN-SELECTED-ONLY / multi NOT-PROVEN | buffers vs NOROW gaps |
| formation | PROVEN-PRINT-ONLY | obStart rows |
| promotion | PROVEN-PRINT-ONLY | promo rows + selected buffer |
| invalidation+time | PROVEN-PRINT-ONLY | OBPROV 3/4, no zone |
| bar/timestamp | PROVEN-PRINT-ONLY | indices + time strings |
| coexistence | PROVEN-INTERNAL / NOT-PROVEN persisted | runtime n-objects; pruned history |
| four-state | PROVEN-INTERNAL / NOT-PROVEN per-record | flags vs history |
| provenance/record | UNKNOWN | no per-record join key |

## R7 + RECORD LINES

- R7: `PERSISTENCE-MISSING-PROVENANCE-MISSING` — evidence only, never permission. R8: no K/T/`.preB95`.
- X1 context §4 appended once: `- B-95-XOB-PERSISTENCE-PROVENANCE (planner lesson 2026-10-08, B-95): traced the internal XOB lifecycle and provenance without editing or reopening prior readings; the XOB path remains parked until historical multi-XOB persistence and record-level provenance are proven.`
- X2 handoff §3 appended once: `- B-95: traced internal XOB persistence and run provenance without source edits or runs; the separator remains parked pending proof of both.`
- X3 ledger `1240.` appended once (tag `B95-XOB-PERSISTENCE-PROVENANCE`; lifecycle, tables, classes, R7, SHAs).
- X4 pointer 20→20 lines (cap 35): latest B-95 MEASURED; R7 PERSISTENCE-MISSING-PROVENANCE-MISSING; EA/EX5 unchanged; no compile/runs; parked.
- Pre-commit re-check: X1/X2/X3 counts 1; `^1239.` = 1; staged set = 6 relay files only; no source diff; no run tables.

(End of slice)
