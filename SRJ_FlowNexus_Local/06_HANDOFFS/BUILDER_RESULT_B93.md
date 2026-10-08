# BUILDER RESULT B-93 - inventory for genuinely new XOB evidence: partial selected-only source, XOB stays parked, MEASURED

Trader summary: B-92 parked the XOB separator because every existing reading failed and the EA cannot read the full live-XOB map. This relay does not reopen those readings and does not edit the EA. It only checks whether the repository already contains a readable upstream source for live XOB identity, promotion, formation, in-play and kill state; if not, the XOB path stays parked.

## Part 0 - fresh-session start

- 0.1 Relay skill loaded whole first (67 lines). Strategy skill NOT loaded (read-only infrastructure inventory, no trading rule touched).
- 0.2 `git ls-remote https://github.com/sirooj/srj-flow-nexus.git builder/B-92` = `04253e73544b5aad0d23839853e40a032d4ed61b` (verified). Cut `builder/B-93` from it. Push via `backup`, never `origin`.
- 0.3 Read in order on `builder/B-92`: pointer (20 lines); RESULT_B92 (54) + SLICE_B92 (60) whole; PLANNER_CONTEXT whole (100 lines, B-92 lesson present); PLANNER_HANDOFF whole (40 lines, B-92 arc present); relay skill whole; spec v4.2 whole (396 lines; lines 1-50 + 51-250 re-read this turn, remainder verified unchanged via the B-92 whole read and the empty gate diff on forbidden paths — spec never edited). Source inspection by text search only (grep tool; identifier + nearby text, never old line numbers alone).
- 0.4 Names per relay: kept EA `Experts/SRJ_FlowNexus_EA.mq5` prefix `137076D9CF85`; kept EX5 prefix `FA4C924978F6`; kept build hunk S + hunk RKD unchanged; previous decision `B92-XOB-PARKED-NONSEPARATOR` item `1237`; this tag `B93-XOB-EVIDENCE-INVENTORY`, item `1238`; result/slice B-93; verdict MEASURED.
- 0.5 Start gate: `git log -1` = `04253e73544b5aad0d23839853e40a032d4ed61b` (B-92 head). `git diff 04253e73544b5aad0d23839853e40a032d4ed61b --` EMPTY on every committed file named (pointer, RESULT/SLICE B92, PLANNER_CONTEXT, PLANNER_HANDOFF). `git status --short` = 359 lines (preserved multi-lane drift + untracked dirt, untouched). EA disk SHA `137076D9CF85160AB8CD8379575AFD4801E71098CE97C0B10D88A42C7BF59671` (695359 B; LF-only, no CR; prefix matches). EX5 disk SHA `FA4C924978F6A1D5C57B725F2AB530BBB5DC5B1E0D1D0B51FB0172E80D8C41B5` (prefix matches; binary). No terminal64. No compile. No tester run. No STOP.
- 0.6 Scope MEASURED (read-only text search + inspection; B-93 result/slice/ledger/pointer/context/handoff writes only). No Part K, no Part T, no `.preB93` backups.

## Part B - banking

- B1 Grep-first: the operator message carries the B-93 relay order only; it contains no new trading-rule words. Strategy skill, journal and ledger need no new banking. Record `no new rule words`; appended nothing. Strategy skill not loaded and not edited (relay order).

## Part R - read-only evidence inventory

- R1 FL_BUF_* defining/publishing sources FOUND (no NOT FOUND, no guessing):
  - Consumer-side defines: kept EA `Experts/SRJ_FlowNexus_EA.mq5` — `#define FL_BUF_XOB_ZONE_HIGH 22` (:206), `#define FL_BUF_XOB_ZONE_LOW 23` (:207), `#define FL_BUF_XOB_OBJ_ID 31` (:2048), `#define FL_BUF_XOB_PROMO_TIME 33` (:2063), `#define FL_BUF_OB_SWING_TIME 39` (:180), `#define FL_BUF_STRUCT_LEG_TIME 30` (:2035).
  - Upstream producer: `Indicators/SRJ_FlowLogic.mq5` — `double g_bufXobZoneHigh[]` (:63) + `SetIndexBuffer(22, ...)` (:708); `double g_bufXobZoneLow[]` (:64) + `SetIndexBuffer(23, ...)` (:709); `double g_bufXobObjId[]` (:113) + `SetIndexBuffer(31, ...)` (:727); `double g_bufXobPromoTime[]` (:128) + `SetIndexBuffer(33, ...)` (:731); `double g_bufOBValidProv[]` (:129, buffer 34, :732); `double g_bufStructLegTime[]` (:99, buffer 30, :724); `double g_bufObSwingTime[]` (:164, buffer 39, :741). Publish block :1206-1230 selects ONE in-bias pick via `SRJ_NearestPromotedOBIndex(g_s.currentBias)` (:1212) and publishes its zone/id/promo (EMPTY/0.0 defaults :1206-1209).
