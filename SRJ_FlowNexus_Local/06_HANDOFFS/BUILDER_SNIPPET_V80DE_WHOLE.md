# SNIPPET — v80 D/E EVIDENCE COMPANION (one paste with the v80 relay; zero condensation)

**Paste whole to EACH reviewer TOGETHER with `06_HANDOFFS\BUILDER_RELAY_COUNCIL_v80-DE-EVIDENCE.md` (one trip, two pastes). Answers ride with the v80 verdicts: D-BIRTH-001 / E-SURVIVAL-001 completion (predicate+site+hold+predictions+thresholds+novel-evidence+range, staged) + clear-on-sight. Nothing builds/runs/commits on this file.**

**Bind:** `Experts\SRJ_FlowNexus_EA.mq5` — SHA256 `D0DD07AA0379A7046E7B7AB03325DB9A99B33D89408E7C80B970FC4D09F3BC18` (568323 B, 10698 lines). Every code line verbatim with EA numbers. Pairs with the v75 companion (seed Regions A/B + live/shadow + resolver + gate, same digest, still binding — not re-pasted); the two regions below are the NEW kill/abort surfaces Sonnet's v79 review named as missing.

**Decisions ahead:** birth predicate + site for S1's never-born SHORT (D) + survival predicate + site for S2's killed-then-aborted SHORT (E), staged D→E. His reasons: London bearish-close kills confirmation; NY AM 4H+1H-short governs over 15m-long.

## Coverage map (every v80 mechanism claim → numbered lines below)

- "confirm-fail prints but does NOT kill" → R-F:8454-8458 (else-branch prints; candidate stays — compare the promotion arm R-F:8447-8452).
- "S4→S5 edge promotes ONLY on a true test bar; failed term consumes the confirmation, no carry-forward" → R-F:8437-8445.
- "R latch measured ONCE; >= 1.0 fires, < 1.0 aborts TP_RR_FAIL, never recomputed" → R-G:9393-9398 + abort R-G:9423-9460.
- "TP_RR_FAIL keeps its name; latch values printed with it" → R-G:9429-9440.
- "decided outcome rides the census (RR_FAIL emit + SLNONFIRE print-only)" → R-G:9441-9458 (abort itself untouched).
- "R-gate input is his flat-1.0 rule" → R-G:9391 (`InpMinRewardRisk`, EA:57).

## Region F — S4→S5 confirmation edge + CONFIRM_STRUCT_FAIL, EA:8428–8459, whole

8428:       if(!g_touchSeen)
8429:         {
8430:          bool oppositeDir = (g_dir == DIR_LONG) ? (c < o) : (c > o);
8431:          bool touchesZone = (h >= g_zoneLo && l <= g_zoneHi);
8432:          if(oppositeDir && (!s35_fromFvg || touchesZone))
8433:            { g_touchSeen = true; g_touchBarHi = h; g_touchBarLo = l; }
8434:         }
8435:       else
8436:         {
8437:          //--- [P-CONFIRM-GATE E2] the S4->S5 edge IS the confirmation predicate
8438:          //--- now (terms A/A2/B/C; the ruled retracement term A2: the prior
8439:          //--- candle's CLOSE stays on the setup side of the anchor line - a wick
8440:          //--- through is the retracement, a CLOSE through is a line break).
8441:          //--- One-bar validity: promotion happens ONLY on a true test bar; a
8442:          //--- failed term consumes the confirmation (no carry-forward) and a
8443:          //--- later bar can present a fresh confirmation while the candidate is
8444:          //--- alive and in-window. The touch fallback above STAYS (it sets
8445:          //--- g_touchSeen - the retracement detection; unchanged).
8446:          string cfTerm = "";
8447:          if(IsConfirmationCandle(barShift, g_anchorLine, g_dir, cfTerm))
8448:            {
8449:             ENUM_SRJ_STATE prev = g_state;
8450:             g_confirmFromState = prev;
8451:             g_state = ST_S5_GATE_CHECK;
8452:             LogState(prev, g_state);
8453:            }
8454:          else if(InpDebugLog)
8455:             PrintFormat("[SRJ-EA] CONFIRM_STRUCT_FAIL bar=%s dir=%s term=%s",
8456:                         TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift),
8457:                                      TIME_DATE|TIME_MINUTES),
8458:                         DirName(g_dir), cfTerm);
8459:         }

## Region G — R latch + TP_RR_FAIL abort, EA:9389–9461, whole

