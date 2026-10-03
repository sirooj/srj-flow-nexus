# BUILDER RESULT B-2 - code measurement only (no edit, no build, no run, no fix proposed)

Step 1 raw (measured 2026-10-04, terminal disk, branch main):
- git pull: Already up to date.
- git log -1: 8c81c85 Shared skills/commands: file 12 untracked skill mirrors (SRJ/HORC lanes)
- EA SHA-256 Experts/SRJ_FlowNexus_EA.mq5: E80FF0C24149AB0946EB6A4341C0503A79BFE82E9843867CEF0DBA89BF587BBC (MATCHES the required hash; gate passed)
- EA size: 685026 bytes, 12298 lines; EvaluateClosedBar defined at line 6933, called at 12287

## Step 2 - word searches in Experts/SRJ_FlowNexus_EA.mq5 (mechanical, case-sensitive first + differently-formed second)
- SUPPRESSED: 5 hits at 4677, 4679, 7502, 8033, 8045. Second search suppressed (lowercase): 10 further lines 1149, 3558, 4291, 4551, 4621, 5302, 7766, 7806, 7942, 8085. Verified by read: 7502 is a comment, 8033 is the action=HELD emit, 8045 is SUPPRESSED_PROGRESS; 4677 and 4679 not inspected in B-2.
- SIDE1H_WOULDPREEMPT: 1 hit at 7834. Second search WOULDPREEMPT (shorter stem): same 1 hit, zero extras.
- UJDEFERABORT: 1 hit at 7455. Second search ujdeferabort (lowercase): 0 hits.
- UJDEFERAPPLY: 1 hit at 8467. Second search DEFERAPPLY (shorter stem): same 1 hit, zero extras. Adjacent observed emit UJDEFERDROP at 8473.
- LTFFLIP: 2 hits at 7386 (comment) and 7401 (print). Second search ltfflip (lowercase): 0 hits.
- EvaluateClosedBar: 10 hits at 1379, 1641, 1681, 6552, 6755, 6905 (comments), 6933 (definition void EvaluateClosedBar), 7209 (comment), 8631 (comment), 12287 (call). Second search EvaluateClosed (shorter stem): same 10 hits, zero extras.
- Deferred-abort flag variable: uj_saAbort (bool, declared line 6939), with identity key uj_saA (int, 6940), uj_saD (int, 6941), uj_saT (datetime, 6942). All lines reading or writing them (8 total, complete - no other uj_sa line exists in the 12298-line file): 6939, 6940, 6941, 6942 (declare + init), 7454 (set true + key = g_anchorLine, g_dir, g_anchorBarTime), 8463 (read test), 8465 (read identity match), 8475 (cleared false).

