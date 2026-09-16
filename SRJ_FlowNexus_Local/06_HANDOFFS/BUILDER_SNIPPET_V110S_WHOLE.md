# COMPANION V110S - STOP-REFERENCE PATH, WHOLE REGIONS (fresh profile: paste with v110)

Tree: EA FEC50B24/587901. Regions numbered disk lines, byte-identical, sequence exact, zero condensation in code regions.

Claim map: (1) Region W is the ENTIRE 1-swing OB branch (Task-26a header 5548 + refs/side-test 5559-5568 + LONG/SHORT paths 5569-5605 with the SHORT take at 5590 + wrong-side history 5606-5633 + Task-75 guard 5634-5694 + retired-Step-1 note 5696-5701 + SLSRC emit 5702-5716 + SL_REF emit 5717-5724 + OB-slot trace 5725-5766 + stamp/return 5767-5769 + close 5770) - the load-bearing line is 5590: side-OK takes obSwingRef with NO staleness test anywhere in W; (2) Region X is the E45 token-split + noneSlot fallback + SLEXT45 emit 9396-9436 - OFF_LADDER names the Sep-3-pin shape (9405-9406: slots 168/817 persisting Sep-3 20:35 OB extreme pair), fallback binds wTodaySlot when today has no rung (9426-9428); (3) journal proof that this path fired at 10:05 rides the relay (SEL61SRC SLREF_1SWING 1.16379 slot-738 + SLEXT45 noneSlot=738 noneT=2026.09.03 20:35 refSlotAgeBars=737 + SIDE1E sel=1/r1=2.52/livePass=0).

Carried (bind this digest, pre-insertion or untouched): V107V Regions U 183-208 + V 7660-7698 (SIDE1V probe, still the birth-evidence code).

