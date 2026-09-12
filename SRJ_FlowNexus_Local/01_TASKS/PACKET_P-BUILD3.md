# PACKET_P-BUILD3.md — BUILD 3: the LINE SUPERSESSION (council C1; recovers the 9/4 Yearly-POC retest)
Packet: c:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\SRJ_FlowNexus_Local\01_TASKS\PACKET_P-BUILD3.md
Date: 2026-09-11. ONE canonical file: Experts\SRJ_FlowNexus_EA.mq5. CQD/OrderblockMgr/FlowLogic/the fourteen includes UNTOUCHED. Nothing under 02_TASK_CHECKPOINTS. No git token.
Basis: COUNCIL_RESPONSE_POI-R.md C1 (council design, sequencing step 3) + the builder verification addendum + the operator's supersession ruling (RECON1-BATCH Q2) + Part A Specification v4.2 §3.4 L120 + §6 L283-295.
STATUS: EXECUTED AND VERIFIED 2026-09-11 (run RECON3-BUILD3 PASSED; see
06_HANDOFFS\BUILDER_RESULT_RECON3-BUILD3.md). S1 pre-hash 693B3729 PASS; S2 E1-E5
applied; S3 post-hash 7BB1E9B6...C3CB3C; S4 T162_BUILD3 0/0; S5 RECON3-BUILD3
PASSED 3168 bars; S6 gates G1-G5 pass (G2 changes 206->208 declared; G3 ruled set
+ 9/4 Yearly deliverable); S7 result + tabulation written.

## 0. THE RULED RULES (what this packet implements; strategy, not invented here)
- OPERATOR SUPERSESSION RULING (RECON1-BATCH Q2, verbatim): "Do not simplify this. i know there is a valid M POC, but i only journaled or input it as Y POC or AVP because there is a valid Y POC superseed the M POC. ... FIX THE SRJ POI MARKER or how the EA sees them. find the root problem and not banaid solution."
- SPEC §3.4 L120 (of record): "A same-direction higher-tier POI touch mid-sequence upgrades the anchor tier silently." THIS IS THE BUILD-3 RULE. The anchor tier upgrades within the SAME candidate; no new candidate, no direction change, no window change.
- SPEC §6 RECONCILIATION (L283-295): arrival order governs ACROSS TIME (the first candidate to complete executes; a later higher-tier candidate does NOT displace it — the Task-91/EA-105 ruling stays removed); anchor tier governs the upgrade WITHIN one alive candidate (§3.4) and a same-bar tie only. This packet does NOT restore POIREPLACE (opposite-direction across-time replacement stays removed and its census stays counterfactual).
- COUNCIL C1 (as amended by the operator answers): one ElectAnchor() at seed AND per-bar pre-fire; RetestBook polls all 12 lines every bar; suppression becomes don't-promote for the superseding line; strictly-better same-direction in-window supersession; ladder keeps line-agnostic progress (regime, LTF), recomputes anchor-relative legs (zone, SL_REF, TP, confirmation). The AVP-class TP selector is RULED OFF (build 4 CLOSED): TP stays the closest-line selector as built.
- TIER (not raw rank): strictly-better means strictly-better FAMILY TIER (rank/2: FOMC=0 Yearly=1 Quarterly=2 Monthly=3 Weekly=4 Daily=5). Matches spec §3.4 "higher-tier" + §3.7 "VWAP and POC on one anchor are the same tier". Prevents intra-tier POC-over-VWAP thrash (no ruling behind it). The 9/4 case is tier 3->1 so both readings fire; tier is the narrower, spec-anchored choice. Threshold-free (rank compare only; spec §0).
- PRE-FIRE SCOPE: S1_REGIME, S2_LTF_ALIGN, S3_ZONE_WAIT, S4_ARMED. No re-bind at/after S5_GATE_CHECK (guard 4), never in IDLE (seed owns it), never after fire.