## Step 3 - code blocks verbatim with EA line numbers (spliced mechanically, zero elisions)
Block A runs 7387-8476 = 1090 lines, pasted in 3 consecutive chunks. A starts at the LTFFLIP state-guard check (7387; print at 7401) and ends at 8476, the closing brace of the deferred-abort block, the last line before ST_S3_ZONE_WAIT management starts at 8478. Chunks: A1 7387-7759, A2 7760-8119 (starts at the POI-replacement section header 7760), A3 8120-8476.
### A1 (7387-7759)
7387:    if(g_state >= ST_S3_ZONE_WAIT && g_state <= ST_S5_GATE_CHECK)
7388:      {
7389:       //--- [P-SLDEF-4 E33] bias-site stamp: the pipeline's per-bar bias read
7390:       //--- runs in this block (live LTF-align invariant). Print-only; every
7391:       //--- branch below is untouched.
7392:       g_order_seq++;
7393:       g_order_seqBias = g_order_seq;
7394:       g_order_biasBarT = iTime(_Symbol, PERIOD_CURRENT, barShift);
7395:       bool t79_aligned = false;
7396:       if(!CheckLtfAlign(barShift, g_dir, t79_aligned))
7397:         { GoAbort(ABORT_UPSTREAM_UNREADY, g_state); return; }
7398:       if(!t79_aligned)
7399:         {
7400:          if(InpDebugLog)
7401:             PrintFormat("[SRJ-EA] LTFFLIP bar=%s dir=%s poi=%s state=%s - LTF bias "
7402:                         "turned against the locked direction",
7403:                         TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift),
7404:                                      TIME_DATE|TIME_MINUTES),
7405:                         DirName(g_dir), AnchorStr(), StateName(g_state));
7406:          //--- [Task 81 / EA-88 Option D] DIAGNOSTIC ONLY. Both flip branches in
7407:          //--- SRJ_Bias_DecisionBlock reset tickOBIsValid, tickFVGIsValid and
7408:          //--- hasPersistedOpposingFVG on the flip bar itself, so the flip bar's
7409:          //--- exports read clean and cannot distinguish a strong flip from a weak
7410:          //--- one. The bar BEFORE the flip still carries the preconditions.
7411:          //--- doWeakSignalFlip requires ALL THREE of obValid=0, fvgValid=0,
7412:          //--- oppFvg=1. All three adverse at barShift+1 => weak flip. Not all
7413:          //--- three => strong flip (in-bias invalidation count reached 2).
7414:          //--- Assigns nothing, branches nothing, cannot alter control flow.
7415:          if(InpDebugLog)
7416:            {
7417:             double t81_ob0 = 0.0, t81_fv0 = 0.0, t81_op0 = 0.0, t81_bi0 = 0.0;
7418:             double t81_ob1 = 0.0, t81_fv1 = 0.0, t81_op1 = 0.0, t81_bi1 = 0.0;
7419:             bool t81_k0 = ReadFlow(FL_BUF_LTF_OB_VALID,  t81_ob0, barShift)
7420:                        && ReadFlow(FL_BUF_LTF_FVG_VALID, t81_fv0, barShift)
7421:                        && ReadFlow(FL_BUF_LTF_OPP_FVG,   t81_op0, barShift)
7422:                        && ReadFlow(FL_BUF_LTF_BIAS,      t81_bi0, barShift);
7423:             bool t81_k1 = ReadFlow(FL_BUF_LTF_OB_VALID,  t81_ob1, barShift + 1)
7424:                        && ReadFlow(FL_BUF_LTF_FVG_VALID, t81_fv1, barShift + 1)
7425:                        && ReadFlow(FL_BUF_LTF_OPP_FVG,   t81_op1, barShift + 1)
7426:                        && ReadFlow(FL_BUF_LTF_BIAS,      t81_bi1, barShift + 1);
7427:             bool t81_weak = t81_k1
7428:                             && (int)MathRound(t81_ob1) == 0
7429:                             && (int)MathRound(t81_fv1) == 0
7430:                             && (int)MathRound(t81_op1) == 1;
7431:           PrintFormat("[SRJ-EA] LTFDIAG bar=%s dir=%s state=%s kind=%s "
7432:                          "ok0=%d bias0=%d ob0=%d fvg0=%d opp0=%d "
7433:                          "ok1=%d bias1=%d ob1=%d fvg1=%d opp1=%d",
7434:                          TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift),
7435:                                       TIME_DATE|TIME_MINUTES),
7436:                          DirName(g_dir), StateName(g_state),
7437:                          (t81_weak ? "WEAK" : (t81_k1 ? "STRONG" : "UNKNOWN")),
7438:                          (int)t81_k0, (int)MathRound(t81_bi0),
7439:                          (int)MathRound(t81_ob0), (int)MathRound(t81_fv0),
7440:                          (int)MathRound(t81_op0),
7441:                          (int)t81_k1, (int)MathRound(t81_bi1),
7442:                          (int)MathRound(t81_ob1), (int)MathRound(t81_fv1),
7443:                          (int)MathRound(t81_op1));
7444:             }
7445:           double uj_hm15 = 0.0;
7446:           bool uj_hm15r = ReadFlow(FL_BUF_HTF_LOW, uj_hm15, barShift);
7447:           double uj_hwant = (g_dir == DIR_LONG ? 1.0 : -1.0);
7448:           string uj_hterm = "";
7449:           bool uj_hcarve = IsConfirmationCandle(barShift, g_anchorLine, g_dir, uj_hterm);
7450:           if((uj_hm15r && uj_hm15 == uj_hwant) || uj_hcarve)
7451:             { if(InpDebugLog) PrintFormat("[SRJ-EA] UJLTFHOLD bar=%s dir=%s poi=%s state=%s m15=%s rf=%d mode=%s term=%s - LTF opposed, hold (Fix F11)", TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES), DirName(g_dir), AnchorStr(), StateName(g_state), DoubleToString(uj_hm15, 1), (uj_hm15r ? 1 : 0), ((uj_hm15r && uj_hm15 == uj_hwant) ? "M15" : "CARVE"), uj_hterm); }
7452:           else
7453:             {
7454:              uj_saAbort = true; uj_saA = g_anchorLine; uj_saD = (int)g_dir; uj_saT = g_anchorBarTime;
7455:              if(InpDebugLog) PrintFormat("[SRJ-EA] UJDEFERABORT bar=%s dir=%s poi=%s state=%s - LTF opposed, abort deferred past evaluation (Fix S-a)", TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES), DirName(g_dir), AnchorStr(), StateName(g_state));
7456:             }
7457:          }
7458:      }
7459: 
7460:    //--- [Task 135 / A-3 section 5.1 / v4.2 section 3.4 errata] The
7461:    //--- candidate-specific structural invalidation window OPENS AT BUNDLE
7462:    //--- BINDING, not at candidate creation. Under today's architecture the
7463:    //--- S3->S4 arming transition IS the binding point: g_zoneHi and g_zoneLo are
7464:    //--- assigned there and nothing before it identifies a structure at all. A
7465:    //--- candidate that has not yet adopted a zone has no candidate-specific
7466:    //--- structure for these three flags to describe, so a 2-of-3 verdict against
7467:    //--- it is not attributable to anything the candidate is built on.
7468:    //---
7469:    //--- R-Q2 keeps the flags legitimately GLOBAL - they are the panel's
7470:    //--- current-structure flags and no per-candidate copy is wanted. Section 5.1
7471:    //--- fixes only WHEN they may kill a candidate.
7472:    //---
7473:    //--- Measured, Tier 1, Task 134: of 25 aborts, 11 are freshness deaths and
7474:    //--- SIX fired before the candidate had armed - FRESH_OPP_FVG at
7475:    //--- S2_LTF_ALIGN 08.14 11:35, FRESH_OPP_FVG at S3_ZONE_WAIT 08.18 10:20 and
7476:    //--- 08.18 11:50, FRESH_OB_DEAD at S2_LTF_ALIGN 08.18 16:25 and 08.18 18:05,
7477:    //--- FRESH_OB_DEAD at S3_ZONE_WAIT 08.21 09:35. Corroborated at Tier 3 scale
7478:    //--- by FRESHCOUNT #1050, which fires 08.03 09:25 with state=S2_LTF_ALIGN
7479:    //--- adverse=2 verdict=ABORT against a candidate that had bound nothing.
7480:    //---
7481:    //--- STRICTLY RETENTION. This edit can only let a candidate live longer. It
7482:    //--- can never kill one, and it can never admit a signal the freshness rule
7483:    //--- would have blocked at S4 or S5, because the poll still runs there
7484:    //--- unchanged. Same character as Stage 3a's S1WAIT / S2WAIT retention, and
7485:    //--- deliberately the opposite character to Task 79's strictly-removal LTF
7486:    //--- invariant, so the two journals read against each other cleanly.
7487:    //---
7488:    //--- SCENARIO B IS PRESERVED. The operator's 08/03 setup-1 rejection fires at
7489:    //--- state=S5_GATE_CHECK, inside the retained range, on the same fvgDead plus
7490:    //--- oppFvg pair. This edit does not touch it.
7491:    //---
7492:    //--- ACCEPTED CONSEQUENCE 1, and the reason Task 134 ran first: a candidate
7493:    //--- freed here does not necessarily survive. It carries whatever other
7494:    //--- pending deaths it already had, and removing the one that fires first
7495:    //--- reveals the next (section 16.3). Expect the abort MIX to shift toward
7496:    //--- SESSION_CLOSED, NO_TP_TARGET and LTF_MISALIGN rather than the abort
7497:    //--- COUNT to fall.
7498:    //---
7499:    //--- ACCEPTED CONSEQUENCE 2, and the real risk: this is a RETENTION edit
7500:    //--- under a SINGLETON architecture. A candidate that lives longer holds the
7501:    //--- singleton longer and can suppress POI retests that previously seeded
7502:    //--- their own candidates. So the candidate COUNT may FALL and SUPPRESSED may
7503:    //--- RISE even though this edit cannot kill anything directly. Both are
7504:    //--- censused. A net loss by that route is an argument for section 5.6's
7505:    //--- concurrency work, not against this ruling.
7506:    //---
7507:    //--- ACCEPTED CONSEQUENCE 3, diagnostic: CheckFreshness is NOT called in the
7508:    //--- newly exempt range, because its side effects - the FRESHCOUNT print and
7509:    //--- its cum1/cum2/cum3 counters - are not on record as harmless and this
7510:    //--- task does not read its body. So FRESHCOUNT lines DISAPPEAR for pre-arm
7511:    //--- bars and the cum counters RENUMBER. Task 133's FRESHCOUNT numbering is
7512:    //--- therefore NOT comparable to this run's. The FRESHSKIP line below records
7513:    //--- every skipped bar and its state so attribution survives the loss.
7514:    //---
7515:    //--- Threshold-free: the change is a STATE comparison, ST_S2_LTF_ALIGN to
7516:    //--- ST_S4_ARMED. No distance, no size, no bar count, no tolerance. Part A
7517:    //--- section 7 is not engaged.
7518:    //---
7519:    //--- The upper bound ST_S5_GATE_CHECK is DELIBERATELY UNCHANGED. EA-104 stays
7520:    //--- withdrawn: setup completion, not the confirming close, ends the window,
7521:    //--- and divergence may still be pending at S5.
7522:    //---
7523:    //--- â˜… The IDENTICAL condition guards the TP/RR poll immediately below this
7524:    //--- block. That one is NOT changed - it is Task 31's advisory poll and its
7525:    //--- state range is unrelated to this ruling. â˜…
7526:    //---
7527:    //--- The FRESHSKIP print reports the anchor through AnchorStr(), which is the
7528:    //--- same accessor LogState and LogAbort already use for their poi= field.
7529:    //--- Revision A of this task: the first issue named a nonexistent identifier
7530:    //--- and the builder correctly halted on the Block C-bis census rather than
7531:    //--- substituting one. Planner defect nineteen, section 16.8.
7532:    //---
7533:    //--- Nothing is deleted. The superseded condition is retained verbatim on the
7534:    //--- annotated comment line directly beneath this one:
7535:    //---
7536:    //--- SUPERSEDED BY TASK 135, retained per P4:
7537:    //---   if(g_state >= ST_S2_LTF_ALIGN && g_state <= ST_S5_GATE_CHECK)
7538:    //---
7539:    if(InpDebugLog && g_state >= ST_S2_LTF_ALIGN && g_state < ST_S4_ARMED)
7540:       PrintFormat("[SRJ-EA] FRESHSKIP bar=%s dir=%s state=%s poi=%s reason=PRE_BINDING",
7541:                   TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES),
7542:                   DirName(g_dir),
7543:                   StateName(g_state),
7544:                   AnchorStr());
7545: 
7546:    if(g_state >= ST_S4_ARMED && g_state <= ST_S5_GATE_CHECK)
7547:      {
7548:       //--- [P-SCOPE34] the 2-of-3 kill is PRE-CONFIRMATION ONLY: at S4_ARMED the
7549:       //--- poll kills as built; at S5_GATE_CHECK (post-confirming-close) it is
7550:       //--- diagnostic-only (scope=post, verdict=HOLD) - the only cancellation
7551:       //--- there is the live bias flip (the three-flag conjunction is the same
7552:       //--- event per spec sections 3.4/5.5).
7553:       string fail = CheckFreshness(barShift, g_state != ST_S5_GATE_CHECK);
7554:       //--- [P-FRESH-S5OPP E1-K4] veto persistence, S4 ONLY, BEFORE any abort
7555:       //--- return (Luna/Astra v152: the clear sees the fresh read even when
7556:       //--- this poll aborts on another predicate). BOUND/DAY only — no CLEAN
7557:       //--- arm (Luna/Opus-D3 v153: a stale-0 fail-open is unfixable in this
7558:       //--- shape, so the arm is dropped, not narrowed). Audited by VETOCLEAR.
7559:       //--- [P-VNEXT-1 E4] S4 site mirrors the latch site: DAY-only clear (BOUND removed, same veto-persistence rule; supersedes the L7237 BOUND/DAY note).
7560:       if(g_state == ST_S4_ARMED && g_freshVetoBar != 0)
7561:         {
7562:          string vday = StringSubstr(TimeToString(g_freshVetoBar, TIME_DATE), 0, 10);
7563:          string cday = StringSubstr(TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE), 0, 10);
7564:          if(vday != cday)
7565:            {
7566:             if(InpDebugLog)
7567:                PrintFormat("[SRJ-EA] VETOCLEAR bar=%s dir=%s why=%s",
7568:                            TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES),
7569:                            DirName(g_dir), "DAY");
7570:             g_freshVetoBar = 0; g_freshVetoAnchor = -1; g_freshVetoDir = -1;
7571:            }
7572:         }
7573:       if(fail == ABORT_FRESH_OPP_FVG)
7574:         {
7575:          g_freshVetoBar = iTime(_Symbol, PERIOD_CURRENT, barShift);
7576:          g_freshVetoAnchor = g_anchorLine;
7577:          g_freshVetoDir = (int)g_dir;
7578:          GoAbort(fail, g_state); return;
7579:         }
7580:       if(fail != "") { GoAbort(fail, g_state); return; }
7581:      }
7582: 
7583:     //--- [P-SEL-1 E54] stage-reached marker at probe bars (read-only + line).
7584:     if(InpDebugLog)
7585:       {
7586:        string sl54_s2T = TimeToString(barTime, TIME_DATE|TIME_MINUTES);
7587:        if(SrjSelIsProbeBar(sl54_s2T))
7588:          { string sl54_s2L = StringFormat("[SRJ-EA] SEL54STAGE bar=%s stage=S2POLL dir=%s state=%s", sl54_s2T, DirName(g_dir), StateName(g_state)); LwAudit("SEL54STAGE", sl54_s2L); Print(sl54_s2L); }
7589:       }
7590:     double s1_stopRef = 0.0; bool s1_haveStop = false;
7591:    if(g_state >= ST_S2_LTF_ALIGN && g_state <= ST_S5_GATE_CHECK)
7592:      {
7593:       //--- [P-UJIMPL-IMPL-1 v8 IE6] entry reference = forming-bar open (would-be fill)
7594:       double currentPrice = iOpen(_Symbol, PERIOD_CURRENT, 0);
7595:       double tpTarget;
7596:       if(!ComputeNearestTpTarget(barShift, g_dir, currentPrice, tpTarget))
7597:         {
7598:          if(InpDebugLog)
7599:             PrintFormat("[SRJ-EA] %s S2POLL_NO_TP_TARGET",
7600:                         TimeToString(TimeCurrent(), TIME_DATE|TIME_SECONDS));
7601:          GoAbort(ABORT_NO_TP_TARGET, g_state); return;
7602:         }
7603:       double slRef = 0.0; ENUM_SRJ_SLMODE slMode = SL_MODE_NONE;
7604:       //--- [P-FIX-S2POLL E1 / operator Q1+Q3 2026-09-11] The stop pair is ATOMIC:
7605:       //--- both set on success, both absent on failure. The superseded form had the
7606:       //--- if governing ONE statement, so s1_haveStop=true was unconditional and the
7607:       //--- scope block below read slRef on the failure path. #property strict does
7608:       //--- not diagnose that shape. Fail-closed per Q3 ("SL should be present at all
7609:       //--- times"), following the sibling gate in this same block: ABORT_NO_TP_TARGET
7610:       //--- already kills across S2..S5 from here, and this is its stop-side twin.
7611:       //--- SUPERSEDED, retained per P4:
7612:       //---   if(ComputeSlReference(barShift, g_dir, slRef, slMode, "S2POLL"))
7613:       //---      s1_stopRef = slRef; s1_haveStop = true;
7614:       if(!SlRefMemo(barShift, barTime, g_dir, slRef, slMode, "S2POLL"))
7615:         {
7616:          if(InpDebugLog)
7617:             PrintFormat("[SRJ-EA] %s S2POLL_NO_SL_REF state=%s dir=%s",
7618:                         TimeToString(TimeCurrent(), TIME_DATE|TIME_SECONDS),
7619:                         StateName(g_state), DirName(g_dir));
7620:          GoAbort(ABORT_NO_SL_REF, g_state);
7621:          return;
7622:         }
7623:       s1_stopRef  = slRef;
7624:       s1_haveStop = true;
7625:       //--- [P-UJIMPL-IMPL-2 v10 Fix H1] poll verdict is telemetry + memo write
7626:       //--- (R-AT-OPEN: the admission verdict fires ONLY at the fire approach
7627:       //--- on entry-open ref; a poll FAIL no longer aborts).
7628:         {
7629:          double uj_risk = 0.0, uj_reward = 0.0, uj_R = 0.0;
7630:          string uj_bk7 = TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES);
7631:          if(!SrjUjAssert1R(currentPrice, slRef, tpTarget, uj_bk7, "POLL", uj_risk, uj_reward, uj_R))
7632:            { if(InpDebugLog) PrintFormat("[SRJ-EA] UJPOLLRISK bar=%s dir=%s R=%.2f - poll-ref verdict telemetry only, admission verdict at fire (Fix H1)", uj_bk7, DirName(g_dir), uj_R); }
7633:          uj_memo_tp = tpTarget; uj_memo_sl = slRef; uj_memo_entry = currentPrice;
7634:          uj_memo_valid = true;
7635:          uj_memo_anchor = g_anchorLine; uj_memo_dir = (int)g_dir; uj_memo_barTime = barTime;
7636:          uj_memo_risk = uj_risk; uj_memo_reward = uj_reward; uj_memo_R = uj_R;
7637:          uj_memo_src = "POLL";
7638:          uj_memo_wsrc = uj_winnerSource; uj_memo_wday = uj_winnerDayKey;
7639:          uj_memo_wgen = uj_winnerPoolGen; uj_memo_wage = UjDayDiff(barTime, uj_winnerDayKey);
7640:         }
7641:         {
7642:          double slDist = MathAbs(currentPrice - slRef);
7643:          double tpDist = MathAbs(tpTarget - currentPrice);
7644:          //--- TASK 23 (EA-23b / EA-23c / EA-20): shadow reward/risk measured from
7645:          //--- the entry zone rather than from the closing price, printed for all
7646:          //--- three candidate entry references so Ruling 7 can be answered from
7647:          //--- data instead of from judgement. Nothing reads these values. No gate,
7648:          //--- no abort, no branch, no assignment to any sequence variable.
7649:          //--- Skipped before S4 because g_zoneHi/g_zoneLo are still 0.0 until the
7650:          //--- S3 block sets them; that is expected, not a failure.
7651:          if(InpDebugLog && g_zoneHi > 0.0 && g_zoneLo > 0.0)
7652:            {
7653:             double zNear = (g_dir == DIR_LONG) ? g_zoneHi : g_zoneLo;
7654:             double zFar  = (g_dir == DIR_LONG) ? g_zoneLo : g_zoneHi;
7655:             double zMid  = (g_zoneHi + g_zoneLo) * 0.5;
7656:             string rs = "";
7657:             for(int e = 0; e < 3; e++)
7658:               {
7659:                double ent = (e == 0) ? zNear : ((e == 1) ? zMid : zFar);
7660:                double sd  = MathAbs(ent - slRef);
7661:                double td  = MathAbs(tpTarget - ent);
7662:                bool slSideOk = (g_dir == DIR_LONG) ? (slRef < ent) : (slRef > ent);
7663:                bool tpSideOk = (g_dir == DIR_LONG) ? (tpTarget > ent) : (tpTarget < ent);
7664:                rs += ((e == 0) ? "near" : ((e == 1) ? "mid" : "far"));
7665:                rs += "=" + ((sd > 0.0) ? DoubleToString(td / sd, 2) : "inf");
7666:                rs += "/sl" + IntegerToString((int)slSideOk);
7667:                rs += "/tp" + IntegerToString((int)tpSideOk) + " ";
7668:               }
7669:             bool tpInGap = (g_dir == DIR_LONG)
7670:                            ? (tpTarget > zNear && tpTarget < currentPrice)
7671:                            : (tpTarget < zNear && tpTarget > currentPrice);
7672:             PrintFormat("[SRJ-EA] ZONESHADOW bar=%s dir=%s close=%s zoneLo=%s zoneHi=%s "
7673:                         "gapPts=%s slRef=%s tp=%s R_close=%s tpInGap=%d shadow= %s",
7674:                         TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES),
7675:                         DirName(g_dir),
7676:                         DoubleToString(currentPrice, _Digits),
7677:                         DoubleToString(g_zoneLo, _Digits),
7678:                         DoubleToString(g_zoneHi, _Digits),
7679:                         DoubleToString(MathAbs(currentPrice - zNear) / _Point, 0),
7680:                         DoubleToString(slRef, _Digits),
7681:                         DoubleToString(tpTarget, _Digits),
7682:                         (slDist > 0.0) ? DoubleToString(tpDist / slDist, 2) : "inf",
7683:                         (int)tpInGap, rs);
7684:            }
7685:          if(slDist > 0.0 && (tpDist / slDist) < InpMinRewardRisk)
7686:            {
7687:             if(InpDebugLog)
7688:                PrintFormat("[SRJ-EA] %s S2POLL_RR_SHORTFALL tpDist=%.5f slDist=%.5f R=%.2f",
7689:                            TimeToString(TimeCurrent(), TIME_DATE|TIME_SECONDS),
7690:                            tpDist, slDist, (slDist > 0.0 ? tpDist / slDist : 0.0));
7691:             /* [Task 31 / Ruling 7a] ADVISORY. Was GoAbort(ABORT_TP_RR_FAIL). iClose is not an entry price before S5: measured 0.17 to 213.27 on one 7-bar sequence as slDist collapses, and every zone-derived alternative overstates by up to 20x. The hard 1R gate now lives only at S5, where the entry IS the next candle's open (P-NEXTOPEN 2026-09-09). S2POLL_RR_SHORTFALL above still logs every failure. */ ;
7692:            }
7693:         }
7694:      }
7695: 
7696:    if(g_state >= ST_S1_REGIME && g_dir != DIR_NONE)
7697:      {
7698:       string kind;
7699:       g_divLatch = UpdateDivergenceLatch(barShift, g_dir, kind);
7700:      }
7701: 
7702:    //--- [Task 72 / EA-74] Post-latch CQD re-read. DIAGNOSTIC ONLY.
7703:    //--- The CQD census at the top of this function is the FIRST CQD read of
7704:    //--- the call. Across 4032 bars it reported ZERO shift=1 verdicts, while
7705:    //--- UpdateDivergenceLatch - reading the SAME buffer at the SAME two
7706:    //--- shifts, later in the same call - matched and latched (measured:
7707:    //--- 2026.08.11 18:35 SIGNAL div=hidden, census silent for the whole
7708:    //--- sequence). This block repeats the census read AFTER the latch block,
7709:    //--- so two reads of one buffer can be compared within a single call.
7710:    //---
7711:    //--- Each shift is read TWICE in immediate succession. If pass A and pass
7712:    //--- B disagree, the buffer is changing under one call, which is value
7713:    //--- instability rather than read-ordering lag - the two candidate
7714:    //--- mechanisms behind EA-74 are distinguishable only this way.
7715:    //---
7716:    //--- The live-value filter is character-identical to the census: skip a
7717:    //--- read failure, skip EMPTY_VALUE, skip zero. Gated on InpDebugLog.
7718:    //--- Assigns nothing, reads g_state / g_dir / g_divLatch for labelling
7719:    //--- only, and cannot alter control flow. R8 is NOT engaged.
7720:    if(InpDebugLog)
7721:      {
7722:       static int s_t72_bars     = 0;
7723:       static int s_t72_hit1     = 0;
7724:       static int s_t72_hit2     = 0;
7725:       static int s_t72_mismatch = 0;
7726:       s_t72_bars++;
7727:       for(int t72_s = 1; t72_s <= 2; t72_s++)
7728:         {
7729:          double t72_a = 0.0, t72_b = 0.0;
7730:          bool t72_okA = ReadBuf1(g_hCqd, CQD_BUF_DIVVERDICT, t72_a, t72_s);
7731:          bool t72_okB = ReadBuf1(g_hCqd, CQD_BUF_DIVVERDICT, t72_b, t72_s);
7732:          bool t72_diff = (t72_okA != t72_okB) ||
7733:                          (t72_okA && t72_okB && t72_a != t72_b);
7734:          bool t72_live = (t72_okA && t72_a != EMPTY_VALUE &&
7735:                           (int)MathRound(t72_a) != 0);
7736:          if(t72_diff) s_t72_mismatch++;
7737:          if(t72_live && t72_s == 1) s_t72_hit1++;
7738:          if(t72_live && t72_s == 2) s_t72_hit2++;
7739:          if(t72_live || t72_diff)
7740:             PrintFormat("[SRJ-EA] CQDRECHECK shift=%d passA=%s passB=%s diff=%d "
7741:                         "bar=%s state=%s dir=%s divLatch=%d hit1=%d hit2=%d mism=%d",
7742:                         t72_s,
7743:                         t72_okA ? ((t72_a == EMPTY_VALUE) ? "EMPTY"
7744:                                                           : DoubleToString(t72_a, 1))
7745:                                 : "readfail",
7746:                         t72_okB ? ((t72_b == EMPTY_VALUE) ? "EMPTY"
7747:                                                           : DoubleToString(t72_b, 1))
7748:                                 : "readfail",
7749:                         (int)t72_diff,
7750:                         TimeToString(iTime(_Symbol, PERIOD_CURRENT, t72_s),
7751:                                      TIME_DATE|TIME_MINUTES),
7752:                         StateName(g_state), DirName(g_dir), (int)g_divLatch,
7753:                         s_t72_hit1, s_t72_hit2, s_t72_mismatch);
7754:         }
7755:       if((s_t72_bars % 500) == 0)
7756:          PrintFormat("[SRJ-EA] CQDRECHECK_PROGRESS bars=%d hit1=%d hit2=%d mismatch=%d",
7757:                      s_t72_bars, s_t72_hit1, s_t72_hit2, s_t72_mismatch);
7758:      }
7759: 
### A2 (7760-8119)
7760:    //====================== [Task 78 / EA-80 tier reading] POI replacement ====
7761:    //--- Part A Step 8, D-3, G-2 and the carried ruling in section 6a: an
7762:    //--- OPPOSITE-DIRECTION retest of a HIGHER-HIERARCHY POI replaces the held
7763:    //--- candidate. The EA has never implemented it - arrival order won instead
7764:    //--- of authority - and Task 77 measured the cost. On 2026.08.11 a Daily-VWAP
7765:    //--- LONG candidate held the global singleton for 15 bars, never advanced
7766:    //--- past S1, died SESSION_CLOSED at 19:05, and suppressed the three
7767:    //--- Weekly-POC SHORT retests at bars 18:10 / 18:20 / 18:30 that produced the
7768:    //--- Task 75 signal. Those three are the ONLY tier-crossing instances among
7769:    //--- 23 higher=1 suppressions; the other 20 are POC-over-VWAP inside a single
7770:    //--- anchor tier.
7771:    //---
7772:    //--- "Higher hierarchy" is read as the ANCHOR TIER, not the 12-line rank, via
7773:    //--- g_authorityRank[]/2 - the identical tier collapse ComputeNearestTpTarget
7774:    //--- already applies to its POI candidates. No new constant and no new
7775:    //--- concept. Under the tier reading this fires on 3 of 23; under the rank
7776:    //--- reading it would fire on all 23, and widening later is the removal of
7777:    //--- two /2 operators. Implementing the narrower subset is correct under the
7778:    //--- tier ruling and merely incomplete under the rank ruling. EA-80 is NOT
7779:    //--- pre-empted by this edit.
7780:    //---
7781:    //--- G-5's same-direction higher-tier ANCHOR UPGRADE is deliberately NOT
7782:    //--- implemented here: all nine measured opp=0 higher=1 instances are
7783:    //--- intra-tier, so it has zero live instances under this reading.
7784:    //---
7785:    //--- Threshold-free: the tests are DIRECTION and TIER ORDER. No distance, no
7786:    //--- size, no bar count, no tolerance. Part A section 7 is not engaged.
7787:    //---
7788:    //--- Monotone within a sequence: the test requires a STRICTLY higher tier
7789:    //--- than the held anchor, so once anchored at the most authoritative tier
7790:    //--- present nothing can displace it and no oscillation is possible.
7791:    //---
7792:    //--- DetectPoiRetest is read-only - it fills a caller-owned struct from the
7793:    //--- 12 POI buffers and mutates no sequence state - and it already returns
7794:    //--- the MOST AUTHORITATIVE matching line. So once GoAbort has cleared the
7795:    //--- sequence, the IDLE block below re-detects that same line and seeds it.
7796:    //--- No seeding code is duplicated here.
7797:    //---
7798:    //--- Ã¢Ëœâ€¦ THIS SITE DELIBERATELY DOES NOT RETURN AFTER GoAbort. Ã¢Ëœâ€¦ Every other
7799:    //--- GoAbort call site returns; this one must fall through so the IDLE block
7800:    //--- seeds the replacement on the SAME bar. GoAbort sets ST_ABORT and then
7801:    //--- calls ResetSequence, leaving g_state == ST_IDLE, which is exactly the
7802:    //--- state the IDLE block requires. Section 3.7's no-early-return cascade is
7803:    //--- what makes same-bar promotion possible.
7804:    //---
7805:    //--- Placed BEFORE the Task 73 census so a replaced retest is not ALSO
7806:    //--- counted as suppressed - it was promoted, not discarded. That census is
7807:    //--- gated on g_state > ST_IDLE and so skips on a replacement bar.
7808:    //---
7809:    //--- One-bar divergence-latch consequence, accepted: the latch block sits
7810:    //--- ABOVE this one, so the replacement candidate's latch is first evaluated
7811:    //--- on the NEXT bar. Part A Step 7 latches at any point with no bar-count
7812:    //--- limit, so a one-bar delay can postpone a signal but cannot lose one -
7813:    //--- the same reasoning EA-78 records for CQD's shift-2-only visibility.
7814:    if(g_state > ST_IDLE && g_state != ST_ABORT && g_anchorLine >= 0 && inWindow)
7815:      {
7816:       PoiRetestResult t78_pr;
7817:       if(DetectPoiRetest(barShift, t78_pr) && t78_pr.found)
7818:         {
7819:           ENUM_SRJ_DIR t78_dir = t78_pr.isLong ? DIR_LONG : DIR_SHORT;
7820:           bool t78_opp  = (t78_dir != g_dir);
7821:           bool t78_tier = ((g_authorityRank[t78_pr.topLine] / 2) <
7822:                            (g_authorityRank[g_anchorLine]   / 2));
7823:           //--- [S2-PREEMPT-SHADOW-001] WOULD-PREEMPT recorder: reuses the computed
7824:           //--- t78_pr/t78_dir/t78_opp/t78_tier above (no fresh DetectPoiRetest call,
7825:           //--- no N1 touch — detection ran once). Record-only: locals + print only.
7826:           //--- FORBIDDEN in this shadow and ABSENT below: g_state / g_anchorLine /
7827:           //--- g_dir / anchor price-time / zone-touch-latch / GoAbort /
7828:           //--- ResetSequence / order-stop-eligibility-session writes
7829:           //--- (documented guarantee, grade-verified).
7830:           if(InpDebugLog && t78_opp)
7831:             {
7832:              int s1h_newTier  = g_authorityRank[t78_pr.topLine] / 2;
7833:              int s1h_heldTier = g_authorityRank[g_anchorLine]   / 2;
7834:              PrintFormat("[SRJ-EA] SIDE1H_WOULDPREEMPT bar=%s newPoi=%s newDir=%s heldPoi=%s heldDir=%s heldState=%s newTier=%d heldTier=%d wouldPreempt=%d wouldTierPassLegacy=%d",
7835:                          TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift),
7836:                                       TIME_DATE|TIME_MINUTES),
7837:                          g_lineCode[t78_pr.topLine], DirName(t78_dir),
7838:                          g_lineCode[g_anchorLine], DirName(g_dir),
7839:                          StateName(g_state),
7840:                          s1h_newTier, s1h_heldTier,
7841:                          ((g_state == ST_S2_LTF_ALIGN) ? 1 : 0),
7842:                          (t78_tier ? 1 : 0));
7843:             }
7844:           if(t78_opp && t78_tier)
7845:            {
7846:             PrintFormat("[SRJ-EA] POIREPLACE bar=%s newPoi=%s newDir=%s "
7847:                         "heldPoi=%s heldDir=%s heldState=%s newTier=%d heldTier=%d",
7848:                         TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift),
7849:                                      TIME_DATE|TIME_MINUTES),
7850:                         g_lineCode[t78_pr.topLine], DirName(t78_dir),
7851:                         g_lineCode[g_anchorLine], DirName(g_dir),
7852:                         StateName(g_state),
7853:                         g_authorityRank[t78_pr.topLine] / 2,
7854:                         g_authorityRank[g_anchorLine]   / 2);
7855:             /* [Task 91 / EA-105 / operator ruling Q3] REMOVED. Was GoAbort(ABORT_POI_REPLACED, g_state). Operator: "i will always execute the first one, the later higher POI does not get executed... if i have executed the first trade, i would not execute other trade even it's from higher hierarchy." Arrival order governs ACROSS TIME; anchor tier governs ONLY a same-bar tie between two completed candidates (EA-96), which MarkSessionUsed on the SIGNAL path already enforces. The across-time replacement reading of Part A Step 8 / D-3 / G-2 was a planner inference and is overturned. The POIREPLACE line above is RETAINED as a counterfactual census: it still prints on every bar this removal now lets pass, so the 16 firings measured on the Task 88 run stay countable. Threshold-free - nothing is added, one call is removed. */ ;
7856:             }
7857:           //--- [S2-CROSS-DIR-PREEMPT] live transfer (Luna V87-LIVE-PREEMPT-001
7858:           //--- §§3-6, cleared BY NAME; his selection token + fresh run word this
7859:           //--- turn). State-bounded: S2-held candidate yields to the observed; P-VNEXT-1 admits S1-held on opposite-confirm (unconfirmed held only).
7860:           //--- opposite-direction candidate. Region-P-equivalent MIRROR (no callable
7861:           //--- helper exists — Region P EA:7421-7467 is inline; deltas declared:
7862:           //--- (a) g_dir takes t78_dir, Region P keeps dir; (b) NO state write and
7863:           //--- NO LogState - state unchanged on either path (S2 stays S2, S1 stays S1), never ST_IDLE;
7864:           //--- (c) one InpDebugLog-gated SIDE1C_PREEMPT print, new family,
7865:           //--- observation only). Reuses computed t78_pr/t78_dir/t78_opp above (no
7866:           //--- fresh DetectPoiRetest, N1 untouched). Tier recorded, never consulted
7867:           //--- (no <, no <=). Placed AFTER the POIREPLACE census above (D4) so the
7868:           //--- census labels stay pre-transfer and byte-comparable.
7869:           //--- [P-VNEXT-1 E1] confirmed-opposite displaces unconfirmed-held (his setup-definition 2026-09-22): opposite booked retest with confirm=1 takes the anchor when the held candidate confirms 0. S1-gated: the N1-instrumented predicate runs only where consumed. Declarations hoisted one level so the widened transfer condition below can read them (block scope).
7870:           bool t78_opConf = false, t78_heldConf = false;
7871:           if(g_state == ST_S1_REGIME && t78_opp)
7872:             {
7873:              string t78_failOp = "", t78_failHeld = "";
7874:              t78_opConf = IsConfirmationCandle(barShift, t78_pr.topLine, t78_dir, t78_failOp);
7875:              t78_heldConf = IsConfirmationCandle(barShift, g_anchorLine, g_dir, t78_failHeld);
7876:              if(InpDebugLog) PrintFormat("[SRJ-EA] UJOPCONF bar=%s poi=%s dir=%s opConf=%d heldConf=%d opTerm=%s heldTerm=%s - displace-gate inputs (Fix H1)", TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES), g_lineCode[t78_pr.topLine], DirName(t78_dir), (int)t78_opConf, (int)t78_heldConf, t78_failOp, t78_failHeld);
7877:               if(!t78_opConf && !t78_heldConf && !SessionAlreadyUsed(sess, barTime) && (t78_pr.topLine != g_anchorLine || t78_dir != g_dir))
7878:                 {
7879:                  bool t78_al = false; bool t78_alOk = CheckLtfAlign(barShift, t78_dir, t78_al);
7880:                  if(InpDebugLog) PrintFormat("[SRJ-EA] UJRESEED bar=%s poi=%s dir=%s fromPoi=%s fromDir=%s al=%d ok=%d - op-retest reseeded over unconfirmed holder (Fix H1)", TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES), g_lineCode[t78_pr.topLine], DirName(t78_dir), g_lineCode[g_anchorLine], DirName(g_dir), (t78_alOk ? (t78_al ? 1 : 0) : -1), (int)t78_alOk);
7881:                  s1g_legDir = t78_pr.isLong ? 1 : -1;
7882:                  s1g_seedBiasAl = (!t78_alOk ? -1 : (t78_al ? 1 : 0));
7883:                  g_anchorLine = t78_pr.topLine;
7884:                  ReadBuf1(g_hPoi, t78_pr.topLine, g_anchorPrice, barShift);
7885:                  g_anchorBarTime = barTime;
7886:                  g_dir = S2ResolveLive(t78_pr.isLong ? DIR_LONG : DIR_SHORT);
7887:                  g_sessionAtEntry = sess;
7888:                  g_zoneHi = 0.0;
7889:                  g_zoneLo = 0.0;
7890:                  g_touchSeen = false;
7891:                  g_touchBarHi = 0.0;
7892:                  g_touchBarLo = 0.0;
7893:                  g_latchedEntry = 0.0;
7894:                  g_latchedSl = 0.0;
7895:                  g_latchedTp = 0.0;
7896:                  g_latchedR = 0.0;
7897:                  g_latchBarTime = 0;
7898:                  g_confirmFromState = ST_IDLE;
7899:                  uj_memo_valid = false;
7900:                  g_ujOpReseedBarTime = barTime;
7901:                  g_ujOpReseedDir = (g_dir == DIR_LONG ? 1 : (g_dir == DIR_SHORT ? -1 : 0));
7902:                 }
7903:              }
7904:           if(t78_opp && (g_state == ST_S2_LTF_ALIGN || (g_state == ST_S1_REGIME && t78_opConf && !t78_heldConf)))
7905:             {
7906:              int s1c_fromLine     = g_anchorLine;
7907:              ENUM_SRJ_DIR s1c_fromDir = g_dir;
7908:              g_anchorLine    = t78_pr.topLine;
7909:              ReadBuf1(g_hPoi, t78_pr.topLine, g_anchorPrice, barShift);
7910:              g_anchorBarTime = barTime;
7911:              g_dir           = t78_dir;
7912:              g_zoneHi        = 0.0;
7913:              g_zoneLo        = 0.0;
7914:              g_touchSeen     = false;
7915:              g_touchBarHi    = 0.0;
7916:              g_touchBarLo    = 0.0;
7917:              g_latchedEntry  = 0.0;
7918:              g_latchedSl     = 0.0;
7919:              g_latchedTp     = 0.0;
7920:              g_latchedR      = 0.0;
7921:              g_latchBarTime  = 0;
7922:              g_confirmFromState = ST_IDLE;
7923:              if(InpDebugLog)
7924:                 PrintFormat("[SRJ-EA] SIDE1C_PREEMPT bar=%s from=%s fromDir=%s to=%s toDir=%s state=%s",
7925:                             TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift),
7926:                                          TIME_DATE|TIME_MINUTES),
7927:                             g_lineCode[s1c_fromLine], DirName(s1c_fromDir),
7928:                             g_lineCode[t78_pr.topLine], DirName(t78_dir),
7929:                             StateName(g_state));
7930:             }
7931:          }
7932:       }
7933: 
7934:     //--- [P-BUILD3 E3 2026-09-11] the live supersession poll (spec 3.4 L120:
7935:    //--- a same-direction higher-tier POI touch mid-sequence upgrades the anchor
7936:    //--- tier silently; spec 6: arrival order still governs across time, so this
7937:    //--- re-binds WITHIN the alive candidate only). Pre-fire states S1-S4;
7938:    //--- IDLE (seed owns it), S5+ (guard 4) never reach here. Regime/LTF kept
7939:    //--- (line-agnostic progress); the anchor-relative legs re-derive (zone and
7940:    //--- touch unbind; S3/S4 fall back to S3_ZONE_WAIT so arming re-runs).
7941:    //--- Runs BEFORE the t73 census so a promoted line is not ALSO counted as
7942:    //--- suppressed (the Task-78 placement discipline). Sets b3_superseded for E4.
7943:    bool b3_superseded = false;
7944:    if(inWindow &&
7945:       (g_state == ST_S1_REGIME || g_state == ST_S2_LTF_ALIGN ||
7946:        g_state == ST_S3_ZONE_WAIT || g_state == ST_S4_ARMED) &&
7947:       g_anchorLine >= 0 && g_dir != DIR_NONE)
7948:      {
7949:       int b3_cand = B3_ElectAnchor(barShift, g_dir);
7950:       if(b3_cand >= 0 &&
7951:          B3_AnchorTier(b3_cand) < B3_AnchorTier(g_anchorLine) &&
7952:          sess == g_sessionAtEntry)
7953:         {
7954:          int b3_from      = g_anchorLine;
7955:          int b3_fromRank  = g_authorityRank[b3_from];
7956:          int b3_fromTier  = B3_AnchorTier(b3_from);
7957:          int b3_toRank    = g_authorityRank[b3_cand];
7958:          int b3_toTier    = B3_AnchorTier(b3_cand);
7959:          ENUM_SRJ_STATE b3_prevState = g_state;
7960:          g_anchorLine    = b3_cand;
7961:          ReadBuf1(g_hPoi, b3_cand, g_anchorPrice, barShift);
7962:          g_anchorBarTime = barTime;
7963:          g_zoneHi        = 0.0;
7964:          g_zoneLo        = 0.0;
7965:          g_touchSeen     = false;
7966:          g_touchBarHi    = 0.0;
7967:          g_touchBarLo    = 0.0;
7968:          g_latchedEntry  = 0.0;
7969:          g_latchedSl     = 0.0;
7970:          g_latchedTp     = 0.0;
7971:          g_latchedR      = 0.0;
7972:          g_latchBarTime  = 0;
7973:          g_confirmFromState = ST_IDLE;
7974:          if(g_state == ST_S3_ZONE_WAIT || g_state == ST_S4_ARMED)
7975:            {
7976:             ENUM_SRJ_STATE b3_prev = g_state;
7977:             g_state = ST_S3_ZONE_WAIT;
7978:             LogState(b3_prev, g_state);
7979:            }
7980:          b3_superseded = true;
7981:          if(InpDebugLog)
7982:             PrintFormat("[SRJ-EA] ANCHOR_SUPERSEDE bar=%s from=%s rank=%d tier=%d to=%s rank=%d tier=%d dir=%s state=%s",
7983:                         TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift),
7984:                                      TIME_DATE|TIME_MINUTES),
7985:                         g_lineCode[b3_from], b3_fromRank, b3_fromTier,
7986:                         g_lineCode[b3_cand], b3_toRank, b3_toTier,
7987:                         DirName(g_dir), StateName(b3_prevState));
7988:         }
7989:      }
7990: 
7991:    //--- [Task 73 / Stage 3 cost side] Suppression census. DIAGNOSTIC ONLY.
7992:    //--- Two unmeasured quantities, both needed before Stage 3 is sized:
7993:    //---   1. The singleton discards every POI retest that arrives while a
7994:    //---      sequence is alive. 103 candidates were ADMITTED across this
7995:    //---      window; how many were silently dropped is unknown, and Stage 3
7996:    //---      lengthens candidate lifetime, so it raises that number.
7997:    //---   2. Part A carries a rule the EA does not implement - an
7998:    //---      opposite-direction HIGHER-TIER retest replaces the candidate.
7999:    //---      Its frequency has never been counted.
8000:    //---
8001:    //--- DetectPoiRetest is read-only: it fills a caller-owned struct from the
8002:    //--- 12 POI buffers and mutates no sequence state. It is called here on the
8003:    //--- SAME barShift the live cascade uses, so a hit is exactly a retest the
8004:    //--- IDLE block would have consumed had the singleton been free.
8005:    //---
8006:    //--- Tier comparison uses g_authorityRank (lower is more authoritative),
8007:    //--- the same ranking D-3 and G-2 already use. No distance, no size, no bar
8008:    //--- count, no tolerance - Part A section 7 is not engaged.
8009:    //---
8010:    //--- Gated on InpDebugLog. Assigns nothing outside its own statics, reads
8011:    //--- g_state / g_dir / g_anchorLine for labelling only, and cannot alter
8012:    //--- control flow. R8 is NOT engaged.
8013:    if(InpDebugLog && inWindow &&
8014:       g_state > ST_IDLE && g_state != ST_ABORT && g_anchorLine >= 0)
8015:      {
8016:       static int s_t73_n      = 0;
8017:       static int s_t73_higher = 0;
8018:       static int s_t73_opp    = 0;
8019:       static int s_t73_both   = 0;
8020:       static int s_t73_bars   = 0;
8021:       s_t73_bars++;
8022:       PoiRetestResult t73_pr;
8023:       if(DetectPoiRetest(barShift, t73_pr) && t73_pr.found)
8024:         {
8025:          s_t73_n++;
8026:          ENUM_SRJ_DIR t73_dir    = t73_pr.isLong ? DIR_LONG : DIR_SHORT;
8027:          bool         t73_isOpp  = (t73_dir != g_dir);
8028:          bool         t73_isHigh = (g_authorityRank[t73_pr.topLine] <
8029:                                     g_authorityRank[g_anchorLine]);
8030:          if(t73_isHigh)               s_t73_higher++;
8031:          if(t73_isOpp)                s_t73_opp++;
8032:          if(t73_isOpp && t73_isHigh)  s_t73_both++;
8033:          PrintFormat("[SRJ-EA] SUPPRESSED bar=%s poi=%s dir=%s opp=%d higher=%d "
8034:                      "heldPoi=%s heldDir=%s heldState=%s "
8035:                      "cum_n=%d cum_opp=%d cum_hi=%d cum_both=%d action=%s",
8036:                      TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift),
8037:                                   TIME_DATE|TIME_MINUTES),
8038:                      g_lineCode[t73_pr.topLine], DirName(t73_dir),
8039:                      (int)t73_isOpp, (int)t73_isHigh,
8040:                      g_lineCode[g_anchorLine], DirName(g_dir), StateName(g_state),
8041:                      s_t73_n, s_t73_opp, s_t73_higher, s_t73_both,
8042:                      b3_superseded ? "SUPERSEDED" : "HELD");
8043:         }
8044:       if((s_t73_bars % 500) == 0)
8045:          PrintFormat("[SRJ-EA] SUPPRESSED_PROGRESS heldBars=%d n=%d opp=%d "
8046:                      "higher=%d both=%d",
8047:                      s_t73_bars, s_t73_n, s_t73_opp, s_t73_higher, s_t73_both);
8048:      }
8049: 
8050:    //--- [P-CONFIRM-SHADOW] per-bar retest book + confirmation-candle terms. LOG ONLY -
8051:    //--- reads buffers and prints; assigns no state. With a candidate held, CONFIRMPOLL
8052:    //--- runs against the held anchor; in IDLE it polls the top-ranked same-direction
8053:    //--- retest of the bar (the seed's own input) so the calibration covers the pre-seed
8054:    //--- bars too.
8055:    if(InpDebugLog && (SHADOW_RETESTBOOK || SHADOW_CONFIRMPOLL) && inWindow)
8056:      {
8057:       ShadowRetestBook(barShift);
8058:       ShadowRetestNearMiss(barShift);
8059:       if(g_state > ST_IDLE && g_state != ST_ABORT && g_anchorLine >= 0)
8060:          ShadowConfirmPoll(barShift, g_anchorLine, g_dir);
8061:       else if(g_state == ST_IDLE)
8062:         {
8063:          PoiRetestResult sh_pr;
8064:          if(DetectPoiRetest(barShift, sh_pr) && sh_pr.found)
8065:             ShadowConfirmPoll(barShift, sh_pr.topLine,
8066:                               sh_pr.isLong ? DIR_LONG : DIR_SHORT);
8067:         }
8068:       }
8069: 
8070:     bool s1f_seedArmed = (g_state == ST_IDLE);   //--- [SIDE1F] (i) seed-bar exactness flag (new local only)
8071: 
8072:     if(g_state == ST_IDLE)
8073:       {
8074:        if(!inWindow) { if(InpDebugLog && TimeToString(barTime, TIME_MINUTES) == "17:00") PrintFormat("[SRJ-EA] SEEDDIAG bar=%s branch=WINDOW inWin=0 sess=%s retestFound=%d", TimeToString(barTime, TIME_DATE|TIME_MINUTES), SessionName(sess), -1); return; }
8075:       if(SessionAlreadyUsed(sess, barTime))
8076:         {
8077:          static datetime s_limitDay  = 0;
8078:          static int      s_limitSess = -1;
8079:          datetime dayKey = TC_DayStart(barTime);
8080:          if(InpDebugLog && (dayKey != s_limitDay || (int)sess != s_limitSess))
8081:            {
8082:             s_limitDay  = dayKey;
8083:             s_limitSess = (int)sess;
8084:             PrintFormat("[SRJ-EA] %s SESSION_LIMIT: %s window already used today - "
8085:                         "all further candidates suppressed until the next window",
8086:                         TimeToString(TimeCurrent(), TIME_DATE|TIME_SECONDS),
8087:                         SessionName(sess));
8088:            }
8089:          if(InpDebugLog && TimeToString(barTime, TIME_MINUTES) == "17:00") PrintFormat("[SRJ-EA] SEEDDIAG bar=%s branch=SESSION inWin=1 sess=%s retestFound=%d", TimeToString(barTime, TIME_DATE|TIME_MINUTES), SessionName(sess), -1);
8090:          return;
8091:         }
8092:         PoiRetestResult pr;
8093:         if(!DetectPoiRetest(barShift, pr) || !pr.found) { if(InpDebugLog && TimeToString(barTime, TIME_MINUTES) == "17:00") PrintFormat("[SRJ-EA] SEEDDIAG bar=%s branch=RETEST inWin=1 sess=%s retestFound=%d", TimeToString(barTime, TIME_DATE|TIME_MINUTES), SessionName(sess), (pr.found ? 1 : 0)); return; }
8094:         //--- [P-RESQUAT-1 F-a] eviction-paired read gate: a candidate identical to
8095:         //--- one its own abort just evicted (same line, same dir, same session,
8096:         //--- same day) may not re-seed into the slot; the slot stays free so the
8097:         //--- next evaluation consumes the next bar (the 57 convergence, W6b).
8098:         //--- EXPIRE: a day-mismatched set is nonblocking and cleared here;
8099:         //--- no timer, no bar count (R-b).
8100:         ENUM_SRJ_DIR rsq_dir = pr.isLong ? DIR_LONG : DIR_SHORT;
8101:         int rsq_bit = (pr.topLine >= 0 && pr.topLine < POI_NLINES) ? pr.topLine * 2 + (pr.isLong ? 0 : 1) : -1;
8102:         bool rsq_blocked = false;
8103:         datetime rsq_day = TC_DayStart(barTime);
8104:         if(rsq_bit < 0)
8105:           {
8106:            PrintFormat("[SRJ-EA] RESEED_BLOCKED bar=%s action=INDEX-INVALID", TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES));
8107:            return;
8108:           }
8109:         if(sess == SESSION_LONDON)
8110:           {
8111:            if(rsq_day != g_evictDayLon) g_evictBitsLon = 0;
8112:            else if(rsq_bit >= 0 && (g_evictBitsLon & (1 << rsq_bit)) != 0) rsq_blocked = true;
8113:           }
8114:         else if(sess == SESSION_NYAM)
8115:           {
8116:            if(rsq_day != g_evictDayNY) g_evictBitsNY = 0;
8117:            else if(rsq_bit >= 0 && (g_evictBitsNY & (1 << rsq_bit)) != 0) rsq_blocked = true;
8118:           }
8119:         if(rsq_blocked)
### A3 (8120-8476)
8120:           {
8121:            PrintFormat("[SRJ-EA] RESEED_BLOCKED bar=%s poi=%s dir=%s sess=%s evictedDay=%s action=SKIP",
8122:                        TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES),
8123:                        g_lineCode[pr.topLine], DirName(rsq_dir), SessionName(sess),
8124:                        TimeToString(rsq_day, TIME_DATE));
8125:            return;
8126:           }
8127:         s1g_legDir = pr.isLong ? 1 : -1;   //--- [SIDE1G] (0) independent legDir capture (new local only)
8128:         g_s2_seedShift = barShift;   //--- [STAGE-C E-C05] exact-seed bar carriage for the live vote
8129:          g_anchorLine    = pr.topLine;
8130:        //--- [FP-LIMBSEAT-1 S2-3] F3 owns the carried-side write (single
8131:        //--- writer). Live rows carry no declared class -> ABSTAIN
8132:        //--- pass-through of the legacy value (D3 holds by construction);
8133:        //--- legacy output stays the compared label, fire-log identical.
8134:        g_dir           = S2ResolveLive(pr.isLong ? DIR_LONG : DIR_SHORT);
8135:         SrjSideNote("DetectPoiRetest", g_dir);
8136:       g_anchorBarTime = barTime;
8137:       ReadBuf1(g_hPoi, pr.topLine, g_anchorPrice, barShift);
8138:       g_sessionAtEntry = sess;
8139:       g_divLatch = false;
8140:       ENUM_SRJ_STATE prev = g_state;
8141:       g_state = ST_S1_REGIME;
8142:       LogState(prev, g_state);
8143:       //--- [P-BUILD3 E2] seed census: the detector already returns argmin(rank);
8144:       //--- tier-best == rank-best at seed (no held line), so ElectAnchor parity
8145:       //--- holds by construction. Additive print only; assigns nothing.
8146:       if(InpDebugLog)
8147:          PrintFormat("[SRJ-EA] ANCHOR_ELECT bar=%s action=SEED poi=%s rank=%d tier=%d dir=%s",
8148:                      TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift),
8149:                                   TIME_DATE|TIME_MINUTES),
8150:                      AnchorStr(), g_authorityRank[g_anchorLine],
8151:                       B3_AnchorTier(g_anchorLine), DirName(g_dir));
8152:          }
8153: 
8154:     //--- [P-VALIDITY-1 R2 2026-09-22, his renewal word: a held pre-confirmation seed dies on a session-liquidity touch, retest bar included; entry then needs a fresh POC/VWAP retest. Placed after the per-bar seed block: single pass per bar blocks same-bar re-admission. Fires ST_S1..ST_S4 named set only; S5+ committed; runs before the state-machine body; touch test reads pre-bar line state so extension bars don't false-fire; pre-bar swept-mask exclusion (Luna-2): R-POOL indices already swept as of barShift+1 skipped via disk-derived map, current-bar sweep still counts; tri-state (Luna-B): valid mask excludes, unavailable-or-invalid mask = R2SKIP hold with row; eval counter proves cadence.]
8155:     if(g_state > ST_IDLE && g_state < ST_S5_GATE_CHECK && g_anchorBarTime > 0)
8156:      {
8157:       double r2_hi = iHigh(_Symbol, PERIOD_CURRENT, barShift);
8158:       double r2_lo = iLow(_Symbol, PERIOD_CURRENT, barShift);
8159:       const int r2_bufs[18] = { FL_BUF_PDAY_HIGH, FL_BUF_PDAY_LOW, FL_BUF_ASIA_HIGH, FL_BUF_ASIA_LOW, FL_BUF_LONDON_HIGH, FL_BUF_LONDON_LOW, FL_BUF_NY_HIGH, FL_BUF_NY_LOW, FL_BUF_PM_HIGH, FL_BUF_PM_LOW, FL_BUF_PD_ASIA_HIGH, FL_BUF_PD_ASIA_LOW, FL_BUF_PD_LONDON_HIGH, FL_BUF_PD_LONDON_LOW, FL_BUF_PD_NY_HIGH, FL_BUF_PD_NY_LOW, FL_BUF_PD_PM_HIGH, FL_BUF_PD_PM_LOW };
8160:       bool r2_touch = false;
8161:       double r2_val = 0.0;
8162:       int r2_buf = -1;
8163:       double r2_mask;
8164:       if(!ReadFlow(FL_BUF_SWEPT_MASK, r2_mask, barShift + 1)) r2_mask = EMPTY_VALUE;
8165:       bool r2_mValid = (MathIsValidNumber(r2_mask) && r2_mask == MathFloor(r2_mask) && r2_mask >= 0.0 && r2_mask < 4194304.0);
8166:       int r2_m = (r2_mValid ? (int)MathRound(r2_mask) : 0);
8167:       static int r2_evals = 0;
8168:       if(!r2_mValid && InpDebugLog) PrintFormat("[SRJ-EA] R2SKIP bar=%s evals=%d (mask unavailable or invalid - seed held)", TimeToString(barTime, TIME_DATE|TIME_MINUTES), r2_evals);
8169:       if(r2_mValid) r2_evals++;
8170:       for(int r2_k = 0; r2_k < 18 && !r2_touch && r2_mValid; r2_k++)
8171:         {
8172:          double r2_v;
8173:          int r2_sweptBit = (r2_k <= 9 ? r2_k : r2_k + 4);
8174:          if((r2_m & (1 << r2_sweptBit)) != 0) continue;
8175:          if(ReadFlow(r2_bufs[r2_k], r2_v, barShift + 1) && r2_lo <= r2_v && r2_v <= r2_hi)
8176:             { r2_touch = true; r2_val = r2_v; r2_buf = r2_bufs[r2_k]; }
8177:          }
8178:       if(r2_touch && g_regime == REGIME_MEANREV)
8179:         {
8180:          ENUM_SRJ_STATE r2_prev = g_state;
8181:          g_state = ST_IDLE;
8182:          g_anchorLine = -1;
8183:          g_anchorBarTime = 0;
8184:          LogState(r2_prev, g_state);
8185:          if(InpDebugLog) PrintFormat("[SRJ-EA] SEEDVOID bar=%s dir=%s buf=%d line=%s evals=%d hi=%s lo=%s", TimeToString(barTime, TIME_DATE|TIME_MINUTES), DirName(g_dir), r2_buf, DoubleToString(r2_val, _Digits), r2_evals, DoubleToString(r2_hi, _Digits), DoubleToString(r2_lo, _Digits));
8186:         }
8187:      }
8188:          //--- [S2-TIMING-SHADOW-001] seed-bias recorder (Luna V94 F1, cleared BY NAME
8189:          //--- print-only). Record-only: locals + print. Reuses CheckLtfAlign — the SAME
8190:          //--- pure helper the S2 path calls (EA:7787), same buffer/semantics; NO new bias
8191:           //--- computation (Sonnet build flag). Candidate dir = detector dir via s1g_legDir (equals pr.isLong on a seed bar), matching
8192:          //--- the authored candidateDirection. Flip observed at grade via later rows
8193:          //--- (pre-declared derivation). FORBIDDEN/ABSENT: any state/dir/latch/order/
8194:           //--- stop/N1 write (documented guarantee, grade-verified).
8195:           //--- Seed-gated per the s1f_seedThisBar idiom (EA:7664): emits only on the bar the seed fires.
8196:           if(s1f_seedArmed && g_state == ST_S1_REGIME && g_dir != DIR_NONE && g_anchorLine >= 0)
8197:            {
8198:             bool s1t_aligned = false;
8199:             string s1t_alOk = "UNREAD";
8200:             ENUM_SRJ_DIR s1t_candDir = (s1g_legDir > 0 ? DIR_LONG : DIR_SHORT);   //--- seed-bar pr via file-scope capture (EA:1038 decl, assigned 7609 this pass)
8201:              if(CheckLtfAlign(barShift, s1t_candDir, s1t_aligned))
8202:                 s1t_alOk = s1t_aligned ? "1" : "0";
8203:              s1g_seedBiasAl = ((s1t_alOk == "UNREAD") ? -1 : (s1t_aligned ? 1 : 0));   //--- [STAGE-D-S2-RGATE-001] seed-bias carriage (print-only file-scope; single-candidate machine + IDLE-gated reseed mean the eval reads its own seed; -1 guards never-seeded)
8204:             if(InpDebugLog) PrintFormat("[SRJ-EA] SIDE1T_SEEDBIAS bar=%s dir=%s biasAligned=%s verdict=%s",
8205:                         TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift),
8206:                                      TIME_DATE|TIME_MINUTES),
8207:                         DirName(s1t_candDir),
8208:                         s1t_alOk,
8209:                          (s1t_alOk == "1") ? "CONSIDER" : "REJECT-BIAS-TIMING");
8210:             }
8211:           //--- [P-BIRTH-PROBE-001] dual-reading birth probe (Luna V105-DUAL-READ-CLEAR-001, cleared BY NAME
8212:           //--- print-only). At EVERY seed (same gate as SIDE1T): TF-verdict for SHORT (HTF bufs 19/20/21
8213:           //--- 2-of-3, INLINE-DUPLICATE of the ClassifyRegime trend part — its function-statics are
8214:           //--- unrestorable, pure reads only, zero new semantics) AND MR-verdict for SHORT (sweep-tag
8215:           //--- dir-match: SHORT needs a swept HIGH) printed SEPARATELY (row-type to council grade) +
8216:           //--- confirm-for-SHORT via IsConfirmationCandle(DIR_SHORT) with N1 save/restore (6 counters:
8217:           //--- vwapEq/pocEq/vwapInv/pocInv/vwapSurv/pocSurv — the file-wide 14 conflated in an "8"
8218:           //--- miscount, owned; exactly these 6 written in 2096-2137). Seed-identity: everything here is
8219:           //--- seed-current at the seed tick (barShift/g_anchorLine/s1g_legDir), so D5 holds trivially —
8220:           //--- no staleness possible, no live-global re-read. No-race enforced AT GRADE (D6:
8221:           //--- transfer-claimed lineages labeled via the PREEMPT join). FORBIDDEN/ABSENT: any state/dir/
8222:           //--- latch/order/stop/N1 write (N1 restored), OrderSend, AdoptOff touch, fresh Detect calls,
8223:           //--- price literals. tf=-1 guards HTF-read failure (grade asserts 0 occurrences).
8224:           if(InpDebugLog && s1f_seedArmed && g_state == ST_S1_REGIME && g_dir != DIR_NONE && g_anchorLine >= 0)
8225:             {
8226:              double s1v_hH = 0.0, s1v_hM = 0.0, s1v_hL = 0.0;
8227:              int s1v_hOk = 0, s1v_votes = 0;
8228:              if(ReadFlow(FL_BUF_HTF_HIGH, s1v_hH, barShift) && ReadFlow(FL_BUF_HTF_MID, s1v_hM, barShift) && ReadFlow(FL_BUF_HTF_LOW, s1v_hL, barShift))
8229:                {
8230:                 s1v_hOk = 1;
8231:                 if((int)MathRound(s1v_hH) == -1) s1v_votes++;
8232:                 if((int)MathRound(s1v_hM) == -1) s1v_votes++;
8233:                 if((int)MathRound(s1v_hL) == -1) s1v_votes++;
8234:                }
8235:              int s1v_tf = ((s1v_hOk == 0) ? -1 : ((s1v_votes >= 2) ? 1 : 0));
8236:              double s1v_swD = 0.0;
8237:              int s1v_tag = 0;
8238:              if(ReadFlow(FL_BUF_SWEEP_TAG, s1v_swD, barShift)) s1v_tag = (int)MathRound(s1v_swD);
8239:              int s1v_mr = (((s1v_tag == SWEEP_ASIA_HIGH) || (s1v_tag == SWEEP_LONDON_HIGH) || (s1v_tag == SWEEP_NY_HIGH) || (s1v_tag == SWEEP_PM_HIGH)) ? 1 : 0);
8240:              int s1v_wEq = g_n1_vwapEq, s1v_poEq = g_n1_pocEq, s1v_wIv = g_n1_vwapInv, s1v_poIv = g_n1_pocInv, s1v_wSv = g_n1_vwapSurv, s1v_poSv = g_n1_pocSurv;
8241:              string s1v_term = "";
8242:              IsConfirmationCandle(barShift, g_anchorLine, DIR_SHORT, s1v_term);
8243:              g_n1_vwapEq = s1v_wEq; g_n1_pocEq = s1v_poEq; g_n1_vwapInv = s1v_wIv; g_n1_pocInv = s1v_poIv; g_n1_vwapSurv = s1v_wSv; g_n1_pocSurv = s1v_poSv;
8244:              if(s1v_term == "") s1v_term = "PASS";
8245:              PrintFormat("[SRJ-EA] SIDE1V_BIRTH bar=%s dir=SHORT tf=%d mr=%d confShort=%s",
8246:                          TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift),
8247:                                       TIME_DATE|TIME_MINUTES),
8248:                          s1v_tf, s1v_mr, s1v_term);
8249:             }
8250: 
8251:     //--- [SIDE-1P-FIX-SPLIT Track-1/Track-2 AdoptOff shadow] print-only recorders.
8252:    //--- Reads assigned state only. The gate consult's 6 N1 counter writes are
8253:    //--- restored like-for-like (values identical after); every other call is pure.
8254:    //--- No live-state, resolver, latch, order, stop, fixture or eligibility write.
8255:    //--- Fires only on the exact seed bar (armed==IDLE at block entry, S1 after).
8256:     {
8257:      bool s1f_seedThisBar = (s1f_seedArmed && g_state == ST_S1_REGIME && g_dir != DIR_NONE && g_anchorLine >= 0);
8258:      if(s1f_seedThisBar)
8259:        {
8260:         s1g_nSeed++;
8261:         int s1f_vwEq = g_n1_vwapEq;
8262:         int s1f_poEq = g_n1_pocEq;
8263:         int s1f_vwIv = g_n1_vwapInv;
8264:         int s1f_poIv = g_n1_pocInv;
8265:         int s1f_vwSv = g_n1_vwapSurv;
8266:         int s1f_poSv = g_n1_pocSurv;
8267:         string s1f_term = "";
8268:          bool s1f_ok = IsConfirmationCandle(barShift, g_anchorLine, (s1g_legDir > 0 ? DIR_LONG : DIR_SHORT), s1f_term);   //--- [STAGE-C] legacy-pin: shadow diagnoses the legacy path (G-C01/G-C06 parity; value-identical pre-Stage-C)
8269:         g_n1_vwapEq = s1f_vwEq;
8270:         g_n1_pocEq = s1f_poEq;
8271:         g_n1_vwapInv = s1f_vwIv;
8272:         g_n1_pocInv = s1f_poIv;
8273:         g_n1_vwapSurv = s1f_vwSv;
8274:         g_n1_pocSurv = s1f_poSv;
8275:         double s1f_h4 = EMPTY_VALUE;
8276:         double s1f_h1 = EMPTY_VALUE;
8277:         ReadFlow(FL_BUF_HTF_HIGH, s1f_h4, barShift);
8278:         ReadFlow(FL_BUF_HTF_MID, s1f_h1, barShift);
8279:         int s1f_l4 = S2Leg(s1f_h4);
8280:         int s1f_l1 = S2Leg(s1f_h1);
8281:         string s1f_hier = "-";
8282:         int s1f_conf = 0;
8283:         if(s1f_l4 != 0 && s1f_l4 == s1f_l1) s1f_hier = (s1f_l4 > 0) ? "LONG" : "SHORT";
8284:         else if(s1f_l4 != 0 && s1f_l1 != 0) s1f_conf = 1;
8285:         if(InpDebugLog)
8286:            PrintFormat("[SRJ-EA] SIDE1F_VOTE bar=%s dir=%s t1term=%s t1reject=%d hier=%s conf=%d",
8287:                        TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES),
8288:                        DirName(g_dir), s1f_term, (s1f_ok ? 0 : 1), s1f_hier, s1f_conf);
8289:         if(s1f_hier == "SHORT" && InpDebugLog)
8290:            PrintFormat("[SRJ-EA] SIDE1F_SHORT bar=%s anchor=%s",
8291:                        TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES),
8292:                        AnchorStr());
8293:         //--- [SIDE1G] R1 PROFILE mirror (independent term booleans + pre-terms; NO second gate call)
8294:         double s1g_o1 = iOpen (_Symbol, PERIOD_CURRENT, barShift + 1);
8295:         double s1g_c1 = iClose(_Symbol, PERIOD_CURRENT, barShift + 1);
8296:         double s1g_h1 = iHigh (_Symbol, PERIOD_CURRENT, barShift + 1);
8297:         double s1g_l1 = iLow  (_Symbol, PERIOD_CURRENT, barShift + 1);
8298:         double s1g_o0 = iOpen (_Symbol, PERIOD_CURRENT, barShift);
8299:         double s1g_c0 = iClose(_Symbol, PERIOD_CURRENT, barShift);
8300:         string s1g_pre = "PASS";
8301:         if(s1g_o1 <= 0.0 || s1g_c1 <= 0.0 || s1g_o0 <= 0.0 || s1g_c0 <= 0.0) s1g_pre = "NO_DATA";
8302:         double s1g_L = g_anchorPrice;
8303:         if(s1g_pre == "PASS" && (s1g_L == EMPTY_VALUE || s1g_L <= 0.0)) s1g_pre = "NO_LINE";
8304:         int s1g_opp = (((g_dir == DIR_LONG) ? (s1g_c1 < s1g_o1) : (s1g_c1 > s1g_o1))) ? 1 : 0;
8305:         int s1g_a2 = (((g_dir == DIR_LONG) ? (s1g_c1 >= s1g_L) : (s1g_c1 <= s1g_L))) ? 1 : 0;
8306:         int s1g_isDoji = ((MathAbs(s1g_c0 - s1g_o0) < _Point * 0.0001)) ? 1 : 0;
8307:         int s1g_bodyDir = (((g_dir == DIR_LONG) ? (s1g_c0 > s1g_o0) : (s1g_c0 < s1g_o0))) ? 1 : 0;
8308:         int s1g_body = ((s1g_isDoji == 0) && (s1g_bodyDir == 1)) ? 1 : 0;
8309:         int s1g_touch = (((s1g_h1 >= s1g_L - _Point) && (s1g_l1 <= s1g_L + _Point))) ? 1 : 0;
8310:         string s1g_derived = (s1g_pre != "PASS") ? s1g_pre : ((s1g_opp == 0) ? "A_OPP" : ((s1g_a2 == 0) ? "A2_CLOSE_BREAK" : ((s1g_body == 0) ? "B_BODY" : ((s1g_touch == 0) ? "C_TOUCH" : "PASS"))));
8311:         string s1g_t1 = (s1f_term == "") ? "PASS" : s1f_term;
8312:         int s1g_match = (s1g_derived == s1g_t1) ? 1 : 0;
8313:         s1g_nProf++;
8314:         if(InpDebugLog)
8315:            PrintFormat("[SRJ-EA] SIDE1G_PROFILE bar=%s opp=%d a2=%d body=%d touch=%d pre=%s term=%s t1term=%s match=%d",
8316:                        TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES),
8317:                        s1g_opp, s1g_a2, s1g_body, s1g_touch, s1g_pre, s1g_derived, s1g_t1, s1g_match);
8318:         //--- [SIDE1G] R2 VOTE3 (legDir capture vs buffer vote + 15m read-only leg)
8319:         double s1g_m15 = EMPTY_VALUE;
8320:         ReadFlow(FL_BUF_HTF_LOW, s1g_m15, barShift);
8321:         int s1g_lm = S2Leg(s1g_m15);
8322:         int s1g_agree = ((s1f_l4 != 0) && (s1f_l4 == s1f_l1) && (s1g_legDir == s1f_l4)) ? 1 : 0;
8323:         s1g_nV3++;
8324:         if(InpDebugLog)
8325:            PrintFormat("[SRJ-EA] SIDE1G_VOTE3 bar=%s h4=%s h1=%s m15=%s l4=%d l1=%d lm=%d legDir=%d gdir=%s agree=%d",
8326:                        TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES),
8327:                        DoubleToString(s1f_h4, 1), DoubleToString(s1f_h1, 1), DoubleToString(s1g_m15, 1),
8328:                        s1f_l4, s1f_l1, s1g_lm, s1g_legDir, DirName(g_dir), s1g_agree);
8329:          //--- [STAGE-C E-C01] Track-1 B_BODY-only live consult (owned g_dir; N1-neutral; Sonnet-v71 S1 live-gating semantics: non-B_BODY false = pass)
8330:          int s1c_vwEq = g_n1_vwapEq;
8331:          int s1c_poEq = g_n1_pocEq;
8332:          int s1c_vwIv = g_n1_vwapInv;
8333:          int s1c_poIv = g_n1_pocInv;
8334:          int s1c_vwSv = g_n1_vwapSurv;
8335:          int s1c_poSv = g_n1_pocSurv;
8336:          string s1c_term = "";
8337:          bool s1c_ok = IsConfirmationCandle(barShift, g_anchorLine, g_dir, s1c_term);
8338:          g_n1_vwapEq = s1c_vwEq;
8339:          g_n1_pocEq = s1c_poEq;
8340:          g_n1_vwapInv = s1c_vwIv;
8341:          g_n1_pocInv = s1c_poIv;
8342:          g_n1_vwapSurv = s1c_vwSv;
8343:          g_n1_pocSurv = s1c_poSv;
8344:          //--- [C0-PROBE] suppression effect DELETED: consult above kept, prints kept, NO g_state write
8345:          if(!s1c_ok && s1c_term == "B_BODY")
8346:            {
8347:             if(InpDebugLog)
8348:                PrintFormat("[SRJ-EA] SIDE1C_SUPP bar=%s dir=%s term=%s", TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES), DirName(g_dir), s1c_term);
8349:            }
8350:          //--- [C0-PROBE] both-dirs failTerm row per seed (each leg N1-neutral, same save/restore idiom)
8351:          {
8352:           int s1c_bVwEq = g_n1_vwapEq;
8353:           int s1c_bPoEq = g_n1_pocEq;
8354:           int s1c_bVwIv = g_n1_vwapInv;
8355:           int s1c_bPoIv = g_n1_pocInv;
8356:           int s1c_bVwSv = g_n1_vwapSurv;
8357:           int s1c_bPoSv = g_n1_pocSurv;
8358:           string s1c_termLong = "";
8359:           string s1c_termShort = "";
8360:           IsConfirmationCandle(barShift, g_anchorLine, DIR_LONG, s1c_termLong);
8361:           g_n1_vwapEq = s1c_bVwEq;
8362:           g_n1_pocEq = s1c_bPoEq;
8363:           g_n1_vwapInv = s1c_bVwIv;
8364:           g_n1_pocInv = s1c_bPoIv;
8365:           g_n1_vwapSurv = s1c_bVwSv;
8366:           g_n1_pocSurv = s1c_bPoSv;
8367:           IsConfirmationCandle(barShift, g_anchorLine, DIR_SHORT, s1c_termShort);
8368:           g_n1_vwapEq = s1c_bVwEq;
8369:           g_n1_pocEq = s1c_bPoEq;
8370:           g_n1_vwapInv = s1c_bVwIv;
8371:           g_n1_pocInv = s1c_bPoIv;
8372:           g_n1_vwapSurv = s1c_bVwSv;
8373:           g_n1_pocSurv = s1c_bPoSv;
8374:           if(InpDebugLog)
8375:              PrintFormat("[SRJ-EA] SIDE1C_BOTHDIRS bar=%s live=%s liveTerm=%s longTerm=%s shortTerm=%s",
8376:                          TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES),
8377:                          DirName(g_dir), s1c_term, s1c_termLong, s1c_termShort);
8378:           if(InpDebugLog)
8379:              PrintFormat("[SRJ-EA] SIDE1C_CHAIN bar=%s chainN=%d",
8380:                          TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES),
8381:                          g_side_n);
8382:          }
8383:         }
8384:     }
8385: 
8386:      if(g_state == ST_S1_REGIME)
8387:      {
8388:       if((barTime - g_anchorBarTime) >= 3600 && g_anchorLine >= 0)
8389:         {
8390:          if(InpDebugLog) PrintFormat("[SRJ-EA] UJHOLDEXPIRE bar=%s poi=%s dir=%s heldMin=%d - unconfirmed holder expired, no eviction (Fix H2)", TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES), AnchorStr(), DirName(g_dir), (int)((barTime - g_anchorBarTime) / 60));
8391:          GoAbort(ABORT_HOLDER_EXPIRED, g_state); return;
8392:         }
8393:       ENUM_SRJ_REGIME regime;
8394:       if(!ClassifyRegime(barShift, g_dir, regime))
8395:         { GoAbort(ABORT_UPSTREAM_UNREADY, g_state); return; }
8396:       if(regime == REGIME_NONE)
8397:         { if(InpDebugLog) PrintFormat("[SRJ-EA] S1WAIT bar=%s dir=%s poi=%s sess=%s - regime unclassified, candidate RETAINED (Stage 3a)", TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES), DirName(g_dir), AnchorStr(), SessionName(g_sessionAtEntry)); return; }
8398:       g_regime = regime;
8399:       ENUM_SRJ_STATE prev = g_state;
8400:       g_state = ST_S2_LTF_ALIGN;
8401:       LogState(prev, g_state);
8402:      }
8403: 
8404:    if(g_state == ST_S2_LTF_ALIGN)
8405:      {
8406:       bool aligned;
8407:       if(!CheckLtfAlign(barShift, g_dir, aligned))
8408:         { GoAbort(ABORT_UPSTREAM_UNREADY, g_state); return; }
8409:       if(!aligned)
8410:         {
8411:          double uj_m15b = 0.0;
8412:          bool uj_m15r = ReadFlow(FL_BUF_HTF_LOW, uj_m15b, barShift);
8413:          double uj_wantb = (g_dir == DIR_LONG ? 1.0 : -1.0);
8414:          if(InpDebugLog) PrintFormat("[SRJ-EA] UJPROV bar=%s dir=%s reseedBar=%s seedBiasAl=%d reseedDir=%d exempt=%d - reseed provenance at S2 edge (Fix CARRY)", TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES), DirName(g_dir), TimeToString(g_ujOpReseedBarTime, TIME_DATE|TIME_MINUTES), s1g_seedBiasAl, g_ujOpReseedDir, ((uj_m15r && uj_m15b == uj_wantb && (s1g_seedBiasAl != 0 || (g_ujOpReseedBarTime != 0 && g_ujOpReseedDir != 0 && g_ujOpReseedDir == (g_dir == DIR_LONG ? 1 : (g_dir == DIR_SHORT ? -1 : 0))))) ? 1 : 0));
8415:          if(uj_m15r && uj_m15b == uj_wantb && (s1g_seedBiasAl != 0 || (g_ujOpReseedBarTime != 0 && g_ujOpReseedDir != 0 && g_ujOpReseedDir == (g_dir == DIR_LONG ? 1 : (g_dir == DIR_SHORT ? -1 : 0)))))
8416:            { double uj_ltfb = 0.0; int uj_ltfOk = ReadFlow(FL_BUF_LTF_BIAS, uj_ltfb, barShift) ? 1 : 0;
8417:              int uj_m15s = (int)iTime(_Symbol, PERIOD_CURRENT, barShift);
8418:              datetime uj_m15src = (datetime)(uj_m15s - uj_m15s % 900);
8419:              if(InpDebugLog) PrintFormat("[SRJ-EA] S2PROMOTE_M15 bar=%s dir=%s poi=%s sess=%s m15=%s m15src=%s ltf=%s sb=%d rf=%d/%d", TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES), DirName(g_dir), AnchorStr(), SessionName(g_sessionAtEntry), DoubleToString(uj_m15b, 1), TimeToString(uj_m15src, TIME_DATE|TIME_MINUTES), UjDbl(uj_ltfb), s1g_seedBiasAl, (uj_m15r ? 1 : 0), uj_ltfOk); }
8420:          else if(uj_m15r && uj_m15b == uj_wantb)
8421:            { if(InpDebugLog) PrintFormat("[SRJ-EA] S2SEEDBIAS_KILL bar=%s dir=%s poi=%s - seedbias refused, promotion killed (Fix B2)", TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES), DirName(g_dir), AnchorStr()); GoAbort(ABORT_SEEDBIAS_REFUSED, g_state); return; }
8422:          else
8423:            { if(InpDebugLog) PrintFormat("[SRJ-EA] S2WAIT bar=%s dir=%s poi=%s sess=%s - LTF bias unaligned, candidate RETAINED (Stage 3a)", TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES), DirName(g_dir), AnchorStr(), SessionName(g_sessionAtEntry)); return; }
8424:         }
8425:       ENUM_SRJ_STATE prev = g_state;
8426:       g_state = ST_S3_ZONE_WAIT;
8427:       LogState(prev, g_state);
8428:      }
8429:        //--- [v20 S-b] contender evaluation (self-contained; transfer shape mirrors EA-7813-7829, cited, not pasted).
8430:        if(g_state == ST_S3_ZONE_WAIT || g_state == ST_S4_ARMED) {
8431:        bool uj_sbHave = false; ENUM_SRJ_DIR uj_sbDir = DIR_NONE; int uj_sbLine = -1;
8432:        {
8433:         PoiRetestResult uj_sbPr;
8434:         if(DetectPoiRetest(barShift, uj_sbPr) && uj_sbPr.found)
8435:           { uj_sbHave = true; uj_sbDir = uj_sbPr.isLong ? DIR_LONG : DIR_SHORT; uj_sbLine = uj_sbPr.topLine; }
8436:        }
8437:        string uj_sbTermC = "", uj_sbTermH = "";
8438:         bool uj_sbConfC = (uj_sbHave && (uj_sbDir != g_dir)) ? IsConfirmationCandle(barShift, uj_sbLine, uj_sbDir, uj_sbTermC, true) : false;
8439:        bool uj_sbConfH = IsConfirmationCandle(barShift, g_anchorLine, g_dir, uj_sbTermH);
8440:         double uj_sbLineVal = 0.0; if(uj_sbHave && uj_sbLine >= 0 && !ReadBuf1(g_hPoi, uj_sbLine, uj_sbLineVal, barShift)) uj_sbLineVal = 0.0;
8441:         double uj_sbo1 = iOpen (_Symbol, PERIOD_CURRENT, barShift + 1); double uj_sbc1 = iClose(_Symbol, PERIOD_CURRENT, barShift + 1); double uj_sbc0 = iClose(_Symbol, PERIOD_CURRENT, barShift); int uj_sbarm = 1;
8442:         if(InpDebugLog) PrintFormat("[SRJ-EA] UJSBTELEM bar=%s dir=%s have=%d sbDir=%s sbLine=%d confC=%d confH=%d sbL=%s o1=%s c1=%s c0=%s arm=%d termC=%s termH=%s - contender evaluation (Fix S3)", TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES), DirName(g_dir), (int)uj_sbHave, DirName(uj_sbDir), uj_sbLine, (int)uj_sbConfC, (int)uj_sbConfH, DoubleToString(uj_sbLineVal, _Digits), DoubleToString(uj_sbo1, _Digits), DoubleToString(uj_sbc1, _Digits), DoubleToString(uj_sbc0, _Digits), uj_sbarm, uj_sbTermC, uj_sbTermH);
8443:        if(uj_sbConfC && !uj_sbConfH && (g_state == ST_S3_ZONE_WAIT || g_state == ST_S4_ARMED))
8444:          {
8445:           int uj_sbFromLine = g_anchorLine; ENUM_SRJ_DIR uj_sbFromDir = g_dir;
8446:           g_anchorLine = uj_sbLine; g_dir = uj_sbDir;
8447:           ReadBuf1(g_hPoi, uj_sbLine, g_anchorPrice, barShift);
8448:           g_anchorBarTime = barTime;
8449:           g_zoneHi = 0.0; g_zoneLo = 0.0; g_touchSeen = false;
8450:           g_touchBarHi = 0.0; g_touchBarLo = 0.0;
8451:           g_latchedEntry = 0.0; g_latchedSl = 0.0; g_latchedTp = 0.0; g_latchedR = 0.0;
8452:           g_latchBarTime = 0; g_confirmFromState = ST_IDLE;
8453:           uj_memo_valid = false;
8454:           if(InpDebugLog)
8455:              PrintFormat("[SRJ-EA] SIDE1C_YIELD bar=%s from=%s fromDir=%s to=%s toDir=%s state=%s term=%s",
8456:                          TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES),
8457:                          g_lineCode[uj_sbFromLine], DirName(uj_sbFromDir),
8458:                          g_lineCode[uj_sbLine], DirName(uj_sbDir),
8459:                          StateName(g_state), uj_sbTermC);
8460:          }
8461:        }
8462:        //--- [v20 S-a] deferred-abort application (identity-keyed on anchor+dir+barTime; set in Fix F11 tail).
8463:        if(uj_saAbort)
8464:          {
8465:           if(uj_saA == g_anchorLine && uj_saD == (int)g_dir && uj_saT == g_anchorBarTime)
8466:             {
8467:              if(InpDebugLog) PrintFormat("[SRJ-EA] UJDEFERAPPLY bar=%s dir=%s poi=%s - deferred LTF abort applies, holder unchanged (Fix S-a)", TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES), DirName(g_dir), AnchorStr());
8468:              GoAbort(ABORT_LTF_MISALIGN, g_state);
8469:              return;
8470:             }
8471:           else
8472:             {
8473:              if(InpDebugLog) PrintFormat("[SRJ-EA] UJDEFERDROP bar=%s dir=%s poi=%s - deferred LTF abort dropped, holder changed (Fix S-a)", TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES), DirName(g_dir), AnchorStr());
8474:             }
8475:           uj_saAbort = false;
8476:          }
### B - UJDEFERABORT emit + flag set (7425-7475: 30 before, 20 after line 7455)
7425:                        && ReadFlow(FL_BUF_LTF_OPP_FVG,   t81_op1, barShift + 1)
7426:                        && ReadFlow(FL_BUF_LTF_BIAS,      t81_bi1, barShift + 1);
7427:             bool t81_weak = t81_k1
7428:                             && (int)MathRound(t81_ob1) == 0
7429:                             && (int)MathRound(t81_fv1) == 0
7430:                             && (int)MathRound(t81_op1) == 1;
7431:           PrintFormat("[SRJ-EA] LTFDIAG bar=%s dir=%s state=%s kind=%s "
7432:                          "ok0=%d bias0=%d ob0=%d fvg0=%d opp0=%d "
7433:                          "ok1=%d bias1=%d ob1=%d fvg1=%d opp1=%d",
7434:                          TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift),
7435:                                       TIME_DATE|TIME_MINUTES),
7436:                          DirName(g_dir), StateName(g_state),
7437:                          (t81_weak ? "WEAK" : (t81_k1 ? "STRONG" : "UNKNOWN")),
7438:                          (int)t81_k0, (int)MathRound(t81_bi0),
7439:                          (int)MathRound(t81_ob0), (int)MathRound(t81_fv0),
7440:                          (int)MathRound(t81_op0),
7441:                          (int)t81_k1, (int)MathRound(t81_bi1),
7442:                          (int)MathRound(t81_ob1), (int)MathRound(t81_fv1),
7443:                          (int)MathRound(t81_op1));
7444:             }
7445:           double uj_hm15 = 0.0;
7446:           bool uj_hm15r = ReadFlow(FL_BUF_HTF_LOW, uj_hm15, barShift);
7447:           double uj_hwant = (g_dir == DIR_LONG ? 1.0 : -1.0);
7448:           string uj_hterm = "";
7449:           bool uj_hcarve = IsConfirmationCandle(barShift, g_anchorLine, g_dir, uj_hterm);
7450:           if((uj_hm15r && uj_hm15 == uj_hwant) || uj_hcarve)
7451:             { if(InpDebugLog) PrintFormat("[SRJ-EA] UJLTFHOLD bar=%s dir=%s poi=%s state=%s m15=%s rf=%d mode=%s term=%s - LTF opposed, hold (Fix F11)", TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES), DirName(g_dir), AnchorStr(), StateName(g_state), DoubleToString(uj_hm15, 1), (uj_hm15r ? 1 : 0), ((uj_hm15r && uj_hm15 == uj_hwant) ? "M15" : "CARVE"), uj_hterm); }
7452:           else
7453:             {
7454:              uj_saAbort = true; uj_saA = g_anchorLine; uj_saD = (int)g_dir; uj_saT = g_anchorBarTime;
7455:              if(InpDebugLog) PrintFormat("[SRJ-EA] UJDEFERABORT bar=%s dir=%s poi=%s state=%s - LTF opposed, abort deferred past evaluation (Fix S-a)", TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES), DirName(g_dir), AnchorStr(), StateName(g_state));
7456:             }
7457:          }
7458:      }
7459: 
7460:    //--- [Task 135 / A-3 section 5.1 / v4.2 section 3.4 errata] The
7461:    //--- candidate-specific structural invalidation window OPENS AT BUNDLE
7462:    //--- BINDING, not at candidate creation. Under today's architecture the
7463:    //--- S3->S4 arming transition IS the binding point: g_zoneHi and g_zoneLo are
7464:    //--- assigned there and nothing before it identifies a structure at all. A
7465:    //--- candidate that has not yet adopted a zone has no candidate-specific
7466:    //--- structure for these three flags to describe, so a 2-of-3 verdict against
7467:    //--- it is not attributable to anything the candidate is built on.
7468:    //---
7469:    //--- R-Q2 keeps the flags legitimately GLOBAL - they are the panel's
7470:    //--- current-structure flags and no per-candidate copy is wanted. Section 5.1
7471:    //--- fixes only WHEN they may kill a candidate.
7472:    //---
7473:    //--- Measured, Tier 1, Task 134: of 25 aborts, 11 are freshness deaths and
7474:    //--- SIX fired before the candidate had armed - FRESH_OPP_FVG at
7475:    //--- S2_LTF_ALIGN 08.14 11:35, FRESH_OPP_FVG at S3_ZONE_WAIT 08.18 10:20 and
### C - UJDEFERAPPLY + flag clear (8437-8487: 30 before, 20 after line 8467)
8437:        string uj_sbTermC = "", uj_sbTermH = "";
8438:         bool uj_sbConfC = (uj_sbHave && (uj_sbDir != g_dir)) ? IsConfirmationCandle(barShift, uj_sbLine, uj_sbDir, uj_sbTermC, true) : false;
8439:        bool uj_sbConfH = IsConfirmationCandle(barShift, g_anchorLine, g_dir, uj_sbTermH);
8440:         double uj_sbLineVal = 0.0; if(uj_sbHave && uj_sbLine >= 0 && !ReadBuf1(g_hPoi, uj_sbLine, uj_sbLineVal, barShift)) uj_sbLineVal = 0.0;
8441:         double uj_sbo1 = iOpen (_Symbol, PERIOD_CURRENT, barShift + 1); double uj_sbc1 = iClose(_Symbol, PERIOD_CURRENT, barShift + 1); double uj_sbc0 = iClose(_Symbol, PERIOD_CURRENT, barShift); int uj_sbarm = 1;
8442:         if(InpDebugLog) PrintFormat("[SRJ-EA] UJSBTELEM bar=%s dir=%s have=%d sbDir=%s sbLine=%d confC=%d confH=%d sbL=%s o1=%s c1=%s c0=%s arm=%d termC=%s termH=%s - contender evaluation (Fix S3)", TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES), DirName(g_dir), (int)uj_sbHave, DirName(uj_sbDir), uj_sbLine, (int)uj_sbConfC, (int)uj_sbConfH, DoubleToString(uj_sbLineVal, _Digits), DoubleToString(uj_sbo1, _Digits), DoubleToString(uj_sbc1, _Digits), DoubleToString(uj_sbc0, _Digits), uj_sbarm, uj_sbTermC, uj_sbTermH);
8443:        if(uj_sbConfC && !uj_sbConfH && (g_state == ST_S3_ZONE_WAIT || g_state == ST_S4_ARMED))
8444:          {
8445:           int uj_sbFromLine = g_anchorLine; ENUM_SRJ_DIR uj_sbFromDir = g_dir;
8446:           g_anchorLine = uj_sbLine; g_dir = uj_sbDir;
8447:           ReadBuf1(g_hPoi, uj_sbLine, g_anchorPrice, barShift);
8448:           g_anchorBarTime = barTime;
8449:           g_zoneHi = 0.0; g_zoneLo = 0.0; g_touchSeen = false;
8450:           g_touchBarHi = 0.0; g_touchBarLo = 0.0;
8451:           g_latchedEntry = 0.0; g_latchedSl = 0.0; g_latchedTp = 0.0; g_latchedR = 0.0;
8452:           g_latchBarTime = 0; g_confirmFromState = ST_IDLE;
8453:           uj_memo_valid = false;
8454:           if(InpDebugLog)
8455:              PrintFormat("[SRJ-EA] SIDE1C_YIELD bar=%s from=%s fromDir=%s to=%s toDir=%s state=%s term=%s",
8456:                          TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES),
8457:                          g_lineCode[uj_sbFromLine], DirName(uj_sbFromDir),
8458:                          g_lineCode[uj_sbLine], DirName(uj_sbDir),
8459:                          StateName(g_state), uj_sbTermC);
8460:          }
8461:        }
8462:        //--- [v20 S-a] deferred-abort application (identity-keyed on anchor+dir+barTime; set in Fix F11 tail).
8463:        if(uj_saAbort)
8464:          {
8465:           if(uj_saA == g_anchorLine && uj_saD == (int)g_dir && uj_saT == g_anchorBarTime)
8466:             {
8467:              if(InpDebugLog) PrintFormat("[SRJ-EA] UJDEFERAPPLY bar=%s dir=%s poi=%s - deferred LTF abort applies, holder unchanged (Fix S-a)", TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES), DirName(g_dir), AnchorStr());
8468:              GoAbort(ABORT_LTF_MISALIGN, g_state);
8469:              return;
8470:             }
8471:           else
8472:             {
8473:              if(InpDebugLog) PrintFormat("[SRJ-EA] UJDEFERDROP bar=%s dir=%s poi=%s - deferred LTF abort dropped, holder changed (Fix S-a)", TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES), DirName(g_dir), AnchorStr());
8474:             }
8475:           uj_saAbort = false;
8476:          }
8477: 
8478:    if(g_state == ST_S3_ZONE_WAIT)
8479:      {
8480:       double xobHi, xobLo, fvgHi, fvgLo;
8481: 
8482:       // [Task 105] Identity census at the S3 arming site. Same rationale as the
8483:       // S4RQZ block: ids only, placed before any read, branches on nothing.
8484:       // A distinct variable prefix is used because this is a different scope.
8485:       // -1 means the buffer read failed. 0 means FlowLogic selected no object.
8486:       double t105b_xobId = -1.0, t105b_fvgId = -1.0;
8487:       if(!ReadFlow(FL_BUF_XOB_OBJ_ID, t105b_xobId, barShift)) t105b_xobId = -1.0;
### D - SUPPRESSED action=HELD + SIDE1H_WOULDPREEMPT (7794-7854: 40 before, 20 after line 7834)
7794:    //--- the MOST AUTHORITATIVE matching line. So once GoAbort has cleared the
7795:    //--- sequence, the IDLE block below re-detects that same line and seeds it.
7796:    //--- No seeding code is duplicated here.
7797:    //---
7798:    //--- Ã¢Ëœâ€¦ THIS SITE DELIBERATELY DOES NOT RETURN AFTER GoAbort. Ã¢Ëœâ€¦ Every other
7799:    //--- GoAbort call site returns; this one must fall through so the IDLE block
7800:    //--- seeds the replacement on the SAME bar. GoAbort sets ST_ABORT and then
7801:    //--- calls ResetSequence, leaving g_state == ST_IDLE, which is exactly the
7802:    //--- state the IDLE block requires. Section 3.7's no-early-return cascade is
7803:    //--- what makes same-bar promotion possible.
7804:    //---
7805:    //--- Placed BEFORE the Task 73 census so a replaced retest is not ALSO
7806:    //--- counted as suppressed - it was promoted, not discarded. That census is
7807:    //--- gated on g_state > ST_IDLE and so skips on a replacement bar.
7808:    //---
7809:    //--- One-bar divergence-latch consequence, accepted: the latch block sits
7810:    //--- ABOVE this one, so the replacement candidate's latch is first evaluated
7811:    //--- on the NEXT bar. Part A Step 7 latches at any point with no bar-count
7812:    //--- limit, so a one-bar delay can postpone a signal but cannot lose one -
7813:    //--- the same reasoning EA-78 records for CQD's shift-2-only visibility.
7814:    if(g_state > ST_IDLE && g_state != ST_ABORT && g_anchorLine >= 0 && inWindow)
7815:      {
7816:       PoiRetestResult t78_pr;
7817:       if(DetectPoiRetest(barShift, t78_pr) && t78_pr.found)
7818:         {
7819:           ENUM_SRJ_DIR t78_dir = t78_pr.isLong ? DIR_LONG : DIR_SHORT;
7820:           bool t78_opp  = (t78_dir != g_dir);
7821:           bool t78_tier = ((g_authorityRank[t78_pr.topLine] / 2) <
7822:                            (g_authorityRank[g_anchorLine]   / 2));
7823:           //--- [S2-PREEMPT-SHADOW-001] WOULD-PREEMPT recorder: reuses the computed
7824:           //--- t78_pr/t78_dir/t78_opp/t78_tier above (no fresh DetectPoiRetest call,
7825:           //--- no N1 touch — detection ran once). Record-only: locals + print only.
7826:           //--- FORBIDDEN in this shadow and ABSENT below: g_state / g_anchorLine /
7827:           //--- g_dir / anchor price-time / zone-touch-latch / GoAbort /
7828:           //--- ResetSequence / order-stop-eligibility-session writes
7829:           //--- (documented guarantee, grade-verified).
7830:           if(InpDebugLog && t78_opp)
7831:             {
7832:              int s1h_newTier  = g_authorityRank[t78_pr.topLine] / 2;
7833:              int s1h_heldTier = g_authorityRank[g_anchorLine]   / 2;
7834:              PrintFormat("[SRJ-EA] SIDE1H_WOULDPREEMPT bar=%s newPoi=%s newDir=%s heldPoi=%s heldDir=%s heldState=%s newTier=%d heldTier=%d wouldPreempt=%d wouldTierPassLegacy=%d",
7835:                          TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift),
7836:                                       TIME_DATE|TIME_MINUTES),
7837:                          g_lineCode[t78_pr.topLine], DirName(t78_dir),
7838:                          g_lineCode[g_anchorLine], DirName(g_dir),
7839:                          StateName(g_state),
7840:                          s1h_newTier, s1h_heldTier,
7841:                          ((g_state == ST_S2_LTF_ALIGN) ? 1 : 0),
7842:                          (t78_tier ? 1 : 0));
7843:             }
7844:           if(t78_opp && t78_tier)
7845:            {
7846:             PrintFormat("[SRJ-EA] POIREPLACE bar=%s newPoi=%s newDir=%s "
7847:                         "heldPoi=%s heldDir=%s heldState=%s newTier=%d heldTier=%d",
7848:                         TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift),
7849:                                      TIME_DATE|TIME_MINUTES),
7850:                         g_lineCode[t78_pr.topLine], DirName(t78_dir),
7851:                         g_lineCode[g_anchorLine], DirName(g_dir),
7852:                         StateName(g_state),
7853:                         g_authorityRank[t78_pr.topLine] / 2,
7854:                         g_authorityRank[g_anchorLine]   / 2);
### E - lines 7400-7500 (covers the 7454 consume point named by earlier packets)
7400:          if(InpDebugLog)
7401:             PrintFormat("[SRJ-EA] LTFFLIP bar=%s dir=%s poi=%s state=%s - LTF bias "
7402:                         "turned against the locked direction",
7403:                         TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift),
7404:                                      TIME_DATE|TIME_MINUTES),
7405:                         DirName(g_dir), AnchorStr(), StateName(g_state));
7406:          //--- [Task 81 / EA-88 Option D] DIAGNOSTIC ONLY. Both flip branches in
7407:          //--- SRJ_Bias_DecisionBlock reset tickOBIsValid, tickFVGIsValid and
7408:          //--- hasPersistedOpposingFVG on the flip bar itself, so the flip bar's
7409:          //--- exports read clean and cannot distinguish a strong flip from a weak
7410:          //--- one. The bar BEFORE the flip still carries the preconditions.
7411:          //--- doWeakSignalFlip requires ALL THREE of obValid=0, fvgValid=0,
7412:          //--- oppFvg=1. All three adverse at barShift+1 => weak flip. Not all
7413:          //--- three => strong flip (in-bias invalidation count reached 2).
7414:          //--- Assigns nothing, branches nothing, cannot alter control flow.
7415:          if(InpDebugLog)
7416:            {
7417:             double t81_ob0 = 0.0, t81_fv0 = 0.0, t81_op0 = 0.0, t81_bi0 = 0.0;
7418:             double t81_ob1 = 0.0, t81_fv1 = 0.0, t81_op1 = 0.0, t81_bi1 = 0.0;
7419:             bool t81_k0 = ReadFlow(FL_BUF_LTF_OB_VALID,  t81_ob0, barShift)
7420:                        && ReadFlow(FL_BUF_LTF_FVG_VALID, t81_fv0, barShift)
7421:                        && ReadFlow(FL_BUF_LTF_OPP_FVG,   t81_op0, barShift)
7422:                        && ReadFlow(FL_BUF_LTF_BIAS,      t81_bi0, barShift);
7423:             bool t81_k1 = ReadFlow(FL_BUF_LTF_OB_VALID,  t81_ob1, barShift + 1)
7424:                        && ReadFlow(FL_BUF_LTF_FVG_VALID, t81_fv1, barShift + 1)
7425:                        && ReadFlow(FL_BUF_LTF_OPP_FVG,   t81_op1, barShift + 1)
7426:                        && ReadFlow(FL_BUF_LTF_BIAS,      t81_bi1, barShift + 1);
7427:             bool t81_weak = t81_k1
7428:                             && (int)MathRound(t81_ob1) == 0
7429:                             && (int)MathRound(t81_fv1) == 0
7430:                             && (int)MathRound(t81_op1) == 1;
7431:           PrintFormat("[SRJ-EA] LTFDIAG bar=%s dir=%s state=%s kind=%s "
7432:                          "ok0=%d bias0=%d ob0=%d fvg0=%d opp0=%d "
7433:                          "ok1=%d bias1=%d ob1=%d fvg1=%d opp1=%d",
7434:                          TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift),
7435:                                       TIME_DATE|TIME_MINUTES),
7436:                          DirName(g_dir), StateName(g_state),
7437:                          (t81_weak ? "WEAK" : (t81_k1 ? "STRONG" : "UNKNOWN")),
7438:                          (int)t81_k0, (int)MathRound(t81_bi0),
7439:                          (int)MathRound(t81_ob0), (int)MathRound(t81_fv0),
7440:                          (int)MathRound(t81_op0),
7441:                          (int)t81_k1, (int)MathRound(t81_bi1),
7442:                          (int)MathRound(t81_ob1), (int)MathRound(t81_fv1),
7443:                          (int)MathRound(t81_op1));
7444:             }
7445:           double uj_hm15 = 0.0;
7446:           bool uj_hm15r = ReadFlow(FL_BUF_HTF_LOW, uj_hm15, barShift);
7447:           double uj_hwant = (g_dir == DIR_LONG ? 1.0 : -1.0);
7448:           string uj_hterm = "";
7449:           bool uj_hcarve = IsConfirmationCandle(barShift, g_anchorLine, g_dir, uj_hterm);
7450:           if((uj_hm15r && uj_hm15 == uj_hwant) || uj_hcarve)
7451:             { if(InpDebugLog) PrintFormat("[SRJ-EA] UJLTFHOLD bar=%s dir=%s poi=%s state=%s m15=%s rf=%d mode=%s term=%s - LTF opposed, hold (Fix F11)", TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES), DirName(g_dir), AnchorStr(), StateName(g_state), DoubleToString(uj_hm15, 1), (uj_hm15r ? 1 : 0), ((uj_hm15r && uj_hm15 == uj_hwant) ? "M15" : "CARVE"), uj_hterm); }
7452:           else
7453:             {
7454:              uj_saAbort = true; uj_saA = g_anchorLine; uj_saD = (int)g_dir; uj_saT = g_anchorBarTime;
7455:              if(InpDebugLog) PrintFormat("[SRJ-EA] UJDEFERABORT bar=%s dir=%s poi=%s state=%s - LTF opposed, abort deferred past evaluation (Fix S-a)", TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES), DirName(g_dir), AnchorStr(), StateName(g_state));
7456:             }
7457:          }
7458:      }
7459: 
7460:    //--- [Task 135 / A-3 section 5.1 / v4.2 section 3.4 errata] The
7461:    //--- candidate-specific structural invalidation window OPENS AT BUNDLE
7462:    //--- BINDING, not at candidate creation. Under today's architecture the
7463:    //--- S3->S4 arming transition IS the binding point: g_zoneHi and g_zoneLo are
7464:    //--- assigned there and nothing before it identifies a structure at all. A
7465:    //--- candidate that has not yet adopted a zone has no candidate-specific
7466:    //--- structure for these three flags to describe, so a 2-of-3 verdict against
7467:    //--- it is not attributable to anything the candidate is built on.
7468:    //---
7469:    //--- R-Q2 keeps the flags legitimately GLOBAL - they are the panel's
7470:    //--- current-structure flags and no per-candidate copy is wanted. Section 5.1
7471:    //--- fixes only WHEN they may kill a candidate.
7472:    //---
7473:    //--- Measured, Tier 1, Task 134: of 25 aborts, 11 are freshness deaths and
7474:    //--- SIX fired before the candidate had armed - FRESH_OPP_FVG at
7475:    //--- S2_LTF_ALIGN 08.14 11:35, FRESH_OPP_FVG at S3_ZONE_WAIT 08.18 10:20 and
7476:    //--- 08.18 11:50, FRESH_OB_DEAD at S2_LTF_ALIGN 08.18 16:25 and 08.18 18:05,
7477:    //--- FRESH_OB_DEAD at S3_ZONE_WAIT 08.21 09:35. Corroborated at Tier 3 scale
7478:    //--- by FRESHCOUNT #1050, which fires 08.03 09:25 with state=S2_LTF_ALIGN
7479:    //--- adverse=2 verdict=ABORT against a candidate that had bound nothing.
7480:    //---
7481:    //--- STRICTLY RETENTION. This edit can only let a candidate live longer. It
7482:    //--- can never kill one, and it can never admit a signal the freshness rule
7483:    //--- would have blocked at S4 or S5, because the poll still runs there
7484:    //--- unchanged. Same character as Stage 3a's S1WAIT / S2WAIT retention, and
7485:    //--- deliberately the opposite character to Task 79's strictly-removal LTF
7486:    //--- invariant, so the two journals read against each other cleanly.
7487:    //---
7488:    //--- SCENARIO B IS PRESERVED. The operator's 08/03 setup-1 rejection fires at
7489:    //--- state=S5_GATE_CHECK, inside the retained range, on the same fvgDead plus
7490:    //--- oppFvg pair. This edit does not touch it.
7491:    //---
7492:    //--- ACCEPTED CONSEQUENCE 1, and the reason Task 134 ran first: a candidate
7493:    //--- freed here does not necessarily survive. It carries whatever other
7494:    //--- pending deaths it already had, and removing the one that fires first
7495:    //--- reveals the next (section 16.3). Expect the abort MIX to shift toward
7496:    //--- SESSION_CLOSED, NO_TP_TARGET and LTF_MISALIGN rather than the abort
7497:    //--- COUNT to fall.
7498:    //---
7499:    //--- ACCEPTED CONSEQUENCE 2, and the real risk: this is a RETENTION edit
7500:    //--- under a SINGLETON architecture. A candidate that lives longer holds the

