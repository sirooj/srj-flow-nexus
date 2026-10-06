# BUILDER SLICE B-59 - raw rows behind R1-R4 (EA D00F93BB; FlowLogic 956BF3E3; j29 FDD4D79A; j27 DD3E6855)

## R1(a) indicator code raws (found by text)
- EA:172 `#define FL_BUF_LTF_BIAS      2`
- FlowLogic:678 `SetIndexBuffer(2,  g_bufBias,         INDICATOR_CALCULATIONS);`
- FlowLogic:1072-1078 export: `int target = i - 1; if(target >= 0) { g_bufBias[target] = (g_s.currentBias == "bullish") ? 1.0 : (g_s.currentBias == "bearish" ? -1.0 : 0.0); ... }`
- FlowLogic:891-987 start logic: `if(prevCalc == 0) { ...start = 2; } else { start = prevCalc - 1; ... }` (FlowLogic:980/984); full-reset print (FlowLogic:877-887).
- FlowLogic:995-1012 snapshot: `if(isLastBar) { if(g_newBar) { g_sSnapshot = g_s; ... } else if(g_snapValid) { g_s = g_sSnapshot; ... } g_isTrackIntrabar = true; } else { g_isTrackIntrabar = false; }`
- FlowLogic:1470 `return(rates_total);`
- BarClosed SRJ_Draw.mqh:42-45: `bool BarClosed(int i, int rates_total) { return (i < rates_total - 1); }`
- OB birth OrderblockMgr:223-260: `if(SRJ_isStrictFractalHigh(high,i,1)) { ... if(SRJ_isBullishCandle(open,close,i,1)) { bestBearishOBBar = i-1 ... } if(i >= 3 && SRJ_isBullishCandle(open,close,i,2)) {...} ... SRJ_createOrderblock(... false /*bearish*/ ...) }` (+ replay loop :264-270); bullish mirror from :328.
- Invalidation OrderblockMgr:500-512: `if(ob.isActivated && ob.isValid) { bool closedBeyondInvalidation = false; if(ob.isBullish) closedBeyondInvalidation = (liveClose < ob.invalidationLevel); else closedBeyondInvalidation = (liveClose > ob.invalidationLevel); ... if(closedBeyondInvalidation && !wouldBeSameBarValInv && !isCreationBar) { ob.isValid = false; ob.invalidationBar = i; ...` + refOk gate :522-525 (invalidationBar >= currentStructureStartBar).
- In-bias write OrderblockMgr:550-563 (site code 3, tickOBIsValid=false) vs opposing :564-573 (site code 4, stays true); counters :575-588.
- Counters OrderblockMgr:609-647 (CounterAggregationPass; barClosed-gated at :611; in-bias vs opposing split).
- Decision BiasEngine:157-165: `currentOpposingCount ...; doRenewal = (currentOpposingCount >= 2)...; currentInBiasCount ...; doStrongFlip = (currentInBiasCount >= 2) && !g_s.drawBiasLineNow;`
- Weak flip BiasEngine:170-172: `doWeakSignalFlip = weakFlipPreconditionMet || ((!tickOBIsValid) && (!tickFVGIsValid) && hasPersistedOpposingFVG);` + latch BiasEngine:389-397.
- Flip commit BiasEngine:264-312 (`else if(doStrongFlip || doWeakSignalFlip)`: nextBias opposite, counters zeroed :296-299, alerts :301-304, kind strongFlip/weakFlip :306-311).

