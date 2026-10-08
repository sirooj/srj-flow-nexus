# BUILDER RESULT B-94 - minimum upstream XOB evidence contract: fields present internally, provenance unproven, INTERNAL-SOURCE-UNKNOWN, MEASURED

Trader summary: B-93 found only selected-XOB buffers, not the full live-XOB history needed for the rule. This relay does not edit the EA or indicator and does not rerun the parked readings. It inspects the indicator's existing internal XOB records and writes the smallest evidence contract a future upstream export would need, without inventing a trading rule or choosing an implementation.

## Part 0 - fresh-session start

- 0.1 Relay skill loaded whole first (67 lines). Strategy skill NOT loaded (read-only data-contract inspection, no trading rule touched).
- 0.2 `git ls-remote https://github.com/sirooj/srj-flow-nexus.git builder/B-93` = `e44d49000993a61da258ca2594506a0e8d77ba8b` (verified). Cut `builder/B-94` from it. Push via `backup`, never `origin`.
- 0.3 Read in order on `builder/B-93`: pointer (20 lines); RESULT_B93 (78) + SLICE_B93 (72) whole; RESULT_B92 head (54-line file, full text known from the B-93 whole read, unchanged); PLANNER_CONTEXT whole (102 lines, B-92 + B-93 lessons present); PLANNER_HANDOFF whole (42 lines, B-92 + B-93 arc present); relay skill whole; spec v4.2 whole (396 lines; 251-396 re-read this turn, 1-250 verified unchanged via the B-93 whole read and the empty gate diff — spec never edited). Inspection by text search only on `Indicators/SRJ_FlowLogic.mq5` + `Experts/SRJ_FlowNexus_EA.mq5` (identifier + nearby text, never old line numbers as anchors; backup/archive copies excluded from evidence).
- 0.4 Names per relay: kept EA prefix `137076D9CF85`; kept EX5 prefix `FA4C924978F6`; live indicator `Indicators/SRJ_FlowLogic.mq5`; kept build hunk S + hunk RKD unchanged; prior decision `B93-XOB-EVIDENCE-INVENTORY` item `1238`; this tag `B94-XOB-EVIDENCE-CONTRACT`, item `1239`; result/slice B-94; verdict MEASURED.
- 0.5 Start gate: `git log -1` = `e44d49000993a61da258ca2594506a0e8d77ba8b` (B-93 head). `git diff e44d49000993a61da258ca2594506a0e8d77ba8b --` EMPTY on every committed file named (pointer, RESULT/SLICE B93, RESULT B92, PLANNER_CONTEXT, PLANNER_HANDOFF). `git status --short` = 359 lines (preserved drift + untracked dirt, untouched). EA disk SHA `137076D9CF85160AB8CD8379575AFD4801E71098CE97C0B10D88A42C7BF59671` (695359 B; LF-only; prefix matches). EX5 disk SHA `FA4C924978F6A1D5C57B725F2AB530BBB5DC5B1E0D1D0B51FB0172E80D8C41B5` (prefix matches; binary). No terminal64. No compile. No tester run. No STOP.
- 0.6 Scope MEASURED (read-only inspection + field-level contract; B-94 result/slice/ledger/pointer/context/handoff writes only). No Part K, no Part T, no `.preB94` backups.

## Part B - banking

- B1 The operator message carries the B-94 relay order only; it contains no new trading-rule words. Record `no new rule words`; appended nothing.

## Part R - upstream contract inspection

