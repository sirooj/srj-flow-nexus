# PACKET_P-UJIMPL-IMPL-2 v8 DRAFT - V320 fold: B2 geometry fixed post-skip + UJ-EXTRA venue bound + pool-walk status + touch wording + EU rows-fence fix (build gated on new key + run word; nothing builds/runs/commits on this file)

Status: v8 DRAFT (v7 + V320 2-1/1-2 HALT folded (Luna CONFIRM x2; Astra CONFIRM x2 with wording notes; GLM OBJECT x2 on the B2 geometry pair + knock-ons): B2 insert relocated post-skip (geometry (a), both seats converging), UJ-EXTRA venue bound + finding, pool-walk status stated, P023 scoped to the admission pass, touch wording (P157/P175/P181/micro), rows-fence 09:05 corrected; S2WAIT-field addition declined (UJPROBE mitigates) + skipAnchor param parked future; design untouched (four fixes + closers, budget +53, external-interface surface unchanged); base = built tree 14C7476C/660687/11975; STAGE-1/S3 disciplines attach; build needs a NEW key + his run word, neither spent nor asked here).

Canonical files: Experts\SRJ_FlowNexus_EA.mq5 ONLY (fixes A-E below; HTF include + FlowLogic untouched). No new buffers, no new inputs, no new handles, no EA-side mirror.

