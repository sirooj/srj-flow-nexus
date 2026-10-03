# PACKET P-RECON78-UJ-EXEC-1 v2 - June UJ broker-target synchronization and remaining valid entry misses

Status: v2 DRAFT for page-only review by Sonnet and GLM. This is a CONTINUE of the June UJ review after the completed RECON78-V26-UJ run. No EA edit, build, tester run, live action, or deployment is authorized by this packet. The prior one-run grant has been consumed. Council reviews implementation scope and acceptance; operator strategy rules remain governing.

## 1 - Aim and scope
Diagnose why the June 5 NY USDJPY position remained open to its original broker stop after its internal target was retargeted at the NY session close; why the registered 16:15 LONG was missed while a later 16:55 LONG was executed; and why the registered June 11 NY 14:40 LONG was suppressed behind an equal-tier opposite SHORT whose pending 5m-flip abort was applied after suppression. Propose narrow implementation corrections and future row-level acceptance that preserve actual execution, entry timing, session election, and invalidation rules.

## 2 - Authority and unchanged pins
The audited register is `SRJ_FlowNexus_Local/06_HANDOFFS/BUILDER_REGISTER_VALID_TRADES.md`: UJ valid misses are 5 June London SHORT 09:45, 5 June NY LONG 16:15 with Old high 160.723 (April-30th day high), and 11 June NY LONG 14:40. Its section C lists invalid controls. Later operator rules in `.agents/skills/srj-strategy/SKILL.md` govern: one valid setup per pair per session; same-session contention resolves to one candidate, with a non-firing holder expiring rather than a permanent veto; cross-session trades remain independent; one confirmation then next-open entry; the 5m structure-bias flip kills the potential before confirmation; June 11 is the 14:35 retest+confirmation and 14:40 open entry, with 14:45 post-entry; floating trades may retarget to a closed NY session high; POC supremacy and no own-origin target; alert-only, no live orders.

## 3 - Completed run identity
RECON78-V26-UJ completed PASSED on USDJPY M5, tester window 2026-06-01 00:00 through 2026-06-13 00:00, InpDebugLog=true and InpMode=1 (tester simulation). Source SHA-256 `E80FF0C24149AB0946EB6A4341C0503A79BFE82E9843867CEF0DBA89BF587BBC`; EX5 SHA-256 `DDA3257042354F0BCCB816FB52E7B78E3E47F323F54A29DD54DC0441F5E1B705`; archived journal `SRJ_FlowNexus_Local/06_HANDOFFS/RECON78-V26-UJ_JOURNAL.log`, 36,760 lines. This is simulated tester evidence only.

## 4 - Entry and broker fill evidence
The June 5 NY alert at 16:55 was LONG, Daily-POC, entry deal #6 at 160.120, SL 159.726, broker TP 160.723. The 16:15 register row was not entered. At 16:05 the 16:00 Daily-POC LONG candidate was emitted with `UJPROV` printed `reseedBar=1970.01.01 00:00`, `reseedDir=0`, and `exempt=0`, followed by `S2SEEDBIAS_KILL` and `ABORT reason=SEEDBIAS_REFUSED`. At the later 16:45 retest the path advanced and produced the 16:55 signal. The early refusal is the observed proximate cause; this packet does not relax the operator's 5m-flip kill.

## 5 - Internal retarget and modeled exit
At the first bar outside the NYAM entry-session run, the log says `UJRETARGET bar=2026.06.05 19:00 dir=LONG old=160.723 sess=2 tp=160.298 seq=3`. The internal managed-trade model later prints `MTEXIT bar=2026.06.05 19:15 reason=TP_TOUCH` with `exit=160.298` and `MTLIFE` with `verdict=TP_TOUCH`, `closePx=160.298`.

## 6 - Actual tester deal contradicts the modeled exit
No broker TP modification or broker-position close appears for the NY retarget. Actual tester deal #6 retained its original TP 160.723 and SL 159.726; on 11 June 22:30:51 it was stopped, deal #7 at 159.725. Thus the internal MTEXIT/MTLIFE describes a simulated TP_TOUCH, but the actual executed position did not exit there. User's observation that the NY trade did not exit on the closed-session high is confirmed by actual deals. The result file must grade actual deals as the execution outcome, not the internal model row.

