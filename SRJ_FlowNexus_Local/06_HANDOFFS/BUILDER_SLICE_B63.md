# BUILDER SLICE B-63 - raws behind R1-R4, D2 diffs, T1-T5 tables (j33 65F4613A EA 7985480D; j34 2FF37F24 EA 7985480D; code refs on restored EA D00F93BB unless noted)

## R1 record-first hits raw (file:line; verbatim vs paraphrase marked)
- Skill s11:130 W1 VERBATIM (2026-10-04): "27 aug NY: Skip cause the nearest target is the D VWAP which is less than 1R. i assume you or the EA behave like this because the nuance rule on the POC gap that the hierarchy is higher than VWAP, that is only when the VWAP jump or change the bias from the break of candle body closure. so please separate this nuance rule. also why did it exit on 17:15? the D VWAP has not been retested. if this is due to your SL, where did you put it? is it not at 16:25 high? i journaled this trade as invalid. is this due to your wiggle room because the candle almost nearly but not yet touch the D VWAP."
- Skill s11:136 8/27-NY-INVALID (amended point, paraphrase-record): nearest valid target was the D VWAP, below 1R, so the setup is skipped - instance of NEAREST-ONLY-TP plus the 1R floor.
- Skill s11:137 POC-OVER-VWAP-SCOPE (his order verbatim "so please separate this nuance rule.", paraphrase-record around it): POC outranks VWAP ONLY in the gap case.
- Skill s5:89 NEAREST-ONLY-TP, his words VERBATIM (2026-09-25): "there is no such thing as no profit target, there is only target there is closer than 1R to then rejected."
- Skill s1:31 R-AT-OPEN, his words VERBATIM (2026-09-26): "entry open."
- Skill s2:44 R boundary (paraphrase-record of his 2026-09-22 words): flat 1.0 is valid, 0.99 below 1R is not.
- Skill s1:32 MANAGE-NEAREST, his words VERBATIM (2026-09-26 + EXITMODEL-1 Q6): "yes, the nearest because price is dynamic so which ever valid TP target is the nearest, even if less than 1R after the entry and revision" (entry rejects sub-1R; management exits nearest even revised below).
- Skill s10:126 TAKEN-LINE-NOT-A-TARGET (spec 3.7 L187 VERBATIM): "A target is valid unless (a) already swept as session liquidity, or (b) closed over".
- Skill s12:147 8/27-NY-ORDINARY (paraphrase-record of his A-Q1): D VWAP about 1.16500 under the 1.16524 entry 17:00-17:10, no body close through, NOT a gap, ordinary race.
- Journal row 302 (csv file line 1054; record + W1 VERBATIM inside): "INVALID 17:05 SHORT off Daily POC; nearest valid target D VWAP below 1R so skipped (NEAREST-ONLY-TP + 1R floor); EA j3 fired this as deal #2 at 1.16524; his words 2026-10-04 (W1): [full W1 verbatim as s11:130]".
- Journal row 305 (csv file line 1057; A-Q1 VERBATIM inside): R2 gap answer + "no, it does not categorized as jump. jump or gap is just when the POI lines either from POC and VWAP that was for example bullish upon a setup but then as price develop, the POI line broke the price candle body closure to the flip its bias to become bearish. i call it jump or gap especially referring to the POC because it can quickly changed value from one point to another, unlike the gradual VWAP." + A-Q2 VERBATIM: "not that the VWAP never flipped bias, it rarely but still could. it still flip the POI bias when it broke the candlestick body closure."
- Register section C line 40 (paraphrase-record): "27 Aug take (tester-only): ruled INVALID entry by him (last valid retest 18:05, dead by 18:10/18:15 closes)."
- Findings RETEST-INVALIDATION-V1:37 Ruling 3 VERBATIM (2026-09-26): "8/27 that is the correct exit, but the entry is WRONG! the last valid retest is at 18:05 and the bearish retest is invalidated by breaking it with a candle body close at 18:10 and 18:15."
- Findings grep "1R|nearest target|D VWAP|skip": zero hits (that file is break-invalidation only).
- Ledger 1159 VERBATIM (W1 whole, banked 2026-10-04); 1160 (scope order VERBATIM "so please separate this nuance rule."); 1166 (8/27-NY-ORDINARY bank 2026-10-05).
- ONE_R_HIS = FOUND.

