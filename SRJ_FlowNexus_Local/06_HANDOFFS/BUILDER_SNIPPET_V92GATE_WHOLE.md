# SNIPPET - v92 ELIGIBILITY-GATE COMPANION (paste with the v92 relay; zero condensation)

**Paste whole to EACH reviewer TOGETHER with `06_HANDOFFS\BUILDER_RELAY_COUNCIL_v92-SPLIT-INVENTORY.md` (with its APPENDIX A/B) in ONE trip, TWO pastes. This file grounds the validity-gate inventory Luna 003 says must be identified, not invented. Nothing builds/runs/commits on this file.**

**Bind:** `Experts\SRJ_FlowNexus_EA.mq5` - SHA256 `7F01804EC5EFD89B25B115D778E2245103F688E765A31DE4CCD724E4F374A206` (576968 B, 10836 lines; the RECON36 stop-shadow build). Every code line verbatim with EA numbers. Pairs with the v89 companion (Regions U/V/W: ext1 identity, stop branch, R-latch context) which this file does NOT re-paste; the latch itself is re-carried as G2 below so this pack stands alone.

## Coverage map (every v92 inventory claim -> numbered lines below)

- "R computation + gate predicate live here" -> G1:9464-9466 (slDist/tpDist/tpOk; the single R number the gate tests).
- "latch is single-shot, never recomputed" -> G2:9531-9541 (comment + 5 latch writes incl. g_latchedSl = slRef).
- "R is the SOLE decline at the gate (GoAbort + return)" -> G3:9561-9599 (shortfall print + TP_RR_FAIL latch print + SLNONFIRE print + GoAbort + return; nothing else on this path).
- "session-use marks only on the SIGNAL path (post-fire)" -> G4:9697-9707 (alert-only print + MarkSessionUsed + ST_SIGNAL + ResetSequence + return; execution below is alert-unreachable).
- "divergence latch is consumed upstream, verdict-gated elsewhere" -> G5:7248-7252 (consume site; print-only re-read discipline follows).
- "R2 declined on R alone (bias aligned, non-opposed)" -> G6 journal rows (ORDER gateOutcome + CQD verdict + SLNONFIRE, mechanical pulls from RECON36).

## Region G1 - R computation, EA:9464-9466, whole

9464:       double slDist = MathAbs(currentPrice - slRef);
9465:       double tpDist = MathAbs(tpTarget - currentPrice);
9466:        bool tpOk = (slDist > 0.0 && (tpDist / slDist) >= InpMinRewardRisk);

## Region G2 - R latch, EA:9531-9541, whole

9531:        //--- [P-CONFIRM-GATE E3/E4] the R latch: measured ONCE at the confirmation
9532:       //--- close (entry = the next open, SL = the swing, TP = the closest line -
9533:       //--- the selector unchanged per the operator's ruling, "whichever is the
9534:       //--- closest"). Tested ONCE below: >= 1.0 fires; < 1.0 aborts TP_RR_FAIL
9535:       //--- with the latch values. NEVER recomputed - single-shot, so latch
9536:       //--- monotonicity holds by construction.
9537:       g_latchedEntry = currentPrice;
9538:       g_latchedSl    = slRef;
9539:       g_latchedTp    = tpTarget;
9540:       g_latchedR     = (slDist > 0.0) ? (tpDist / slDist) : 0.0;
9541:       g_latchBarTime = iTime(_Symbol, PERIOD_CURRENT, barShift);

## Region G3 - RR abort (sole decline), EA:9561-9599, whole

