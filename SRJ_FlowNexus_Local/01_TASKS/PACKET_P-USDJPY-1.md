# PACKET_P-USDJPY-1 v1 DRAFT - three refinements from his three USDJPY misses (nothing builds/runs/commits on this file)

Status: v1 DRAFT (council shaping owed; E1/E2/E4 code changes below, E3 retarget PARKED with reason in Scope; alternatives-considered in Run-cost). Relay + battery owed before any transport.

Canonical files: exactly ONE - Experts\SRJ_FlowNexus_EA.mq5 (E1/E2/E4 additive-or-narrow, old retained where superseded; S3 recount governs). No new indicator buffers. No new inputs. Nothing under 02_TASK_CHECKPOINTS. Commits are builder-called (AGENTS 6.5); no council commit token exists or is asked.

## Authority (his words + disk, no invention)

- His 2026-09-25 USDJPY rules (verbatim cores, skill-banked same turn): CONFIRM-ONCE (9:35 retest + 9:40 confirm + 9:45 open entry; later bars never re-litigate) + PRIOR-CLOSE-IRRELEVANT (14:30 close never judges; retest-open side + next-close-hold judges; break-then-reclaim is the setup) + POC-SUPREMACY (POC over VWAP; POC cross/break never invalidates or exits, own or same-hierarchy line; 8/4 EU Y-POC hold precedent outside tested spans, his words govern) + NEAREST-ONLY-TP (never an empty pool; book nearest, refuse only below 1R) + FLOATING (trade still open; retarget is his standing rule, not new).
- His REFINE-ONLY order (verbatim core): retest/confirmation/target logic ONLY; EURUSD 8/26-9/9 (RECON62 full-window zero-delta) is the regression anchor every future build re-proves.
- Disk defects (RECON63 SEG63 F50A9BFE, quoted): miss-1 (6/5 09:45 SHORT: CONFIRMPOLL confirm=1 on the 09:40 bar, FRESHSKIP PRE_BINDING in S2 at 09:40/09:45/09:50, RETESTBOOK 0, STAND-DOWN LTF_MISALIGN 11:00, never signaled) + miss-2 (6/5 16:10 LONG: TPCENSUS #86 winner=NONE with PDH:66 NYH:254 PMH:24 YNYH:20 YPMH:24 in-direction, ABORT NO_TP_TARGET at S2, never re-seeded) + miss-3 (6/11 14:45 LONG: RETESTBOOK hits=2 + touch present, CONFIRM_STRUCT_FAIL A2_CLOSE_BREAK on the 14:30 close, FRESHCOUNT HOLD x3, TP Daily-VWAP 3pts present, never fired; later re-seeds NO_TP_TARGET).
- CQD/XOB excluded on disk (verdicts aligned or flipping with clean rechecks; zero XOB-attributed kills; obDead=0 at all S4 checks) - neither rides this packet.
- Supersession: the S4-edge comment (EA 8795-8798, A2 as ruled retracement term) amended for POC anchors only; P-CONFIRM-ANYSTATE scope (EA 8666: S2 outside) extended by E4; book-once discipline amended by his standing retarget rule (E3 parked, see Scope).

## Rule (three refinements, one build)

- E1 POC-scoped confirmation (his PRIOR-CLOSE-IRRELEVANT + POC-SUPREMACY): the prior-close-side term (A2_CLOSE_BREAK, EA 2224-2225) applies to non-POC anchors ONLY; a POC-anchored setup never fails on the prior close. A_OPP/B_BODY/C_TOUCH unchanged, all anchors. Single function - flows to the S3-prebind edge (EA 8668) and the S4 edge (EA 8805) with no call-site edits.
- E2 never-empty pool (his NEAREST-ONLY-TP): the S2 poll (EA 7307) keeps all validity filters (direction, in-zone, swept/live mask, tier-rank - refine-only); when the first pass finds nothing, a fallback books the nearest in-direction line with filters off, and the S5 1R gate below (EA 10041: >= 1.0 fires, < 1.0 refuses TP_RR_FAIL) stays the SOLE refusal. Staleness default (his distance-only implication): age never disqualifies; analytic ask A carries the alternative.
- E4 confirm from S2 (his CONFIRM-ONCE + 2026-09-11 take-the-confirmation ruling): the S3 prebind path (EA 8655-8680, one-bar rule, fall-through to S5) extends to S2 candidates with identical predicate and identical fall-through. The LTF-align requirement is NOT removed (a still-unaligned seed stays; the 6/5 venue advances only where aligned) - the aggressive corner (confirm firing while LTF-unaligned) is named in Run-cost for council. Freshness posture unchanged (pre-binding poll skipped per the 2026-09-11 declaration, same as S3).
- Untouched: SL/TP/BREAK/HTF legs, priority order, HTF experiment, CANCEL_BIAS, MTCOLLISION path, buffers, inputs, session marks, booking race (first-pass), votes, R floor 1.0, live alerts-only, day-close leg, exit management (E3 parked).

## Scope (refine-only fence + parked E3)

- REQUIRED: 6/5 09:45 SHORT reaches S5 with resolution (take or 1R-refuse, both rule-conformant; A1 gates S5 arrival + R latch, never take-only); 6/5 16:15 LONG books fallback-nearest with R resolution (A2); 6/11 14:40 LONG reaches S5 with R resolution (A3; predicted R-refuse on the 3pt-vs-22pt face - a refuse PROVES the confirm fix); 6/3 LONG identical bar/entry/fill (A4); EURUSD full-window take-level join vs RECON62 (7 takes identical bars/entries/exits, rejects silent; lots recorded-not-graded; A5).
- PARKED E3 retarget (management adopts newly-closed session extremes): NO proving instance on record (June has 1 take closed in 50 minutes; no float-through-close exists) - a run cannot name novel evidence for it (WHY-NOT-LAST-TIME). Revives with an instance, never on assumption.
- Stated-unmeasurable: none (all acceptance rows print).

## Edit set (exact verbatim old/new; STAGE-1 exact-diff gated)

- E1 confirm A2 POC-scope (old EA 2222-2225: 4 lines; new: 6 lines; NET +2):
  old:
`    bool oppCandle = (dir == DIR_LONG)  ? (c1 < o1) : (c1 > o1);`
`    if(!oppCandle)  { failTerm = "A_OPP"; if(n1_vw) g_n1_vwapInv++; if(n1_poc) g_n1_pocInv++; return false; }`
`    bool closeSideOk = (dir == DIR_LONG) ? (c1 >= L) : (c1 <= L);`
`    if(!closeSideOk) { failTerm = "A2_CLOSE_BREAK"; if(n1_vw) g_n1_vwapInv++; if(n1_poc) g_n1_pocInv++; return false; }`
  new (insert anchor-rank line + POC guard, indentation matched):
`    bool oppCandle = (dir == DIR_LONG)  ? (c1 < o1) : (c1 > o1);`
`    if(!oppCandle)  { failTerm = "A_OPP"; if(n1_vw) g_n1_vwapInv++; if(n1_poc) g_n1_pocInv++; return false; }`
`    //--- [P-USDJPY-1 E1] his prior-close-irrelevant rule 2026-09-25 (6/11 14:30 close never judges) + POC-supremacy: the close-side term binds non-POC anchors only; a POC-anchored setup never fails on the prior close.`
`    bool anchorIsPoc = (anchorLine >= 0 && anchorLine < POI_NLINES && StringFind(g_lineCode[anchorLine], "POC") >= 0);`
`    bool closeSideOk = (dir == DIR_LONG) ? (c1 >= L) : (c1 <= L);`
`    if(!closeSideOk && !anchorIsPoc) { failTerm = "A2_CLOSE_BREAK"; if(n1_vw) g_n1_vwapInv++; if(n1_poc) g_n1_pocInv++; return false; }`
- E2 S2 fallback-book (old EA 7306-7313: 8 lines; new branch: 16 lines; NET +8; plus new function ComputeFallbackTpTarget: 21 lines insert after ComputeNearestTpTarget EA 2481):
  old:
`      double tpTarget;`
`      if(!ComputeNearestTpTarget(barShift, g_dir, currentPrice, tpTarget))`
`        {`
`         if(InpDebugLog)`
`            PrintFormat("[SRJ-EA] %s S2POLL_NO_TP_TARGET",`
`                        TimeToString(TimeCurrent(), TIME_DATE|TIME_SECONDS));`
`         GoAbort(ABORT_NO_TP_TARGET, g_state); return;`
`        }`
  new (fallback before the abort, same print discipline):
`      double tpTarget;`
`      if(!ComputeNearestTpTarget(barShift, g_dir, currentPrice, tpTarget))`
`        {`
`         //--- [P-USDJPY-1 E2] his nearest-only rule 2026-09-25 (6/5 16:05 pool): the pool is never empty - fall back to the nearest in-direction line, filters off; the S5 1R gate below stays the sole refusal.`
`         if(!ComputeFallbackTpTarget(barShift, g_dir, currentPrice, tpTarget))`
`           {`
`            if(InpDebugLog)`
`               PrintFormat("[SRJ-EA] %s S2POLL_NO_TP_TARGET",`
`                           TimeToString(TimeCurrent(), TIME_DATE|TIME_SECONDS));`
`            GoAbort(ABORT_NO_TP_TARGET, g_state); return;`
`           }`
`         if(InpDebugLog)`
`            PrintFormat("[SRJ-EA] TPFALLBACK bar=%s dir=%s tp=%s",`
`                        TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES),`
`                        DirName(g_dir), DoubleToString(tpTarget, _Digits));`
`        }`
  new function (insert after EA 2481, direction-only nearest walk, no filters, no prints):
`//--- [P-USDJPY-1 E2] fallback walker: nearest in-direction line, validity filters off (swept/live/zone/tier stay on the first pass only). The S5 1R gate refuses; this function never does.`
`bool ComputeFallbackTpTarget(int barShift, ENUM_SRJ_DIR dir,`
`                             double currentPrice, double &tpTargetOut)`
`   {`
`    double best = 0.0;`
`    bool   haveBest = false;`
`    for(int i = 0; i < 18; i++)`
`      {`
`       double v = 0.0;`
`       if(!ReadFlow(g_fallbackBufs[i], v, barShift)) continue;`
`       if(v == EMPTY_VALUE || v <= 0.0) continue;`
`       bool inDir = (dir == DIR_LONG) ? (v > currentPrice) : (v < currentPrice);`
`       if(!inDir) continue;`
`       double dist = MathAbs(v - currentPrice);`
`       if(!haveBest || dist < MathAbs(best - currentPrice))`
`         { best = v; haveBest = true; }`
`      }`
`    if(!haveBest) return false;`
`    tpTargetOut = best;`
`    return true;`
`   }`
  NOTE (open, council-shaped): g_fallbackBufs shares the 18 session/PD buffer ids of ComputeNearestTpTarget (EA 2356-2364); the draft reuses the literal list via a shared static (council rules the exact share-vs-copy form; S1 asserts the 18 ids).
- E4 S2 prebind-confirm (old EA 8067-8077: 11 lines; new: 26 lines; NET +15):
  old:
`   if(g_state == ST_S2_LTF_ALIGN)`
`     {`
`      bool aligned;`
`      if(!CheckLtfAlign(barShift, g_dir, aligned))`
`        { GoAbort(ABORT_UPSTREAM_UNREADY, g_state); return; }`
`      if(!aligned)`
`        { if(InpDebugLog) PrintFormat("[SRJ-EA] S2WAIT bar=%s dir=%s poi=%s sess=%s - LTF bias unaligned, candidate RETAINED (Stage 3a)", TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES), DirName(g_dir), AnchorStr(), SessionName(g_sessionAtEntry)); return; }`
`      ENUM_SRJ_STATE prev = g_state;`
`      g_state = ST_S3_ZONE_WAIT;`
`      LogState(prev, g_state);`
`     }`
  new (confirm evaluated while unaligned; PASS jumps to S5 with the same fall-through as the S3 prebind path; FAIL retains):
`    if(g_state == ST_S2_LTF_ALIGN)`
`      {`
`       bool aligned;`
`      if(!CheckLtfAlign(barShift, g_dir, aligned))`
`        { GoAbort(ABORT_UPSTREAM_UNREADY, g_state); return; }`
`      if(!aligned)`
`        {`
`         //--- [P-USDJPY-1 E4] his confirm-once rule 2026-09-25 (6/5 09:40 confirm fires the 09:45 entry) + 2026-09-11 take-the-confirmation ruling extended to S2: identical predicate, identical S5 fall-through; FAIL retains at S2.`
`          string cfTermS2 = "";`
`          if(IsConfirmationCandle(barShift, g_anchorLine, g_dir, cfTermS2))`
`            {`
`             ENUM_SRJ_STATE prevS2 = g_state;`
`             g_confirmFromState = prevS2;`
`             g_state = ST_S5_GATE_CHECK;`
`             LogState(prevS2, g_state);`
`             if(InpDebugLog)`
`                PrintFormat("[SRJ-EA] CONFIRM_PREBIND_S2 bar=%s dir=%s poi=%s",`
`                            TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES),`
`                            DirName(g_dir), AnchorStr());`
`            }`
`          else`
`            { if(InpDebugLog) PrintFormat("[SRJ-EA] S2WAIT bar=%s dir=%s poi=%s sess=%s - LTF bias unaligned, candidate RETAINED (Stage 3a)", TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES), DirName(g_dir), AnchorStr(), SessionName(g_sessionAtEntry)); return; }`
`         }`
`       ENUM_SRJ_STATE prev = g_state;`
`       if(g_state == ST_S2_LTF_ALIGN) { g_state = ST_S3_ZONE_WAIT; LogState(prev, g_state); }`
`      }`
  NOTE (open, council-shaped): the tail promotion is guarded so the S5 jump above is never overwritten back to S3 in the same pass.

## Stages (T161N discipline; RECON62 precedent)

- S1 pre-hash gate: re-hash EA (must equal A82F15E7/633938/11506 or DIAGNOSED successor, never assumed) plus one hit per anchor (A2 block + S2 poll + ComputeNearestTpTarget tail + S2 align block + 18 buffer ids) plus buffers 48/48 + names collision-free plus char-code assert every OLD anchor AND every insert byte. M5 PINNED: graded runs fixed M5.
- S3 budget (mechanical from the pasted blocks, NET per site = new-site-total minus old-site-total): E1 +2 (6-4) + E2-branch +8 (16-8) + E2-helper +21 (insert) + E4 +15 (26-11) = +46; post 11506+46 = 11552 (S3 recount governs).

## Acceptance (grade segment-vs-baselines; behavior-first)

- A1 (6/5 09:45 SHORT): S5 arrival with resolution (SIGNAL 09:45 entry next-open OR TP_RR_FAIL latch with R<1 - both rule-conformant; a walk-away halts with cause). Reading stated openly: SHORT (his 9:35/9:40/9:45 description matches the SHORT trail; correctable).
- A2 (6/5 16:15 LONG): fallback books nearest (TPFALLBACK row) with R resolution (take or refuse); a NO_TP_TARGET abort halts with cause.
- A3 (6/11 14:40 LONG): S5 arrival with R resolution (predicted refuse on the 3pt-vs-22pt face - a refuse PROVES the confirm fix, never fails it).
- A4 (6/3 intact): LONG 09:10 entry 159.932 + TP 159.983 identical bar/entry/fill.
- A5 (EURUSD regression): full-window take-level join vs RECON62 (7 takes identical bars/entries/exits, rejects silent; lots recorded-not-graded; the 4 EU NO_TP_TARGET venues take-or-refuse with per-venue rows - new EU takes are checked against his journal rows, tester-only takes halt).
- L-final: A1/A2/A3/A4/A5 above.

## Run cost and novel evidence

- One build (E1 +3, E2 +fallback/+branch, E4 +branch, STAGE-1 gated) plus two tester runs, ceiling 90 each: USDJPY June 1-13 (~45 min) + EURUSD full 8/26-9/10 (~50 min). In-period alternative is live trading paying spread on three pairs - his stated plan; uncosted multi-hour plans stay out of order.
- E1 KEPT narrow (POC-scope, not full A2 removal) per refine-only + VWAP behavior preserved. E4 aggressive corner named (confirm while LTF-unaligned) with the keep alternative (S3-only scope keeps the 6/5 miss). E2 fallback ignores swept/live/zone/tier by his nearest-only word (filters stay on first pass). E3 parked for want of a proving instance.
- Novel evidence vs RECON63/RECON62: (a) first S5 arrival on each miss venue with named resolution; (b) fallback-book rows; (c) EU take-level join proving refine-only.

(End of file)
