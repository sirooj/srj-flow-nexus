# BUILDER RESULT B-20 - skip fixed, all six j3 takes re-proved, both refusals landed: KEPT (trial record)

Trader summary: your book is whole again. All four valid takes fire exactly as in j3 (8/28 short, 9/4 long to the 1.16302 target, 9/7 long to 1.16315, 9/8 short to 1.16114), and both invalid extras are gone, each stopped by its own new rule with its own journal row. The 1 Sep 09:55 long dies because the 5m bias was still bearish at the 09:55 open. The 8/27 short never forms because the Daily VWAP is back in the target race at 0.34R and the book refuses it below your 1R floor. Verdict KEPT - the build stays on disk, uncommitted. Balance reads 10194.64 against j3's 10101.97: the only difference is the two removed losing trades (informational - lot sizing can compound).

## Part 0/A - start gate
- A1 git log -1: 204d84d on builder/B-19 (as expected). git status --short line count: 72 (dirty tree kept, nothing reset). Branch builder/B-20 cut from 204d84d. Remotes: origin = MQL5 forge (credentials expired, unused); GitHub = pre-existing `backup` remote; no git-config change.
- Reads in order: AGENTS.md, relay skill, strategy skill (sections 2/5/6/8/10/11), pointer, RESULT_B19 (carried first, P1-P3, B1-B3), RESULT_B15 (skip design), RESULT_B17 (UjPoiTargetValid).
- A2 all pass, no STOP-A: EA F04AF9C3 (685444 B); EX5 D7DEA923; HTFEngine D5FD5B06; FlowLogic.ex5 27B5F272; relay skill 08A045A3 (51); strategy 2B76301A (141); context 0CA62129.
- A3 backups, never committed: EA.mq5.preB20 F04AF9C3; EA.ex5.preB20 D7DEA923.
- A4 ls-remote GitHub builder/B-19 returns 204d84d (verified). A5 no terminal running; terminal.ini [Tester] June USDJPY before the window was set.

## Part P - pre-checks (read-only)
- P1 hunk text: NOT found on disk (re-author path). Searched with hit/miss each: B-19 session transcript/logs (opencode tool-output dir holds only truncated grep outputs, no hunk text - miss); MetaEditor backups (none - miss); tester agent copies (none - miss); temp folders (none - miss); trial EX5 708A9313 (all EA.ex5 copies hash D7DEA923 or older E031179F/F3D3F240 - miss). Re-authored from RESULT_B19 Part B1 plus the B1 lookup change; B1 rules identical either way.
- P2 the 9/8 PD row, raw then plain: TPCENSUS #294 winner=PD best=1.16200 distPts=20 (j3r); row identity PD Asia-High side=0 level 1.16200, origin Friday 2026.09.05 (SIDE1Y_PDSESS 9/7 pdAsiaH=1.16200, j3r:27459; Monday 9/7's own Asia high is 1.16345 per SIDE1Y 9/8, j3r:30468, a different row). Closure per SrjHistPoolBuild (EA 12167-12169: PD rows ov=D-86400; EA 12189 closure=ov+86399): 2026.09.05 23:59:59. Exact-time lookup: miss (no M5 bar opens at :59) - this was B-19's keep. Containing-bar lookup (exact=false: nearest bar with open < time): the 2026.09.05 23:55 bar. Scan range per B-19 bounds (closure bar excluded, decision-bar end kept): first bar 2026.09.08 00:00 through the 9/8 16:55 decision bar. Extreme: highest wick high side; first bar strictly beyond 1.16200 certified on record: the 9/8 09:05 bar, swing high 1.16359 (SWINGPICK SH=1.16359 atShift=3, j3r:28433; corroborated by the 09:05 SEL52 rung px=1.16359 and the machine's own j6 UJTAKENSKIP takenBy=2026.09.08 09:05 wick=1.16359). Sources: j3r printed bars + SrjHistPoolBuild text, read-only.
- Plain line: taken YES, by the 9/8 09:05 bar (high 1.16359 strictly above 1.16200), after closure, before decision. Go on, no STOP-P.
- P3 closures audit, raw: EA 12171-12174 (`lv[0/1]` LIVE with `ov[0/1] = D`; `lv[2/3]` PD with `ov[2/3] = D - 86400`) and EA 12189 (`out[n].closure = ov[r] + 86399`). Plain lines: a LIVE row's closure is origin-day 23:59:59 - arithmetically NOT on a 5m bar open (against the relay's expectation; reported as found). A PD row's closure is likewise origin-day 23:59:59 - not on a bar open (as expected). Yet B-19's exact lookup demonstrably resolved LIVE rows (j3r skipped the LIVE 1.16510 on 8/27 and LIVE 1.16052 on 9/1) while missing this PD row - mechanism unexplained on record; B1 makes the lookup uniform (containing bar, never miss on covered history) and the j6 run decides. It did (B4 PASS below).
- P4 gap half of W1 ("only when the VWAP jump or change the bias from the break of candle body closure"), record-first in his words: skill (OWN-SOURCE-EXCLUSION 9/27 names "the gapped scenario" without defining it; W1/W5 state the gap case without a threshold); journal (only the banked row 302 quoting W1); ledger (items 1159-1160 quoting W1, no definition); findings (EXITMODEL-1 Q5: break through the POC gap must be body; 0828-FVG: "D POC gapped and made price..."; SEP7: "D-POC gapped down"; 6/11 rule repeats "the gapped scenario" - all name it, none defines what counts as a VWAP jump); spec (no Part-A spec file on disk under 03_SPECIFICATIONS to search - recorded). Two patterns per term used (case-sensitive + case-insensitive counts taken for jump/gap/gapped/outrank/"higher than VWAP"/hierarchy/nuance across skill/journal/ledger).
- Carried (no ruling found): no definition of a VWAP jump exists in his recorded words - no point threshold, no detection event. Places searched: strategy skill, his journal, the ledger, the findings (77-file sweep lines above), the spec (absent from disk). Nothing is built for the gap half (sections 6/8 forbid inventing a detector).
- P5 rule-conflict: S' = section 10 (+SWEEP-TEST-STRICT), R = section 11 5M-BIAS-AT-ENTRY, V = section 11 POC-OVER-VWAP-SCOPE. Clean, no STOP-C.

