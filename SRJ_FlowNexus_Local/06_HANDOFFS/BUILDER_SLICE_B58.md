# BUILDER SLICE B-58 - raw rows behind R1-R3, D3, C1/C2, T1 (EA D00F93BB DIAG-BAR, ex5 84F6CE11; j28 29BC5DBA; j29 FDD4D79A)

## R1 j27 rows raw (j27 DD3E6855, EA 958D5AA1; stamps are pass times, bar=/bar_key= the evaluated bar)
j27:35751 `[SRJ-EA] RETESTBOOK bar=2026.06.05 15:20 hits=2 ...`
j27:35755 `[SRJ-EA] CONFIRMPOLL bar=2026.06.05 15:20 anchor=Monthly-POC ...`
j27:35757 `[SRJ-EA] 2026.06.05 15:25:00 STATE IDLE->S1_REGIME dir=LONG poi=Monthly-POC`
j27:35758 `[SRJ-EA] ANCHOR_ELECT bar=2026.06.05 15:20 action=SEED poi=Monthly-POC rank=6 tier=3 dir=LONG`
j27:35759 `[SRJ-EA] SIDE1T_SEEDBIAS bar=2026.06.05 15:20 dir=LONG biasAligned=0 verdict=REJECT-BIAS-TIMING`
j27:35774 `[SRJ-EA] SUPPRESSED bar=2026.06.05 15:25 poi=Monthly-POC dir=LONG ... heldPoi=Monthly-POC heldDir=LONG heldState=S1_REGIME ... action=HELD`
j27:35797/35806/35818/35828 RETESTBOOK bars 15:30/15:35/15:40/15:45 hits=0
j27:35833 `[SRJ-EA] 2026.06.05 15:50:00 STATE S1_REGIME->S2_LTF_ALIGN dir=LONG poi=Monthly-POC`
j27:35834 `[SRJ-EA] 2026.06.05 15:50:00 STATE S2_LTF_ALIGN->S3_ZONE_WAIT dir=LONG poi=Monthly-POC`
j27:35861/36042 FRESHSKIP bars 15:50/15:55 reason=PRE_BINDING state=S3_ZONE_WAIT poi=Monthly-POC
j27:36004/36185 TPCENSUS #124/#125 bars 15:50/15:55 dir=LONG winner=NONE best=160.723
j27:36200 RETESTBOOK bar=15:55 hits=0; j27:36203 CONFIRMPOLL bar=15:55 anchor=Monthly-POC ...
j27:36228 `[SRJ-EA] LTFFLIP bar=2026.06.05 16:00 dir=LONG poi=Monthly-POC state=S3_ZONE_WAIT - LTF bias turned against the locked direction`
j27:36229 `[SRJ-EA] LTFDIAG bar=2026.06.05 16:00 dir=LONG state=S3_ZONE_WAIT kind=STRONG ok0=1 bias0=-1 ob0=1 fvg0=1 opp0=0 ok1=1 bias1=1 ob1=1 fvg1=1 opp1=0`
j27:36230 `[SRJ-EA] UJDEFERABORT bar=2026.06.05 16:00 dir=LONG poi=Monthly-POC state=S3_ZONE_WAIT - LTF opposed, abort deferred past evaluation (Fix S-a)`
j27:36231 `[SRJ-EA] FRESHSKIP bar=2026.06.05 16:00 dir=LONG state=S3_ZONE_WAIT poi=Monthly-POC reason=PRE_BINDING`
j27:36391 `[SRJ-EA] SUPPRESSED bar=2026.06.05 16:00 poi=Monthly-POC dir=LONG opp=0 higher=0 heldPoi=Monthly-POC heldDir=LONG heldState=S3_ZONE_WAIT cum_n=43 cum_opp=6 cum_hi=7 cum_both=3 action=HELD`
j27:36392 `[SRJ-EA] RETESTBOOK bar=2026.06.05 16:00 hits=6 Daily-POC:r10:dL Daily-VWAP:r11:dL Weekly-POC:r8:dL Weekly-VWAP:r9:dL Monthly-POC:r6:dL Monthly-VWAP:r7:dL`
j27:36393 `[SRJ-EA] UJDTTERMS bar=2026.06.05 16:00 Daily-POC=LHIT/Sbody-above Daily-VWAP=LHIT/Sbody-above Weekly-POC=LHIT/Sbody-above Weekly-VWAP=LHIT/Sbody-above Monthly-POC=LHIT/Sbody-above Monthly-VWAP=LHIT/Sbody-above`
j27:36395 `[SRJ-EA] CONFIRMPOLL bar=2026.06.05 16:00 anchor=Monthly-POC dir=LONG oppCandle=0 bodyDir=0 body=182pts doji=0 touchAttr=0 confirm=0 shadow=true`
j27:36374 `[SRJ-EA] TPCENSUS #126 bar=2026.06.05 16:00 dir=LONG ref=160.032 winner=NONE best=160.723 distPts=691 empties=6 admitted= PDH:42 NYH:230`
j27:36399 `[SRJ-EA] 2026.06.05 16:05:00 ABORT reason=LTF_MISALIGN state=S3_ZONE_WAIT poi=Monthly-POC dir=LONG`
j27:36400 `[SRJ-EA] A6REFUSED class=ABSENT_DECLINED bar=2026.06.05 16:05 state=S3_ZONE_WAIT dir=LONG predicate=LTF_MISALIGN`
j27:36401 `[SRJ-EA] 2026.06.05 16:05:00 STATE S3_ZONE_WAIT->ABORT dir=LONG poi=Monthly-POC`
j27:36410 `[SRJ-EA] 2026.06.05 16:10:00 SHADOW_CONVERT fail=LTF_MISALIGN dir=LONG poi=Monthly-POC opened=2026.06.05 15:20 barsToConvert=1 - would have been admitted under an order-independent model`
j27:36411 `[SRJ-EA] IDCHANGE bar=2026.06.05 16:05 inWin=1 state=IDLE dir=NONE xobId=0->3308 ...`
j27:36413/36419/36424/36429 RETESTBOOK bars 16:05/16:10/16:15/16:20 hits=0
j27:36414/36420/36425/36430 UJDTTERMS bars 16:05/16:10/16:15/16:20 Daily-POC=Lno-penetration ...
j27:36408/36417/36423/36428 UJPROBE bar_key=16:05/16:10/16:15/16:20 (ltf=+1.0 each)
- Alerts in window: j27 15:25/15:30 retest alerts + j27:36220 `Alert: USDJPY M5 - POI RETEST LONG at 159.885  [M-POC +5]` on the 16:05 pass; none 16:10-16:20.
- ANCHOR_ELECT/SEED scan 16:00-16:49: zero rows (next seed j27:36465 bar=16:45, the machine 16:55 trade). SESSION_LIMIT/branch=SESSION scan before 17:00: zero rows (first SESSION_LIMIT 17:00). RESEED_BLOCKED scan 6/05: zero rows.
- FIRST_BLOCKER_AFTER_ABORT = j27:36399 + j27:36401 (kill the live candidate) and j27:36413 RETESTBOOK hits=0 (first row showing no new LONG potential can form).

