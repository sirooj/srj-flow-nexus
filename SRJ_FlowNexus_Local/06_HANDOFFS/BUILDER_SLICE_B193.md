# BUILDER SLICE B-193 - R1 hits, R2/R3 tables, R4 census, D diff, deal tables, G1-G5 (under 600 lines)

Base: builder/B-193 cut at 604b934 (backup exact). B0: no pasted words -> B1. R1 SILENT. R2 ALL-MET + OPEN. R3 baseline. R4 filed, read-only. D: .B193D (8CF44FA6) + 0-error compile (EX5-D EEC70101). T: 3 PASSED diagnostic runs, one cut, T3 restored + verified. VERDICT RESTORED.

## R1 hits raw (every hit; classes)
- Journal 7 patterns: all 0. Bare-9/2 re-proof: 12 substring hits, all 9/20-9/29 dates; boundary `9/2(?![0-9/])` re-check: 0.
- '2 Sep': BUILDER_FINDING_ORIGIN_D1D2.md L43 `| R2 Sep-4 10:35 | 10:40 …` (artifact: "R2 Sep-4"); BUILDER_FINDING_SLDEF5_FIVEEXAMPLES.md L84 `Count: 7 in-window as he counts (4 code signals + 1 recovered + 2 Sep-8).` (artifact: two Sep-8).
- '9/2': skill L61 `...his valid set replicates-all (v141: 8/28 valid ...` (artifact: v141); AGREEMENT-01 L23 `- 9/1 "less than 1R" (#265), 9/2 (no booked), 9/3 (no booked) …` (machine-silence note); RECON58 L61 `- Silence elsewhere: no signals 9/2, 9/3, 9/5, 9/9 either run (consistent).` (machine-silence note); HTFAUDIT L29/L45, PREDICATE-OBSERVABILITY L5, S1-CADENCE-HALT L31, USDJPY-MISSES L91 (all `19/20/21` buffer artifacts).
- '9/02'/'09-02': 0 everywhere. Ledger '2026-09-02': 0. Ledger '9/02': L7080 (1329-context, builder text `…BODY_THROUGH death, FORM NOT PRINTED); 9/02 17:4…`) + L7086 (1335 K-3 STOP `…(NEW 9/02 10:3…`) - both builder's own B-189-path text, never his. Ledger '2 Sep': L327/L331/L1077, all `2 Sep-8` (two Sep-8).
- Class: SILENT (no HIS-TAKE, no HIS-DECLINE).

