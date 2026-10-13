# BUILDER SLICE B-205 - raw rows (under 600 lines)

Base: builder/B-205 cut at 457befc (= builder/B-204 head). Trial: POI marker FOMC multi-anchor (K1 input list, K2 per-bar anchor, K3 B205FOMC print). 3 runs PASSED one session; EU long NOT RUN. Verdict RESTORED (T2 STOP: A5 exit moved).

## Start gate
```
log-1 457befc4f08612e02043ef3f1e135d93482eb5c4 (backup exact). Branch builder/B-205 cut here. Push via backup, never origin.
diff 457befc EMPTY on pointer/RESULT_B204/SLICE_B204/DEFECTS/REVIEW/register/both skills/CONTEXT/HANDOFF/ledger.
Disk SAME: EA 7c392767C88FF754, ex5 B2EF6E4C, FlowIND a8201128289252927/c82f175E20D5BF1DF, SESS 16573A5B6B7F70DEB, terminal.ini c725e437 chart-touch ACCOUNTED (blessed a5834591 restored pre-launch verified; .preB205 content restored post-runs verified c725e437).
Journal row 338 bytes 166074 ACCOUNTED. Ledger ^1350.=1 ^1351.=0 pre. No terminal64 at launches (PID 20200 stopped by PID). D: 97.5 GB free before, 92.3 after. Python 3.13.16 embed.
```

## Part B (ALREADY_BANKED 457befc, nothing appended)
```
FOMC-MULTI-ANCHOR skill line 348 count 1; 0618-EU-FOMC-EXIT line 346 count 1.
```

