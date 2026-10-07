# BUILDER SLICE B-64 - raws behind R1-R3, D2 diffs, T1-T3 tables (j35 77BBCB55 EA B8477361; j36 812CBFD5 EA B8477361; code refs on restored EA D00F93BB unless noted)

## R1 tier-origin hits raw (file:line)
- Ledger 536 (2026-09-21, paraphrase-record): "RULE-CHOICE BANKED 2026-09-21 (Q1 answered: nearest valid TP wins, family/category disregarded - banked to strategy skill, amends 2026-09-17 POI-FIRST fork...)".
- PACKET_P-EXITMODEL-2.md:15 (rule): "F1 booking: the booked TP is the nearest valid target across BOTH pools in one race (18 session/PD levels plus eligible POI lines, anchor admitted). Family/category disregarded. Validity filters kept: direction and in-zone guard (Task 31) both pools; tier-rank filter POI candidates only (disk: rank reads index POI lines only, no rank call in any session loop); swept/live mask (EA-26/EA-51) session/PD candidates only, never POI lines (unchanged from the old fork). ... Valid = admissible: nearest among candidates surviving the pool-specific filters in this line ...".
- PACKET_P-EXITMODEL-2.md:28 (F1 edit set): "... Validity kept per P15: direction and in-zone guard (Task 31) both pools; tier-rank filter POI lines only; swept/live mask (EA-26/EA-51) session/PD lines only; anchor admitted. ...".
- BUILDER_FINDING_BOOKING-GATE-VALIDSET.md:9: "- C5 filters as built (packet P15, V225-cleared): direction + in-zone both pools; tier-rank POI only; swept/live mask session/PD only. ...".
- Ledger 551 (2026-09-22, paraphrase-record): "BUILD+LAUNCH RECON52 (authority: Luna ACCEPT v12 + key LUNA-V225-P-EXITMODEL2-V12-CLR-20260922, Kimi ACCEPT, GLM halt withdrawn disk-disproved, Sonnet tier question answered on record (spec line 185 same-or-higher menu + his nearest-valid word); ...)".
- Ledger 556 (2026-09-22, his scope order VERBATIM inside): "then why the EA previous version validly took those trades? the only thing you're supposed to fix here is the exit rule which was primarily the sessional high and low nearer, disregarding the family and now you're asking about the lines POI?"
- BUILDER_FINDING_ANCHORTIER-1.md:25-34 (rank table; anchor tier = rank/2; TP admission filter described at :73-79); :126-136 (his 2026-09-09 ruling VERBATIM: "Keep as mapped: the rank order AND the while-alive suppression both stand - close open item (a) as 'the EA matches my rule' ..." - covers Q1 rank order + Q2 same-bar tie + Q3 while-alive; TP admission NOT ruled).
- Git -S: "anchorRank" first appears d96fd5f (T161M-R snapshot era); "g_authorityRank" across T161/T162 snapshots + 66da45c (RECON58 build). "P15" on disk: cited only (PACKET_P-EXITMODEL-2.md:26, :28; BOOKING-GATE-VALIDSET.md:9), never defined.
- AGENTS.md grep g_authorityRank|tier-rank|authority rank|TIERSKIP: zero. .clinerules same: zero. Journal same: zero.
- TIER_ORIGIN = CODE_ONLY.

## R2 conflict-check raws (all point toward removal; blockers: none)
- s3:66 VERBATIM (2026-09-21): "the category of family does not matter. I said the nearest and i do not care anything else".
- s5:89 VERBATIM (2026-09-25): "there is no such thing as no profit target, there is only target there is closer than 1R to then rejected."
- s11:130 W1 VERBATIM + s11:137 scope (POC outranks VWAP ONLY in the gap case; "so please separate this nuance rule.").
- s12:146-148 (gap needs a body-close flip; 8/27 D-VWAP not a gap; gap handling not a build item).
- s5:94 own-source half STANDS (anchor exclusion kept). s10:126 taken-line + swept/live mask untouched by hunk T.

## R3 every g_authorityRank use on D00F93BB raw (line: code)
- 88 decl; 93-104 rank table (FOMC 0/1, Yearly 2/3, Quarterly 4/5, Monthly 6/7, Weekly 8/9, Daily 10/11).
- Entry/selection: 2116/2118 same-bar tie bestLongRank/bestShortRank; 2148 B3_AnchorTier; 2177-2180 B3_ElectAnchor tier-best pick; 2216 RETESTBOOK print rank; 7904-7905/7915-7916/7936-7937 POIREPLACE census tiers; 8038/8040 B3 supersession ranks; 8089/8111-8112 t73_isHigh census; 8233 ANCHOR_ELECT print rank.
- Target race: 2575 anchorRank; 2624 tier skip (EDITED); 2772 TPCENSUS mirror tier skip (EDITED, print-only).
- Managed-side recompute: 11770 anchorRank; 11773 tier skip (NOT edited).
- Exit: 12111 higher-break `g_authorityRank[k] < g_authorityRank[g_mtrade.anchorLine]` (NOT edited).

## D2 SHAs + compile
- .preB64 D00F93BB (683671 B). EA after D1 = 7985480D. Hunk T + B64TGTC build: Result 0 errors, 0 warnings. .B64DIAG B8477361 (695259 B). Run ex5 kept as .ex5.B64DIAG 819F4D10 (469890 B). Restored EA D00F93BB (683671 B), rebuilt 0/0, ex5 AE1E9A5E (459278 B).
- Diffs follow whole (vs .B63DIAG 79 lines; vs .preB64 303 lines).