9389:       double slDist = MathAbs(currentPrice - slRef);
9390:       double tpDist = MathAbs(tpTarget - currentPrice);
9391:       bool tpOk = (slDist > 0.0 && (tpDist / slDist) >= InpMinRewardRisk);
9392: 
9393:       //--- [P-CONFIRM-GATE E3/E4] the R latch: measured ONCE at the confirmation
9394:       //--- close (entry = the next open, SL = the swing, TP = the closest line -
9395:       //--- the selector unchanged per the operator's ruling, "whichever is the
9396:       //--- closest"). Tested ONCE below: >= 1.0 fires; < 1.0 aborts TP_RR_FAIL
9397:       //--- with the latch values. NEVER recomputed - single-shot, so latch
9398:       //--- monotonicity holds by construction.
9399:       g_latchedEntry = currentPrice;
9400:       g_latchedSl    = slRef;
9401:       g_latchedTp    = tpTarget;
9402:       g_latchedR     = (slDist > 0.0) ? (tpDist / slDist) : 0.0;
9403:       g_latchBarTime = iTime(_Symbol, PERIOD_CURRENT, barShift);
9404: 
9405:       //--- [P-CONFIRM-SHADOW] TP_ELECT: what WOULD be latched under the ruled rule
9406:       //--- (entry = the next open, SL = the swing, TP = the closest line - the selector
9407:       //--- unchanged per the operator's ruling, "whichever is the closest"). LOG ONLY -
9408:       //--- the latch itself is build 2+; this prints the would-be values each time the
9409:       //--- gate evaluates, so the calibration shows R at every bar the gate saw.
9410:       if(InpDebugLog && SHADOW_TP_ELECT)
9411:          PrintFormat("[SRJ-EA] TP_ELECT shadow=true entry=%s sl=%s tp=%s R=%.2f "
9412:                      "bar=%s latchBar=%s",
9413:                      DoubleToString(currentPrice, _Digits),
9414:                      DoubleToString(slRef, _Digits),
9415:                      DoubleToString(tpTarget, _Digits),
9416:                      (slDist > 0.0 ? tpDist / slDist : 0.0),
9417:                      TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift),
9418:                                   TIME_DATE|TIME_MINUTES),
9419:                      TimeToString(iTime(_Symbol, PERIOD_CURRENT,
9420:                                    (barShift >= 1 ? barShift - 1 : 0)),
9421:                                   TIME_DATE|TIME_MINUTES));
9422: 
9423:       if(!tpOk)
9424:         {
9425:          if(InpDebugLog)
9426:             PrintFormat("[SRJ-EA] %s S5_RR_SHORTFALL tpDist=%.5f slDist=%.5f R=%.2f",
9427:                         TimeToString(TimeCurrent(), TIME_DATE|TIME_SECONDS),
9428:                         tpDist, slDist, (slDist > 0.0 ? tpDist / slDist : 0.0));
9429:          //--- [P-CONFIRM-GATE E5] TP_RR_FAIL keeps its name; the latch values
9430:          //--- are printed with it (the ruled 1R gate is a hard kill here - the
9431:          //--- latch is never recomputed on a later, more favourable bar).
9432:          if(InpDebugLog)
9433:             PrintFormat("[SRJ-EA] TP_RR_FAIL_LATCH bar=%s dir=%s entry=%s sl=%s tp=%s R=%.2f",
9434:                         TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift),
9435:                                      TIME_DATE|TIME_MINUTES),
9436:                         DirName(g_dir),
9437:                         DoubleToString(g_latchedEntry, _Digits),
9438:                         DoubleToString(g_latchedSl, _Digits),
9439:                         DoubleToString(g_latchedTp, _Digits),
9440:                          g_latchedR);
9441:           //--- [P-SLDEF-4 E33] the decided outcome rides the census.
9442:           SrjOrderEmit(barShift, "RR_FAIL");
9443:           //--- [P-SLDEF-5 E39] non-firing cost: today's R, today's ext
9444:           //--- index, ext-1 R, full-precision operands, would-fire verdict.
9445:           //--- Print-only; the abort below is untouched.
9446:           if(g_slext_barT == iTime(_Symbol, PERIOD_CURRENT, barShift) && g_slext_defined == 1)
9447:             {
9448:              int nfWould = (g_slext_r >= InpMinRewardRisk) ? 1 : 0;
9449:              if(nfWould == 1)
9450:                { g_slext_newN++; g_slext_newRows += TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES) + ";"; }
9451:              string nfLine = StringFormat("[SRJ-EA] SLNONFIRE fields=11 bar=%s dir=%s outcome=RR_FAIL todayR=%.2f todayXi=%s ext1R=%.2f rewardPts=%.5f riskPts=%.5f ext1RewardPts=%.5f ext1RiskPts=%.5f wouldFire=%d",
9452:                        TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES),
9453:                        DirName(g_dir), (slDist > 0.0 ? tpDist / slDist : 0.0), g_slext_todayXi,
9454:                        g_slext_r, tpDist / _Point, slDist / _Point,
9455:                        g_slext_rewardPts, g_slext_riskPts, nfWould);
9456:              LwAudit("SLNONFIRE", nfLine);
9457:              Print(nfLine);
9458:             }
9459:           GoAbort(ABORT_TP_RR_FAIL, g_state);
9460:           return;
9461:         }

(End — v80 companion under the §Bind digest; review asks per v80 §2)