- R2 Inventory (already-existing readable fields only; live paths; backup/archive duplicates exist on disk but evidence cites live files):

| field | defining source | producer exists | EA consumer exists | readable at historical shift | full live-map capable | evidence |
|---|---|---|---|---|---|---|
| selected XOB zone high/low (22/23) | Indicators/SRJ_FlowLogic.mq5 :63-64/:708-709 | yes (publish :1206-1230) | yes (EA :6911-6912, :8800-8801 via ReadFlow) | yes (any barShift via ReadFlow) | no (one in-bias pick per bar) | grep FL_BUF_XOB_ZONE_HIGH (EA :206/:6911/:8800); g_bufXobZoneHigh/Low (indicator :63-64/:708-709/:1218-1219) |
| selected XOB promotion time (33) | Indicators/SRJ_FlowLogic.mq5 :128/:731 | yes (publish :1230; 0 = unset) | yes (EA :8790 via ReadFlow) | yes (any barShift) | no (selected only) | grep FL_BUF_XOB_PROMO_TIME (EA :2063/:8790); g_bufXobPromoTime (indicator :128/:731/:1230) |
| selected XOB object id (31) | Indicators/SRJ_FlowLogic.mq5 :113/:727 | yes (publish :1220; 0 = none) | yes (EA :6904/:7529/:8775 via ReadFlow) | yes (any barShift) | no (selected only) | grep FL_BUF_XOB_OBJ_ID (EA :2048/:6904); g_bufXobObjId (indicator :113/:727/:1220) |
| XOB formation / promotion-bar field | none as an export | no | no | no | no | buffers 30/39 are leg/swing times (indicator :99/:164/:724/:741; EA reads :7076/:5015 — checked different per B-89); no obStart export; identifier search obStart/invalidationBar/killBar in live FlowLogic returns no defining lines |
| XOB invalidation / kill-bar field | none as an export | no | no | no | no | buffer 34 is tickOBIsValid provenance (indicator :129 comment; publish :1124), not a kill bar; zero EA OBPROV consumers (B-84 K3; EA grep OBPROV = no match) |
| OBPROV runtime buffer / consumer | producer Indicators/SRJ_FlowLogic.mq5 :129/:732 (buffer 34) | yes (buffer exists) | no (zero consumers) | n/a | no | g_bufOBValidProv :129/:732/:797/:953/:1124; EA OBPROV grep = NOT FOUND; B-84 K3 |
| full live-XOB collection / loop | none in EA | no | no | no | no | B-84 K3: no loop over XOBs exists in the EA; EA reads single picked zone/id/promo per shift only |
| ZoneInPlay | Experts/SRJ_FlowNexus_EA.mq5 :7118 | yes (EA itself) | yes (S3/S4 callers :8867-8869/:6925-6926) | yes (barShift-callable) | no (tests one given zone) | `bool ZoneInPlay(int barShift, ...)` EA :7118; B-88 R1a |
| candle OHLC at arbitrary shift | Experts/SRJ_FlowNexus_EA.mq5 | yes (terminal API) | yes | yes | n/a (per-bar data) | `iHigh(_Symbol, PERIOD_CURRENT, barShift)` EA :2290/:6978/:7123 (representative; used across reads) |
| existing confirmation machinery | Experts/SRJ_FlowNexus_EA.mq5 :2481 | yes | yes | yes | n/a | `bool IsConfirmationCandle(...)` EA :2481 + callers :7724/:8529/:9340/:9360/:9548 |

- R3 Three cases kept separate (no collapsing):
  1. Defined upstream but not exported: only internal `COrderblock` fields (e.g. per-object start/promotion/invalidation members used by the selector); no historical per-XOB export of identity/zone/promo/formation/kill exists beyond the single-pick buffers.
  2. Exported but selected-XOB-only: buffers 22/23 (zone), 31 (obj id), 33 (promo time), 34 (validity provenance). Each carries exactly one in-bias pick per bar (`SRJ_NearestPromotedOBIndex(g_s.currentBias)` :1212). A selected-XOB field is not a full live-XOB map.
  3. Exported as a complete historical map of every live trade-direction XOB: NONE found.