## T1 EU7_B64 deal rows (j35 vs j28/j33)
- j35 A6FIRED x5: 8/28 10:05 SHORT tp=1.16364 r=2.43 sl=1.16508; 9/1 17:35 LONG tp=1.16077 r=1.17 sl=1.15975; 9/7 09:20 LONG tp=1.16200 r=1.76 sl=1.16098; 9/7 16:45 LONG tp=1.16315 r=2.34 sl=1.16238; 9/8 10:10 SHORT tp=1.16102 r=1.94 sl=1.16258 (all identical to j33/j28).
- j35 deals: #2 sell 1.16466 / #3 buy 11:45:02 1.16440; #4 buy 1.16024 / #5 sell 17:51:04 1.15975; #6 buy 2.49 1.16138 / #7 sell 10:53:07 2.49 1.16201; #8 buy 3.89 1.16264 / #9 sell 17:13:30 3.89 1.16315; #10 sell 1.94 1.16205 / #11 buy 10:42:46 1.94 1.16102. Balance 10516.51.
- X27_AFTER rows (j35): :11685 UJ1R POLL bar=17:00 entry=1.16524 sl=1.16652 tp=1.16498 R=0.20 FAIL; :11928 TP_ELECT entry=1.16524 sl=1.16598 tp=1.16498 R=0.35; :11933 ABORT TP_RR_FAIL S5_GATE_CHECK poi=Weekly-VWAP dir=SHORT; :111... B60C cSrc=RETEST + CONFIRM_PREBIND still print (setup reaches S5, dies at the R latch). No B63TGT/B64TGTC/FIRELOCAL/UJMEMO_PASS/A6FIRED at 17:00.
- j35 TPCENSUS #60/#61 bar=17:00 dir=SHORT ref=1.16524 winner=Daily-VWAP best=1.16498 distPts=26 (j32/j33: winner=Yearly-VWAP best=1.16322 distPts=202).
- 9/4 LOST rows (j35): :43039 TP_ELECT entry=1.16018 sl=1.15847 tp=1.16019 R=0.01; :43044 ABORT TP_RR_FAIL S5_GATE_CHECK poi=Yearly-POC dir=LONG. TPCENSUS #195/#196 bar=15:55 dir=LONG ref=1.16018 winner=Weekly-VWAP best=1.16019 distPts=1.
- 9/8-pm LOST rows (j35): :52048 TP_ELECT entry=1.16213 sl=1.16359 tp=1.16207 R=0.04; :52053 ABORT TP_RR_FAIL S5_GATE_CHECK poi=Monthly-POC dir=SHORT. TPCENSUS #219/#220 bar=16:40 dir=SHORT ref=1.16213 winner=Weekly-VWAP best=1.16207 distPts=6.

## T2 JUNE_B64 deal rows (j36 = j34, vols included)
- j36 A6FIRED x7 identical to j34 (5/27 r=9.67 sl=159.197; 6/2 r=25.73 sl=159.734; 6/3 r=1.35 sl=159.889; 6/4 r=2.31 sl=159.920; 6/5 16:15 r=1.44 sl=159.598; 6/10 r=1.48 sl=160.236; 6/11 r=2.74 sl=160.501).
- j36 deals #2-#15: buy 1.08 159.344 / sell 159.535; buy 4.03 159.774 / sell 159.900; buy 3.88 159.932 / sell 159.983; sell 3.25 159.868 / buy 159.920; buy 0.35 160.065 / sell 160.298; buy 0.84 160.436 / sell 160.529; buy 5.84 160.530 / sell 160.588. Balance 10775.32 = j34.

## T3 TIER_HITS census evidence
- j35 B64TGTC tag counts: VALID 143 / SWEPTLIVE 22 / TAKEN 279 / TIER 0 / ANCHOR 0 / ZONE 0 (per-bar groups: 8/28 10:00 n=79; 9/1 17:30 n=83; 9/7 09:15 n=91; 9/7 16:40 n=77; 9/8 10:05 n=114).
- j36 B64TGTC tag counts: TAKEN 131 / SWEPTLIVE 25 / VALID 47 / TIER 0.
- 8/28 10:00 sample head: PML 1.16459 R0.17 SWEPTLIVE, YPML same, YASL/ASL 1.16455 R0.26 SWEPTLIVE, LOL 1.16429 R0.88 SWEPTLIVE, NYL/YNYL/PDL 1.16364 R2.43 VALID, Yearly-VWAP 1.16322 R3.43 VALID, pool below TAKEN/VALID mixed, Monthly-VWAP 1.15864 R14.33 VALID.

## T3 per-candidate rows named in the relay (X27, 6/2, 6/5, 6/10)
- X27: no B63TGT/B64TGTC (aborted pre-FIRE); TPCENSUS + TP_ELECT + ABORT rows above. j33 (pre-hunk-T) B63TGT session side for reference: PML@1.16500 R0.32 SWEPTLIVE, YLOL/LOL@1.16475 R0.66 SWEPTLIVE, YNYL/PDL@1.16419 R1.42 SWEPTLIVE, NYL@1.16364 R2.16 SWEPTLIVE.
- 6/2 (j36 = j34: B63TGT cands=0, chosen DH20260430@160.723 R25.73; no TIER rows; fires same).
- 6/5 (j36 = j34: B63TGT cands=2 SWEPTLIVE, chosen DH20260430@160.723 R1.44; fires same at 16:15).
- 6/10 (j36 = j34: B63TGT cands=4 SWEPTLIVE, chosen DH20260430@160.723 R1.48; fires same at 16:10).

