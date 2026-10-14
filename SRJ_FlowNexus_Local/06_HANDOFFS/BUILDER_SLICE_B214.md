# BUILDER SLICE B-214 - raw rows (K0 census read-only, STOP, no edit; under 600 lines)
Base: builder/B-214 cut at 2d6e326 (= B-213 head). Verdict MEASURED (F1 3/6; K0 STOP: H3 after close + ren unexported; no trial).
## Start gate
```
log-1 2d6e326 (backup exact; B-214 cut here; push via backup, never origin; branch from disk builder/B-214).
diff 2d6e326 EMPTY on 0.3 files + both skills + CONTEXT + HANDOFF (LF-normalized).
Disk: EA 7c392767/83ac8bde; Panels 4335f703; flow a8201128/c82f175e; POI 5AF5E035/E5CBE1A2; SESS 16573a5b; OB 8bbf936b; FVG 568f4ce9; tini c725e437 blessedB208. No .preB214 (no edit, correct).
Journal: N/A (no launch). Ledger ^1360=1 ^1361=0 pre. No terminal64. Python 3.13.16 embed first. Tick history unchanged same-day (no sync since B-213 15:56-16:30 runs; grade vs DEALS B206T per 0.5; B-205 kept-rerun not needed). B-38 dates N/A (no launch).
```
## Part B (grep-first)
```
rules/46 DEAD-UNTIL-RENEWED count 1 -> ALREADY_BANKED d81d71d. rules/43 0625-EU-INVALID count 1 -> ALREADY_BANKED B-204 (0610/0625/0722 together). No new rule words.
```
## Part K0 raw
```
K0.1 10Jun CUT_B213 EU (EA 83ac8bde) seed 15:50 to fire:
2010581 CONFIRMPOLL 15:45 confirm0 | 2010586 STATE S2->S3 | 2010657 FRESHSKIP 15:50 PRE_BINDING | 2010857 CONFIRMPOLL 15:50 confirm0 | 2010859 FRESHCOUNT #808 15:50 S3 adv1 HOLD pre | 2010860 B200POT 15:50 ALIVE fresh= touch=A_OPP | 2010926 FRESHSKIP 15:55 PRE_BINDING | 2011129 CONFIRMPOLL 15:55 confirm0 | 2011131 FRESHCOUNT #809 15:55 S3 adv2 ABORT pre | 2011132 B200POT 15:55 ALIVE fresh=FRESH_OPP_FVG | 2011198 FRESHSKIP 16:00 PRE_BINDING | 2011397 CONFIRMPOLL 16:00 confirm0 | 2011399 FRESHCOUNT #810 16:00 S3 adv2 ABORT pre | 2011400 B200POT 16:00 ALIVE | 2011465 FRESHSKIP 16:05 PRE_BINDING | 2011664 CONFIRMPOLL 16:05 confirm0 | 2011666 FRESHCOUNT #811 16:05 S3 adv2 ABORT pre | 2011667 B200POT 16:05 ALIVE | 2011735 FRESHSKIP 16:10 PRE_BINDING | 2011929 CQDRECHECK 16:05 latch1 | 2011933 CONFIRMPOLL 16:10 confirm1 touchAttr1 | 2011935 FRESHCOUNT #812 16:10 S3 adv2 ABORT pre | 2011936 B200POT 16:10 ALIVE touch=PASS | 2011954 STATE S3->S5 16:15:00 (skips S4) | 2012330 B182DEC 16:15 FIRE | 2012331 A6FIRED 16:10 | 2012333 ALERT 16:15 LONG 1.15551 | 2012334 UJ1R PASS | 2012342 #813 16:10 S5 adv2 HOLD post | 2012344 #814 16:10 S5 adv2 HOLD post | 2012356 STATE S5->SIGNAL | 2012411 CONFIRMPOLL 16:15 confirm0.
Adverse=2 printed but no refusal follows: S5 pass #813/#814 HOLD post diagnostic (CheckFreshness L8388 twoOfThreeKills=false at S5 per L8383-8387) + B182DEC FIRE (F1 diagnostic-only; B-212 R2 ABORT-pre).
Code quoted by text, real lines: CheckFreshness L2770-2777 (FRESHCOUNT print verdict ABORT/HOLD scope pre/post; L2778 return ABORT only if n>=2 && twoOfThreeKills) + L7606 probe oFresh (no kill) + L8388 poll fail (S4 kills / S5 diagnostic per L8383-8387 comment quoted).
K0.2 roads: #809 (15:55) -> S3 (SKIP/POT ALIVE) -> #810 (16:00) -> S3 -> #811 (16:05) -> S3 -> #812 (16:10 confirm1) -> S3->S5 16:15 -> B182DEC FIRE. No S4 (FRESHSKIP PRE_BINDING throughout, B200POT ALIVE). Shared step (B-177): S3->S5 transition 16:15:00 + B182DEC FIRE (H3's place). Confirming close accepted 16:10 confirm1 touchAttr1; shared step 16:15 after -> H3 after close.
K0.3 buffer 3/4/5 readers: defines L173-175; gating CheckFreshness L2773/2775/2777 (pre/post); beyond-freshness diagnostic only, none gate FIRE: SLIMB L6350 obValid (SlimbEmit PRE diagnostic L6352-6355), LTFDIAG L8252-8258 (comment L8246-8247 assigns/branches nothing), stop-probe b157 L11419 fvg (branch probe TWO/ONE), SIDE1Q L11606/11608 (comment L11595-11597 print-only record-only).
K0.4 tickOB writers + ren + S9a rule: code1 replay kill L172-179 false; code2 replay opp L183-189 true; code3 live kill L553-561 false; code4 live opp skip L565-571 true; code5 bull renewal L209-217 true id0; code6 bear renewal L334-340 true id0; code7 decision renewal L226-233 true id0; code8 decision flip L287-293 true id0; code9 init L348-350. ren = structureConfirmedThisBar, true writers BiasEngine L129/L217/L270 + ImbalanceMgr L196/L321, false resets BiasEngine L18 + State L368; printed ren (B212COLOR/B213OB), never exported to EA buffers 3/4/5 nor 34 (tickOB prov) /35/36 (-99 deferred) -> no EA-readable ren. S9a rule quoted (B-212 R3): count = (!tickOB) + (fvgExists && !tickFVG) + hasOpp; fvgEx = doubleOB ? ForDisplay : Now (Panels L194-210/261/275).
K0 STOP FIRES: H3 after close (spec 3.4) AND ren unexported. No edit.
Rule check quoted (standing, no trial): spec 3.4 pre-confirmation only (must not run after confirming close); rules/43 L15-L17 must-nevers; rules/46 L6-L7 panel-leg + dead-until-renewed.
```
## Part K / T (NOT RUN per K0 STOP)
```
K1 backups: .preB214 ABSENT (correct, no edit before any compile; B-212-EX5-BESIDE-SOURCE N/A). H1/H2/H3: NOT APPLIED (K0 STOP). Markers: [B214H1]/[B214H2]/[B214H3] ABSENT (correct, once-each N/A). Braces: N/A (no edit). Compiles: indicator NOT COMPILED, EA NOT COMPILED (0 errors N/A, no new warnings N/A). ex5 SHAs: post-compile N/A; pre/post runs N/A (no moves; kept 83ac8bde/c82f175e untouched).
T1 RECON62-B214: NOT RUN (no trial). T2 EU0525TD-B214: NOT RUN. Filed-trade tables ABSENT (no trial runs; B-213 16/16 + 44/44 identity stands). STOP rules N/A (no trial; K0 planner STOP, verdict MEASURED).
One Python cut: NOT RUN (no runs; K0 census read CUT_B213 + sources only, one script per job k01.py/k02.py + greps; grade N/A).
On KEPT: N/A (we are MEASURED). .B214K ABSENT (correct, no trial). Packs/INDEX/DEALS/SETUPS ABSENT (KEPT only).
```
## X records
```
LESSONS +1 B-214-COUNT (fold for cap; <20k). CONTEXT 5+1 Brain B-214 + strip leading space B-213 line. HANDOFF 3a F1 3/6 MEASURED K0 STOP + 3b B-214 (keep 10). FIXPLAN F1 state (S3 PRE_BINDING skip -> S3->S5 -> FIRE) + F2 state (H1/H2 await pre-confirmation road or ruling). Register C NOTE none (KEPT only). Ledger 1361. Pointer lane F1 3/6 K0 STOP (35-line cap). READ_MAP rewritten. Kit disagree reported only.
```
## Size gate (READ_MAP files)
```
pointer/6000+35 PASS; result/12000 PASS; CONTEXT PASS; LESSONS PASS (<20k folded); HANDOFF PASS; SKILL PASS; TEMPLATE PASS; strategy max PASS; relay PASS; READ max PASS; FIXPLAN PASS; READ_MAP rewritten PASS. COLOUR/OBLIFE/SEPARATOR prior-gen grep-only (not planner-read this relay). All under cap or STOP (none; K0 STOP is planner STOP, verdict MEASURED).
```
## Timing + final disk + housekeeping
```
Wall: gate+reads 25m (0.1-0.5 + K0 CUT greps + code locates); K0 census 15m (k01/k02 + buffer/writer/ren greps + line reads); records+X 15m; push/filing follow. No runs/compiles (K0 STOP). Total ~55m.
Final disk: no edit (EA 7c392767/83ac8bde; Panels 4335f703; flow a8201128/c82f175e; OB 8bbf936b; FVG 568f4ce9; POI 5AF5E035/E5CBE1A2; SESS 16573a5b; tini c725e437 blessed). No .preB214/.B214K/CUT_B214/packs (correct, no trial). No terminal64. Python 3.13.16. No trading change stands.
Kit report only: BOOTSTRAP/MEMORY/TEMPLATE PK-2 vs SKILL/READ_MAP/pointer PK-3 (no edit).
```
(End of slice)