## 7 - Source mechanism
`Experts/SRJ_FlowNexus_EA.mq5` lines 11912-11923 update only `g_mtrade.tpRef` after `UjClosedSessionTarget` returns the tighter closed-session extreme. Lines 12036-12043 mark the managed trade closed and choose TP_TOUCH price. Lines 12052-12061 call `MtCloseBrokerPosition` only for `MT_EXIT_POI_BODY_BREAK` or `MT_EXIT_DAY_CLOSE`; TP_TOUCH and SL are explicitly broker-owned and no `PositionModify` synchronizes the revised TP. Entry send at lines 10804-10806 passes the original `tpTarget` to Buy/Sell. The source therefore predicts the observed split: model target 160.298, real broker TP 160.723.

## 8 - Retarget rule boundary
The established rule is a floating trade may retarget to its closed NY session high. This run's NY entry session closed at the 19:00 bar; the code calculated 160.298 from that session instance and its internal model exited at the first later TP touch. The unresolved implementation question is how to carry the revised target to the actual tester position while preserving broker-owned SL/TP handling and exact fill semantics. Do not reinterpret the rule as an immediate market close at session close.

## 9 - Q1 verdict required: actual execution follows retarget
Each seat must return exactly one Q1 verdict: CONFIRM / OBJECT / DISCREPANCY. Evaluate the source diagnosis in sections 6-8 and recommend the narrowest code path that makes the actual tester deal honor the revised 160.298 target. Ask A: identify the required execution action and its ordering relative to retarget/touch evaluation (including whether broker TP modification or a managed close is necessary). Ask B: name an acceptance predicate that separately proves (i) internal retarget value, (ii) broker position TP update or close request accepted, and (iii) actual deal exit at the revised level, while retaining unchanged SL behavior. State assumptions and any code sites to inspect.

## 10 - Q2 verdict required: 16:15 admission miss
Each seat must return exactly one Q2 verdict: CONFIRM / OBJECT / DISCREPANCY. Evaluate the observed 16:05 `SEEDBIAS_REFUSED` at the 16:00 LONG Daily-POC candidate versus the registered 16:15 LONG, and the later 16:55 actual take. Ask A: identify the narrowest permitted implementation investigation or correction for this miss without weakening the 5m-flip-kill rule, confirm-once/next-open timing, or invalid-control behavior. Ask B: specify the row-level acceptance that must demonstrate the 16:15 valid take is admitted for its own reasons, the 8 June invalid SHORT stays silent, and no 16:55 duplicate/later substitute is miscounted as the 16:15 row. If evidence does not establish a safe edit, say what remains unproven; do not invent a strategy rule.

## 11 - Q3 verdict required: 11 June NY 14:40 valid LONG held behind a non-firing candidate
The 51-line audited register row is 11 June New York USDJPY LONG, Daily-POC anchor, owed at the 14:40 open: `| 3 | 11 June New York USDJPY, entry owed 14:40 open | LONG | Daily-POC (= anchor) [HIS A2 settled] | RECON78: LONG retests at eval bars 14:20/14:25/14:30/14:35 suppressed behind equal-tier opposite SHORT S4_ARMED holder; at pass 14:40:22 (eval 14:35) SHORT then LTF_MISALIGN-aborted | Current proximate blocker is same-session non-firing-holder veto. Prior-row correction: the later RECON63 refutation (BUILDER_FINDING_USDJPY-MISSES.md line 85) says zero freshness involvement; RECON71 later records a distinct VWAP 160.522 / R 0.11 rejection (line 123). Both are prior-run paths, not the RECON78 decision row. HIS rule: 14:35 retest+confirmation, FVG irrelevant post-flip |`. The settled operator frame is 14:35 retest plus confirmation, entry at 14:40 open 160.524; the 14:45 bar is post-entry. The one-take-per-session rule requires same-session contention to resolve to one candidate, with a non-firing holder expiring and never becoming a permanent veto. The 5m structure-bias flip kills a potential before confirmation.

