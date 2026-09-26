# PACKET_P-UJIMPL-IMPL-1 v1 DRAFT - implementation edits for cleared UJ design (build gated on Luna key + run word; nothing builds/runs/commits on this file)

Status: v1 DRAFT (design CLEAR complete: v306 2-0 + v307 2-0 confirms; this packet carries exact old-to-new edits with line anchors; STAGE-1/S3 disciplines attach; build needs a NEW Luna key + his run word, neither spent nor asked here).

Canonical files: Indicators\SRJ_FlowLogic.mq5 (print-only latch debug) + its HTF-engine include (verification only; D1-ruled repairs in-scope if verification fails) + Experts\SRJ_FlowNexus_EA.mq5 (edits E1-E9 below). No new buffers, no new inputs, no second handle, no EA-side mirror.

## Authority (his words + disk + CLEAR, no invention)
- V306 2-0 CLEAR* (B-premise withdrawn, producer census banked) + V307 2-0 CONFIRM (DQ1R + DQ4R). DQ2/DQ3 CLEAR carried. E1/E2 CLEAR carried (sections stay byte-identical).
- His fix-not-replace order + engine-keeps-7-trades + R-at-open + manage-nearest + closed-AM retarget + London/NY-only sessions.
- Base tree D74FE972/633552/11502 (his 7-trade EU tree; alert-only stands).

## Clean D1 (consolidated operative path; v1-v9 design history in the annex below)
- Repair = C10667 confirmed selection (fill switch verified) + LTF producer already correct (g_bufBias from currentBias) + consumption guards + probes. B140/144 cleanup-optional, out of base surface.
- LTF producer map: FL_BUF_LTF_BIAS (EA define = 2) = g_bufBias (FlowLogic slot 2), written at FlowLogic 1075 from currentBias; writers init-126 + DecisionBlock-267. HTF votes = HTFEngine strings via fill switch 1195-1200. wasBiasFlip unread outside BiasEngine.

## Edit set (exact anchors; STAGE-1 exact-diffs each; names provisional uj_-prefixed, uniqueness verified at STAGE-1)
- E1 (EA 10667, one token): OLD `PERIOD_H4, PERIOD_H1, PERIOD_M15, false, 60);` NEW `PERIOD_H4, PERIOD_H1, PERIOD_M15, true, 60);` (confirmed selection; EU preservation sibling row grades the global effect).
- E2 (guard above E1 section, insert between EA 8654 print-close and EA 8655 comment; section 8655-8691 untouched): direction-alignment block - read FL_BUF_HTF_LOW at barShift, want = dir LONG ? 1 : -1; misalign (or read-fail) prints UJALIGN_NOMATCH (bar/dir/m15) + return (E1-FAIL shape, confirmation burns per one-bar rule).
- E3 (guard above E2 section, insert between EA 8785 print-close and EA 8786 if; section 8795-8818 untouched): same block, E2-FAIL shape (print + return; candidate stays, confirmation burns).
- E4 (single probe printer, new function + call between EA 11490 LoadWorkingSet and EA 11491 EvaluateClosedBar): SrjUjProbeTuple emits pass bar-time + source TF/shift/open-close/prev-cur/readiness + LTF row with processing index i and target + H4/H1 confirmed + DIV verdict at pass + coverage fields (earliest day + window start). Print-only, one region, one cap.
- E5 (walker): new SrjHistPoolBuild (own CopyBuffer, Bars()-1 depth, day-keyed, strictly-older-than-live-PD, EMPTY/0 skip) + refresh call as first statement of SrjSelEndOfRun (after EA 4993 brace, above the SELHALT gate) + third candidate loop between EA 2402/2403 into TpTargetUpdateBest + census mirror + coverage print between EA 2451/2452 OUTSIDE the s_tpDumps cap + file-scope day-keyed cache arrays.
- E6 (EA 7305, election reference): OLD `double currentPrice = iClose(_Symbol, PERIOD_CURRENT, barShift);` NEW `double currentPrice = iOpen(_Symbol, PERIOD_CURRENT, 0);` + comment (forming-bar open = would-be fill; S5 next-open ref EA 248).
- E7 (1R gate, insert after the SlRefMemo success block EA 7325-7334, before any admission action): direction-aware inequality on winner + stop (no abs-normalization; nonpositive/wrong-side fails); fail prints + GoAbort(ABORT_SUB_1R, g_state) + return; new #define ABORT_SUB_1R after EA 320 beside ABORT_NO_TP_TARGET. Managed recompute EA 11095-11118 untouched.
- E8 (touch event, unconditional print at the EA 11095 managed-recompute head): closed-NY-AM level crossing (price-or-wick, with record close/availability stamps) prints UJTOUCH event; re-election reads the closed-session pool via the existing recompute; swept-mask flip rides free (zero new trigger code) with the same print.
- E9 (fire-edge memo guard, insert immediately before the g_mtrade latch EA 10216): unless tpTarget valid AND slRef valid, print + GoAbort(ABORT_NO_MEMO_AT_FIRE, g_state) + return; new #define beside ABORT_NO_TP_TARGET. Covers same-pass cascade + delayed fire + future routes; poll call-site ordering non-load-bearing.
- E10 (indicator latch debug, print-only near H562-577 RunAll/GetOutputs): per-M15-close print of outBias vs outCBias during probe windows (removable; within ruled verification surface).

## Acceptance (grade-time proofs; S1 exact-diff + S3 recount govern)
- A-IMPL1-ROUTE: predicate-time rows prove guard pass + same-pass promotion at the 09:45:00 pass (guard prints + probe tuple + E1/E2-unchanged diffs) or fail closed.
- A-IMPL2-POOL: rows establish any-age nearest (April-30 in pool) + coverage tuple + 1R admission + UJTOUCH re-election, or fail closed.
- A-IMPL3-REGIME: rows prove votes>=2 on the repaired feed + guard pass at the 14:40:22 pass, or fail closed (structural-flip contingency: probe fail pre-registers halt-to-finding-to-propagation-repair round, no second council cycle burned).
- A-EU-PRESERVE (sibling row, veto-able to him): EU-window trade-set + REGIMECENSUS population diff vs his 7-trade base tree on the edited tree; every diff attributed to the confirmed switch (sole vote-character change) + entry-open reference change; unattributed diff = regression, reported not graded.
- Preconditions: DIV-verdict dependency (adverse DIV at the decision pass = route ungradeable that pass, named not failed); InpDebugLog=true, InpMode=1, M5 pinned.
- L-final: A-IMPL1 + A-IMPL2 + A-IMPL3 + A-EU-PRESERVE + EU preservation carried.

## Run cost and novel evidence
- No run proposed (issue round; build gated on Luna key + word). Cost when gated: ~50 min per full grade window (EU 8/26-9/10 + UJ 6/1-6/13, config-ini unix window per RUN-WINDOW GATE).
- Novel evidence vs all prior rounds: first exact-edit issue round (all prior rounds ruled design/prose scope).

## Annex: v1-v9 design history (one line each; operative path above is the only authority)
- v1-v4: prose scope (route-fail-closed, pool-proof, FVG-yield, label/cite conform). v5: indicator-first + extraction-first + unified passage. v6: engagement options + contracts. v7: fix-not-replace, indicator-only. v8: A1-A16 contracts + open quote. v9: B-premise withdrawn, census banked, slim confirm. IMPL-1: exact edits (this file).

(End of file)