## Authority (his words + disk + CLEAR, no invention)
- RECON71 rows (result BUILDER_RESULT_RECON71-V8-UJ.md, ledger 878): 6/3 UJMISMATCH (memo sl 159.905 via SlRefMemo vs fire sl 159.889 via ComputeSlReference, TP agreed 159.983); 6/5 S2WAIT-LTF retained 09:25-09:45 then R-killed 09:50 + NO_TP_TARGET at S2 16:10; 6/11 TPCENSUS #76 (bar 14:35, ref 160.524 = his entry, winner YLOH 160.587, R 1.75 PASS, promoted) + #77 (bar 14:40, winner Daily-VWAP 160.522, R 0.11 FAIL, abort from S4).
- His Rulings-J (finding USDJPY-MISSES): entry POC+VWAP confluence never targets own POI source; POC-over-VWAP hierarchy in booking; entry-bar triple (14:35 confirm, 14:40 open 160.524; 160.520 is the 14:45 open, post-entry).
- His 4-valid word (2026-09-27): four valid June trades (6/3 London LONG + 6/5 09:45 SHORT + 6/5 16:15 LONG + 6/11 14:40 LONG); the initial build got the 6/3 right, now none executes. Miss-to-fix map: 6/3 Fix A, 6/5 09:45 Fix C, 6/5 16:15 Fix D, 6/11 Fix B.
- Cited-build diff (RECON63 A82F15E7 vs RECON71, same 09:05 bar, diffed before diagnosis): SIGNAL identical both trees (R 1.35, SL 159.889, TP 159.983 YASH); old MTSNAP sl 159.889 TOOK (TP win); v8 guard killed on memo sl 159.905 (SlRefMemo: ext1 never applied behind dormant InpAdoptExt1) vs fire sl 159.889 (ext1Take applied); SLEXT43 agree=1 (memoExt1 = freshExt1 = 159.889); ladder rungs r0 159.905 R2.25 / r1 159.889 R1.35. Regression class: v8's own cross-check vs pre-existing ext1Take asymmetry. Fix A restores parity (latch fire locals = 159.889).
- 16:05 five-line rows (TPCENSUS #27: winner NONE, admitted PDH:65 NYH:253 PMH:23 YNYH:19 YPMH:23; SWEPTMASK: PDH swept, NYH live, PMH swept, YNYH/YPMH swept) -> NO_TP_TARGET at S2 16:10.
- 6/5am M15 series (machine-checked UJPROBE votes: m15=-1.0 SHORT-aligned at eval 09:05/09:10/09:15, +1.0 opposed at 09:20/09:25, -1.0 aligned at 09:30/09:35, +1.0 opposed at 09:40/09:45; ltf=+1.0 opposed throughout; CONFIRMPOLL confirm=1 first at eval-09:40) -> Fix C path (first S2 evaluation at the 09:10 pass promotes on the 09:05-signal vote, confirm 09:40, fire 09:45). Buffer definition on disk: FL SetIndexBuffer(21, g_bufHtfLo) at FL-705; vote encoding Bull 1.0 / Bear -1.0 / else 0.0 at FL-1200; M15 slot fixed at F251.
- His NEAREST-ONLY-TP pin (strategy skill 2026-09-25): pool never empty, book nearest, refuse ONLY below 1R (6/5 16:05 instance) -> Fix D executes it. Scope: empty-election-only (a present masked winner means the fallback never runs).
- Design CLEAR lineage carried (IMPL-1 v8 2-0 CONFIRM; E1/E2 + IE1-IE10B untouched by this packet except the narrow E2 census-naming exception at B3, stated above; v8 built tree is the base).
- S2 census (RECON71 journal, machine-counted same turn + full S2WAIT enumeration, 54 rows): the SHORT/Daily-POC/LONDON candidate printed S2WAIT at 09:05/09:20/09:25/09:30/09:35/09:40/09:45 only (no 09:00/09:10/09:15: not in S2 those passes; S2WAIT prints every LTF-opposed S2 pass and ltf is opposed at every 6/5am probe); first S2 evaluation at the 09:10 pass (eval 09:05, m15=-1.0 == SHORT want) fires Fix C immediately, so promotion lands 09:05-signal (v6 09:30 pin WITHDRAWN, owned second mispin: pre-09:25 bars never checked); R19-R22 fence the pre-trigger series; R06/R14/R18 are post-promotion telemetry in the fixed run; CONFIRMPOLL series confirm=0 from eval-09:05 through eval-09:35, first-1 at eval-09:40 (fire preserved 09:45). UJPROBE prints unconditionally every new bar (EA 11963).
- Touch setters (two, both disk-read): leg path EA 8900-8904 (no print in v8; touch located at s52_shift) + opposite-dir path EA 8924-8925 (E print; the test reads the evaluated barShift OHLC, so the physical touch IS barShift); after E2 both print evalBar+touchBar+dir+anchor, correlation key dir+anchor+touchBar with evalBar inside the candidate S3 window.
- Call signatures on record: SrjUjAssert1R defined EA-11768, UjDbl defined EA-11750; barShift in scope at the touch book (used EA 8909). Compile fail-closed stands.
- Settled-rules audit for Fix C (strategy skill SETTLED-RULES pin): the S2 promotion edge feeds S3 unchanged - S5.4 pre-confirmation body-break, S3.3 flip-kill, zone/confirmation guards all run downstream of the edge untouched (S3 block, S4 edge, S5 election); the edge changes WHEN S3 is entered on M15-aligned passes, never what S3 checks. The M5 path is byte-unchanged (refine-only).
- Base tree 14C7476C/660687/11975 (v8 built; alert-only stands).

## Edit set (exact anchors; STAGE-1 exact-diffs each; convention: NET per site = NEW-block lines minus OLD-block lines; S3 recount governs)
- FIX A (SL-doctrine truce; 6/3 cited diff): the guard enforces memo-liveness + candidate identity; value-equality retired (disk proves two live SL doctrines: ladder-today memo 159.905 vs ext-1-applied fire 159.889; equality unmeetable when ext1Take fires). Latch consumes fire locals (parity with the cited take: sl 159.889); S5 election + SL stay; memo stays evidence + liveness for the S1-cascade fallback. Order documented: A4 runs before the liveness check, so sub-1R-with-stale-memo aborts SUB_1R first by construction. Memo doctrine (answers Luna 3 structurally): the memo is evidence + liveness keyed by anchor/dir, never proof of the admitted tuple; A9 binds admission provenance fire-side. Ordering proof (all disk-read): OnTick memo-clear EA-11962, probe EA-11963, entry pipeline EA-11964 (election->memo->fire->admit inline), managed loop EA-11969 post-admission; census uses locals (no UpdateBest call in the census region; base-tree sites 2488/2495/2503/11349/11356/11367 plus the D1 fallback site post-edit as seventh); no UpdateBest runs between the fire election and the A9b snapshot in the admission pass (Compute/D1 precede it inline; Mt sites run post-admission in EvaluateManagedTrade per the OnTick order and cannot interleave).
```mql5-old-A3
         if(uj_memo_anchor != g_anchorLine || uj_memo_dir != (int)g_dir || uj_memo_tp != tpTarget || uj_memo_sl != slRef)
           { if(InpDebugLog) PrintFormat("[SRJ-EA] UJMISMATCH bar=%s memo_tp=%s memo_sl=%s fire_tp=%s fire_sl=%s memo_src=%s", uj_bk9, DoubleToString(uj_memo_tp, _Digits), DoubleToString(uj_memo_sl, _Digits), DoubleToString(tpTarget, _Digits), DoubleToString(slRef, _Digits), uj_memo_src); GoAbort(ABORT_MEMO_MISMATCH, g_state); return; }
```mql5-new-A3
         if(uj_memo_anchor != g_anchorLine || uj_memo_dir != (int)g_dir)
           { if(InpDebugLog) PrintFormat("[SRJ-EA] UJMEMO_FAIL bar=%s reason=IDENTITY src=%s", uj_bk9, uj_memo_src); GoAbort(ABORT_MEMO_IDENTITY, g_state); return; }
```
```mql5-new-A8
#define ABORT_MEMO_IDENTITY  "MEMO_IDENTITY"
```
A8 sits beside the other ABORT defines (C394-C397 region): separates the identity abort from the liveness abort (reason field already distinguished them; codes now do too).
```mql5-new-A4
         double uj_frisk = 0.0, uj_freward = 0.0;
         if(!SrjUjAssert1R(currentPrice, slRef, tpTarget, uj_bk9, "FIRE", uj_frisk, uj_freward, uj_fireR))
           { GoAbort(ABORT_SUB_1R, g_state); return; }
```
A4 sits immediately after the uj_bk9 definition line, before the NO_MEMO check (same block scope): 1R enforced on the exact fire-local tuple, so a passing memo R never certifies a failing latched R (fire-time tp divergence backstopped by A4 economics + A9 provenance; memo R stays evidence). Order documented: A4 runs before the liveness check, so sub-1R-with-stale-memo aborts SUB_1R first by construction.
```mql5-new-A6
      double uj_fireR = -1.0;
```
A6 sits immediately before the guard-block opening brace (function scope, visible at the latch): carries the fire-local R to the admission tuple.
```mql5-old-A7
         PrintFormat("[SRJ-EA] UJADMIT bar_key=%s trade_seq=%I64d admit_bar=%s entry=%s sl=%s tp=%s R=%.2f poolGen=%d wsrc=%s wday=%s wage=%d", uj_abk, g_mtrade.uj_tradeSeq, TimeToString(barTime, TIME_DATE|TIME_MINUTES), DoubleToString(currentPrice, _Digits), DoubleToString(slRef, _Digits), DoubleToString(tpTarget, _Digits), uj_memo_R, uj_memo_wgen, uj_memo_wsrc, uj_memo_wday, uj_memo_wage);
```mql5-new-A7
          PrintFormat("[SRJ-EA] UJADMIT bar_key=%s trade_seq=%I64d admit_bar=%s entry=%s sl=%s tp=%s R=%.2f poolGen=%d wsrc=%s wday=%s wage=%d", uj_abk, g_mtrade.uj_tradeSeq, TimeToString(barTime, TIME_DATE|TIME_MINUTES), DoubleToString(currentPrice, _Digits), DoubleToString(slRef, _Digits), DoubleToString(tpTarget, _Digits), uj_fireR, uj_fireWgen, uj_fireWsrc, uj_fireWday, uj_fireWage);
```
A7 swaps the UJADMIT R field to the fire-local R and the provenance fields to the fire-side snapshot (single UJADMIT line; MTSNAP carries no R field): invariant UJADMIT == fire tuple (entry/sl/tp already fire locals; R + provenance now too). UJMEMO_PASS keeps memo R + memo provenance as evidence only.
```mql5-new-A9a
      string uj_fireWsrc = "";
      string uj_fireWday = "";
      int    uj_fireWgen = -1;
      int    uj_fireWage = -1;
```
A9a sits beside A6 (same function scope, visible at the latch): fire-side provenance carriers.
```mql5-new-A9b
         uj_fireWsrc = uj_winnerSource; uj_fireWday = uj_winnerDayKey;
         uj_fireWgen = uj_winnerPoolGen; uj_fireWage = UjDayDiff(barTime, uj_winnerDayKey);
```
A9b sits immediately after uj_admitCount++ (EA 10426), before the UJADMIT block brace (EA 10427): snapshots the live election provenance at admission; by the OnTick ordering proof above this is the fire election's winner in both the Compute path and the D-fallback path (a fallback winner IS the fire winner). Answers Astra #1 structurally: no memo/fire split can publish, and SL equality stays retired.
```mql5-old-A5
      //--- [P-UJIMPL-IMPL-1 v8 IE9] fire-edge memo guard (candidate identity +
      //--- value equality; cross-check tuple on pass).
```mql5-new-A5
      //--- [P-UJIMPL-IMPL-2 v4 Fix A] fire-edge memo guard (liveness + identity;
      //--- admitted tuple validated by the FIRE 1R gate below, evidenced by MTSNAP).
```
Plus: retire the ABORT_MEMO_MISMATCH define (one line at EA 396; STAGE-1 greps its uses, sole use at the retired guard line, and compile proves the retirement). UJMEMO_PASS print unchanged (memo tuple + memo provenance stay evidence-only). The 1R assertions at both memo-write points stay (single-sourced arithmetic stands).
- FIX B (POI own-source exclusion + hierarchy; 6/11 rows + his ruling): helper after the TpTargetUpdateBest closing brace (head ~2379, close C2402).
```mql5-new-B0
bool UjPoiTargetValid(int k, int anchor)
  {
   if(k == anchor) return false;
   string ak = ((anchor >= 0 && anchor < POI_NLINES) ? g_lineCode[anchor] : "");
   string ck = g_lineCode[k];
   int ap = StringFind(ak, "-"), cp = StringFind(ck, "-");
   if(ap < 0 || cp < 0) return true;
   if(StringSubstr(ak, 0, ap) != StringSubstr(ck, 0, cp)) return true;
   if(StringSubstr(ak, ap + 1) == "POC" && StringSubstr(ck, cp + 1) == "VWAP") return false;
   return true;
  }
```
Call-site inserts (each: gated skip print + unconditional continue; the helper is an ADDITIONAL gate, the existing rank filter stays untouched at every site).
```mql5-new-B1
   if(!UjPoiTargetValid(kf, g_anchorLine))
     { if(InpDebugLog) PrintFormat("[SRJ-EA] UJPOISKIP bar=%s line=%s anchor=%s", TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES), g_lineCode[kf], (g_anchorLine >= 0 ? g_lineCode[g_anchorLine] : "none")); continue; }