- R1 Internal XOB record type + members + functions (live files, current line numbers, raw excerpts in slice):
  - Type: `class COrderblock : public CObject` in `Include/SRJ/SRJ_Types.mqh:37-92`. Members: startBar/endBar/swingBar (`:40-42`), high/low/open/midpoint (`:43-46`), invalidationLevel (`:47`), isBullish (`:48`), isActivated (`:49`), isValid (`:50`), validationBar (`:51`), invalidationBar (`:52`), obLineName/midLineName (`:53-54`), isExtreme (`:55`), isPromoted (`:56`), hasDrivenRenewal (`:57`), creationBar (`:58`), promotionBar (`:59`, SRJ_NA_INT = never promoted), objId (`:63`, run-unique, NOT recalc-stable; composite key is recalc-stable per :22-30).
  - Selector: `int SRJ_NearestPromotedOBIndex(const string bias)` in `Include/SRJ/SRJ_OrderblockMgr.mqh:1084-1106` — loops `g_orderblocks.Total()` (`:1089-1090`), keeps bias-matching + promoted + valid + activated (`:1095-1100`), nearest = greatest startBar (`:1102-1103`). Pruning deletes out-of-lookback OBs (`SRJ_OB_PruningPass`, :1108-1119).
  - Producer/consumer in `Indicators/SRJ_FlowLogic.mq5`: selected-pick publish `:1206-1230` via `:1212 SRJ_NearestPromotedOBIndex(g_s.currentBias)` + `:1215 GetOB(g_orderblocks, xobIdx)`; stop-leg same selector `:1322/:1325`. Promotion internals: `COrderblock.promotionBar` consumed `:1223-1225`; comments `:117/:123-125`. Invalidation internals: `SRJ_OB_ActivationInvalidationPass` `:1031`, `obInvalidationBoundary` state `:1355-1365`, checklist boundary comment `:97`, leg filter `:1237`. No `kill` vocabulary anywhere in the live indicator (grep 0). OBPROV = `g_bufOBValidProv` provenance `:129` (buffer 34, `:732`, publish `:1124`) — never a kill bar. Buffers `:708/:709/:727/:731` (22/23/31/33) as B-93. Build stamp print `:671` (`Print("SRJ BUILD ", __DATETIME__, ...)`) — log-only.
- R2 Internal multi-record inventory (FOUND / NOT FOUND / UNKNOWN; no inference across fields):
  - `g_orderblocks` collection: FOUND as a runtime multi-object collection (selector iterates n objects; GetOB reads by index). Type: collection (CArrayObj of COrderblock).
  - Historical bar access to EVERY record: NOT FOUND (per-bar history persists ONE selected pick via buffers 22/23/31/33; the collection itself is pruned by lookback and not persisted per bar).
  - EA `SXobRecord` (`Experts/SRJ_FlowNexus_EA.mq5:748`, in `SStructuralBundle:809`): UNKNOWN as a live-map source (cross-run scoring member per B-84 K3, not runtime state; no gate reads it).
  - Per-candidate rows: name COrderblock/g_orderblocks | type collection of COrderblock | collection | historical bar access NOT FOUND (selected-pick buffers only) | direction FOUND (isBullish) | zone high/low FOUND (high/low) | objId FOUND (run-scoped) | formation FOUND (startBar/creationBar) | promotion FOUND (promotionBar) | invalidation state FOUND (isValid/isActivated/isPromoted/validationBar/invalidationBar/invalidationLevel), kill-wording NOT FOUND (grep 0) | evidence as R1 lines.
- R3 Internal vs exported (no collapsing; buffer 34 never called a kill bar):
  - Internally present, never exported per record: startBar/creationBar, promotionBar (converted to server-time promo only for the pick), validationBar/invalidationBar/invalidationLevel, isBullish/isValid/isActivated/isPromoted per object, objId per object.
  - Published buffer or print only: 22/23/31/33 = selected pick per bar (EA-readable); 34 = validity provenance per bar (no EA consumer); XOB-PROMOCENSUS/PROMOCENSUS/UJBARMAP/ZONEPICK/INPLAYCOMMIT = print/log only (B-93 R5 stands).
  - EA-readable at historical shift: selected-pick fields only (ReadFlow any shift). Complete multi-XOB map: NONE.
