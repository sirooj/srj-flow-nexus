# SNIPPET — v89 STOP-REGION COMPANION (one paste with the v89 relay; zero condensation)

**Paste whole to EACH reviewer TOGETHER with `06_HANDOFFS\BUILDER_RELAY_COUNCIL_v89-STOP-EVIDENCE-CLEAR.md` in ONE trip, TWO pastes. Answers ride with the v89 verdicts: ext1-identity + stop branch + S5 latch. Nothing builds/runs/commits on this file.**

**Bind:** `Experts\SRJ_FlowNexus_EA.mq5` — SHA256 `FAF8442BC1201CE5B82D2CD0F2725C9DFEB445ED45367CB9AADBE88285389617` (573129 B, 10773 lines; the RECON35 live build). Every code line verbatim with EA numbers. Pairs with all prior companions (O/P/Q/R/S/T stop at the seed/hold surfaces; this file opens the stop-selection surface for the first time).

## Coverage map (every v89 mechanism claim → numbered lines below)

- "ext1 is the SECOND outward extremity by construction (first swing with ext==1)" → R-U:2730-2761 (`SrjResolveExt1` whole: rung walk, ext numbering, ext==1 capture with px/slot/bt/imb).
- "live stop comes from the obValid 1SWING/2SWING branch, adoption OFF" → R-V:5568-5604 (branch selector + 1SWING arms + mode set).
- "S5 latches entry/sl/tp/R once; R gate single-shot" → R-W:9464-9478 (R computation + latch + gate comment).

## Region U — `SrjResolveExt1`, EA:2730–2761, whole

2730: void SrjResolveExt1(const int entryShift, const ENUM_SRJ_DIR dir, const double entryPx,
2731:                     int &hasX1, double &px, int &slot, datetime &bt, int &imb, int &deepest)
2732:    {
2733:     hasX1 = 0; px = 0.0; slot = -1; bt = 0; imb = -1; deepest = -1;
2734:     int swBuf = (dir == DIR_LONG) ? FL_BUF_SWING_LOW : FL_BUF_SWING_HIGH;
2735:     int imBuf = (dir == DIR_LONG) ? FL_BUF_SWING_LOW_IMB : FL_BUF_SWING_HIGH_IMB;
2736:     double best = 0.0; int extN = 0; int rungs = 0;
2737:     for(int s = entryShift; s <= entryShift + SRJ_LAD_ABS_SLOT_CAP; s++)
2738:       {
2739:        double v = 0.0;
2740:        if(!ReadFlow(swBuf, v, s)) break;
2741:        if(v == EMPTY_VALUE || v <= 0.0) continue;
2742:        if(!SlimbProtectiveSideOk(dir, v, entryPx)) continue;
2743:        int ext = -1;
2744:        if(rungs == 0) { ext = 0; best = v; extN = 1; }
2745:        else
2746:          {
2747:           bool more = (dir == DIR_LONG) ? (v < best - _Point) : (v > best + _Point);
2748:           if(more) { ext = extN; extN++; best = v; }
2749:          }
2750:        if(ext > deepest) deepest = ext;
2751:        if(ext == 1 && hasX1 == 0)
2752:          {
2753:           hasX1 = 1; px = v; slot = s;
2754:           bt = iTime(_Symbol, PERIOD_CURRENT, ApexShift(s));
2755:           double f = 0.0; imb = -1;
2756:           if(ReadFlow(imBuf, f, s) && f != EMPTY_VALUE) imb = (int)f;
2757:          }
2758:         rungs++;
2759:         if(rungs >= 512) break;
2760:        }
2761:     }

## Region V — stop branch selector + 1SWING arms, EA:5568–5604, whole

5568:    if((int)MathRound(obValid) == 1)
5569:      {
5570:        if(dir == DIR_LONG)
5571:          {
5572:           if(obSwingSideOk) slRefOut = obSwingRef;
5573:           else
5574:             {
5575:               if(!haveLow)
5576:                 {
5577:                  if(InpDebugLog && SHADOW_SLIMB)
5578:                     SlimbEmit(barShift, site, dir, "1SWING", (int)MathRound(obValid), "-", -1, slimb_latFlag, slimb_latShift, slimb_latAvail, slimb_apexMatch, -1, -1, 0, slimb_cands);
5579:                  if(InpDebugLog && SHADOW_SLIMBWALK)
5580:                     SlimbWalkEmit(barShift, site, dir, "1SWING", false, 0.0, -1, 0.0);
5581:                  S2StampStop(site, barShift, "SLREF_1SWING_NOLOW", 0, 0.0, (int)slModeOut, "NO_SELECTION", "-");
5582:                  return false;
5583:                 }
5584:              slRefOut = swingLow;
5585:             }
5586:          }
5587:        else
5588:          {
5589:           if(obSwingSideOk) slRefOut = obSwingRef;
5590:           else
5591:             {
5592:               if(!haveHigh)
5593:                 {
5594:                  if(InpDebugLog && SHADOW_SLIMB)
5595:                     SlimbEmit(barShift, site, dir, "1SWING", (int)MathRound(obValid), "-", -1, slimb_latFlag, slimb_latShift, slimb_latAvail, slimb_apexMatch, -1, -1, 0, slimb_cands);
5596:                  if(InpDebugLog && SHADOW_SLIMBWALK)
5597:                     SlimbWalkEmit(barShift, site, dir, "1SWING", false, 0.0, -1, 0.0);
5598:                  S2StampStop(site, barShift, "SLREF_1SWING_NOHIGH", 0, 0.0, (int)slModeOut, "NO_SELECTION", "-");
5599:                  return false;
5600:                 }
5601:              slRefOut = swingHigh;
5602:             }
5603:          }
5604:       slModeOut = SL_MODE_1SWING;

## Region W — R computation + S5 latch, EA:9464–9478, whole

9464:       double slDist = MathAbs(currentPrice - slRef);
9465:       double tpDist = MathAbs(tpTarget - currentPrice);
9466:       bool tpOk = (slDist > 0.0 && (tpDist / slDist) >= InpMinRewardRisk);
9467: 
9468:       //--- [P-CONFIRM-GATE E3/E4] the R latch: measured ONCE at the confirmation
9469:       //--- close (entry = the next open, SL = the swing, TP = the closest line -
9470:       //--- the selector unchanged per the operator's ruling, "whichever is the
9471:       //--- closest"). Tested ONCE below: >= 1.0 fires; < 1.0 aborts TP_RR_FAIL
9472:       //--- with the latch values. NEVER recomputed - single-shot, so latch
9473:       //--- monotonicity holds by construction.
9474:       g_latchedEntry = currentPrice;
9475:       g_latchedSl    = slRef;
9476:       g_latchedTp    = tpTarget;
9477:       g_latchedR     = (slDist > 0.0) ? (tpDist / slDist) : 0.0;
9478:       g_latchBarTime = iTime(_Symbol, PERIOD_CURRENT, barShift);

(End — v89 companion under the §Bind digest; review asks per v89 §1)
