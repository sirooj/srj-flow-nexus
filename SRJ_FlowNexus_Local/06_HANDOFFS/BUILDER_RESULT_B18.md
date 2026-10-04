# BUILDER RESULT B-18 - 5m-bias entry refusal tried once: the run reproduced j2, not j3, so the edit stands unproven; RESTORED (trial record)

Trader summary: only your 8/28 short survived this run (entry 1.16466, body-break exit 1.16439, same as before). The 1 Sep 09:55 long is gone - but not by the new rule: on this disk the book kills it earlier at the R-gate, exactly like the old j2 run. Your 9/4 and 9/8 takes did not come back either. Verdict RESTORED - the disk is back to F04AF9C3, verified. The load-bearing finding: j3 cannot be rebuilt from this disk at all. j3 was the B-15 trial build with the taken-line skip inside; that skip was reverted right after (B-15 RESTORED), so the disk never contained it. The relay's pass mark (j4 equals j3 minus the 9/1 long) assumed the disk runs like j3 - it cannot. My 13-line refusal compiled clean and broke nothing, but it fired zero rows all run: every death happened upstream of it. The 1 Sep setup this relay targets only forms with the skip in - that is B-19's decision now, carried below.

## Part 0/A1 - start gate
- A1 git log -1: b6accc3 on builder/B-17 (as expected). git status --short line count: 61 (dirty tree preserved, nothing reset). Branch builder/B-18 cut from b6accc3.
- 0.1 remote note: origin is https://forge.mql5.io/BaitahsiroojW/mql5.git, NOT the GitHub URL the relay expects; the GitHub URL lives on the pre-existing `backup` remote (used for the F1 check and the GitHub push, as the operator ordered on B-17). No git-config change made.
- 0.2 read in order: AGENTS.md, srj-relay skill (E5713CDB, 50 lines), srj-strategy skill (2B76301A, section 11 verified present: 5M-BIAS-AT-ENTRY at line 139), pointer, RESULT_B17 (carried note read first), RESULT_B15 (trial procedure: RECON50_DEMO_USD.ini, 0:50:11, 563338 ticks, 3168 bars).

## Part A2/A3 - SHAs and backups
- A2 all pass, no STOP-A: EA F04AF9C3 (685444 B); EA.ex5 D7DEA923; HTFEngine D5FD5B06; FlowLogic.ex5 27B5F272; strategy 2B76301A (141 lines); relay E5713CDB (50); context 85D6F901.
- A3 backups, never committed: EA.mq5.preB18 F04AF9C3; EA.ex5.preB18 D7DEA923; relay SKILL.md.preB18 E5713CDB; context .preB18 85D6F901 (each equals its live file).

## Part P - pre-check from j3 (read-only)
- P1 every FIRED entry in j3 (A6FIRED rows): 8/27 17:00 SHORT Daily-POC NYAM entry 1.16524 (j3:7504); 8/28 10:00 SHORT Daily-VWAP LONDON (j3:8599); 9/1 09:50 LONG Weekly-VWAP LONDON entry 1.16031 (j3:13994); 9/4 15:55 LONG Yearly-POC NYAM (j3:23658); 9/7 16:40 LONG Weekly-POC NYAM (j3:27437); 9/8 16:55 SHORT Monthly-POC NYAM (j3:30426).
- P2 UJPROBE ltf of the fire pass (closed M5 bar the fire read): 8/27 17:00 ltf=-1.0 ALIGNED (j3:7326); 8/28 10:00 ltf=-1.0 ALIGNED (j3:8500); 9/1 09:50 ltf=-1.0 AGAINST (j3:13912); 9/4 15:55 ltf=+1.0 ALIGNED (j3:23475); 9/7 16:40 ltf=+1.0 ALIGNED (j3:27323); 9/8 16:55 ltf=-1.0 ALIGNED (j3:30333).
- P3 decision: the 1 Sep 09:55 LONG is the only AGAINST row -> SITE = the single send point where all entries converge (LogSignal, EA 10620; A6Fired/SIGNAL/managed snapshot all follow it; UJCONFIRMCARRY and CONFIRM_PREBIND both fall through to it).