In RECON78, the 14:10:00 pass (evaluated 14:05 bar) records a SHORT Daily-POC retest; by the later suppression rows the held state is S4_ARMED. At the 14:25:21 pass, evaluated 14:20, the LONG Daily-POC retest is already reported but is suppressed by the same-tier SHORT holder; the same pattern repeats for evaluated bars 14:25 and 14:30. A shadow-only SHORT poll at evaluated 14:25 says `confirm=1 shadow=true`; it does not establish a live LONG poll or a fired SHORT entry. At the 14:40:22 pass, evaluated 14:35 and owed entry 14:40 open, the LONG is again suppressed with `wouldPreempt=0`, before the SHORT's deferred LTF_MISALIGN abort is applied. The SHORT held-candidate shadow poll is `confirm=0`; it is not evidence about the LONG confirmation. The LONG was not allowed through to its own confirmation/entry path. Cross-run record reconciliation: `BUILDER_FINDING_USDJPY-MISSES.md` (SHA-256 `5079E3A2EF0BDDC51D521E58223B195D50F3B06247611CD59CC9649102A4477E`), line 85 refutes R63 freshness involvement; line 123 records RECON71's earlier VWAP 160.522 / R 0.11 rejection. The earlier register cell repeated the R63 freshness explanation despite that later refutation; the register is corrected. Both are prior-run paths, not RECON78's blocker. The current proximate blocker is the equal-tier same-session suppression described above.

Q3 verdict: CONFIRM / OBJECT / DISCREPANCY.
Ask A: Does the source and row sequence support this as a same-session candidate-arbitration defect against the settled non-firing-holder-expiry rule? Identify any missing downstream proof before claiming the arbitration correction alone guarantees a fill.
Ask B: Recommend the narrowest implementation correction and a future acceptance predicate that releases the 14:35 LONG candidate without weakening the pre-confirmation 5m-flip kill, confirm-once / 14:40 next-open timing, POC-over-VWAP same-bar ranking, or one-take-per-pair-per-session. Require evidence that June 11 is admitted at the 14:40 open for the registered reason; June 8 invalid SHORT remains silent under the 5m-flip kill; June 5 London 09:45 remains correct; the 6/9 09:50 never-reseeded keep remains silent; and no post-entry 14:45 evidence is used. State all conditions, unresolved evidence, and code sites. Do not invent a strategy rule.

## 12 - Source excerpt D (EA lines 7904-7913: opposite-direction transfer is bounded to S2, or confirmed-opposite S1)
```mql5
          if(t78_opp && (g_state == ST_S2_LTF_ALIGN || (g_state == ST_S1_REGIME && t78_opConf && !t78_heldConf)))
            {
             int s1c_fromLine     = g_anchorLine;
             ENUM_SRJ_DIR s1c_fromDir = g_dir;
             g_anchorLine    = t78_pr.topLine;
             ReadBuf1(g_hPoi, t78_pr.topLine, g_anchorPrice, barShift);
             g_anchorBarTime = barTime;
             g_dir           = t78_dir;
             g_zoneHi        = 0.0;
             g_zoneLo        = 0.0;
```

## 13 - Source excerpt E (EA lines 8033-8042: suppression row is diagnostic, action labels singleton outcome)
```mql5
         PrintFormat("[SRJ-EA] SUPPRESSED bar=%s poi=%s dir=%s opp=%d higher=%d "
                     "heldPoi=%s heldDir=%s heldState=%s "
                     "cum_n=%d cum_opp=%d cum_hi=%d cum_both=%d action=%s",
                     TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift),
                                  TIME_DATE|TIME_MINUTES),
                     g_lineCode[t73_pr.topLine], DirName(t73_dir),
                     (int)t73_isOpp, (int)t73_isHigh,
                     g_lineCode[g_anchorLine], DirName(g_dir), StateName(g_state),
                     s_t73_n, s_t73_opp, s_t73_higher, s_t73_both,
                     b3_superseded ? "SUPERSEDED" : "HELD");
```

## 14 - Source excerpt F (EA lines 8462-8469: deferred 5m-misalignment abort applies to the unchanged holder)
```mql5
       //--- [v20 S-a] deferred-abort application (identity-keyed on anchor+dir+barTime; set in Fix F11 tail).
       if(uj_saAbort)
         {
          if(uj_saA == g_anchorLine && uj_saD == (int)g_dir && uj_saT == g_anchorBarTime)
            {
             if(InpDebugLog) PrintFormat("[SRJ-EA] UJDEFERAPPLY bar=%s dir=%s poi=%s - deferred LTF abort applies, holder unchanged (Fix S-a)", TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES), DirName(g_dir), AnchorStr());
             GoAbort(ABORT_LTF_MISALIGN, g_state);
             return;
```