## R2 code + X27 rows raw
- EA:2461-2484 TpTargetUpdateBest (nearest in-direction wins; skips EMPTY/wrong-direction/in-zone). EA:2574-2628 race (session swept/live filter; pool taken skip; POI anchor-exclusion UjPoiTargetValid EA:2486-2495 + tier-rank skip EA:2624 `(g_authorityRank[kf]/2) > (anchorRank/2)` + zone guard EA:2479). EA:12226-12247 SrjUjAssert1R (R=reward/risk, ok = reward >= risk; prints UJ1R verdict PASS/FAIL). EA:10775-10776 FIRELOCAL GoAbort(ABORT_SUB_1R); EA:10796-10797 FIRE GoAbort(ABORT_SUB_1R). Authority ranks EA:93-104 (Yearly-VWAP 3, Monthly 6/7, Weekly 8/9, Daily 10/11).
- j32:11672 UJ1R POLL bar=2026.08.27 17:00 entry=1.16524 sl=1.16652 tp=1.16322 risk=0.00128 reward=0.00202 R=1.58 PASS. j32:11919 UJ1R FIRE entry=1.16524 sl=1.16598 tp=1.16322 risk=0.00074 reward=0.00202 R=2.73 PASS. j32:11660/11779 TPCENSUS #60/#61 bar=17:00 dir=SHORT ref=1.16524 winner=Yearly-VWAP best=1.16322 distPts=202. j32:11913 TP_ELECT entry=1.16524 sl=1.16598 tp=1.16322 R=2.73. j32:11920 UJMEMO_PASS entry=1.16524 tp=1.16322 sl=1.16652 R=1.58 src=POLL wsrc=Yearly-VWAP. j32:11921 MTSNAP bar=17:00 dir=SHORT anchor=Weekly-VWAP entry=1.16524 sl=1.16598 tp=1.16322.
- j32:11579 UJBARMAP bar=17:00 o=1.16538 h=1.16542 l=1.16514 c=1.16526 mpoc=1.15424 mvwap=1.15847 wpoc=1.16552 wvwap=1.16565 dpoc=1.16541 dvwap=1.16498 ltf=-1.0. j32:11938 UJBARMAP bar=17:05 dvwap=1.16499.
- Tier math: anchor Weekly-VWAP rank 9 -> tier 4; Daily-VWAP rank 11 -> tier 5; 5 > 4 -> skip (EA:2624). Zone at 17:00: S3INPLAY zoneLo=1.16612 zoneHi=1.16640 (j32 SL_REF/ZONEPICK rows) - Daily-VWAP 1.16498 outside. UJPOISKIP fires only for anchor (j32:11549/11658-11659 Weekly-VWAP only).
- X27_TARGET = CODE_SKIPS_NEAREST.

