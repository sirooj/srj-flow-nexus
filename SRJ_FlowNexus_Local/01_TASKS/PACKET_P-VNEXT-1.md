# PACKET_P-VNEXT-1 v3 DRAFT - behavior fixes from RECON54 data (V237 amend-fold over v2 D5796339: E1a hoist, E4c re-quote, E2a doubleOB-plus-NaN gate, E2b latest-guard kept, budgets EA plus 14 minus 2 plus 10 modified post 11324, G-wordings; non-counting-variant plus writer-site plus dual-bound plus census-term declined with reasons; council route, dual-key for selection)

Status: v3 DRAFT (amends v2 per V237: 4 AMEND-WITH-DELTA, no halt; Luna key plus Kimi key recorded short-form; Sonnet analysis-only, no seat weight; folds are text-only except the E1a-hoist code delta, E-literals otherwise untouched). Nothing builds, runs, or commits on this file. Clearance via a clearance relay plus token plus his run word, all owed. Canonical files: exactly THREE - Experts\SRJ_FlowNexus_EA.mq5 (six EA edit groups: E1a hoist, E1b widen plus stale touches, E3 precedence, E4a re-key plus print rename plus stale touch, E4b mirror, E4c fire re-key) plus Include\SRJ\SRJ_Panels.mqh (E2a fallback plus doubleOB gate plus flip gate plus NaN guard, display only) plus Include\SRJ\SRJ_ImbalanceMgr.mqh (E2b fallback plus latest-guard, state). No new indicator buffers. Nothing under 02_TASK_CHECKPOINTS. No commit without token.
Successor context: PACKET_P-SEEDFIX-1 v3 (built tree 3BAC352E, RECON54 graded takes 4 with 9/4 10:40 ruled INVALID-taken and 9/8 17:00 missed off 16:55); this packet changes selection, state-fallback, exit precedence, veto key - behavior changes intended and graded per fix below.

## Authority (all on record, no invention)