```mql5-new-B2
   if(!UjPoiTargetValid(k, g_mtrade.anchorLine))
     { if(InpDebugLog) PrintFormat("[SRJ-EA] UJPOISKIP bar=%s line=%s anchor=%s", TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES), g_lineCode[k], (g_mtrade.anchorLine >= 0 ? g_lineCode[g_mtrade.anchorLine] : "none")); continue; }
```mql5-new-B3
   if(!UjPoiTargetValid(k2, g_anchorLine))
     { if(InpDebugLog) PrintFormat("[SRJ-EA] UJPOISKIP bar=%s line=%s anchor=%s", TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES), g_lineCode[k2], (g_anchorLine >= 0 ? g_lineCode[g_anchorLine] : "none")); continue; }
```
B1 sits first in the Compute POI loop (EA 2498-region); B2 sits in the Mt POI loop (EA 11361-region) AFTER the C11363-C11364 anchor/rank skip and BEFORE `double v` (C11365), testing the managed anchor (global anchor diverges from the managed anchor during management); B3 first in the census POI loop (EA 2559-region, print-only coherence: explicitly OVERRIDES the E2 anchor-naming path there, the anchor no longer appears with "*" nor "(ANCHOR)"). Placement is load-bearing: the C11363-C11364 skip removes anchors (and higher-rank lines) before B2 runs, so B2's anchor arm is dead by construction and no UJPOISKIP-anchor rows occur on managing passes; same-family VWAP lines reach B2 and print normally as helper-execution proof (positive-only). The arm text is retained for helper uniformity across B1/B2/B3 (B1/B3 have no pre-existing skip). Reorder/removal declined with cause (relocates deadness + noise; breaks B1/B3).
```mql5-old-B3b
            admitted += g_lineCode[k2] +
                        ((k2 == g_anchorLine) ? "*" : "") + ":" +
                        DoubleToString(MathAbs(pv - currentPrice) / _Point, 0) + " ";
            if(haveBest && pv == best)
               winner = g_lineCode[k2] + ((k2 == g_anchorLine) ? "(ANCHOR)" : "");
