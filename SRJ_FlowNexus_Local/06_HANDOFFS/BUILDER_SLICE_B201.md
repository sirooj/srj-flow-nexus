# BUILDER SLICE B-201 - raw rows and code spots (under 600 lines)

Base: builder/B-201 cut at 521a1a6 (backup exact, = builder/B-200 head). Reads: job_cut_b201.py (CUT x3, PRE+1 markers), job_grade_b201.py (counts + deals), job_deals_b201.py (side/date/time/price vs B196), job_pcheck_b201.py + job_ev_b201.py (10 July + ORDERs, CUT line numbers). Trial: K2 promotion move + K3 B201FROM/TO + K4 live discard (RESTORED on P3 session-close-discard as written + trial-source-save defect, fix filed). Relay B-201 + his B-201 step-1 words, same session.

## Start gate
```
log-1 521a1a6a17cb7ff2215c894dbe4ed5556f94b595 (backup exact). Branch builder/B-201 cut here (rev-parse HEAD = 521a1a6 + branch builder/B-201 after cut, re-checked before commit below). Push via backup, never origin.
status dirty (B-200 ACCOUNTED + B201 banking). git diff 521a1a6 EMPTY on pointer/RESULT_B200/SLICE_B200/REASONMAP/register/both skills/CONTEXT/HANDOFF/ledger. Journal rows 332-334 bytes 163706 ACCOUNTED.
Disk: EA 986a7dba, IND a8201128, SESS 16573a5b, ex5 8874e537/c82f175e, terminal.ini a5834591 + Profiles 578 = .preB198 class (post-commit touch none pre-run). No terminal64. Ledger ^1346.=1 ^1347.=0 pre. Python 3.13.16 (py absent).
Trial SHAs post-compile = pre-launch: EA src 7c392767, ex5 40721306; IND ex5 c82f175e untouched.
```

## Part B banking (verbatim, typos his)
```
His step-1 words 2026-10-13 (skill B-200 section 0->1 counted 0->1; journal row 335 UNSTAGED, 163706 -> 164391): "if this journal robustness is done, meaning all trades are known where is the origin or cause from and to so that the future human reviewer could understand the trade setups logic without opening the chart then the next step is to backtest test run from june till date"
STEP-1-DONE-MEANS-FROM-TO paraphrase (marked so): step 1 is done when every taken trade and every rejected or unfired setup shows its origin (from) and its end (to) on the journal, readable without the chart. His later word sets the next step after step 1: the June-to-date backtest. Steps 2 and 3 of the goal map are not withdrawn by his words; they stay on the map.
```

## Part K code spots (EA only; locate by text; markers once each)
```
[B201PROMOTE] in no-retest path (moved from B200PROMOTE after IDLE; old block dead past seed returns):
  if(ArraySize(g_pots) > 0) { datetime b201day = TC_DayStart(barTime); for(int b201k = 0; ...) { if(sess/day match) { if(SessionAlreadyUsed) { B200PrintPot(...ONE_TAKE_LOST...,-1->lastShift...); B201PrintFrom/To(pot...); } else { B200Restore(...); B200RemovePot; break; } } } } return;
[B201LAST] SOnePot.lastShift/lastBar (saved in B200SnapOld from g_b200Shift/g_b200BarTime; cleaned to -1/0; not restored - current candle address stays).
[B201FROMTO] void B201PrintFrom(barT,potId,seedBar,line,dir,px,retestBar,sh,st) { probe via B200GateProbe (read-only, N1 restored inside); HTF via ReadFlow HTF_HIGH/MID/LOW + LTF_BIAS (BORN pattern); sd/line/px/retest or NOTREACHED; zn=oZone|oPromo|NR|ST; PrintFormat B201FROM bar/id/sd/sw=NOTREACHED/zn/el=line|dir|px|retest/ht=H/M/L|ltf; }
[B201TO] void B201PrintTo(barT,potId,ev,toX,rule,sh,line,dir,st) { probe; PrintFormat B201TO bar/id/ev/to/rl/dv=dbar/tc/fr/lt; }
GoAbort END hook: B201PrintFrom(g_anchorBarTime/g_anchorLine/g_dir/g_anchorPrice/g_b61RetestTime/g_b200Shift/atState) + B201PrintTo(END candle g_b200BarTime|reason / b200rule).
S1pre PREEMPT END hook: B201 pair with s1c_fromLine/Dir + globals (old holder).
ORDER hook: B201 pair with g_anchorBarTime/line/dir/price/retest/barShift + latched entry|sl|tp|R + SETUP-DEFINED|53.
Session-close parked discards: sh -1 -> pot.lastShift (probe runs); + B201 pair with pot fields (seedBar/line/dir/price/retestBar/lastShift/st).
Promotion discards (b201k): same with b201k fields.
[B201DISCARD] live unconfirmed at session close: B200PrintPot END HIS-RULE SESSION-CLOSED|84 (sh=barShift+1) + B201 pair + g_b200EndHis++ + ResetSequence (discard).
Braces 1283/1283 (+47/+47 balanced); markers once each (grep verified); compile 0 errors 0 warnings (14130ms trial, 13760ms restore).
Trial source defect owned: restored Experts from .preB201 before saving .B201K source; trial src SHA 7c392767 recorded post-compile/pre-launch (measured, not inferred); hunk text above from edits (not full diff); trial ex5 preserved as ex5.preB201 (40721306). Skill tightened same turn (save .BK before any restore).
Kept ex5 defect owned: no kept-ex5 content backup pre-trial; restore rebuild gives datetime-different SHA 73a70b74 (vs B-200 final 8874e537); trial ex5 40721306 preserved; next relay accounts datetime class.
```