## D2 diff vs .B63DIAG (whole, 79 lines)
diff --git a/Experts/SRJ_FlowNexus_EA.mq5.B63DIAG b/Experts/SRJ_FlowNexus_EA.mq5.B64DIAG
index 5a12cc4..3bcabda 100644
--- a/Experts/SRJ_FlowNexus_EA.mq5.B63DIAG
+++ b/Experts/SRJ_FlowNexus_EA.mq5.B64DIAG
@@ -2642,8 +2642,10 @@ if(SrjUjPoolConsumable(uj_dk))
 for(int kf = 0; kf < POI_NLINES; kf++)
   {
    if(!UjPoiTargetValid(kf, g_anchorLine))
-     { if(InpDebugLog) PrintFormat("[SRJ-EA] UJPOISKIP bar=%s line=%s anchor=%s", TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES), g_lineCode[kf], (g_anchorLine >= 0 ? g_lineCode[g_anchorLine] : "none")); continue; }
-   if((g_authorityRank[kf] / 2) > (anchorRank / 2)) continue;
+      { if(InpDebugLog) PrintFormat("[SRJ-EA] UJPOISKIP bar=%s line=%s anchor=%s", TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES), g_lineCode[kf], (g_anchorLine >= 0 ? g_lineCode[g_anchorLine] : "none")); continue; }
+   //--- [B-64 hunk T] tier-rank skip removed: the nearest line competes whatever
+   //--- its rank (his s3:66 nearest word). Anchor/own-source exclusion above stays,
+   //--- zone guard inside TpTargetUpdateBest stays.
    double vf;
    if(!ReadBuf1(g_hPoi, kf, vf, barShift)) continue;
     TpTargetUpdateBest(vf, dir, currentPrice, best, haveBest, g_lineCode[kf], uj_dk, -1);
@@ -2790,9 +2792,10 @@ if(!haveBest)
           for(int k2 = 0; k2 < POI_NLINES; k2++)
             {
    if(!UjPoiTargetValid(k2, g_anchorLine))
-     { if(InpDebugLog) PrintFormat("[SRJ-EA] UJPOISKIP bar=%s line=%s anchor=%s", TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES), g_lineCode[k2], (g_anchorLine >= 0 ? g_lineCode[g_anchorLine] : "none")); continue; }
-             if((g_authorityRank[k2] / 2) > (anchorRank / 2)) continue;
-            double pv;
+      { if(InpDebugLog) PrintFormat("[SRJ-EA] UJPOISKIP bar=%s line=%s anchor=%s", TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES), g_lineCode[k2], (g_anchorLine >= 0 ? g_lineCode[g_anchorLine] : "none")); continue; }
+   //--- [B-64 hunk T] census mirror follows the race: tier-rank skip removed here too
+   //--- (print-only; keeps TPCENSUS admitted=/winner= honest after hunk T).
+             double pv;
             if(!ReadBuf1(g_hPoi, k2, pv, barShift)) continue;
             if(pv == EMPTY_VALUE) { nEmpty++; continue; }
             bool inDir = (dir == DIR_LONG) ? (pv > currentPrice) : (pv < currentPrice);
