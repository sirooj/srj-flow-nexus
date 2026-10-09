# BUILDER SLICE B-148 - raw R1 lines, R3 rows, provenance diff (kept 585093BF; K-D/T NOT RUN)

## R1 2xOB raw lines (paired greps; zeros re-proved)
SRJ_Text.mqh:23: g_glyph_2ob = "2xOB" | :35: string SRJ_2OB() { return g_glyph_2ob; }
SRJ_Panels.mqh:42: string line2 = is2OB ? SRJ_2OB() : "" (LTF panel row)
SRJ_HTFEngine.mqh:499: string ret2OB = e.htfIsDoubleOB ? SRJ_2OB() : "NA" (per-timeframe row)
SRJ_BiasEngine.mqh:157-165: currentInBiasCount + doStrongFlip = (>= 2) (LTF count to strong flip)
SRJ_BiasEngine.mqh:221: isDoubleOB = true (renewal) | :276: isDoubleOB = true (strong) | :281: = false (weak)
SRJ_HTFEngine.mqh:390-393: inBiasCount + doStrong = (>= 2) | :398: =true (renewal) | :406: =doStrong (flip)
FlowLogic.mq5:679-681 buffers 3/4/5 = OBValid/FVGValid/OppFVG (2-of-3 flags, not the count)
FlowLogic.mq5:672-741 full 0-47 census: no count/2xOB buffer; 19/20/21 HTF direction; 22/23/31/33 selected pick
EA:172-208/2025-2038 FL_BUF map: no 2xOB index; reads only defined indices
skill section 2 line 57 (9/4 10:40 rule: in-bias OB-count to strong flip at 2; buffers 3/4/5 export the state)
spec 3.7 line 210 (branch = 2xOB state + imbalance, not obValid); spec 8 line 319 (one flag)

## R3 A1 swing (Tester/logs/20261009.log UJBARMAP 28 Aug 00:00-10:00, 121 bars)
sole high==1.16508: 06:30 o=1.16506 h=1.16508 l=1.16491 c=1.16494
triple: 06:25 h=1.16507 < 1.16508 > 06:35 h=1.16494 STRICT
SWINGDUMP J1081428 (10:05 pass bar 10:00 S5): SH[1..10]= -,1.16491,-,1.16481,-,1.16482,-,1.16479,-,- | SL= 1.16462,-,-,-,1.16443,-,-,-,-,- (window shifts 1-10 = bars 09:55-09:10; 06:30 outside)
beside nearest strict high: 09:55 1.16491 (machine firstSwing)

## P2 provenance (B96-B110 variants share Include/SRJ/SRJ_OrderblockMgr.mqh)
B102/B106 vs kept: 106 diff lines each, all B100-DIAG export additions (header quoted R147); lifecycle calls identical (same include)
OrderblockMgr working tree == Rev064 d96fd5f on create/promote/kill/alive lines: SAME
Rev064 message (T161M E1 pure-midline; T161N Amendment-2 = Task-160 original + level hunk)

## R4/R5/R6 inputs (copied, no new work)
R-AT-OPEN rule: skill section 1 line 31 ("entry open.") - applies only on DIFFERENT rows (none)
R6: 0 SAME / 0 DIFFERENT / 10 UNKNOWN; reopen key: one 2xOB-state buffer (spec 8 "one flag")

(End of slice - K-D/T NOT RUN, no B148SLBR rows, no filed-trade tables, no runs made)