- R4 Existing-field search (could-carry, already present; no creation proposed):
  - XOB object identity per historical shift: FOUND selected-only (buffer 31; EA-readable any shift; one pick).
  - XOB zone high/low per historical shift: FOUND selected-only (buffers 22/23).
  - promotion time per historical shift: FOUND selected-only (buffer 33).
  - formation time per historical shift: NOT FOUND (no export).
  - invalidation/kill state per historical shift: NOT FOUND (no kill-bar export; buffer 34 is provenance; zero EA consumers).
  - trade direction associated with each XOB: NOT FOUND (pick is in-bias by construction; no per-side export — B-89).
  - multiple live XOB records at one candle: NOT FOUND (single record per bar).
- R5 Producer-side records already in the repo (no reconstruction into runtime state):
  - `XOB-PROMOCENSUS`: print/log-only (indicator promotion census rows in journals; diagnosis source per B-84 K3; EA cannot read back).
  - `OBPROV`: print/log-only (producer buffer 34 exists; no EA consumer; journal kill rows used by B-75 census with code=4; not EA-readable state).
  - `PROMOCENSUS`: print/log-only (journal census rows; B-90 R1 obStartT source; not EA-readable).
  - `UJBARMAP`: print/log-only (EA diagnostic print block, B-58 D2; journals carry 3168/4320 rows; EA never reads it back).
  - `ZONEPICK`: print/log-only (EA print :8873; census use only; never consumed by a gate as state).
  - `INPLAYCOMMIT`: print/log-only (EA print :9286 over the t133 walk; never consumed as state).
  - `FL_BUF_XOB`: EA-readable selected-only (buffers 22/23/31/33 via ReadFlow at :6904/:6911-6912/:7529/:8775/:8790/:8800-8801).
  - `SXobRecord`: UNKNOWN (EA struct :748, member of SStructuralBundle :809; cross-run scoring member per B-84 K3, not runtime state; no gate reads it as a live map).
- R6 B-92 limitation confirmed without change: no complete historical live-XOB map is already exported. Existing fields are selected-only or incomplete. Report: PARTIAL SOURCE ONLY. No partial source is called buildable. B-88/B-89/B-90/B-91 not reopened or re-graded (no reading re-run; evidence above is identifier/producer inventory only).
- R7 Decision: `PARTIAL-SOURCE-XOB-STAYS-PARKED` (existing fields are selected-only or incomplete). Inventory result only; not permission to edit, export, compile or run.
- R8 No Part K, no Part T, no `.preB93` backups (relay order).

## Part X - records

- X1 `PLANNER_CONTEXT.md` section 4 grep `B-93-XOB-EVIDENCE-INVENTORY` = 0 -> appended exactly one lesson (verified 1). No duplicate.
- X2 `PLANNER_HANDOFF.md` section 3 grep `B-93` = 0 -> appended `- B-93: inventoried existing upstream XOB evidence without source edits or runs; next step depends on whether a complete readable live-XOB source exists.` (verified 1). No duplicate.
- X3 Ledger grep `B93-XOB-EVIDENCE-INVENTORY` = 0 and `^1238.` = 0 -> appended item `1238` (R2 fields, source paths + evidence, selected-vs-map distinction, R5 classification, R7 decision, no edit/compile/run, EA/EX5 SHAs). `^1237.` = 1 beside. No duplicate.
- X4 Pointer 20 -> 20 lines (cap 35): latest B-93 MEASURED, R7 decision, EA/EX5 unchanged, no compile/runs, next depends on genuinely new readable evidence, four readings stay closed.

## Part F - file, push, reply

- F1 this result. F2 slice `BUILDER_SLICE_B93.md` (raw searches, snippets, inventory table, before/after lines; under 600 lines; no source diff, no run tables). F3 ledger 1238. F4 pointer per X4. F5 stages only the 6 relay files. F6 commit + push `builder/B-93` via `backup` + ls-remote check. Reply MEASURED.

## Final disk state (MEASURED turn; kept RKD build on disk, uncommitted)

- EA `137076D9CF85160AB8CD8379575AFD4801E71098CE97C0B10D88A42C7BF59671` (695359 B, LF-only, untouched; ` M` vs stale blob = expected uncommitted lag, never staged) + `.preB87`/`.B87PICKXOB` kept uncommitted. EX5 `FA4C924978F6A1D5C57B725F2AB530BBB5DC5B1E0D1D0B51FB0172E80D8C41B5` (matching kept source). Indicator `Indicators/SRJ_FlowLogic.mq5` inspected read-only (producer lines cited, not edited). Strategy skill untouched (not loaded). Journal CSV untouched. Register/spec untouched. terminal.ini + charts untouched. No terminal64. No edit/compile/run beyond the relay's text records.

No carried note (no STOP; nothing to ask him).
