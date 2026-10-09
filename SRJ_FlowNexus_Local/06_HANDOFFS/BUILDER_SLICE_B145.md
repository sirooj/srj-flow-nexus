# BUILDER SLICE B-145 - colours, inputs, hits, rows, census (kept 585093BF)

## Colour inputs (Indicators/SRJ_FlowLogic.mq5:289-296 + assignment 465-472)
289: input color inBullishOBColor           = clrBlue;
290: input color inBearishOBColor           = clrRed;
291: input color inValidMidlineColor        = clrBlack;
292: input color inInvalidatedBullishColor  = clrGray;
293: input color inInvalidatedBearishColor  = clrGray;
294: input color inInvalidatedMidlineColor  = clrOrange;
295: input color inInactiveBullishColor     = C'102,102,255';
296: input color inInactiveBearishColor     = C'255,102,102';
465:    g_bullishOBColor              = inBullishOBColor;
466:    g_bearishOBColor              = inBearishOBColor;
467:    g_validMidlineColor           = inValidMidlineColor;
468-470: invalidated colours assigned (bullish/bearish/midline)
453:    g_showValidBearishOB          = inShowValidBearishOB;
455:    g_showInvalidatedBearishOB    = inShowInvalidatedBearishOB;
458:    g_extendValid                 = inExtendValid;
460:    g_extendInvalidated           = inExtendInvalidated;
461:    g_lineExtension               = inLineExtension;
462:    g_lineThickness               = inLineThickness;
463:    g_extremeOBExtraThickness     = inExtremeOBExtraThickness;

## Draw code (Include/SRJ/SRJ_OrderblockMgr.mqh)
814-822 SRJ_ApplyPromotion: isPromoted=true; ob+mid width = g_lineThickness + g_extremeOBExtraThickness (=1+2=3)
591-602 kill: SetTrendColor invalidated colours + SetTrendExtend (width untouched)
278-279: safeX1=max(startBar,i-4500); safeX2=max(startBar+g_lineExtension,safeX1+1)
649-667 prune: if(ob.isActivated) continue (activated lines never removed)
285-287 defaults: inLineExtension=3; inLineThickness=1; inExtremeOBExtraThickness=2 (FlowLogic.mq5)
277/279/282/284: show valid+invalidated bearish true; extend false/false (FlowLogic.mq5)

## Saved chart inputs (all six files identical; chart01.chr:148-165)
Profiles/Charts/Default/chart01.chr:87 path=Indicators\SRJ_FlowLogic.ex5
Profiles/Charts/Default/chart02.chr:87 | chart03.chr:87 | chart04.chr:87 (same)
Profiles/Templates/backtest.tpl:87 | Profiles/Templates/default.tpl:87 (same)
148: inShowValidBearishOB=true | 150: inShowInvalidatedBearishOB=true
153: inExtendValid=false | 155: inExtendInvalidated=false | 156: inLineExtension=3
157: inLineThickness=1 | 158: inExtremeOBExtraThickness=2
160: inBullishOBColor=16711680 | 161: inBearishOBColor=255 | 162: inValidMidlineColor=0
163: inInvalidatedBullishColor=8421504 | 164: inInvalidatedBearishColor=8421504 | 165: inInvalidatedMidlineColor=42495
(chart02/03/04 + both tpl verified same five keys: extension 3, thickness 1, extra 2, bearish 255, dead-bearish 8421504)

## R3 hits (file:line)
skill L135 W6 7-Sep/8-Sep 15m reads (no XOB) | L141 15M-READS | L154 5M-FLIP-TRIGGER-0605LDN (5 June dashed 09:20) | L225-228 Ruling (B-143) 9:20 + thicker red line (ONLY thick words)
XOBSUIT L25: 2159 re-picks at 09:20 (17 Aug context, different XOB)
register L19 A4 7-Sep entry (different day) | L37 B-40 5-June dashed line | L62 B-143 NOTE (9:20 zone)
journal CSV:286 row 285 (A6 15m bearish, no XOB) | CSV:1065 row 313 (A7 Y-POC target, no XOB) | CSV:1070 row 318 (B-143 banking, his 9:20 words)
ledger 1288 (B-143) + 1289 (B-144 lifecycle)

## R4 census sets (machine data)
A7 barT-16:50 promoted=1+valid=1 SHORT (16): 1389/1401/1403/1481/1484/1495/1516/1704/1728/1784/1891/2109/2149/2217/2896/2898
A7 form-touched: 1704@8/26 06:30, 1728@8/26 07:35, 1784@8/26 00:35, 1891@8/26 15:45, 2109@8/28 01:00, 2149@8/28 06:25, 2217@8/28 16:25, 2896@9/3 20:20, 2898@9/3 20:30(pick)
A7 promo-touched: 1704@8/26 16:30, 1728@8/27 16:25, 1784@8/26 00:35, 2109@8/28 05:55, 2149@8/28 14:00, 2217@8/28 17:00, 2896@9/3 20:50 (1891/2898 + 1389/1401/1403/1481/1484/1495/1516 never)
A6 beside: same sets (all first touches predate 10:05 9/8)
C-06-04 barT-09:45 rows (June INCREMENTAL): 3038 (form 6/3 23:50), 3046 (form 6/4 01:00), 3052(pick, form 6/4 01:40); promo-touched NONE
(scan: 2796 EU bars 8/26-9/8 + 407 UJ bars 6/3-6/4, Tester/logs/20261009.log UJBARMAP; swing-leg half unchecked)

## Level mechanics (beside; operator words unbanked per Part B)
SRJ_OrderblockMgr.mqh:37 mid=(high+low)/2; :38-40 charter-9 comment (level IS pure midline); :62-70 NewOrderblock(invLevel=mid)
No other invalidationLevel write site in Include/SRJ (grep). 3293 rows: level=1.16243000 always.
His preamble words (relay-carried, NOT banked): level not always 0.5; a more extreme body close moves it.

(End of slice)