## R2 code raws (disk EA 958D5AA1)
(a) SHADOW block EA:7151-7192:
`//--- TASK 15: shadow re-evaluation. Read-only.` / `if(InpDebugLog && g_shadowActive)` / `{ g_shadowBars++; bool converted = false;` / `if(g_shadowFail == ABORT_NO_REGIME) { ... ClassifyRegime ... }` / `else { bool al; if(CheckLtfAlign(barShift, g_shadowDir, al) && al) converted = true; }` (EA:7176-7178) / `if(converted) { PrintFormat("[SRJ-EA] SHADOW_CONVERT fail=%s ... would have been admitted under an order-independent model", g_shadowFail, ...)`.
CheckLtfAlign EA:2428-2434: `bool CheckLtfAlign(int barShift, ENUM_SRJ_DIR dir, bool &alignedOut) { double ltfBias; if(!ReadFlow(FL_BUF_LTF_BIAS, ltfBias, barShift)) return false; alignedOut = ((int)MathRound(ltfBias) == ((dir == DIR_LONG) ? 1 : -1)); return true; }`
UJPROBE read EA:12328-12335: `if(!ReadFlow(FL_BUF_HTF_HIGH, h4, barShift)) ...; if(!ReadFlow(FL_BUF_LTF_BIAS, ltf, barShift)) ltf = EMPTY_VALUE;`
SAME_READ: same buffer FL_BUF_LTF_BIAS at the pass bar; at 16:10 both bullish (probe +1.0, shadow converts). The print's fail= is the stored abort reason.
(b) Seed path EA:8116-8198:
`bool s1f_seedArmed = (g_state == ST_IDLE);` (EA:8116) / `if(g_state == ST_IDLE)` (EA:8118) / window check (EA:8120) / `if(SessionAlreadyUsed(sess, barTime)) { ... SESSION_LIMIT ... return; }` (EA:8121-8137) / `if(!DetectPoiRetest(barShift, pr) || !pr.found) { ... branch=RETEST ... return; }` (EA:8138-8139) / eviction-bit gate EA:8140-8172 (`RESEED_BLOCKED ... action=SKIP`, EA:8165-8172) / seed writes + `g_state = ST_S1_REGIME` + `ANCHOR_ELECT ... action=SEED` print (EA:8173-8198).
RESEED_AFTER_ABORT = NOT_REACHED (DetectPoiRetest check EA:8138-8139 returns first; RETESTBOOK hits=0 on 16:05/16:10/16:15).
(c) CONFIRMPOLL/C_TOUCH:
Shadow terms EA:2286-2291: `term A oppCandle: the PRIOR candle closed AGAINST the direction ... term B bodyDir: the CURRENT candle closes IN the direction with any nonzero body ... term C touchAttr: the PRIOR candle touched the anchor line ... confirm = A && B && C.`
Live gate EA:2326-2335: `A the prior candle closed AGAINST dir; A2 RULED: the prior candle's CLOSE stays on the SETUP SIDE (wick through = retracement, CLOSE through = break; LONG: close >= line); B the current candle closes IN dir with any nonzero body; C the prior candle's range touched the line (+/- 1 point guard).`
IsConfirmationCandle EA:2337-2391: oppCandle (EA:2366-2367, fail A_OPP), closeSideOk + b38Reclaim (EA:2372-2374, fail A2_CLOSE_BREAK), body (EA:2384-2387, fail B_BODY), touch (EA:2388-2389, fail C_TOUCH), `return true` (EA:2391).

