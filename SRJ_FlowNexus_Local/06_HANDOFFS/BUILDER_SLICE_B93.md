# BUILDER SLICE B-93 - raw searches, snippets, inventory table, before/after lines (XOB evidence inventory, MEASURED)

Scope: read-only text search + inspection. No source edit, no export, no buffer change, no reconstruction, no re-grade, no compile, no run. Live evidence paths only (backup/archive duplicates exist on disk; not cited as evidence).

## START GATE (raw)

- `git ls-remote https://github.com/sirooj/srj-flow-nexus.git builder/B-92` = `04253e73544b5aad0d23839853e40a032d4ed61b` (verified; cut builder/B-93 here).
- `git log -1` = `04253e73544b5aad0d23839853e40a032d4ed61b B-92 park XOB separator as NOT BUILDABLE, B-91 one-condition grades separate nothing (relay B-92)`.
- `git status --short` line count = 359 (preserved drift + untracked dirt, untouched).
- `git diff 04253e73... --` EMPTY on: pointer, RESULT/SLICE B92, PLANNER_CONTEXT, PLANNER_HANDOFF.
- EA disk SHA `137076D9CF85160AB8CD8379575AFD4801E71098CE97C0B10D88A42C7BF59671` (695359 B, LF-only; prefix matches).
- EX5 disk SHA `FA4C924978F6A1D5C57B725F2AB530BBB5DC5B1E0D1D0B51FB0172E80D8C41B5` (prefix matches).
- No terminal64. No compile. No tester run.

## PART B GREPS (before/after)

- Operator message = B-93 relay order only; no new trading-rule words. Record `no new rule words`; appended nothing (strategy skill not loaded, not edited).
- `B-93-XOB-EVIDENCE-INVENTORY` in 99_WORKFLOW 0→1 (context X1). `B-93` in 99_WORKFLOW 0→1 (handoff X2; context tag counted on its own line).
- `B93-XOB-EVIDENCE-INVENTORY` in SRJ_FlowNexus_Local 0→1 (ledger 1238). `^1238.` 0→1; `^1237.` = 1 beside.

## R1 SEARCHES (identifier + nearby text; live files)

- `FL_BUF_XOB_ZONE_HIGH` repo-wide: matches cluster in `Experts/SRJ_FlowNexus_EA.mq5` (:206 define, :6911/:8800 reads) plus backup/archive copies (not evidence). Producer-side name differs (`g_bufXobZoneHigh`), so FL_BUF_* alone does not locate the producer.
- `FL_BUF_XOB_PROMO_TIME|FL_BUF_XOB_OBJ_ID|FL_BUF_XOB_ZONE_LOW` in `Indicators/`: NO match (producer uses `g_buf*` names) — expected; producer located by `g_buf*` + `SetIndexBuffer` searches below.
- `SetIndexBuffer` in `Indicators/SRJ_FlowLogic.mq5`: buffers 22 (`g_bufXobZoneHigh` :708), 23 (`g_bufXobZoneLow` :709), 31 (`g_bufXobObjId` :727), 33 (`g_bufXobPromoTime` :731), 34 (`g_bufOBValidProv` :732), 30 (`g_bufStructLegTime` :724), 39 (`g_bufObSwingTime` :741). Live file; backup copies (`.B21M`/`.preB*`) agree but are not evidence.
- `g_bufXobZoneHigh|g_bufXobPromoTime|g_bufXobObjId|g_bufOBValidProv|SRJ_NearestPromotedOBIndex` in live `Indicators/SRJ_FlowLogic.mq5`: :63/:113/:128/:129 (declares), :708/:727/:731/:732 (bind), :773/:792/:796/:797 (series), :928/:947/:951/:953 (init), :1124 (prov publish), :1206-1230 (selected in-bias publish incl. `SRJ_NearestPromotedOBIndex(g_s.currentBias)` :1212).
- `FL_BUF_XOB_PROMO_TIME|FL_BUF_XOB_OBJ_ID|FL_BUF_XOB_ZONE_LOW|OBPROV|SXobRecord|ZONEPICK|INPLAYCOMMIT` in kept `Experts/SRJ_FlowNexus_EA.mq5`: :207 (zone low define), :748 (struct SXobRecord), :2048 (obj id define), :2063 (promo define), :6904/:7529/:8775 (obj id reads), :6912/:8801 (zone low reads), :8790 (promo read), :8873 (ZONEPICK print), :9286 (INPLAYCOMMIT print). Zero OBPROV matches in the EA (consumer NOT FOUND).
- `obStart|invalidationBar|killBar|KillTime|isInvalidated` against live `Indicators/SRJ_FlowLogic.mq5`: no defining lines (returned hits are `EventKillTimer` in unrelated CQD/POI files) — no formation/kill-bar export by those names.
- `g_bufXobZoneLow|g_bufStructLegTime|g_bufObSwingTime|promotionBar|...` in live indicator: :64 (zone low), :99 (leg time), :164 (swing time), :709/:724/:741 (binds), :1225-1226 (promotionBar consumed internally for the selected pick only).
- `OBPROV|OBValidProv|ReadFlow(FL_BUF_XOB_OBJ_ID|ReadFlow(FL_BUF_XOB_PROMO_TIME|bool ZoneInPlay|IsConfirmationCandle` in kept EA: :2435/:2481 (IsConfirmationCandle decl/def), :7118 (`bool ZoneInPlay`), :6904/:7529/:8775 (obj id reads), :8790 (promo read). OBPROV/OBValidProv: no EA match.
- `#define FL_BUF_STRUCT_LEG_TIME|...|iHigh(_Symbol, PERIOD_CURRENT, barShift)` in kept EA: :180 (buffer 39 define), :2035 (buffer 30 define), :5015/:6355/:7076 (leg/swing-time reads — different from XOB formation), :2290/:6978/:7123 (OHLC reads).

