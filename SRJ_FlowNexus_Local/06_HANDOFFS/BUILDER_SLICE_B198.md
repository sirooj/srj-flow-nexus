# BUILDER SLICE B-198 - raw rows per item (under 600 lines)

Base: builder/B-198 cut at 5eaf2cc (backup exact, = builder/B-197 head). Reads: job_r_b198.py + job_q1/q2_b198.py (packs + cuts + source text, never the day log after the cut). Print run: B198TAKEN/B198DIV (RESTORED on the DIV scan defect). Relay B-197 + correction 80120074537979, same session.

## Start gate
```
log-1 5eaf2cc4fb0faf1d99077585b6a5b0f097e25409 (backup exact). Branch builder/B-198 cut here (rev-parse HEAD = 5eaf2cc + branch builder/B-198 after cut, re-checked before commit below). Push via backup, never origin.
status 1044 (20 M + 2 D + 1022 ??; dirty tree as B-197 ACCOUNTED). git diff 5eaf2cc EMPTY on pointer/RESULT_B197/SLICE_B197/register/srj-relay/srj-strategy/CONTEXT/HANDOFF/ledger.
Disk: EA 986a7dba + ex5 93E9A54A; IND a8201128 + ex5 B813EC99; SESS 16573a5b (all raw-match, no normalize needed); terminal.ini drift (RecompiledAll 1791859091 -> 1791869638, 4 bytes, same length 20447) + Charts/Default chart01-03 (same lengths, 7-8 bytes) from post-commit 12:40 terminal touch - restored from .preB197 copies, verified a5834591 + pre bytes before P0.
Ledger "^1343." = 1, "^1344." = 0 pre. D: 136.4 GiB free pre (146491150336). No terminal64 at gate. Python 3.13.16 embed (py absent).
Trial sources post-compile = pre-launch: EA 4715f4ec, IND 9acb569e, SESS ec5f16a1. Trial ex5 EA 40c645d5 / IND eb5beb9c (post-compile, pre-each-launch, post-batch IDENTICAL).
```

## R1a session clock (code raw with line numbers)
```
Indicators/SRJ_FlowLogic.mq5:378: input string inLondonSession      = "0200-0500:1234567";
Indicators/SRJ_FlowLogic.mq5:379: input string inNYSession          = "0700-1200:1234567";
Indicators/SRJ_FlowLogic.mq5:377: input string inAsiaSession        = "2000-0000:1234567";
Indicators/SRJ_FlowLogic.mq5:380: input string inPMSession          = "1330-1600:1234567";
Indicators/SRJ_FlowLogic.mq5:381: input string inSessionTimezone    = "America/New_York";
Indicators/SRJ_FlowLogic.mq5:382: input int    inBrokerToUTCOffset  = 3;
EA:11994-11999: g_hFlow = iCustom(_Symbol, PERIOD_CURRENT, InpFlowLogicName, "", 1, InpFL_HtfLookbackBars, PERIOD_H4, PERIOD_H1, PERIOD_M15, true, 60); (8 positional args; Session Settings group untouched -> indicator defaults live)
SRJ_Sessions.mqh:175-183: int SRJ_GetSessionId(datetime brokerTime) { NY convert; Asia->0; London->1; NY->2; PM->3; return SRJ_NA_INT; }
SRJ_Sessions.mqh:164-168: half-open test (curMin >= startMin && curMin < endMin).
Mapping: 08:55 server = 01:55 New York < 02:00 London open -> NO SESSION (09:00 -> London). 13:55 = 06:55 < 07:00 NY open -> NO SESSION (14:00 -> New York).
```

## R1b his session-edge words (verbatim banked lines)
```
SESSION-BOUNDARY DISCIPLINE (skill:84): "London begins 9:00, 8:55 earliest with the 9:00 open candle executable"
LONDON-FUNDAMENTAL (skill:84): "he trades London + NY sessions only, defined in his indicator sessions-time section; London 9:00 start, 8:55 earliest"
Ledger 835 (SESSION RULES VIOLATION OWNED 2026-09-26): "London-9:00-start not found on record, pinned NEW from his words" (full item in result record).
Spec 3.0 (spec L88): "London 02:00-05:00 and New York AM 07:00-12:00" ET, "server 09:00-12:00 and 14:00-19:00 EET".
Verdict: NO RULING FOUND (no New York 13:55 edge candle named the way 08:55 is).
```