## R1(b) 5 June rows raw (j29; stamps pass times)
UJBARMAP full OHLC 14:00-16:20 (j29:38404-39221; ltf -1.0 bars 14:00-15:25, +1.0 bars 15:30-15:55, -1.0 bar 16:00, +1.0 bars 16:05-16:20):
- 14:00 o=159.911 h=159.918 l=159.895 c=159.906; 14:05 o=159.904 h=159.912 l=159.900 c=159.902; 14:10 o=159.903 h=159.910 l=159.902 c=159.907; 14:15 o=159.906 h=159.920 l=159.905 c=159.915; 14:20 o=159.915 h=159.929 l=159.906 c=159.907; 14:25 o=159.906 h=159.909 l=159.894 c=159.900; 14:30 o=159.901 h=159.907 l=159.899 c=159.907; 14:35 o=159.907 h=159.916 l=159.881 c=159.892; 14:40 o=159.892 h=159.892 l=159.884 c=159.886; 14:45 o=159.883 h=159.886 l=159.855 c=159.856; 14:50 o=159.856 h=159.857 l=159.833 c=159.842; 14:55 o=159.842 h=159.847 l=159.830 c=159.844; 15:00 o=159.844 h=159.870 l=159.834 c=159.858; 15:05 o=159.856 h=159.861 l=159.845 c=159.856; 15:10 o=159.855 h=159.871 l=159.846 c=159.862; 15:15 o=159.862 h=159.899 l=159.859 c=159.882; 15:20 o=159.884 h=159.896 l=159.878 c=159.884; 15:25 o=159.885 h=159.899 l=159.883 c=159.886; 15:30 o=159.887 h=160.031 l=159.885 c=160.007; 15:35 o=160.009 h=160.042 l=159.975 c=159.990; 15:40 o=159.992 h=160.031 l=159.984 c=160.031; 15:45 o=160.033 h=160.047 l=160.011 c=160.047; 15:50 o=160.046 h=160.146 l=160.046 c=160.143; 15:55 o=160.146 h=160.219 l=160.125 c=160.212; 16:00 o=160.216 h=160.262 l=159.726 c=160.034; 16:05 o=160.032 h=160.086 l=159.992 c=160.008; 16:10 o=160.009 h=160.062 l=159.981 c=160.058; 16:15 o=160.059 h=160.082 l=160.022 c=160.073; 16:20 o=160.071 h=160.166 l=160.053 c=160.161.
OBPROV 16:05 pass (bar 106524 = 16:00): j29:39010 code=3 id=3048; j29:39011 code=3 id=3040; j29:39012 code=8 id=0.
OBPROV 16:10 pass (bar 106525 = 16:05): j29:39192 code=3 id=3317; j29:39193 code=3 id=3314; j29:39194 code=3 id=3313; j29:39195 code=6 id=0; j29:39196 code=8 id=0.
LTFDIAG 6/05 j29: j29:39018 `[SRJ-EA] LTFDIAG bar=2026.06.05 16:00 ...` (kind=STRONG; full text in B-58 slice via j27 twin).
XOB rows: j29:38598 PROMOCENSUS 15:40 objId=3308 (bullish set, obStart 14:35); j29:38814-38815/38997-38998 XOBINPLAY zone 159.881-159.916 promoT 15:40; j29:38411 PROMOCENSUS 14:05 objId=3302 (obStart 13:45); j29:38477 PROMOCENSUS 14:45 objId=3307 (obStart 14:30); j29:40134 PROMOCENSUS 18:35 mode=all objId=3321 obStart=106524 (16:00 bar).
id=3048/3040/3317/3314/3313 scan: ONLY in the four OBPROV rows above (no birth/level prints) -> NEEDS_PRINT: exact invalidation levels + birth candles of 3048/3040 (and 3317/3314/3313).
MACHINE_5M_1600 = FLIP_BY_CODE_RULE. FLIPBACK_1605 = FLIP_BY_CODE_RULE.

## R1(d) repaint lines: FlowLogic:984 + FlowLogic:1470 + FlowLogic:1072-1078 + FlowLogic:995-1012 (quoted above). REPAINT_1600 = YES (narrow, intrabar; decision read -1.0 proven x4, no decision impact evidenced).

## R2 his-words grep raws
- Skill: :36 ANCHOR-RANK (9/4 verbatim, not 6/5 NY); :89 NEAREST-ONLY-TP ("16:05" = target-pool instance); :116 5M-FLIP-KILL (verbatim kill rule + unquoted 6/5-TIMING); :154 5M-FLIP-TRIGGER-0605LDN (London); :160 0605LDN-FLIPS (London); :162 TERMS-HIS; :166-167 entry POI (verbatim, not 5m).
- Findings: MISSES:21-26 builder analysis (thin-map Miss 2); :65-67 his Q1-Q3 (9:45 path / swing store / retarget); :122-123 London/recall joins. Zero NY-5m verbatim.
- Journal: row 306 (16:15 entry verbatim area), row 309 (entry POI bank); rows 307-308 London. Zero NY-5m verbatim.
- Register: row 2 + corrections (entry/target/booking topics); B-40 correction = London 5m. Zero NY-5m verbatim.
- Ledger "5 June NY 5m / 160.059 / 159.726": :6596 builder defect note, :6895 B-58 item. Zero his-verbatim.
- JUN05NY_5M_1600_HIS = NO_RULING_FOUND.

## R3 confirmation raws + dry numbers
- EA:2337-2391 IsConfirmationCandle on disk (see result R3(a) for C term EA:2388-2389 + guard; A EA:2366-2367; A2 EA:2372-2383 incl. B38 reclaim; B EA:2384-2387).
- DRY_1605 numbers: prior 16:00 o=160.216 c=160.034 (A: 160.034<160.216 pass); A2: 160.034 vs lines 159.796/159.798/159.885/159.945/159.963 all pass; B: 160.008 vs 160.032 fail all six -> B_BODY.
- DRY_1610 numbers: prior 16:05 o=160.032 c=160.008 (A pass); A2: 160.008 vs 159.799/159.885/159.945/159.968 all pass; B: 160.058>160.009 pass (49pts); C: prior range h=160.086/l=159.992 vs L+0.001 (nearest D-VWAP bar 159.967): 159.992>159.967 fail all six -> C_TOUCH.
- DRY_1610_RB: C from 16:00 range (touched all six) -> all terms pass.
- C_ADJ_PIN = NONE_FOUND (no pin names N-1 adjacency; register two-bar-gap instances: NONE).
- C_GUARD_PIN = NONE_FOUND (pins: §7 TOUCH-OR-BREAK, §8 CONFIRMATION-CANONICAL, §10 SWEEP-TEST-STRICT, §5 no-tolerance verbatim).

## R4 register row 2 raw
`  | 2 | 5 June New York USDJPY, entry owed 16:15 | LONG | Old high 160.723 (April-30th day high) [HIS] | 16:10 NO_TP_TARGET, 5 levels invalid [R63 QO] | Pool blind past 10 days; retarget rule commissioned [HIS: "i want your solution"] |` + B-35/B-51/B-56/B-57 cells (see result R4). Verdicts: retest = new record vs UNKNOWN (no conflict); entry candle SAME (16:15); entry price = new machine-data info 160.059 (register: none; no conflict).

(End of slice)
