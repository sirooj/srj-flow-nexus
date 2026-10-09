# BUILDER SLICE B-144 - raw writer/lifecycle/draw code, candle rows, neighbor rows (kept 585093BF)

## Writer (Indicators/SRJ_FlowLogic.mq5.B97PROV; diagnostic variant, NOT in kept 956BF3E3)
851: //====================== [B96-DIAG] full-collection snapshot export ============
852: // Diagnostic only (relay B-96, provenance fix B-97). Writes one line per
853: // COrderblock object present at the export point, keyed by the target bar
854: // time, to XOBDIAG.csv in the Files folder. Never read by any gate;
855: // restored after the diagnostic run.
889:    if(!barClosed) return;               // closed bars only; forming bar absent by design
890:    datetime barT = bt[target];
897:    if(barT <= b96DiagLastT) return;      // ascending loop: one line-set per bar
912:       COrderblock *ob = GetOB(g_orderblocks, k);
919:       FileWriteString(h, StringFormat(
920:          "XOBDIAG;%I64d;%I64d;%s;%s;%s;%s;%s;%s;%d;%d;%d;%s;%s;%s;%s\n",
921:          (long)barT, ob.objId, (ob.isBullish ? "B" : "S"),
922:          B96Dbl(ob.high), B96Dbl(ob.low),
923:          B96BarT(ob.startBar), B96BarT(ob.creationBar), promoT,
924:          (ob.isValid ? 1 : 0), (ob.isActivated ? 1 : 0), (ob.isPromoted ? 1 : 0),
925:          B96BarT(ob.validationBar), B96BarT(ob.invalidationBar),
926:          B96Dbl(ob.invalidationLevel), B96Build()));
912-918(promoT): promoT = SRJ_BarTime(promotionBar) if set, else "NA"
1102:       bool barClosed = BarClosed(i, rates_total);
1153:       int target = i - 1;
1317:           SRJ_B96_DiagExport(target, time, rates_total, barClosed);

## 3293 lifecycle rows (XOBDIAG_RECON62_INCREMENTAL.csv barT|valid|active|promoted|validationT|invalT|level)
1788859500 valid=1 active=1 promoted=0 validationT=1788859800 invalT=NA level=1.16243000
1788859800 valid=1 active=1 promoted=0 validationT=1788859800 invalT=NA level=1.16243000
1788860100 valid=0 active=1 promoted=1 validationT=1788859800 invalT=1788860400 level=1.16243000
1788860400 valid=0 active=1 promoted=1 validationT=1788859800 invalT=1788860400 level=1.16243000
1788860700 valid=0 active=1 promoted=1 validationT=1788859800 invalT=1788860400 level=1.16243000
1788861000 valid=0 active=1 promoted=1 validationT=1788859800 invalT=1788860400 level=1.16243000
1788861300 valid=0 active=1 promoted=1 validationT=1788859800 invalT=1788860400 level=1.16243000
(zone 1.16256-1.16230 S startT 1788859200 createT 1788859800; srcFile XOBDIAG_RECON62_INCREMENTAL.csv build 2026.10.08 20:34:34 INCREMENTAL pass 2)

## Lifecycle code (Include/SRJ/SRJ_OrderblockMgr.mqh, kept include)
95-117 replay activation: bearish activates when barLow < ob.low; sets isActivated/isValid/validationBar
120-122: Only attempt invalidation if the OB was activated on a PRIOR bar
124-128: bearish closedBeyondInvalidation = (barClose > ob.invalidationLevel)
498-506 pass kill: if(ob.isActivated && ob.isValid); bearish (liveClose > ob.invalidationLevel)
509-512 guards: skip same-as-validation bar, skip creation bar
514-515: ob.isValid = false; ob.invalidationBar = i;
591-602 kill redraw: recolor to invalidated colors + extend flag (width untouched)
814-822 SRJ_ApplyPromotion: isPromoted = true; both lines width g_lineThickness + g_extremeOBExtraThickness
278-279 safeX1/safeX2: max(startBar, i-4500) / max(startBar + g_lineExtension, safeX1+1)
649-667 prune: activated lines never removed (if(ob.isActivated) continue)

## Indicator inputs (Indicators/SRJ_FlowLogic.mq5:277-287, kept source)
277: input bool  inShowValidBearishOB       = true;
279: input bool  inShowInvalidatedBearishOB = true;
282: input bool  inExtendValid              = false;
284: input bool  inExtendInvalidated        = false;
285: input int   inLineExtension            = 3;
286: input int   inLineThickness            = 1;
287: input int   inExtremeOBExtraThickness  = 2;

## Machine candles 8 Sep 09:15-09:45 (Tester/logs/20261009.log UJBARMAP o/h/l/c)
09:15 o=1.16300 h=1.16303 l=1.16252 c=1.16252 (beyond, pre-formation)
09:20 o=1.16255 h=1.16256 l=1.16230 c=1.16256 (formation; beyond but pre-activation)
09:25 o=1.16257 h=1.16266 l=1.16242 c=1.16245 (beyond by 2; pre-activation, validationT 09:30)
09:30 o=1.16244 h=1.16250 l=1.16225 c=1.16229 (activation; close below midline 1.16243)
09:35 o=1.16228 h=1.16233 l=1.16211 c=1.16230 (below midline)
09:40 o=1.16230 h=1.16258 l=1.16230 c=1.16248 (KILL: beyond, activated, not creation/validation bar)
09:45 o=1.16247 h=1.16250 l=1.16232 c=1.16240 (already dead; below midline)

## Neighbors at 16:50 barT (XOBDIAG_RECON62_EU_TARGETS.csv)
3296|S|1.16258000|1.16230000|startT 1788860400|createT 1788860700|promoT NA|valid 0|active 1|promoted 0|validationT 1788861000|invalT 1788884400|src XOBDIAG_RECON62_INCREMENTAL.csv build 2026.10.08 20:34:34
3334|S|1.16250000|1.16219000|startT 1788883500|createT 1788883800|promoT NA|valid 1|active 1|promoted 0|validationT 1788885000|invalT NA|src XOBDIAG_RECON62_INCREMENTAL.csv build 2026.10.08 20:34:34

## Feed (R4)
B-137 T0: [Tester] dates+symbol written + read back (EURUSD 1787702400/1788998400)
Spec 9.1: operator TradingView/OANDA vs system Dukascopy demo feed
terminal.ini LastScanServer empty (line 149); TickAudit B48_SEP EURUSD_RAW 07-10 Sep EMPTY

(End of slice)