- R4 Minimum evidence contract (fields only, no code; FOUND INTERNALLY / NOT FOUND INTERNALLY / UNKNOWN):
  - stable XOB object identity: FOUND INTERNALLY (objId + recalc-stable composite key; recalc caveat recorded, never smoothed over).
  - trade direction of the XOB: FOUND INTERNALLY (isBullish).
  - zone high / zone low: FOUND INTERNALLY (high/low).
  - formation time: FOUND INTERNALLY (startBar + creationBar; needed for provenance per spec §3.5 age/no-recency rule).
  - promotion time: FOUND INTERNALLY (promotionBar; SRJ_NA_INT = never promoted).
  - invalidation/kill state + event time: FOUND INTERNALLY for invalidation (isValid/isActivated/isPromoted, validationBar/invalidationBar, invalidationLevel); kill-as-distinct-event UNKNOWN (no kill vocabulary in source; invalidationBar must not be re-labeled a kill bar without proof).
  - historical bar/timestamp per record: FOUND INTERNALLY as bar indices (+ server-time conversion precedent, Task 110 comment :117).
  - multi-record coexistence at one bar: FOUND INTERNALLY at runtime (n-object collection); per-bar persistence of all records NOT FOUND INTERNALLY (pruned collection + single-pick history).
  - absent / not-yet-promoted / invalidated / live distinction: FOUND INTERNALLY (no record vs promotionBar==NA_INT vs isValid/isActivated false + invalidationBar vs promoted+valid+activated).
  - run/build provenance per record: UNKNOWN (objId recalc-unstable; composite key recalc-stable but unproven as a join key; build stamp :671 is log-only, not per-record).
- R5 Smallest missing set: per-bar persistence of every live record (the multi-XOB map itself) and per-record run/build provenance linkage are unproven. Every other contract field is proven internally present, so the verdict is not INCOMPLETE; but provenance cannot be proven, so it is not COMPLETE either. No buffer number, serialization, loop shape or mechanism proposed.
- R6 Parked confirmed: separator remains parked; no B-88..B-93 reading reopened; no EA gate authorized; no source edit, compile or run authorized; evidence only, not implementation.
- R7 Decision: `INTERNAL-SOURCE-UNKNOWN` (evidence result only; not permission to edit or export).
- R8 No Part K, no Part T, no `.preB94` backups.

## Part X - records

- X1 `PLANNER_CONTEXT.md` section 4 grep `B-94-XOB-EVIDENCE-CONTRACT` = 0 -> appended exactly one lesson (verified 1). No duplicate.
- X2 `PLANNER_HANDOFF.md` section 3 grep `B-94` = 0 -> appended `- B-94: inspected the indicator's internal XOB records and defined the minimum evidence contract; no source edit or run.` (verified 1). No duplicate.
- X3 Ledger grep `B94-XOB-EVIDENCE-CONTRACT` = 0 and `^1239.` = 0 -> appended item `1239` (contract fields + classifications, indicator evidence, internal/export distinction, R7, no edit/compile/run, EA/EX5 SHAs). `^1238.` = 1 beside. No duplicate.
- X4 Pointer 20 -> 20 lines (cap 35): latest B-94 MEASURED, R7 INTERNAL-SOURCE-UNKNOWN, EA/EX5 unchanged, no compile/runs, separator parked, next needs genuinely new readable evidence.

## Part F - file, push, reply

- F1 this result. F2 slice `BUILDER_SLICE_B94.md` (raw searches, excerpts, contract table, before/after lines; under 600 lines; no source diff, no run tables). F3 ledger 1239. F4 pointer per X4. F5 stages only the 6 relay files. F6 commit + push `builder/B-94` via `backup` + ls-remote check. Reply MEASURED.

## Final disk state (MEASURED turn; kept RKD build on disk, uncommitted)

- EA `137076D9CF85160AB8CD8379575AFD4801E71098CE97C0B10D88A42C7BF59671` (695359 B, LF-only, untouched; ` M` vs stale blob = expected uncommitted lag, never staged) + `.preB87`/`.B87PICKXOB` kept uncommitted. EX5 `FA4C924978F6A1D5C57B725F2AB530BBB5DC5B1E0D1D0B51FB0172E80D8C41B5` (matching kept source). Indicator + includes inspected read-only (lines cited, nothing edited). Strategy skill untouched (not loaded). Journal CSV, register, spec untouched. terminal.ini + charts untouched. No terminal64. No edit/compile/run beyond the relay's text records.

No carried note (no STOP; nothing to ask him).
