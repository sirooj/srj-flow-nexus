# BUILDER SLICE B-109 - source refs, payload schema, identity/provenance, placement, acceptance, record lines (payload definition, MEASURED)

Scope: read-only definition of the minimum upstream XOB evidence payload + acceptance checks. No edit, compile, launch, run, gate. Live files only.

## START GATE (raw)

- `git ls-remote ... builder/B-108` = `c6c9d562e82973b09ca7f2f6bdc559a6018525c8` (verified; cut builder/B-109 here).
- `git log -1` = `c6c9d56 B-108 XOB touch separator authority and buildability review (relay B-108)`.
- `git status --short` line count = 427 (prior artifacts + B106-B108 files/scripts; preserved, untouched).
- `git diff c6c9d562e82973b09ca7f2f6bdc559a6018525c8 --` EMPTY on every committed file named.
- EA disk `137076d9cf85160ab8cd8379575afd4801e71098ce97c0b10d88a42c7bf59671` LF same (LF-only). EX5 `fa4c924978f6...`. Indicator disk `956bf3e3...` / EX5 `27b5f272...`.
- No terminal64 launched, no compile, no tester run. No STOP.

## PART B GREPS (before/after)

- Operator message = B-109 relay order only; no new trading-rule words. Record `no new rule words`; appended nothing.
- `B-109-XOB-EVIDENCE-PAYLOAD` in 99_WORKFLOW 0->1 (context X1). `B-109` in 99_WORKFLOW 0->1 (handoff X2).
- `B109-XOB-EVIDENCE-PAYLOAD` in SRJ_FlowNexus_Local 0->1 (ledger 1254). `^1254.` 0->1; `^1253.` = 1 beside.

## READS (in relay order, on builder/B-108)

- Pointer 20 lines; RESULT_B108 head (70-line file, prior turn, unchanged); SLICE_B108 head (77-line file, prior turn, unchanged); RESULT_B107 head (74-line file, unchanged); RESULT_B106 T-section (89-line file, unchanged); RESULT_B105 section (98-line file, unchanged); RESULT_B95 head (86-line file: lifecycle refs + persistence lineage, unchanged); RESULT_B96 head (65-line file: export K4/K5 rationale, unchanged); RESULT_B97 head (65-line file: provenance fix, unchanged); RESULT_B100 K/T section (59-line file: dual-path precedent, unchanged); PLANNER_CONTEXT §4 tail (132-line file, B-108 lesson present); PLANNER_HANDOFF §3 tail (72-line file, B-108 line present); relay skill whole (67 lines, strategy skill NOT loaded); Types (COrderblock 37-88 + Task-98a/110); State (decl 269 + Clear 486 verified live); OrderblockMgr (Add 260/365, promotion 817/894/949, pruning 1108-1119, Delete 1122/1134, OverCap 1128, selector 1098 - all verified live); FlowLogic (48-buffer map 0-47, publish 1206-1234/1218-1220/1230, FVG-leg from 1236, GetOB 1215/1325); EA (FL_BUF 22/23/31/33 defines 206-207/2048/2063, ReadFlow reads 6904/6911-6912/7500, own isLong seed 2084-2143, 311 rates reads); spec v4.2 (35807 B, identical bytes, §§3.5/3.5.1/3.6/10 anchors re-verified: lines 133/143/166/372).

## RAW SOURCE REFERENCES (R1/R5; kept sources, line-referenced)

- `CArrayObj g_orderblocks;` (State:269). `COrderblock` fields: high/low (Types:43-44), isBullish :48, isActivated :49, isValid :50, validationBar :51, invalidationBar :52, isPromoted :56, promotionBar :59, objId :63 (+ Task-98a "nothing reads objId yet" :30, id restart State:509-510).
- Lifecycle: Add :260/:365; promotion :817 + :894/:949; pruning :1108-1119; Delete :1122/:1134 (OverCap :1128); reset Clear :486; per-bar order ending in pruning; selector `if(!ob.isPromoted) continue; // must be an XOB` :1098.
- Publish (one selected pick): bufs 22/23 zone hi/lo (708-709, writes 1218-1219), buf 31 objId (727, write 1220), buf 33 promo time (731, write 1230), buf 34 global-flag provenance (129, write 1124). No per-record direction/validity/invalidation buffer in the 0-47 map. B-96 export point: immediately after publish inside `if(target>=0)` keyed at `bt[target]` (same slot).
- Precedent: B-96 file writer over whole collection (no selector filter) + print-only census, additions-only, publish byte-identical; B-97 provenance fix; B-100 dual-path calcPath/runPass + rewrite guards (tester first call prevCalc==0, later ticks continuation).

