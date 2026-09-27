# PACKET_P-UJIMPL-IMPL-2 v1 DRAFT - RECON71 fixes: SL single-source + S2/M15 edge + POI own-source (build gated on new key + run word; nothing builds/runs/commits on this file)

Status: v1 DRAFT (RECON71 0-take diagnosis: 6/3 SL-divergence guard-kill; 6/5 S2-LTF-held venues; 6/11 VWAP-2pts wrong kill on his own-source ruling Rulings-J; base = built tree 14C7476C/660687/11975; STAGE-1/S3 disciplines attach; build needs a NEW key + his run word, neither spent nor asked here).

Canonical files: Experts\SRJ_FlowNexus_EA.mq5 ONLY (fixes A-C below; HTF include + FlowLogic untouched). No new buffers, no new inputs, no new handles, no EA-side mirror.

## Authority (his words + disk + CLEAR, no invention)
- RECON71 rows (result BUILDER_RESULT_RECON71-V8-UJ.md, ledger 878): 6/3 UJMISMATCH (memo sl 159.905 via SlRefMemo vs fire sl 159.889 via ComputeSlReference, TP agreed 159.983); 6/5 S2WAIT-LTF retained 09:25-09:45 then R-killed 09:50 + NO_TP_TARGET at S2 16:10; 6/11 TPCENSUS #76 (bar 14:35, ref 160.524 = his entry, winner YLOH 160.587, R 1.75 PASS, promoted) + #77 (bar 14:40, winner Daily-VWAP 160.522, R 0.11 FAIL, abort from S4).
- His Rulings-J (finding USDJPY-MISSES): entry POC+VWAP confluence never targets own POI source; POC-over-VWAP hierarchy in booking; entry-bar triple (14:35 confirm, 14:40 open 160.524; 160.520 is the 14:45 open, post-entry).
- Design CLEAR lineage carried (IMPL-1 v8 2-0 CONFIRM; E1/E2 + IE1-IE10B untouched by this packet; v8 built tree is the base).
- Settled-rules audit for Fix C (strategy skill SETTLED-RULES pin): the S2 promotion edge feeds S3 unchanged - S5.4 pre-confirmation body-break, S3.3 flip-kill, zone/confirmation guards all run downstream of the edge untouched (S3 block, S4 edge, S5 election); the edge changes WHEN S3 is entered on M15-aligned passes, never what S3 checks. The M5 path is byte-unchanged (refine-only).
- Base tree 14C7476C/660687/11975 (v8 built; alert-only stands).

## Edit set (exact anchors; STAGE-1 exact-diffs each; convention: NET per site = NEW-block lines minus OLD-block lines; S3 recount governs)
- FIX A (SL single-source; 6/3 rows): the fire consumes memo TP/SL/entry (S5 election + SL stay as fallback source + signal display only).
```mql5-old-A1
      g_mtrade.entryPrice        = currentPrice;
      g_mtrade.slRef             = slRef;
      g_mtrade.tpRef             = tpTarget;
```mql5-new-A1
      g_mtrade.entryPrice        = uj_memo_entry;
      g_mtrade.slRef             = uj_memo_sl;
      g_mtrade.tpRef             = uj_memo_tp;
```mql5-old-A2
                     DoubleToString(currentPrice, _Digits),
                     DoubleToString(slRef, _Digits),
                     DoubleToString(tpTarget, _Digits),
```mql5-new-A2
                     DoubleToString(uj_memo_entry, _Digits),
                     DoubleToString(uj_memo_sl, _Digits),
                     DoubleToString(uj_memo_tp, _Digits),
```mql5-old-A3
         if(uj_memo_anchor != g_anchorLine || uj_memo_dir != (int)g_dir || uj_memo_tp != tpTarget || uj_memo_sl != slRef)
           { if(InpDebugLog) PrintFormat("[SRJ-EA] UJMISMATCH bar=%s memo_tp=%s memo_sl=%s fire_tp=%s fire_sl=%s memo_src=%s", uj_bk9, DoubleToString(uj_memo_tp, _Digits), DoubleToString(uj_memo_sl, _Digits), DoubleToString(tpTarget, _Digits), DoubleToString(slRef, _Digits), uj_memo_src); GoAbort(ABORT_MEMO_MISMATCH, g_state); return; }
```mql5-new-A3
         if(uj_memo_anchor != g_anchorLine || uj_memo_dir != (int)g_dir)
           { if(InpDebugLog) PrintFormat("[SRJ-EA] UJMEMO_FAIL bar=%s reason=IDENTITY src=%s", uj_bk9, uj_memo_src); GoAbort(ABORT_NO_MEMO_AT_FIRE, g_state); return; }