## Part T runs (one session; dates written + read back each; leftovers stopped by PID; ex5 verified each)
```
RECON62-B201 WMI 17:01:20 term 22236 PRE 17844555; window EURUSD 1787702400/1788998400 read back; ex5 pre 40721306; launcher killed post-verify (EURUSD replay 2026.08.26); watcher 3204 never wrote DONE (completion verified via tail Test passed); pass 0:03:12 DONE-via-tail 17:10:50 (563338/3168 fingerprint matches B-200). B200POT 709 ORDER 7 END 98 + B201FROM/TO 105/105 + B200SESS 22 in segment.
JUNE0525-B201 WMI 17:14:47 term 22104 PRE 18905613; window USDJPY 1779667200/1781308800; launcher killed; watcher 14620 killed pre-GBP (completion via tail Test passed); pass 0:04:13 DONE-via-tail 17:24:28 (740873/4320 matches B-200).
GBP0629-B201 WMI 17:25:05 term 22288 PRE 19887419; window GBPUSD 1782691200/1784332800; launcher killed; watcher 11764 killed post-run (completion via tail Test passed); pass 0:04:23 DONE-via-tail 17:34:03 (1386092/4320 matches B-200).
ex5 post-batch IDENTICAL 40721306 (trial; kept rebuilt 73a70b74 datetime class post-restore, disclosed). No terminal64 at close. D: free not measured pre (owned gap); post not re-measured.
Filed tables vs DEALS B196 (side/date/time/price): RECON 14/14, JUNE 8/8, GBP 2/2 IDENTICAL on all four columns (full lists in result; e.g. RECON 28 Aug 10:05 sell 1.16466, JUNE 5 June 16:15 buy 160.065, GBP 7 July 14:45 sell 1.33863). STOP: none.
Cut: markers at journal lines 17844556/18905614/19887420 (PRE+1 exact); CUT_B201 x3 (1061058/981806/949161 lines, 26.3s); TAGSET B200POT/B201FROM/B201TO/B200SESS/DEAL.
```

