# PACKET_P-UJIMPL-IMPL-2 v4 DRAFT - V316 amend: fire-local 1R gate + full B texts + enriched promote print + restated legs (build gated on new key + run word; nothing builds/runs/commits on this file)

Status: v4 DRAFT (v3 + V316 0-3 OBJECT folded item-by-item: A4 fire-local 1R gate + A5 guard-comment truth + B2/B3 full texts with managed-anchor print + gated skip prints + one-directionality/anchor/E2 sentences + C enriched promote row + FL buffer cite + D unchanged + legs restated to parity/producible/admission-record form + EU comparator + debug pin; design untouched (four fixes, budget +40, surface unchanged); base = built tree 14C7476C/660687/11975; STAGE-1/S3 disciplines attach; build needs a NEW key + his run word, neither spent nor asked here).

Canonical files: Experts\SRJ_FlowNexus_EA.mq5 ONLY (fixes A-D below; HTF include + FlowLogic untouched). No new buffers, no new inputs, no new handles, no EA-side mirror.

## Authority (his words + disk + CLEAR, no invention)
- RECON71 rows (result BUILDER_RESULT_RECON71-V8-UJ.md, ledger 878): 6/3 UJMISMATCH (memo sl 159.905 via SlRefMemo vs fire sl 159.889 via ComputeSlReference, TP agreed 159.983); 6/5 S2WAIT-LTF retained 09:25-09:45 then R-killed 09:50 + NO_TP_TARGET at S2 16:10; 6/11 TPCENSUS #76 (bar 14:35, ref 160.524 = his entry, winner YLOH 160.587, R 1.75 PASS, promoted) + #77 (bar 14:40, winner Daily-VWAP 160.522, R 0.11 FAIL, abort from S4).
- His Rulings-J (finding USDJPY-MISSES): entry POC+VWAP confluence never targets own POI source; POC-over-VWAP hierarchy in booking; entry-bar triple (14:35 confirm, 14:40 open 160.524; 160.520 is the 14:45 open, post-entry).
- His 4-valid word (2026-09-27): four valid June trades (6/3 London LONG + 6/5 09:45 SHORT + 6/5 16:15 LONG + 6/11 14:40 LONG); the initial build got the 6/3 right, now none executes. Miss-to-fix map: 6/3 Fix A, 6/5 09:45 Fix C, 6/5 16:15 Fix D, 6/11 Fix B.
- Cited-build diff (RECON63 A82F15E7 vs RECON71, same 09:05 bar, diffed before diagnosis): SIGNAL identical both trees (R 1.35, SL 159.889, TP 159.983 YASH); old MTSNAP sl 159.889 TOOK (TP win); v8 guard killed on memo sl 159.905 (SlRefMemo: ext1 never applied behind dormant InpAdoptExt1) vs fire sl 159.889 (ext1Take applied); SLEXT43 agree=1 (memoExt1 = freshExt1 = 159.889); ladder rungs r0 159.905 R2.25 / r1 159.889 R1.35. Regression class: v8's own cross-check vs pre-existing ext1Take asymmetry. Fix A restores parity (latch fire locals = 159.889).
- 16:05 five-line rows (TPCENSUS #27: winner NONE, admitted PDH:65 NYH:253 PMH:23 YNYH:19 YPMH:23; SWEPTMASK: PDH swept, NYH live, PMH swept, YNYH/YPMH swept) -> NO_TP_TARGET at S2 16:10.
- 09:35 M15 rows (probe m15=-1.0 SHORT-aligned with ltf=+1.0 opposed; CONFIRMPOLL confirm=1 at 09:40) -> Fix C path (promote 09:35, confirm 09:40, fire 09:45). Buffer definition on disk: FL SetIndexBuffer(21, g_bufHtfLo) at FL-705; vote encoding Bull 1.0 / Bear -1.0 / else 0.0 at FL-1200; M15 slot fixed at F251.
- His NEAREST-ONLY-TP pin (strategy skill 2026-09-25): pool never empty, book nearest, refuse ONLY below 1R (6/5 16:05 instance) -> Fix D executes it. Scope: empty-election-only (a present masked winner means the fallback never runs).
- Design CLEAR lineage carried (IMPL-1 v8 2-0 CONFIRM; E1/E2 + IE1-IE10B untouched by this packet; v8 built tree is the base).
- Settled-rules audit for Fix C (strategy skill SETTLED-RULES pin): the S2 promotion edge feeds S3 unchanged - S5.4 pre-confirmation body-break, S3.3 flip-kill, zone/confirmation guards all run downstream of the edge untouched (S3 block, S4 edge, S5 election); the edge changes WHEN S3 is entered on M15-aligned passes, never what S3 checks. The M5 path is byte-unchanged (refine-only).
- Base tree 14C7476C/660687/11975 (v8 built; alert-only stands).

## Edit set (exact anchors; STAGE-1 exact-diffs each; convention: NET per site = NEW-block lines minus OLD-block lines; S3 recount governs)
- FIX A (SL-doctrine truce; 6/3 cited diff): the guard enforces memo-liveness + candidate identity; value-equality retired (disk proves two live SL doctrines: ladder-today memo 159.905 vs ext-1-applied fire 159.889; equality unmeetable when ext1Take fires). Latch consumes fire locals (parity with the cited take: sl 159.889); S5 election + SL stay; memo stays evidence + liveness for the S1-cascade fallback.
```mql5-old-A3
         if(uj_memo_anchor != g_anchorLine || uj_memo_dir != (int)g_dir || uj_memo_tp != tpTarget || uj_memo_sl != slRef)
           { if(InpDebugLog) PrintFormat("[SRJ-EA] UJMISMATCH bar=%s memo_tp=%s memo_sl=%s fire_tp=%s fire_sl=%s memo_src=%s", uj_bk9, DoubleToString(uj_memo_tp, _Digits), DoubleToString(uj_memo_sl, _Digits), DoubleToString(tpTarget, _Digits), DoubleToString(slRef, _Digits), uj_memo_src); GoAbort(ABORT_MEMO_MISMATCH, g_state); return; }
```mql5-new-A3
         if(uj_memo_anchor != g_anchorLine || uj_memo_dir != (int)g_dir)
           { if(InpDebugLog) PrintFormat("[SRJ-EA] UJMEMO_FAIL bar=%s reason=IDENTITY src=%s", uj_bk9, uj_memo_src); GoAbort(ABORT_NO_MEMO_AT_FIRE, g_state); return; }
```
```mql5-new-A4
         double uj_frisk = 0.0, uj_freward = 0.0, uj_fR = 0.0;
         if(!SrjUjAssert1R(currentPrice, slRef, tpTarget, uj_bk9, "FIRE", uj_frisk, uj_freward, uj_fR))
           { GoAbort(ABORT_SUB_1R, g_state); return; }
```
A4 sits immediately after the uj_bk9 definition line, before the NO_MEMO check (same block scope): 1R enforced on the exact fire-local tuple, so a passing memo R never certifies a failing latched R (fire-time tp divergence backstopped here; memo R stays evidence).
```mql5-old-A5
      //--- [P-UJIMPL-IMPL-1 v8 IE9] fire-edge memo guard (candidate identity +
      //--- value equality; cross-check tuple on pass).
```mql5-new-A5
      //--- [P-UJIMPL-IMPL-2 v4 Fix A] fire-edge memo guard (liveness + identity;
      //--- admitted tuple validated by the FIRE 1R gate below, evidenced by MTSNAP).
```
Plus: retire the ABORT_MEMO_MISMATCH define (one line at EA 396). UJMEMO_PASS print unchanged (memo tuple stays evidence). The 1R assertions at both memo-write points stay (single-sourced arithmetic stands).
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
B1 sits first in the Compute POI loop (EA 2498-region); B2 first in the Mt POI loop (EA 11361-region) with the managed anchor in test AND print (global anchor diverges from the managed anchor during management); B3 first in the census POI loop (EA 2559-region, print-only coherence: explicitly OVERRIDES the E2 anchor-naming path there, the anchor no longer appears with "*" nor "(ANCHOR)").
Anchor exclusion (k == anchor) is deliberate: without it Daily-POC at 3pts in-direction wins the nearest race at R~0.14 and the 6/11 venue dies again. Exclusion is one-directional (anchor-POC blocks same-family VWAP; a VWAP-anchored entry may still book family POC) per his hierarchy reading. String version stands (readability; enum pairing already evidenced at the call sites; arithmetic alternative declined with cause).
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
           { double uj_ltfb = 0.0; ReadFlow(FL_BUF_LTF_BIAS, uj_ltfb, barShift);
             datetime uj_m15t = iTime(_Symbol, PERIOD_M15, 0);
             if(InpDebugLog) PrintFormat("[SRJ-EA] S2PROMOTE_M15 bar=%s dir=%s poi=%s sess=%s m15=%s m15time=%s ltf=%s", TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES), DirName(g_dir), AnchorStr(), SessionName(g_sessionAtEntry), DoubleToString(uj_m15b, 1), TimeToString(uj_m15t, TIME_DATE|TIME_MINUTES), UjDbl(uj_ltfb)); }
         else
           { if(InpDebugLog) PrintFormat("[SRJ-EA] S2WAIT bar=%s dir=%s poi=%s sess=%s - LTF bias unaligned, candidate RETAINED (Stage 3a)", TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES), DirName(g_dir), AnchorStr(), SessionName(g_sessionAtEntry)); return; }
        }
