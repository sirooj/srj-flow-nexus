# SNIPPET — v84 SEED-GATE/SUPERSEDE COMPANION (one paste with the v84 relay; zero condensation)

**Paste whole to EACH reviewer TOGETHER with `06_HANDOFFS\BUILDER_RELAY_COUNCIL_v84-TEST-TIMEOUT-CLOSEDSET.md` (+ the v75 companion re-paired below) in ONE trip, THREE pastes. Answers ride with the v84 verdicts: TEST-vs-TIMEOUT closed set (predicate + site + hold + threshold justification + corpus check) + clear-on-sight. Nothing builds/runs/commits on this file.**

**Bind:** `Experts\SRJ_FlowNexus_EA.mq5` — SHA256 `3B5CA00BE690EA46E140D99DA442BAFA79FFA102E5418D3E7A1C1BD201522EB2` (569412 B, 10713 lines; the RECON33 probe build — logic identical to the graded tree, plus the 15-line SIDE1D print at 1944-1958). Every code line verbatim with EA numbers. Pairs with the v75 companion (seed body, gate, resolver) + v81 companion (detector, rank, reset) — both bound to `D0DD07AA…` (pre-probe); regions BELOW EA:1944 there read +15 on the current tree (content identical, verified by the probe diff); regions above are line-identical. This companion's numbers are current-tree exact. The three surfaces below are NEW: the seed gate, the supersession block, and the held-bar call sites.

**Decisions ahead:** (T) TEST-completion (Finding-1 validity at the birth boundary) vs (O) TIMEOUT (elapsed-bars invalidation freeing the slot), possibly staged or converged with E hold. His reasons: London bearish-close kills confirmation; NY AM 4H+1H-short governs over 15m-long.

## Coverage map (every v84 mechanism claim → numbered lines below)

- "main seed detection runs ONLY at ST_IDLE (+ window + session-budget)" → R-O:7526-7548 (armed-flag, idle gate, window/session guards, detector call).
- "same-dir tier upgrade re-homes the live anchor + resets zone/touch/latch + falls S3/S4 back" → R-P:7396-7446 (B3 election, tier compare, re-home, resets, SUPERSEDE print).
- "held bars: t78 replacement (opp + HIGHER tier only), t73 print-only census, sh shadow (idle only)" → R-Q excerpts (guard + call each; bracketed).

## Region O — seed gate, EA:7526–7548, whole (armed flag + idle/window/session guards + call)