## 15 - Raw RECON78 June 11 rows (pass stamp / evaluated bar / owed entry triple)
```text
OL	0	17:08:10.382	Core 04	2026.06.11 14:10:00   [SRJ-EA] RETESTBOOK bar=2026.06.11 14:05 hits=1 Daily-POC:r10:dS
HM	0	17:08:10.382	Core 04	2026.06.11 14:25:21   [SRJ-EA] SIDE1H_WOULDPREEMPT bar=2026.06.11 14:20 newPoi=Daily-POC newDir=LONG heldPoi=Daily-POC heldDir=SHORT heldState=S4_ARMED newTier=5 heldTier=5 wouldPreempt=0 wouldTierPassLegacy=0
JN	0	17:08:10.382	Core 04	2026.06.11 14:25:21   [SRJ-EA] SUPPRESSED bar=2026.06.11 14:20 poi=Daily-POC dir=LONG opp=1 higher=0 heldPoi=Daily-POC heldDir=SHORT heldState=S4_ARMED cum_n=76 cum_opp=16 cum_hi=7 cum_both=4 action=HELD
FE	0	17:08:16.498	Core 04	2026.06.11 14:30:00   [SRJ-EA] CONFIRMPOLL bar=2026.06.11 14:25 anchor=Daily-POC dir=SHORT oppCandle=1 bodyDir=1 body=1pts doji=0 touchAttr=1 confirm=1 shadow=true
DI	0	17:08:16.498	Core 04	2026.06.11 14:30:00   [SRJ-EA] SIDE1H_WOULDPREEMPT bar=2026.06.11 14:25 newPoi=Daily-POC newDir=LONG heldPoi=Daily-POC heldDir=SHORT heldState=S4_ARMED newTier=5 heldTier=5 wouldPreempt=0 wouldTierPassLegacy=0
HQ	0	17:08:16.498	Core 04	2026.06.11 14:30:00   [SRJ-EA] SUPPRESSED bar=2026.06.11 14:25 poi=Daily-POC dir=LONG opp=1 higher=0 heldPoi=Daily-POC heldDir=SHORT heldState=S4_ARMED cum_n=77 cum_opp=17 cum_hi=7 cum_both=4 action=HELD
RO	0	17:08:16.498	Core 04	2026.06.11 14:35:10   [SRJ-EA] SIDE1H_WOULDPREEMPT bar=2026.06.11 14:30 newPoi=Daily-POC newDir=LONG heldPoi=Daily-POC heldDir=SHORT heldState=S4_ARMED newTier=5 heldTier=5 wouldPreempt=0 wouldTierPassLegacy=0
PP	0	17:08:16.498	Core 04	2026.06.11 14:35:10   [SRJ-EA] SUPPRESSED bar=2026.06.11 14:30 poi=Daily-POC dir=LONG opp=1 higher=0 heldPoi=Daily-POC heldDir=SHORT heldState=S4_ARMED cum_n=78 cum_opp=18 cum_hi=7 cum_both=4 action=HELD
CS	0	17:08:16.498	Core 04	2026.06.11 14:40:22   [SRJ-EA] LTFFLIP bar=2026.06.11 14:35 dir=SHORT poi=Daily-POC state=S4_ARMED - LTF bias turned against the locked direction
QN	0	17:08:16.498	Core 04	2026.06.11 14:40:22   [SRJ-EA] UJDEFERABORT bar=2026.06.11 14:35 dir=SHORT poi=Daily-POC state=S4_ARMED - LTF opposed, abort deferred past evaluation (Fix S-a)
PL	0	17:08:16.498	Core 04	2026.06.11 14:40:22   [SRJ-EA] SIDE1H_WOULDPREEMPT bar=2026.06.11 14:35 newPoi=Daily-POC newDir=LONG heldPoi=Daily-POC heldDir=SHORT heldState=S4_ARMED newTier=5 heldTier=5 wouldPreempt=0 wouldTierPassLegacy=0
RO	0	17:08:16.498	Core 04	2026.06.11 14:40:22   [SRJ-EA] SUPPRESSED bar=2026.06.11 14:35 poi=Daily-POC dir=LONG opp=1 higher=0 heldPoi=Daily-POC heldDir=SHORT heldState=S4_ARMED cum_n=79 cum_opp=19 cum_hi=7 cum_both=4 action=HELD
GL	0	17:08:16.498	Core 04	2026.06.11 14:40:22   [SRJ-EA] RETESTBOOK bar=2026.06.11 14:35 hits=2 Daily-POC:r10:dL Daily-VWAP:r11:dL
CQ	0	17:08:16.498	Core 04	2026.06.11 14:40:22   [SRJ-EA] CONFIRMPOLL bar=2026.06.11 14:35 anchor=Daily-POC dir=SHORT oppCandle=0 bodyDir=0 body=3pts doji=0 touchAttr=1 confirm=0 shadow=true
CQ	0	17:08:16.498	Core 04	2026.06.11 14:40:22   [SRJ-EA] UJDEFERAPPLY bar=2026.06.11 14:35 dir=SHORT poi=Daily-POC - deferred LTF abort applies, holder unchanged (Fix S-a)
JF	0	17:08:16.498	Core 04	2026.06.11 14:40:22   [SRJ-EA] ALERT SRJ STAND-DOWN SHORT USDJPY M5 | Daily-POC | NYAM | reason=LTF_MISALIGN
```

