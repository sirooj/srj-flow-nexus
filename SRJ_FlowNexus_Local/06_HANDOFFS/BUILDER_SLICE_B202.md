# BUILDER SLICE B-202 - raw rows and code spots (under 600 lines)

Base: builder/B-202 cut at 44f1f5b (backup exact, = builder/B-201 head). Reads: pointer, RESULT_B201 (Carried/K/P/Final), SLICE_B201 (spots/rows), register whole, CONTEXT B201 lesson. Trial rebuild: .B200K 340a7ab4 -> K2-K4 per B-201 spots (src 7c392767 rebuild-identical, ex5 B2EF6E4C NEW datetime). Relay B-202 + his J2D words, same session.

## Start gate
```
log-1 44f1f5b60e0ffff8b2b12b551928a43f4f3bc0c3 (backup exact). Branch builder/B-202 cut here. Push via backup, never origin.
diff 44f1f5b EMPTY on pointer/RESULT_B201/SLICE_B201/register/both skills/CONTEXT/HANDOFF/ledger. Journal row 335 bytes 164391 ACCOUNTED. Profiles 581 (578 + 3 chart re-saves, B-198 class, deletion forbidden, ACCOUNTED).
Disk: EA 986a7dba, ex5 73a70b74 datetime class ACCOUNTED, IND a8201128/c82f175e, SESS 16573a5b, terminal.ini a5834591, .B200K 340a7ab4, ex5.preB201 40721306. Ledger ^1347.=1 ^1348.=0. No terminal64. D: 126.1 GiB now. Python 3.13.16 (py absent).
Trial SHAs post-compile = pre-launch: src 7c392767 (= B-201 trial, rebuild-identical), ex5 B2EF6E4C NEW datetime; .B202K verified before runs.
```

## Part B banking (verbatim, typos his; skill lines 323-324; B-201 step-1 words lines 321-322)
```
"is the task to improve the journal robustness complete? if so then i want to test run june till date all 3 EU GU UJ simultaneously, and after that from the beginning of the year"
ORDER-J2D-THEN-YTD (marked so): once step 1 is kept, run June to date on EURUSD, GBPUSD and USDJPY on the same build in one go; after that, a run from 1 January. Steps 2 and 3 stay on the goal map.
```

## Part K spots (EA only; base .B200K 340a7ab4 verified; spots per B-201 slice, same base/line numbers; markers once each)
```
K2 [B201PROMOTE] no-retest path (old [B200PROMOTE] dead after IDLE). K3 [B201FROMTO]/[B201TO] functions + hooks (GoAbort/S1pre/ORDER/promotion/session-close lastShift). K4 [B201DISCARD] live discard + [B201LAST] lastShift/lastBar via B200SnapOld.
Braces 1236/1236 pre -> 1283/1283 (+47/+47, = B-201 delta); markers once each; compile 0/0 (14805ms); full diff vs .preB202 in result (525 lines).
```

## Part T standard runs (one session; dates read back each; leftovers by PID; ex5 B2EF6E4C stable)
```
RECON62-B202 WMI 18:08:56 term 19464 PRE 20836580; EURUSD 1787702400/1788998400; launcher killed (pre-verify note: tail showed stale GBP completion, window verified post-kill via fresh EURUSD replay - terminal/tester unaffected); watcher 21368 killed (never wrote DONE, tail-verified Test passed); pass 0:03:04 18:17:41 (563338/3168 = B-200/B-201 fingerprint).
JUNE0525-B202 WMI 18:18:56 term 10968 PRE 21897641; USDJPY 1779667200/1781308800; pass 0:03:57 18:29:12 (740873/4320 = fingerprint).
GBP0629-B202 WMI 18:30:12 term 11576 PRE 22879449; GBPUSD 1782691200/1784332800; pass 0:04:24 18:40:38 (1386092/4320 = fingerprint).
Filed vs DEALS B196 (side/date/time/price): 14/14, 8/8, 2/2 IDENTICAL (DEALS files byte-identical incl. volume/register). NO STOP.
Cut standards one pass (CUT 1061061/981808/949163 lines, PRE+1 markers).
```

