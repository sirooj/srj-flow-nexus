# BUILDER SLICE B-243 - raw rows (K0 STOP map; MEASURED)
Base: builder/B-243 cut at 236094e (= B-242 head). Verdict MEASURED (K0 STOP, no edit, no runs).
## Start gate
```
log-1 236094e (backup ls-remote exact; on B-243).
status 1083 (+B-242 job/launch/grade/pack scripts ACCOUNTED). gated diff EMPTY on all 0.3 files + both skills + LESSONS + ledger.
Disk: kept EA 18a1d49b/d85cf7d2 + Flow 61177aa5 + 5 includes + POI d47a0e68/04fcd8a5; tini b64523fc touch-class ACCOUNTED ([Tester] RECON dates + Symbol intact, [TickLoad] intact).
Tick STATIC (10-06 18678468). No terminal64. Ledger ^1389=1 ^1390=0 pre. Python 3.13.16.
```
## Part B banking
```
46 pin + 43 0625 line + spec 3.4 line counts 1: ALREADY_BANKED, no new words.
```
## Part K0 map (read-only; raw spots with line numbers)
```
K0.1 H3 block (B-241 placement EA:~9500): S3 arming site "if(g_state == ST_S3_ZONE_WAIT)" EA:9500 with barShift in scope (EvaluateClosedBar); H3 identifiers verified (CheckFreshness(int,bool)->string EA:2770, FL_BUF_LTF_* EA:173-175, GoAbort, StateName, InpDebugLog).
K0.1 S4 poll: EA:8381-8416 "if(g_state >= ST_S4_ARMED && g_state <= ST_S5_GATE_CHECK)" runs CheckFreshness(barShift, g_state != ST_S5_GATE_CHECK) EA:8388 and kills pre-confirmation (GoAbort EA:8413/8415; S5 diagnostic-only per P-SCOPE34). H4a placeable here or at H3 site.
K0.2 code6 writer ImbalanceMgr:341-354 (bearish-bias renewal branch; KeepDead guard :341; revival tickOB=true :347-353). Helper reads g_s.structureConfirmedThisBar (State.mqh:270; set true ImbalanceMgr:328, 13 lines above the guard => guard always false here, revival always fires: the defect).
K0.2 exported ren: NOT FOUND. No buffer exports renewal (B-215 K0.4: never buffers 3/4/5/34/35/36); no panel renewal display (Panels has no renewal input; B212COLOR ren source gone with B-212 code); renewal trigger unexported (SLICE_B212: "fvgExists display + renewal trigger unexported"). Git history holds B-212..B-217 only as records.
K0.3 25 Jun rows (B-217/SLICE_B213): block 5747, 10:05 B216H1 kill; code6 write bar(s) in renewal branch; FRESHCOUNT 10:35/10:40 S4 ob0/fvg1/opp0 adv1 HOLD; prediction with revival blocked: ob dead + fvg dead = adv2 at 10:35 S4 (untested - no build).
K0.4 STOP-for-planner: write-time ren (structureConfirmedThisBar) and exported ren cannot be told apart by name - the second name does not exist. Verdict MEASURED, no K/T.
```
## Part K1 rule check (no conflict found; never reached an edit)
```
spec 3.4 pre-confirmation only; dead-until-renewed; 25 Jun must-never. H4a S4-pre only; H4b guard-read only. No conflict with banked words.
```
## Part K/T skipped
```
No backups (nothing touched), no compile, no runs, no cuts, no grades. Disk untouched (SHAs re-verified after records).
```
## Part X records
```
Ledger 1390. Fixplan F2 State B-243. Pointer State B-243 + Lane 3/6 + Next planner-decides. REVIEW_BATCH_B243 no new items. Truth unchanged. No LESSONS line.
```
## Timing + final disk + housekeeping
```
Wall: gate + reads + banking ~25m; K0 code map ~45m (renewal-export hunt incl. git history); records ~15m; commit/push follow.
Final disk untouched: kept EA + Flow + 5 includes + POI, tini b64523fc, 17 charts, no terminal64.
Housekeeping: none (no new artifacts this relay except result/slice/batch; nothing deleted).
```
## Size gate (caps pointer 6000/35, result 12000, slice 20000/600)
```
pointer 4348/35 PASS; result 2585/22 PASS; slice 3642/62 PASS (this file); TRUTH 3143 PASS; FIXPLAN 19429 PASS; BATCH243 154 PASS; LESSONS 19984 PASS; READ_MAP rewritten. Register (source) untouched. EA/indicator/include/POI committed files untouched.
```
(End of slice)