## R3 timing grep raws
- Skill "16:50": :116 (5M-FLIP-KILL ... 6/5-TIMING unquoted paraphrase), :151 (JUN05NY-ENTRY-1615 question text, not timing). No quoted verbatim.
- Findings `"16:50"`-quoted / `flipped bullish`: 0 hits.
- Journal: row 306 (his 16:15 entry), row 309 (entry POI) - neither on 5m timing.
- Ledger quoted `"16:50"`: 0 hits.
- TIMING_0605NY_VERBATIM = NOT_FOUND.

## D3 diff vs .preB58 raw (37 added, 0 removed)
diff --git a/Experts/SRJ_FlowNexus_EA.mq5.preB58 b/Experts/SRJ_FlowNexus_EA.mq5
@@ -6976 +6978,2 @@ void EvaluateClosedBar(int barShift, datetime barTime)
+   (36-line UJBARMAP block: uj_db* locals, ReadBuf1 x6, ReadFlow ltf, PrintFormat UJBARMAP; see result Part D2)
- D4 compile: `Result: 0 errors, 0 warnings, 6449 ms elapsed, cpu='X64 Regular'` (binary fresh).

## C1 j28 vs j26 deal rows raw
j28:15800 deal #2 sell 2026.08.28 10:05:00 1.16466 / j26:15101 same
j28:16228 deal #3 buy 2026.08.28 11:45:02 1.16440 / j26:15509 same
j28:29897 deal #4 buy 2026.09.01 17:35:01 1.16024 / j26:28532 same
j28:29977 deal #5 sell 2026.09.01 17:51:04 1.15975 / j26:28609 same
j28:44617 deal #6 buy 2026.09.04 16:00:00 1.16019 / j26:42407 same
j28:46407 deal #7 sell 2026.09.04 23:55:00 1.16129 / j26:44102 same
j28:47695 deal #8 buy 2026.09.07 09:20:00 1.16138 / j26:45277 same
j28:48083 deal #9 sell 2026.09.07 10:53:07 1.16201 / j26:45647 same
j28:50524 deal #10 buy 2026.09.07 16:45:00 1.16264 / j26:48017 same
j28:50633 deal #11 sell 2026.09.07 17:13:30 1.16315 / j26:48121 same
j28:52504 deal #12 sell 2026.09.08 10:10:00 1.16205 / j26:49788 same
j28:52648 deal #13 buy 2026.09.08 10:42:46 1.16102 / j26:49926 same
j28:54938 deal #14 sell 2026.09.08 17:00:00 1.16220 / j26:52140 same
j28:55074 deal #15 buy 2026.09.08 17:26:29 1.16275 / j26:52271 same
- UJLTFHOLD j28 0. UJDEFERABORT j28 32 = j26 32. UJBARMAP j28 3168 = 3168 bars. FIRED 7/7. Balance 10474.64. j28-UJBARMAP 68249 vs j26 68248 (+1, report only). DONE PASSED 05:37:39.