## PAYLOAD FIELDS + CLASSIFICATIONS (R2; minimum preserving each live record at the counted candle)

- REQUIRED: snapshot barT; objId + composite (with objId-not-cross-run-stable caveat, B-95/B-99); direction B/S; zone high; zone low; startT (startBar) + createT (creationBar, both proven); promoT or literal NA; isValid; isPromoted flag; validationT or NA; invalidationT or NA; header sym/period/rates/build/firstT + per-row build + same-journal tie; symbol + period match fields; calcPath + runPass (load-bearing for the disjoint FRESH/INC mechanism).
- OPTIONAL: activation state (proven lifecycle field, consumed by no R3 reading - completeness only, never a condition); invalidation level (proven threshold field, consumed by no R3 reading - threshold evidence only, never a condition).
- NOT-AUTHORIZED (named, never added): "valid setup" / "trade taken" / "kill bar" / "separator" / "gate verdict" fields; any tolerance/distance/size/width/depth/bar-count threshold; entry/stop/target prices; CQD/bias verdicts; any replacement meaning for a listed field.

## IDENTITY / PROVENANCE EVIDENCE (R4)

- Composite (direction + startT + createT + bounds) carried joins across paths (B-100: 73 keys). objId strictly within-run diagnostic (adjacent-bar stability one segment only; reset :509-510; B-99 NOT-PROVEN cross-run). Never claim a cross-run key. Run/build provenance per B-96 K3/B-97. Literal UNKNOWN/NA preserved, never nearby-substituted (B-96 K2).

## LIFECYCLE PLACEMENT (R5)

- Point: after mutation stage + selected publish (~1206-1234, same `bt[target]` slot). Snapshot observes post-mutation collection. Changes nothing: creation/activation/validation/promotion/invalidation/pruning/reset/selector/selected-buffers (additions-only precedent). No function/file/buffer/serialization prescription (R7 observed).

## ACCEPTANCE CHECKS (R6)

- PROVEN BY B-96/B-97: multi-record per bar (84+); adjacent-bar identity one segment (300 s); promotion event rows (+atBar); invalidation event rows; not-promoted + invalidated/live distinctions (NA + valid + splits); symbol/period match (PROV lines); build/source provenance (headers + builds + same-journal tie); no selected-buffer/flow change (byte-identical publish, additions-only; re-demonstrated by diff each time); restoration unchanged (unbroken B-96..B-108 lineage).
- REQUIRED of the future implementation: timestamp + OHLC beside the payload jointly (barT-half already per-row-proven; OHLC-half paired offline B-104..B-106 via UJBARMAP but never jointly emitted); no gate reads the payload (evidence-only/print-only consumption as B-96's census was).

## R7 MUST-NOTS (each observed)

- No transport, no buffer numbers, no EA gate, no tester run, no trade graded, B-91 unreopened, no production-sufficiency decision (later authority review owns it).

## RECORD LINES (exact)

- X1 context §4 appended once: `- B-109-XOB-EVIDENCE-PAYLOAD (planner lesson 2026-10-08, B-109): defined the raw upstream XOB evidence payload and acceptance checks without choosing a transport or enabling a gate.`
- X2 handoff §3 appended once: `- B-109: defined the raw upstream XOB evidence payload and acceptance checks; no source edit or gate was performed.`
- X3 ledger `1254.` appended once (tag `B109-XOB-EVIDENCE-PAYLOAD`; facts, schema, separation, identity/provenance, placement, acceptance, R8, no edit/compile/run/gate).
- X4 pointer 20->20 lines (cap 35): latest B-109 MEASURED; DEFINED; kept EA/EX5 unchanged; no compile/runs; no gate and no project-complete claim; next follows R8 (implementation review).
- Pre-commit re-check: X1/X2/X3 counts 1; `^1253.` = 1; staged set = 6 relay files only; no source diff; no run tables.
- R8: `EVIDENCE-PAYLOAD-DEFINED-NEXT-IMPLEMENTATION-REVIEW` (definition only; no edit authorized).

(End of slice)