## Part B - the edit (one hunk, +13 lines, 12300 -> 12313)
- B1 SITE raw before editing (EA 10620-10621): `LogSignal(tpTarget, tpR, slRef, slMode, divKind);` then `if(InpDebugLog) A6Fired(barShift, tpTarget, tpR, slRef, slMode, divKind);   //--- [A6-HOOK] (ii)`. (A first edit mis-deleted the A6Fired line; owned and repaired same turn - the filed diff below proves the A6Fired line intact.)
- B2 inserted before LogSignal, after all existing gates (R-gate ABORT_TP_RR_FAIL sits above at EA 10584, so R-deaths keep their own attribution):
```
       //--- [B-18 5M-BIAS-AT-ENTRY] his rule, strategy skill section 11, W3 + W5 (2026-10-04): no entry against the 5m structure bias at the entry open; a flip counts from the breaking candle's close = next open.
       {
        bool al5 = false;
        double al5ltf = EMPTY_VALUE;
        bool al5ok = ReadFlow(FL_BUF_LTF_BIAS, al5ltf, 1) && CheckLtfAlign(1, g_dir, al5);
        if(al5ok && !al5)
          {
           if(InpDebugLog) PrintFormat("[SRJ-EA] UJ5MENTRY_REFUSE bar=%s dir=%s anchor=%s ltf=%s", TimeToString(iTime(_Symbol, PERIOD_CURRENT, 1), TIME_DATE|TIME_MINUTES), DirName(g_dir), AnchorStr(), DoubleToString(al5ltf, 1));
           GoAbort(ABORT_LTF_MISALIGN, g_state);
           return;
          }
        if(!al5ok && InpDebugLog) PrintFormat("[SRJ-EA] UJ5MENTRY_UNREAD bar=%s dir=%s", TimeToString(iTime(_Symbol, PERIOD_CURRENT, 1), TIME_DATE|TIME_MINUTES), DirName(g_dir));
       }
```
- B3 edited block at EA 10620-10634 (real numbers, read back). STOP-C check: the edit IS his section-11 rule, uses the existing LTF_MISALIGN abort path (GoAbort, EA 6600-6634: ABORT row + A6REFUSED predicate + shadow record), no buffer, no tolerance, no new input. New EA SHA-256 3B710939B4007CB0FCD1DEC12ACA3484E6A13E4A28E8EB8A34EC224DE587FB87, 686369 B, 12313 lines. Filed diff preB18-vs-edited: exactly this one hunk, A6Fired line intact.
- B4 compile once (Dukascopy MetaEditor64, log 06_HANDOFFS/B18_EACOMPILE.log, uncommitted): `Result: 0 errors, 0 warnings, 7216 ms elapsed, cpu='X64 Regular'`. New EA.ex5 721F30CC22395BEE6A90AC7BB38292E74CED983899A9989F83CDD40D99EA9514 (453612 B). No STOP-B.

## Part C - one RECON62 run (j4 = RECON62-B18R1_JOURNAL.log, 9550597 B, 46719 lines, local unpushed)
- C1 tester exactly as B-15 (same RECON50_DEMO_USD.ini: Expert SRJ_FlowNexus_EA, Symbol EURUSD, Period M5, Model 4, Deposit 10000 USD, Leverage 100, InpDebugLog=true, InpMode=1, FromDate 2026.08.26, ToDate 2026.09.09; bench ticks Mode 4). [Tester] block raw (config terminal.ini during the run): Expert=Experts\SRJ_FlowNexus_EA.ex5, Symbol=EURUSD, Period=5, DateRange=3, DateFrom=1787702400, DateTo=1788998400, Execution=0, Deposit=10000.00, Leverage=100, TicksMode=4. Result: DONE PASSED, 0:58:13, 563338 ticks, 3168 bars (bench identical to B-15 to the digit), final balance 10061.88.
- Transparency: the first two launches ran the June window (relative /config path not applied; journal showed 2026.06.01) and were killed within minutes (PIDs 7692, 3408, my own launches); the third launch with the window set ran the full RECON62. No bench or source difference between attempts - only the window.
- C2 HTF debug printer: left OFF, no code change. inHtfDebugLog is an indicator input (FlowLogic 257, default false) that the EA never passes (iCustom hardcodes its params, EA 11179-11184); switching it on needs an EA or indicator edit. It gates Print calls only (SRJ_InDebugWindow is print-gating; the RunOne latch itself is unconditional), but it is unreachable without a code change.
- C3 terminal.ini [Tester] restored to June USDJPY (Symbol=USDJPY, 1780272000/1781308800), verified by independent read, pasted raw: Symbol=USDJPY, Period=5, DateRange=3, DateFrom=1780272000, DateTo=1781308800.