## R1c journal grep (OPERATOR_TRADE_JOURNAL.csv, 1082 rows; zeros re-proved)
```
8:55 = 0 | 08:55 = 0 | 13:55 = 0 | 1:55 = 0 | session open = 0 | sweep at = 0 | open candle = 0 | first candle = 0 | bare 855/1355 = 0.
"edge" = 3, all the word "knowledge" in banked-note rows 1074/1075/1076 (B-167/B-168/B-169 words, no candle content).
"8.55" regex = 4, all telegram message ids (rows 258/259/276/277, links only).
No row names an 8:55/08:55/13:55/1:55 candle or a sweep at a session open. ZERO.
```

## R1d values (B196 packs, committed rows)
```
GBP0629-B196/2026-07-10 pack 1229: B196SESS bar=2026.07.10 13:55 ev=SWEEP tag=LD.H sv=3 ... pLH=1.34306 ...
pack 1255: B196SESS bar=2026.07.10 14:00 ev=OPEN-NY tag=- sv=0 ... pLH=1.34358 pLL=1.34082 ...
pack 1259: B196SESS bar=2026.07.10 14:00 ev=SWEEP tag=pLD.H sv=0 ... pLH=1.34358 ...
One answer: 1.34358 = cached prior-London high (OPEN-NY cache, true session max formed 09:10); 1.34306 = live London-high line value on the 13:55 LD.H tag.
```

## P1 hunks (print-only; full text as applied)
```
[Sessions.mqh helper, after SRJ_GetSessionId] SRJ_B198TakenCensus(high,low,time,rates_total,i,ev): 10 cached levels (pDH/pDL day; pAS/pLD/pNY/pPM H/L with session 0-3); source run = most recent contiguous session run (day: most recent complete day) before bar i; form = first attainer in run (exact ==); take = first strictly-beyond bar in (runEnd, i]; prints "[SRJ-IND] B198TAKEN bar=%s ev=%s lvl=%s val=%s form=%s take=%s px=%s" (val=-/form=NONE/take=NONE/px=- on NA). Locals only; no state/gate/value change.
[OPEN sites] SRJ_B198TakenCensus(high,low,time,rates_total,i,"OPEN-ASIA"/"OPEN-LONDON"/"OPEN-NY"/"OPEN-PM") inserted before each session reset line (Sessions.mqh:355/366/377/388 region).
[Indicator SWEEP site] if(same B196SESS-SWEEP fire && (tag[0]=='p' || tag[0..1]=="PD")) SRJ_B198TakenCensus(high,low,time,rates_total,i,"SWEEP:"+tag);
[EA, after B196BAR block] if(InpDebugLog && inWindow) { range CopyBuffer(g_hCqd,CQD_BUF_DIVVERDICT,barShift,count) into local arr; newest-FIRST-intended scan for first nonzero (DEFECT: non-series arr is oldest-first, scan ran oldest-first); latchL = v in (1,2) ? v : 0; latchS = v in (-1,-2) ? v : 0; prints "[SRJ-EA] B198DIV bar=%s kind=%s side=%s dbar=%s latchL=%d latchS=%d". }
P2: braces 0/0 all files; markers EA 1 / IND 1 / Sessions 5, each once. Compiles: trial IND 0 errors + 3 pre-existing warnings (1581/1803/1877, shifted +5); trial EA 0 errors + 0 warnings. Restore compiles: IND 0/3warn, EA 0/0.
```

## P3 runs (one terminal session, back to back; dates written + read back each)
```
GBP0629-B198 WMI 12:59:58 PID 5000, terminal 6480 13:00:42, PRE 11877984, window GBPUSD 1782691200/1784332800 read back exact, ex5 pre 40c645d5/eb5beb9c; window verified on journal (GBPUSD replay, B196BAR); launcher killed; completion 13:06:45 "Test passed in 0:05:38" (1386092 ticks, 4320 bars); DONE PASSED (hand-verified, watcher format; watcher killed - >2GB Min defect).
RECON62-B198 WMI 13:14:54 PID 21416, terminal 10164, PRE 12827652, window EURUSD 1787702400/1788998400 exact; launcher killed; completion 13:20:08 "Test passed in 0:03:59" (563338 ticks, 3168 bars, exact fingerprint); DONE PASSED; leftover 10164 stopped by PID.
JUNE0525-B198 WMI ~13:21:3x PID 15488, terminal 20536, PRE 13882527, window USDJPY 1779667200/1781308800 exact; launcher killed; completion 13:27:15 "Test passed in 0:04:07" (740873 ticks, 4320 bars); DONE PASSED; leftover 20536 stopped by PID.
ex5 post-batch 40c645d5/eb5beb9c IDENTICAL. D: 133.2 GiB free post (142991331328). No terminal64 at close.
Cut: est 3567650634 missed GBP marker (inside GBP segment) - recut from exact marker bytes (GBP 3473218493 / RECON 3770533019 / JUNE 4083627689); markers at stream idx 134792/1084461/2139336 = journal lines 11877985/12827653/13882528 (PRE+1 exact). CUT_B198 x3 + 9 window packs (3.6-6.1 MB) + 41 day files + 3 DEALS. TAGSET 49.
```