## Part B - build (spots pasted raw with real numbers before editing; located by text)
- B1 Hunk S' at the entry-side pool loop (EA 2569-2576 spot): kept every B-19 detail (decision-bar end, closure bar excluded, strict wick test both sides, equal touch not taken, no buffer, managed-side/census untouched); the one change is iBarShift exact=false (containing bar; keep + UJTAKENMISS only on -1, i.e. closure before available history). Two InpDebugLog rows in-hunk: UJTAKENSKIP (bar/src/side/level/closeBar/takenBy/wick) per skip, UJTAKENMISS (bar/src/level) per miss. Logging only, no trade logic.
- B2 filed diff .preB20-vs-edited (S' only): one region at the entry-side loop (two @@ groups, one contiguous edit, +30 lines), nothing else. Edited source 0BDF657D98129B7988F6BC5515E13D35E768C244FAD97E33E2C3F3C426BF8FFA, 687769 B, 12330 lines. Kept copy .B20S same SHA (never committed). Full diff pasted under B7 (S' portion identical).
- B3 compile 1: 0 errors, 0 warnings, 6342 ms (log B20S_EACOMPILE.log, uncommitted; 25s log wait after B-19's missing-log race). EX5 B64B9115A7E682416FFB292AB9D0ABF91C9FA901937EA94733C93EA498FF5B83 (454134 B). No STOP-B.
- B4 re-proof run j6 = RECON62-B20R0_JOURNAL.log (76878 lines, local unpushed): DONE PASSED, 0:55:12, 563338 ticks, 3168 bars (bench digit-identical), balance 10101.97 (== j3 to the cent). All six j3 signals digit-identical (A6FIRED + SIGNAL + EXIT rows): 8/27 SHORT tp 1.16322 R 2.73 exit 1.16513 (j6:12160-12234); 8/28 SHORT tp 1.16364 R 2.43 exit 1.16439 entry 1.16466 (j6:13413-13838); 9/1 LONG tp 1.16077 R 1.81 SL exit 1.16001 entry 1.16028 (j6:23239-23393); 9/4 LONG tp 1.16302 R 1.66 DAY_CLOSE 1.16093 entry 1.16018 deal #9 (j6:44632-46459); 9/7 LONG tp 1.16315 R 2.34 TP_TOUCH 1.16315 entry 1.16261 deal #11 (j6:51703-52092); 9/8 SHORT tp 1.16114 R 1.96 SL exit 1.16274 entry 1.16220 (j6:60012-60377). 9/8 check: TPCENSUS #294 winner=Yearly-POC best=1.16114 (j6:59961, as j3:30375); UJTAKENSKIP for the PD row raw: `bar=2026.09.08 16:55 src=PD side=0 level=1.16200 closeBar=2026.09.04 23:55 takenBy=2026.09.08 09:05 wick=1.16359` (j6:59950). UJTAKENSKIP run-wide 30340, UJTAKENMISS 0. PASS, no STOP-S.
- B5 Hunk R: B-18 block verbatim before LogSignal (EA 10650), R-gate above untouched, A6Fired line intact (verified in diff).
- B6 Hunk V: line count of the POC-over-VWAP line is exactly 1 (EA 2480); deleted it; own-source line and family test untouched.
- B7 filed diff .preB20-vs-edited, full raw (exactly three regions S'/R/V; +43 -1; nothing else):
```
@@ -2479,3 +2479,2 @@
     if(StringSubstr(ak, 0, ap) != StringSubstr(ck, 0, cp)) return true;
-   if(StringSubstr(ak, ap + 1) == "POC" && StringSubstr(ck, cp + 1) == "VWAP") return false;
     return true;
@@ -2570,2 +2569,3 @@
 //--- consumable only when READY for the election day; tie order session > pool > POI.
+//--- [B-20 Hunk S'] his rule, strategy skill section 10 TAKEN-LINE-NOT-A-TARGET (spec 3.7 L187): a session high/low already taken before the decision bar is never a booking target. The closure bar is the 5m bar containing the row's closure time; the scan starts at the bar after it through the decision bar. Strict wick test only: high side taken iff the highest wick high in the scan is strictly above the level; low side iff the lowest wick low is strictly below. An exact equal touch is not taken. No buffer, no points allowance (SWEEP-TEST-STRICT).
 if(SrjUjPoolConsumable(uj_dk))
@@ -2573,4 +2573,33 @@
     for(int uji = 0; uji < ArraySize(uj_pool); uji++)
+     {
+      bool uj_taken = false;
+      datetime uj_takeT = 0;
+      double uj_takeW = 0.0;
+      int uj_cb = iBarShift(_Symbol, PERIOD_CURRENT, uj_pool[uji].closure, false);
+      if(uj_cb < 0)
+        {
+         if(InpDebugLog) PrintFormat("[SRJ-EA] UJTAKENMISS bar=%s src=%s level=%s", TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES), uj_pool[uji].source, DoubleToString(uj_pool[uji].value, _Digits));
+        }
+      else if(uj_cb > barShift)
+        {
+         int uj_n = uj_cb - barShift;
+         if(uj_pool[uji].side == 0)
+           {
+            int uj_hb = iHighest(_Symbol, PERIOD_CURRENT, MODE_HIGH, uj_n, barShift);
+            if(uj_hb >= 0 && iHigh(_Symbol, PERIOD_CURRENT, uj_hb) > uj_pool[uji].value) { uj_taken = true; uj_takeT = iTime(_Symbol, PERIOD_CURRENT, uj_hb); uj_takeW = iHigh(_Symbol, PERIOD_CURRENT, uj_hb); }
+           }
+         else
+           {
+            int uj_lb = iLowest(_Symbol, PERIOD_CURRENT, MODE_LOW, uj_n, barShift);
+            if(uj_lb >= 0 && iLow(_Symbol, PERIOD_CURRENT, uj_lb) < uj_pool[uji].value) { uj_taken = true; uj_takeT = iTime(_Symbol, PERIOD_CURRENT, uj_lb); uj_takeW = iLow(_Symbol, PERIOD_CURRENT, uj_lb); }
+           }
+        }
+      if(uj_taken)
+        {
+         if(InpDebugLog) PrintFormat("[SRJ-EA] UJTAKENSKIP bar=%s src=%s side=%s level=%s closeBar=%s takenBy=%s wick=%s", TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES), uj_pool[uji].source, uj_pool[uji].side, DoubleToString(uj_pool[uji].value, _Digits), TimeToString(iTime(_Symbol, PERIOD_CURRENT, uj_cb), TIME_DATE|TIME_MINUTES), TimeToString(uj_takeT, TIME_DATE|TIME_MINUTES), DoubleToString(uj_takeW, _Digits));
+         continue;
+        }
       TpTargetUpdateBest(uj_pool[uji].value, dir, currentPrice, best, haveBest,
                          uj_pool[uji].source, uj_pool[uji].dayKey, uj_pool[uji].poolGen);
+     }
    }
@@ -10619,2 +10648,15 @@
           }
+       //--- [B-18 5M-BIAS-AT-ENTRY] his rule, strategy skill section 11, W3 + W5 (2026-10-04): no entry against the 5m structure bias at the entry open; a flip counts from the breaking candle's close = next open.
+       {
+        bool al5 = false;
+        double al5ltf = EMPTY_VALUE;
+        bool al5ok = ReadFlow(FL_BUF_LTF_BIAS, al5ltf, 1) && CheckLtfAlign(1, g_dir, al5);
+        if(al5ok && !al5)
+          {
+           if(InpDebugLog) PrintFormat("[SRJ-EA] UJ5MENTRY_REFUSE bar=%s dir=%s anchor=%s ltf=%s", TimeToString(iTime(_Symbol, PERIOD_CURRENT, 1), TIME_DATE|TIME_MINUTES), DirName(g_dir), AnchorStr(), DoubleToString(al5ltf, 1));
+           GoAbort(ABORT_LTF_MISALIGN, g_state);
+           return;
+          }
+        if(!al5ok && InpDebugLog) PrintFormat("[SRJ-EA] UJ5MENTRY_UNREAD bar=%s dir=%s", TimeToString(iTime(_Symbol, PERIOD_CURRENT, 1), TIME_DATE|TIME_MINUTES), DirName(g_dir));
+       }
          LogSignal(tpTarget, tpR, slRef, slMode, divKind);
```
- Source 964803F4FD452349D67FDC31A73A7B297D4BB93726FA69086DB0A60283AE74F8, 688599 B, 12342 lines. Kept copy .B20SRV same SHA (never committed). Disk source equals .B20SRV (verified).
- B8 compile 2: 0 errors, 0 warnings, 8560 ms (log B20SRV_EACOMPILE.log, uncommitted). EX5 7C46B16C035A9F19B936FD4899BEC0289AD82C8F4AF8B652B0FA6D7A3DC54994 (454336 B). No STOP-B.

## Part C - main run j7 (one)
- [Tester] block raw during the run (config terminal.ini): Expert=Experts\SRJ_FlowNexus_EA.ex5, Symbol=EURUSD, Period=5, DateRange=3, DateFrom=1787702400, DateTo=1788998400, Execution=0, Currency=USD, Leverage=100, TicksMode=4, Deposit=10000.00 (+ RECON50_DEMO_USD.ini: Model=4, InpDebugLog=true, InpMode=1, FromDate=2026.08.26, ToDate=2026.09.09).
- j7 = RECON62-B20R1_JOURNAL.log (77275 lines, local unpushed): DONE PASSED, 0:51:49, 563338 ticks, 3168 bars (bench digit-identical), final balance 10194.64.
- After the terminal exited, [Tester] restored to June USDJPY (Symbol=USDJPY, 1780272000/1781308800), verified by independent read. (One repair owned: a blind whole-file Symbol replace caught the USDJPY_RAW line; restored to USDJPY_RAW and verified; recents lines left at the terminal's own values.)

## Part D - grade j7 vs j3 (filed-trade table, dates first, then totals; deal numbers may renumber - compared by bar, side, prices)
- 8/27 17:05 SHORT Daily-POC: j3 fired 1.16524/BREAK 1.16513 / j7 NO FIRE. j7 17:00 pass: TPCENSUS winner Daily-VWAP about 1.16500 (R below 1, refused), ABORT TP_RR_FAIL, and no UJPOISKIP row for line=Daily-VWAP anchor=Daily-POC anywhere run-wide at that pass (the line is gone from UjPoiTargetValid). As expected.
- 8/28 10:05 SHORT Daily-VWAP: j3 entry 1.16466 exit 1.16439 / j7 IDENTICAL (SIGNAL j7:14047, EXIT j7:14470).
- 9/1 09:55 LONG Weekly-VWAP: j3 fired 1.16031/SL 1.16001 / j7 NO FIRE. Exactly one refusal run-wide: `UJ5MENTRY_REFUSE bar=2026.09.01 09:50 dir=LONG anchor=Weekly-VWAP ltf=-1.0` (j7:23802). As expected (this time the setup reaches S5 at R 1.81 and dies at the bias rule, not the R-gate).
- 9/4 LONG Yearly-POC: j3 entry 1.16018 TP 1.16302 DAY_CLOSE 1.16093 / j7 IDENTICAL (SIGNAL j7:45013, EXIT j7:46742).
- 9/7 16:45 LONG Weekly-POC: j3 entry 1.16261 TP_TOUCH 1.16315 / j7 IDENTICAL (SIGNAL j7:51952, EXIT j7:52092).
- 9/8 17:00 SHORT Monthly-POC: j3 entry 1.16220 TP 1.16114 SL 1.16274 / j7 IDENTICAL (SIGNAL j7:60186, EXIT j7:60377).
- Totals: j3 6 signals / 12 deals; j7 4 signals / 8 deals (4 A6FIRED). Balance 10194.64 vs 10101.97 minus deals #3 (8/27 BREAK exit 1.16513, small loss) and #7 (9/1 SL 1.16001, 30pt loss): directionally consistent (two losers removed), informational only.
- D2: UJ5MENTRY rows run-wide: the single REFUSE above; zero UNREAD.
- D3: every j7 take is in j3 (8/28, 9/4, 9/7, 9/8) - no search owed, no STOP-D.
- D4 observation: 9/1 17:35 LONG still missing (guard bear 16:50/16:55, j7:26702/26836); 9/7 09:20 LONG still missing (guard bear 09:05/09:10/09:15, j7:47319/47485/47651); 9/8 10:10 SHORT still missing (guard bull 10:05/10:10, j7:53928/54114). All three die on forming-15m reads (section 11, 15M-READS) - next relay's subject.
- STOP evaluation: STOP-A clean (8/28 identical); STOP-B clean (compiles 0/0, run PASSED, no declined take fired - A6FIRED count is exactly the 4 valids); STOP-C clean (9/4, 9/7, 9/8 digit-identical); STOP-D clean. No STOP-P (P2 taken). Verdict KEPT. B20SRV source + EX5 stay on disk, uncommitted; backups and copies kept.

### Journal-code glossary (codes cited above, few words each)
- TPCENSUS (winner/best/distPts/admitted): target census. LIVE/PD: pool rows (origin-day / previous-day extremes). UJ1R (POLL/FIRELOCAL/FIRE/PASS/FAIL): R check. SIDE1O_ELIGSTATE (slRef/rLive/livePass): eligibility. SLNONFIRE (RR_FAIL): no-fire. A6FIRED: fire record. ALERT SRJ SIGNAL/EXIT: entry/exit alert. MTSNAP/ENTRY_TICKET/MTEXIT/MTCLOSE/MTLIFE: election, fill, exit, close, life records. UJPOISKIP: POI target skipped. UJTAKENSKIP (src/side/level/closeBar/takenBy/wick): taken-line skip. UJTAKENMISS: lookup miss. CONFIRMPOLL: confirmation terms. SUPPRESSED (HELD): holder kept. ABORT (TP_RR_FAIL/LTF_MISALIGN): abort + reason. A6REFUSED (predicate): refusal. A6SUPP: census row. UJ5MENTRY_REFUSE/UNREAD: entry-bias refusal. UJPOOLCOV: pool coverage. SIDE1Y_PDSESS (pdAsiaH/pdLondonH/...): previous-day session extremes. SWINGPICK (SH/SL/atShift): swing extremes. SEL52 (px/bt/slot): stop-ladder rungs. S3INPLAY (barLo/barHi/close): zone bar print. EXITCENSUS (side/trigger/verdict/val): per-line exit census. UJPROBE (ltf/m15/div): per-bar bias/div probe. UJALIGN_PASS/NOMATCH (m15): 15m guard. SIDE1D_BOTHDIRS/SIDE1H_WOULDPREEMPT: contention. BIASCENSUS_FINAL/ZONECENSUS_FINAL/WS161_CENSUS: end censuses. XOB-PROMOCENSUS: indicator OB print. UJDTTERMS/CQDRECHECK: retest/CQD diagnostics. IDCHANGE: candidate identity.

## Part E - final disk state
- EA 964803F4FD452349D67FDC31A73A7B297D4BB93726FA69086DB0A60283AE74F8 on disk (688599 B, 12342 lines; == .B20SRV, verified), uncommitted. EX5 7C46B16C035A9F19B936FD4899BEC0289AD82C8F4AF8B652B0FA6D7A3DC54994 matches its source (compiled after the final edit; no edits since).
- HTFEngine D5FD5B06, FlowLogic.ex5 27B5F272 (re-verified at close).
- Kept copies, never committed: .preB20 EA F04AF9C3 / EX5 D7DEA923; .B20S 0BDF657D98129B7988F6BC5515E13D35E768C244FAD97E33E2C3F3C426BF8FFA; .B20SRV 964803F4FD452349D67FDC31A73A7B297D4BB93726FA69086DB0A60283AE74F8.
- terminal.ini [Tester] June USDJPY (Symbol=USDJPY, 1780272000/1781308800), read after the terminal exited.
- No terminal running (idle leftovers stopped; otherwise the next pre-flight refuses).

## Part F - files, push
- F0 relay skill: trial-discipline bullet appended (file-every-edit rule). New SHA-256 C3F3AE85F7B7CC487852FD83BA2BA4D74C21B01992E98F7525999F09F4547C73, 52 lines.
- F1 this file. F2 pointer updated (B-20 KEPT; disk SHAs + kept copies; Next = relay B-21).
- F3 commit + push to builder/B-20 on GitHub ONLY: BUILDER_RESULT_B20.md, BUILDER_SESSION_POINTER.md, .opencode/skills/srj-relay/SKILL.md. Unpushed: EA, EX5, .preB20/.B20S/.B20SRV, compile logs, j6/j7, STATUS/DONE files.
- F4 ls-remote check, pasted in the reply.

## Carried note (for the planner; B-21 per its plan)
- P1 result: B-19 hunk text not found on disk (S-EXACT missed everywhere) - re-authored from RESULT_B19 B1 with the single B1 lookup change; B1 rules identical either way. B-15's 8A20C79B source and 11E7E5B9 trial EX5 remain unfound anywhere.
- P2 rows and plain line: 9/8 PD row = PD Asia-High side=0 at 1.16200, origin Friday 2026.09.04 (closeBar 9/4 23:55 on the machine's own UJTAKENSKIP row), closure 2026.09.04 23:59:59; containing bar 9/4 23:55; scan 9/8 00:00 through 9/8 16:55; first strictly-beyond wick certified: 9/8 09:05 bar high 1.16359. Taken YES. (P2's pre-run proof named ov=9/5 from SIDE1Y reads; the machine row says ov=9/4 - the Friday Asia-high value recurred; the taking bar is after either closure, so the go/no-go stands as proven.)
- P4 outcome: no ruling found for what counts as a VWAP jump. His words name "the gapped scenario" (9/27) and "the POC gap" (W1) and describe gap-break exits (EXITMODEL-1 Q5, 0828-FVG, SEP7 chart read), but give no threshold or detection event. Places searched: strategy skill, his journal, the ledger, the findings, the spec (no Part-A spec file on disk). The gap half of W1 stays UNBUILT (no detector invented, sections 6/8).
- D3 searches: none owed (no j7 take outside j3).
- Owed to B-21: the three 15m-missing valid takes (9/1 17:35, 9/7 09:20, 9/8 10:10) with their killing rows above; j7 (77275 lines) and j6 (76878 lines) carry the full live-vote record for the last-closed-vs-forming comparison. Balance informational: 10194.64 vs 10101.97 (two losers removed).

(End of file)