9561:       if(!tpOk)
9562:         {
9563:          if(InpDebugLog)
9564:             PrintFormat("[SRJ-EA] %s S5_RR_SHORTFALL tpDist=%.5f slDist=%.5f R=%.2f",
9565:                         TimeToString(TimeCurrent(), TIME_DATE|TIME_SECONDS),
9566:                         tpDist, slDist, (slDist > 0.0 ? tpDist / slDist : 0.0));
9567:          //--- [P-CONFIRM-GATE E5] TP_RR_FAIL keeps its name; the latch values
9568:          //--- are printed with it (the ruled 1R gate is a hard kill here - the
9569:          //--- latch is never recomputed on a later, more favourable bar).
9570:          if(InpDebugLog)
9571:             PrintFormat("[SRJ-EA] TP_RR_FAIL_LATCH bar=%s dir=%s entry=%s sl=%s tp=%s R=%.2f",
9572:                         TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift),
9573:                                      TIME_DATE|TIME_MINUTES),
9574:                         DirName(g_dir),
9575:                         DoubleToString(g_latchedEntry, _Digits),
9576:                         DoubleToString(g_latchedSl, _Digits),
9577:                         DoubleToString(g_latchedTp, _Digits),
9578:                          g_latchedR);
9579:           //--- [P-SLDEF-4 E33] the decided outcome rides the census.
9580:           SrjOrderEmit(barShift, "RR_FAIL");
9581:           //--- [P-SLDEF-5 E39] non-firing cost: today's R, today's ext
9582:           //--- index, ext-1 R, full-precision operands, would-fire verdict.
9583:           //--- Print-only; the abort below is untouched.
9584:           if(g_slext_barT == iTime(_Symbol, PERIOD_CURRENT, barShift) && g_slext_defined == 1)
9585:             {
9586:              int nfWould = (g_slext_r >= InpMinRewardRisk) ? 1 : 0;
9587:              if(nfWould == 1)
9588:                { g_slext_newN++; g_slext_newRows += TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES) + ";"; }
9589:              string nfLine = StringFormat("[SRJ-EA] SLNONFIRE fields=11 bar=%s dir=%s outcome=RR_FAIL todayR=%.2f todayXi=%s ext1R=%.2f rewardPts=%.5f riskPts=%.5f ext1RewardPts=%.5f ext1RiskPts=%.5f wouldFire=%d",
9590:                        TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES),
9591:                        DirName(g_dir), (slDist > 0.0 ? tpDist / slDist : 0.0), g_slext_todayXi,
9592:                        g_slext_r, tpDist / _Point, slDist / _Point,
9593:                        g_slext_rewardPts, g_slext_riskPts, nfWould);
9594:              LwAudit("SLNONFIRE", nfLine);
9595:              Print(nfLine);
9596:             }
9597:           GoAbort(ABORT_TP_RR_FAIL, g_state);
9598:           return;
9599:         }

## Region G4 - alert-only fire + session mark, EA:9697-9707, whole

9697:       if(InpMode == MODE_ALERT_ONLY)
9698:         {
9699:          PrintFormat("[SRJ-EA] ALERT_ONLY mode - no order sent. Session %s marked used.",
9700:                      SessionName(g_sessionAtEntry));
9701:          MarkSessionUsed(g_sessionAtEntry, g_anchorBarTime);
9702:          ENUM_SRJ_STATE prevA = g_state;
9703:          g_state = ST_SIGNAL;
9704:          LogState(prevA, g_state);
9705:          ResetSequence();
9706:          return;
9707:         }

## Region G5 - divergence-latch consume, EA:7248-7252, whole

7248:    if(g_state >= ST_S1_REGIME && g_dir != DIR_NONE)
7249:      {
7250:       string kind;
7251:       g_divLatch = UpdateDivergenceLatch(barShift, g_dir, kind);
7252:      }

## Region G6 - R2 decline rows, RECON36 journal, verbatim pulls

[SRJ-EA] ORDER fields=10 bar=1 barTime=2026.09.04 10:35 seqBias=-1 seqS5=264 biasAtGate=1 biasOpposedAtGate=0 flipNewThisBar=0 gateOutcome=RR_FAIL seqStamp=SEQ_UNSTAMPED seqCause=S4S5_NOBIAS
[SRJ-EA] SLNONFIRE fields=11 bar=2026.09.04 10:35 dir=SHORT outcome=RR_FAIL todayR=0.36 todayXi=NONE ext1R=1.21 rewardPts=41.00000 riskPts=114.00000 ext1RewardPts=41.00000 ext1RiskPts=34.00000 wouldFire=1
[SRJ-EA] SLNONFIRE fields=11 bar=2026.09.08 10:05 dir=SHORT outcome=RR_FAIL todayR=0.77 todayXi=NONE ext1R=2.52 rewardPts=133.40534 riskPts=174.00000 ext1RewardPts=133.40534 ext1RiskPts=53.00000 wouldFire=1
[SRJ-EA] SLNONFIRE fields=11 bar=2026.09.08 16:40 dir=SHORT outcome=RR_FAIL todayR=0.60 todayXi=NONE ext1R=0.68 rewardPts=99.00000 riskPts=166.00000 ext1RewardPts=99.00000 ext1RiskPts=146.00000 wouldFire=0

(End - v92 companion under the Bind digest; review asks per v92 section 3)