- His scope word 2026-09-22 (proceed the council relays; covers the four fixes named last turn, undisputed): E1 16:55 election, E2 pane-anchor plus FVG-validity, E3 day-close leg, E4 veto persistence. Council route still required, dual-key for selection changes.
- His CONFIRMATION-BAR ruling 2026-09-22 (verbatim: the confirmation candle and the candle that did the latest POI retest was 16:55, so the entry is the next 17:00 candle open price): bar N retest plus confirm, entry N+1 open with entry price equal to the N+1 candle open. Operative pair per the installed two-candle predicate: retest candle bar N+1, body candle bar N; the 16:55 election row emits at the 16:55 close evaluation. Shapes E1.
- His setup-definition ruling 2026-09-22 (verbatim: a liquidity touch forms no setup, setup executes on confirmation-candle entry; latest CONFIRMED retest governs): confirmed-new displaces unconfirmed-held; held-confirms-true blocks displacement (tie resolves held-protected). Shapes E1 (banked strategy skill).
- His B-fork ruling 2026-09-22 (DAY_CLOSE-minus-5 outranks POI_BODY_BREAK on mean-reversion; Luna direction): shapes E3. 9/4 ruled MEANREVERSAL by his word 2026-09-21 (verbatim: it is also a mean reversal setup).
- His 9/4 10:40 INVALID ruling 2026-09-22 (in-bias FVG invalidated plus OPP FVG validated, no take): shapes E2 plus E4. Rejection machinery confirmed firing (7 S4_ARMED 2-of-3 ABORTs incl FRESHCOUNT #39 killing the 10:30 candidate); hole is the 10:35 clean re-seed plus anchor-keyed veto (FRESH_VETO 0 all run).
- His BLANK-FVG ruling 2026-09-22 (blank means faulty anchor detection, legacy PineScript meaning; pane should read grey or lighter red): shapes E2.
- His Q4 ruling (verbatim: yes, that is only pre confirmation entry; even if after entry the structure flips, i still hold): the 2-of-3 kill stays pre-confirmation only; E4 veto inherits the same scope. Shapes E4.
- V237 verdicts 2026-09-22 (his carry; 4 filed whole 1x each under V237 markers: Luna AMEND plus key short-form-recorded plus Sonnet analysis-only plus GLM AMEND plus Kimi AMEND plus key short-form-recorded; zero halts): A = AMEND-WITH-DELTA - fold opens here (code deltas E1a-hoist, E4c re-quote, E2a doubleOB-plus-NaN gate; declines non-counting-variant plus writer-site plus dual-bound plus census-term carried visibly in the relay, never silent). NOTHING builds/runs/commits on verdicts alone. Dual-key clear still absent (no seat cleared; Sonnet disclaims seat weight; next round required regardless).
- Code gaps proved read-only (result BUILDER_RESULT_RECON54-SEEDFIX-V1.md F53B67D9/203): E1 CONFIRMPOLL runs held-anchor only (EA L7688); E2 boundary re-anchor orphans live FVGs (Panels L213-237, ImbalanceMgr L444-481, BiasEngine L214-224); E3 BREAK outranks DAY unconditionally (EA L11212-11274); E4 veto keyed on anchor line index (EA L9942-9950 clear, L9961-9973 fire, L7240-7253 S4).

## Rule (four hunks, each his rule in code)

- E1 implements confirmed-opposite displaces unconfirmed-held: at S1_REGIME, an opposite booked retest with IsConfirmationCandle true takes the anchor when the held candidate confirms false; held-confirms-true blocks (tie held-protected). Transfer reuses the S2 body; downstream S1 blocks re-see the new anchor same bar by source order (transfer precedes confirm-poll and the S5 gate); the invariant is graded, not built (no transfer flag; G2 grades the TP_ELECT row and a miss is DIAGNOSE per S1). POIREPLACE section is print-only post-removal (PrintFormat plus dead no-op), so held anchor and direction reach the held-confirm test intact with no snapshot code. S2 preempt path otherwise untouched. N1-instrumented predicate runs S1-only where consumed.
- E2 implements never-default-past-live-evidence: when the anchor-gated FVG search finds nothing, search the live structure before defaulting valid (state) or blank (pane). Pane fallback doubleOB-gated to the 2xOB blank evidence (non-2xOB else-branch keeps primary-only, known limitation); state fallback ungated by double-OB (matches the recompute pass siting). Latest means latest startBar (primary-consistent operative definition, not detection time). Latest-wins guard on the state fallback (redundant on first entry by the outer NaN guard, protective on reuse); initial-flip-bar gate on the pane fallback.
- E3 implements the B-fork precedence: body-break suppressed on MEANREV-classified trades so vDAY decides (SL and TP above untouched; decl plus gate comment plus gate make the +3 new; census label untouched by design: geometry log preserved, operative exits graded, geometric BREAK labels expected-and-itemized).
- E4 implements dir-keyed veto: same-direction re-seed on a new anchor is the same setup re-dressed; only direction change or day change clears and only direction gates the fire (E4c); BOUND print renamed DIR at the latch site; S4 site DAY-only with latch site carrying DIR clears (reconciliation note in G2); stamp line deliberately retained as audit trail (anchor retirement parked v-next under State +0); consume-on-fire kept.

## Scope (behavior changes intended; suppression census intended-shift graded in G3)

- Seed, booking order, gate, R floor, regime classifier, confirmation terms, alert kinds, SL/TP legs, HTF leg, session handling otherwise: all UNCHANGED. E2 surfaces deaths the anchor hid, so renewal/flip timing may move on previously-blind bars (intended-shift, graded in G3). New death: none (E1/E3/E4 reroute existing verdicts). No new alert kinds; SIDE1C displace prints via the existing print (state label S1_REGIME; wouldPreempt term lives in SIDE1H_WOULDPREEMPT which stays S2-only, so the SIDE1H row on the displace bar reads wouldPreempt=0, never read as no-preempt); N1 counters move only on S1 opp-retest bars (S1-gated probes; held-line increments twice per such bar via probe plus held poll, itemized vs RECON54 in grading).

## Edit set (exact verbatim; STAGE-1 exact-diff gated; byte-verified anchors)

- E1a displace computation (insert after EA L7532 comment tail, 10-space base indent, +8 new):
  `          //--- [P-VNEXT-1 E1] confirmed-opposite displaces unconfirmed-held (his setup-definition 2026-09-22): opposite booked retest with confirm=1 takes the anchor when the held candidate confirms 0. S1-gated: the N1-instrumented predicate runs only where consumed. Declarations hoisted one level so the widened transfer condition below can read them (block scope).`
  `          bool t78_opConf = false, t78_heldConf = false;`
  `          if(g_state == ST_S1_REGIME && t78_opp)`
  `            {`
  `             string t78_failOp = "", t78_failHeld = "";`
  `             t78_opConf = IsConfirmationCandle(barShift, t78_pr.topLine, t78_dir, t78_failOp);`
  `             t78_heldConf = IsConfirmationCandle(barShift, g_anchorLine, g_dir, t78_failHeld);`
  `            }`
- E1b transfer widen (old verbatim EA L7533, 10-space indent, +0 new, +1 modified) plus stale-comment touches (EA L7523 plus L7527, 10-space indent, +2 modified):
  `          if(g_state == ST_S2_LTF_ALIGN && t78_opp)`
  new verbatim (same indent):
  `          if(t78_opp && (g_state == ST_S2_LTF_ALIGN || (g_state == ST_S1_REGIME && t78_opConf && !t78_heldConf)))`
  old L7523: `          //--- turn). State-bounded: S2-held candidate yields to the observed`
  new L7523: `          //--- turn). State-bounded: S2-held candidate yields to the observed; P-VNEXT-1 admits S1-held on opposite-confirm (unconfirmed held only).`
  old L7527: `          //--- NO LogState - already ST_S2_LTF_ALIGN, stays it, never ST_IDLE;`
  new L7527: `          //--- NO LogState - state unchanged on either path (S2 stays S2, S1 stays S1), never ST_IDLE;`
  (transfer body L7535-7559 reused unchanged; SIDE1C_PREEMPT print labels the S1_REGIME state; census-grade: new writes are t78_* locals only)
- E2a pane fallback (insert between Panels L236 inner-close and L237 if-close, 6-space base indent, +17 new):
  `      //--- [P-VNEXT-1 E2] structure fallback (his blank-FVG ruling 2026-09-22): boundary-gated search empty is not evidence; search the live structure before printing blank.`
  `      if(g_s.isDoubleOB && !fvgExistsForDisplay && !fvgExistsNow && !g_s.isInitialFlipBar && !SrjIsNa(g_s.currentStructureStartBar) && g_imbalances.Total() > 0)`
  `        {`
  `         int n2 = g_imbalances.Total();`
  `         for(int k2=0; k2<n2; k2++)`
  `           {`
  `            CImbalance *fvg2 = GetFVG(g_imbalances,k2);`
  `            if(fvg2==NULL) continue;`
  `            bool m2 = (g_s.currentBias=="bullish" && fvg2.isBullish) || (g_s.currentBias=="bearish" && !fvg2.isBullish);`
  `            if(m2 && fvg2.detectionBar >= g_s.currentStructureStartBar && fvg2.detectionBar >= g_s.strictLimitBar)`
  `              {`
  `               fvgExistsForDisplay = true;`
  `               if(!fvg2.isFilled) fvgExistsNow = true;`
  `               if(fvgExistsNow) break;`
  `              }`
  `           }`
  `        }`
  (display only; no state writes; color function fed, never bypassed)
- E2b state fallback (insert after ImbalanceMgr L477 for-close, 6-space base indent, +16 new):
  `      //--- [P-VNEXT-1 E2] structure fallback (his blank-FVG ruling 2026-09-22): anchor-gated search empty is not evidence; search the live structure before defaulting valid.`
  `      if(SrjIsNa(latestBiasFVGBar) && !SrjIsNa(g_s.currentStructureStartBar) && g_imbalances.Total() > 0)`
  `        {`
  `         int m2 = g_imbalances.Total();`
  `         for(int j2=0; j2<m2; j2++)`
  `           {`
  `            CImbalance *fvg3 = GetFVG(g_imbalances,j2);`
  `            if(fvg3==NULL) continue;`
  `            bool b2 = (g_s.currentBias=="bullish" && fvg3.isBullish) || (g_s.currentBias=="bearish" && !fvg3.isBullish);`
  `            if((b2 && fvg3.startBar >= g_s.currentStructureStartBar && fvg3.startBar >= g_s.strictLimitBar) && (SrjIsNa(latestBiasFVGBar) || fvg3.startBar > latestBiasFVGBar))`
  `              {`
  `               latestBiasFVGBar = fvg3.startBar;`
  `               latestBiasFVGIsFilled = fvg3.isFilled;`
  `              }`
  `           }`
  `        }`
  (existing L478-479 verdict lines apply unchanged to the fallback result)
- E3 precedence (EA decl after L11147, 3-space indent: decl line plus gate comment plus decl comment = +3 new; gate L11212, 6-space indent, +1 modified):
  `   //--- [P-VNEXT-1 E3] B-fork decl (his ruling 2026-09-22): mean-reversion flag for the break gate below.`
  `   bool isMeanRev = (g_mtrade.regimeAtAdmission == REGIME_MEANREV);`
  old verbatim EA L11212:
  `      if(isTrigger && behind && through && !vBREAK)`
  new verbatim (same indent):
  `      //--- [P-VNEXT-1 E3] B-fork gate: DAY_CLOSE-minus-5 outranks body-break on mean-reversion; break suppressed here so vDAY decides (SL/TP above untouched).`
  `      if(isTrigger && behind && through && !vBREAK && !isMeanRev)`
- E4a latch-site re-key (old verbatim EA L9942-9943, 6 and 9-space indent, +1 new, +1 modified) plus print rename (EA L9946, 12-space indent, +1 modified) plus stale-comment touch (EA L9939, 6-space indent, +1 modified):
  `      if(g_freshVetoBar != 0`
  `         && (g_freshVetoDir != (int)g_dir || g_freshVetoAnchor != g_anchorLine))`
  new verbatim:
  `       //--- [P-VNEXT-1 E4] veto is dir-keyed, not anchor-keyed: same-direction re-seed on a new anchor is the same setup re-dressed; only direction change clears here (DAY clear and consume-on-fire kept).`
  `      if(g_freshVetoBar != 0`
  `         && (g_freshVetoDir != (int)g_dir))`
  old L9946: `            PrintFormat("[SRJ-EA] VETOCLEAR bar=%s dir=%s why=BOUND",`
  new L9946: `            PrintFormat("[SRJ-EA] VETOCLEAR bar=%s dir=%s why=DIR",`
  old L9939: `      //--- for this anchor+direction refuses ONE latch (his ruled decline`
  new L9939: `      //--- for this direction refuses ONE latch (his ruled decline`
- E4b S4-site mirror (insert after EA L7239 comment tail, 6-space indent, +1 new; delete EA L7242 decl, 9-space indent, -1; modify EA L7245 condition plus L7250 print term, +2 modified):
  `      //--- [P-VNEXT-1 E4] S4 site mirrors the latch site: DAY-only clear (BOUND removed, same veto-persistence rule; supersedes the L7237 BOUND/DAY note).`
  old L7245: `         if(!sameSetup || vday != cday)` new: `         if(vday != cday)`
  old L7250 term: `DirName(g_dir), (!sameSetup ? "BOUND" : "DAY"));` new: `DirName(g_dir), "DAY"));`
  (unused sameSetup decl removed so the 0-warning gate holds)
- E4c fire re-key (old verbatim EA L9961-9963, 6 and 9-space indent, +1 new, +1 modified, -1 deleted):
  `      if(g_freshVetoBar != 0`
  `         && g_freshVetoDir == (int)g_dir`
  `         && g_freshVetoAnchor == g_anchorLine)`
  new verbatim:
  `       //--- [P-VNEXT-1 E4] fire re-key (same dir-key rule as the clears above): anchor-identity no longer gates the refusal.`
  `      if(g_freshVetoBar != 0`
  `         && g_freshVetoDir == (int)g_dir)`
  (old L9963 line deleted; DAY-clear block and consume body untouched)

## Stages (T161N discipline; RECON54 precedent)

S1 Pre-hash gate: re-hash EA (must equal 3BAC352EA89AB91572EE0C72EF9B94F5449FCC1950FC963C92DC4D63182C5750 / 621077 B / 11312 lines) plus State 80A466AC/18231 plus Sessions E12076C4/27178 plus FlowLogic 956BF3E3/70308 plus Panels 199AD6B1/16074/439 plus ImbalanceMgr F830AE5A/25478/596 plus single-hit plus char-code assert every OLD anchor above; assert SEEDVOID PrintFormat count==1, RETESTBOOK block identity, no new buffers, seven-family plus RETESTDIAG census intact, N1 counters as-of pre-build snapshot recorded. Miss = DIAGNOSE, never assume, never revert. S2 Apply E1a, E1b, E2a, E2b, E3, E4a, E4b, E4c exact-diff (expected post-build EA 11312 + 14 new - 2 deleted = 11324 with 10 modified asserted beside the post-hash; Panels +17 (456); ImbalanceMgr +16 (612); State/Sessions/FlowLogic/Text/BiasEngine +0; convention: comment lines count as new, modified counted once per line, deleted counted, post equals pre plus new minus deleted). S3 Post-hash plus budget arithmetic from literal counts. S4 Compile both targets 0 errors 0 warnings. S5 Run under RECON50_DEMO_USD (same terminal, InpMode 1, 2026-08-26 to 2026-09-10, InpDebugLog=true), ceiling 90 min.

## Acceptance (replay segment A6363625 produced by pre-build tree 3BAC352E; grade segment-vs-segment, S1 gates tree identity)

G1 Build: 0 errors 0 warnings both targets; post-hashes recorded; budgets EA +14 new -2 deleted +10 modified from literals, Panels +17, ImbalanceMgr +16, rest +0; commit text prepared, commit only on token.
G2 Selection deltas (E1 plus E4): SIDE1C displace row fires at least 1 (16:55 SHORT takes held LONG to SHORT); the SIDE1H row on the displace bar reads wouldPreempt=0 (S2-only term, never read as no-preempt); TP_ELECT bar=2026.09.08 16:55 dir=SHORT exists; 17:00 SHORT take exists with entry price equal to the 17:00 candle open; 16:40 block plus no pre-16:55 election preserved; 9/4 10:35 refused (FRESH_VETO fires at least 1; no OrderSend 10:40; VETOCLEAR why=DIR only on genuine dir flips, itemized; no BOUND-labeled rows exist post-rename in the new segment only, RECON54 rows keep historical labels and are never diffed); S4-site clears are DAY-only by design with latch site carrying DIR clears (reconciliation note); other 3 takes identical bars/entries; takes total 4 (swap, not growth: minus 10:40, plus 17:00).
G3 State (E2): FRESHCOUNT adverse at least 1 count rises vs RECON54 baseline with departures itemized bar-for-bar (previously-blind bars now read; fallback-sourced reads itemized separately from primary reads); no new alert kinds; flips plus renewals counted with bar joins; N1 S1-only shift itemized vs RECON54 (held-line increments twice per S1 opp-retest bar via probe plus held poll); pane display side graded council-read only (tester-blind, never implied as tester evidence).
G4 Exits (E3): MTEXIT reason=POI_BODY_BREAK on MEANREV-classified trades == 0 with EXITVERDICT vBREAK reads none on every MEANREV bar (vDAY has no EXITVERDICT field; DAY_CLOSE established via MTEXIT reason); geometric EXITCENSUS BREAK labels on MEANREV trades expected-and-itemized, never failures; DAY_CLOSE fires on every MEANREV trade with fillBarTime <= mark <= barTime at the first evaluated bar at/after the 16:55 mark (count equals eligible; zero eligible grades absence-conformance with eligibility rows cited); 9/4 NY classification plus outcome from admission diagnostics plus refusal rows (no MTEXIT expected for the refused take; MEANREV-DAY_CLOSE expectation is counterfactual, recorded not graded).
L-final Graded set authoritative: G1/G2/G3/G4 above; the ask G1-G4 covers E1-E4 as stated.

## Run cost and novel evidence

One build (EA six edit groups plus two include hunks, STAGE-1 exact-diff gated) plus one tester run, ceiling 90 minutes, explicit values authoritative (same settings as RECON54). Novel evidence vs RECON54: (a) first 17:00 take under the current tree (E1 displacement live); (b) first FRESH_VETO fire plus DIR-only clears (E4 persistence live); (c) first non-blank 2xOB reads plus shifted FRESHCOUNT compositions (E2 fallback live); (d) first DAY_CLOSE exit on a MEANREV hold, or the 9/4 classification rows that name the classifier thread (E3 precedence live). Exit figures are target figures, never realized fills. This run restores exactly one valid take (17:00) and refuses exactly one invalid take (10:40) - rule-fidelity, never profit.

(End of file - total 136 lines)