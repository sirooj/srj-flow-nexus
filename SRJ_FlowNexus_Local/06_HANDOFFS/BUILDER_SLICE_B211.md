# BUILDER SLICE B-211 - raw rows (print-only diagnostic, always restored; under 600 lines)
Base: builder/B-211 cut at 1fd8490 (= B-210 head). Verdict MEASURED (lane parks 6/6).
## Start gate
```
log-1 1fd8490 (backup exact; B-211 cut here; no remote B-210->B-211 before push; push via backup).
diff 1fd8490 EMPTY on 0.3 files + CONTEXT/HANDOFF/ledger/skills (LF-normalized; skills index+rules untouched).
Disk: EA 7c392767/B2EF6E4C (src verified pre-edit; ex5 NOT verified pre-compile - owned gap, no consequence: no compiles since B-210); POI 5AF5E035/E5CBE1A2; flow a8201128/c82f175e; SESS 16573a5b; OB 8bbf936b; FVG 568f4ce9; tini c725e437 (config had housekeeping drift 98a5b93f - recompiled-times/chart dividers only - restored blessed pre-launch, ACCOUNTED).
Journal 166767 (339-340 ACCOUNTED). Ledger ^1357=1 ^1358=0 pre. CUTs B-208 at sizes. No terminal64. Python embed. Tick history unchanged since B-208 (no runs since; T1 deals decide).
```
## Part B (grep-first; counts on 1fd8490)
```
B-204 0610/0625/0722 once each (rules/43 L15-17). AB1 compact-records once (relay rules/01b L24). B-211 phrases 0 (strategy rules + journal) -> rules/46 (2565 bytes) + SKILL index line + journal 341 (+430 bytes -> 167197, unstaged) + ledger 1358 + register A1/C NOTEs. READ/REGISTER regen (register 22979 sha 91608edd; spec header f2f4cdde fresh, no regen).
ARCHIVE full lines: B149-PANEL-STATE-PRINT (print-only indicator line first, deals identical, never new buffer/EA edit); B122-LIVE-HANDLE-FIRST (read live iCustom + rows; default dead); B139-HIS-FILL-FIRST (fill vs his basis first); B162-TAG-WHERE-THE-DATA-LIVES (print where inputs live).
```
## Part R raw
```
R1 panel found: Include/SRJ/SRJ_Panels.mqh (17047 bytes; included by FlowLogic L27 + calls L903/928/1139/1982/1991; EA does NOT include). Glyphs Text L17-36 (CHECK [v], CROSS [x], 2xOB, OPP FVG); status line Text L42-71 (tickOB?CHECK:CROSS, fvgExists?tickFVG familiar; !fvgExists+!tickOB -> "OBx" only - matches his 5m box); color Panels L12-17 (invalid = !tickOB + (fvgExists&&!tickFVG) + hasOpp - the panel's own count); existence OrderblockMgr L1053-1070 (valid+activated+in-bias, boundary param unused); leg = renewal boundaries (ImbalanceMgr: bullish/bearish fvgRenewal sets structLegBoundary/obInvalidationBoundary/fvgDetectionBoundary + tick flags true/opp false; BiasEngine flips); renewal flag structureConfirmedThisBar. EA reads live: g_hFlow=iCustom EA L12387-12393 (+InpFlowLogicName) via ReadFlow EA L2087-2090 into CheckFreshness EA L2773-2777 (obValid/t88_fvg/oppFvg, buffers 3/4/5). R1 FOUND (B-84 satisfied; B-122 satisfied: live handle + rows, no default read).
R2 hunk: FlowLogic export block L1150-1158 anchor (9-space indent verified by bytes); inserted [B211PANEL] block (~130 lines, session HH gate, setterId OB lookup, TickValid-mirror latest-FVG + fallback + range loops, latest-opposing loop, ren, n, one PrintFormat ~170 chars). No state writes (locals + read-only queries incl. inBiasOBExists which documents read-only).
R3 hunks: EA entry anchor L12056 (g_mtrade.ticket, count 1) + [B211FILL-ENTRY] (bid/ask/spr + req/fill/ref=open + tick time, ~130 chars); EA exit anchor L13053 if-return (count 1) + [B211FILL-EXIT] (ResultPrice fill + refPx ref + tick, ~130 chars). No braces added in EA. Run ini Model=4 both runs, no spread key (tester real-tick spread).
R4 packs (RECON62-B206T 08-28): MTEXIT JL1336 bar 11:30 POI_BODY_BREAK Daily-POC 1.16451 entry 1.16466 exit 1.16464 OWNBODY; EXITCENSUS JL1324 BREAK (11:30 c1.16463 through 1.16451); B196BAR JL1323 bar 11:30 o1.16440 h1.16471 l1.16440 c1.16463 + JL1370 bar 11:35 o1.16464 h1.16466 l1.16444 c1.16455; deal 3 buy 11:35 1.16467 (B137 + B206T both 1.16467 vs owed 1.16464 - mismatch recorded). B211FILL exit JL1817025: fill 1.16467 ref 1.16464 bid 1.16464 ask 1.16467 spr 3 t 11:35:00. Cause = spread (buy-at-ask, same candle, no lag; Model=4 real ticks). Lag/other ruled out by t + spr rows (B139: basis first - his 1.16464).
R5 FILLS_B211.csv 60 rows (16+44; entries dev 0; EA closes vs MTEXIT ref; broker TP/SL vs booked tp/sl from TP_ELECT latchBar (A4 tp 1.16200/1.16201, A5 1.16318/1.16319, A6 1.16102/1.16102, 2Sep sl 1.15822/1.15822, A7 sl 1.16274/1.16275); must-never entries dev 0 (10Jun spr 5, 25Jun spr 1, 22Jul spr 3)).
```
## Part T raw
```
Backups: EA.mq5.preB211 7c392767 + FlowLogic.mq5.preB211 a8201128 (match pre-edit) + tini.preB211 98a5b93f (pre-restore drift evidence). Spots pasted above (anchor counts 1 each). Markers: B211PANEL block once (comment+print one set), B211FILL-ENTRY once, B211FILL-EXIT once. Braces: flow 129/129 -> 152/152 (+23/+23 balanced); EA 1283/1283 -> 1283/1283 (+0).
Compiles (Dukascopy harness): EA 0 errors 0 warnings (binary ad50e17e fresh); indicator 0 errors + 3 pre-existing long-to-int (1710/1932/2006 = B-208 1576/1798/1872 +134 hunk shift, none in hunks, B-208 K2 class, disclosed - relay asked 0 warnings; strictly unmet for indicator, no new warnings, MEASURED print-only precedent applied).
ex5: post-compile = pre-launch (EA ad50e17e, flow 070325d6); post-T1 unchanged; post-T2 unchanged (binary proof holds, no move during runs).
T1: wrong-window launch (blessed tester dates stale 06.29-07.18) killed by PID (TERMINAL_EXITED_EARLY, segment excluded); B-38 set RECON 1787702400/1788998400, verified [Tester] L419-420; relaunched 13:24:38 PID 1508; window verified (testing 08.26-09.10); DONE PASSED 13:30:26 (3:39, 563338 ticks/3168 bars = B-208 fingerprint). Filed table 16/16 identical (tester deal rows #2-17 vs DEALS; entries B211FILL req==deal; EA closes MTCLOSE+B211FILL; broker TP/SL at booked levels). No STOP -> T2.
T2: EU dates 1779667200/1791936000 set+verified; launched 13:32:29 PID 19564; window verified (replaying 05.27+); DONE PASSED 14:05:39 per wrapper + day-log marker "Test passed in 0:26:02" (6171443 ticks/29373 bars, runEnd 10.13, log written). Wrapper DONE file absent (missed) - marker + operator confirmation used, disclosed. Leftover stopped by PID.
One batch cut (2 segment reads, no byte re-read: T1 JL 851906..1946301 (1,094,396 rows, PRE=851905) + T2 JL 1946302..5399671 (3,453,370 rows, PRE=1946301, seek N1=563618242 line-aligned); combined JL-continuous, no overlap/gap). CUT files (UTF-8, JL-prefixed): RECON 168906916, EU 625704293 - stay unstaged.
STOP evaluation: no deal differs (16/16 + 44/44 side/date/time/price - MISMATCHES NONE); compile per above (0 errors, no new warnings); ex5 static. No STOP.
Save/restore: .B211D keep (EA src af297a74 + flow src 9ab1ca3a + EA ex5 ad50e17e + flow ex5 070325d6, all verify); restored sources byte-identical (7c392767/a8201128) + flow ex5 c82f175e from .preB208 (byte-identical); EA ex5: NO backup existed anywhere (hunted Experts/Indicators/work-archive/Tester - only diagnostic + B1184JUN); recompiled kept source 3x -> 9d6df777/198fb5dd/83ac8bde (timestamp-nondeterministic, proven) - B2EF6E4C unrecoverable. Final EA ex5 = 83ac8bde (latest Dukascopy rebuild from verified kept source; behavior = kept). Owned defects: (1) no EA ex5 backup before first compile (trial discipline); (2) ex5 SHAs not verified pre-edit (gate incompleteness; identity sound - no compiles since B-210). Fix recommendation for B-212 banking (NOT edited here - F5/gate forbid skill edits this turn): back up .ex5 beside every .preB source backup.
```
## Part S (SEPARATOR_B211.csv 15 rows: 10 takes + 5 C)
```
S8 (highest B211PANEL n, session-start..conf superset): A1 2, A2 2, A3 2, A4 1, A5 2, A6 2, A7 2, 10Jun 2, 25Jun 2, 22Jul 2. Conf-pass cross-check: A1 2/0 double-print (dead-then-renewed same bar; EA consumed dead per FRESHCOUNT - buffer-timing noted, no trial rests on it), A2-A6 1, A7 2, must-nevers 2. Verdict DOES NOT SEPARATE under both scopings (breaking: superset A1,A2,A3,A5,A6,A7; conf A1,A7; must-never side all refuse). C rows OTHER-GATE. Others INFO in file.
Checks: A1 prints OB DEAD 09:25 1.16446-1.16479 ✓ opposite no ✓, FVG machine-DEAD (08:00 fallback 1.16440-1.16444) vs his box no-FVG-line (fvgExists=false display gate) - panel-color count would be 1 (keep); 22Jul never prints 13:45 DEAD (flag-true branch shows latest valid 13:20/14:15 instead) - his dead-until-renewed not machine-printed. Both gaps filed as park evidence. R5 open (spec 3.4 box unanswered) anyway. No trial. Lane parks 6/6.
```
## X records
```
LESSONS +1 B-211-PANEL-IS-THE-FLAG (149/160; folded B-101 L87 + B-144 L172 to HISTORY for cap). LESSONS 19792 <20k.
HANDOFF 3a J2D B-204-B-211 PARKED + 3b B-211 (142/200; dropped B-201, keep 10 B-202..B-211). HANDOFF 5923 <20k.
CONTEXT Brain B-211. CONTEXT 5631 <20k. Ledger 1358. Pointer lane 6/6 + S8/R1/exit-fill + FILL-EXACT measured + goal-map kept (35 lines).
```
## Size gate (READ_MAP files; slice SEE BELOW)
```
pointer/6000+35 PASS; result/12000 PASS; CONTEXT PASS; LESSONS PASS; HANDOFF PASS; SKILL PASS; TEMPLATE PASS; strategy SKILL/rules max PASS; relay SKILL/rules PASS; READ max PASS; FIXPLAN PASS; PANEL 3934 PASS; SEPARATOR 1171 PASS; FILLS 7180 PASS; BOOTSTRAP PASS; READ_MAP 1567/6000 PASS. All under cap or STOP (none).
```
## Timing + final disk + housekeeping
```
Wall: gate+banking+R1/panel-locate 25m; hunk+verify 15m; compiles 5m (EA 0/0, flow 0+3 accounted); T1 wrong+killed 3m + T1 good 3:39 + gate 4m; T2 26:02; cut T1 3m + T2 6m; grade 4m; S8/X/records 15m; push/filing follow. Total ~85m.
Final disk: sources 7c392767/a8201128 byte-identical; flow ex5 c82f175e byte-identical; EA ex5 83ac8bde rebuilt-kept (see above); POI/Sessions untouched; .B211D/.preB211/.preB208 unstaged; tini blessed c725e437; no terminal64; journal 167197 (341 ACCOUNTED); CUT_B211 stay; Tester day log (1.77GB) deleted post-cut (evidence filed); MQL5 live log stays (4.94GB, not relay evidence - deletion forbidden without his word); wrong-window pre-segment excluded from CUTs (lines 1..851905). No trading change stands.
Kit report only: BOOTSTRAP/MEMORY/TEMPLATE PK-2 vs SKILL/READ_MAP/pointer PK-3 (no edit).
Operator workflow note (his resume words, not banked as skill - F5/gate forbid skill edits this turn): run-completion proceeds without awaiting his signal (DONE/marker = proceed; AGENTS.md 2026-10-05 defect class). Recommended B-212 banking: ex5 backups + no-await-signal discipline.
```
(End of slice)