7526:     bool s1f_seedArmed = (g_state == ST_IDLE);   //--- [SIDE1F] (i) seed-bar exactness flag (new local only)
7527: 
7528:     if(g_state == ST_IDLE)
7529:       {
7530:        if(!inWindow) return;
7531:       if(SessionAlreadyUsed(sess, barTime))
7532:         {
7533:          static datetime s_limitDay  = 0;
7534:          static int      s_limitSess = -1;
7535:          datetime dayKey = TC_DayStart(barTime);
7536:          if(InpDebugLog && (dayKey != s_limitDay || (int)sess != s_limitSess))
7537:            {
7538:             s_limitDay  = dayKey;
7539:             s_limitSess = (int)sess;
7540:             PrintFormat("[SRJ-EA] %s SESSION_LIMIT: %s window already used today - "
7541:                         "all further candidates suppressed until the next window",
7542:                         TimeToString(TimeCurrent(), TIME_DATE|TIME_SECONDS),
7543:                         SessionName(sess));
7544:            }
7545:          return;
7546:         }
7547:         PoiRetestResult pr;
7548:         if(!DetectPoiRetest(barShift, pr) || !pr.found) return;

## Region P — supersession, EA:7396–7446, whole (election + tier compare + re-home + resets + print)

7396:    //--- (line-agnostic progress); the anchor-relative legs re-derive (zone and
7397:    //--- touch unbind; S3/S4 fall back to S3_ZONE_WAIT so arming re-runs).
7398:    //--- Runs BEFORE the t73 census so a promoted line is not ALSO counted as
7399:    //--- suppressed (the Task-78 placement discipline). Sets b3_superseded for E4.
7400:    bool b3_superseded = false;
7401:    if(inWindow &&
7402:       (g_state == ST_S1_REGIME || g_state == ST_S2_LTF_ALIGN ||
7403:        g_state == ST_S3_ZONE_WAIT || g_state == ST_S4_ARMED) &&
7404:       g_anchorLine >= 0 && g_dir != DIR_NONE)
7405:      {
7406:       int b3_cand = B3_ElectAnchor(barShift, g_dir);
7407:       if(b3_cand >= 0 &&
7408:          B3_AnchorTier(b3_cand) < B3_AnchorTier(g_anchorLine) &&
7409:          sess == g_sessionAtEntry)
7410:         {
7411:          int b3_from      = g_anchorLine;
7412:          int b3_fromRank  = g_authorityRank[b3_from];
7413:          int b3_fromTier  = B3_AnchorTier(b3_from);
7414:          int b3_toRank    = g_authorityRank[b3_cand];
7415:          int b3_toTier    = B3_AnchorTier(b3_cand);
7416:          ENUM_SRJ_STATE b3_prevState = g_state;
7417:          g_anchorLine    = b3_cand;
7418:          ReadBuf1(g_hPoi, b3_cand, g_anchorPrice, barShift);
7419:          g_anchorBarTime = barTime;
7420:          g_zoneHi        = 0.0;
7421:          g_zoneLo        = 0.0;
7422:          g_touchSeen     = false;
7423:          g_touchBarHi    = 0.0;
7424:          g_touchBarLo    = 0.0;
7425:          g_latchedEntry  = 0.0;
7426:          g_latchedSl     = 0.0;
7427:          g_latchedTp     = 0.0;
7428:          g_latchedR      = 0.0;
7429:          g_latchBarTime  = 0;
7430:          g_confirmFromState = ST_IDLE;
7431:          if(g_state == ST_S3_ZONE_WAIT || g_state == ST_S4_ARMED)
7432:            {
7433:             ENUM_SRJ_STATE b3_prev = g_state;
7434:             g_state = ST_S3_ZONE_WAIT;
7435:             LogState(b3_prev, g_state);
7436:            }
7437:          b3_superseded = true;
7438:          if(InpDebugLog)
7439:             PrintFormat("[SRJ-EA] ANCHOR_SUPERSEDE bar=%s from=%s rank=%d tier=%d to=%s rank=%d tier=%d dir=%s state=%s",
7440:                         TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift),
7441:                                      TIME_DATE|TIME_MINUTES),
7442:                         g_lineCode[b3_from], b3_fromRank, b3_fromTier,
7443:                         g_lineCode[b3_cand], b3_toRank, b3_toTier,
7444:                         DirName(g_dir), StateName(b3_prevState));
7445:         }
7446:      }

## Region Q — held-bar call sites (bracketed excerpts; guard + call each)

[t78 site excerpt]
7366:    if(g_state > ST_IDLE && g_state != ST_ABORT && g_anchorLine >= 0 && inWindow)
7367:      {
7368:       PoiRetestResult t78_pr;
7369:       if(DetectPoiRetest(barShift, t78_pr) && t78_pr.found)
7370:         {
7371:          ENUM_SRJ_DIR t78_dir = t78_pr.isLong ? DIR_LONG : DIR_SHORT;
7372:          bool t78_opp  = (t78_dir != g_dir);
7373:          bool t78_tier = ((g_authorityRank[t78_pr.topLine] / 2) <
7374:                           (g_authorityRank[g_anchorLine]   / 2));
7375:          if(t78_opp && t78_tier)
7376:            {
[t73 site excerpt]
7470:    if(InpDebugLog && inWindow &&
7471:       g_state > ST_IDLE && g_state != ST_ABORT && g_anchorLine >= 0)
7472:      {
7473:       static int s_t73_n      = 0;
7474:       static int s_t73_higher = 0;
7475:       static int s_t73_opp    = 0;
7476:       static int s_t73_both   = 0;
7477:       static int s_t73_bars   = 0;
7478:       s_t73_bars++;
7479:       PoiRetestResult t73_pr;
7480:       if(DetectPoiRetest(barShift, t73_pr) && t73_pr.found)
[sh site excerpt]
7515:       if(g_state > ST_IDLE && g_state != ST_ABORT && g_anchorLine >= 0)
7516:          ShadowConfirmPoll(barShift, g_anchorLine, g_dir);
7517:       else if(g_state == ST_IDLE)
7518:         {
7519:          PoiRetestResult sh_pr;
7520:          if(DetectPoiRetest(barShift, sh_pr) && sh_pr.found)
7521:             ShadowConfirmPoll(barShift, sh_pr.topLine,
7522:                               sh_pr.isLong ? DIR_LONG : DIR_SHORT);
7523:         }

(End — v84 companion under the §Bind digest; review asks per v84 §2)