## 1. PHASE-1 MAPPING (read-only; anchors on 693B3729...946E = 252,632 B, CRLF=5025, 5,025 lines)
- Rank table: InitAuthorityTable L80-94 (FOMC-POC=0/VWAP=1 Yearly-POC=2/VWAP=3 Quarterly-POC=4/VWAP=5 Monthly-POC=6/VWAP=7 Weekly-POC=8/VWAP=9 Daily-POC=10/VWAP=11). g_authorityRank/g_lineCode L77-78.
- Detector: PoiRetestResult L1609-1610; DetectPoiRetest L1612-1654 (reads o/h/l/c L1615-1618; next-open cNext L1625-1626 fail-soft; bodyHi/Lo L1627-1628; P/EPS L1629-1630; line snapshot ReadBuf1 g_hPoi L1632-1636; LONG test L1643 l<=L-P+EPS && bodyLo>=L-EPS; SHORT test L1645 h>=L+P-EPS && bodyHi<=L+EPS; per-dir best-rank L1637-1647; cross-dir tie L1649 bestLongRank<=bestShortRank favours LONG).
- Shadow book: ShadowRetestBook L1662-1695 (replicates the identical per-line inequalities L1683-1684; print RETESTBOOK L1691-1694). ShadowConfirmPoll L1703-1730. IsConfirmationCandle L1748-1777 (terms A/A2/B/C).
- Seed (IDLE): L3577-3607 (SessionAlreadyUsed L3580; DetectPoiRetest L3597; anchor assign L3598 g_anchorLine=pr.topLine; dir L3599; barTime L3600; price ReadBuf1 L3601; session L3602; divLatch=false L3603; S1 L3605). Already argmin(rank) by construction.
- Hold: t78 POIREPLACE census L3475-3498 (opp+tier test L3481-3483; GoAbort REMOVED L3495, print-only counterfactual); t73 SUPPRESSED census L3500-3556 (re-detect L3532; opp L3536; higher RAW-RANK test L3537-3538; print SUPPRESSED L3542-3550 with heldPoi/heldDir/heldState + cum counts).
- Ladder: S1 L3609-3620 (ClassifyRegime); S2 L3622-3632 (CheckLtfAlign); S2POLL advisory L3287-3355 (ComputeNearestTpTarget L3292; ComputeSlReference L3300); divLatch L3357-3361; S3 L3634-4207 (S3ARM ComputeSlReference L4077; arming L4137-4165; pre-bind IsConfirmation L4184-4205); S4 L4209-4334 (confirm edge L4321-4333); S5 L4336-4479 (unbounded div walk L4351-4366; R latch L4426-4430; TP_RR_FAIL L4450-4470).
- Guards: FRESHSKIP PRE_BINDING L3269-3274 (S2-S4); freshness pre-confirmation-only L3276-3285; LTF invariant S3-S5 L3089-3188; SESSION_CLOSED L3072-3087; inWindow/sess from CurrentTradingWindow L1470-1492 (London 02-05 / NYAM 07-12 ET); SessionAlreadyUsed/MarkSessionUsed L1494-1509; session-consumed only on SIGNAL path (MarkSessionUsed at signal).
- State: ResetSequence L2363-2386 (anchor L2369-2371; zone L2376-2377; touch L2373-2375; latch L2380-2384; confirmFrom L2385); working set L1096-1349 fields=21 (anchor 4/5/6; zone 11/12; touch 8/9/10; latch 15-19; confirmFrom 20); OnTick Load/Eval/Store L5017-5019; EvaluateClosedBar L2708 (sess/inWindow L2710-2711).
- THE 9/4 INSTANCE (RECON2-SLREF2_JOURNAL.log, verbatim): seed 15:35 Monthly-POC LONG (IDLE->S1->S2; S2WAIT LTF-unaligned); 15:40 S2->S3->S4_ARMED (zone 1.15907-1.15933); SUPPRESSED 15:45/15:50/15:55 Yearly-POC LONG opp=0 higher=1 heldState=S4_ARMED (cum_hi 18/19/20); RETESTBOOK 15:45-bar hits=3 incl Yearly-POC:r2:dL; held to 17:00 ABORT FRESH_OB_DEAD (FRESHCOUNT #159 adverse=2). The operator's journal: Sept 4 New York morning LONG from Yearly POC (their "Y AVP"), CVD 3, taken (+0.84, record cite only).
## 2. THE EDIT SET (EA only; probe RAW lines first)
- E1 (after InitAuthorityTable L80-94): ADD read-only helpers AnchorTier(line)=rank/2 + ElectAnchor(barShift,dir) replicating the L1643/L1645 per-line tests for ALL 12 lines, best-TIER in dir wins (ties: raw rank, then line order), -1 if none. PURE. Comment cites spec 3.4 L120 + spec 6 + Q2 ruling + C1.
- E2 (IDLE seed L3596-3606): NO logic change (detector already argmin(rank); tier-best==rank-best at seed). ADD one InpDebugLog print after S1 transition: ANCHOR_ELECT bar action=SEED poi rank tier dir. Additive only.
- E3 (new block BEFORE t73 L3500, AFTER t78 L3475-3498): LIVE poll, pre-fire only (S1/S2/S3/S4), inWindow, anchor>=0, dir set. ElectAnchor(barShift,g_dir)=cand; need cand>=0 + Tier(cand)<Tier(held) + sess==g_sessionAtEntry. On pass: anchor=cand, price+barTime re-snap, zone=0, touch clear, regime UNTOUCHED, state=S3 when from S3/S4 else UNCHANGED, latch fields defensive-clear, divLatch UNTOUCHED. Print ANCHOR_SUPERSEDE bar from rank tier to rank tier dir state.
- E4 (t73 L3532-3550): logic UNCHANGED; E3-before-t73 ordering; append tail field action=SUPERSEDED/HELD.
- E5 (working set): NO new field. WS161 stays fields=21.


## 3. WHAT EXPLICITLY DOES NOT CHANGE
- DetectPoiRetest body UNTOUCHED. S2POLL/S3ARM/S5 SL/TP UNTOUCHED (they read g_anchorLine live). t78 POIREPLACE counterfactual UNTOUCHED (print-only; across-time arrival order governs). Opp=1 never re-binds. Builds 2/2.5 + session consumption at signal UNTOUCHED.

## 4. GATES (run RECON3-BUILD3: RECON1_P1.ini unchanged; 8/26->9/10, 3168 bars; harness v2.3 detached; completion signal is the operator's)
- G1 Test passed, 3168 bars, RESULT=PASSED.
- G2 WS161 fields=21 loads=stores=3168 mismatch=0, LOAD NOSTORE x1, zero FIELD rows (changes WILL move, declared).
- G3 THE RULED SET: 8/28 10:05 SHORT Daily-VWAP R=2.43 SL 1.16508 TP 1.16364 verbatim (a-priori zero ANCHOR_SUPERSEDE on its lifetime); 9/7 pair verbatim (09:20 R=1.76; 16:45 R=1.25); four fakes silent; 9/4: ANCHOR_SUPERSEDE from Monthly-POC rank6 tier3 to Yearly-POC rank2 tier1 dir LONG on the 15:45 bar (a-priori EXACT); the Yearly candidate outcome (signal or named abort) is the deliverable for adjudication, NOT pre-declared; SUPPRESSED opp=0 higher=1 FALLS (18 in SLREF2 to fewer); SUPPRESSED opp=1 UNCHANGED.
- G4 post-run digests byte-identical. G5 FlowLogic identities verbatim (BIASCENSUS 1554/1614 x2; ZONECENSUS 3168/1056; PROMO 469; CQD stream). EA counts declared movable. Gate-failure protocol (invariant 8): BLOCKED + gate + value, nothing further, revert nothing.

## 5. STAGES S1-S7 (per the standing discipline)
- S1: pre-hash gate = SHA256 of Experts/SRJ_FlowNexus_EA.mq5 must equal 693B37290717871D152C46E73AEB15B719D57964738E0162D623BFC0BC4D946E (252632 B, 5025 lines, CRLF=5025, LONELF=0). A miss is DIAGNOSED, never assumed, never reverted.
- S2: apply E1-E5 (probe raw lines before every exact-match edit; the recorded leading-space discipline; probe files carry no trailing pipes).
- S3: post-hash + byte/line accounting (expect a small +delta; record verbatim; LONELF=0).
- S4: compile via C:/Program Files/Dukascopy MetaTrader 5/metaeditor64.exe; the LOG LINE Result: 0 errors, 0 warnings is the instrument (exit code 1 is a known quirk); compile log T162_BUILD3_COMPILE.log (gitignored).
- S5: headless run RECON3-BUILD3 via 00_CURRENT_WORKING/run_tester_v2.ps1, RECON1_P1.ini unchanged, window 8/26->9/10 from config/terminal.ini [Tester] (verify the [Tester] pair only; [TickLoad] is not the range); launch DETACHED then STOP; no polling (strict) unless the operator is away (then the countdown-timer rule); the completion signal is the operator's; manual completion protocol if the wrapper died.
- S6: gates G1-G5 from the archived journal segment. S7: BUILDER_RESULT_RECON3-BUILD3.md + tabulation in 06_HANDOFFS; packet marked EXECUTED AND VERIFIED; standing state + prompt updated. No git token; nothing under 02_TASK_CHECKPOINTS.

## 6. RISKS DECLARED (the honest list)
- First behavior-changing build since P-SLREFSIDE: the 18 same-direction higher-tier suppressions are the blast radius. G3 protects only the ruled set; anything else moving is a finding for adjudication.
- The Sept 4 Yearly candidate outcome is NOT pre-declared: signal or named-gate death both valid; only the missing ANCHOR_SUPERSEDE line fails the gate.
- Touch/zone reset on re-bind can consume a confirmation under one-bar validity; later bars can present fresh confirmation while alive and in-window.
- S1/S2-origin re-binds are pure anchor swaps: zero ladder effect.
