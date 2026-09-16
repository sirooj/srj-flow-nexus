# SNIPPET V101T - transfer/seed/bias regions whole (EA 7BFC7FA3, 584698 B, 10947 lines)
# Claim-map: E1 CheckLtfAlign body (state-not-flip) | E2 t78 transfer+trigger (S2+opp, zero downstream) | E3 main seed + SIDE1T + seedBiasAl carriage
# Zero condensation in code regions. Paste with a relay, one trip two pastes.
## Region E1 EA:2171-2178
2171: 
2172: //====================== Step 2: LTF structure alignment ==============
2173: bool CheckLtfAlign(int barShift, ENUM_SRJ_DIR dir, bool &alignedOut)
2174:   {
2175:    double ltfBias;
2176:    if(!ReadFlow(FL_BUF_LTF_BIAS, ltfBias, barShift)) return false;
2177:    alignedOut = ((int)MathRound(ltfBias) == ((dir == DIR_LONG) ? 1 : -1));
2178:    return true;
## Region E2 EA:7360-7450
7360:    //--- gated on g_state > ST_IDLE and so skips on a replacement bar.
7361:    //---
7362:    //--- One-bar divergence-latch consequence, accepted: the latch block sits
7363:    //--- ABOVE this one, so the replacement candidate's latch is first evaluated
7364:    //--- on the NEXT bar. Part A Step 7 latches at any point with no bar-count
7365:    //--- limit, so a one-bar delay can postpone a signal but cannot lose one -
7366:    //--- the same reasoning EA-78 records for CQD's shift-2-only visibility.
7367:    if(g_state > ST_IDLE && g_state != ST_ABORT && g_anchorLine >= 0 && inWindow)
7368:      {
7369:       PoiRetestResult t78_pr;
7370:       if(DetectPoiRetest(barShift, t78_pr) && t78_pr.found)
7371:         {
7372:           ENUM_SRJ_DIR t78_dir = t78_pr.isLong ? DIR_LONG : DIR_SHORT;
7373:           bool t78_opp  = (t78_dir != g_dir);
7374:           bool t78_tier = ((g_authorityRank[t78_pr.topLine] / 2) <
7375:                            (g_authorityRank[g_anchorLine]   / 2));
7376:           //--- [S2-PREEMPT-SHADOW-001] WOULD-PREEMPT recorder: reuses the computed
7377:           //--- t78_pr/t78_dir/t78_opp/t78_tier above (no fresh DetectPoiRetest call,
7378:           //--- no N1 touch — detection ran once). Record-only: locals + print only.
7379:           //--- FORBIDDEN in this shadow and ABSENT below: g_state / g_anchorLine /
7380:           //--- g_dir / anchor price-time / zone-touch-latch / GoAbort /
7381:           //--- ResetSequence / order-stop-eligibility-session writes
7382:           //--- (documented guarantee, grade-verified).
7383:           if(InpDebugLog && t78_opp)
7384:             {
7385:              int s1h_newTier  = g_authorityRank[t78_pr.topLine] / 2;
7386:              int s1h_heldTier = g_authorityRank[g_anchorLine]   / 2;
7387:              PrintFormat("[SRJ-EA] SIDE1H_WOULDPREEMPT bar=%s newPoi=%s newDir=%s heldPoi=%s heldDir=%s heldState=%s newTier=%d heldTier=%d wouldPreempt=%d wouldTierPassLegacy=%d",
7388:                          TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift),
7389:                                       TIME_DATE|TIME_MINUTES),
7390:                          g_lineCode[t78_pr.topLine], DirName(t78_dir),
7391:                          g_lineCode[g_anchorLine], DirName(g_dir),
7392:                          StateName(g_state),
7393:                          s1h_newTier, s1h_heldTier,
7394:                          ((g_state == ST_S2_LTF_ALIGN) ? 1 : 0),
7395:                          (t78_tier ? 1 : 0));
7396:             }
7397:           if(t78_opp && t78_tier)
7398:            {
7399:             PrintFormat("[SRJ-EA] POIREPLACE bar=%s newPoi=%s newDir=%s "
7400:                         "heldPoi=%s heldDir=%s heldState=%s newTier=%d heldTier=%d",
7401:                         TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift),
7402:                                      TIME_DATE|TIME_MINUTES),
7403:                         g_lineCode[t78_pr.topLine], DirName(t78_dir),
7404:                         g_lineCode[g_anchorLine], DirName(g_dir),
7405:                         StateName(g_state),
7406:                         g_authorityRank[t78_pr.topLine] / 2,
7407:                         g_authorityRank[g_anchorLine]   / 2);
7408:             /* [Task 91 / EA-105 / operator ruling Q3] REMOVED. Was GoAbort(ABORT_POI_REPLACED, g_state). Operator: "i will always execute the first one, the later higher POI does not get executed... if i have executed the first trade, i would not execute other trade even it's from higher hierarchy." Arrival order governs ACROSS TIME; anchor tier governs ONLY a same-bar tie between two completed candidates (EA-96), which MarkSessionUsed on the SIGNAL path already enforces. The across-time replacement reading of Part A Step 8 / D-3 / G-2 was a planner inference and is overturned. The POIREPLACE line above is RETAINED as a counterfactual census: it still prints on every bar this removal now lets pass, so the 16 firings measured on the Task 88 run stay countable. Threshold-free - nothing is added, one call is removed. */ ;
7409:             }
7410:           //--- [S2-CROSS-DIR-PREEMPT] live transfer (Luna V87-LIVE-PREEMPT-001
7411:           //--- §§3-6, cleared BY NAME; his selection token + fresh run word this
7412:           //--- turn). State-bounded: S2-held candidate yields to the observed
7413:           //--- opposite-direction candidate. Region-P-equivalent MIRROR (no callable
7414:           //--- helper exists — Region P EA:7421-7467 is inline; deltas declared:
7415:           //--- (a) g_dir takes t78_dir, Region P keeps dir; (b) NO state write and
7416:           //--- NO LogState — already ST_S2_LTF_ALIGN, stays it, never ST_IDLE;
7417:           //--- (c) one InpDebugLog-gated SIDE1C_PREEMPT print, new family,
7418:           //--- observation only). Reuses computed t78_pr/t78_dir/t78_opp above (no
7419:           //--- fresh DetectPoiRetest, N1 untouched). Tier recorded, never consulted
7420:           //--- (no <, no <=). Placed AFTER the POIREPLACE census above (D4) so the
7421:           //--- census labels stay pre-transfer and byte-comparable.
7422:           if(g_state == ST_S2_LTF_ALIGN && t78_opp)
7423:             {
7424:              int s1c_fromLine     = g_anchorLine;
7425:              ENUM_SRJ_DIR s1c_fromDir = g_dir;
7426:              g_anchorLine    = t78_pr.topLine;
7427:              ReadBuf1(g_hPoi, t78_pr.topLine, g_anchorPrice, barShift);
7428:              g_anchorBarTime = barTime;
7429:              g_dir           = t78_dir;
7430:              g_zoneHi        = 0.0;
7431:              g_zoneLo        = 0.0;
7432:              g_touchSeen     = false;
7433:              g_touchBarHi    = 0.0;
7434:              g_touchBarLo    = 0.0;
7435:              g_latchedEntry  = 0.0;
7436:              g_latchedSl     = 0.0;
7437:              g_latchedTp     = 0.0;
7438:              g_latchedR      = 0.0;
7439:              g_latchBarTime  = 0;
7440:              g_confirmFromState = ST_IDLE;
7441:              if(InpDebugLog)
7442:                 PrintFormat("[SRJ-EA] SIDE1C_PREEMPT bar=%s from=%s fromDir=%s to=%s toDir=%s state=%s",
7443:                             TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift),
7444:                                          TIME_DATE|TIME_MINUTES),
7445:                             g_lineCode[s1c_fromLine], DirName(s1c_fromDir),
7446:                             g_lineCode[t78_pr.topLine], DirName(t78_dir),
7447:                             StateName(g_state));
7448:             }
7449:          }
7450:       }
## Region E3 EA:7608-7659
7608:         PoiRetestResult pr;
7609:         if(!DetectPoiRetest(barShift, pr) || !pr.found) return;
7610:         s1g_legDir = pr.isLong ? 1 : -1;   //--- [SIDE1G] (0) independent legDir capture (new local only)
7611:         g_s2_seedShift = barShift;   //--- [STAGE-C E-C05] exact-seed bar carriage for the live vote
7612:          g_anchorLine    = pr.topLine;
7613:        //--- [FP-LIMBSEAT-1 S2-3] F3 owns the carried-side write (single
7614:        //--- writer). Live rows carry no declared class -> ABSTAIN
7615:        //--- pass-through of the legacy value (D3 holds by construction);
7616:        //--- legacy output stays the compared label, fire-log identical.
7617:        g_dir           = S2ResolveLive(pr.isLong ? DIR_LONG : DIR_SHORT);
7618:         SrjSideNote("DetectPoiRetest", g_dir);
7619:       g_anchorBarTime = barTime;
7620:       ReadBuf1(g_hPoi, pr.topLine, g_anchorPrice, barShift);
7621:       g_sessionAtEntry = sess;
7622:       g_divLatch = false;
7623:       ENUM_SRJ_STATE prev = g_state;
7624:       g_state = ST_S1_REGIME;
7625:       LogState(prev, g_state);
7626:       //--- [P-BUILD3 E2] seed census: the detector already returns argmin(rank);
7627:       //--- tier-best == rank-best at seed (no held line), so ElectAnchor parity
7628:       //--- holds by construction. Additive print only; assigns nothing.
7629:       if(InpDebugLog)
7630:          PrintFormat("[SRJ-EA] ANCHOR_ELECT bar=%s action=SEED poi=%s rank=%d tier=%d dir=%s",
7631:                      TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift),
7632:                                   TIME_DATE|TIME_MINUTES),
7633:                      AnchorStr(), g_authorityRank[g_anchorLine],
7634:                       B3_AnchorTier(g_anchorLine), DirName(g_dir));
7635:          }
7636: 
7637:          //--- [S2-TIMING-SHADOW-001] seed-bias recorder (Luna V94 F1, cleared BY NAME
7638:          //--- print-only). Record-only: locals + print. Reuses CheckLtfAlign — the SAME
7639:          //--- pure helper the S2 path calls (EA:7787), same buffer/semantics; NO new bias
7640:           //--- computation (Sonnet build flag). Candidate dir = detector dir via s1g_legDir (equals pr.isLong on a seed bar), matching
7641:          //--- the authored candidateDirection. Flip observed at grade via later rows
7642:          //--- (pre-declared derivation). FORBIDDEN/ABSENT: any state/dir/latch/order/
7643:           //--- stop/N1 write (documented guarantee, grade-verified).
7644:           //--- Seed-gated per the s1f_seedThisBar idiom (EA:7664): emits only on the bar the seed fires.
7645:           if(InpDebugLog && s1f_seedArmed && g_state == ST_S1_REGIME && g_dir != DIR_NONE && g_anchorLine >= 0)
7646:            {
7647:             bool s1t_aligned = false;
7648:             string s1t_alOk = "UNREAD";
7649:             ENUM_SRJ_DIR s1t_candDir = (s1g_legDir > 0 ? DIR_LONG : DIR_SHORT);   //--- seed-bar pr via file-scope capture (EA:1038 decl, assigned 7609 this pass)
7650:              if(CheckLtfAlign(barShift, s1t_candDir, s1t_aligned))
7651:                 s1t_alOk = s1t_aligned ? "1" : "0";
7652:              s1g_seedBiasAl = ((s1t_alOk == "UNREAD") ? -1 : (s1t_aligned ? 1 : 0));   //--- [STAGE-D-S2-RGATE-001] seed-bias carriage (print-only file-scope; single-candidate machine + IDLE-gated reseed mean the eval reads its own seed; -1 guards never-seeded)
7653:             PrintFormat("[SRJ-EA] SIDE1T_SEEDBIAS bar=%s dir=%s biasAligned=%s verdict=%s",
7654:                         TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift),
7655:                                      TIME_DATE|TIME_MINUTES),
7656:                         DirName(s1t_candDir),
7657:                         s1t_alOk,
7658:                         (s1t_alOk == "1") ? "CONSIDER" : "REJECT-BIAS-TIMING");
7659:            }