## R2 2 Sep table (RECON62-B189/2026-09-02.csv packs; EA text cites)
```
Sweep: B182SWEEP tag=pAS.L bar=09:35 (298) | candle 09:35 o1.15773 h1.15776 l1.15744 c1.15751 (325, strictly below) | Asia-low value NOT PRINTED | session London = FRESH (FRESH-SWEEP:82)
Retest line: FOMC-VWAP = POI buffer 11 (EA:85 `#define POI_BUF_F_VWAP 11`, EA:94 `g_lineCode[POI_BUF_F_VWAP] = "FOMC-VWAP"`) | indicator label ABSENT (0 POC/VWAP/FOMC strings in FlowLogic.mq5) | his words: SILENT
Retest 10:20: value 1.15718 (WINLINE 664) | candle o1.15741 h1.15742 l1.15713 c1.15726 (GAP 654-655): wick 5pts through, body above: VALID (spec 2 row 1)
5m bias: 10:20 ltf=-1.0 (UJPROBE 660) | 10:25 ltf=+1.0 (UJPROBE 700): bullish into 10:30 open: MET (5M-BIAS-AT-ENTRY)
4H/1H/15m: REGIMECENSUS votes=0 trendOk=0 sweepTag=2 mrOk=1 (666); per-TF reads NOT PRINTED
Zone: XOB 1.15530-1.15548 promoT 14 Aug 14:20 (ZONEPICK 710, INPLAYCOMMIT 711 applied=1, B60C 712-713) | formation/middle/kill NOT PRINTED (no B182MID row) | standing 10:25 (no KILL row for it) | B177HZ PASS (716) | PROMO_RETURN NOT PRINTED (0 rows)
Confirm 10:25: oppCandle=1 bodyDir=1 body=8pts confirm=1 (708): spec 3.6 same-bar
CQD: D130LATCH verdict=1 verdictBar=10:05 (714) | B182DEC div=1 kind=regular dbar=10:05 (723): latched regular
Stop 1.15614: B157SL KEPT_PATH R_at_open=1.57 (721) | 1-swing obValid=1 (SL_REF 705/720) | chosen=1.15527 OB_SWING (SLSRC 704/719)
Target 1.15917: named line NOT PRINTED | R=1.57 (TP_ELECT 722) | entry 10:30 open 1.15736 (deal 726)
Exit 15:20 at 1.15849/1.15850: MTEXIT TP_TOUCH exit=1.15849 (2974) | deal 15:21 1.15850 | line name NOT PRINTED (line=-)
Verdict: ALL-MET (no FAILS) + OPEN cells above
```

## R3 10 July table (GBP0629-B192/2026-07-10.csv packs, beside his F3 words)
```
Seeds 14:00-16:00 SHORT: 14:10 Y-POC (29417) | 14:50 Daily-POC (29677)
London high: 09:10 high 1.34358 (GAP_TOUCH 27923/27925: o1.34314 h1.34358 l1.34312 c1.34335)
Sweep candles 13:55/14:00 o/h/l/c: NOT PRINTED (no GAP_TOUCH/KILL row carries t=13:55/14:00; events named by B182SWEEP LD.H@13:55 pack 29293 + pLD.H@14:00 pack 29321)
Y-POC: 1.34296 OPEN 14:10 (WINLINE 29416), no change rows after: stands through 15:00
14:15 retest: CONFIRMPOLL bar=14:15 oppCandle=1 bodyDir=1 touchAttr=1 confirm=1 (29448) - machine agrees his 14:15
7:10 XOB: no 7:10-formed XOB (promos 07:25/13:55/14:00/14:05; kills 1.34198/1.34207/1.34260; B182MID/B178ZL): NOT PRINTED
14:00 swing high (his stop): NOT PRINTED (SWINGPICK 14:00 empty)
11:50 swing low (his target): LD.L 1.34082 (GAP_TOUCH t=11:50 packs 28952-55)
R: NOT PRINTED (no election/TP_ELECT; stop/target cited)
CQD: 14:15 S1_REGIME SHORT divLatch=0 (29478) | latched div=2 kind=hidden dbar=15:30 (B182DEC 30042) vs his "type 2 normal bearish" (number matches; kind mapping UNMAPPED - his only mapped instance is W2 type-1-bullish)
His 14:55: 14:50-bar rows (seed 29677, confirm=0 29674, RC 1/0/0/0 29678) - stated, role never inferred
Killing row: RC 14:55-15:40 SHORT 1/0/0/0 S1 hold (29678-29978); 15:45 votes=2 trendOk=1 (30008); 15:50 CONFIRM_STRUCT_FAIL term=A_OPP (30015) + B182DEC ABORT FRESH_OPP_FVG (30042) - quoted
```

## R4 census (booked TP levels x GAP_TOUCH candles; overshoot in (0,1pt]; S = register sweep?)
```
9/01 1.16077 H @09:10 over 1pt (POI A2 line, pre-decision; touch class, not session)
9/08 1.16102 L @11:05/11:45 over 1pt (A6 London low, session; POST-decision 10:10: no booking impact)
6/03 159.983 H @09:55 over 1pt (C-06-03 Asia high, session; POST-decision 09:10: no impact)
6/11 160.520 H @17:15 + L @19:35/19:45 over 1pt (unelected 11:25 TP; never fired: no impact)
7/01 1.32513 H @12:50 over 1pt (unelected TP; never fired)
7/06 1.33430 H @10:35 + L @11:00/14:30 over 1pt; 1.33542 L @17:25 over 1pt (unelected TPs; never fired)
None pre-decision on a register sweep. Filed only; no edit.
```

## D diff raw (.preB193 -> .B193D; PMAP 9 + TAG 2; nil-at-n0 artifact disclosed)
```
--- preB193 (F0924613, braces 129/129)
+++ B193D (8CF44FA6, braces 130/130)
@@ -1273 (sweep-value map): + //--- [B189PMAP] ... + else if pLD.H/pLD.L/pAS.H/pAS.L + NY/London session gates + sweepVal 3/4/1/2 (9 lines, [B189PMAP]x1)
@@ OnInit :727: + PrintFormat("[SRJ-FL] B193TAG build=B193D pmap=1"); //--- [B193TAG] (insert-only)
Compile slotrestore_flow: 0 errors + 3 pre-existing warnings (:1583/:1805/:1879); EX5-D EEC70101...FBE4370D55; EA 75B12D19 untouched. (1 non-engaging launch ignored per stale-tail lesson; engaging run verified by fresh mtime.)
```

## Deal tables (cuts only; journal lines)
- GBP0629-B193D 2 deals: #2 sell 7/07 14:45:00 @1.33863; #3 buy 7/07 17:03:51 @1.33649 (= B192 F2 identical). MTEXIT only F2 (17:00 TP_TOUCH 1.33649). No 2 July; no 6/13 July. B193TAG j2964670 x1.
- RECON62-B193D 16 deals: A1-A7 #2-#5/#8-#17 identical (side/date/time/price). NEW #6 buy 9/02 10:30:02 @1.15736 (TP_ELECT R=1.57) -> #7 sell 9/02 15:21:23 @1.15850 (MTEXIT 15:20 TP_TOUCH 1.15849). B193TAG j3906599 x1.
- JUNE0525-B193D 10 deals: 27May/C-06-03/B3 identical. MOVED B2: #6 buy 6/05 16:55:00 @160.120 (TP_ELECT 16:50 R=1.56; FIRE TREND; kept-path Monthly seed died 16:05 LTF_MISALIGN both builds) -> #7 sell 19:16:32 @160.298 (retarget). NEW #8 buy 6/09 11:20:07 @160.203 (TP_ELECT R=1.78; FIRE MEANREV) -> #9 sell 12:20:24 @160.152 (MTEXIT SL 160.153). B193TAG j4957151 x1.
- EX5 SHAs stable all runs (EEC70101/75B12D19). No VOID.

## G1-G5
- G1 DIES: S2 LTF-align 14:20, tf=0 opposed (SIDE1V_BIRTH 3841949; FRESHSKIP 3841731; SUPPRESSED 3841900). Kept held at R2 renewal (mrOk=0). Later ABORTs 15:05 DIV_FALLBACK + 15:20 FRESH_OPP_FVG (reg=MEANREV). Pound list = B192.
- G2: 2 Sep NEW (B-189 path penny-identical); A1-A7 identical; nothing else.
- G3: B2-moved (full path above; NOT his 16:15 entry) + 6/09 NEW (full path above; UNDECIDED); rest identical.
- G4: B193D rows reproduce R2 (mrOk=1 cut 4868794, confirm=1 4868974, applied=1, verdict=1, KEPT_PATH 1.15614, FIRE MEANREV); beside R1 SILENT: UNDECIDED.
- G5: UNDECIDED fires named: 2 Sep (pAS.L 09:35), 6/05-16:55 (no carrier, TREND), 6/09 (pAS.L 09:00); 10 July DIES named; other mrOk flips died at named gates (B-189 T2 list, spot-verified).
(End of slice)
