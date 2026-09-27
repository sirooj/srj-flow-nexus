# PACKET_P-UJIMPL-IMPL-2 v6 DRAFT - V318 fold: A9 fire-provenance binding + E2 leg-setter touch print + corrected 09:30 promotion / 16:10 fallback-signal pins + findings-v2 + byte-exact old fences (build gated on new key + run word; nothing builds/runs/commits on this file)

Status: v6 DRAFT (v5 + V318 2-1 HALT folded (Astra #1 provenance binding + #2-#6 contract precision + #7 labels; GLM A1-A11; Luna wording 1-3; builder self-audit: S2PROMOTE pin 09:35->09:30 and A-FB signal-bar 16:05->16:10, both withdrawn below): A9 fire-side provenance carriers + snapshot + UJADMIT fire-wsrc swap, E2 second-setter touch print + anchor key on both touch prints, corrected A-S2P/A-FB legs, findings-v2 map, B3b/B3c/E old fences byte-exact, R18 spliced, call-signature/scope cites, reachability notes; design untouched (four fixes + two print/provenance closers, budget +53, external-interface surface unchanged); base = built tree 14C7476C/660687/11975; STAGE-1/S3 disciplines attach; build needs a NEW key + his run word, neither spent nor asked here).

Canonical files: Experts\SRJ_FlowNexus_EA.mq5 ONLY (fixes A-E below; HTF include + FlowLogic untouched). No new buffers, no new inputs, no new handles, no EA-side mirror.

## Authority (his words + disk + CLEAR, no invention)
- RECON71 rows (result BUILDER_RESULT_RECON71-V8-UJ.md, ledger 878): 6/3 UJMISMATCH (memo sl 159.905 via SlRefMemo vs fire sl 159.889 via ComputeSlReference, TP agreed 159.983); 6/5 S2WAIT-LTF retained 09:25-09:45 then R-killed 09:50 + NO_TP_TARGET at S2 16:10; 6/11 TPCENSUS #76 (bar 14:35, ref 160.524 = his entry, winner YLOH 160.587, R 1.75 PASS, promoted) + #77 (bar 14:40, winner Daily-VWAP 160.522, R 0.11 FAIL, abort from S4).
- His Rulings-J (finding USDJPY-MISSES): entry POC+VWAP confluence never targets own POI source; POC-over-VWAP hierarchy in booking; entry-bar triple (14:35 confirm, 14:40 open 160.524; 160.520 is the 14:45 open, post-entry).
- His 4-valid word (2026-09-27): four valid June trades (6/3 London LONG + 6/5 09:45 SHORT + 6/5 16:15 LONG + 6/11 14:40 LONG); the initial build got the 6/3 right, now none executes. Miss-to-fix map: 6/3 Fix A, 6/5 09:45 Fix C, 6/5 16:15 Fix D, 6/11 Fix B.
- Cited-build diff (RECON63 A82F15E7 vs RECON71, same 09:05 bar, diffed before diagnosis): SIGNAL identical both trees (R 1.35, SL 159.889, TP 159.983 YASH); old MTSNAP sl 159.889 TOOK (TP win); v8 guard killed on memo sl 159.905 (SlRefMemo: ext1 never applied behind dormant InpAdoptExt1) vs fire sl 159.889 (ext1Take applied); SLEXT43 agree=1 (memoExt1 = freshExt1 = 159.889); ladder rungs r0 159.905 R2.25 / r1 159.889 R1.35. Regression class: v8's own cross-check vs pre-existing ext1Take asymmetry. Fix A restores parity (latch fire locals = 159.889).
- 16:05 five-line rows (TPCENSUS #27: winner NONE, admitted PDH:65 NYH:253 PMH:23 YNYH:19 YPMH:23; SWEPTMASK: PDH swept, NYH live, PMH swept, YNYH/YPMH swept) -> NO_TP_TARGET at S2 16:10.
- 09:35 M15 rows (probe m15=-1.0 SHORT-aligned with ltf=+1.0 opposed; CONFIRMPOLL confirm=1 at 09:40) -> Fix C path (promote 09:35, confirm 09:40, fire 09:45). Buffer definition on disk: FL SetIndexBuffer(21, g_bufHtfLo) at FL-705; vote encoding Bull 1.0 / Bear -1.0 / else 0.0 at FL-1200; M15 slot fixed at F251.
- His NEAREST-ONLY-TP pin (strategy skill 2026-09-25): pool never empty, book nearest, refuse ONLY below 1R (6/5 16:05 instance) -> Fix D executes it. Scope: empty-election-only (a present masked winner means the fallback never runs).
- Design CLEAR lineage carried (IMPL-1 v8 2-0 CONFIRM; E1/E2 + IE1-IE10B untouched by this packet except the narrow E2 census-naming exception at B3, stated above; v8 built tree is the base).
- S2 census (RECON71 journal, machine-counted same turn): the SHORT/Daily-POC/LONDON candidate printed S2WAIT at 09:05/09:20/09:25/09:30/09:35/09:40/09:45 (7 passes); UJPROBE bar_key=09:30 (R18, m15=-1.0 == SHORT want) fires Fix C at the 09:35 pass, so promotion lands 09:30-signal (v5 09:35 pin withdrawn, owned mispin); CONFIRMPOLL series confirm=0 from eval-09:05 through eval-09:35, first-1 at eval-09:40 (fire preserved 09:45). UJPROBE prints unconditionally every new bar (EA 11963).
- Touch setters (two, both disk-read): leg path EA 8900-8904 (no print in v8) + opposite-dir path EA 8924-8925 (E print); after E2 both print the identical row shape, correlation key dir+anchor+bar.
- Call signatures on record: SrjUjAssert1R defined EA-11768, UjDbl defined EA-11750; barShift in scope at the touch book (used EA 8909). Compile fail-closed stands.
- Settled-rules audit for Fix C (strategy skill SETTLED-RULES pin): the S2 promotion edge feeds S3 unchanged - S5.4 pre-confirmation body-break, S3.3 flip-kill, zone/confirmation guards all run downstream of the edge untouched (S3 block, S4 edge, S5 election); the edge changes WHEN S3 is entered on M15-aligned passes, never what S3 checks. The M5 path is byte-unchanged (refine-only).
- Base tree 14C7476C/660687/11975 (v8 built; alert-only stands).

## Edit set (exact anchors; STAGE-1 exact-diffs each; convention: NET per site = NEW-block lines minus OLD-block lines; S3 recount governs)
- FIX A (SL-doctrine truce; 6/3 cited diff): the guard enforces memo-liveness + candidate identity; value-equality retired (disk proves two live SL doctrines: ladder-today memo 159.905 vs ext-1-applied fire 159.889; equality unmeetable when ext1Take fires). Latch consumes fire locals (parity with the cited take: sl 159.889); S5 election + SL stay; memo stays evidence + liveness for the S1-cascade fallback. Order documented: A4 runs before the liveness check, so sub-1R-with-stale-memo aborts SUB_1R first by construction. Memo doctrine (answers Luna 3 structurally): the memo is evidence + liveness keyed by anchor/dir, never proof of the admitted tuple; A9 binds admission provenance fire-side. Ordering proof (all disk-read): OnTick memo-clear EA-11962, probe EA-11963, entry pipeline EA-11964 (election->memo->fire->admit inline), managed loop EA-11969 post-admission; census uses locals (no UpdateBest call in the census region; call sites 2488/2495/2503/11349/11356/11367 only); Mt elections run post-admission.
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
B1 sits first in the Compute POI loop (EA 2498-region); B2 first in the Mt POI loop (EA 11361-region) with the managed anchor in test AND print (global anchor diverges from the managed anchor during management); B3 first in the census POI loop (EA 2559-region, print-only coherence: explicitly OVERRIDES the E2 anchor-naming path there, the anchor no longer appears with "*" nor "(ANCHOR)"). B2 prints UJPOISKIP for the anchor on managing passes (log noise only; the C11363 pre-existing skip stands). B2 shadows the C11363 skip (unreachable for the anchor case, behavior identical; recorded dead-branch for the next audit; siting kept).
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
Walk order session, then pool, then POI (existing); the list is pre-zone mask-off candidates (zone enforced inside UpdateBest, same call); the 1R gate (not emptiness) decides downstream.
Managed-side retarget deliberately untouched (admission-scoped per his pin; future round if rows demand).
- FIX E (touch-transition prints; 6/11 touch gap): print-only evidence for the touch prerequisite (no behavior change). Two setters print the identical row shape: the opposite-dir setter (E) and the leg-touch setter at EA 8900-8904 (E2). barShift is in scope at both (used EA 8909/8933); g_anchorLine is global. The anchor field is the candidate key for grade-time correlation (dir + anchor + bar).
```mql5-old-E
         if(oppositeDir && (!s35_fromFvg || touchesZone))
           { g_touchSeen = true; g_touchBarHi = h; g_touchBarLo = l; }
```mql5-new-E
         if(oppositeDir && (!s35_fromFvg || touchesZone))
           { if(InpDebugLog) PrintFormat("[SRJ-EA] UJTOUCHSEEN bar=%s dir=%s anchor=%s", TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES), DirName(g_dir), (g_anchorLine >= 0 ? g_lineCode[g_anchorLine] : "none")); g_touchSeen = true; g_touchBarHi = h; g_touchBarLo = l; }
```
```mql5-old-E2
      if(s52_found && !g_touchSeen)
        {
         g_touchSeen  = true;
```mql5-new-E2
      if(s52_found && !g_touchSeen)
        {
          if(InpDebugLog) PrintFormat("[SRJ-EA] UJTOUCHSEEN bar=%s dir=%s anchor=%s", TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES), DirName(g_dir), (g_anchorLine >= 0 ? g_lineCode[g_anchorLine] : "none"));
         g_touchSeen  = true;
```
E2 inserts the transition print at the leg-touch setter (EA 8900-8902 byte-exact above; block remainder shared, outside the fence): every touch set now prints the identical row shape, so row-presence == touch-set and the v5 progression alternative is WITHDRAWN as redundant. E sits in the touch book (EA 8920-region): the touch-vs-retest rule question itself goes to council visibly (quoted gap + rows, ruled by name), never decided here.
Fall-through to the shared S3 promote (byte-unchanged). m15src is the containing-M15 open derived from the evaluated barShift (containing-M15 time mapping, not confirmed indicator-source timing; source-time mapping needs indicator work, future round). Budget (script-counted from the fenced blocks above, same turn): A3 -1 (retired define; guard 2-vs-2) + A4 +3 (fire-local 1R gate) + A5 0 (comment swap) + A6 +1 (fire-R carrier) + A7 0 (UJADMIT R + provenance swap) + A8 +1 (MEMO_IDENTITY define) + A9 +6 (fire-provenance carriers + snapshot) + B0 +11 + B1/B2/B3 +2 each (+6) + B3b -1 (suffix removal) + B3c 0 (comment swap) + C +11 (2-vs-13, containing-m15 time-mapping field) + D1 +15 (pre-zone census list) + E 0 (print-only) + E2 +1 (leg-setter print). Total NET +53. S3 recount governs at build.

## Acceptance (grade-time proofs on a future UJ 6/1-6/13 run with InpDebugLog=true pinned (all cited rows gated); discipline sentence: STAGE-1 exact-diffs the edit, S1 pre-hash gates the tree digest, S3 recounts the surface, and a fail-closed outcome is a failed proof unless its finding predicate fires. Per-venue record required: candidate/admission identity, direction, signal bar, fill bar, actual entry/SL/TP, target source (fire wsrc), actual-tuple 1R verdict, admission count; mechanism rows ride as supporting evidence. Values pre-declared below must match; fields marked grade-read are read at grade, never pre-filled.)
- A-SL1: 6/3 09:05 bar takes with entry 159.929, SL 159.889, TP 159.983 (signalBarTime=09:05, fillBarTime=09:10: R01 ALERT at the 09:10 pass + R02 MTSNAP bar=09:05; parity tuple: MTSNAP sl=159.889 booking parity with R02; memo sl=159.905 labeled evidence only); UJMEMO_PASS memo tuple + UJ1R R=1.35 PASS on the fire tuple + MT managing open; MEMO_MISMATCH path absent from the tree (S1 pre-hash proves retirement, never a run row).
- A-S2P: S2PROMOTE_M15 exactly once at 09:30-signal for the SHORT/Daily-POC/LONDON candidate (R18 m15-aligned trigger at the 09:35 pass; R14 09:25 probe m15-opposed retained; R06 09:35 probe is post-promotion telemetry, UJPROBE prints unconditionally every bar); CONFIRMPOLL confirm=1 at 09:40 (R07; journal series all-0 from eval-09:05 through eval-09:35, first-1 at eval-09:40); SHORT admission path with signalBarTime=09:40, fillBarTime=09:45; promotion lands one pass earlier than v5 stated (v5 09:35 pin WITHDRAWN, owned mispin: the R18 check was never run), so the S3 window opens at the 09:35 pass - any S3 kill fails the venue with UJ-NOADMIT, never regraded.
- A-POIV: ONE LONG admission with signalBarTime=14:35, fillBarTime=14:40, entry 160.524, TP YLOH 160.587, actual-tuple 1R PASS, SL grade-read; source proven by admission-tuple fire wsrc = YLOH (memo wsrc evidence-only in UJMEMO_PASS; census corroborating only, equal-price matches labeled as such); touch prerequisite: ONE UJTOUCHSEEN row with dir=LONG + anchor match at bar <= 14:35 on/before the 14:35-signal pass (both setters print after E2, so row-presence == touch-set; the v5 progression alternative is WITHDRAWN as redundant); UJPOISKIP Daily-POC/VWAP rows as helper-execution proof (not venue proof); entry-scheduling unchanged in this packet (no timing fix); the pin is reachable IFF the 14:35 candle sets the touch at the 14:35-signal pass under the fixed run's earlier S3 entry (R17 touchSeen=0 is base behavior; R13 entry=160.520 is the base 14:40-signal fire attempt); any other fill bar = failed proof with finding UJ-TIMEBASE, never regraded.
- A-FB: ONE 6/5 16:15 LONG admission record required (signalBarTime=16:10, fillBarTime=16:15 by the C10409-C10410 latch + evaluated-bar convention; the 16:05-bar-evaluated-at-16:10 context (R09/R10 base-empty) is the fallback election witness, NOT the admission fields - the v5 signal-bar-16:05 label is WITHDRAWN as a mislabeled bar; elected fallback source, entry, SL, TP, actual-tuple 1R, all grade-read; UJFBPOOL + TPFALLBACK supporting; zone enforced inside UpdateBest, same call); sub-1R-or-empty = FAILED proof with finding UJ-FBDEAD (fires IFF the fallback election at the admission pass evaluates 16:10 and elects nothing (-> NO_TP_TARGET path, no TPFALLBACK row) OR elects sub-1R (-> SUB_1R abort row); linkage = pass time 16:15 + LONG + anchor chain; a chain never reaching election evaluation fails instead with UJ-NOPROMO); a correctly logged rejection never counts as the take. One RESOLUTION per venue (his pin refuses sub-1R; refusal resolves without a take). Reachability mirrors A-POIV: the pin needs the S-chain to survive to the 16:15 pass; any earlier kill fails closed with its own finding.
- A-EU-PRESERVE carried: baseline D74FE972 RECON60 rows; zero unmatched take identities in both directions; entry-bar fields (date, signal bar, direction, anchor, entry) compared per take; REGIMECENSUS populations equal by (session, regime) grouping keys with counts; TPCENSUS + raw-log text + cumulative counters excluded as volatile; pending future evidence (graded when its run exists, never bundled into this round's L-final).
- L-final: A-SL1 + A-S2P + A-POIV + A-FB (each exactly one matching admission per named venue, keyed to identity + signal/fill bars; repeated diagnostics counted separately, never as admissions). EU comparison graded separately when its run lands. Failed proof names its finding. Multiple findings may attach to one failed venue; one RESOLUTION per venue stands.
- Findings map (every failed predicate names one; several may attach): wrong parity tuple UJ-PARITY; missing admission UJ-NOADMIT; duplicate admissions UJ-DUPADMIT (admissions only, promotions/diagnostics counted separately); missing promotion/confirmation UJ-NOPROMO; source mismatch UJ-SRCMISM; wrong signal bar UJ-SIGNALBAR; wrong fill UJ-TIMEBASE; wrong direction/candidate identity UJ-IDENTITY; admitted tuple fails grade 1R recompute outside fallback UJ-SUB1R; touch unproven (row absent by the signal pass) UJ-NOTOUCH; fallback empty/sub-1R at the admission pass UJ-FBDEAD; EU differences UJ-EUDIFF. A missing row fails the proof; it never asserts the event did not occur.

## Run cost and novel evidence
- No run proposed (draft round; build gated on a NEW key + his run word, neither spent nor asked here). Cost when gated: ~45m UJ 6/1-6/13 (+ EU sibling future).
- Novel evidence vs RECON71: parity take rows (6/3 sl 159.889), M15-promotion rows, POI-skip rows, fallback-booking rows answering all four diagnosed deaths.

## Annex: design history (one line each; operative path above is the only authority)
- IMPL-1 v8 (D3A66F97): DIV + provenance closure, built 14C7476C, RECON71 0-take diagnosed (SL divergence / S2-held / VWAP wrong-kill). IMPL-2 v1-v3: RECON71 fixes. IMPL-2 v4: V316 amend (A4 fire-1R gate, A5 comment, B full texts + gating + managed anchor + direction/boundary sentences, C enriched print, D/legs/EU restated, R14 boundary row). IMPL-2 v5: V317 split amend (B3b suffix removal + E2 comment swap, C containing-m15 source field, D pre-zone census list, ABORT_MEMO_IDENTITY separation, E touch-transition print, findings map, EU comparator, per-venue record contract). IMPL-2 v6: V318 fold (A9 fire provenance + snapshot, E2 leg-setter print + anchor key, S2PROMOTE 09:30 + A-FB 16:10/16:15 corrections with two owned withdrawals, findings-v2, byte-exact B3b/B3c/E fences, R18, signature/scope cites, reachability notes).

(End of file)
