# BUILDER SLICE B-220 - raw rows (dead-holder release diagnostic, G2 NARROW-NEXT; under 600 lines)
Base: builder/B-220 cut at 6078225 (= B-219 head). Verdict G2 NARROW-NEXT RESTORED (P3-0618 3 of 6; R1 RECON 23 DEAD2/21 REVIVED EU 282/202; R2 0 zombies; T4 RECON 16/16 SAME EU 42vs44 NEW 18Jun GONE 28Jul+A2; 18Jun FIRES exit SAME; C silent; T7 restored).
## Start gate
```
log-1 6078225ba5e90dbcbab9817636748c429adc8b6d (backup exact; B-220 cut here; push via backup, never origin).
diff 6078225 EMPTY on 0.3 files + both skills + CONTEXT + HANDOFF + LESSONS + FIXPLAN. Status 762 (dirty tree preserved).
Disk SHAs (text LF-normalized): EA 7c392767/83ac8bde; Panels 4335f703; flow a8201128/c82f175e; OB 8bbf936b; Imbalance 568f4ce9; Bias 3b1d9d3d; State 80a466ac; POI 5AF5E035/E5CBE1A2 (case-only); SESS 16573a5b; tini c725e437 blessedB208. CUT_B218 (RECON 163599578 a8cbbf63 + EU 727546836 b5b71897). Ledger ^1366=1 ^1367=0 pre. No terminal64. Python 3.13.16 first. Tick history UNCHANGED (bases EURUSD 2026.hcc mtime 14:27 predates B-218 runs; only touch after baseline start is EURUSD 202610.tkc 23:20:15 = B-218 T2's own end; grade vs CUT_B218, no same-day baseline).
Pack-line verification (EU0525TD-B218K/2026-06-18_ALL.csv): 1006 SUPPRESSED 09:40 + 1011 B196BAR 09:35 + 1013 B200POT ALIVE + 1014 ADD Daily-POC + 1015 KILL FOMC-VWAP + 1317 SUPPRESSED 09:45 + 1321 CONFIRMPOLL confirm1 + 1322 B196BAR 09:40 + 1323 FRESHCOUNT + 1324 B200POT ALIVE + 1922 SUPPRESSED 09:55 + 2240 WINLINE KILL Daily-POC 10:00 + 2247 B182DEC ABORT 10:00 (all fileline=pack+1, header row 1).
```
## Part B (grep-first)
```
rules/18 kept-seed-alive count 1 -> ALREADY_BANKED. No new rule words.
```
## Part R (job_r123_b220.py, one pass per CUT_B218, no runs)
```
R1 DEADHOLDER2_B220.csv 528 rows (header + 528). RECON 23 DEAD2/21 REVIVED (44 = B-219 R5). EU 282 DEAD2/202 REVIVED (484). Strict JL-order: latest WINLINE OPEN/ADD/KILL for holder line+side with JL < SUPPRESSED JL.
18Jun R1 lines (DEADHOLDER2 file lines): 118 09:40 Daily-POC/FOMC-VWAP OPEN@2880385 REVIVED; 119 09:45 KILL@2881032 DEAD2; 120 09:55 FOMC-POC/FOMC-VWAP KILL@2881032 DEAD2; 121 11:05 SHORT/FOMC-POC KILL@2883834 DEAD2.
R2 30 entry fires (A1-A7 + every euro entry): 24 CLEAN + 6 CLEAN-NOWIN, 0 ZOMBIE-FIRE. First pass (bar-time window) showed 4 same-bar KILLs after FIRE (A7 both runs, 29Jun, 22Jul); strict JL window (JL < FIRE JL) clears all 4: the KILL prints after the FIRE row same pass, so at FIRE time the anchor was alive. A7 both runs CLEAN-NOWIN (no WINLINE seed->fire). R2 table in job_r123_b220.out.
R3 SEPARATOR_B220.csv 16 rows: A5 Y (38;39;388;389) TOUCHED; 27Aug Y (2;6;7;8;9;10;357;361;362;363;364;365) TOUCHED; 28Aug Y (14;15;369;370) TOUCHED; P3 Y (119) RELEASED-LONG; rest N UNTOUCHED (8Sep declined N).
```
## K2 raw spots (re-found by text; B-219 numbers confirmed exact)
```
WINLINE KILL LONG EA L2361-2368: test L2363 `if(g_wlLong[si][i] == k && c < L - EPS)` removes g_wlLong index; print L2367 KILL.
WINLINE KILL SHORT EA L2385-2392: test L2387 `if(g_wlShort[si][i] == k && c > L + EPS)` symmetric; print L2391 KILL.
SUPPRESSED holder EA L8887-8917 (pre-edit): `if(InpDebugLog && inWindow && g_state > ST_IDLE && ...)` + DetectPoiRetest census; print L8907 SUPPRESSED; heldPoi=g_lineCode[g_anchorLine] L8914. Print-only census; blocking is the singleton (g_state != IDLE). WinlineUpdate runs later same pass (L8971); IDLE admission L8975 seeds same bar after reset (replacement precedent L8634-8639).
```
## K3 hunk diff vs .preB220 (raw; +40/-0; b220_ lines 8903-8933 post-edit; one hunk)
```
--- EA.mq5.preB220
+++ EA.mq5.B220K
@@ -8896,6 +8896,45 @@
       PoiRetestResult t73_pr;
       if(DetectPoiRetest(barShift, t73_pr) && t73_pr.found)
         {
+         //--- [B220DH] dead-holder release (diagnostic, always restored): a setup
+         //--- whose anchor line died stops blocking a fresh retest. Death = the exact
+         //--- WINLINE KILL expression on the judged bar, or the anchor gone from the
+         //--- g_wl set on the holder side (killed, not re-added). No tolerance, no number.
+         bool b220_dead = false;
+         double b220_L = 0.0;
+         double b220_c = iClose(_Symbol, PERIOD_CURRENT, barShift);
+         double b220_EPS = _Point * 0.001;
+         int b220_k = g_anchorLine;
+         if(b220_k >= 0 && b220_c > 0.0 && ReadBuf1(g_hPoi, b220_k, b220_L, barShift) && b220_L != EMPTY_VALUE && b220_L > 0.0)
+           {
+            if(g_dir == DIR_LONG && b220_c < b220_L - b220_EPS) b220_dead = true;
+            if(g_dir == DIR_SHORT && b220_c > b220_L + b220_EPS) b220_dead = true;
+           }
+         if(!b220_dead)
+           {
+            int b220_si = WlSessIdx(sess);
+            if(b220_si >= 0 && b220_k >= 0)
+              {
+               bool b220_has = false;
+               if(g_dir == DIR_LONG)
+                 { for(int b220_i = 0; b220_i < g_wlLongN[b220_si]; b220_i++) { if(g_wlLong[b220_si][b220_i] == b220_k) { b220_has = true; break; } } }
+               else if(g_dir == DIR_SHORT)
+                 { for(int b220_i = 0; b220_i < g_wlShortN[b220_si]; b220_i++) { if(g_wlShort[b220_si][b220_i] == b220_k) { b220_has = true; break; } } }
+               if(!b220_has) b220_dead = true;
+              }
+           }
+         if(b220_dead)
+           {
+            if(InpDebugLog)
+               PrintFormat("[B220DH] bar=%s sup=%s/%s holder=%s/%s lineVal=%s close=%s released=1",
+                           TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES),
+                           DirName(t73_pr.isLong ? DIR_LONG : DIR_SHORT), g_lineCode[t73_pr.topLine],
+                           DirName(g_dir), g_lineCode[b220_k],
+                           DoubleToString(b220_L, _Digits), DoubleToString(b220_c, _Digits));
+            ResetSequence();
+           }
+         else
+           {
          s_t73_n++;
          (existing census body unchanged, now inside else; closing `}` added at branch end)
```
## K4 compile + keep
```
Braces pre 1283/1283 bal0 -> new 1294/1294 bal0 (+11 hunk's own, all closed). [B220DH] at 2 lines of one hunk (comment L8899 + print L8929); b220_ 18 lines all within 8903-8933: hunk appears exactly once.
Prose check (F1): the three barred words absent (0/0/0); query-mark count 1, sole occurrence the MQL5 ternary inside the F2-mandated raw diff paste above (kept raw per F2; not prose).
Compile compile_b220_ea.log: Result: 0 errors, 0 warnings, 15188 ms elapsed. New src 6f51bfcd (761183 B) ex5 51b63926 (518392 B). .B220K copies verify byte-equal before any run.
```
## T4 filed-trade tables (CUT JL = journal line in 1014/1015 log; full rows in job_grade_b220.out)
```
RECON62-B220D 16/16 ALL SAME (A1 #2, A2 #4, A3 #8, A4 #10, A5 #12, A6 #14, A7 #16; exits #3,5,7,9,11,13,15,17 SAME).
EU0525TD-B220D 42 vs 44: #2-9 SAME (26May,28May,4Jun,10Jun pairs); NEW #10 buy 18Jun 09:45 1.15256 0.64 (JL 2097415) + #11 sell 18Jun 10:00 1.15195 (JL 2097582); #12-21 SAME content as ref #10-19 (25Jun/29Jun/8Jul/15Jul/22Jul pairs, vols 1.57->1.56 etc. on sizing); #22-27 SAME by number (5Aug/17Aug/A1 pairs); GONE ref #20/#21 28Jul pair (sell 10:45 1.13689 / buy 11:25 1.13714) + ref #28/#29 1Sep A2 pair (buy 17:35 1.16024 / sell 17:51 1.15975); #28-43 SAME content as ref #30-45 shifted (2Sep/4Sep/A4/A5/A6/A7/22Sep/8Oct; A4 #32, A5 #34 exit 21:25 1.16239, A6 #36, A7 #38). No other NEW/GONE.
STOP check post-T4: compile clean, one hunk, ex5 51b63926 before/after both runs, windows (RECON from 2026.08.26, EU from 2026.05.25) correct -> no STOP. A break + no C fire = diagnostic answer (G2), not STOP.
```
## T5 windows (CUT = CUT_EU0525TD-B220D.log unless noted; JL + tag + bar payload; full day rows in ROWPACK packs)
```
18Jun 09:30-10:10: 2096743 [B220DH] bar=09:35 sup=LONG/Daily-POC holder=LONG/FOMC-VWAP lineVal=1.15233 close=1.15224 released=1; 2096748 CONFIRMPOLL 09:35 Daily-POC LONG confirm=0; 2096749 B196BAR 09:35 o1.15275 h1.15277 l1.15191 c1.15224; 2096750 ADD Daily-POC 1.15217; 2096751 KILL FOMC-VWAP 1.15233; 2096755 BORN LONG seed 09:35 Daily-POC px1.15217; 2097082 SUPPRESSED 09:40 Daily-POC held Daily-POC (self-key update); 2097086 CONFIRMPOLL 09:40 confirm=1; 2097089 B200POT ALIVE Daily-POC; 2097397 B182DEC 09:45 FIRE Daily-POC LONG latch1 div2 hidden dbar09:35; 2097398 A6FIRED 09:40 tp1.15766 sl1.15101 2SWING; 2097407/2097409 FRESHCOUNT HOLD; 2097415 deal #10 buy 09:45 1.15256; 2097420 ENTRY_TICKET; 2097459 B196BAR 09:45 o1.15254; 2097513 B196BAR 09:50 o1.15221 c1.15221; 2097568 B196BAR 09:55 o1.15220 h1.15222 l1.15188 c1.15195; 2097580 MTEXIT 09:55 POI_BODY_BREAK FOMC-POC 1.15218 entry1.15254 exit1.15195; deal #11 sell 10:00 1.15195; 2097633 B196BAR 10:00 o1.15195 (exit SAME as 10:00 open).
7Sep 14:50-17:00 EU: 3458069 [B220DH] 15:05 SHORT/Weekly-POC holder SHORT/Weekly-POC 1.16229/1.16221; 3458881 [B220DH] 16:05 SHORT/Weekly-POC 1.16249/1.16245; 3459037 [B220DH] 16:15 LONG/Weekly-POC 1.16249/1.16250; 3463206 CONFIRMPOLL 16:40 confirm=1; 3463209 ALIVE; 3464038 B182DEC 16:45 FIRE Weekly-POC LONG latch1 div2 hidden dbar16:30; 3464039 A6FIRED 16:40 tp1.16358 sl1.16239; 3464048 ORDER entry1.16261; 3464050 B201FROM sd16:15 (re-seed after 16:15 release still fires: div re-latched). RECON same 3 releases (JL 1006178/1006786/1006910), A5 SAME.
27Aug full NY EU: 3246127 09:40 SHORT/Daily-POC self 1.16541/1.16534; 3247152 10:00 SHORT/Daily-VWAP holder SHORT/Daily-POC 1.16541/1.16551; 3248363 10:35 self; 3249381 10:55 SHORT/Daily-VWAP holder LONG/Daily-POC; 3249637 11:15 SHORT/Daily-POC holder SHORT/Daily-VWAP 1.16549/1.16542; 3261375 18:20 SHORT/Daily-VWAP self 1.16500/1.16495; 3262409 18:45 LONG/Daily-VWAP self 1.16500/1.16500. RECON same 7 (JL 909974-915950). No deal change either run.
28Aug 15:30-17:00 EU: 3289340 16:05 LONG/Daily-VWAP self 1.16463/1.16472; 3289485 16:15 SHORT/Daily-POC self 1.16451/1.16451 (+14:30/15:00 self-key earlier). RECON same + 17:20/17:40/18:05/18:15 Yearly-POC churn (JL 928717-929804). No deal change; C 16:25 stays silent.
1Sep (A2 break) EU: 3348178 [B220DH] 17:00 LONG/Monthly-VWAP self 1.16007/1.16012 + re-BORN 17:00 (3348191); 17:30 confirm=1 stuck S1 (3348555/3348558 FRESHCOUNT HOLD); 17:35 confirm=0 (3348620, no S5, no B177HZ, no FIRE); 3348679 [B220DH] 17:40 LONG/Weekly-VWAP holder LONG/Monthly-VWAP 1.16009/1.16001 + BORN Weekly-VWAP; 3348763 [B220DH] 17:45 SHORT/Monthly-VWAP self + BORN SHORT; evening SHORT arms S4 never fires. Baseline: 4181654 B177HZ rt16:50 xobWin1.0 PASS; 4182397 B182DEC FIRE; 4182398 A6FIRED (buy 17:35 1.16024). Mechanism: 17:00 reset wiped div-latch/rt (B218K FIRE latch1 div2 hidden dbar17:15 never re-latches in B220D).
28Jul (break) EU: 2638734 [B220DH] 10:25 + 2639851 10:35 SHORT/Weekly-POC holders; 10:45 Daily-VWAP SHORT confirms (2639935 confirm=1) reaches S5 then 2639975 B177HZ rt=10:35 gapTouch=0.0 xobWin=0.0 HISZONE_NONE; 2639979 B182DEC ABORT HISZONE_NONE. Baseline: 3441468 B177HZ rt=10:10 gapTouch=1.0 PASS; 3442047 FIRE; 3442048 A6FIRED (sell 10:45 1.13689). Mechanism: resets moved rt 10:10->10:35 (gapTouch 1.0->0.0).
```
## T6-T8
```
A1 SAME both; A2 RECON SAME / EU BREAK (GONE buy 1Sep 17:35 1.16024 + exit); A3 RECON SAME (EU n/a both); A4/A5/A6/A7 SAME content both (EU renumbered). C rows: no NEW fires (only NEW = 18Jun pair); silent stay silent; 10Jun/25Jun/22Jul identical to baseline. 18Jun FIRES entry 09:45 1.15256 (ref open 1.15254, +2 fill) exit 10:00 1.15195; exit check SAME (10:00 open 1.15195; 09:55 o1.15220 above FOMC-POC 1.15218, c1.15195 below it and Daily-POC 1.15210 per rules/43 L19 + spec 5.1).
T8: G1 needs A SAME + C silent + 18Jun fires (A2 breaks) -> no. G3 needs 18Jun silent (fires) -> no. G2 NARROW-NEXT: 18Jun fires but A2 breaks, C silent; next = narrower reading on A2/28Jul rows (carry retest-time/div-latch across release, or release only off-key holders).
```
## X records
```
CONTEXT sec5 +1 B-220, sec4 P3-0618 B-220 G2 (7268 B). HANDOFF 3a B-218-B-220 open 3 of 6 G2 + 3b drop B-210 add B-220 keep10 (5122 B). FIXPLAN F8 State B-220. Ledger 1367 B220-EU-P3-DHDIAG (^1367=1). Pointer P3 3 of 6, Next narrower reading, .B220K named (4723 B/35 lines). LESSONS +1 B-220-RESET-WIPES-PROVENANCE (156 chars), B-67 folded to ARCHIVE/LESSONS_ARCHIVE_B220.md (19914 B).
```
## Size gate (READ_MAP files; caps pointer 6000/35, result 12000, slice 20000/600)
```
pointer 4723/35 PASS; result 6766/16 PASS; slice 13683/117 PASS (this file); CONTEXT 7268 PASS; HANDOFF 5122 PASS; LESSONS 19914 PASS (fold applied); FIXPLAN ~11700 PASS; SEPARATOR_B220 917 PASS; DEADHOLDER2 528 rows (pack-exempt, filed F2b) PASS; READ_MAP rewritten below. Strategy max + relay + READ max per READ_MAP.
```
## Timing + final disk + housekeeping
```
Wall (anchors *): gate+reads+R ~20m est; K + compile 15188ms *; T1 *23:59:07-00:04:23 (~5m: window+replay verify, launcher killed, watcher DONE); T2 *00:07:15-00:32:27 (~25m: 0:24:08 replay, launcher killed, watcher DONE, terminal stopped by PID); cut ~3m (RECON 1048624 lines 46 B220DH; EU 3240380 lines 465 B220DH marker 1015:4288984); grade+T5 ~15m est; X + packs ~15m est; push/filing follow.
Final disk: RESTORED no edit (EA 7c392767/83ac8bde; Panels 4335f703; flow a8201128/c82f175e; OB 8bbf936b; Imbalance 568f4ce9; Bias 3b1d9d3d; State 80a466ac; POI 5AF5E035/E5CBE1A2; SESS 16573a5b; tini c725e437; Charts 25 files). .B220K on disk unstaged (src 6f51bfcd ex5 51b63926). CUT_B218 + B220D cuts in 00_CURRENT_WORKING (unstaged, current trial). No terminal64. No trading change stands.
Housekeeping: keep CUT_B218 (kept baseline) + CUT_B220D pair (current trial); F7 delete nothing else (no prior trial cuts of B-220 exist).
```
(End of slice)