--- Region W: EA 5548-5770 (1-swing OB branch, whole) ---
5548:    // [Task 26a] EA-8b. Part A Step 6: "one swing away from that order block's
5549:    // swing high/low" Ã¢â‚¬â€ buffer 27 is that swing bar's protective extreme, so the
5550:    // stop reference now derives from the structure that defines the entry zone
5551:    // instead of the nearest swing anywhere. Buffer 26 is read for comparison only.
5552:    //
5553:    // The side check below is a sanity guard, not a Part A rule: FlowLogic selects
5554:    // the order block from g_s.currentBias, and the RR poll spans S2 through S5, so
5555:    // bias can move under the candidate and hand back a swing high while dir is
5556:    // LONG. It compares against iClose(barShift), which is EA-23b's known-wrong
5557:    // reference Ã¢â‚¬â€ the least-bad option available until Ruling 7a lands, and it will
5558:    // be revisited there. Failing the check falls back, it does not abort.
5559:    double slCurPx     = iClose(_Symbol, PERIOD_CURRENT, barShift);
5560:    double obStructRef = 0.0;
5561:    double obSwingRef  = 0.0;
5562:    bool haveObStruct = ReadFlow(FL_BUF_OB_STRUCT_EXTREME, obStructRef, barShift)
5563:                        && obStructRef != EMPTY_VALUE && obStructRef > 0.0;
5564:    bool haveObSwing  = ReadFlow(FL_BUF_OB_SWING_EXTREME, obSwingRef, barShift)
5565:                        && obSwingRef != EMPTY_VALUE && obSwingRef > 0.0;
5566:    bool obSwingSideOk = haveObSwing &&
5567:                         ((dir == DIR_LONG) ? (obSwingRef < slCurPx)
5568:                                            : (obSwingRef > slCurPx));
5569:    if((int)MathRound(obValid) == 1)
5570:      {
5571:        if(dir == DIR_LONG)
5572:          {
5573:           if(obSwingSideOk) slRefOut = obSwingRef;
5574:           else
5575:             {
5576:               if(!haveLow)
5577:                 {
5578:                  if(InpDebugLog && SHADOW_SLIMB)
5579:                     SlimbEmit(barShift, site, dir, "1SWING", (int)MathRound(obValid), "-", -1, slimb_latFlag, slimb_latShift, slimb_latAvail, slimb_apexMatch, -1, -1, 0, slimb_cands);
5580:                  if(InpDebugLog && SHADOW_SLIMBWALK)
5581:                     SlimbWalkEmit(barShift, site, dir, "1SWING", false, 0.0, -1, 0.0);
5582:                  S2StampStop(site, barShift, "SLREF_1SWING_NOLOW", 0, 0.0, (int)slModeOut, "NO_SELECTION", "-");
5583:                  return false;
5584:                 }
5585:              slRefOut = swingLow;
5586:             }
5587:          }
5588:        else
5589:          {
5590:           if(obSwingSideOk) slRefOut = obSwingRef;
5591:           else
5592:             {
5593:               if(!haveHigh)
5594:                 {
5595:                  if(InpDebugLog && SHADOW_SLIMB)
5596:                     SlimbEmit(barShift, site, dir, "1SWING", (int)MathRound(obValid), "-", -1, slimb_latFlag, slimb_latShift, slimb_latAvail, slimb_apexMatch, -1, -1, 0, slimb_cands);
5597:                  if(InpDebugLog && SHADOW_SLIMBWALK)
5598:                     SlimbWalkEmit(barShift, site, dir, "1SWING", false, 0.0, -1, 0.0);
5599:                  S2StampStop(site, barShift, "SLREF_1SWING_NOHIGH", 0, 0.0, (int)slModeOut, "NO_SELECTION", "-");
5600:                  return false;
5601:                 }
5602:              slRefOut = swingHigh;
5603:             }
5604:          }
5605:       slModeOut = SL_MODE_1SWING;
5606:    // [Task 75 / EA-79 / Ruling 1 Option C] A fallback swing on the WRONG SIDE
5607:    // of the entry reference is not a stop reference. Measured: 2026.08.13 16:40
5608:    // emitted SIGNAL dir=LONG with slRef=1.15378 against close=1.15339 - the stop
5609:    // sat 39 points ABOVE entry and the target 80 points above, both on the profit
5610:    // side, and the RR gate passed at R=2.05 because slDist is a MathAbs. One of
5611:    // six signals was not a tradeable setup.
5612:    //
5613:    // Mechanism: obSwingSideOk is the side test for buffer 27, and when it fails
5614:    // the fallback takes the nearest confirmed swing with NO side test at all.
5615:    // Price had closed below the last confirmed swing low without a new one
5616:    // forming, so FindNearestSwing returned a low above the close. One instance
5617:    // in 20 S5 evaluations; the other five fallbacks were side-correct.
5618:    //
5619:    // Threshold-free: the test is WHICH SIDE of slCurPx the reference lies on,
5620:    // never how far. Part A section 7 is not engaged. The reference is slCurPx,
5621:    // the same iClose(barShift) that obSwingSideOk already compares against - one
5622:    // reference for both branches - and at S5 that close IS the entry (Ruling 7a).
5623:    //
5624:    // The walk requires BOTH the protective side AND, once a zone is adopted,
5625:    // exclusion from it. Requiring both is what prevents interaction with the
5626:    // Task 67 guard below: after this block slRefOut is outside the zone, so Task
5627:    // 67's condition is false and it is inert. When this guard does not fire,
5628:    // Task 67 behaves exactly as it does today.
5629:    //
5630:    // Scoped to the fallback path only (!obSwingSideOk), as Task 67 is. Aborts
5631:    // only on exhaustion, per Ruling 1 Option C - a valid swing further back is
5632:    // always preferred to abandoning the setup. The 500-slot bound and the
5633:    // g_zoneHi/g_zoneLo inertness before arming both match Task 67 exactly.
5634:    bool t75_sideOk = SlimbProtectiveSideOk(dir, slRefOut, slCurPx);
5635:    if(!obSwingSideOk && !t75_sideOk)
5636:      {
5637:       int    t75_buf  = (dir == DIR_LONG) ? FL_BUF_SWING_LOW : FL_BUF_SWING_HIGH;
5638:       int    t75_from = (dir == DIR_LONG) ? shLow : shHigh;
5639:       double t75_was  = slRefOut;
5640:       bool   t75_ok   = false;
5641:         for(int t75_s = t75_from + 1; t75_s <= t75_from + 500; t75_s++)
5642:           {
5643:            double t75_v;
5644:            g_o1_maxS = t75_s;   //--- [O1-HOOK] walk-bound capture (writes only)
5645:            if(!ReadFlow(t75_buf, t75_v, t75_s))     break;
5646:           if(t75_v == EMPTY_VALUE || t75_v <= 0.0) continue;
5647:           //--- [P-SWINGIMB] record examined swing (print-only; walk unchanged).
5648:           if(InpDebugLog && SHADOW_SLIMB && slimb_ncands < 6)
5649:             {
5650:              double slimb_tvf = 0.0;
5651:              string slimb_tvs = "x";
5652:              if(ReadFlow(slimb_imbBuf, slimb_tvf, t75_s) && slimb_tvf != EMPTY_VALUE)
5653:                 slimb_tvs = IntegerToString((int)slimb_tvf);
5654:              slimb_cands = ((slimb_ncands == 0) ? "" : slimb_cands + " ")
5655:                            + SlimbTuple(t75_s, t75_v, slimb_tvs, dir, slCurPx);
5656:              slimb_ncands++;
5657:             }
5658:           if((dir == DIR_LONG) ? (t75_v >= slCurPx) : (t75_v <= slCurPx)) continue;
5659:           slRefOut = t75_v;
5660:           slimb_t75shift = t75_s;
5661:           t75_ok   = true;
5662:          if(InpDebugLog)
5663:             PrintFormat("[SRJ-EA] SLSIDEGUARD site=%s dir=%s rejected=%s "
5664:                         "chosen=%s atShift=%d fromShift=%d close=%s "
5665:                         "zoneLo=%s zoneHi=%s",
5666:                         site, DirName(dir),
5667:                         DoubleToString(t75_was, _Digits),
5668:                         DoubleToString(slRefOut, _Digits),
5669:                         t75_s, t75_from,
5670:                         DoubleToString(slCurPx, _Digits),
5671:                         DoubleToString(g_zoneLo, _Digits),
5672:                         DoubleToString(g_zoneHi, _Digits));
5673:          break;
5674:         }
5675:        if(!t75_ok)
5676:          {
5677:           if(InpDebugLog)
5678:              PrintFormat("[SRJ-EA] SLSIDEGUARD site=%s dir=%s rejected=%s "
5679:                          "chosen=NONE fromShift=%d close=%s zoneLo=%s zoneHi=%s "
5680:                          "result=noProtectiveSideSwing",
5681:                          site, DirName(dir),
5682:                          DoubleToString(t75_was, _Digits),
5683:                          t75_from,
5684:                          DoubleToString(slCurPx, _Digits),
5685:                          DoubleToString(g_zoneLo, _Digits),
5686:                          DoubleToString(g_zoneHi, _Digits));
5687:           if(InpDebugLog && SHADOW_SLIMB)
5688:              SlimbEmit(barShift, site, dir, "1SWING", (int)MathRound(obValid), "-", -1, slimb_latFlag, slimb_latShift, slimb_latAvail, slimb_apexMatch, -1, -1, 0, slimb_cands);
5689:            if(InpDebugLog && SHADOW_SLIMBWALK)
5690:               SlimbWalkEmit(barShift, site, dir, "1SWING", false, 0.0, -1, 0.0);
5691:            S2StampStop(site, barShift, "SLREF_1SWING_GUARD", 0, 0.0, (int)slModeOut, "NO_SELECTION", "-");
5692:            return false;
5693:           }
5694:       }
5695: 
5696:    // [STEP 1 RETIRED] The Task 67 in-zone stop exclusion is removed per operator
5697:    // ruling and spec 3.7: the stop may sit inside the entry zone (measured 1.15835
5698:    // inside 1.15805-1.15843), and the correct test is the side relative to the
5699:    // entry, never containment. Retired in the same edit as the Task 75 walk
5700:    // zone-continue above, per council Part 2.1: the two guards were coupled -
5701:    // retiring one alone changed nothing on bars where the other fired.
5702:       if(InpDebugLog)
5703:          PrintFormat("[SRJ-EA] SLSRC site=%s dir=%s src=%s obStruct=%s obSwing=%s "
5704:                      "nearest=%s chosen=%s deltaPts=%s",
5705:                      site, DirName(dir),
5706:                      obSwingSideOk ? "OB_SWING"
5707:                                    : (haveObSwing ? "FALLBACK_SIDE" : "FALLBACK_EMPTY"),
5708:                      haveObStruct ? DoubleToString(obStructRef, _Digits) : "-",
5709:                      haveObSwing  ? DoubleToString(obSwingRef,  _Digits) : "-",
5710:                      (dir == DIR_LONG)
5711:                         ? (haveLow  ? DoubleToString(swingLow,  _Digits) : "-")
5712:                         : (haveHigh ? DoubleToString(swingHigh, _Digits) : "-"),
5713:                      DoubleToString(slRefOut, _Digits),
5714:                      (haveObSwing && haveObStruct)
5715:                         ? DoubleToString(MathAbs(obSwingRef - obStructRef) / _Point, 0)
5716:                         : "-");
5717:        if(InpDebugLog)
5718:           PrintFormat("[SRJ-EA] SL_REF branch=1-swing obValid=1 slRef=%s distPts=%.0f site=%s "
5719:                       "zoneLo=%s zoneHi=%s",
5720:                       DoubleToString(slRefOut, _Digits),
5721:                       MathAbs(iClose(_Symbol, PERIOD_CURRENT, barShift) - slRefOut) / _Point,
5722:                       site,
5723:                       DoubleToString(g_zoneLo, _Digits),
5724:                       DoubleToString(g_zoneHi, _Digits));
5725:        //--- [P-SWINGIMB-2 E6] chosen = the traced swing slot. The OB-source
5726:        //--- path resolves via buffer 39 (bar time -> eval shift); any residual
5727:        //--- keeps -1 with its cause in cands, never absorbed.
5728:        if(InpDebugLog && SHADOW_SLIMB)
5729:          {
5730:           if(obSwingSideOk)
5731:             {
5732:              double slimb_obt = 0.0;
5733:              if(ReadFlow(FL_BUF_OB_SWING_TIME, slimb_obt, barShift) && slimb_obt > 0.0)
5734:                {
5735:                 int slimb_ser = iBarShift(_Symbol, PERIOD_CURRENT, (datetime)slimb_obt, false);
5736:                 int slimb_ev = slimb_ser - FLOW_SHIFT_OFFSET;
5737:                 int slimb_swingBuf = (dir == DIR_LONG) ? FL_BUF_SWING_LOW : FL_BUF_SWING_HIGH;
5738:                 double slimb_sv = 0.0;
5739:                 if(slimb_ev >= 0 && ReadFlow(slimb_swingBuf, slimb_sv, slimb_ev) && slimb_sv == slRefOut)
5740:                   {
5741:                    double slimb_cfv = 0.0;
5742:                    if(ReadFlow(slimb_imbBuf, slimb_cfv, slimb_ev) && slimb_cfv != EMPTY_VALUE)
5743:                      { slimb_chAvail = 1; slimb_chFlag = (int)slimb_cfv; }
5744:                    slimb_chShift = slimb_ev;
5745:                   }
5746:                 else
5747:                    slimb_cands = "NOOBSLOT:" + IntegerToString(slimb_ev);
5748:                }
5749:              else
5750:                 slimb_cands = "NOOBTIME";
5751:             }
5752:           else
5753:             {
5754:              int slimb_cs = (slimb_t75shift >= 0) ? slimb_t75shift : slimb_latShift;
5755:              if(slimb_cs >= 0)
5756:                {
5757:                 double slimb_cf = 0.0;
5758:                 if(ReadFlow(slimb_imbBuf, slimb_cf, slimb_cs) && slimb_cf != EMPTY_VALUE)
5759:                   { slimb_chAvail = 1; slimb_chFlag = (int)slimb_cf; }
5760:                 slimb_chShift = slimb_cs;
5761:                }
5762:             }
5763:            SlimbEmit(barShift, site, dir, "1SWING", (int)MathRound(obValid), DoubleToString(slRefOut, _Digits), slimb_chShift, slimb_latFlag, slimb_latShift, slimb_latAvail, slimb_apexMatch, slimb_chFlag, slimb_chShift, slimb_chAvail, slimb_cands);
5764:            if(InpDebugLog && SHADOW_SLIMBWALK)
5765:             SlimbWalkEmit(barShift, site, dir, "1SWING", true, slRefOut, slimb_chShift, slRefOut, slimb_latShift);
5766:           }
5767:          S2StampStop(site, barShift, "SLREF_1SWING", 1, slRefOut, (int)slModeOut, "IN_SCOPE_RULE", "-");
5768:          if(InpDebugLog) A6Term(barShift, site, dir, slModeOut, slRefOut, slimb_chShift);   //--- [A6-HOOK] (i)
5769:          return true;
5770:      }
--- Region X: EA 9396-9436 (E45 split + noneSlot fallback + SLEXT45 emit, whole) ---
9396:                //--- [P-SLDEF-6 E45.1/E45.2] token-split status row: OFF_LADDER
9397:                //--- vs EXT_NONE distinct; noneAge only on OFF_LADDER with slot
9398:                //--- and barTime; VACUOUS_COVER + EXT1_UNCOVERED name the 9/08
9399:                //--- shape. Print-only; SLEXT1 verdict tokens untouched.
9400:                //--- [Verdict #8 §3] occupancy predicate RETIRED (council-owned
9401:                //--- spec failure, verdict-owned: the population is genuinely
9402:                //--- 4/4 occupied, so occupancy discriminates nothing; the
9403:                //--- OCCUPIED_NOMATCH token retires with it). Discriminator is
9404:                //--- SLOT-REACH: the reference slot vs the ladder's deepest
9405:                //--- rung shift. OFF_LADDER = beyond reach (no rung can exist
9406:                //--- by construction — the 168/817 persisting Sep-3 20:35 OB
9407:                //--- extreme pair). EXT_NONE = within reach but no rung
9408:                //--- emitted (emission failure, frame-defect family).
9409:                //--- Ladder-shift membership rejected (0/4, status quo ante).
9410:                //--- Expected split OFF_LADDER=2 / EXT_NONE=2 /
9411:                //--- OCCUPIED_NOMATCH=0, graded as prediction. Slot/age
9412:                //--- binding restored on every classified row — the in-run
9413:                //--- gate is slots 168/408/21/817 exactly, else E49 returns
9414:                //--- unruled.
9415:                int sl45_deep = -1;
9416:                for(int sl45_k = 0; sl45_k < ladRungN; sl45_k++)
9417:                   if(ladRungShift[sl45_k] > sl45_deep) sl45_deep = ladRungShift[sl45_k];
9418:                string sl45_extS = (e35_def == 1) ? "EXT_DEFINED" : "EXT_NONE";
9419:                string sl45_todayS = "ON_LADDER";
9420:                if(ladRungN <= 0) sl45_todayS = "NO_RUNGS";
9421:                else if(xT == "NONE") sl45_todayS = (wTodaySlot >= 0 && wTodaySlot <= sl45_deep) ? "EXT_NONE" : "OFF_LADDER";
9422:                //--- refSlotAge (was noneAgeBars): reference slot minus entry
9423:                //--- shift, in slots, positive-older (the REF_OB_DEEP slotDist
9424:                //--- convention). Emitted on BOTH statuses — OFF_LADDER and
9425:                //--- EXT_NONE rows alike.
9426:                int sl45_noneSlot = -1; string sl45_noneT = "-"; int sl45_refAge = -1;
9427:                if(sl45_todayS != "ON_LADDER" && sl45_todayS != "NO_RUNGS" && wTodaySlot >= 0)
9428:                  { sl45_noneSlot = wTodaySlot; sl45_noneT = SlimbShiftT(wTodaySlot); sl45_refAge = wTodaySlot - barShift; }
9429:                string sl45_vacS = (wRowStatus == "VACUOUS_COVER") ? "VACUOUS_COVER" : "-";
9430:                string sl45_covS = (ladCovers == 1) ? "COVERED" : "EXT1_UNCOVERED";
9431:                string sl45_line = StringFormat("[SRJ-EA] SLEXT45 fields=10 bar=%s site=S5 dir=%s extStatus=%s todayStatus=%s noneSlot=%d noneT=%s refSlotAgeBars=%d vacStatus=%s coverStatus=%s ladObligN=%d",
9432:                          TimeToString(ladBarT, TIME_DATE|TIME_MINUTES), DirName(g_dir),
9433:                          sl45_extS, sl45_todayS, sl45_noneSlot, sl45_noneT, sl45_refAge,
9434:                          sl45_vacS, sl45_covS, wCoverN);
9435:                LwAudit("SLEXT45", sl45_line);
9436:                Print(sl45_line);
