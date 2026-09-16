# SNIPPET V103W - Region-W eval-site instrument block whole (EA 7BFC7FA3, 584698 B)
# Claim-map: SIDE1E stop-shadow walk + SIDE1O inventory + SIDE1Q CQD census + SIDE1R link + SIDE1W window = every print at the S5 pre-latch site the P-probe extends; the R latch below is EXCLUDED (untouched, out of scope)
# Zero condensation in code regions. Paste with relay v103, one trip (relay + V101T + this file).
## Region W EA:9492-9640
9492:        //--- [S1-CONDSTOP-SHADOW-001] stop-source recorder (Luna V89-STOP-CLEAR-001,
9493:        //--- cleared BY NAME print-only; his fresh run word this turn). Shadow-local
9494:        //--- rung walk over the same swing/imb buffers, read-only: SrjResolveExt1
9495:        //--- untouched, ReadFlow writes nothing, no N1 touch. Record-only: locals
9496:        //--- + print only. FORBIDDEN in this shadow and ABSENT below: g_state /
9497:        //--- anchor / g_dir / latch / order / stop / N1 writes (documented
9498:        //--- guarantee, grade-verified). S0 = rung 0 (nearest protective), S1 =
9499:        //--- first ext==1 (same numbering as SrjResolveExt1); imb reported raw
9500:        //--- (0/1/2 per FlowLogic 122-127); sel shown under valid=nonzero
9501:        //--- (carried open for live). Spliced pre-latch (D4-successor): reuses
9502:        //--- currentPrice/tpTarget/slRef/tpOk of this S5 evaluation, prints, then
9503:        //--- live code proceeds untouched.
9504:        if(InpDebugLog)
9505:          {
9506:           int s1e_swBuf = ((g_dir == DIR_LONG) ? FL_BUF_SWING_LOW : FL_BUF_SWING_HIGH);
9507:           int s1e_imBuf = ((g_dir == DIR_LONG) ? FL_BUF_SWING_LOW_IMB : FL_BUF_SWING_HIGH_IMB);
9508:           double s1e_s0px = 0.0; int s1e_s0slot = -1; int s1e_s0imb = -1;
9509:           double s1e_s1px = 0.0; int s1e_s1slot = -1; int s1e_s1imb = -1;
9510:           double s1e_best = 0.0; int s1e_extN = 0; int s1e_rungs = 0;
9511:           for(int s1e_s = barShift; s1e_s <= barShift + SRJ_LAD_ABS_SLOT_CAP; s1e_s++)
9512:             {
9513:              double s1e_v = 0.0;
9514:              if(!ReadFlow(s1e_swBuf, s1e_v, s1e_s)) break;
9515:              if(s1e_v == EMPTY_VALUE || s1e_v <= 0.0) continue;
9516:              if(!SlimbProtectiveSideOk(g_dir, s1e_v, currentPrice)) continue;
9517:              int s1e_ext = -1;
9518:              if(s1e_rungs == 0) { s1e_ext = 0; s1e_best = s1e_v; s1e_extN = 1; }
9519:              else
9520:                {
9521:                 bool s1e_more = (g_dir == DIR_LONG) ? (s1e_v < s1e_best - _Point) : (s1e_v > s1e_best + _Point);
9522:                 if(s1e_more) { s1e_ext = s1e_extN; s1e_extN++; s1e_best = s1e_v; }
9523:                }
9524:              if(s1e_ext == 0 && s1e_s0slot < 0)
9525:                {
9526:                 s1e_s0px = s1e_v; s1e_s0slot = s1e_s;
9527:                 double s1e_f = 0.0;
9528:                 if(ReadFlow(s1e_imBuf, s1e_f, s1e_s) && s1e_f != EMPTY_VALUE) s1e_s0imb = (int)s1e_f;
9529:                }
9530:              if(s1e_ext == 1 && s1e_s1slot < 0)
9531:                {
9532:                 s1e_s1px = s1e_v; s1e_s1slot = s1e_s;
9533:                 double s1e_f = 0.0;
9534:                 if(ReadFlow(s1e_imBuf, s1e_f, s1e_s) && s1e_f != EMPTY_VALUE) s1e_s1imb = (int)s1e_f;
9535:                }
9536:              s1e_rungs++;
9537:              if(s1e_rungs >= 512) break;
9538:              if(s1e_s0slot >= 0 && s1e_s1slot >= 0) break;
9539:             }
9540:           double s1e_s0d = MathAbs(currentPrice - s1e_s0px);
9541:           double s1e_s1d = MathAbs(currentPrice - s1e_s1px);
9542:           double s1e_r0 = (s1e_s0slot >= 0 && s1e_s0d > 0.0) ? (tpDist / s1e_s0d) : 0.0;
9543:           double s1e_r1 = (s1e_s1slot >= 0 && s1e_s1d > 0.0) ? (tpDist / s1e_s1d) : 0.0;
9544:           int s1e_sel = -1;
9545:           if(s1e_s0slot >= 0 && s1e_s0imb > 0) s1e_sel = 0;
9546:           else if(s1e_s1slot >= 0) s1e_sel = 1;
9547:           PrintFormat("[SRJ-EA] SIDE1E_STOPSHADOW bar=%s dir=%s s0px=%s s0slot=%d s0imb=%d s1px=%s s1slot=%d s1imb=%d sel=%d r0=%.2f r1=%.2f liveSl=%s livePass=%d",
9548:                       TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES),
9549:                       DirName(g_dir),
9550:                       DoubleToString(s1e_s0px, _Digits), s1e_s0slot, s1e_s0imb,
9551:                       DoubleToString(s1e_s1px, _Digits), s1e_s1slot, s1e_s1imb,
9552:                       s1e_sel, s1e_r0, s1e_r1,
9553:                       DoubleToString(slRef, _Digits), (tpOk ? 1 : 0));
9554:          }
9555:          //--- [S2R2-ELIGIBILITY-SHADOW-001] inventory recorder (Luna V92/V94 F0,
9556:          //--- cleared BY NAME print-only). Record-only: locals + print. Every read
9557:          //--- reuses an established idiom (SessionAlreadyUsed query EA:1776, pure;
9558:          //--- CQD idiom EA:6577; latch/global reads). FORBIDDEN/ABSENT: any write.
9559:          if(InpDebugLog)
9560:            {
9561:             int s1o_sessUsed = SessionAlreadyUsed(sess, barTime) ? 1 : 0;
9562:             double s1o_cqd = EMPTY_VALUE;
9563:             string s1o_cqdS = "UNREAD";
9564:             if(ReadBuf1(g_hCqd, CQD_BUF_DIVVERDICT, s1o_cqd, barShift) && s1o_cqd != EMPTY_VALUE)
9565:                s1o_cqdS = IntegerToString((int)MathRound(s1o_cqd));
9566:             PrintFormat("[SRJ-EA] SIDE1O_ELIGSTATE bar=%s dir=%s sessUsed=%d divLatch=%d cqd=%s confirm=%s slRef=%s rLive=%.2f livePass=%d",
9567:                         TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift),
9568:                                      TIME_DATE|TIME_MINUTES),
9569:                         DirName(g_dir),
9570:                         s1o_sessUsed, (int)g_divLatch, s1o_cqdS,
9571:                         StateName(g_confirmFromState),
9572:                         DoubleToString(slRef, _Digits),
9573:                         (slDist > 0.0 ? tpDist / slDist : 0.0),
9574:                         (tpOk ? 1 : 0));
9575:            }
9576:          //--- [R2-CQD-PROBE-001] killer census (Luna V94 F2, cleared BY NAME
9577:          //--- print-only). Record-only: locals + print. Reports which repo inputs
9578:          //--- represent each R2 killer; a killer with no repo input prints MISSING
9579:          //--- (finding, never fill). imb-identity CLOSED at build (build-record
9580:          //--- declared): stop-imb reads buffers 37/38 (swing creation-side), the
9581:          //--- OB-validity term reads buffer 3 (FL_BUF_LTF_OB_VALID) — DIFFERENT
9582:          //--- inputs, printed side-by-side, never aliased. 10:25-vs-10:35 kept
9583:          //--- distinct by barTime (no folding by construction).
9584:          if(InpDebugLog)
9585:            {
9586:             double s1q_ob = EMPTY_VALUE, s1q_fv = EMPTY_VALUE, s1q_cq = EMPTY_VALUE;
9587:             string s1q_obS = "UNREAD", s1q_fvS = "UNREAD", s1q_cqS = "UNREAD";
9588:             if(ReadFlow(FL_BUF_LTF_OB_VALID, s1q_ob, barShift) && s1q_ob != EMPTY_VALUE)
9589:                s1q_obS = DoubleToString(s1q_ob, 1);
9590:             if(ReadFlow(FL_BUF_LTF_FVG_VALID, s1q_fv, barShift) && s1q_fv != EMPTY_VALUE)
9591:                s1q_fvS = DoubleToString(s1q_fv, 1);
9592:             if(ReadBuf1(g_hCqd, CQD_BUF_DIVVERDICT, s1q_cq, barShift) && s1q_cq != EMPTY_VALUE)
9593:                s1q_cqS = IntegerToString((int)MathRound(s1q_cq));
9594:              PrintFormat("[SRJ-EA] SIDE1Q_CQDKILL bar=%s dir=%s obValid=%s fvgValid=%s cqdDiv=%s",
9595:                          TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift),
9596:                                       TIME_DATE|TIME_MINUTES),
9597:                          DirName(g_dir), s1q_obS, s1q_fvS, s1q_cqS);
9598:             }
9599:           //--- [STAGE-D-S2-RGATE-001] causal-link recorder (Luna V96 §2, cleared BY NAME
9600:           //--- print-only). Links seed to eval in ONE row: seed barTime (g_anchorBarTime,
9601:           //--- set at seed) + seed bias (s1g_seedBiasAl, carried at seed) + eval-bar R
9602:           //--- (same rLive/livePass exprs as SIDE1O) + live stop. Reuses stamps only;
9603:           //--- no new computation, no state/dir/latch/order/stop/N1 write. Seed-close
9604:           //--- sampling note: both seed fields are close-sampled (ADD1); the link row
9605:           //--- carries seedBT + evalBar so grade verifies linkage without assuming.
9606:           if(InpDebugLog)
9607:             {
9608:              PrintFormat("[SRJ-EA] SIDE1R_RGATE evalBar=%s seedBT=%s dir=%s seedBiasAl=%d rLive=%.2f livePass=%d slRef=%s",
9609:                          TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift),
9610:                                       TIME_DATE|TIME_MINUTES),
9611:                          TimeToString(g_anchorBarTime, TIME_DATE|TIME_MINUTES),
9612:                          DirName(g_dir), s1g_seedBiasAl,
9613:                          (slDist > 0.0 ? tpDist / slDist : 0.0),
9614:                          (tpOk ? 1 : 0),
9615:                          DoubleToString(slRef, _Digits));
9616:             }
9617:           //--- [R2-CQD-ELIGIBILITY-002] trailing-window CQD census (Luna V96 §3, cleared
9618:           //--- BY NAME print-only). Uniform trailing window at EVERY S5 eval (no date/
9619:           //--- bar fixture — fixtures forbidden): CQD DIV verdict at barShift+k for
9620:           //--- k=0..12 (~1h), same ReadBuf1 idiom as SIDE1O. CQD handle ONLY (imb-
9621:           //--- identity: stop-imb buffers never touched here). Per-bar k offsets keep
9622:           //--- 10:25-vs-10:35 distinct (10:25-note: no folding by construction). "U" =
9623:           //--- UNREAD/EMPTY (missing stays missing). N1-neutral (pure reads only).
9624:           if(InpDebugLog)
9625:             {
9626:              string s1w_s = "";
9627:              for(int s1w_k = 0; s1w_k <= 12; s1w_k++)
9628:                {
9629:                 double s1w_v = EMPTY_VALUE;
9630:                 string s1w_t = "U";
9631:                 if(ReadBuf1(g_hCqd, CQD_BUF_DIVVERDICT, s1w_v, barShift + s1w_k) && s1w_v != EMPTY_VALUE)
9632:                    s1w_t = IntegerToString((int)MathRound(s1w_v));
9633:                 if(s1w_k > 0) s1w_s += ",";
9634:                 s1w_s += s1w_t;
9635:                }
9636:              PrintFormat("[SRJ-EA] SIDE1W_CQDWINDOW evalBar=%s dir=%s w=%s",
9637:                          TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift),
9638:                                       TIME_DATE|TIME_MINUTES),
9639:                          DirName(g_dir), s1w_s);
9640:             }