## P4 filed trades (DEALS B198 vs B196 byte compare)
```
GBP0629: e8eff7b6 == e8eff7b6 IDENTICAL (2 deals: 7/07 14:45 sell 1.33863 F2; 7/07 17:03 buy 1.33649 NONE).
RECON62: 90f79f80 == 90f79f80 IDENTICAL (14 deals: A1 8/28 10:05 sell 1.16466 ... A7 9/08 17:00 sell 1.16220; full list in cut output).
JUNE0525: a7889cfa == a7889cfa IDENTICAL (8 deals: 27 May warm-up x2; C-06-03 6/03 09:10 buy 159.932; B2 6/05 16:15 buy 160.065; B3 6/11 14:40 buy 160.530).
STOP: none hit (no deal differs, no ex5 change, tags present all runs: TAKEN 910/660/820, DIV 1426/1048/1426 = BAR counts).
```

## P5 proof
```
P5a TAKEN==SESS values: GBP 162 levels 0 mismatch; RECON 122/0; JUNE 154/0. CLEAN.
P5b DIV vs D130LATCH: GBP 19/19 mismatch; RECON 28/28; JUNE 18/18. VOID (scan defect; sample: confBar 2026.06.30 11:30 SHORT verdict=2 verdictBar 11:15 vs B198DIV hidden/bear dbar 2025.01.23). D130/B182 newest-first rows stand.
```

## R2 taker census (B198TAKEN, strict; full-window edge query: ONLY 10 July pLD.H)
```
10 July pLD.H 1.34358 form 09:10 take 13:55 px 1.34363 (bars 14:00/14:05/17:00 + 7/13 09:00 census rows agree).
5 June pLD.L 159.908 form 10:30 take 12:10 px 159.906. 9 June pAS.L 160.133 form 03:15 take 08:30 px 160.123.
2 Sep pAS.L 1.15760 form 05:00 take 07:15 px 1.15748; pAS.H 1.15917 form 03:00 take NONE (09:00/09:40/14:00 prints) then take 16:25 px 1.16091 (16:30 print). 8 Sep pAS.L 1.16228 form 06:00 take 07:20 px 1.16223.
Grades: A1-A7 SAME; B1 SAME-silent; B2 SAME (16:15 kept); B3 SAME; C-3June SAME; C-0605LDN SAME-silent; C-0602 SAME-silent; C-0610 SAME-absent; C-0604 SAME-refused; F2 SAME; F3 SAME-silent (regime passes under planner half, slot kills 14:30); 9JUN SAME-silent; 2SEP SAME-silent. Must-keep moved NONE; must-never added NONE.
```