## EXACT SNIPPETS (live files, by text)

- `Indicators/SRJ_FlowLogic.mq5:1212` (inside the :1206-1230 publish block): `int xobIdx = SRJ_NearestPromotedOBIndex(g_s.currentBias);` — one in-bias pick per bar; defaults EMPTY/0.0 at :1206-1209.
- `Indicators/SRJ_FlowLogic.mq5:129` (buffer 34 comment): provenance of the tickOBIsValid value; EMPTY_VALUE where uncomputed — not a kill bar.
- `Experts/SRJ_FlowNexus_EA.mq5:7118`: `bool ZoneInPlay(int barShift, double zHi, double zLo,` — tests one given zone at one shift (B-88 R1a whole pasted).
- `Experts/SRJ_FlowNexus_EA.mq5:8873` / `:9286`: `[SRJ-EA] ZONEPICK ...` / `[SRJ-EA] INPLAYCOMMIT ...` prints — census/diagnosis only, never read back as state.
- `BUILDER_RESULT_B84.md:29` (K3, standing record): EA reads only the single picked zone/id/promo per shift (22/23/31/33); zero OBPROV consumers; no XOB loop; SXobRecord is cross-run scoring, not runtime state; census sources are print rows the EA cannot read back.

## COMPLETE R2 TABLE

| field | producer | EA consumer | shift-readable | full-map | verdict |
|---|---|---|---|---|---|
| zone high/low 22/23 | FlowLogic :63-64/:708-709, publish :1218-1219 | EA :6911-6912/:8800-8801 | yes | no (selected) | FOUND selected-only |
| promo time 33 | FlowLogic :128/:731, publish :1230 | EA :8790 | yes | no (selected) | FOUND selected-only |
| object id 31 | FlowLogic :113/:727, publish :1220 | EA :6904/:7529/:8775 | yes | no (selected) | FOUND selected-only |
| formation/promotion-bar | none exported (30/39 = leg/swing times) | no (EA :7076/:5015 differ) | no | no | NOT FOUND |
| invalidation/kill-bar | none exported (34 = provenance) | no (0 consumers) | no | no | NOT FOUND |
| OBPROV runtime | producer buffer 34 only | none | n/a | no | producer-FOUND / consumer-NOT-FOUND |
| full live collection/loop | none in EA | none | no | no | NOT FOUND |
| ZoneInPlay | EA :7118 (self) | S3/S4 | yes | no (one zone) | FOUND selected-only |
| OHLC at shift | terminal API | EA :2290+/:6978/:7123 | yes | n/a | FOUND |
| confirmation | EA :2481 | many callers | yes | n/a | FOUND |

## R3/R4/R5 (condensed; full text in result)

- R3: (1) defined-not-exported: internal COrderblock fields only; (2) exported selected-only: 22/23/31/33/34; (3) complete map: NONE. Selected-only is not a map.
- R4: identity FOUND selected-only; zone FOUND selected-only; promo FOUND selected-only; formation NOT FOUND; invalidation/kill NOT FOUND; per-XOB direction NOT FOUND; multiple records per candle NOT FOUND.
- R5: XOB-PROMOCENSUS print/log-only; OBPROV print/log-only; PROMOCENSUS print/log-only; UJBARMAP print/log-only; ZONEPICK print/log-only; INPLAYCOMMIT print/log-only; FL_BUF_XOB EA-readable selected-only; SXobRecord UNKNOWN (struct :748, scoring member).
- R6: NO complete map exported → PARTIAL SOURCE ONLY (B-92 limitation confirmed, unchanged; no re-grade).
- R7: `PARTIAL-SOURCE-XOB-STAYS-PARKED` — inventory only, no edit/export/compile/run permission.

## BEFORE/AFTER RECORD LINES (exact)

- X1 context §4 appended once: `- B-93-XOB-EVIDENCE-INVENTORY (planner lesson 2026-10-08, B-93): inventoried existing upstream XOB evidence without reopening prior readings or editing the EA; the XOB path remains parked unless a complete readable live-XOB source is found.`
- X2 handoff §3 appended once: `- B-93: inventoried existing upstream XOB evidence without source edits or runs; next step depends on whether a complete readable live-XOB source exists.`
- X3 ledger `1238.` appended once (tag `B93-XOB-EVIDENCE-INVENTORY`; R2 fields, paths, selected-vs-map, R5 classes, R7, SHAs).
- X4 pointer 20→20 lines (cap 35): latest B-93 MEASURED; R7 PARTIAL-SOURCE-XOB-STAYS-PARKED; EA/EX5 unchanged; no compile/runs; four readings stay closed.
- Pre-commit re-check: X1/X2/X3 counts 1; `^1237.` = 1; staged set = 6 relay files only; no source diff; no run tables.

(End of slice)