```
- FIX D (NEAREST-ONLY-TP fallback; 6/5 16:05 rows + his pin): when the masked walk finds nothing, re-walk the session lines mask-off and book the nearest in-direction line (zone + in-direction still apply via UpdateBest); the 1R gate (not emptiness) decides. Sits after the Compute POI loop close, before the TASK-23 census comment (so the census names the fallback winner). Truly-empty still falls to NO_TP_TARGET.
```mql5-new-D1
if(!haveBest)
  {
   for(int i = 0; i < ArraySize(sessbufs); i++)
     {
      double dv = 0.0;
      if(!ReadFlow(sessbufs[i], dv, barShift)) continue;
      TpTargetUpdateBest(dv, dir, currentPrice, best, haveBest, sname[i], uj_dk, -1);
     }
   if(haveBest && InpDebugLog)
      PrintFormat("[SRJ-EA] TPFALLBACK bar=%s dir=%s tp=%s distPts=%s src=%s", TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES), DirName(dir), DoubleToString(best, _Digits), DoubleToString(MathAbs(best - currentPrice) / _Point, 0), uj_winnerSource);
  }
```
Managed-side retarget deliberately untouched (admission-scoped per his pin; future round if rows demand).
Fall-through to the shared S3 promote (byte-unchanged). Budget (script-counted from the fenced blocks above, same turn): A3 -1 (retired define; guard 2-vs-2) + A4 +3 (fire-local 1R gate) + A5 0 (comment swap) + B0 +11 + B1/B2/B3 +2 each (+6) + C +10 (2-vs-12, enriched promote row) + D1 +11. Total NET +40. S3 recount governs at build.

## Acceptance (grade-time proofs on a future UJ 6/1-6/13 run with InpDebugLog=true pinned (all cited rows gated); discipline sentence: STAGE-1 exact-diffs the edit, S1 pre-hash gates the tree digest, S3 recounts the surface, and a fail-closed outcome is a failed proof unless its finding predicate fires. Per-venue record required: candidate/admission identity, direction, signal bar, fill bar, actual entry/SL/TP, target source, actual-tuple 1R verdict, admission count; mechanism rows ride as supporting evidence. Values pre-declared below must match; fields marked grade-read are read at grade, never pre-filled.)
- A-SL1: 6/3 09:05 bar takes with entry 159.929, SL 159.889, TP 159.983 (parity tuple: MTSNAP sl=159.889 booking parity with R02; memo sl=159.905 labeled evidence only); UJMEMO_PASS memo tuple + UJ1R R=1.35 PASS on the fire tuple + MT managing open; MEMO_MISMATCH path absent from the tree (S1 pre-hash proves retirement, never a run row).
- A-S2P: S2PROMOTE_M15 exactly once at 09:35 (09:25 probe m15-opposed retained correctly as S2WAIT, R14 boundary; negation scoped to 09:35/09:40); CONFIRMPOLL confirm=1 at 09:40 (R07); SHORT admission path with fillBarTime=09:45.
- A-POIV: ONE LONG admission with signalBarTime=14:35, fillBarTime=14:40, entry 160.524, TP YLOH 160.587, actual-tuple 1R PASS, SL grade-read; UJPOISKIP Daily-POC/VWAP rows as helper-execution proof (not venue proof); entry-scheduling unchanged in this packet (no timing fix); any other fill bar = failed proof with finding UJ-TIMEBASE, never regraded.
- A-FB: ONE 6/5 16:15 LONG admission record required (signal/confirm bar, elected fallback source, entry, SL, TP, actual-tuple 1R, all grade-read; TPFALLBACK as supporting evidence); sub-1R-or-empty = FAILED proof with finding UJ-FBDEAD (fires IFF fallback elected nothing OR elected sub-1R at the 16:15 pass); a correctly logged rejection never counts as the take. One RESOLUTION per venue (his pin refuses sub-1R; refusal resolves without a take).
- A-EU-PRESERVE carried: baseline D74FE972 RECON60 rows; matched by trade identity (anchorLine/dir/barTime); compared: takes (entry bars) + REGIMECENSUS populations; TPCENSUS excluded (ref= rename); new diagnostics allowed; pending future evidence.
- L-final: A-SL1 + A-S2P + A-POIV + A-FB (each exactly one matching admission per named venue, keyed to identity + signal/fill bars; repeated diagnostics counted separately) + EU comparison. Failed proof names its finding.

## Run cost and novel evidence
- No run proposed (draft round; build gated on a NEW key + his run word, neither spent nor asked here). Cost when gated: ~45m UJ 6/1-6/13 (+ EU sibling future).
- Novel evidence vs RECON71: parity take rows (6/3 sl 159.889), M15-promotion rows, POI-skip rows, fallback-booking rows answering all four diagnosed deaths.

## Annex: design history (one line each; operative path above is the only authority)
- IMPL-1 v8 (D3A66F97): DIV + provenance closure, built 14C7476C, RECON71 0-take diagnosed (SL divergence / S2-held / VWAP wrong-kill). IMPL-2 v1-v3: RECON71 fixes. IMPL-2 v4: V316 amend (A4 fire-1R gate, A5 comment, B full texts + gating + managed anchor + direction/boundary sentences, C enriched print, D/legs/EU restated, R14 boundary row).

(End of file)
