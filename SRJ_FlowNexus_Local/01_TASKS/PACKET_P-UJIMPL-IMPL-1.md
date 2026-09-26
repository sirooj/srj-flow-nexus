# PACKET_P-UJIMPL-IMPL-1 v2 DRAFT - implementation edits, amended shape (build gated on Luna key + run word; nothing builds/runs/commits on this file)

Status: v2 DRAFT (v1 + V308 objects folded: IE-rename, F251 dependency, E3-label fix, trio votes, print re-anchor, touch records, per-edit attribution, DIV criterion, finding predicate; STAGE-1/S3 disciplines attach; build needs a NEW Luna key + his run word, neither spent nor asked here).

Canonical files: its HTF-engine include (IE10B print-only latch debug) + Experts\SRJ_FlowNexus_EA.mq5 (edits IE1-IE9 below). No new buffers, no new inputs, no second handle, no EA-side mirror.

## Authority (his words + disk + CLEAR, no invention)
- V306 2-0 CLEAR* + V307 2-0 CONFIRM (design CLEAR complete) + V308 IQ1 0-2 OBJECT / IQ2 1-1 SPLIT (amended here, no build). DQ2/DQ3 CLEAR carried. Design E1/E2 blocks CLEAR carried (sections stay byte-identical).
- His fix-not-replace order + engine-keeps-7-trades + R-at-open + manage-nearest + closed-AM retarget + London/NY-only sessions.
- Base tree D74FE972/633552/11502 (his 7-trade EU tree; alert-only stands).

## Clean D1 (consolidated operative path; v1-v9 design history in the annex below)
- Repair = C10667 confirmed selection (fill switch verified) + LTF producer already correct (g_bufBias from currentBias) + consumption guards + probes. B140/144 cleanup-optional, out of base surface.
- LTF producer map: FL_BUF_LTF_BIAS (EA define = 2) = g_bufBias (FlowLogic slot 2), written at FlowLogic 1075 from currentBias; writers init-126 + DecisionBlock-267. HTF votes = HTFEngine strings via fill switch 1195-1200. wasBiasFlip unread outside BiasEngine.

## Edit set (exact anchors; STAGE-1 exact-diffs each; names provisional uj_-prefixed, uniqueness verified at STAGE-1; IE-numbers are implementation edits, distinct from the carried design E1/E2 blocks and fail shapes cited with C-lines)
- IE1 (EA 10667, one token): OLD `PERIOD_H4, PERIOD_H1, PERIOD_M15, false, 60);` NEW `PERIOD_H4, PERIOD_H1, PERIOD_M15, true, 60);` (confirmed selection; EU preservation sibling row grades the global effect).
- IE2 (guard above design-E1 section, insert between EA 8654 print-close and EA 8655 comment; section 8655-8691 untouched): direction-alignment block - read FL_BUF_HTF_LOW at barShift (buffer 21 = M15 BECAUSE F251 fixes slot 3 to PERIOD_M15; F251 preserved by this packet, changing it re-scopes the guard), want = dir LONG ? 1 : -1; misalign (or read-fail) prints UJALIGN_NOMATCH (bar/dir/m15) + return (design-E1-FAIL shape at C8681-8689, confirmation burns per one-bar rule).
- IE3 (guard above design-E2 section, insert between EA 8785 print-close and EA 8786 if; section 8795-8818 untouched): same block, design-E1-FAIL shape at C8681-8689 (print + return; candidate stays, confirmation burns; the C8812-8816 print-only branch is NOT the model).
- IE4 (single probe printer, new function + call between EA 11490 LoadWorkingSet and EA 11491 EvaluateClosedBar): SrjUjProbeTuple emits pass bar-time + the exported HTF trio reads at barShift (FL_BUF_HTF_HIGH/MID/LOW with source-TF labels H4/H1/M15, incl the M15 confirmed vote) + LTF row + coverage fields (earliest day + window start) + H4/H1 confirmed + DIV verdict at pass. Engine-internal fields (processing index, prev-cur, readiness) ride the IE10B print keyed on the same bar-time (rows join at grade). Print-only, one region, one cap.
- IE5 (walker): new SrjHistPoolBuild (own CopyBuffer, Bars()-1 depth, day-keyed, strictly-older-than-live-PD, EMPTY/0 skip) + refresh call as first statement of SrjSelEndOfRun (after EA 4993 brace, above the SELHALT gate; early NOHANDLE/NOTREADY/NORATES passes leave the pool legitimately empty, named not failed) + third candidate loop between EA 2402/2403 into TpTargetUpdateBest + census mirror between EA 2451/2452 + coverage print FROM the refresh site (uncapped by construction, day-keyed cadence) + file-scope day-keyed cache arrays (rebuild on rollover; re-init at run start). Preload dependency named: a 6/1-start UJ run needs M5 history back to April 30; shortfall fails closed as evidence.
- IE6 (EA 7305, election reference): OLD `double currentPrice = iClose(_Symbol, PERIOD_CURRENT, barShift);` NEW `double currentPrice = iOpen(_Symbol, PERIOD_CURRENT, 0);` + comment (forming-bar open = would-be fill; S5 next-open ref EA 248).
- IE7 (1R gate, insert after the SlRefMemo success block EA 7325-7334, before any admission action): direction-aware inequality on winner + stop (LONG: TP > entry AND SL < entry; SHORT mirrored; no abs-normalization; nonpositive/wrong-side fails); fail prints + GoAbort(ABORT_SUB_1R, g_state) + return; new #define ABORT_SUB_1R after EA 320 beside ABORT_NO_TP_TARGET. Managed recompute EA 11095-11118 untouched BY IE7 (IE8's insert point inside MtNearestTpTarget named below).
- IE8 (touch event, print at the top of MtNearestTpTarget after the EA 11081 brace): when the touch event occurs (closed-NY-AM level crossing, price-or-wick, with record close/availability stamps) print UJTOUCH (level + touch type) regardless of InpDebugLog, then a second re-election record (oldTP/newTP/winner/closed-session source); re-election reads the closed-session pool via the existing recompute; swept-mask flip rides free (zero new trigger code) with the same prints.
- IE9 (fire-edge memo guard, insert immediately before the g_mtrade latch EA 10216): unless the CURRENT-pass tpTarget valid AND slRef valid, print + GoAbort(ABORT_NO_MEMO_AT_FIRE, g_state) + return; new #define beside ABORT_NO_TP_TARGET. Covers same-pass cascade + delayed fire + future routes; poll call-site ordering non-load-bearing.
- IE10A (EA-side M15-new-bar gate, inside the IE4 printer): the outBias-vs-outCBias comparison print fires only on M15-new-bar ticks (iTime PERIOD_M15 change), joined by bar-time to the probe tuple.
- IE10B (indicator latch debug, print-only inside SRJ_HTF_GetOutputs H570-577 under g_htfDebugLog): per-call print of outBias vs outCBias (removable; within ruled verification surface).

