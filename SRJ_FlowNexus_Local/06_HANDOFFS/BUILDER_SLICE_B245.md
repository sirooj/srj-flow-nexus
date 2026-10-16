# BUILDER SLICE B-245 - raw rows (EU-CLEAN D12, RESTORED NO-GAIN)
Base: builder/B-245 cut at f9bbe56 (= B-244 head). Verdict RESTORED (D12 NO-GAIN).
Relay numbering: tags/files are B-245 (branch, ledger 1392, runs B245D12, rules/53); re-applied B-244 tags [B244S4]/[B244RV] kept byte-exact.
## Start gate
```
log-1 f9bbe56 (backup ls-remote exact; on B-245).
gated diff EMPTY on all 0.3 files + both skills + LESSONS + ledger.
Disk: EA 18a1d49b/d85cf7d2 + Flow a8201128/61177aa5 + Panels f383866d + OB 915b4fc3 + Imb d9a38776 + Bias 0b334063 + State 2e4f8a95 + POI d47a0e68/04fcd8a5.
tini ff1dfcdf ACCOUNTED (touch-class of b64523fc: 12 diff bytes only RecompiledAll/LastStartTime timestamps + 1 window-state hex digit; [Tester] RECON dates 1787702400/1788998400 + Symbol EURUSD intact, [TickLoad] intact).
.B244K 4 files verified (EA mq5 3a365eff, EA ex5 1683655e, Imb fc4408f1, Flow ex5 662ebe05).
Tick STATIC (bases/Custom/history/EURUSD_RAW/2026.hcc 18678468). No terminal64. Ledger ^1391=1 ^1392=0. Python 3.13.16.
Untracked B-244 run files (CUTs, job scripts, .B244K, .preB244) ACCOUNTED.
```
## Part B banking (grep-first counts)
```
'not aware of the builders project code terms' 0; 'if the EU test window are clean then testing GU and UJ is next' 0; 'workflow rule defect of stopping and questioning' 0; NO-CODE-STOP 0; GU-UJ-NEXT 0; rules/53 in index 0 -> rules/53 created + index line added.
Addendum 'is the setup valid? is it trend following or mean reversal' 0 -> banked as M10JUN-SETUP-CLASS in rules/53.
```
## Part W edits (counts 0 pre; before->disk SHA prefix)
```
01a ceef84da->8fd014ec; PLANNER_SKILL 6971e6a8->09bb6939; PLANNER_CONTEXT 657cbb1b->002ceb98; EU_FIX_PLAN cd0c9edd->fbe96dd5; strategy SKILL feb72073->93de5952.
W4 GU-UJ line after (c) verified present post-edit.
```
## Part K0 map (raw spots, real line numbers)
```
H1b first-close kill OrderblockMgr:218-236 ([B216H1b] flag-only; :228-235 inBias+closedBeyond -> tickOBIsValid=false, setter code 10, NO per-block write).
Live kills need prior activation: OrderblockMgr:119-121 (skip when didActivate) + :121-133 replay kill (ob.isValid=false :131, invalidationBar=replayBar :132); :526-541 live kill (isValid=false :540, invalidationBar=i :541).
Renewal scan ImbalanceMgr:268-284 (renewalOB = nearest + !hasDrivenRenewal :278-283); write-time ren set :196/:328 (State.mqh:270 field).
Code6 writer ImbalanceMgr:341-354 (guard :341, revival tickOB=true :347-353); code5 mirror :209-224.
B177HZ gate EA:10500-10528 (refuse GoAbort ABORT_HISZONE_NONE :10524-10527).
.B244K H4a (EA 8381-8405, B244S4 S4-pre) + H4b (Imb 209-219 code5 + 348-360 code6, B244RV guard) verified present; text in SLICE_B244 lines 27-97.
Flow a8201128 base: 55 buffers (:8), no B240ZC (reverted); insertion anchors SetIndexBuffer 53/54 (:807-808), series (:895-898), reset (:1540), B176HZ LATEST prints (:1848-1849).
COrderblock fields Types.mqh:40-63 (isValid :50, invalidationBar :52, isPromoted :56, promotionBar :59, objId :63); CImbalance :100-116 ( detectionBar :102, isFilled :107, fillBar :108).
FVG birth = detectionBar (third candle), fallback startBar; XOB birth = promotionBar.
```
## Part K1 rule check (quoted, no conflict)
```
46 L6 PANEL-LEG-STATE (panel states are the spec 3.4 flags) + L7 DEAD-UNTIL-RENEWED (killed OB stays dead until structure renews).
43 L16 0625-EU-INVALID (25 Jun short invalid: 10:00 OB + 10:05-10:15 FVG invalidated before entry).
26 L1-L3 OB-LEVEL-HIS (kill = body close beyond invalidation level; NO activation step in his words -> K2 writes the mark at the H1b site unconditionally).
50 L10 ZONE-NOT-REACHED-NOT-INPLAY + L13 REACHED-ONLY-INPLAY (only reached zones count).
28 L4 MOST-RECENT-XOB-TAG (several zones can each qualify, no precedence).
21 L2 RETRACE-IS-IN-PLAY.
spec 3.4 (3.md:28-41: 2-of-3 adverse pre-confirmation) + 3.5 (3.md:43-60: XOB in-play = penetration within the current structural leg; FVG unfilled in open leg; no precedence; size never a criterion).
K2 mechanism (builder choice stated): invalidationBar = discoveryBar (matches tickOBSetterBar at the same site); lean print = existing B216H1 row + B244RV dead flag.
K3 V1 rule (stated): count iff birth<reach<loopbar AND (kill NA or kill>=loopbar); XOB kill = close beyond level (no activation gate), FVG kill = machine fillBar; newest counted zone per side by max reachBar.
```
## Part K diffs vs .preB245 (KM raw; H4a/H4b byte-exact to .B244K per gate SHAs)
```
--- OrderblockMgr (KM)
+++ OrderblockMgr (KM)
@@ -228,6 +228,9 @@
        if(b216_inBias && b216_closedBeyond)
          {
+          //--- [B245KM] per-block kill mark (relay B-245 K2; his kill has no activation step, rules/26: the block itself goes dead here).
+          ob.isValid = false;
+          ob.invalidationBar = discoveryBar;
           g_s.tickOBIsValid = false;
```
Flow ZS + EA ZG hunks are on disk in .B245D12K (Flow src 2d6b402f, EA src 0a6affaf); ZS = buffers 55/56 + 4 objId latch arrays + per-bar count block after the B176HZ LATEST prints with one [B245ZS] row per bar (count + newest zone formT/range/reachT per side); ZG = FL_BUF 55/56 defines + refuse-on-0 gate after the B177HZ block with one [B245ZG] row per candidate.
H4b note: first application dropped the original kept-dead print (owned here); restored before compile; Imb then byte-exact fc4408f1 except trailing CRLF, appended -> MATCH.
Braces EA 1294->1298 (+4 H4a/ZG) balanced; Flow 129->150 (+21 ZS) balanced; OB 131->131 (+0) balanced; Imb 71 == .B244K 71.
Markers: [B244S4] 1, [B244RV] 2, [B245KM] 1, [B245ZS] 1 (print), [B245ZG] 1.
Flow compile 0 errors + 3 pre-existing long-to-int warnings at 1598/1820/1994 (SrjIsNa promotionBar lines, none in hunks). EA 0 errors 0 warnings.
Trial SHAs: EA 0a6affaf/c4e08e11, Flow ex5 18c362fb, OB 2d0b60a6, Imb fc4408f1. .B245D12K 6 files SHA-verified pre-run.
## Part T launches (EA c4e08e11 + Flow 18c362fb pre-launch, post-RECON, post-EU)
```
RECON62-B245D12: foreground launch killed mid-replay by the tool timeout (tree kill, owned here; partial segment lines 11582192-12611843 excluded by PRE); WMI relaunch launcher PID 7092; terminal PID 18608; PRE=12611843; window replay 2026.08.27 verified; launcher killed; watcher PID 15592; DONE PASSED 13:45:06 (~4m).
EU0525TD-B245D12: terminal 18608 stopped (wrapper busy-guard); WMI launcher PID 20920; terminal PID 17280; PRE=13780468; EU dates 1779667200/1791849600 read back; window replay 2026.05.25 verified; launcher killed; watcher PID 9220; DONE PASSED 14:16:41 (~27m). Same day log, no rollover.
Cuts per segment (TOOLS/job_cut_b245.py = b244 + ZS/ZG regexes; PRE-gated so the killed partial never grades).
ex5 SHAs pre/post both runs identical (c4e08e11/18c362fb).
```
## Part T1/T3 grader outputs raw
```
GRADE RECON62-B245D12: KEEP entries exact 7/7; KEEP exits exact 6/7; NEVER fires 0; MACHINE-ONLY ungraded 0; trades 7
A1 EXACT + EXIT DIFF +3pt (11:35 1.16467 vs 1.16464, FILL-EXACT class, X7); A2 EXACT; A3 EXACT; A4 EXACT; A5 NEVER SILENT; A6 EXACT; A7 EXACT; N4SEP1040/N1SEP1530/N27AUG/N28AUG1625/N8SEP1645/N7SEPSHORT SILENT; K2SEP EXACT; N4SEP0930 SILENT.
ZG 15 rows, all PASS (v13-v35). No REFUSE on RECON.
GRADE EU0525TD-B245D12: KEEP entries exact 13/13; KEEP exits exact 12/13; NEVER fires 4; MACHINE-ONLY ungraded 1; trades 18
KEEPS all EXACT (A1 +3pt DIFF same class); P3/V29JUN/K28MAY/K8JUL/K2SEP/K8OCT EXACT; N10JUN/N22JUL SILENT.
N25JUN FIRES 10:45 1.13540; N26MAY FIRES 15:50 1.16336; N4JUN1005 FIRES 10:05 1.16117; N15JUL1035 FIRES 10:35 1.14227; M8 machine 10 Jun 18:55 1.15490 exit 01:01 1.15331.
T2 not triggered (no KEEP worse on either window). T4: no build drops a NEVER -> T5 RESTORED.
```
## Part T6 carriers (from the lean prints)
```
25 Jun: 10:05 B216H1 id5747 close1.13574 lvl1.13556 (H1b+KM fired); 10:15 B244RV id5747 dead0; 10:20 PROMOCENSUS 5747 isValid=1 isActivated=1 obVal=obInval=110501 (KM mark wiped by re-activation); 10:40 B245ZG SHORT v67 PASS, newest = 5747 itself (reached 10:25). S4 adv: FVG dead only (OB alive) -> no [B244S4] refuse.
26 May: 15:45 B245ZG SHORT v39 PASS, newest bear FVG 14:15 1.16420-1.16421 reached 14:30.
4 Jun: 10:00 B245ZG LONG v10 PASS, newest bull FVG 07:20 1.16055-1.16058 reached 08:20.
15 Jul: 10:30 B245ZG LONG v13 PASS, newest bull XOB 07-14 22:30 1.14210-1.14243 reached 10:20.
M8 10 Jun 18:55: B201FROM ht=1/1/-1 (4H BULL, 1H BULL, 15m BEAR), 5m BULL (ltf=ALIGN S1->S2); TREND (SIGNAL reg=TREND, REGIMECENSUS votes=2 trendOk=1, sweepTag=0, no sweep row); hidden-bull div 18:15 (B196DIV). Filed in batch, no truth row.
```
## Timing + final disk + housekeeping
```
Wall: gate+reads+banking+W ~35m; K0/K1 map + 5 hunks + compiles ~40m; RECON launch-verify+kill-rerun ~12m + run 4m; EU launch-verify ~5m + run 27m; cuts + grades + carrier hunt + records ~40m; commit/push follow.
Final disk RESTORED: EA 18a1d49b/d85cf7d2, Flow a8201128/61177aa5, OB 915b4fc3, Imb d9a38776, POI d47a0e68/04fcd8a5, tini ff1dfcdf from .preB245, 21 chart files, no terminal64. .B245D12K unstaged (6 files).
Housekeeping: kept cuts stay (B242K + EU B241D); B245D12 cuts stay (current trial); job/launch/grade/status/done scripts uncommitted; nothing deleted. D: 102 GB free pre-launch.
X7 owned: A1 28 Aug exit +3pt is the measured bid/ask fill class (B-211 FILL-EXACT), no edit.
```
## Size gate (caps pointer 6000/35, result 12000, slice 20000/600)
```
pointer 4486/35 PASS; result 3660/20 PASS; slice 9726/102 PASS (this file); TRUTH 3112 unchanged PASS; FIXPLAN 20725 OVER-CAP +725 (W4 GU-UJ line + 2 ordered State B-245 lines; fold deferred to planner); BATCH245 664 PASS; LESSONS 20093 OVER-CAP +93 (ordered X5 line kept; no safe line to cut, fold deferred); READ_MAP untouched (clean). Register (source) untouched.
```
(End of slice)
