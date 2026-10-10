# BUILDER SLICE B-150 - K1 spots, K2 diff, K4 table + B150PR lines, filed-trade tables (RESTORED)

## K1 raw spots (located by text)
XOB record = COrderblock, Include/SRJ/SRJ_Types.mqh:37 `class COrderblock : public CObject` .. :92 (fields: high/low zone, open, midpoint, invalidationLevel, isBullish direction, isActivated/isValid alive, validationBar/invalidationBar, isPromoted flag, promotionBar time [Task 110], creationBar, objId).
Per-bar loop Indicators/SRJ_FlowLogic.mq5:993 `for(int i = start; i < rates_total; i++)` (CreationPass :1023, ActivationInvalidationPass :1031, DeferredPromotionPass :1055, export block :1070-1437 with target=i-1 at :1072, loop end :1444, HTF RunAll post-loop :1446).
Buffers 0-47 bound (SetIndexBuffer census): 0/1 fractals, 2 bias, 3/4/5 OB/FVG/opp, 6/7 swings, 8-17 session H/L, 18 sweep, 19/20/21 HTF, 22/23 XOB zone, 24/25 FVG leg, 26/27 OB extremes, 28 renewal, 29 swept mask, 30 leg time, 31/32 objIds, 33 promo time, 34/35/36 provenance, 37/38 imb codes, 39 swing time, 40-47 prev-day H/L. Next free 48/49.
Lifecycle byte-identical to B-148 P2: create OrderblockMgr.mqh:37 `double mid = (obHigh + obLow) / 2.0;` + :40 `double invLevel = mid;`; kill :498-515 closedBeyondInvalidation vs invalidationLevel (guards same-bar-val-inv, creation-bar); promote :814-822 `ob.isPromoted = true;` + width. Accessor GetOB (Types.mqh:352). BarClosed(i)=i<rates_total-1 (Draw). prevCalc :876, start=2 on full pass.
OrderblockMgr SHA 5D14FCE2 (never edited).

## K2 diff (trial src 0E9D5931 vs .preB150; +89/-1; the -1 is the ordered buffer-count 48->50; ex5 4156C29A; compile 0 errors + 1 benign warning long->int 1481:31)
```
 #property indicator_buffers 48 -> 50 (+ [B150PR] comment)
 +double g_bufB150Bull[]; +double g_bufB150Bear[]; +bool g_b150Touched[]; (+4 comment lines)
 +SetIndexBuffer(48, g_bufB150Bull); +SetIndexBuffer(49, g_bufB150Bear); (+1 comment line)
 +ArraySetAsSeries(g_bufB150Bull, false); +ArraySetAsSeries(g_bufB150Bear, false); (+1 comment line)
 +B150PR block after END NEW EXPORT BLOCK (in-loop): init on prevCalc==0&&i==start;
  touch-update per promoted XOB (i>promotionBar, overlap bar-i range) into g_b150Touched[objId];
  MET per side over promoted+valid+touched (ids joined |); buffers at target=i-1;
  PrintFormat B150PR sym/bar(time[i])/bull/bear/bullIds/bearIds per closed bar.
```
K5 never ran (K4 STOP): no EA diff, no B150GATE, no PROMO_RETURN_NONE rows.

## K3 filed-trade tables (EA unchanged; S1 runs)
RECON62-B150S1 PASSED 07:15:24 (563338 ticks, 3168 bars, 0:02:36, bal 10434.21) vs DEALS_RECON62-B137 (14/14 identical):
sell 8/28 10:05 1.16466 | buy 8/28 11:35 1.16467 | buy 9/1 17:35 1.16024 | sell 9/1 17:50 1.15987 | buy 9/4 16:00 1.16019 | sell 9/4 23:55 1.16129 | buy 9/7 09:20 1.16138 | sell 9/7 10:53 1.16201 | buy 9/7 16:45 1.16264 | sell 9/7 17:13 1.16315 | sell 9/8 10:10 1.16205 | buy 9/8 10:42 1.16102 | sell 9/8 17:00 1.16220 | buy 9/8 17:26 1.16275
B150PR 126215 rows (1/bar, 2025.01.02->2026.09.09).
JUNE0525-B150S1 PASSED 07:27:19 (740873 ticks, 4320 bars, 0:03:24) vs DEALS_JUNE0525-B137 (10/10 identical):
buy 5/27 15:35 159.344 | sell 5/27 20:08 159.535 | buy 6/3 09:10 159.932 | sell 6/3 09:59 159.983 | sell 6/4 09:55 159.868 | buy 6/4 10:40 159.920 | buy 6/5 16:15 160.065 | sell 6/5 19:16 160.298 | buy 6/11 14:40 160.530 | sell 6/11 15:23 160.588
B150PR 108057 rows.