## Part D - grade (j3 vs j4, filed-trade table, dates first)
- 8/27 17:05 SHORT Daily-POC: j3 fired deal #2 at 1.16524, BREAK exit 1.16513 deal #3 / j4 R-refused R=0.19 on LIVE 1.16510, ABORT TP_RR_FAIL (j4:7374/7503/7513 - digit-identical to j2).
- 8/28 10:05 SHORT Daily-VWAP: j3 fired 1.16466, exit 1.16439 / j4 IDENTICAL (SIGNAL j4:8878, EXIT j4:9301, deal #3 close 1.16439).
- 9/1 09:55 LONG Weekly-VWAP: j3 fired 1.16031, SL exit 1.16001 / j4 gone - died at SLNONFIRE RR_FAIL R=0.89 (j4:14308, A6REFUSED TP_RR_FAIL j4:14310), never reached the new block (zero UJ5MENTRY rows run-wide).
- 9/4 16:00 LONG Yearly-POC: j3 fired, tp 1.16302, DAY_CLOSE exit / j4 absent (1.16302 appears in j4 only as his cited TP in a SEL55 row, j4:23854 - not booked, not hit).
- 9/7 16:45 LONG Weekly-POC: j3 fired, tp 1.16315 / j4 absent.
- 9/8 17:00 SHORT Monthly-POC: j3 fired, tp 1.16114, SL exit / j4 absent (1.16114 in j4 only as a 9/3 stop/zone value, never booked).
- Totals: j3 6 signals / 12 deals / balance 10101.97; j4 1 signal / 2 deals (open+close #2/#3) / balance 10061.88 (== j2 to the cent; j4's TPCENSUS winners are LIVE/taken lines throughout - the skip-absence signature).
- D2: 9/1 LONG gone yes; its UJ5MENTRY_REFUSE row does not exist (never got there); every other UJ5MENTRY_REFUSE/UNREAD row in j4: none - zero rows run-wide.
- D3: 9/4 at 1.16302 - no; 9/8 at 1.16114 - no.
- D4: no j4 trade is missing from j3 (only 8/28, present in j3) - no record-first search owed, no new question.
- D5: C2 left off - no UJDBG rows; E3 stays unmeasurable without a run. Observation only.
- D6 verdict RESTORED (9/4 + 9/8 did not hit to the digit; j4 differs from j3 by five trades, not one). Cause, in trader words: the comparison journal j3 was baked by a build this disk no longer has - B-15's taken-line skip was reverted right after its trial, so the 9/4 and 9/8 takes cannot form here and the 8/27 and 9/1 setups die at the old R-gate before the new rule is even met. My refusal itself is intact and compile-clean but unproven: it never got a setup to judge. Restored EA + EX5 from .preB18, SHAs verified (F04AF9C3 / D7DEA923), empty diff vs backup. No recompile (restored EX5 is byte-identical to the pre-trial build from the same source).
- STOP evaluation: STOP-A clean; STOP-B clean (compile 0/0, run PASSED - the two killed wrong-window launches were my own launches, reported, not a trial failure); STOP-C clean; STOP-D clean (no indicator/Include touch).

### Journal-code glossary (codes cited above, few words each)
- A6FIRED (SELECTED/FIRED): fire record. ALERT SRJ SIGNAL/EXIT: entry/exit alert. UJPROBE (ltf/m15/div): per-bar bias/div probe. TPCENSUS (winner/best/distPts/admitted): target census. UJ1R (POLL/FIRELOCAL/FIRE/PASS/FAIL): R check. SIDE1O_ELIGSTATE (slRef/rLive/livePass): eligibility. SLNONFIRE (RR_FAIL/wouldFire): no-fire. SUPPRESSED (HELD): holder kept. SIDE1H_WOULDPREEMPT/SIDE1D_BOTHDIRS: contention. SIDE1C_YIELD: holder switch. SIDE1R_RGATE (seedBiasAl): seed-eval link. SIDE1T_SEEDBIAS: seed bias verdict. SIDE1Q_CQDKILL/SIDE1W_CQDWINDOW/CQDRECHECK (divLatch): CQD gates. CQD DIV verdict: indicator divergence code. CONFIRMPOLL: confirmation terms. SEL52CTX: stop selection. UJPOISKIP: POI target skipped. UJDTTERMS/RETESTDIAG: retest diagnostics. SWINGDUMP: swing/bar dump. ABORT (TP_RR_FAIL/LTF_MISALIGN): abort + reason. A6REFUSED (predicate): refusal. A6SUPP: census row. STATE S1-S5: lifecycle. SIDE1F_WATCH: fire watch. SLEXTLOST: lost-signal check. ENTRY_TICKET: fill ticket. MTCLOSE/MTLIFE: close record/life record. UJ5MENTRY_REFUSE/UNREAD: this relay's new rows. UJM15ROW (m15time/m15vote): 15m vote. SEL55 (codedir/codeentry/hisentry/histp): selector vs his. ZONESHADOW: zone R print. UJPOOLCOV: pool coverage. XOBINPLAY2: zone in play. REGIMECENSUS: regime census. CQDRECHECK: CQD recheck. BIASCENSUS_FINAL/ZONECENSUS_FINAL/WS161_CENSUS: end censuses.

## Part F - lane text, files, push
- F1 relay skill: Reply-line ls-remote bullet appended. New SHA-256 08A045A391A49896B9B9BD76374B64BE19F646A8742978C0B8D90DF524CA2E2B.
- F2 planner context: section-3 four bullets (fresh sessions, banking answers, screenshots, missing branch) + section-2 CQD bullet appended. New SHA-256 0CA621294B03A924C948E78BABB7A1C58E6F8BE524863354A1650C65DDA979A5.
- F3 this file. F4 pointer updated (B-18 RESTORED; EA F04AF9C3 on disk, EA.ex5 matches; Next = relay B-19; resume block replaced per relay).
- F5 final disk state: EA F04AF9C3 (686369 B edited -> restored 685444 B, uncommitted; empty diff vs .preB18), EA.ex5 D7DEA923 matches it, HTFEngine D5FD5B06, FlowLogic.ex5 27B5F272, terminal.ini [Tester] June USDJPY (1780272000/1781308800). No terminal running (leftover idles reported by wrapper, never killed).
- F6 commit + push to builder/B-18 ONLY: BUILDER_RESULT_B18.md, BUILDER_SESSION_POINTER.md, .opencode/skills/srj-relay/SKILL.md, PROMPTQL_PLANNER_CONTEXT.md. EA, EX5, backups (.preB18), B18_EACOMPILE.log, STATUS/DONE files and j1-j4 stay unpushed. Then the F1 ls-remote check, pasted in the reply.

## Carried note (for the planner; B-19 per its plan)
- j3 is unreproducible from disk b6accc3 and from this restored disk: it was baked by the B-15 trial ex5 (taken-skip inside), reverted the same turn. Any B-19/B-20 pass mark written against j3's deal set (9/4 at 1.16302, 9/8 at 1.16114 present) needs the skip question settled first: either re-author the taken-skip (it was B-15's design, RESTORED over two extras) or re-baseline the comparison to j2/j4 (disk behavior: only 8/28 fires, balance 10061.88).
- The B-18 refusal (UJ5MENTRY_REFUSE at pre-LogSignal, EA 10620-10632 in the trial build, ex5 721F30CC) is intact on paper and compile-clean but run-unproven: zero rows in j4 because every against-or-missing setup died at older R-gates first. It kills nothing it should keep (the only j4 fire was ltf-aligned), but the 1 Sep 09:55 case it was built for cannot reach it without the skip.
- Run hygiene: two launches tested June (relative /config path not applied by the terminal) and were killed within minutes; the full RECON62 came from the window set in terminal.ini, restored to June USDJPY after. Bench identical to B-15 (563338 ticks, 3168 bars).
- Remote note: origin here is the MQL5 forge, not GitHub; GitHub presence goes through the pre-existing `backup` remote (F1 check run against the GitHub URL).

(End of file)