```
Plus: retire the ABORT_MEMO_MISMATCH define (one line at EA 396). UJMEMO_PASS print unchanged (memo tuple now authoritative).
- FIX B (POI own-source exclusion + hierarchy; 6/11 rows + his ruling): helper after the TpTargetUpdateBest closing brace (EA 2379-region, STAGE-1 pins numbers).
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
Call-site inserts (each: skip print + continue; census site print-only coherence, anchor admitted naming otherwise unchanged).
```mql5-new-B1
   if(!UjPoiTargetValid(kf, g_anchorLine))
     { PrintFormat("[SRJ-EA] UJPOISKIP bar=%s line=%s anchor=%s", TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES), g_lineCode[kf], (g_anchorLine >= 0 ? g_lineCode[g_anchorLine] : "none")); continue; }
```
B1 sits first in the Compute POI loop (EA 2498-region); B2 identical with (k, g_mtrade.anchorLine) first in the Mt POI loop (EA 11623-region); B3 identical with (k2, g_anchorLine) first in the census POI loop (EA 2559-region).
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
           { if(InpDebugLog) PrintFormat("[SRJ-EA] S2PROMOTE_M15 bar=%s dir=%s m15=%s", TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES), DirName(g_dir), DoubleToString(uj_m15b, 1)); }
         else
           { if(InpDebugLog) PrintFormat("[SRJ-EA] S2WAIT bar=%s dir=%s poi=%s sess=%s - LTF bias unaligned, candidate RETAINED (Stage 3a)", TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES), DirName(g_dir), AnchorStr(), SessionName(g_sessionAtEntry)); return; }
        }
```
Fall-through to the shared S3 promote (byte-unchanged). Budget (script-counted from the fenced blocks above, same turn): A1 0 + A2 0 + A3 -1 (retired define; guard 2-vs-2) + B0 +11 + B1/B2/B3 +2 each (+6) + C +8 (2-vs-10). Total NET +24. S3 recount governs at build.

## Acceptance (grade-time proofs on a future UJ 6/1-6/13 run; discipline sentence: STAGE-1 exact-diffs the edit, S1 pre-hash gates the tree digest, S3 recounts the surface, and a fail-closed outcome is a failed proof unless its finding predicate fires.)
- A-SL1: 6/3 09:05 bar takes with memo-sourced SL (UJADMIT sl=159.905, tp=159.983); UJMISMATCH 0x run-wide (code retired).
- A-S2P: 6/5 09:35 + 09:40 passes print S2PROMOTE_M15 (not S2WAIT); candidate reaches S3.
- A-POIV: 6/11 14:40 pass prints UJPOISKIP for Daily-POC + Daily-VWAP; TPCENSUS winner YLOH; UJ1R PASS R>=1; latch + UJADMIT booked YLOH.
- A-EU-PRESERVE carried (EU 8/26-9/10 zero-delta sibling row, future run).
- L-final: A-SL1 + A-S2P + A-POIV + EU carried.

## Run cost and novel evidence
- No run proposed (draft round; build gated on a NEW key + his run word, neither spent nor asked here). Cost when gated: ~45m UJ 6/1-6/13 (+ EU sibling future).
- Novel evidence vs RECON71: memo-sourced take rows, M15-promotion rows, POI-skip rows answering the three diagnosed deaths.

## Annex: design history (one line each; operative path above is the only authority)
- IMPL-1 v8 (D3A66F97): DIV + provenance closure, built 14C7476C, RECON71 0-take diagnosed (SL divergence / S2-held / VWAP wrong-kill). IMPL-2 v1: RECON71 fixes (this file).

(End of file)