## Part K (K0 .preB205: POI src 79859edc039ee465 / POI ex5 f0890c0bdee766 / EA ex5 B2EF6E4C; flow ex5 does NOT include POI marker - EA refs by iCustom name only)
```
K1 before: input string InpFomcTimesServer   = "2026.07.29 21:00";
K1 after:  input string InpFomcTimesServer   = "2026.01.28 21:00;2026.03.18 21:00;2026.04.29 21:00;2026.06.17 21:00;2026.07.29 21:00;2026.09.16 21:00";
K2 spots: input :85; FomcActiveNow :543-555 (TimeCurrent-based, kept); absAnchor init :1983-1984; rollover :3021-3061 (kept + 3-line print arming); FoldOneTick event gate :1024-1031 (per-tick takeover added); bar-walk relies on FoldOneTick for FOMC rollover (:2607 loop excludes FOMC, comment :2619-2621).
K2b seed gate: SLOT_FOMC adopted only if seedFomc==absAnchor + precedes seam + has state (:2247-2294); else live fold (trial RECON62: FOMC_ANCHOR_AFTER_SEAM, day-log JL 121).
K4: braces 157/157 pre -> 159/159 (+4/+4, 0 removed); marker `// [B205FOMC]` exactly 1; print tag 1; compile 0 errors 0 warnings 2028ms binary fresh; src 5AF5E035/ex5 E5CBE1A2 post-compile = pre-launch; .B205K verified equal; EA ex5 B2EF6E4C untouched (checked after every run).
Rule check: his order 348 commands exactly this; no banked word contradicts it.
```

## Part T (wrapper killed after each window verify; light watcher + short DONE polls; terminal stopped by PID between runs)
```
RECON62-B205: WMI 22576 05:54:05 / terminal 21868 / window USD...EURUSD 2026.08.26-2026.09.10 (journal JL 19) / first replay 05:54:32 / DONE PASSED 05:57:33. STATUS PRE=0. ex5 unchanged.
JUNE0525-B205: window set USDJPY 1779667200/1781308800 readback True; WMI 23024 05:58:33 / terminal 18836 / window USDJPY 2026.05.25-2026.06.13 (JL 1051287) / DONE PASSED 06:02:45. STATUS PRE=1051271. ex5 unchanged.
GBP0629-B205: window set GBPUSD 1782691200/1784332800 readback True; WMI 3008 06:03:11 / terminal 18376 / window GBPUSD 2026.06.29-2026.07.18 (JL 2033095) / DONE PASSED 06:08:09. STATUS PRE=2033079. ex5 unchanged.
```

## T1 filed trades (cut-1 one pass, segments [1,1051271]/[1051272,2033079]/[2033080,end])
```
RECON62 16 vs 14: A1 10:05/11:35 same; A2 17:35/17:50 same; A3 16:00/23:55 same; A4 09:20/10:53 same; A6 10:10/10:42 same; A7 17:00/17:26 same; A5 entry 16:45 1.16264 same, exit 17:13:45 1.16319 vs 17:13 1.16315 CHANGED (TP_ELECT trial JL 1009683 tp=1.16318 R=2.57 winner=Yearly-VWAP vs B-202 tp=1.16315 R=2.45); NEW 9-2 SHORT 14:45 1.15747 out 15:20 1.15822 (TP_ELECT trial JL 965289 tp=1.15662 R=1.13 vs B-202 tp=1.15718 R=0.38 refused; trial FOMC-VWAP 1.15791 behind entry vs B-202 1.15718 ahead).
JUNE 8/8 SAME: 27May 15:35/20:08; C-06-03 3Jun 09:10/09:59; B2 5Jun 16:15/19:16; B3 11Jun 14:40/15:23. B1 silent. MTEXIT same x4.
GBP 4 vs 2: F2 14:45/17:03 same; NEW 1-Jul LONG 09:50 1.32412 out 10:15 1.32319 SL (FIRE anc=FOMC-POC JL 2838471; el=FOMC-POC 1.32358 JL 2838483; FOMC-POC 1.32358 JL 2838545; TP 1.32513 R=1.23 JL 2838468). No 2-Jul fire; F1/F3/F4 absent.
```

## T2 STOP + P1-P4
```
T2: A5 exit changed (1.16315 to 1.16319) = STOP. C must-nevers silent all runs (9-2 EU + 1-Jul GU are not register rows). Tags present (RECON x3, GBP x2 B205FOMC; JUNE none-by-design, POIFOMC init absAnchor=29Apr entries=6 proves build). ex5 unchanged. .B205K pre-saved+verified; restored .preB205 verified (POI src 79859edc, ex5 f0890c0b, EA B2EF6E4C); terminal.ini .preB205 content verified c725e437; no terminal64 left. EU0525TD NOT RUN.
P1: RECON B205FOMC 29Apr 1.16388 / 17Jun 1.15950 / 29Jul 1.13951 + POIFOMC init 29Jul entries=6 (active 29 July unchanged); JUNE POIFOMC init 29Apr entries=6, zero B205FOMC correct (next decision past window); GBP B205FOMC 29Apr 1.34511 / 17Jun 1.34013 + POIFOMC init 17Jun entries=6. All 21:00 server. (Bulk-walk prints share the walk-start stamp; anchor= values govern.)
P2 FAILED: FROM 96 vs 80, TO 96 vs 80, DEC 75 vs 76; only-one-side 49/33, 43/27, 27/28 (spread over 8-26/8-27 ABORT rows etc., not one row).
P3: NOT RUN. P4 moot on STOP.
Confound: [POI][DEPTH] trial 2026.05.25 vs B-202-era 2026.06.01 same 26-Aug window; FLOW session distances identical (PDH:70 LOH:97 NYH:21 YLOH:97 YNYH:9 both); POI tick lines moved (Yearly-VWAP 1.16315 to 1.16318, FOMC-VWAP 1.15718 to 1.15791 on 9-2). B-202 booked winner=Yearly-VWAP 1.16315 (old-log TPCENSUS JL 1008218/4914752). Tick base served deeper history on 10-14 than 10-13.
Verdict RESTORED (first failed check: T2 A5 exit changed).
```

## Records
```
X1 CONTEXT-4 B205-LINEMAP-IDENTITY-FIRST 0->1; Brain B-205 0->1 (2026-10-14). X2 HANDOFF-3 B-205 0->1 RESTORED. X3 ledger 1351 0->1. X4 pointer 32 lines.
F5 stage: result, slice, ledger, pointer, CONTEXT, HANDOFF. Never sources/ex5/journals/logs/inis/profiles/scripts/backups/CUTs/launchers/STATUS/DONE/diffs/job outs.
Final disk RESTORED (POI src 79859edc/ex5 f0890c0b = .preB205; .B205K src 5AF5E035/ex5 E5CBE1A2; EA 7c392767/B2EF6E4C).
```
(End of slice)