## Acceptance (grade-time proofs; STAGE-1 exact-diffs the edit, S1 pre-hash gates the tree digest, S3 recounts the surface)
- A-IMPL1-ROUTE: predicate-time rows prove guard pass + same-pass promotion at the 09:45:00 pass (guard prints + probe tuple incl the M15 confirmed vote + design-E1/E2-unchanged diffs) or fail closed.
- A-IMPL2-POOL: rows establish any-age nearest (April-30 in pool) + coverage tuple + 1R admission + UJTOUCH pair (event + re-election record), or fail closed.
- A-IMPL3-REGIME: rows prove votes>=2 on the repaired feed + guard pass at the 14:40:22 pass, or fail closed (structural-flip contingency: probe fail yields finding UJ-FLIPPATH-DEAD from the UJPROBE tuple, pre-registering halt-to-finding-to-propagation-repair with no second council cycle burned).
- A-EU-PRESERVE (sibling row, veto-able to him): EU-window trade-set + REGIMECENSUS population diff vs his 7-trade base tree on the edited tree; diffs attributed to the confirmed switch (sole vote-character change) + entry-open reference change + IE2/IE3 direction guards + IE7 1R gate + IE9 memo guard (all attributed-designed, reported for his veto; E5 pool expansion + E8 management-only effect reported likewise); only truly unattributed diffs = regressions, reported not graded.
- Preconditions: DIV-verdict dependency (latest nonzero walk verdict opposing the candidate direction per C8846 divOk semantics = route ungradeable that pass, named not failed); InpDebugLog=true, InpMode=1, M5 pinned.
- L-final: A-IMPL1 + A-IMPL2 + A-IMPL3 + A-EU-PRESERVE + EU preservation carried.

## Run cost and novel evidence
- No run proposed (amendment round; build gated on Luna key + word). Cost when gated: ~50 min per full grade window (EU 8/26-9/10 + UJ 6/1-6/13, config-ini unix window per RUN-WINDOW GATE).
- Novel evidence vs all prior rounds: amended exact-edit round answering the V308 objects (all other rounds ruled scope or confirmed design).

## Annex: v1-v9 design history (one line each; operative path above is the only authority)
- v1-v4: prose scope (route-fail-closed, pool-proof, FVG-yield, label/cite conform). v5: indicator-first + extraction-first + unified passage. v6: engagement options + contracts. v7: fix-not-replace, indicator-only. v8: A1-A16 contracts + open quote. v9: B-premise withdrawn, census banked, slim confirm. IMPL-1 v1: exact edits E1-E10. IMPL-1 v2: amended shape IE1-IE10 (this file).

(End of file)