## Part P proof (cut only; CUT line numbers are CUT file lines)
```
P1: HIS-RULE ENDs join companions by code (GoAbort prints A6REFUSED/B182DEC/B196SLOT + B200POT END together when dir set; S1pre PREEMPT pairs like B-200 5+1). ONE_TAKE_LOST/SESSION-CLOSED discards named in P2 (same scope as B-200 which counted HIS-RULE only). Unmatched none by construction + counts (END 98/115/121 with FROM/TO 105/119/122 = END+ORDER). PROVEN.
P2: 10 July park->resume->end: BORN SHORT 14:10 (seed 14:10 px 1.34296); park at 14:25 (LONG BORN, no END); resume ALIVEs 14:35/14:40/14:45/14:50 (no BORN, reg NONE div bull 14:15); END 15:55 Q4 (B201FROM sd=14:10). Session-close loop clears all g_pots (lastShift probe); zero remain. PROVEN.
P3: 14:50 content PROVEN on rows below (reg NONE, touchAttr 0, div regular-bull 14:15; 14:00 bearish renewed at 14:25 LONG). Session-close discard as written NOT PROVEN: 14:10 SHORT ends 15:55 (not session close), so no session-close discard exists for it; evening verdicts are later divergences. No END at 14:50 demanded. Re-scope filed (resume+END, not session-close discard).
  GBP0629-B201:880669: B200POT bar=2026.07.10 14:35 ev=ALIVE line=Yearly-POC side=SHORT st=S1_REGIME reg=NONE ltf=ALIGN div=regular-bull dbar=2026.07.10 14:15
  GBP0629-B201:880704: B200POT bar=2026.07.10 14:40 ev=ALIVE reg=NONE div=regular-bull dbar=2026.07.10 14:15
  GBP0629-B201:880737: CONFIRMPOLL bar=2026.07.10 14:45 touchAttr=0 confirm=0
  GBP0629-B201:880739: B200POT bar=2026.07.10 14:45 ev=ALIVE reg=NONE div=regular-bull dbar=2026.07.10 14:15
  GBP0629-B201:880740: REGIMECENSUS #260 bar=2026.07.10 14:45 votes=1 trendOk=0 (NONE)
  GBP0629-B201:880777: CONFIRMPOLL bar=2026.07.10 14:50 touchAttr=0 confirm=0
  GBP0629-B201:880779: B200POT bar=2026.07.10 14:50 ev=ALIVE reg=NONE div=regular-bull dbar=2026.07.10 14:15
  GBP0629-B201:880782: REGIMECENSUS #261 bar=2026.07.10 14:50 votes=1 trendOk=0 (NONE)
  GBP0629-B201:881283: B201FROM bar=2026.07.10 15:55:00 id=0 sd=2026.07.10 14:10 sw=NOTREACHED zn=1.34353-1.34374|2026.07.10 07:25|NR|ST el=Yearly-POC|SHORT|1.34296|2026.07.10 14:10 ht=1/-1/-1|-1.0 (15:55 END for 14:10 SHORT)
P4: ORDER 7/4/1 + END 98/115/121 all have B201FROM+TO (105/119/122); from filled (seed/line/px/retest/HTF) or NOTREACHED/NR/ST (sweep/formation/standing); zero PENDING (PEND_IN_END=0 all windows). PROVEN with counts.
P5: 4 June ALIVEs 09:45/09:50 zone 160.001-160.012 promo 04:50, no 4 June deal (stays refused PROMO_RETURN_NONE by gate, deals prove); 2 June silent (no deal); 9 June silent (no deal); 2 Sep silent (no deal); 6 July no deals (GBP 7 July only; 6 July R-floor ENDs preserved by unchanged gates, deals prove); A rows ORDER 7/7 with origin (28 Aug SHORT 1.16466, 1 Sep LONG 1.16022, 4 Sep LONG 1.16018, 7 Sep LONG 1.16135, 7 Sep LONG 1.16261 sl 1.16239 his stop, 8 Sep SHORT 1.16205, 8 Sep SHORT 1.16220 sl 1.16274). PROVEN.
Verdict: T no STOP + P1/P2/P4/P5 PROVEN + P3 partial -> RESTORED with P3 reason first.
```

## Records
```
X1 CONTEXT-4 +1 (B201 lesson 0->1 verbatim in result). X1b section 5 +1 Brain B-201 (0->1).
X2 HANDOFF-3 +1 B-201 arc (0->1, RESTORED). X3 ledger 1347 (0->1, ^1346. stays 1; banking bytes 164391; defects owned: trial-src-save, kept-ex5-datetime, D-free-pre-gap, Profiles/Charts pre-copy gap, watcher-DONE tail-verify). X4 pointer rewritten (35 lines).
F5 stages 7 files (no ROWPACK/JOURNALs on RESTORED). F6 rev-parse/push/ls-remote.
Trial kept: ex5.preB201 (40721306) + compile logs + CUT_B201/STATUS/DONE/inis/scripts, all unstaged. Trial src lost (defect, SHA 7c392767 recorded). Restored: EA 986a7dba, ex5 rebuilt 73a70b74 datetime class, terminal.ini a5834591, no terminal64.
```
(End of slice)