## R3 direction rows raw
- j32:11118 ANCHOR_ELECT bar=16:25 action=SEED poi=Weekly-VWAP rank=9 tier=4 dir=LONG. j32 UJRESEED (16:40 pass): bar=16:35 poi=Weekly-VWAP dir=SHORT fromPoi=Weekly-VWAP fromDir=LONG al=0 ok=1. j32:11155 STATE S1_REGIME->S2_LTF_ALIGN dir=SHORT poi=Weekly-VWAP (16:40 pass).
- Code: EA:7960-7985 UJRESEED (opposite retest over unconfirmed S1 holder: `g_dir = S2ResolveLive(...)` EA:7969, anchor re-stamped, memo cleared); EA:7987-8013 SIDE1C_PREEMPT (`g_dir = t78_dir`, no state write).
- His: findings:6 Ruling 1 VERBATIM (2026-09-25): "the 16:05 is a valid retest but it broke the POI lines before the confirmation entry candle close so the retest is invalidated. although the +1 retest does not matter, it only matter if the scenatio is breaking the bias of the POI lines by breaking it with a candle body close, essentially breaking the POI bias." findings:37 Ruling 3 VERBATIM (above). Skill grep bullish/bearish retest|from above|from below|broken|invalidated by breaking: zero. Journal same: zero. Register: only "in-bias FVG invalidated" (sec C, other topic). Ledger grep bullish/bearish retest|invalidated by breaking: zero.
- DIR_CARRY_HIS = FOUND (scoped). Correction: 16:30 close 1.16565 through Weekly-VWAP 1.16566 breaks against the LONG seed.

## R4 j29 provenance raw
- j29:29 "expert file added: Experts\SRJ_FlowNexus_EA.ex5. 459026 bytes loaded". j29:92 "SRJ BUILD 2026.10.04 20:52:13 refOk=invOnly diag=v9_perm" (same stamp j27:89/j28:89 - stamp cannot distinguish builds). j29 UJBARMAP count 4320. j28/j29 same 459026-byte binary; j27 loads 457482 (pre-edit binary).
- .preB58 SHA 958D5AA1, UJBARMAP count 0. .B58DIAG SHA D00F93BB, UJBARMAP present. Disk EA D00F93BB UJBARMAP present; .B61DIAG 5BFBF504 present.
- j29 header window: "testing of Experts\SRJ_FlowNexus_EA.ex5 from 2026.05.25 00:00 to 2026.06.13 00:00". j29 balance row: "final balance 10395.28 USD", "740873 ticks, 4320 bars".
- J29_EA = D00F93BB. B-62 T2/R5 "j29 EA 958D5AA1" corrected (quotes a B-57 pre-edit line; B-58 files j29 under D00F93BB).

## D2 SHAs + compile
- .preB63 D00F93BB (683671 B). EA after D1 = 5BFBF504. Compile B63TGT build: Result 0 errors, 0 warnings. .B63DIAG 7985480D (694644 B). ex5 at run time ECCDD997 (469934 B). Restored EA D00F93BB (683671 B), rebuilt 0/0, ex5 84B361C1 (458564 B).
- Diffs follow whole (vs .B61DIAG 140 lines; vs .preB63 271 lines).