## R3 XT rows (9 B60C cSrc=RETEST on B196 packs + zone standing)
```
7/01 10:00 LONG Q-POC rt 10:00 xt=1 zxob 1.32368-1.32400 xpromo 09:50 | HZB win=1 thru 10:05; KILL t=10:10 post-confirm -> SAME.
7/01 11:05 LONG Q-POC rt 10:50 xt=0 (prior-slack path) -> SAME (XT moot).
7/03 11:45 SHORT Q-POC rt 11:30 xt=1 zxob 1.33663-1.33722 xpromo 11:25 | HZB win=1, no kill -> SAME.
7/03 14:20 LONG D-VWAP rt 14:20 xt=1 zxob 1.33553-1.33603 xpromo 14:15 | KILL t=14:35 post-confirm -> SAME.
6/05 16:10 LONG M-POC (B2) rt 16:00 xt=1 zxob 159.881-159.916 xpromo 15:40 | picked object (promo 15:40, B182MID/PROMO 15:45 rows) never killed; 14:35 KILL names distinct promo-6/04-17:00 object -> SAME (16:15 stands).
6/10 16:05 LONG D-POC rt 15:30 xt=1 zxob 160.325-160.344 xpromo 09:30 | no kill -> SAME (dies later gate).
9/01 15:25 SHORT M-POC xt=0 (prior-slack) -> SAME.
9/03 10:55 SHORT Q-POC rt 10:50 xt=1 zxob 1.16044-1.16063 xpromo 10:45 | KILL t=11:05, confirm bar 10:55 closes 11:00 -> standing at confirm -> SAME.
9/04 11:10 SHORT D-POC rt 10:10 xt=1 zxob 1.16284-1.16302 xpromo 09:50 | no kill -> SAME.
BOTH/PRIOR rows (F2 7/07 BOTH xt=1; 2 Sep PRIOR/BOTH x3; 9 June 15:25 BOTH xt=0): SAME by construction.
9 June LONG seeds die at LTF_MISALIGN/FRESH_OB_DEAD/FRESH_OPP_FVG (B182DEC rows), never reach live touch -> SAME-silent. 2 Sep FOMC LONG never reaches live touch; later SHORTs die TP_RR_FAIL -> SAME-silent. 0602 no B60C (shadow only) -> SAME-silent. 0604 PROMO_RETURN_NONE (zone gate) -> SAME-refused. F3 no seed at 14:50 -> SAME-silent. Must-never added: NONE.
Kept terms raw: EA:2673 touch = (h1 >= L - _Point && l1 <= L + _Point); EA:2674-2682 uj60_tR/uj60_tP; EA:2683-2699 XT (promo < retestTime + retest overlaps picked XOB); EA:2700 cSrc; EA:2701 C_TOUCH; EA:2704-2714 B60C print. (Relay's EA:2532 = pre-shift numbering.)
```

## R4 divergence rows (10 July, machine firing-path reads)
```
UJPROBE 14:00-14:20 latestNZ=-1 (regular-bearish latest); 14:25-14:55 latestNZ=1 (regular-bullish latest). 14:50 row: bar_key=14:45 h4=1.0 h1=-1.0 m15=1.0 div=OPPOSING kind=regular latestNZ=1.
CQDRECHECK shift=2: 14:00 bar=13:50 passA=-1.0; 14:05 bar=13:55 -1.0; 14:10 bar=14:00 -1.0; 14:25 bar=14:15 +1.0.
B182DEC: 09:30 LONG div=2 hidden dbar=09:15; 09:45 LONG div=2 hidden dbar=09:30; 14:30 LONG div=1 regular dbar=14:15 (latch=0); 15:55 SHORT div=2 hidden dbar=15:30. No D130LATCH on 10 July.
Latest by 14:50: regular BULLISH on 14:15. Last regular bearish before 14:50: 14:00 candle. His type-2-bearish UNMAPPED; renewed by 14:15 bullish under DIVERGENCE-RENEWED-ONLY. CQD NOT MET.
```

## Part S separator (rows x EDGE | TIER | XT | CQD | ALL)
```
A1-A7 SAME|SAME|SAME|-|SAME. B1 SAME-silent|SAME|SAME-silent|-|SAME. B2 SAME|SAME|SAME|-|SAME. B3 SAME|SAME|SAME|-|SAME.
C-3June SAME|SAME|SAME|-|SAME. C-0605LDN SAME-silent x3|-|SAME. C-0602 SAME-silent x3|-|SAME. C-0610 SAME-absent x3|-|SAME. C-0604 SAME-refused x3|-|SAME.
F2 SAME|SAME|SAME|-|SAME. F3 SAME-silent|SAME|SAME-silent|NOT MET|SAME-silent. 9JUN SAME-silent x3|-|SAME-silent. 2SEP SAME-silent x3|-|SAME-silent.
ALL SEPARATES fails on F3 (14:50 unreached; every gate after slot unmet). No B-199 hunk set. Lane PARKED (PK-2) with reopen key (pointer).
```

## Records
```
X1 CONTEXT-4 +2 (B198-EDGE-CANDLE-FIRST + B198-MRSWEEP-PARKED, 0->1 each, verbatim per relay). X1b CONTEXT-5 +1 Brain B-198 (0->1).
X2 HANDOFF-3 +1 B-198 arc (0->1, RESTORED + PARKED). X3 ledger 1344 B198-EDGE (^1344. 0->1, ^1343. stays 1). X4 pointer rewritten 31 lines. X5 folded into X1.
```

## Trial diff kept (.B198T vs .preB198, print lines only - full text in result P1; markers/braces in P2)
```
Sessions.mqh: +SRJ_B198TakenCensus def (74 lines) + 4 OPEN-site calls (2 lines each).
Indicator: +5-line SWEEP-site cached-tag call.
EA: +30-line B198DIV block after B196BAR.
No state, gate or value line touched (PrintFormat + locals + one range read only).
```
(End of slice)