## 16 - Required cross-checks
Any proposed entry change must preserve 5 June London 09:45 SHORT behavior on the correct confirmation bar, the 8 June 09:25 invalid SHORT negative control, the 6/9 09:50 never-reseeded keep, the June 11 14:35 retest+confirmation / 14:40 open timing, and the separate operator-side 5m-series review. Any proposed exit change must preserve the universal day-close rule and body-break priority, and prove broker deal behavior rather than only MTEXIT/MTLIFE telemetry.

## 17 - Run and scope boundary
No new build/run is requested in this review round. Any subsequent implementation needs a fresh council disposition plus an exact new Luna key and operator run word. No EU run or EU behavior is in scope. Live trading is prohibited.

## 18 - Seat packaging and answer form
Sonnet and GLM are the required seats; Astra/Opus are optional only if the operator chooses. Page-only review. Each reply must contain Q1, Q2, and Q3 verdicts, each Ask A and Ask B, source/page findings, explicit conditions or missing evidence, and a separate close for all three questions. A seat may not convert implementation advice into operator strategy authority.

## 19 - Review split and close
Council decides whether the diagnosis is supported and whether the proposed implementation/acceptance is complete enough for a future bounded packet. Luna independently verifies source lines and actual deal evidence. The operator remains sole authority for strategy meaning, any new run word, and carrying replies between chats. No result in this packet grants a build, run, activation, or deployment.

## 20 - Source excerpt A (EA lines 11912-11923)
```mql5
    //--- [P-RECON74FIX-2 R] session-close retarget (his RETARGET rule; closed-session values only; instance-contained plus caller-strict-tighter jointly bound the revision to one per trade instance).
    if(g_mtrade.tpRef != EMPTY_VALUE && g_mtrade.tpRef > 0.0)
      {
       double uj_rtPx = 0.0;
       if(UjClosedSessionTarget(g_mtrade, barShift, uj_rtPx) && uj_rtPx > 0.0
          && ((g_mtrade.dir == DIR_LONG && NormalizeDouble(uj_rtPx, _Digits) < NormalizeDouble(g_mtrade.tpRef, _Digits)) || (g_mtrade.dir == DIR_SHORT && NormalizeDouble(uj_rtPx, _Digits) > NormalizeDouble(g_mtrade.tpRef, _Digits))))
         {
          double uj_oldRef = g_mtrade.tpRef;
          g_mtrade.tpRef = uj_rtPx;
          if(InpDebugLog) PrintFormat("[SRJ-EA] UJRETARGET bar=%s dir=%s old=%s sess=%d tp=%s seq=%I64d admit=%s - session-close retarget (Fix R)", TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES), DirName(g_mtrade.dir), DoubleToString(uj_oldRef, _Digits), g_mtrade.sessionAtEntry, DoubleToString(g_mtrade.tpRef, _Digits), (long)g_mtrade.uj_tradeSeq, TimeToString(g_mtrade.uj_admitBarTime, TIME_DATE|TIME_MINUTES));
         }
       else if(InpDebugLog && uj_rtPx > 0.0) PrintFormat("[SRJ-EA] UJNORETARGET bar=%s dir=%s tp=%s rt=%s why=%s sess=%d seq=%I64d admit=%s - helper true but not tighter (Fix R)", TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES), DirName(g_mtrade.dir), DoubleToString(g_mtrade.tpRef, _Digits), DoubleToString(uj_rtPx, _Digits), (NormalizeDouble(uj_rtPx, _Digits) == NormalizeDouble(g_mtrade.tpRef, _Digits) ? "eq" : "loose"), g_mtrade.sessionAtEntry, (long)g_mtrade.uj_tradeSeq, TimeToString(g_mtrade.uj_admitBarTime, TIME_DATE|TIME_MINUTES)); // helper-true discriminator
```