## T1 deal tables
- j33 A6FIRED x8: 8/27 17:05 SHORT tp=1.16322 r=2.73 sl=1.16598 + 7 takes (8/28 10:05 tp=1.16364 r=2.43 sl=1.16508; 9/1 17:35 tp=1.16077 r=1.17 sl=1.15975; 9/4 16:00 tp=1.16302 r=1.66 sl=1.15847; 9/7 09:20 tp=1.16200 r=1.76 sl=1.16098; 9/7 16:45 tp=1.16315 r=2.34 sl=1.16238; 9/8 10:10 tp=1.16102 r=1.94 sl=1.16258; 9/8 17:00 tp=1.16114 r=1.96 sl=1.16274). j28 A6FIRED x7: same 7 (bar/side/tp/r/sl identical).
- j33 deals: #2 sell 1.16524 / #3 buy 1.16517 (X27); #4 sell 1.16466 / #5 buy 1.16440; #6 buy 1.16024 / #7 sell 1.15975; #8 buy 1.16019 / #9 sell 1.16129; #10 buy 1.16138 / #11 sell 1.16201; #12 buy 1.16264 / #13 sell 1.16315; #14 sell 1.96 1.16205 / #15 buy 1.96 1.16102; #16 sell 1.96 1.16220 / #17 buy 1.96 1.16275. j28 deals #2-#15: same times/sides/prices (vols 1.95 on 9/8). Balance j33 10484.57 = j32.
- j34 A6FIRED x7: 5/27 15:35 LONG tp=160.723 r=9.67 sl=159.197; 6/2 15:35:08 LONG tp=160.723 r=25.73 sl=159.734; 6/3 09:10 LONG tp=159.983 r=1.35 sl=159.889; 6/4 09:55 SHORT tp=159.748 r=2.31 sl=159.920; 6/5 16:15 LONG tp=160.723 r=1.44 sl=159.598; 6/10 16:10 LONG tp=160.723 r=1.48 sl=160.236; 6/11 14:40:22 LONG tp=160.587 r=2.74 sl=160.501. j29 A6FIRED x5: 5/27 (same), 6/3 (same), 6/4 (same), 6/5 16:55 LONG tp=160.723 r=1.56 sl=159.726, 6/11 (same).
- j34 deals: #2 buy 159.344 / #3 sell 159.535; #4 buy 159.774 / #5 sell 159.900 (6/2 EXTRA); #6 buy 159.932 / #7 sell 159.983; #8 sell 159.868 / #9 buy 159.920; #10 buy 160.065 / #11 sell 160.298 (B2); #12 buy 160.436 / #13 sell 160.529 (6/10 EXTRA); #14 buy 160.530 / #15 sell 160.588. j29 deals: #2/#3 same prices; #4 buy 159.932 / #5 sell 159.983 (vol 3.75 vs 3.88); #6 sell 159.868 / #7 buy 159.920 (3.15 vs 3.25); #8 buy 160.120 / #9 sell 160.298 (M1655, vol 0.41); #10 buy 160.530 / #11 sell 160.588 (5.63 vs 5.84). Balance j34 10775.32 vs j29 10395.28.