## K4 table (day log Tester/logs/20261010.log:line; trade-direction side graded; MACH = B-147 R3 ids)
A1 SHORT 10:00 8/28 -> 290363 bull=1 bear=1 bearIds=1389|1481|1484|1516|1704|1728|1784|2109|2149 | MACH 1704,1728,1784,2109 MET | VERDICT SAME, SET SUPERSET
A2 LONG 17:30 9/1 -> 305459 bullIds=305|405|435|474|484|975|2275|2281|2286|2289|2549 | MACH 975,2275,2286,2289,*2549 MET | SAME / SUPERSET
A3 LONG 15:55 9/4 -> 321027 bullIds=305|405|435|474|484|2706|2722|2787|2792|2793 | MACH 2722,2787,2792,*2793 MET | SAME / SUPERSET
A4 LONG 09:15 9/7 -> 324334 bullIds=+3126|3130 (same head) | MACH 2722,2787,2792,2793,3126,*3130 MET | SAME / SUPERSET
A5 LONG 16:40 9/7 -> 327286 bullIds=+3022|3126|3130|3132|3139|3178 | MACH 10 ids MET | SAME / SUPERSET
A6 SHORT 10:05 9/8 -> 329484 bearIds=1389|1481|1484|1516|1704|1728|1784|2109|2149|2217|2896 | MACH 7 MET | SAME / SUPERSET
A7 SHORT 16:55 9/8 -> 332020 bearIds=same 11 | MACH same 7 MET | SAME / SUPERSET
B2 LONG 16:10 6/5 -> 495434 bullIds=65-group|1405|1779|1780|1949|2509|2510|2566|2648|2720|2945|3150|3308 | MACH 11 MET | SAME / SUPERSET
B3 LONG 14:35 6/11 -> 516345 bullIds=33 ids incl all 18 MACH | MACH 18 MET | SAME / SUPERSET
C-06-03 LONG 09:05 6/3 -> 484929 bullIds=65-group|1405|1779|1780|1949|2509|2510|2820|2928|2930 | MACH 9 (1780,1405,*2930,2820,1949,2509,2928,1779,2566) MET | SAME / DIFFERS (2566 absent, extras present)
C-06-04 SHORT 09:50 6/4 -> 490911 bull=1 bear=0 bearIds=none | MACH none NOT MET | SAME / EXACT
C-05-27 LONG 15:30 5/27 beside -> 460364 bullIds=18 ids incl 1405|1779|1780|1949|2088|2094 | MACH 6 MET | SAME / SUPERSET
Column-2 (entry-bar) rows also pulled (k4_col2): same outcome (C-06-04 bear=0 none at 09:55 too; C-06-03 still minus 2566 at 09:10).
K4 verdict: 12/12 verdicts match, 1/12 sets exact -> STOP before stage 2. Forensics: superset = fuller-history class (replay from 2025.01 vs window scans); 2566 = single-XOB lifecycle divergence (diagnostic map vs kept replay); lookback hypothesis for planner.

## T4 restore (verified from *.preB150)
Indicator src 956BF3E3 + ex5 27B5F272; EA 585093BF/AB159DE7; OrderblockMgr 5D14FCE2; terminal.ini AA4EA14B (20447 B); Charts 0 diffs; no terminal64. Trial .B150K (src 0E9D5931/ex5 4156C29A) + .preB150 kept uncommitted, never staged.

(End of slice)