## C2 j29 vs j27 deal rows raw
j29:6808 deal #2 buy 2026.05.27 15:35:00 159.344 / j27:6041 same
j29:7357 deal #3 sell 20:08:14 159.535 / j27:6536 same
j29:29786 deal #4 buy 2026.06.03 09:10:00 159.932 / j27:27656 same
j29:29922 deal #5 sell 09:59:40 159.983 / j27:27783 same
j29:35486 deal #6 sell 2026.06.04 09:55:00 159.868 / j27:33059 same
j29:35648 deal #7 buy 10:40:20 159.920 / j27:33212 same
j29:39836 deal #8 buy 2026.06.05 16:55:00 160.120 / j27:37037 same
j29:40241 deal #9 sell 19:16:32 160.298 / j27:37414 same
j29:59452 deal #10 buy 2026.06.11 14:40:22 160.530 / j27:55528 same
j29:59579 deal #11 sell 15:23:06 160.588 / j27:55647 same
- MTEXIT j29 5 rows identical to j27 (B3 15:20 TP_TOUCH entry=160.524 exit=160.587). UJLTFHOLD j29 0. FIRED 5. Balance 10395.28. MCAND content 15/15 identical. UJBARMAP j29 4320 = 4320 bars. j29-UJBARMAP 66907 vs j27 66904 (+3, report only). DONE PASSED 05:44:02.

## T1 j29 UJBARMAP six-row raws (bar= evaluated bar; stamp one pass later)
j29:38828 bar=15:55 o=160.146 h=160.219 l=160.125 c=160.212 mpoc=159.885 mvwap=159.794 wpoc=159.885 wvwap=159.794 dpoc=159.945 dvwap=159.959 ltf=1.0
j29:39014 bar=16:00 o=160.216 h=160.262 l=159.726 c=160.034 mpoc=159.885 mvwap=159.796 wpoc=159.885 wvwap=159.796 dpoc=159.945 dvwap=159.963 ltf=-1.0
j29:39198 bar=16:05 o=160.032 h=160.086 l=159.992 c=160.008 mpoc=159.885 mvwap=159.798 wpoc=159.885 wvwap=159.798 dpoc=159.945 dvwap=159.966 ltf=1.0
j29:39209 bar=16:10 o=160.009 h=160.062 l=159.981 c=160.058 mpoc=159.885 mvwap=159.799 wpoc=159.885 wvwap=159.799 dpoc=159.945 dvwap=159.968 ltf=1.0
j29:39215 bar=16:15 o=160.059 h=160.082 l=160.022 c=160.073 mpoc=159.885 mvwap=159.800 wpoc=159.885 wvwap=159.800 dpoc=159.945 dvwap=159.971 ltf=1.0
j29:39221 bar=16:20 o=160.071 h=160.166 l=160.053 c=160.161 mpoc=159.885 mvwap=159.801 wpoc=159.885 wvwap=159.801 dpoc=159.945 dvwap=159.974 ltf=1.0

(End of slice)
