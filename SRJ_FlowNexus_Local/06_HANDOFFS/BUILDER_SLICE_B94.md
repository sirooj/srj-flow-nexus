# BUILDER SLICE B-94 - raw searches, excerpts, contract table, before/after lines (XOB evidence contract, MEASURED)

Scope: read-only inspection of `Indicators/SRJ_FlowLogic.mq5`, `Include/SRJ/SRJ_Types.mqh`, `Include/SRJ/SRJ_OrderblockMgr.mqh`, `Experts/SRJ_FlowNexus_EA.mq5`. No edit, no buffer, no producer change, no reconstruction, no re-grade, no compile, no run. Live files only (`.B*/.preB*`/archive copies excluded from evidence).

## START GATE (raw)

- `git ls-remote ... builder/B-93` = `e44d49000993a61da258ca2594506a0e8d77ba8b` (verified; cut builder/B-94 here).
- `git log -1` = `e44d49000993a61da258ca2594506a0e8d77ba8b B-93 inventory of existing XOB evidence, partial selected-only source, XOB stays parked (relay B-93)`.
- `git status --short` line count = 359 (preserved drift + untracked dirt, untouched).
- `git diff e44d4900... --` EMPTY on: pointer, RESULT/SLICE B93, RESULT B92, PLANNER_CONTEXT, PLANNER_HANDOFF.
- EA disk SHA `137076D9CF85160AB8CD8379575AFD4801E71098CE97C0B10D88A42C7BF59671` (695359 B, LF-only; prefix matches).
- EX5 disk SHA `FA4C924978F6A1D5C57B725F2AB530BBB5DC5B1E0D1D0B51FB0172E80D8C41B5` (prefix matches).
- No terminal64. No compile. No tester run.

## PART B GREPS (before/after)

- Operator message = B-94 relay order only; no new trading-rule words. Record `no new rule words`; appended nothing.
- `B-94-XOB-EVIDENCE-CONTRACT` in 99_WORKFLOW 0→1 (context X1). `B-94` in 99_WORKFLOW 0→1 (handoff X2).
- `B94-XOB-EVIDENCE-CONTRACT` in SRJ_FlowNexus_Local 0→1 (ledger 1239). `^1239.` 0→1; `^1238.` = 1 beside.

## R1 SEARCHES (live files; identifier + nearby text)

- `COrderblock|class COrderblock|struct.*Xob|XOB` in live `Indicators/SRJ_FlowLogic.mq5`: `:8` (48 buffers), `:62` (XOB-in-play section), `:102` (objId carriers), `:117` (promotionBar Task 110), `:235` (ENUM_XPOI XOB_UP/DN), `:442-443`, `:1203` (nearest valid+activated+promoted in-bias, ANY age), `:1215` (`COrderblock *xob = GetOB(g_orderblocks, xobIdx)`), `:1236+` (leg membership), `:1322/:1325` (stop-leg same selector). Type defined outside: `class COrderblock : public CObject` in `Include/SRJ/SRJ_Types.mqh:37`.
- `class COrderblock` in `Include/`: exactly 1 match — `Include/SRJ/SRJ_Types.mqh:37`.
- `promotion` in live indicator: `:8` (buffer history), `:117` (promotionBar comment), `:123/:125` (relevance on promotion), `:1223/:1225` (`(int)xob.promotionBar`), `:1242` (leg promotion note).
- `nvalidation` in live indicator: `:97` (obInvalidationBoundary checklist), `:1031` (`SRJ_OB_ActivationInvalidationPass`), `:1092` (invalidation site note), `:1237` (leg filter), `:1355-1365` (boundary state), `:1404` (read-only query).
- `kill|Kill` in live indicator: NO match — no kill vocabulary in source.
- `OBValidProv|g_bufXob|SRJ_NearestPromotedOBIndex|GetOB(g_orderblocks` in live indicator: 33 matches incl. `:63/:64` (zone decls), `:113` (objId), `:128/:129` (promo/prov), `:708/:709/:727/:731/:732` (binds 22/23/31/33/34), `:773/:774/:792/:796/:797` (series), `:928/:929/:947/:951/:953` (init), `:1124` (prov publish), `:1206-1209` (EMPTY/0.0 defaults), `:1212` (selector), `:1215/:1218-1220/:1230` (pick publish), `:1322/:1325` (stop-leg).
- `SRJ_NearestPromotedOBIndex(const...` repo-wide: definition ONLY in `Include/SRJ/SRJ_OrderblockMgr.mqh:1084` (live; `.preB44`/`.B44DIAG`/snapshots agree, not evidence).
- `g_orderblocks` in live indicator: 2 matches — `:1215` (pick), `:1325` (stop-leg). Declaration/iteration live in `SRJ_OrderblockMgr.mqh:1089-1092` (`g_orderblocks.Total()` loop).
- `SRJ BUILD|BuildStamp|buildStamp` in live indicator: 1 match — `:671` `Print("SRJ BUILD ", __DATETIME__, " refOk=invOnly diag=v9_perm");` (log-only).

## EXACT EXCERPTS (live files, by text)