```mql5-new-B3b
            admitted += g_lineCode[k2] + ":" +
                        DoubleToString(MathAbs(pv - currentPrice) / _Point, 0) + " ";
            if(haveBest && pv == best)
               winner = g_lineCode[k2];
```mql5-old-B3c
   //--- [P-TP-FAMILYPASS E2 2026-09-17, print-only] census second loop ADMITS
   //--- the anchor (rank filter unchanged) so an anchor win is nameable;
   //--- behavior unchanged, gates read winner reliably.
```mql5-new-B3c
    //--- [P-TP-FAMILYPASS E2 2026-09-17, print-only, OVERRIDDEN by IMPL-2 Fix B:
    //--- the helper skips the anchor + same-family VWAP first, so anchor wins
    //--- are unnamed by construction; gates read winner reliably.]
```
Anchor exclusion (k == anchor) is deliberate: without it Daily-POC at 3pts in-direction wins the nearest race at R~0.14 and the 6/11 venue dies again. Exclusion is one-directional (anchor-POC blocks same-family VWAP; a VWAP-anchored entry may still book family POC) per his hierarchy reading. String version stands (readability; enum pairing already evidenced at the call sites; arithmetic alternative declined with cause). Rank-parity alternative recorded for a future audit: string matching fails OPEN on a lineCode rename (a renamed Daily-POC silently passes as a valid target); rank parity (same family via g_authorityRank/2, anchor rank even + candidate rank odd) ties to the enum ordering. No change this round.
- FIX C (S2/M15 promotion edge; 6/5 rows): restructure the !aligned block (EA 8195-8196) so M15-confirmed alignment promotes instead of retaining.
```mql5-old-C
      if(!aligned)
        { if(InpDebugLog) PrintFormat("[SRJ-EA] S2WAIT bar=%s dir=%s poi=%s sess=%s - LTF bias unaligned, candidate RETAINED (Stage 3a)", TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES), DirName(g_dir), AnchorStr(), SessionName(g_sessionAtEntry)); return; }
```mql5-new-C
      if(!aligned)
        {
         double uj_m15b = 0.0;
         bool uj_m15r = ReadFlow(FL_BUF_HTF_LOW, uj_m15b, barShift);
         double uj_wantb = (g_dir == DIR_LONG ? 1.0 : -1.0);
         if(uj_m15r && uj_m15b == uj_wantb)
           { double uj_ltfb = 0.0; int uj_ltfOk = ReadFlow(FL_BUF_LTF_BIAS, uj_ltfb, barShift) ? 1 : 0;
             int uj_m15s = (int)iTime(_Symbol, PERIOD_CURRENT, barShift);
             datetime uj_m15src = (datetime)(uj_m15s - uj_m15s % 900);
             if(InpDebugLog) PrintFormat("[SRJ-EA] S2PROMOTE_M15 bar=%s dir=%s poi=%s sess=%s m15=%s m15src=%s ltf=%s rf=%d/%d", TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES), DirName(g_dir), AnchorStr(), SessionName(g_sessionAtEntry), DoubleToString(uj_m15b, 1), TimeToString(uj_m15src, TIME_DATE|TIME_MINUTES), UjDbl(uj_ltfb), (uj_m15r ? 1 : 0), uj_ltfOk); }
         else
           { if(InpDebugLog) PrintFormat("[SRJ-EA] S2WAIT bar=%s dir=%s poi=%s sess=%s - LTF bias unaligned, candidate RETAINED (Stage 3a)", TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES), DirName(g_dir), AnchorStr(), SessionName(g_sessionAtEntry)); return; }
        }
