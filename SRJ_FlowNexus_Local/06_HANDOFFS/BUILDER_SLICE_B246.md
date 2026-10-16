# BUILDER SLICE B-246 - raw rows (KS + leg-scope D2, RESTORED NARROW-NEXT)
Base: builder/B-246 cut at 5ada5ce (= B-245 head). Verdict RESTORED (D2 NARROW-NEXT).
Trial base .B245D12K (EA 0a6affaf/c4e08e11, Flow 2d6b402f/18c362fb, OB 2d0b60a6, Imb fc4408f1) + 2 hunks.
## Start gate
```
log-1 5ada5ce (backup exact; builder/B-246 absent on GitHub pre-cut; on B-246).
gated diff EMPTY on all 0.3 files + both skills + LESSONS + ledger.
Disk kept: EA 18a1d49b/d85cf7d2 + Flow a8201128/61177aa5 + OB 915b4fc3 + Imb d9a38776 + Types d542b458 + Bias 0b334063 + State 2e4f8a95 + POI d47a0e68/04fcd8a5 + tini ff1dfcdf.
.B245D12K 6 files verified (EA 0a6affaf/c4e08e11, Flow 2d6b402f/18c362fb, OB 2d0b60a6, Imb fc4408f1).
Tick STATIC (2026.hcc 18678468). No terminal64. Ledger ^1392=1 ^1393=0. Python 3.13.16.
Tracked-dirty 45 files pre-existing (CRLF noise + B-234 packs); B-245 run files ACCOUNTED (keeps, .preB245, inis, launchers, STATUS/DONE, CUTs, job scripts, tester report).
Part B: M10JUN-SETUP-CLASS count 1 ALREADY_BANKED, no new words.
```
## Part K0 rule check (quoted with line numbers)
```
26 L1-L3: kill = body close beyond the invalidation level (no activation step anywhere in his words).
46 L4: 22 July 13:45 OB invalidated but structure not yet renewed; L6 PANEL-LEG-STATE (the three flags are the panel's current-leg states); L7 DEAD-UNTIL-RENEWED (killed OB stays dead until the structure renews).
50 L10 ZONE-NOT-REACHED-NOT-INPLAY + L13 REACHED-ONLY-INPLAY.
53: NO-CODE-STOP + GU-UJ-NEXT + M10JUN-SETUP-CLASS (10 Jun 18:55: 5m valid, setup class open).
spec 3.5 (3.md:43-60: XOB in-play = penetrated within the current structural leg; FVG in open leg; no precedence; size never a criterion) + 3.6 (3.md:77-100: opposing-candle touch rules; XOB touch permitted never disqualifying).
B-226 lesson (slice R1/S): offline rebuilt legs ENDED A1/P3/A3/A7 (A7 conflicts his B-143 words) -> this relay uses the panel's own leg machinery, not a rebuilt one.
```
## Part K0 writer list (raw; every isValid/isActivated=true writer)
```
OrderblockMgr:112-113 (replay activation: ob.isActivated=true; ob.isValid=true; validationBar=replayBar).
OrderblockMgr:484-486 (live pass: isActivated=true; isValid=true; validationBar=i).
ImbalanceMgr/Flow/Panels/State: NO isValid/isActivated=true writers (grep, 5 files).
Panel leg-start spot: NOT FOUND as a named per-side value (Panels.mqh has no leg/start bar; only singular structLegBoundary + currentStructureStartBar) -> built through per K3.
Leg-boundary writers (raw): BiasEngine:135 initial (detectedBias) + :293 flip (nextBias); ImbalanceMgr:202 bullish fvgRenewal (i-2) + :341 bearish fvgRenewal (i-2); StateInit State.mqh:347.
```
## Part K1 base (.preB246 x8 + 6 copies verified)
```
.preB246: Types d542b458, OB 915b4fc3, Imb d9a38776, Bias 0b334063, State 2e4f8a95, Flow src a8201128, EA ex5 d85cf7d2, Flow ex5 61177aa5.
K1 copies: EA 0a6affaf/c4e08e11, Flow 2d6b402f/18c362fb, OB 2d0b60a6, Imb fc4408f1 (all OK).
```
## Part K2/K3 diffs vs .preB246 (raw)
```
Types: + bool b246KmDead (beside hasDrivenRenewal) + ctor false. State: + b246LegStartBull/Bear + init NA.
KM site: + ob.b246KmDead = true (10sp indent; first attempt failed on 11sp, owned here).
Replay skip: if(shouldActivate){ if(b246KmDead) Print [B246KS] site=:112 else {activate} } (+1/+1).
Live skip: same shape, site=:494 (+1/+1; missing close owned + fixed, verified by read-back).
BiasEngine:135 + :293: side leg start = i. ImbalanceMgr:202 bull + :341 bear: side leg start = i-2.
ZS: + leg reads; KM-killed fallback (kill = invalidationBar); count += reach>=leg; [B245ZS] print replaced by 2 [B246ZS] rows/bar/side (legStart/count/newest).
Braces: OB 131->133 balanced; Types/State/Bias/Imb-delta +0 balanced; Flow 129->150 (+21 = B245 block) balanced.
Markers: [B246KS] prints once per site (2); [B246ZS] 2 (B/S rows); [B245ZS] 0.
Compiles: Flow 0 errors + same 3 pre-existing long-to-int warnings (1598/1820/2003, none in hunks); EA 0 errors 0 warnings.
Trial SHAs: EA 0a6affaf/2f61bd1a, Flow a14c76a8/0d28f876, Types f2e74e66, OB 3c669e6d, Imb ec1720b1, Bias 1c210d7b, State 4bdc8e41. .B246K 9 files verified pre-launch.
```
## Part T1 launch (EA 2f61bd1a + Flow 0d28f876 pre, post)
```
RECON62-B246D: dates 1787702400/1788998400 read back; WMI launcher PID 6048 (1.8 GB full-log read owned, killed after verify); terminal PID 17388; PRE=17138629; window replay 2026.08.26 verified; watcher PID 5504 verified by PID; DONE PASSED 14:54:56 (~4m).
ex5 pre/post identical.
```
## Part T2 grade raw
```
GRADE RECON62-B246D: KEEP entries exact 4/7; KEEP exits exact 3/7; NEVER fires 0; MACHINE-ONLY ungraded 0; trades 4
A1 EXACT (+3pt DIFF); A2 EXACT; A3 MISSING (9-04 buy 16:00 1.16019); A4 EXACT; A5 NEVER SILENT; A6 EXACT; A7 MISSING (9-08 sell 17:00 1.16220); NEVERS all SILENT; K2SEP MISSING (9-02 sell 14:45 1.15747); N4SEP0930 SILENT.
```
## Part T5/T6 carriers (KSLEG_B246.csv: 643 rows)
```
ZG REFUSE: 9-02 14:40 SHORT v0 (leg 14:40); 9-04 15:55 LONG v0 (leg 15:35); 9-08 16:40 SHORT v0 (leg 16:30); also 9-02 16:30/17:45 SHORT v0, 9-08 09:35 LONG v0 (no truth rows).
Keeps PASS: A1 sideS leg09:35 count2; A2 sideB leg16:25 count1; A4 sideB leg07:50 count2; A6 sideS leg09:25 count2.
KS: 1317 skips (live site :494; e.g. 8-11 id50, 8-12 id106/id128) - mechanism proven, 25 Jun EU effect untested (no EU run).
S4 FRESHCOUNT at kept confirms: A4/A6 ob0/fvg1/adv1 HOLD (KS did not touch kept S4 paths).
Cutter fix owned: rx_zs legStart-with-space missed all September rows (240110 parsed, 12320 dropped); fixed + re-cut in one pass; DEALS unchanged (8).
```
## Timing + final disk + housekeeping
```
Wall: gate+reads+K0 ~30m; K1-K3 hunks + compiles ~35m; RECON launch-verify ~12m (wrapper full-log read) + run 4m; cut + re-cut + grades + carrier hunt ~30m; X folds + records + push follow.
Final disk RESTORED: EA 18a1d49b/d85cf7d2, Flow a8201128/61177aa5, Types d542b458, OB 915b4fc3, Imb d9a38776, Bias 0b334063, State 2e4f8a95, POI d47a0e68/04fcd8a5, tini from .preB246, 23 charts, no terminal64. .B246K unstaged (9 files).
Housekeeping: kept cuts stay; B246D cut stays (current trial); job/launch/grade/status/done/mk scripts uncommitted; nothing deleted. EU dates 05-26/06-04/06-25/07-15 day packs NOT RUN (no EU launch).
X7 carried: A1 +3pt = FILL-EXACT class, no edit.
```
## Size gate (caps 20000/600; pointer 6000/35; result 12000)
```
pointer 4508/35 PASS; result 3634/22 PASS; slice 6694/78 PASS (this file); TRUTH 3143 unchanged PASS; TRUTH 3143 unchanged; FIXPLAN 16753 (fold -19 archived + X1 +2); LESSONS 19936 (fold -1 archived); ARCHIVE EU_FIX_PLAN_ARCHIVE_B246.md (19 lines) + LESSONS_ARCHIVE_B246.md (1 line); READ_MAP rewritten; BATCH246 ~1100; KSLEG 643 rows; day packs 3.
```
(End of slice)