## 21 - Source excerpt B (EA lines 12036-12068)
```mql5
   //--- close the trade (the priority order stated in the header)
   g_mtrade.state       = MT_CLOSED;
   g_mtrade.exitBarTime = barTime;
   if(vSL)         { g_mtrade.exitReason = MT_EXIT_SL;             g_mtrade.exitPrice = g_mtrade.slRef; }
    else if(vTP)    { g_mtrade.exitReason = MT_EXIT_TP_TOUCH;       g_mtrade.exitPrice = g_mtrade.tpRef; }
   else if(vBREAK) { g_mtrade.exitReason = MT_EXIT_POI_BODY_BREAK; g_mtrade.exitPrice = nextOpenPx; }
   else if(vHTF)   { g_mtrade.exitReason = MT_EXIT_HTF_FLIP;       g_mtrade.exitPrice = nextOpenPx; }
   else if(vDAY)   { g_mtrade.exitReason = MT_EXIT_DAY_CLOSE;  g_mtrade.exitPrice = nextOpenPx; }

    PrintFormat("[SRJ-EA] MTEXIT bar=%s reason=%s line=%s lineVal=%s entry=%s exit=%s",
                TimeToString(barTime, TIME_DATE|TIME_MINUTES),
                MtExitName(g_mtrade.exitReason),
                (vBREAK ? breakLineName : "-"),
                (vBREAK ? DoubleToString(breakLineVal, _Digits) : "-"),
                DoubleToString(g_mtrade.entryPrice, _Digits),
                DoubleToString(g_mtrade.exitPrice, _Digits));
    //--- [P-EXITEXEC-1 E7] execution legs: SL/TP broker-owned, HTF stays off,
    //--- CANCEL_BIAS returned above - only the WINNING BREAK/DAY_CLOSE verdict closes.
    //--- Price reference = g_mtrade.exitPrice (= nextOpenPx on the gated legs per EA 11290/11292); paper MTEXIT/MTLIFE/EXIT rows print regardless.
    if(g_mtrade.exitReason == MT_EXIT_POI_BODY_BREAK || g_mtrade.exitReason == MT_EXIT_DAY_CLOSE)
      {
       int mtexecRc = MtCloseBrokerPosition(MtExitName(g_mtrade.exitReason), g_mtrade.exitPrice, barTime);
       if(mtexecRc == 0)
          PrintFormat("[SRJ-EA] MTCLOSE_FAIL bar=%s reason=%s entryTicket=%I64u entryPid=%I64d", TimeToString(barTime, TIME_DATE|TIME_MINUTES), MtExitName(g_mtrade.exitReason), g_mtrade.ticket, g_mtrade.entryPid);
      }
    if(InpDebugLog) MtLifeEmit();
   EmitAlert("EXIT",
             StringFormat("%s%s at %s (entry %s)",
                          MtExitName(g_mtrade.exitReason),
                          (vBREAK ? " [" + breakLineName + "]" : ""),
                          DoubleToString(g_mtrade.exitPrice, _Digits),
                          DoubleToString(g_mtrade.entryPrice, _Digits)),
             true);
```

## 22 - Source excerpt C (EA lines 10804-10806)
```mql5
            tradeResult = g_trade.Buy(lots, _Symbol, entryPrice, slRef, tpTarget, comment);
         else
            tradeResult = g_trade.Sell(lots, _Symbol, entryPrice, slRef, tpTarget, comment);
```