```
- FIX D (NEAREST-ONLY-TP fallback; 6/5 16:05 rows + his pin): when the masked walk finds nothing, re-walk the session lines mask-off and book the nearest in-direction line (zone + in-direction still apply via UpdateBest); the 1R gate (not emptiness) decides. Sits after the Compute POI loop close, before the TASK-23 census comment (so the census names the fallback winner). Truly-empty still falls to NO_TP_TARGET.
```mql5-new-D1
if(!haveBest)
  {
   string uj_fbpool = "";
   for(int i = 0; i < ArraySize(sessbufs); i++)
     {
      double dv = 0.0;
      if(!ReadFlow(sessbufs[i], dv, barShift)) continue;
      bool uj_inD = (dir == DIR_LONG) ? (dv > currentPrice) : (dv < currentPrice);
      if(uj_inD) uj_fbpool += sname[i] + ":" + DoubleToString(MathAbs(dv - currentPrice) / _Point, 0) + " ";
      TpTargetUpdateBest(dv, dir, currentPrice, best, haveBest, sname[i], uj_dk, -1);
     }
   if(haveBest && InpDebugLog)
     { PrintFormat("[SRJ-EA] UJFBPOOL bar=%s dir=%s pool=%s", TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES), DirName(dir), uj_fbpool);
       PrintFormat("[SRJ-EA] TPFALLBACK bar=%s dir=%s tp=%s distPts=%s src=%s", TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES), DirName(dir), DoubleToString(best, _Digits), DoubleToString(MathAbs(best - currentPrice) / _Point, 0), uj_winnerSource); }
  }
