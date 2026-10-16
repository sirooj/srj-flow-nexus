# BUILDER SLICE B-247 - raw rows (flip-leg A + kill-alone B, RESTORED D2/D2)
Base: builder/B-247 cut at 8ef01ec (= B-246 head). Verdict RESTORED (A D2, B D2).
Trial bases: .B247AK (A: EA 0a6affaf/a6dab535, Flow 86368712; renewal leg writes removed) + .B247BK (B: EA 0a6affaf/f075fcdc, Flow 387f2822/e7883c59; leg term removed).
## Start gate
```
log-1 8ef01ec (backup exact; builder/B-247 absent pre-cut; on B-247).
gated diff EMPTY on all 0.3 files + both skills + LESSONS + ledger.
Disk kept: EA 18a1d49b/d85cf7d2 + Flow a8201128/61177aa5 + Types d542b458 + OB 915b4fc3 + Imb d9a38776 + Bias 0b334063 + State 2e4f8a95 + POI d47a0e68/04fcd8a5 + tini ff1dfcdf.
.B246K 9 files verified (EA 0a6affaf/2f61bd1a, Flow a14c76a8/0d28f876, Types f2e74e66, OB 3c669e6d, Imb ec1720b1, Bias 1c210d7b, State 4bdc8e41).
Tick STATIC (2026.hcc 18678468). No terminal64. Ledger ^1393=1 ^1394=0. Python 3.13.16.
Tracked-dirty 45 files pre-existing; B-246 run files ACCOUNTED. Part B ALREADY_BANKED.
```
## Part K0 quotes (raw with line numbers)
```
rules/25 L2 (his 9:20 XOB in play for the 8 Sep NY short) + L3 0908-NY-XOB-0920 pin.
rules/17 L2-L4 (5m flip invalidates formed setups; flip-candle retest stays potential).
rules/46 L6 PANEL-LEG-STATE + L7 DEAD-UNTIL-RENEWED; rules/50 L10 + L13; rules/53 NO-CODE-STOP.
spec 3.3 (3.md:22-26: 5m bias live, flip against direction kills) + 3.5 (3.md:43-60: in-play within current leg).
B-246 KSLEG: side legs restarted 09-02 14:40, 09-04 15:35, 09-08 16:30, after each keep's zone was reached.
```
## Part K1/K2 diffs (raw)
```
.preB247 x9 (kept SHAs) + 9 .B246K copies verified.
Build A removal (ImbalanceMgr, CRLF kept):
BEFORE:
               g_s.structLegBoundary = i - 2;   // [EA-30] fvgRenewal opens a leg; anchor to opener startBar (i-2)
               g_s.b246LegStartBull = i - 2;   // [B246KS] per-side leg start
               SRJ_QueueNearestPromotion(i,"bullish",g_s.obInvalidationBoundary,1);
AFTER (bullish ~:202; bearish ~:341 twins):
               g_s.structLegBoundary = i - 2;   // [EA-30] fvgRenewal opens a leg; anchor to opener startBar (i-2)
               SRJ_QueueNearestPromotion(i,"bullish",g_s.obInvalidationBoundary,1);
(BiasEngine :135 initial + :293 flip writes kept.) Braces +0; markers unchanged.
Build B (Flow, from .B246K): the 2 count conditions drop "&& !SrjIsNa(b246leg*) && b245rb* >= b246leg*" (+ "build B: no leg test" comments); KM fallback + prints + buffers kept. Braces +0.
Compiles: A Flow 0+3 pre-existing, EA 0/0; B Flow 0+3, EA 0/0.
.B247AK 9 verified; .B247BK 9 verified (pre-launch each per B-201).
Own defects: B-base exp-dict typo (c4e08e11 vs 2f61bd1a; owned, corrected); RECON-B first launch REFUSED_TERMINAL_BUSY (leftover 14732; owned, stopped, relaunched).
```
## Part T launches (ex5 pre/post identical every run)
```
RECON62-B247A: WMI launcher 7736 (12m 2.7GB log-read owned); terminal 14732; PRE=18435759; window 2026.08.26 verified; launcher killed; watcher 14348 PID-verified; DONE PASSED 16:16:31 (~7m).
RECON62-B247B: busy-refusal owned; retry launcher 13588; terminal 19308; PRE=19733109; PASSED 16:46:33 (~9m).
EU0525TD-B247B: EU dates read back; launcher 17416; terminal 10424; PRE=21027570; Test passed 17:34:39 (~31m). No rollover.
```
## Part T grades raw
```
GRADE RECON62-B247A: 4/7 entries, 3/7 exits, NEVER 0, trades 4 (A3/A7/K2SEP MISSING; A1 +3pt DIFF).
GRADE RECON62-B247B: 7/7 entries, 6/7 exits, NEVER 0, trades 7 (all EXACT + A1 DIFF).
GRADE EU0525TD-B247B: 12/13 entries, 11/13 exits, NEVER 3, MACHINE 2, trades 17 (K8OCT MISSING; N25JUN SILENT; N26MAY/N4JUN/N15JUL fire; M8 + M12 6-19 buy 15:50 1.14654 exit 15:51 1.14716).
```
## Part T4/T5 carriers (FLIPLEG_B247.csv: 181 rows)
```
Build A legs at confirms: K2SEP sideS 14:40 INITIAL; A3 sideB 15:35 FLIP (code=8 row at 15:35); A7 sideS 16:30 INITIAL. All count0 -> ZG REFUSE. Renewal writes gone, yet flips/initials still precede reaches.
Build B 25 Jun: 10:10-10:30 KS id5747 skips (live site); no 10:15 RV row (no renewal, validationBar never set); SILENT. Mechanism as predicted B-245.
Build B K8OCT: 10:35 H1b id18451 (bullish, close1.11919 lvl1.11930, KM-marked, KS-held); 11:25 S3 ob1/fvg0/adv1 HOLD; 11:30 S3 ob1/fvg1/adv2 ABORT (B215F1 KILL_S3); no dead1 RV row, no 11:35 ZG row. Kept B241D: same H1b, no 11:30 kill (global re-armed via per-block revival). FVG path identical both builds -> OB flag is the entire difference. Over-kill class: dead BULLISH block vetoes a SHORT through the direction-agnostic global.
M12 fields: ht=-1/1/1 (4H BEAR/1H BULL/15m BULL), 5m BULL; TREND (votes=2 trendOk=1, sweepTag=0); B182SWEEP pPM.H 15:50; hidden-bull 15:35 latch=1; FOMC-POC entry.
```
## Timing + final disk + housekeeping
```
Wall: gate+reads+K ~40m; compiles x4 ~5m; RECON-A start 12m + run 7m; RECON-B retry start 13m + run 9m; EU-B start ~10m + run 31m; cuts + grades + carriers + Q/X/F follow.
Final disk RESTORED: all kept SHAs verified, tini from .preB247, 24 charts, no terminal64. .B247AK/.B247BK unstaged (9+9 files).
Cleanup (his order, disks critical): MQL5-logs 1014/1015 (77GB) + Tester-logs 1014/1015 (14GB) + 33 superseded CUTs (10.6GB) + s4_b244/s4_b245 deleted with manifest; D 91->182GB, C 3.1->15GB. Kept: today logs, trial/kept cuts, ticks, inis, runners, records, keeps, backups, packs, reports.
X7 carried: A1 +3pt = FILL-EXACT class, no edit.
```
## Size gate (caps 20000/600; pointer 6000/35; result 12000)
```
pointer 4572/35 PASS; result 4239/25 PASS; slice 5685/68 PASS (this file); TRUTH 3112 unchanged PASS; FIXPLAN 17778 (folds + X1); LESSONS 19900 (fold + X4); ARCHIVE +LESSONS line (B-77); READ_MAP rewritten; BATCH247 2 items; FLIPLEG 181 rows; day packs 6.
```
(End of slice)
