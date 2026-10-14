# BUILDER SLICE B-206 - raw rows (EURUSD scope; under 600 lines)

Base: builder/B-206 cut at 95adb31 (= builder/B-205 head). No source edit, no compile; one POI swap kept -> trial
between baseline and trial. Euro runs PASSED one session (3/7 of the batch run that day); EU long RUN. Verdict KEPT
(EURUSD scope). Pound/yen measured but held unpublished per his EURUSD-first order. Zero new runs for this filing.

## Start gate
```
log-1 95adb31 (backup exact; builder/B-206 cut here; push via backup, never origin).
diff 95adb31 EMPTY on pointer/RESULT_B205/SLICE_B205/register/both skills/CONTEXT/HANDOFF/ledger.
Disk SAME: EA 7c392767/B2EF6E4C, FlowIND a8201128/c82f175e, SESS 16573a5b, POI 79859edc/f0890c0b,
 .B205K 5AF5E035/E5CBE1A2, terminal.ini c725e437 chart-touch ACCOUNTED (blessed a5834591 pre-launch verified;
 .preB205 content post-runs verified). Journal row 338 bytes 166074 ACCOUNTED. Ledger ^1351.=1 ^1352.=0 pre.
 No terminal64. D: 92.3 free before. Python 3.13.16 embed (py absent).
Ledger-repair defect (owned): ran job_ledger_b205.py twice (2 duplicate 1351s); checkout-restored, EMPTY + 1/0
 re-verified read-only. Watcher defect (owned): stock watcher Int32-wedged past 2 GB log; fixed copy used.
```

## Part B (ALREADY_BANKED 457befc)
```
0618-EU-FOMC-EXIT count 1; FOMC-MULTI-ANCHOR count 1. Nothing appended.
```

## Part T euro (wrapper killed after each window verify; fixed watcher; leftovers stopped by PID; ex5 SHAs every
launch and after every run, unchanged: K f0890c0b, T E5CBE1A2, EA B2EF6E4C)
```
RECON62-B206K: WMI 2488 06:29:19 / terminal 13140 / EURUSD 2026.08.26-2026.09.10 / replay 06:29:52 /
 DONE PASSED 06:33:34. PRE=2983548. Bytes [886625150,1197122720).
T2 SWAP: .preB206 src 79859edc/ex5 f0890c0b verified; .B205K into place verified 5AF5E035/E5CBE1A2; EA+flow
 untouched; NO recompile.
RECON62-B206T: WMI 14940 06:48:10 / terminal 21056 / window readback exact / DONE PASSED 06:52:44. PRE=5965784.
 Bytes [1772565248,2083063624).
EU0525TD-B206T: WMI 10396 07:19:51 / terminal 6624 / EURUSD 2026.05.25-2026.10.13 / replay 07:20:22 /
 DONE PASSED 07:45:59 (~26 min). PRE=8949329. Bytes [2659189374,3819499142).
terminal.ini restored c725e437 verified; no terminal64 left.
```

## T1 (K vs B-202 DEALS; volumes never graded)
```
RECON62-B206K 16 vs 14: A1 10:05/11:35 same; A2 17:35/17:50 same; A3 16:00/23:55 same; A4 09:20/10:53 same;
 A6 10:10/10:42 same; A7 17:00/17:26 same; A5 entry 16:45 1.16264 same, exit 17:13:45 1.16319 vs 17:13 1.16315
 DIFFERENT (TP_ELECT 16:40 tp=1.16318 R=2.57 winner=Yearly-VWAP vs B-202 tp=1.16315 R=2.45; tick depth);
 NEW 9-2 SHORT 14:45 1.15747 out 15:20 1.15822 (TP_ELECT tp=1.15662 R=1.13 vs B-202 tp=1.15718 R=0.38 refused).
```

## T3 (T vs same-day K)
```
RECON62-B206T 16/16 deals identical side/date/time/price; B201FROM/TO 96/96 multiset identical. No change.
```

## T4 euro (no STOP)
```
No A-row take differs. No must-never fires on the short window. No NOT-TRACED change. Tags present (3 B205FOMC +
 init absAnchor=29Jul). ex5 unchanged.
```

## P1 euro anchors (21:00 server)
```
RECON-T: B205FOMC 29Apr 1.16388 / 17Jun 1.15950 / 29Jul 1.13951 + [POI][FOMC] init absAnchor=29Jul entries=6.
EU-T: init 29Apr entries=6 + B205FOMC 17Jun 1.15950 / 29Jul 1.13951 / 16Sep 1.15383.
```

## P2/P4 euro
```
P2 PROVEN: 0/0 multiset diffs. P4 PROVEN: FROM/TO keys paired 96/96 + 809/809; ev END/ORDER; zero non-POT PENDING.
```

## P3 18 June (NOT FIRED, next item)
```
FOMC-POC 1.15218 (WINLINE ADD 09:50 / KILL 09:55); FOMC-VWAP held 1.15233 (B196BAR hPx 09:45-09:55);
 09:55 o/h/l/c 1.15220/1.15222/1.15188/1.15195; UJDTTERMS 09:50 FOMC-POC=LHIT, 09:55 FOMC-POC=Lbody-below.
 Deciding rows: 09:40 WINLINE KILL FOMC-VWAP + no 09:45 FIRE/B182DEC + 10:00 B182DEC LONG ABORT LTF_MISALIGN.
```

## T5 EU long (44 vs DEALS_EU0525TD-B202 46)
```
Shared 44 SAME (26May 15:50/16:51; 28May 11:50/12:12; 4Jun 10:05/10:21; 10Jun 16:15/18:00; 25Jun 10:45/11:00;
 29Jun 16:15/17:19; 8Jul 14:50/16:32; 15Jul 10:35/12:32; 22Jul 14:55/14:59; 28Jul 10:45/11:25; 5Aug 11:20/11:41;
 17Aug 15:55/17:15; 28Aug A1; 1Sep A2 (exit 17:51 1.15975 both); 2Sep short; 4Sep 09:30/10:51; 7Sep A4;
 7Sep A5 (exit 21:25 1.16239 both); 8Sep A6/A7; 22Sep 19:00/19:13; 8Oct 11:35/12:13).
 Absent: 18-Jun pair (buy 09:45 1.15256 / sell 10:25 1.15101), FOMC-TRACED (P3 rows).
```

## R0 euro
```
Walk 2026.05.25 (B-202 06-01, B-205 05-25). Yearly calendar 01-01, fold 06-26 off checkpoint.
UJDTTERMS 26Aug/1Sep/7Sep identical B-202 vs K (tags; values NOT PRINTED).
```

## Records + final disk
```
X1 CONTEXT-4 lesson +1; Brain B-206 +1. X2 HANDOFF-3 B-206 +1 (euro KEPT). X3 ledger 1352 (euro scope) 0->1.
X4 pointer 35-cap (FOMC-MULTI 2 of 6 KEPT euro; T1 identity; R0; D3 next then D1/D2/D5/D4 at A2 17:30; HELD/F2/O3/
 UNRECONCILED/B-202 queue/offset; P3 next; EURUSD-first active).
F5 stage euro paths only (result, slice, RECON packs + day folder, INDEX, 2 DEALS, 4 reports, ledger, pointer,
 CONTEXT, HANDOFF). Never sources/ex5/journals/logs/inis/profiles/scripts/backups/CUTs; GBP/JPY packs on disk held.
Final disk KEPT: POI 5AF5E035/E5CBE1A2 (= .B205K) verified; EA/flow/Sessions untouched; terminal.ini c725e437;
 no terminal64; D: 73.5 / C: 14.1.
```
(End of slice)