| question | answer | which pasted line proves it |
|---|---|---|
| Q1. In the 14:40 pass, is the SUPPRESSED check reached BEFORE the deferred abort is applied? | YES. Code order inside one pass: SUPPRESSED emit at 8033 runs before the UJDEFERAPPLY block at 8463-8469. Journal order matches (B1 R3 before R7). No return fired between them in the 14:40 pass: the S1 guard (8386) and S2 guard (8404) were false for the S4_ARMED holder so their GoAborts were skipped, and the YIELD guard (8443) was false (journal confC=0), so flow reached 8463 with the holder unchanged. | Block A3 lines 8033 and 8463-8469; block C lines 8437-8446 for the skipped YIELD; B1 journal rows R3/R7 for the executed order. |
| Q2. What exact condition makes the held SHORT block a new LONG on the same POI? | The transfer gate at 7904: t78_opp must be true AND (state is S2_LTF_ALIGN, or state is S1_REGIME with opposite-confirmed and holder-unconfirmed). The holder was S4_ARMED, so the gate was false and g_anchorLine/g_dir never switched to the LONG. Companion recorder at 7841: wouldPreempt = (state == S2_LTF_ALIGN) = 0 for S4_ARMED; at 7844 (t78_opp and tier-better) false on equal tier 5 vs 5, so no POIREPLACE either. Both the shadow recorder (7826-7829) and the census (8010-8012) are documented record-only and change nothing. | Block A2/A3 lines 7820-7822 (opp+tier inputs), 7841-7844 (wouldPreempt + POIREPLACE gate), 7904-7911 (transfer gate + holder rewrite that did not run). |
| Q3. Where is the deferred abort consumed today, and is any other code between that line and the SUPPRESSED check reading the held state? | Consumed at 8463 (test uj_saAbort), identity-checked at 8465 (uj_saA == g_anchorLine and uj_saD == g_dir and uj_saT == g_anchorBarTime), applied at 8467-8469 (UJDEFERAPPLY print, GoAbort, return), cleared at 8475 on both paths. Between 8033 and 8463 the held state IS read by other code that ran in this pass (journal-evidenced): ShadowConfirmPoll via the 8059-8060 guard (true for S4_ARMED), the confirmation consults near 8337-8377 (journal CONFIRMPOLL SHORT shadow row), and the contender eval at 8438-8442 (journal UJSBTELEM row); the YIELD rewrite at 8445-8446 did not run (guard 8443 false). The 69-line mechanical census of g_anchorLine/g_dir/g_state/uj_sa reads in 8034-8462 sits in block A3; the S1 block (8386-8401), S2 block (8404-8427) were skipped by state guards. | Block C lines 8462-8475; block A3 lines 8059-8060, 8337-8377, 8430-8446, 8386-8427 for the guards; B1 journal rows for which of them executed at 14:40:22. |
| Q4. Does anything else in the function read the held SHORT after the abort is applied? | In the matched-identity case (the 14:40 pass): NO. GoAbort runs at 8468 and the function returns at 8469, ending the pass; nothing after reads the holder, and the next journal rows belong to the 14:45:05 pass. Only the mismatched-identity path continues: DROP print at 8473, clear at 8475, then the S3 block at 8478 reads g_state (a changed holder) - that path did not run in this pass. | Block C lines 8467-8478; B1 journal R10 (14:45 RETESTBOOK hits=0) for pass separation. |

No fix proposed. No placement chosen. Measurement only.