## 23 - Raw run rows
```text
ID	0	16:41:34.132	Core 04	2026.06.05 09:45:00   market sell 6.74 USDJPY sl: 159.972 tp: 159.900 (159.948 / 159.951)
OF	0	16:41:34.132	Core 04	2026.06.05 09:45:00   deal #4 sell 6.74 USDJPY at 159.948 done (based on order #4)
QO	0	16:42:10.830	Core 04	2026.06.05 12:05:00   [SRJ-EA] UJRETARGET bar=2026.06.05 12:00 dir=SHORT old=159.900 sess=1 tp=159.908 seq=2 admit=2026.06.05 09:40 - session-close retarget (Fix R)
NN	0	16:42:10.830	Core 04	2026.06.05 12:15:00   [SRJ-EA] MTEXIT bar=2026.06.05 12:10 reason=TP_TOUCH line=- lineVal=- entry=159.948 exit=159.908
IH	0	16:42:10.830	Core 04	2026.06.05 12:19:21   take profit triggered #4 sell 6.74 USDJPY 159.948 sl: 159.972 tp: 159.900 [#5 buy 6.74 USDJPY at 159.900]
OJ	0	16:42:10.830	Core 04	2026.06.05 12:19:21   deal #5 buy 6.74 USDJPY at 159.900 done (based on order #5)
HO	0	16:43:11.995	Core 04	2026.06.05 16:05:00   [SRJ-EA] UJPROV bar=2026.06.05 16:00 dir=LONG reseedBar=1970.01.01 00:00 seedBiasAl=0 reseedDir=0 exempt=0 - reseed provenance at S2 edge (Fix CARRY)
QD	0	16:43:11.995	Core 04	2026.06.05 16:05:00   [SRJ-EA] S2SEEDBIAS_KILL bar=2026.06.05 16:00 dir=LONG poi=Daily-POC - seedbias refused, promotion killed (Fix B2)
OD	0	16:35:39.439	Core 04	2026.06.04 11:50:00   [SRJ-EA] 2026.06.04 11:50:00 ABORT reason=SEEDBIAS_REFUSED state=S2_LTF_ALIGN poi=Daily-POC dir=LONG
MO	0	16:43:24.215	Core 04	2026.06.05 16:50:00   [SRJ-EA] RETESTBOOK bar=2026.06.05 16:45 hits=2 Daily-POC:r10:dL Daily-VWAP:r11:dL
FN	0	16:43:24.215	Core 04	2026.06.05 16:55:00   [SRJ-EA] ALERT SRJ SIGNAL LONG USDJPY M5 | Daily-POC | NYAM | R=1.56 SL 159.726 TP 160.723 spr=5
OS	0	16:43:24.215	Core 04	2026.06.05 16:55:00   market buy 0.41 USDJPY sl: 159.726 tp: 160.723 (160.115 / 160.120)
CQ	0	16:43:24.215	Core 04	2026.06.05 16:55:00   deal #6 buy 0.41 USDJPY at 160.120 done (based on order #6)
MS	0	16:44:00.911	Core 04	2026.06.05 19:05:01   [SRJ-EA] UJRETARGET bar=2026.06.05 19:00 dir=LONG old=160.723 sess=2 tp=160.298 seq=3 admit=2026.06.05 16:50 - session-close retarget (Fix R)
GF	0	16:44:07.028	Core 04	2026.06.05 19:20:01   [SRJ-EA] MTEXIT bar=2026.06.05 19:15 reason=TP_TOUCH line=- lineVal=- entry=160.115 exit=160.298
GQ	0	16:44:07.028	Core 04	2026.06.05 19:20:01   [SRJ-EA] MTLIFE fields=11 openBar=2026.06.05 16:55 dir=LONG entry=160.115 sl=159.726 tp=160.298 verdict=TP_TOUCH closeBar=2026.06.05 19:15 closePx=160.298 openAtNewsStart=0 openAtDayClose=0 openAtWeekClose=0
QG	0	17:10:18.795	Core 04	2026.06.11 22:30:51   stop loss triggered #6 buy 0.41 USDJPY 160.120 sl: 159.726 tp: 160.723 [#7 sell 0.41 USDJPY at 159.726]
JG	0	17:10:18.795	Core 04	2026.06.11 22:30:51   deal #7 sell 0.41 USDJPY at 159.725 done (based on order #7)
```

## 24 - Review answer form
For each question give one verdict line (`Q1: CONFIRM / OBJECT / DISCREPANCY`; `Q2: CONFIRM / OBJECT / DISCREPANCY`; `Q3: CONFIRM / OBJECT / DISCREPANCY`), then answer both A and B, cite packet lines, list every additional defect/gap, and state conditions or missing evidence. Review only the pasted packet. No code key or operator strategy ruling is requested.

(End of file - total 132 lines)