```
Walk order session, then pool, then POI (existing); uj_fbpool is the pre-zone in-direction candidate list (NOT the post-zone eligible pool; post-zone eligibility is evidenced by the TPFALLBACK tp/src pair); zone enforced inside UpdateBest, same call; the 1R gate (not emptiness) decides downstream. Pool walk (EA 2492-2496) is consumable-gated, never mask-filtered: a consumable pool line already contests the masked election, so the mask-off fallback re-walks session lines only; no pool fallback exists nor is one needed.
Managed-side retarget deliberately untouched (admission-scoped per his pin; future round if rows demand).
- FIX E (touch-transition prints; 6/11 touch gap): print-only evidence for the touch prerequisite (no behavior change). Two setters print the identical row shape: the opposite-dir setter (E) and the leg-touch setter at EA 8900-8904 (E2). barShift is in scope at both (used EA 8909/8933); g_anchorLine is global. The anchor field joins the candidate key for grade-time correlation: direction + anchor + physical touchBar, with evalBar inside the admitted candidate's evidenced S3-active window (P181 rule).
```mql5-old-E
         if(oppositeDir && (!s35_fromFvg || touchesZone))
           { g_touchSeen = true; g_touchBarHi = h; g_touchBarLo = l; }
```mql5-new-E
         if(oppositeDir && (!s35_fromFvg || touchesZone))
           { if(InpDebugLog) PrintFormat("[SRJ-EA] UJTOUCHSEEN evalBar=%s touchBar=%s dir=%s anchor=%s", TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES), TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES), DirName(g_dir), (g_anchorLine >= 0 ? g_lineCode[g_anchorLine] : "none")); g_touchSeen = true; g_touchBarHi = h; g_touchBarLo = l; }
```
```mql5-old-E2
      if(s52_found && !g_touchSeen)
        {
         g_touchSeen  = true;
```mql5-new-E2
      if(s52_found && !g_touchSeen)
        {
         if(InpDebugLog) PrintFormat("[SRJ-EA] UJTOUCHSEEN evalBar=%s touchBar=%s dir=%s anchor=%s", TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES), TimeToString(iTime(_Symbol, PERIOD_CURRENT, s52_shift), TIME_DATE|TIME_MINUTES), DirName(g_dir), (g_anchorLine >= 0 ? g_lineCode[g_anchorLine] : "none"));
         g_touchSeen  = true;
