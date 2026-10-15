# BUILDER SLICE B-239 - raw rows (K0 STOP map; MEASURED)
Base: builder/B-239 cut at 044a119 (= B-238 head). Verdict MEASURED (K0 STOP, no edit, no runs).
## Start gate
```
log-1 044a119 (backup ls-remote exact; on B-239).
status 995 (+B-238 job/launch/grade/pack artifacts ACCOUNTED). gated diff EMPTY on all 0.3 files + both skills + LESSONS + ledger.
Disk: EA a62194f8/a975ea27; POI d47a0e68/04fcd8a5; tini a512582a; tick STATIC (10-06 18678468); no terminal64; ledger ^1385=1 ^1386=0 pre; Python 3.13.16.
Line numbers: rules/50 quote L4 exact; rules/21 quote actual L2 (relay said L3); rules/28 quote actual L2 (relay said L3).
```
## Part B banking
```
50/21/28 quotes count 1 each: ALREADY_BANKED, no new words.
```
## Part K0 map (read-only; raw spots with line numbers)
```
K0.1 FVG birth: Indicators/SRJ_FlowLogic.mq5:1763 GAP_FORM side=B (triple i-2/i-1/i, arrays g_b176Bull/T1-T3/Top0/Bot0/Span/HasSpan/Dead) and :1782 GAP_FORM side=S. Separate indicator program, NOT compiled into the EA (EA has 0 GAP_FORM hits).
K0.1 XOB promotion: tracked in FlowLogic (g_orderblocks, COrderblock.isPromoted/promotionBar/low/high, reach loop :1789+). EA's single XOBPROMO hit EA:9526 is print-only (Task 123 diagnostic census of FL_BUF_XOB_PROMO_TIME), not a birth point.
K0.2 values at births: side + t1/t2/t3 + range (FVG); promotionBar/low/high/side/objId (XOB) - all in FlowLogic scope, out of EA scope.
K0.2 EA side: picked-zone buffer reads only - FL_BUF_XOB_ZONE_HIGH/LOW (EA:9534-9535), FL_BUF_FVG_LEG_ZONE_HIGH/LOW (EA:9536-9537), obj IDs (EA:9509-9510/7199), promo time (EA:9524). EA:465-466 forbids indexing g_orderblocks/g_imbalances (P16, SObjectRef only).
K0.3 zone gate in EA: B177HZ EA:10478-10506 (gapTouch@retest + xobWin@confirm, refuse both-0 via GoAbort(ABORT_HISZONE_NONE) EA:10504). Refusal path GoAbort(reason, g_state) EA:7112-class.
K0.4 STOP-for-planner: both birth points outside the EA program (K0.1). Verdict MEASURED, no K/T. Same class as B-233 K0 STOP (picked-only reads).
Buffer export shopping list (names only, no edit): per-bar same-side lists XOB{promotionBar,low,high,side,objId} + FVG{t1,t2,t3,top0,bot0,side,objId}, or count + indexed access to the GAP_FORM/XOB rows already printed.
```
## Part K1 rule check (no conflict found; never reached an edit)
```
rules/50 (never touched/not in play before entry = EA defect) + rules/21 L2 (retrace = in play) + rules/28 L2 (any XOB/FVG, no precedence) + spec 3.5 (penetration in the swing leg). Touch at _Digits (B-237 precedent). Reach-only, no kill test. No conflict with banked words.
```
## Part K/T skipped
```
No backups (nothing touched), no compile, no runs, no cuts, no grades. Disk untouched (SHAs re-verified after records: EA a62194f8/a975ea27).
```
## Part X records
```
Ledger 1386. Fixplan F3 State B-239. Pointer State B-239 + Lane 5/6 + Next planner-decides. REVIEW_BATCH_B239 no new items. Truth unchanged. No LESSONS line.
```
## Timing + final disk + housekeeping
```
Wall: gate + reads + banking ~20m; K0 code map ~20m; records ~10m; commit/push follow.
Final disk untouched: EA a62194f8/a975ea27, POI d47a0e68/04fcd8a5, tini a512582a, 17 charts, no terminal64.
Housekeeping: none (no new artifacts this relay except result/slice/batch; nothing deleted).
```
## Size gate (caps pointer 6000/35, result 12000, slice 20000/600)
```
pointer 4371/35 PASS; result 2985/20 PASS; slice 3595/60 PASS (this file); TRUTH 3143 PASS; FIXPLAN 17652 PASS; BATCH239 156 PASS; LESSONS 19984 PASS; READ_MAP rewritten. Register (source) untouched. EA/includes/POI committed files untouched.
```
(End of slice)