## Part P standards (from standard cuts; payloads strip tester timestamps)
```
P1 rebuild identity: B200POT/B201FROM/B201TO/B200SESS EA payloads identical multisets B201 vs B202 (941/1130/1140 rows, ONLY_A=ONLY_B=0). Counts B201FROM/TO 105/119/122, ORDER 7/4/1, END 98/115/121. PROVEN.
P2 re-scoped 10 July (rows below, CUT_B202 lines): park 14:25 (Daily LONG BORN, no END), resume ALIVEs 14:35-14:50 reg NONE div bull 14:15, 14:50 touch 0 + regime NONE, END 15:55 Q4 sd=14:10. No session-close owed. PROVEN.
  CUT_GBP0629-B202.log:880671: B200POT bar=2026.07.10 14:35 ev=ALIVE reg=NONE div=regular-bull dbar=2026.07.10 14:15
  CUT_GBP0629-B202.log:880739: B200POT bar=2026.07.10 14:45 ev=ALIVE reg=NONE div=regular-bull dbar=2026.07.10 14:15
  CUT_GBP0629-B202.log:880737: CONFIRMPOLL bar=2026.07.10 14:45 touchAttr=0
  CUT_GBP0629-B202.log:880740: REGIMECENSUS #260 bar=2026.07.10 14:45 votes=1 trendOk=0 (NONE)
  CUT_GBP0629-B202.log:880779: B200POT bar=2026.07.10 14:50 ev=ALIVE reg=NONE div=regular-bull dbar=2026.07.10 14:15
  CUT_GBP0629-B202.log:880777: CONFIRMPOLL bar=2026.07.10 14:50 touchAttr=0
  CUT_GBP0629-B202.log:880782: REGIMECENSUS #261 bar=2026.07.10 14:50 votes=1 trendOk=0 (NONE)
  CUT_GBP0629-B202.log:881285: B201FROM bar=2026.07.10 15:55:00 sd=2026.07.10 14:10 (15:55 END)
P3 discards measured: SESSION-CLOSED|84 + session-close parked discards with B201FROM+TO per run (counts in result); first per window named in result; not a pass gate.
P4 completeness: ORDER 7/4/1 END 98/115/121 with FROM/TO 105/119/122; zero PENDING; from filled/NOTREACHED/NR/ST. PROVEN.
P5 human: 4 June ALIVEs 09:45/09:50 (no deal, stays refused); 2 June/9 June/2 Sep silent (no deals); 6 July no deals; A ORDERs 7/7 with origin (rows below); 5 June 16:15 160.065; 7 July out 1.33649 Weekly. PROVEN.
  CUT_RECON62-B202.log:924650: ORDER 28 Aug SHORT Daily-VWAP entry=1.16466 sl=1.16508 tp=1.16364 R=2.43
  CUT_RECON62-B202.log:958014: ORDER 1 Sep LONG Monthly-VWAP entry=1.16022 sl=1.15975 tp=1.16077 R=1.17
  CUT_RECON62-B202.log:999845: ORDER 4 Sep LONG Yearly-POC entry=1.16018 sl=1.15847 tp=1.16302 R=1.66
  CUT_RECON62-B202.log:1009567: ORDER 7 Sep LONG Weekly-POC entry=1.16135 sl=1.16098 tp=1.16200 R=1.76
  CUT_RECON62-B202.log:1017268: ORDER 7 Sep LONG Weekly-POC entry=1.16261 sl=1.16239 tp=1.16315 R=2.45
  CUT_RECON62-B202.log:1026478: ORDER 8 Sep SHORT Monthly-POC entry=1.16205 sl=1.16258 tp=1.16102 R=1.94
  CUT_RECON62-B202.log:1031675: ORDER 8 Sep SHORT Monthly-POC entry=1.16220 sl=1.16274 tp=1.16114 R=1.96
Verdict standards: T1 no STOP + P1/P2/P4/P5 PROVEN -> KEPT-path (step 1 DONE on standards); longs continue per T2.
```
## Part T2 long runs (one session, back-to-back after GBP; dates 1779667200/1791849600 read back each; D: free reported; ex5 B2EF6E4C stable; reports saved before next launch)
```
EU0525TD-B202 WMI 18:41:41 term 19672 PRE 23828612; EURUSD long 25 May-13 Oct; launcher killed; watcher 9772 killed (tail-verified Test passed); pass 0:30:47 19:22:46 (6115750 ticks, 29085 bars). TESTER_EU0525TD-B202.html saved (78KB). D: 126.1 pre.
GU0525TD-B202 WMI 19:24:09 term 2236 PRE 27152423; GBPUSD long; pass 0:25:31 19:57:37 (8894785 ticks, 29085 bars). TESTER_GU0525TD-B202.html saved (50KB).
UJ0525TD-B202 WMI 20:01:36 term 7440 PRE 30135274; USDJPY long; window verified USDJPY 25 May-13 Oct; watcher 20864 killed (tail-verified Test passed); pass 0:25:08 20:39:58 (9728152 ticks, 29081 bars). TESTER_UJ0525TD-B202.html saved. Leftover stopped (0 terminal64). D: 110.9 post.
Ex5 B2EF6E4C before/after all 6 runs (6/6 identical). NO STOP.
Cut longs one pass 48.9s (EU 3323811 / GU 2982851 / UJ 3023572 lines; total log 33158846).
```