@@ -12310,7 +12313,7 @@ void B63TgtPrint(int b63_barShift, ENUM_SRJ_DIR b63_dir, double b63_entry,
   {
    string b63_bk = TimeToString(iTime(_Symbol, PERIOD_CURRENT, b63_barShift), TIME_DATE|TIME_MINUTES);
    double b63_risk = (b63_dir == DIR_LONG) ? (b63_entry - b63_sl) : (b63_sl - b63_entry);
-   string b63_cn[64]; double b63_cp[64]; double b63_cd[64]; double b63_cr[64]; string b63_ct[64];
+   string b63_cn[256]; double b63_cp[256]; double b63_cd[256]; double b63_cr[256]; string b63_ct[256];
    int b63_n = 0;
    const int b63_sb[18] = { FL_BUF_PDAY_HIGH, FL_BUF_PDAY_LOW,
                             FL_BUF_ASIA_HIGH, FL_BUF_ASIA_LOW,
@@ -12327,7 +12330,7 @@ void B63TgtPrint(int b63_barShift, ENUM_SRJ_DIR b63_dir, double b63_entry,
                                "YNYH", "YNYL", "YPMH", "YPML" };
    double b63_mask;
    if(!ReadFlow(FL_BUF_SWEPT_MASK, b63_mask, b63_barShift)) b63_mask = EMPTY_VALUE;
-   for(int b63_i = 0; b63_i < 18 && b63_n < 64; b63_i++)
+   for(int b63_i = 0; b63_i < 18 && b63_n < 256; b63_i++)
      {
       double b63_v;
       if(!ReadFlow(b63_sb[b63_i], b63_v, b63_barShift) || b63_v == EMPTY_VALUE || b63_v <= 0.0) continue;
@@ -12342,7 +12345,7 @@ void B63TgtPrint(int b63_barShift, ENUM_SRJ_DIR b63_dir, double b63_entry,
    string b63_dk = UjDayKey(iTime(_Symbol, PERIOD_CURRENT, b63_barShift));
    if(uj_pubState == UJ_POOL_READY && b63_dk != "" && uj_poolDayKey == b63_dk)
      {
-      for(int b63_u = 0; b63_u < ArraySize(uj_pool) && b63_n < 64; b63_u++)
+      for(int b63_u = 0; b63_u < ArraySize(uj_pool) && b63_n < 256; b63_u++)
         {
          double b63_pv = uj_pool[b63_u].value;
          if(b63_pv == EMPTY_VALUE || b63_pv <= 0.0) continue;
@@ -12371,7 +12374,7 @@ void B63TgtPrint(int b63_barShift, ENUM_SRJ_DIR b63_dir, double b63_entry,
         }
      }
    int b63_ar = (g_anchorLine >= 0) ? g_authorityRank[g_anchorLine] : INT_MAX;
-   for(int b63_k = 0; b63_k < POI_NLINES && b63_n < 64; b63_k++)
+   for(int b63_k = 0; b63_k < POI_NLINES && b63_n < 256; b63_k++)
      {
       double b63_v;
       if(!ReadBuf1(g_hPoi, b63_k, b63_v, b63_barShift)) continue;
@@ -12419,6 +12422,11 @@ void B63TgtPrint(int b63_barShift, ENUM_SRJ_DIR b63_dir, double b63_entry,
                b63_bk, DirName(b63_dir), DoubleToString(b63_entry, _Digits), DoubleToString(b63_sl, _Digits),
                DoubleToString(b63_risk, _Digits), b63_chosenSrc, DoubleToString(b63_chosenTp, _Digits), b63_chR,
                b63_nv, b63_nvR, b63_np, b63_npR, b63_n, b63_list);
+   //--- [B-64 DIAG print-only] B64TGTC: one row per candidate (never cut).
+   for(int b64_j = 0; b64_j < b63_n; b64_j++)
+      PrintFormat("[SRJ-EA] B64TGTC bar=%s dir=%s line=%s price=%s R=%.2f tags=%s",
+                  b63_bk, DirName(b63_dir), b63_cn[b64_j],
+                  DoubleToString(b63_cp[b64_j], _Digits), b63_cr[b64_j], b63_ct[b64_j]);
   }
 //--- history walker: builds temp pool over [2026.04.29, today]
 int SrjHistPoolBuild(SUjPoolRec &out[], string &achStart, int &dayCnt, int &famRead, int &unavail, int &emptyValid)

## D2 diff vs .preB64 (whole, 303 lines)

diff --git a/Experts/SRJ_FlowNexus_EA.mq5.preB64 b/Experts/SRJ_FlowNexus_EA.mq5.B64DIAG
index eca199a..3bcabda 100644
--- a/Experts/SRJ_FlowNexus_EA.mq5.preB64
+++ b/Experts/SRJ_FlowNexus_EA.mq5.B64DIAG
@@ -1099,6 +1099,9 @@ datetime         g_latchBarTime   = 0;
 //--- CONFIRM_DIV_WAIT rollback. Cleared in ResetSequence() and therefore a
 //--- working-set member (field 20, the membership rule).
 ENUM_SRJ_STATE   g_confirmFromState = ST_IDLE;
+//--- [B-61 C2] retest-candle OPEN TIME for term C: stamped at seed, converted
+//--- to a shift at the live confirmation gate (shifts go stale a pass later).
+datetime         g_b61RetestTime = 0;
 //--- [P-FRESH-S5OPP E1-K4 2026-09-18] S4 FRESH-OPP-abort veto, consume-on-fire:
 //--- stamped on abort, refuses at most one latch, zeroed as it refuses. BOUND/DAY
 //--- release (S4) and at the latch (E1d). ResetSequence-EXEMPT +
@@ -2335,7 +2338,8 @@ void ShadowConfirmPoll(const int barShift, const int anchorLine, const ENUM_SRJ_
 //---      touchAttr test with its +/- 1 point guard).
 //--- failTerm names the FIRST failed term ("" = all terms passed).
  bool IsConfirmationCandle(const int barShift, const int anchorLine,
-                           const ENUM_SRJ_DIR dir, string &failTerm, const bool allowReclaim = false)
+                           const ENUM_SRJ_DIR dir, string &failTerm, const bool allowReclaim = false,
+                           const int retestShift = -1)
   {
    failTerm = "";
    if(anchorLine < 0 || dir == DIR_NONE) { failTerm = "NO_ANCHOR"; return false; }
@@ -2385,9 +2389,27 @@ void ShadowConfirmPoll(const int barShift, const int anchorLine, const ENUM_SRJ_
     bool   isDoji  = (body < _Point * 0.0001);
     bool   bodyDir = (dir == DIR_LONG)  ? (c0 > o0) : (c0 < o0);
     if(isDoji || !bodyDir) { failTerm = "B_BODY"; if(n1_vw) g_n1_vwapInv++; if(n1_poc) g_n1_pocInv++; return false; }
-    bool touch = (h1 >= L - _Point && l1 <= L + _Point);
+    //--- [B-61 C2/C3] touch met by the potential's retest candle OR the candle just
+    //--- before the confirmation candle; exact touch, no guard (s7, s10, s5 no-tolerance).
+    //--- retestShift arrives via iBarShift on the stamped retest OPEN TIME (B-60 defect:
+    //--- a stored shift goes stale a pass later since shifts count from the forming bar).
+    double uj60_hR = h1, uj60_lR = l1;
+    if(retestShift >= 0 && retestShift != barShift + 1)
+      { uj60_hR = iHigh(_Symbol, PERIOD_CURRENT, retestShift); uj60_lR = iLow(_Symbol, PERIOD_CURRENT, retestShift); }
+    bool uj60_tR = (uj60_hR > 0.0 && uj60_hR >= L && uj60_lR <= L);
+    bool uj60_tP = (h1 >= L && l1 <= L);
+    bool touch = (uj60_tR || uj60_tP);
+    string uj60_cSrc = (uj60_tR && uj60_tP) ? "BOTH" : (uj60_tR ? "RETEST" : "PRIOR");
     if(!touch)      { failTerm = "C_TOUCH"; if(n1_vw) g_n1_vwapInv++; if(n1_poc) g_n1_pocInv++; return false; }
     if(n1_vw) g_n1_vwapSurv++; if(n1_poc) g_n1_pocSurv++;
+    //--- [B-61 C4] which candle satisfied C: retest time, computed shift, bar at shift, source.
+    if(InpDebugLog && retestShift >= 0)
+       PrintFormat("[SRJ-EA] B60C bar=%s dir=%s poi=%s rt=%s rSh=%d rBar=%s cSrc=%s - C satisfied by %s ([B-61 C2])",
+                   TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES),
+                   DirName(dir), g_lineCode[anchorLine],
+                   TimeToString(g_b61RetestTime, TIME_DATE|TIME_MINUTES), retestShift,
+                   TimeToString(iTime(_Symbol, PERIOD_CURRENT, retestShift), TIME_DATE|TIME_MINUTES), uj60_cSrc,
+                   (uj60_cSrc == "BOTH" ? "retest and prior candles" : (uj60_cSrc == "RETEST" ? "the retest candle" : "the prior candle")));
     return true;
   }
 
@@ -2620,8 +2642,10 @@ if(SrjUjPoolConsumable(uj_dk))
 for(int kf = 0; kf < POI_NLINES; kf++)
   {
    if(!UjPoiTargetValid(kf, g_anchorLine))
-     { if(InpDebugLog) PrintFormat("[SRJ-EA] UJPOISKIP bar=%s line=%s anchor=%s", TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES), g_lineCode[kf], (g_anchorLine >= 0 ? g_lineCode[g_anchorLine] : "none")); continue; }
-   if((g_authorityRank[kf] / 2) > (anchorRank / 2)) continue;
+      { if(InpDebugLog) PrintFormat("[SRJ-EA] UJPOISKIP bar=%s line=%s anchor=%s", TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES), g_lineCode[kf], (g_anchorLine >= 0 ? g_lineCode[g_anchorLine] : "none")); continue; }
+   //--- [B-64 hunk T] tier-rank skip removed: the nearest line competes whatever
+   //--- its rank (his s3:66 nearest word). Anchor/own-source exclusion above stays,
+   //--- zone guard inside TpTargetUpdateBest stays.
    double vf;
    if(!ReadBuf1(g_hPoi, kf, vf, barShift)) continue;
     TpTargetUpdateBest(vf, dir, currentPrice, best, haveBest, g_lineCode[kf], uj_dk, -1);
@@ -2768,9 +2792,10 @@ if(!haveBest)
           for(int k2 = 0; k2 < POI_NLINES; k2++)
             {
    if(!UjPoiTargetValid(k2, g_anchorLine))
-     { if(InpDebugLog) PrintFormat("[SRJ-EA] UJPOISKIP bar=%s line=%s anchor=%s", TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES), g_lineCode[k2], (g_anchorLine >= 0 ? g_lineCode[g_anchorLine] : "none")); continue; }
-             if((g_authorityRank[k2] / 2) > (anchorRank / 2)) continue;
-            double pv;
+      { if(InpDebugLog) PrintFormat("[SRJ-EA] UJPOISKIP bar=%s line=%s anchor=%s", TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES), g_lineCode[k2], (g_anchorLine >= 0 ? g_lineCode[g_anchorLine] : "none")); continue; }
+   //--- [B-64 hunk T] census mirror follows the race: tier-rank skip removed here too
+   //--- (print-only; keeps TPCENSUS admitted=/winner= honest after hunk T).
+             double pv;
             if(!ReadBuf1(g_hPoi, k2, pv, barShift)) continue;
             if(pv == EMPTY_VALUE) { nEmpty++; continue; }
             bool inDir = (dir == DIR_LONG) ? (pv > currentPrice) : (pv < currentPrice);
@@ -6634,8 +6659,9 @@ void ResetSequence()
    g_latchedTp      = 0.0;
    g_latchedR       = 0.0;
    g_latchBarTime   = 0;
-   g_confirmFromState = ST_IDLE;
-   //--- [P-BUILD3 E5] no new working-set field: the re-bind assigns anchor,
+    g_confirmFromState = ST_IDLE;
+    g_b61RetestTime = 0;   //--- [B-61 C2] no live potential, no retest time
+    //--- [P-BUILD3 E5] no new working-set field: the re-bind assigns anchor,
    //--- price, time, zone, touch, state, latch + confirmFrom only GÇö all are
    //--- existing members (fields 4/5/6, 11/12, 8/9/10, 0, 15-19, 20).
   }
@@ -8217,6 +8243,7 @@ void EvaluateClosedBar(int barShift, datetime barTime)
        g_dir           = S2ResolveLive(pr.isLong ? DIR_LONG : DIR_SHORT);
         SrjSideNote("DetectPoiRetest", g_dir);
       g_anchorBarTime = barTime;
+      g_b61RetestTime = barTime;   //--- [B-61 C2] the potential's retest candle OPEN TIME for term C
       ReadBuf1(g_hPoi, pr.topLine, g_anchorPrice, barShift);
       g_sessionAtEntry = sess;
       g_divLatch = false;
@@ -8549,6 +8576,31 @@ void EvaluateClosedBar(int barShift, datetime barTime)
             {
              if(InpDebugLog) PrintFormat("[SRJ-EA] UJDEFERAPPLY bar=%s dir=%s poi=%s - deferred LTF abort applies, holder unchanged (Fix S-a)", TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES), DirName(g_dir), AnchorStr());
              GoAbort(ABORT_LTF_MISALIGN, g_state);
+             //--- [B-61 C1] the formed setup is dead (row above; stamp cleared in
+             //--- ResetSequence). A fresh POI retest on this bar is NOT dropped
+             //--- with it: seed it as a new potential in the same pass (his
+             //--- 2026-10-07 ruling; the 5m read is checked at confirmation
+             //--- close per s11, never here).
+             PoiRetestResult uj60_pr;
+             bool uj60_found = DetectPoiRetest(barShift, uj60_pr) && uj60_pr.found;
+             if(uj60_found)
+               {
+                double uj60_ltfB = EMPTY_VALUE;
+                ReadFlow(FL_BUF_LTF_BIAS, uj60_ltfB, barShift);
+                if(InpDebugLog) PrintFormat("[SRJ-EA] B60POT bar=%s dir=%s poi=%s ltf=%s - fresh retest kept as potential despite 5m read ([B-61 C1])", TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES), (uj60_pr.isLong ? "LONG" : "SHORT"), g_lineCode[uj60_pr.topLine], (uj60_ltfB == EMPTY_VALUE ? "NA" : DoubleToString(uj60_ltfB, 1)));
+                s1g_legDir = uj60_pr.isLong ? 1 : -1;
+                g_s2_seedShift = barShift;
+                g_anchorLine = uj60_pr.topLine;
+                g_dir = S2ResolveLive(uj60_pr.isLong ? DIR_LONG : DIR_SHORT);
+                SrjSideNote("DetectPoiRetest", g_dir);
+                g_anchorBarTime = barTime;
+                g_b61RetestTime = barTime;
+                ReadBuf1(g_hPoi, uj60_pr.topLine, g_anchorPrice, barShift);
+                g_sessionAtEntry = sess;
+                g_divLatch = false;
+                g_state = ST_S1_REGIME;
+                LogState(ST_ABORT, g_state);
+               }
              return;
             }
           else
@@ -9132,7 +9184,8 @@ void EvaluateClosedBar(int barShift, datetime barTime)
           double uj_carryM15 = 0.0;
           bool uj_carryR = ReadFlow(FL_BUF_HTF_LOW, uj_carryM15, barShift);
           double uj_carryWant = (g_dir == DIR_LONG ? 1.0 : -1.0);
-          if(IsConfirmationCandle(barShift, g_anchorLine, g_dir, uj_carryTerm) && uj_carryR && uj_carryM15 == uj_carryWant)
+          int uj60_carryRSh = (g_b61RetestTime > 0 ? iBarShift(_Symbol, PERIOD_CURRENT, g_b61RetestTime, true) : -1);
+          if(IsConfirmationCandle(barShift, g_anchorLine, g_dir, uj_carryTerm, false, uj60_carryRSh) && uj_carryR && uj_carryM15 == uj_carryWant)
             {
              if(InpDebugLog) PrintFormat("[SRJ-EA] UJCONFIRMCARRY bankBar=%s fireBar=%s dir=%s poi=%s term=%s m15=%s - same-bar retest+confirm, S4 armed and firing same pass (Fix G1)", TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES), TimeToString(iTime(_Symbol, PERIOD_CURRENT, 0), TIME_DATE|TIME_MINUTES), DirName(g_dir), AnchorStr(), uj_carryTerm, DoubleToString(uj_carryM15, 1));
              ENUM_SRJ_STATE uj_cprev = g_state;
@@ -9147,7 +9200,8 @@ void EvaluateClosedBar(int barShift, datetime barTime)
              PrintFormat("[SRJ-EA] %s S3 waiting: no qualifying zone",
                          TimeToString(TimeCurrent(), TIME_DATE|TIME_SECONDS));
           string cfTermZ = "";
-          bool cfPassZ = IsConfirmationCandle(barShift, g_anchorLine, g_dir, cfTermZ);
+          int uj60_preRSh = (g_b61RetestTime > 0 ? iBarShift(_Symbol, PERIOD_CURRENT, g_b61RetestTime, true) : -1);
+          bool cfPassZ = IsConfirmationCandle(barShift, g_anchorLine, g_dir, cfTermZ, false, uj60_preRSh);
           //--- [P-UJIMPL-IMPL-1 v8 IE2] direction-alignment guard above design-E1
           //--- (buffer 21 = M15 confirmed vote; F251 preserved, changing it re-scopes).
             if(!cfPassZ) {
@@ -9330,7 +9384,8 @@ void EvaluateClosedBar(int barShift, datetime barTime)
          //--- alive and in-window. The touch fallback above STAYS (it sets
          //--- g_touchSeen - the retracement detection; unchanged).
          string cfTerm = "";
-         if(IsConfirmationCandle(barShift, g_anchorLine, g_dir, cfTerm))
+         int uj60_s4RSh = (g_b61RetestTime > 0 ? iBarShift(_Symbol, PERIOD_CURRENT, g_b61RetestTime, true) : -1);
+         if(IsConfirmationCandle(barShift, g_anchorLine, g_dir, cfTerm, false, uj60_s4RSh))
            {
             ENUM_SRJ_STATE prev = g_state;
             g_confirmFromState = prev;
@@ -10792,8 +10847,9 @@ void EvaluateClosedBar(int barShift, datetime barTime)
       int    uj_fireWage = -1;
         {
          string uj_bk9 = TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES);
-         double uj_frisk = 0.0, uj_freward = 0.0;
-         if(!SrjUjAssert1R(currentPrice, slRef, tpTarget, uj_bk9, "FIRE", uj_frisk, uj_freward, uj_fireR))
+          double uj_frisk = 0.0, uj_freward = 0.0;
+          B63TgtPrint(barShift, g_dir, currentPrice, slRef, tpTarget, (uj_memo_valid ? uj_memo_wsrc : uj_winnerSource));
+          if(!SrjUjAssert1R(currentPrice, slRef, tpTarget, uj_bk9, "FIRE", uj_frisk, uj_freward, uj_fireR))
            { GoAbort(ABORT_SUB_1R, g_state); return; }
          if(!uj_memo_valid || uj_memo_barTime != barTime || uj_memo_tp <= 0.0 || uj_memo_sl <= 0.0)
            { if(InpDebugLog) PrintFormat("[SRJ-EA] UJMEMO_FAIL bar=%s reason=NO_MEMO_AT_FIRE src=%s", uj_bk9, uj_memo_src); GoAbort(ABORT_NO_MEMO_AT_FIRE, g_state); return; }
@@ -12250,6 +12306,128 @@ bool SrjUjPoolConsumable(string dayKey)
   {
    return (uj_pubState == UJ_POOL_READY && dayKey != "" && uj_poolDayKey == dayKey);
   }
+//--- [B-63 DIAG print-only] B63TGT candidate census at the FIRE 1R decision.
+//--- Reads only (indicator buffers + globals); writes nothing, changes no logic.
+void B63TgtPrint(int b63_barShift, ENUM_SRJ_DIR b63_dir, double b63_entry,
+                 double b63_sl, double b63_chosenTp, string b63_chosenSrc)
+  {
+   string b63_bk = TimeToString(iTime(_Symbol, PERIOD_CURRENT, b63_barShift), TIME_DATE|TIME_MINUTES);
+   double b63_risk = (b63_dir == DIR_LONG) ? (b63_entry - b63_sl) : (b63_sl - b63_entry);
+   string b63_cn[256]; double b63_cp[256]; double b63_cd[256]; double b63_cr[256]; string b63_ct[256];
+   int b63_n = 0;
+   const int b63_sb[18] = { FL_BUF_PDAY_HIGH, FL_BUF_PDAY_LOW,
+                            FL_BUF_ASIA_HIGH, FL_BUF_ASIA_LOW,
+                            FL_BUF_LONDON_HIGH, FL_BUF_LONDON_LOW,
+                            FL_BUF_NY_HIGH, FL_BUF_NY_LOW,
+                            FL_BUF_PM_HIGH, FL_BUF_PM_LOW,
+                            FL_BUF_PD_ASIA_HIGH, FL_BUF_PD_ASIA_LOW,
+                            FL_BUF_PD_LONDON_HIGH, FL_BUF_PD_LONDON_LOW,
+                            FL_BUF_PD_NY_HIGH, FL_BUF_PD_NY_LOW,
+                            FL_BUF_PD_PM_HIGH, FL_BUF_PD_PM_LOW };
+   const string b63_sn[18] = { "PDH", "PDL", "ASH", "ASL", "LOH", "LOL",
+                               "NYH", "NYL", "PMH", "PML",
+                               "YASH", "YASL", "YLOH", "YLOL",
+                               "YNYH", "YNYL", "YPMH", "YPML" };
+   double b63_mask;
+   if(!ReadFlow(FL_BUF_SWEPT_MASK, b63_mask, b63_barShift)) b63_mask = EMPTY_VALUE;
+   for(int b63_i = 0; b63_i < 18 && b63_n < 256; b63_i++)
+     {
+      double b63_v;
+      if(!ReadFlow(b63_sb[b63_i], b63_v, b63_barShift) || b63_v == EMPTY_VALUE || b63_v <= 0.0) continue;
+      bool b63_in = (b63_dir == DIR_LONG) ? (b63_v > b63_entry) : (b63_v < b63_entry);
+      if(!b63_in) continue;
+      string b63_tag = "VALID";
+      if(TpSessionLevelFiltered(b63_i, b63_mask)) b63_tag = "SWEPTLIVE";
+      double b63_d = MathAbs(b63_v - b63_entry);
+      double b63_R = (b63_risk > 0.0) ? (b63_d / b63_risk) : -1.0;
+      b63_cn[b63_n] = b63_sn[b63_i]; b63_cp[b63_n] = b63_v; b63_cd[b63_n] = b63_d; b63_cr[b63_n] = b63_R; b63_ct[b63_n] = b63_tag; b63_n++;
+     }
+   string b63_dk = UjDayKey(iTime(_Symbol, PERIOD_CURRENT, b63_barShift));
+   if(uj_pubState == UJ_POOL_READY && b63_dk != "" && uj_poolDayKey == b63_dk)
+     {
+      for(int b63_u = 0; b63_u < ArraySize(uj_pool) && b63_n < 256; b63_u++)
+        {
+         double b63_pv = uj_pool[b63_u].value;
+         if(b63_pv == EMPTY_VALUE || b63_pv <= 0.0) continue;
+         bool b63_pin = (b63_dir == DIR_LONG) ? (b63_pv > b63_entry) : (b63_pv < b63_entry);
+         if(!b63_pin) continue;
+         bool b63_taken = false;
+         int b63_cb = iBarShift(_Symbol, PERIOD_CURRENT, uj_pool[b63_u].closure, false);
+         if(b63_cb > b63_barShift)
+           {
+            int b63_nn = b63_cb - b63_barShift;
+            if(uj_pool[b63_u].side == 0)
+              {
+               int b63_hb = iHighest(_Symbol, PERIOD_CURRENT, MODE_HIGH, b63_nn, b63_barShift);
+               if(b63_hb >= 0 && iHigh(_Symbol, PERIOD_CURRENT, b63_hb) > b63_pv) b63_taken = true;
+              }
+            else
+              {
+               int b63_lb = iLowest(_Symbol, PERIOD_CURRENT, MODE_LOW, b63_nn, b63_barShift);
+               if(b63_lb >= 0 && iLow(_Symbol, PERIOD_CURRENT, b63_lb) < b63_pv) b63_taken = true;
+              }
+           }
+         string b63_ptag = (b63_taken ? "TAKEN" : "VALID");
+         double b63_pd = MathAbs(b63_pv - b63_entry);
+         double b63_pR = (b63_risk > 0.0) ? (b63_pd / b63_risk) : -1.0;
+         b63_cn[b63_n] = uj_pool[b63_u].source; b63_cp[b63_n] = b63_pv; b63_cd[b63_n] = b63_pd; b63_cr[b63_n] = b63_pR; b63_ct[b63_n] = b63_ptag; b63_n++;
+        }
+     }
+   int b63_ar = (g_anchorLine >= 0) ? g_authorityRank[g_anchorLine] : INT_MAX;
+   for(int b63_k = 0; b63_k < POI_NLINES && b63_n < 256; b63_k++)
+     {
+      double b63_v;
+      if(!ReadBuf1(g_hPoi, b63_k, b63_v, b63_barShift)) continue;
+      if(b63_v == EMPTY_VALUE || b63_v <= 0.0) continue;
+      bool b63_in = (b63_dir == DIR_LONG) ? (b63_v > b63_entry) : (b63_v < b63_entry);
+      if(!b63_in) continue;
+      string b63_tag = "VALID";
+      if(b63_k == g_anchorLine) b63_tag = "ANCHOR";
+      else if((g_authorityRank[b63_k] / 2) > (b63_ar / 2)) b63_tag = "TIER";
+      else if(g_zoneHi > 0.0 && g_zoneLo > 0.0 && b63_v >= g_zoneLo && b63_v <= g_zoneHi) b63_tag = "ZONE";
+      double b63_d = MathAbs(b63_v - b63_entry);
+      double b63_R = (b63_risk > 0.0) ? (b63_d / b63_risk) : -1.0;
+      b63_cn[b63_n] = g_lineCode[b63_k]; b63_cp[b63_n] = b63_v; b63_cd[b63_n] = b63_d; b63_cr[b63_n] = b63_R; b63_ct[b63_n] = b63_tag; b63_n++;
+     }
+   for(int b63_a = 0; b63_a < b63_n - 1; b63_a++)
+     {
+      for(int b63_b = b63_a + 1; b63_b < b63_n; b63_b++)
+        {
+         if(b63_cd[b63_b] < b63_cd[b63_a])
+           {
+            string b63_tn = b63_cn[b63_a]; b63_cn[b63_a] = b63_cn[b63_b]; b63_cn[b63_b] = b63_tn;
+            double b63_td = b63_cp[b63_a]; b63_cp[b63_a] = b63_cp[b63_b]; b63_cp[b63_b] = b63_td;
+            b63_td = b63_cd[b63_a]; b63_cd[b63_a] = b63_cd[b63_b]; b63_cd[b63_b] = b63_td;
+            b63_td = b63_cr[b63_a]; b63_cr[b63_a] = b63_cr[b63_b]; b63_cr[b63_b] = b63_td;
+            b63_tn = b63_ct[b63_a]; b63_ct[b63_a] = b63_ct[b63_b]; b63_ct[b63_b] = b63_tn;
+           }
+        }
+     }
+   string b63_list = "";
+   for(int b63_j = 0; b63_j < b63_n; b63_j++)
+      b63_list += ((b63_j > 0) ? "," : "") + b63_cn[b63_j] + "@" + DoubleToString(b63_cp[b63_j], _Digits) + ":R" + DoubleToString(b63_cr[b63_j], 2) + ":" + b63_ct[b63_j];
+   double b63_chR = (b63_risk > 0.0 && b63_chosenTp > 0.0) ? (MathAbs(b63_chosenTp - b63_entry) / b63_risk) : -1.0;
+   string b63_nv = "NONE"; double b63_nvR = -1.0;
+   string b63_np = "NONE"; double b63_npR = -1.0;
+   for(int b63_j = 0; b63_j < b63_n; b63_j++)
+     {
+      bool b63_isPoi = (StringFind(b63_cn[b63_j], "POC") >= 0 || StringFind(b63_cn[b63_j], "VWAP") >= 0);
+      if(b63_nv == "NONE" && b63_ct[b63_j] == "VALID")
+        { b63_nv = b63_cn[b63_j] + "@" + DoubleToString(b63_cp[b63_j], _Digits); b63_nvR = b63_cr[b63_j]; }
+      if(b63_np == "NONE" && b63_isPoi)
+        { b63_np = b63_cn[b63_j] + "@" + DoubleToString(b63_cp[b63_j], _Digits); b63_npR = b63_cr[b63_j]; }
+      if(b63_nv != "NONE" && b63_np != "NONE") break;
+     }
+   PrintFormat("[SRJ-EA] B63TGT bar=%s dir=%s entry=%s sl=%s risk=%s chosen=%s@%s:R%.2f nearestValid=%s:R%.2f nearestPoi=%s:R%.2f cands=%d [%s]",
+               b63_bk, DirName(b63_dir), DoubleToString(b63_entry, _Digits), DoubleToString(b63_sl, _Digits),
+               DoubleToString(b63_risk, _Digits), b63_chosenSrc, DoubleToString(b63_chosenTp, _Digits), b63_chR,
+               b63_nv, b63_nvR, b63_np, b63_npR, b63_n, b63_list);
+   //--- [B-64 DIAG print-only] B64TGTC: one row per candidate (never cut).
+   for(int b64_j = 0; b64_j < b63_n; b64_j++)
+      PrintFormat("[SRJ-EA] B64TGTC bar=%s dir=%s line=%s price=%s R=%.2f tags=%s",
+                  b63_bk, DirName(b63_dir), b63_cn[b64_j],
+                  DoubleToString(b63_cp[b64_j], _Digits), b63_cr[b64_j], b63_ct[b64_j]);
+  }
 //--- history walker: builds temp pool over [2026.04.29, today]
 int SrjHistPoolBuild(SUjPoolRec &out[], string &achStart, int &dayCnt, int &famRead, int &unavail, int &emptyValid)
   {