- `Include/SRJ/SRJ_Types.mqh:22-30`: objId unique for life of run, NOT recalc-stable; composite key (direction, startBar time, creation/detection time, bounds) is recalc-stable.
- `Include/SRJ/SRJ_Types.mqh:37-63`: full `COrderblock` member list (startBar/endBar/swingBar/high/low/open/midpoint/invalidationLevel/isBullish/isActivated/isValid/validationBar/invalidationBar/obLineName/midLineName/isExtreme/isPromoted/hasDrivenRenewal/creationBar/promotionBar[S RJ_NA_INT=never]/objId).
- `Include/SRJ/SRJ_OrderblockMgr.mqh:1084-1106`: selector body (bias+promoted+valid+activated; nearest greatest startBar; read-only query).
- `Include/SRJ/SRJ_OrderblockMgr.mqh:1108-1119`: `SRJ_OB_PruningPass` deletes out-of-lookback OBs from `g_orderblocks` (history bounded by pruning).
- `Indicators/SRJ_FlowLogic.mq5:129`: buffer-34 comment — provenance of tickOBIsValid, EMPTY_VALUE where uncomputed (never a kill bar).
- `Indicators/SRJ_FlowLogic.mq5:671`: build stamp print (log-only provenance, not per-record).

## R2 TABLE (internal multi-record question)

| candidate | type | collection/scalar | historical bar access | direction | zone | objId | formation | promotion | invalidation/kill | evidence |
|---|---|---|---|---|---|---|---|---|---|---|
| indicator g_orderblocks | CArrayObj of COrderblock | collection (n objects at runtime) | NOT FOUND (one pick/bar persisted; pruned) | FOUND isBullish | FOUND high/low | FOUND objId (run-scoped) | FOUND startBar/creationBar | FOUND promotionBar | invalidation FOUND (flags+bars+level); kill-word NOT FOUND | Types :37-92; Mgr :1084-1119; FlowLogic :1212-1230 |
| EA SXobRecord | struct (SStructuralBundle.xob) | scalar member | NOT FOUND as live map | UNKNOWN | UNKNOWN | UNKNOWN | UNKNOWN | UNKNOWN | UNKNOWN | EA :748/:809; B-84 K3 scoring-only |

## CONTRACT TABLE (R4; no code proposed)

| contract field | classification | evidence |
|---|---|---|
| stable identity | FOUND INTERNALLY (caveat kept) | objId :63 + composite key :22-30 |
| direction | FOUND INTERNALLY | isBullish :48 |
| zone high/low | FOUND INTERNALLY | high/low :43-44 |
| formation time | FOUND INTERNALLY | startBar :40 + creationBar :58 |
| promotion time | FOUND INTERNALLY | promotionBar :59 (NA_INT = never) |
| invalidation/kill + event time | FOUND INTERNALLY for invalidation; kill UNKNOWN | isValid/isActivated/isPromoted + validationBar/invalidationBar/invalidationLevel :49-52/:56/:47; kill grep 0 |
| bar/timestamp per record | FOUND INTERNALLY as bar indices | startBar/endBar/swingBar/creationBar/promotionBar/validationBar/invalidationBar; Task-110 server-time note :117 |
| multi-record coexistence | FOUND at runtime; per-bar persistence NOT FOUND | Mgr loop :1089-1092; pruning :1108-1119; single-pick history B-93 |
| absent/never-promoted/invalidated/live | FOUND INTERNALLY | no record vs promotionBarNA vs invalid flags+bar vs promoted+valid+activated |
| run/build provenance per record | UNKNOWN | objId recalc-unstable; build stamp log-only :671 |

## R5/R6/R7 (condensed; full text in result)

- Missing set: per-bar persistence of every live record + per-record provenance linkage. All other contract fields proven internally → not INCOMPLETE; provenance unprovable → not COMPLETE.
- R6: separator parked; B-88..B-93 untouched; no gate/edit/compile/run.
- R7: `INTERNAL-SOURCE-UNKNOWN` — evidence only, never permission.
- R8: no K, no T, no `.preB94`.

## BEFORE/AFTER RECORD LINES (exact)

- X1 context §4 appended once: `- B-94-XOB-EVIDENCE-CONTRACT (planner lesson 2026-10-08, B-94): inspected the indicator's internal XOB records without editing or reopening prior readings; the minimum upstream evidence contract is recorded, and the XOB path remains parked until its fields are proven available.`
- X2 handoff §3 appended once: `- B-94: inspected the indicator's internal XOB records and defined the minimum evidence contract; no source edit or run.`
- X3 ledger `1239.` appended once (tag `B94-XOB-EVIDENCE-CONTRACT`; fields, evidence, internal/export split, R7, SHAs).
- X4 pointer 20→20 lines (cap 35): latest B-94 MEASURED; R7 INTERNAL-SOURCE-UNKNOWN; EA/EX5 unchanged; no compile/runs; separator parked.
- Pre-commit re-check: X1/X2/X3 counts 1; `^1238.` = 1; staged set = 6 relay files only; no source diff; no run tables.

(End of slice)