## Part R longs (from long cuts; 25-31 May warm-up listed never graded)
```
G1: EU 46 deals (4 warmup, 21 graded ins), GU 18 (2 warmup, 8 ins), UJ 20 (2 warmup, 9 ins). R/how-closed per trade in BACKTEST_J2D_B202.md (ORDER sl matched; take-profit/stop/EA market close from tp/sl compare).
G2: USDJPY 8/8 SAME; GBPUSD 2/2 SAME; EURUSD 10/14 SAME + 4 DIFFERENT (1 Sep exit 17:50 1.15987 vs 17:51 1.15975 SL; 4 Sep in/out absent; 7 Sep exit moved). Cause: exit BREAK missed to SL + earlier-start line-map class (M/W/D identical on rows 17:40/17:45; Yearly unmeasured, disclosed suspected). First rows named. Measured only.
G3: 101 trading days each (25 May-12 Oct weekdays, no holes); last ticks 2026-10-12 all pairs.
G4: PEND 0; FROM=TO (792/726/807).
G5: REPORT/BACKTEST_J2D_B202.md (trader words, no machine ids).
```

## Records (grep-first counts)
```
X1 CONTEXT-4 B202 lesson 0->1; section 5 Brain B-202 0->1. X2 HANDOFF-3 B-202 0->1 KEPT. X3 ledger 1348 0->1 (banking 164885). X4 pointer 31 lines (step 1 DONE; BACKTEST-J2D 1/6; Next B-203 year-start).
F2b KEPT files (staged by explicit path): ROWPACK_*_B202_W*.csv (9) + day files (41) + DEALS_*_B202.csv (3) + INDEX_B202.md + JOURNAL_*_B202.csv (6: 3 std + 3 long) + SETUPS (6: REPORT/SETUPS_*_B202.csv) + long DEALS/JOURNAL/SETUPS/TESTER html + BACKTEST_J2D_B202.md. Long per-day packs on disk not staged. No file over 900KB staged unstaged? Window packs 3.7-7.4MB staged (week splits, B-200 precedent); journals/setups under 900KB.
F5 never EA/includes/indicators/ex5/OPERATOR journal/logs/inis/profiles/scripts/backups/CUTs. F6 rev-parse/push/ls-remote.
Final KEPT: EA+ex5 = .B202K (7c392767/B2EF6E4C, new kept build).
```
(End of slice)