```
E2 inserts the transition print at the leg-touch setter (EA 8900-8902 byte-exact above; block remainder shared, outside the fence): every touch set now prints evalBar (firing pass) + touchBar (physical candle: s52_shift here, barShift at the E setter where the test reads the evaluated OHLC), so row-presence == setter-fired and touchBar == physical touch as accepted by the setter rule (the E branch without touchesZone when s35_fromFvg is false accepts without independently proving geometric zone intersection); the v5 progression alternative is WITHDRAWN as redundant. E print intentionally passes the same iTime(barShift) for evalBar and touchBar (at this setter the physical touch IS the evaluated bar per the paragraph above); do not 'fix' the duplication. E sits in the touch book (EA 8920-region): the touch-vs-retest rule question itself goes to council visibly (quoted gap + rows, ruled by name), never decided here.
Fall-through to the shared S3 promote (byte-unchanged). m15src is the containing-M15 open derived from the evaluated barShift (containing-M15 time mapping, not confirmed indicator-source timing; source-time mapping needs indicator work, future round). Budget (script-counted from the fenced blocks above, same turn): A3 -1 (retired define; guard 2-vs-2) + A4 +3 (fire-local 1R gate) + A5 0 (comment swap) + A6 +1 (fire-R carrier) + A7 0 (UJADMIT R + provenance swap) + A8 +1 (MEMO_IDENTITY define) + A9 +6 (fire-provenance carriers + snapshot) + B0 +11 + B1/B2/B3 +2 each (+6) + B3b -1 (suffix removal) + B3c 0 (comment swap) + C +11 (2-vs-13, containing-m15 time-mapping field) + D1 +15 (pre-zone census list) + E 0 (print-only schema) + E2 +1 (leg-setter print). Total NET +53 (touchBar fields +0, B3b/E2-print indent normalization +0). S3 recount governs at build. v8: zero fence-byte changes vs v7 (B2 relocation is siting-prose-only; all counts re-verified identical).

## Acceptance (grade-time proofs on a future UJ 6/1-6/13 run with InpDebugLog=true pinned under the same replay configuration as RECON63/71 (tick model, spread, pass timing) (all cited rows gated); discipline sentence: STAGE-1 exact-diffs the edit, S1 pre-hash gates the tree digest, S3 recounts the surface, and a fail-closed outcome is a failed proof unless its finding predicate fires. Per-venue record required: candidate/admission identity, direction, signal bar, fill bar, actual entry/SL/TP, target source (fire wsrc), actual-tuple 1R verdict, admission count; mechanism rows ride as supporting evidence. Values pre-declared below must match; fields marked grade-read are read at grade, never pre-filled.)
- A-SL1: 6/3 09:05 bar takes with entry 159.929, SL 159.889, TP 159.983 (signalBarTime=09:05, fillBarTime=09:10: R01 ALERT at the 09:10 pass + R02 MTSNAP bar=09:05; parity tuple: MTSNAP sl=159.889 booking parity with R02; memo sl=159.905 labeled evidence only); UJMEMO_PASS memo tuple + UJ1R R=1.35 PASS on the fire tuple (co-resident poll-tuple UJ1R R=2.25 on sl 159.905 expected beside it; grade reads src=FIRE) + MT managing open; MEMO_MISMATCH path absent from the tree (S1 pre-hash proves retirement, never a run row).
- A-S2P: S2PROMOTE_M15 first at 09:05-signal for the SHORT/Daily-POC/LONDON candidate (first S2 evaluation: no S2WAIT bar<=09:00 for this key on 6/5, and S2WAIT prints every LTF-opposed S2 pass; m15 series machine-checked: aligned -1.0 at eval 09:05/09:10/09:15, opposed +1.0 at 09:20/09:25, aligned at 09:30/09:35, opposed at 09:40/09:45; R19/R20/R21/R22 + R14/R18/R06 fence the series; R06/R14/R18 are post-promotion telemetry in the fixed run, UJPROBE prints unconditionally every bar); exactly-once overall for this key (any second promotion fails with UJ-NOPROMO broadened); CONFIRMPOLL confirm=1 at 09:40 (R07; journal series all-0 through eval-09:35, first-1 at eval-09:40); SHORT admission signalBarTime=09:40, fillBarTime=09:45; the v6 09:30 pin is WITHDRAWN (owned second mispin: pre-09:25 bars never checked); S3 window opens at the 09:10 pass - any S3 kill fails the venue with UJ-NOADMIT, never regraded.
- A-POIV: ONE LONG admission with signalBarTime=14:35, fillBarTime=14:40, entry 160.524, TP YLOH 160.587, actual-tuple 1R PASS, SL grade-read; source proven by admission-tuple fire wsrc = YLOH (memo wsrc evidence-only in UJMEMO_PASS; census corroborating only, equal-price matches labeled as such); touch prerequisite: ONE UJTOUCHSEEN row with dir=LONG + anchor match, touchBar <= 14:35, evalBar <= 14:35 signal bar and inside the admitted candidate's S3-active window (window evidenced by the candidate's S-chain rows same dir+anchor: promotion/confirm/LEGTOUCH; an earlier candidate's touch cannot satisfy a later admission); row-presence == setter-fired (evalBar = firing pass, touchBar = physical candle); UJPOISKIP Daily-POC/VWAP rows as helper-execution proof (positive-only: zero rows on an election pass is not a failure; B2-anchor rows never occur per the corrected P096 siting); entry-scheduling unchanged in this packet (no timing fix); a qualifying touch established by the deadline is necessary (R17 touchSeen=0 is base behavior; R13 entry=160.520 is the base 14:40-signal fire attempt), and admission additionally requires the unchanged downstream gates (confirm, zone, election, memo, 1R) to pass; any other fill bar = failed proof with finding UJ-TIMEBASE, never regraded.
- A-FB: ONE 6/5 16:15 LONG admission record required (signalBarTime=16:10, fillBarTime=16:15 by the C10409-C10410 latch + evaluated-bar convention; the 16:05-bar-evaluated-at-16:10 context (R09/R10 base-empty) is the fallback election witness, NOT the admission fields - the v5 signal-bar-16:05 label is WITHDRAWN as a mislabeled bar; elected fallback source, entry, SL, TP, actual-tuple 1R, all grade-read; UJFBPOOL + TPFALLBACK supporting (co-resident UJ1R rows expected on fallback-memo passes, FIRELOCAL + FIRE; grade reads src=FIRE); zone enforced inside UpdateBest, same call); sub-1R-or-empty = FAILED proof with finding UJ-FBDEAD (fires IFF the fallback election at the admission pass evaluates 16:10 and elects nothing (-> NO_TP_TARGET path, no TPFALLBACK row) OR elects sub-1R (-> SUB_1R abort row); linkage = pass time 16:15 + LONG + anchor chain; a chain never reaching election evaluation fails instead with UJ-NOPROMO); a correctly logged rejection never counts as the take. One RESOLUTION per venue (his pin refuses sub-1R; refusal resolves without a take). Reachability mirrors A-POIV: the pin needs the S-chain to survive to the 16:15 pass; any earlier kill fails closed with its own finding.
- A-EU-PRESERVE carried: baseline D74FE972 RECON60 rows; EU population pinned as the EURUSD 6/1-6/13 sibling run (RECON65-V7-EU lineage) under the same tester configuration; zero unmatched take identities in both directions; entry-bar fields (date, signal bar, direction, anchor, entry) compared per take; REGIMECENSUS populations equal by (session, regime) grouping keys with counts; TPCENSUS + raw-log text + cumulative counters excluded as volatile; pending future evidence (graded when its run exists, never bundled into this round's L-final).
- L-final: A-SL1 + A-S2P + A-POIV + A-FB (each exactly one matching admission per named venue, keyed to identity + signal/fill bars; repeated diagnostics counted separately, never as admissions). EU comparison graded separately when its run lands. Failed proof names its finding. Multiple findings may attach to one failed venue; one RESOLUTION per venue stands. A UJ-NOTOUCH outcome keeps the venue failed and routes the touch-vs-retest mechanism question to the next round visibly (council, quoted + rowed, ruled by name) - a mechanism question, never a fix defect. Exactly four UJ admissions in 6/1-6/13 (his four-valid word); any admission outside the four venues fails with UJ-EXTRA.
- Findings map (every failed predicate names one; several may attach): wrong parity tuple UJ-PARITY; missing admission UJ-NOADMIT; duplicate admissions UJ-DUPADMIT (admissions only, promotions/diagnostics counted separately); required promotion predicate failed (missing, duplicate, or wrong-bar promotion/confirmation) UJ-NOPROMO; source mismatch (incl. empty fire wsrc) UJ-SRCMISM; wrong signal bar UJ-SIGNALBAR; wrong fill UJ-TIMEBASE; wrong direction/candidate identity UJ-IDENTITY; every admitted tuple failing grade 1R recompute, any leg incl. fallback UJ-SUB1R; touch unproven (row absent by the signal pass) UJ-NOTOUCH; unsuccessful fallback-election event (elects nothing or sub-1R, no admission) UJ-FBDEAD; required evidence row/field absent (named) UJ-NOEVID; admission outside the four venues UJ-EXTRA; EU differences UJ-EUDIFF. A missing row fails the proof; it never asserts the event did not occur.

## Run cost and novel evidence
- No run proposed (draft round; build gated on a NEW key + his run word, neither spent nor asked here). Cost when gated: ~45m UJ 6/1-6/13 (+ EU sibling future).
- Novel evidence vs RECON71: parity take rows (6/3 sl 159.889), M15-promotion rows, POI-skip rows, fallback-booking rows answering all four diagnosed deaths.

## Annex: design history (one line each; operative path above is the only authority)
- IMPL-1 v8 (D3A66F97): DIV + provenance closure, built 14C7476C, RECON71 0-take diagnosed (SL divergence / S2-held / VWAP wrong-kill). IMPL-2 v1-v3: RECON71 fixes. IMPL-2 v4: V316 amend (A4 fire-1R gate, A5 comment, B full texts + gating + managed anchor + direction/boundary sentences, C enriched print, D/legs/EU restated, R14 boundary row). IMPL-2 v5: V317 split amend (B3b suffix removal + E2 comment swap, C containing-m15 source field, D pre-zone census list, ABORT_MEMO_IDENTITY separation, E touch-transition print, findings map, EU comparator, per-venue record contract). IMPL-2 v6: V318 fold (A9 fire provenance + snapshot, E2 leg-setter print + anchor key, S2PROMOTE 09:30 + A-FB 16:10/16:15 corrections with two owned withdrawals, findings-v2, byte-exact B3b/B3c/E fences, R18, signature/scope cites, reachability notes). IMPL-2 v7: V319 fold (touchBar schema on both touch prints, first-S2-eval 09:05 promotion pin with owned second withdrawal, S3-window correlation rule, findings-v3 with NOPROMO/SUB1R/NOEVID, EU population pinned, B2 prose corrected, census restated post-edit, new-block indents normalized, R19-R22). IMPL-2 v8: V320 fold (B2 post-skip geometry, UJ-EXTRA venue bound, pool-walk status, scoped census claim, touch wording, rows-fence 09:05 fix).

(End of file)