## T2/T3 B63TGT + fire rows raw
- X27 j33: B63TGT bar=17:00 dir=SHORT entry=1.16524 sl=1.16598 risk=0.00074 chosen=Yearly-VWAP@1.16322:R2.73 nearestValid=LIVE@1.15700:R11.14 nearestPoi=NONE:R-1.00 cands=64 [PML@1.16500:R0.32:SWEPTLIVE,YPML@1.16500:R0.32:SWEPTLIVE,YLOL@1.16475:R0.66:SWEPTLIVE,LOL@1.16475:R0.66:SWEPTLIVE,YNYL@1.16419:R1.42:SWEPTLIVE,PDL@1.16419:R1.42:SWEPTLIVE,NYL@1.16364:R2.16:SWEPTLIVE,LIVE@1.16141:R5.18:TAKEN,... (line cut at 537 chars; cands=64 cap artifact - POI loop unreached, nearestPoi/nearestValid fields not the race outcome).
- B2 j34:33621 B60POT bar=16:00 dir=LONG poi=Monthly-POC ltf=-1.0. j34:33843 B60C bar=16:10 dir=LONG poi=Monthly-POC rt=16:00 rSh=3 rBar=16:00 cSrc=RETEST. j34:34221 TP_ELECT entry=160.059 sl=159.598 tp=160.723 R=1.44. j34:34224 A6FIRED bar=16:10 dir=LONG tp=160.723 r=1.44 sl=159.598. j34:34227 B63TGT bar=16:10 dir=LONG entry=160.059 sl=159.598 risk=0.461 chosen=DH20260430@160.723:R1.44 nearestValid=NONE nearestPoi=NONE cands=2 [PDH@160.074:R0.03:SWEPTLIVE,NYH@160.262:R0.44:SWEPTLIVE]. j34:34228 UJ1R FIRE R=1.44 PASS. j34:34229 UJMEMO_PASS entry=160.059 tp=160.723 sl=159.881 R=3.73 src=POLL wsrc=DH20260430 wday=2026.04.30. j34:34230 MTSNAP anchor=Monthly-POC entry=160.059 sl=159.598 tp=160.723. j34:34236 deal #10 buy 0.35 at 160.065. j34:34723 UJRETARGET 19:00 oldTp=160.723 newTp=160.298. j34:34754 deal #11 sell 0.35 at 160.298.
- 6/2 j34:22286 ANCHOR_ELECT bar=14:20 poi=Monthly-POC rank=6 tier=3 dir=LONG. j34:22295 S1->S2 14:25:11 dir=LONG. j34:24543 B60C bar=15:30 dir=LONG poi=Monthly-POC rt=14:20 rSh=15 cSrc=RETEST. j34:24511/24669 TPCENSUS #70/#71 bar=15:30 ref=159.771 winner=NONE best=160.723 distPts=952 empties=6. j34:24523 UJ1R POLL R=10.24 (sl=159.678). j34:24766 TP_ELECT entry=159.771 sl=159.734 tp=160.723 R=25.73. j34:24773 UJ1R FIRE R=25.73 PASS. j34:24774 UJMEMO_PASS wsrc=DH20260430 wday=2026.04.30. j34:24775 MTSNAP anchor=Monthly-POC entry=159.771 sl=159.734 tp=160.723. B63TGT bar=15:30 entry=159.771 sl=159.734 risk=0.037 chosen=DH20260430@160.723:R25.73 nearestValid=NONE nearestPoi=NONE cands=0 []. j34:24781 deal #4 buy 4.03 at 159.774. j34:25393 UJRETARGET 19:00 newTp=159.900. j34:25437 deal #5 sell 4.03 at 159.900. j34:22295 S2WAIT 14:20 sess=NYAM (seed 5m unaligned retained).
- 6/10 j34:45528 ANCHOR_ELECT bar=15:30 poi=Daily-POC rank=10 tier=5 dir=LONG. j34:45538 S1->S2 15:35 dir=LONG. j34:46965 B60C bar=16:05 dir=LONG poi=Daily-POC rt=15:30 rSh=8 cSrc=RETEST. B63TGT bar=16:05 entry=160.432 sl=160.236 risk=0.196 chosen=DH20260430@160.723:R1.48 nearestValid=NONE nearestPoi=NONE cands=4 [ASH@160.435:R0.02:SWEPTLIVE,YASH@160.435:R0.02:SWEPTLIVE,PDH@160.443:R0.06:SWEPTLIVE,NYH@160.529:R0.49:SWEPTLIVE]. j34:47275 deal #12 buy 0.84 at 160.436. j34:47806 UJRETARGET 19:00 newTp=160.529. j34:48023 deal #13 sell 0.84 at 160.529. SIGNAL rows: 6/2 sess=NYAM tp_R=25.73; 6/10 sess=NYAM tp_R=1.48.
- 6/2 UJBARMAP: 14:20 o=159.721 h=159.727 l=159.716 c=159.727 mpoc=159.717 ltf=-1.0; 14:25-15:25 all lows >=159.728 closes >=159.730 (no touch/re-touch of 159.717, no close through); 15:30 o=159.754 h=159.769 l=159.752 c=159.767 ltf=1.0.
- 6/10 UJBARMAP: 15:30 o=160.421 h=160.468 l=160.333 c=160.392 dpoc=160.354 ltf=-1.0; 15:35 l=160.385, 15:40 l=160.389, 15:55 l=160.396 c=160.437 ltf=1.0, 16:00 l=160.426, 16:05 o=160.428 h=160.455 l=160.426 c=160.434 ltf=1.0 (no re-touch of 160.354, no close through).
- M1655 absence: j34 16:50-17:05 only UJPROBE + SEEDDIAG retestFound=-1 (j34:34377); j29 16:55 A6FIRED/deal #8 buy 160.120 (j29:39825/39836/39841).

## T5 5-June rows raw (j34)
- 15:55 o=160.146 h=160.219 l=160.125 c=160.212 ltf=1.0; book 0; all Lno-penetration; S3 holder (FRESHSKIP 16:00-pass state=S3_ZONE_WAIT poi=Monthly-POC); UJ1R POLL R1.51 PASS (j34:33414).
- 16:00 o=160.216 h=160.262 l=159.726 c=160.034 ltf=-1.0; book 6 (all six LHIT); UJDEFERABORT (j34:33448) -> ABORT LTF_MISALIGN (j34:33617) -> B60POT (j34:33621) -> S1 (j34:33622); UJ1R POLL R3.42 (j34:33604).
- 16:05 o=160.032 h=160.086 l=159.992 c=160.008 ltf=1.0; book 0; S1; CONFIRMPOLL touchAttr=1 confirm=0 (j34:33638, as printed).
- 16:10 o=160.009 h=160.062 l=159.981 c=160.058 ltf=1.0; book 0; B60C (j34:33843); UJ1R POLL R3.73 (j34:33823); B63TGT (j34:34227); FIRE R1.44 (j34:34228).
- 16:15 o=160.059: A6FIRED (j34:34224); deal #10 (j34:34236).
- 16:20 o=160.071 h=160.166 l=160.053 c=160.161 ltf=1.0; managing, no rows.
- Pre-window: j34:33048 S1->S2 15:50 dir=LONG poi=Monthly-POC (15:25 setup holder).

## D2 diff vs .B61DIAG (whole, 140 lines)
diff --git a/Experts/SRJ_FlowNexus_EA.mq5.B61DIAG b/Experts/SRJ_FlowNexus_EA.mq5.B63DIAG
index 3f73984..5a12cc4 100644
--- a/Experts/SRJ_FlowNexus_EA.mq5.B61DIAG
+++ b/Experts/SRJ_FlowNexus_EA.mq5.B63DIAG
@@ -10844,8 +10844,9 @@ void EvaluateClosedBar(int barShift, datetime barTime)
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
@@ -12302,6 +12303,123 @@ bool SrjUjPoolConsumable(string dayKey)
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
+   string b63_cn[64]; double b63_cp[64]; double b63_cd[64]; double b63_cr[64]; string b63_ct[64];
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
+   for(int b63_i = 0; b63_i < 18 && b63_n < 64; b63_i++)
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
+      for(int b63_u = 0; b63_u < ArraySize(uj_pool) && b63_n < 64; b63_u++)
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
+   for(int b63_k = 0; b63_k < POI_NLINES && b63_n < 64; b63_k++)
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
+  }
 //--- history walker: builds temp pool over [2026.04.29, today]
 int SrjHistPoolBuild(SUjPoolRec &out[], string &achStart, int &dayCnt, int &famRead, int &unavail, int &emptyValid)
   {

## D2 diff vs .preB63 (whole, 271 lines)

diff --git a/Experts/SRJ_FlowNexus_EA.mq5.preB63 b/Experts/SRJ_FlowNexus_EA.mq5.B63DIAG
index eca199a..5a12cc4 100644
--- a/Experts/SRJ_FlowNexus_EA.mq5.preB63
+++ b/Experts/SRJ_FlowNexus_EA.mq5.B63DIAG
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
 
@@ -6634,8 +6656,9 @@ void ResetSequence()
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
@@ -8217,6 +8240,7 @@ void EvaluateClosedBar(int barShift, datetime barTime)
        g_dir           = S2ResolveLive(pr.isLong ? DIR_LONG : DIR_SHORT);
         SrjSideNote("DetectPoiRetest", g_dir);
       g_anchorBarTime = barTime;
+      g_b61RetestTime = barTime;   //--- [B-61 C2] the potential's retest candle OPEN TIME for term C
       ReadBuf1(g_hPoi, pr.topLine, g_anchorPrice, barShift);
       g_sessionAtEntry = sess;
       g_divLatch = false;
@@ -8549,6 +8573,31 @@ void EvaluateClosedBar(int barShift, datetime barTime)
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
@@ -9132,7 +9181,8 @@ void EvaluateClosedBar(int barShift, datetime barTime)
           double uj_carryM15 = 0.0;
           bool uj_carryR = ReadFlow(FL_BUF_HTF_LOW, uj_carryM15, barShift);
           double uj_carryWant = (g_dir == DIR_LONG ? 1.0 : -1.0);
-          if(IsConfirmationCandle(barShift, g_anchorLine, g_dir, uj_carryTerm) && uj_carryR && uj_carryM15 == uj_carryWant)
+          int uj60_carryRSh = (g_b61RetestTime > 0 ? iBarShift(_Symbol, PERIOD_CURRENT, g_b61RetestTime, true) : -1);
+          if(IsConfirmationCandle(barShift, g_anchorLine, g_dir, uj_carryTerm, false, uj60_carryRSh) && uj_carryR && uj_carryM15 == uj_carryWant)
             {
              if(InpDebugLog) PrintFormat("[SRJ-EA] UJCONFIRMCARRY bankBar=%s fireBar=%s dir=%s poi=%s term=%s m15=%s - same-bar retest+confirm, S4 armed and firing same pass (Fix G1)", TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES), TimeToString(iTime(_Symbol, PERIOD_CURRENT, 0), TIME_DATE|TIME_MINUTES), DirName(g_dir), AnchorStr(), uj_carryTerm, DoubleToString(uj_carryM15, 1));
              ENUM_SRJ_STATE uj_cprev = g_state;
@@ -9147,7 +9197,8 @@ void EvaluateClosedBar(int barShift, datetime barTime)
              PrintFormat("[SRJ-EA] %s S3 waiting: no qualifying zone",
                          TimeToString(TimeCurrent(), TIME_DATE|TIME_SECONDS));
           string cfTermZ = "";
-          bool cfPassZ = IsConfirmationCandle(barShift, g_anchorLine, g_dir, cfTermZ);
+          int uj60_preRSh = (g_b61RetestTime > 0 ? iBarShift(_Symbol, PERIOD_CURRENT, g_b61RetestTime, true) : -1);
+          bool cfPassZ = IsConfirmationCandle(barShift, g_anchorLine, g_dir, cfTermZ, false, uj60_preRSh);
           //--- [P-UJIMPL-IMPL-1 v8 IE2] direction-alignment guard above design-E1
           //--- (buffer 21 = M15 confirmed vote; F251 preserved, changing it re-scopes).
             if(!cfPassZ) {
@@ -9330,7 +9381,8 @@ void EvaluateClosedBar(int barShift, datetime barTime)
          //--- alive and in-window. The touch fallback above STAYS (it sets
          //--- g_touchSeen - the retracement detection; unchanged).
          string cfTerm = "";
-         if(IsConfirmationCandle(barShift, g_anchorLine, g_dir, cfTerm))
+         int uj60_s4RSh = (g_b61RetestTime > 0 ? iBarShift(_Symbol, PERIOD_CURRENT, g_b61RetestTime, true) : -1);
+         if(IsConfirmationCandle(barShift, g_anchorLine, g_dir, cfTerm, false, uj60_s4RSh))
            {
             ENUM_SRJ_STATE prev = g_state;
             g_confirmFromState = prev;
@@ -10792,8 +10844,9 @@ void EvaluateClosedBar(int barShift, datetime barTime)
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
@@ -12250,6 +12303,123 @@ bool SrjUjPoolConsumable(string dayKey)
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
+   string b63_cn[64]; double b63_cp[64]; double b63_cd[64]; double b63_cr[64]; string b63_ct[64];
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
+   for(int b63_i = 0; b63_i < 18 && b63_n < 64; b63_i++)
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
+      for(int b63_u = 0; b63_u < ArraySize(uj_pool) && b63_n < 64; b63_u++)
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
+   for(int b63_k = 0; b63_k < POI_NLINES && b63_n < 64; b63_k++)
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
+  }
 //--- history walker: builds temp pool over [2026.04.29, today]
 int SrjHistPoolBuild(SUjPoolRec &out[], string &achStart, int &dayCnt, int &famRead, int &unavail, int &emptyValid)
   {
