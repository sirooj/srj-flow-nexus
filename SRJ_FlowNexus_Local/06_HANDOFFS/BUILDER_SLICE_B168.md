# BUILDER SLICE B-168 - raw rows behind every answer, Part S rows, R4 tables (MEASURED; read-only)

Base: builder/B-167 head e17590b on builder/B-168. Gate per result (PID 19848 ACCOUNTED + .preB167 restore CF80083C verified; diff EMPTY; SHAs match; counts 1; pre-greps 0). Day log Tester/logs/20261011.log (624,428,320 bytes); B-162 segment j1078195-1556926; markers j1556926 0:03:55 / j2035651 0:03:50.

## Part B (grep-first, verbatim)

- B1/B2/B3 counts 0 → skill section L250-253 + journal row 323 (1075 lines) + ledger 1314. Relay Setup-report line 1.

## R1 packs/renders (scripts filed with diffs: build_rowpack_gbp0629_b168f.ps1 = B-166 cutter + 34 tags + pinned first-GBP-marker; build_setups_gbp0629_b168f.ps1 = same dedup/joins + 13 columns + FULL.md writer; build_index_gbp0629_b168f.ps1 = journal_line map)

- Packs W1 9052 / W2 12146 / W3 10593 (31791) + 15 day files + INDEX (15 refs). Superset 24944/24944, 0 missing. MTEXITs j1448182 + j1470236 packed.
- SETUPS 15 rows / 2 EXECUTED. FULL.md 15 blocks / 934 lines.

## R1 tag rows (raw, journal line, column)

- `UJPROBE bar_key=2026.07.02 18:10 h4=1.0 h1=1.0 m15=1.0 confirmedFeed=1 ltf=1.0 div=OPPOSING kind=hidden readFail=0 empty=111758 zero=0 complete=1 latestNZ=2 ...` (W1:6928 j=1447646 → htf/ltf/div-kind)
- `SIDE1T_SEEDBIAS bar=2026.07.02 18:10 dir=LONG biasAligned=1 verdict=CONSIDER` (W1:6935 j=1447659)
- `REGIMECENSUS #36 bar=2026.07.02 18:10 dir=LONG votes=3 trendOk=1 sweepTag=0 mrOk=0 cumMR=0` (W1:6936 j=1447669 → class TREND). mrOk=1 rows: only W3:96 (7/13 09:10 SHORT) + W3:5873 (7/15 14:50 LONG), neither a candidate bar.
- `SWEPTMASK bar=2026.07.02 18:10 raw=1397525.0 m=1397525 swept=1010100011 live=0010` (W1:6955 j=1447702) + `SIDE1Y_PDSESS bar=2026.07.02 18:10 dir=LONG entry=1.33710 liveTp=1.34032 pdAsiaH=1.32945 pdAsiaL=1.32743 pdLondonH=1.33628 pdLondonL=1.32909 pdNyH=1.32918 pdNyL=1.32189 pdPmH=1.32829 pdPmL=1.32711` (W1:6965) → sweep NOT PRINTED (no named swept level/candle).
- `ZONEPICK bar=2026.07.02 18:10 dir=LONG haveFvg=0 fvgInPlay=0 haveXob=1 xobInPlay=0 downgraded=0 fvg=--- xob=1.32815-1.32832` (W1:6942 j=1447677 → kind XOB)
- `XOBPROMO bar=2026.07.02 18:10 site=S3PICK xobId=2405 raw=1782975600.0 promoT=2026.07.02 07:00` (W1:6941 j=1447676 → id/promoT)
- `B60C bar=2026.07.02 18:10 dir=LONG poi=Daily-POC rt=2026.07.02 18:10 rSh=1 rBar=2026.07.02 18:10 cSrc=BOTH xt=0 zxob=1.32815-1.32832 xpromo=2026.07.02 07:00 ...` (W1:6951 j=1447697)
- `D130LATCH pass=2026.07.02 18:15:00 confBar=2026.07.02 18:10 dir=LONG verdict=2 verdictBar=2026.07.02 18:05 walkShift=2 oppPassed=-1 oppBar=2026.07.02 17:15` (W1:6953 j=1447700 → div_bar 18:05)
- `SL_REF branch=1-swing obValid=1 slRef=1.32815 distPts=893 site=S5 zoneLo=1.32815 zoneHi=1.32832` (S5; S3ARM twin W1:6947 j=1447684)
- `SLSRC site=S5 dir=LONG src=OB_SWING obStruct=1.32815 obSwing=1.32815 nearest=1.33654 chosen=1.32815 deltaPts=0` (W1:6946 j=1447683); `SWINGPICK site=S5 dir=LONG barShift=1 close=1.33708 haveHigh=1 SH=1.33782 atShift=2 haveLow=1 SL=1.33654 atShift=1` (W1:6945 j=1447682)
- `TP_ELECT shadow=true entry=1.33710 sl=1.33564 tp=1.34032 R=2.21 bar=2026.07.02 18:10 latchBar=2026.07.02 18:15` (W1:6970 j=1447847)
- `TPCENSUS #52 bar=2026.07.02 18:10 dir=LONG ref=1.33710 winner=LIVE best=1.34032 distPts=322 empties=6 admitted= NYH:134 LIVE:897 ...` (W1:6959 j=1447804)
- `A6FIRED class=SELECTED state=FIRED bar=2026.07.02 18:10 dir=LONG tp=1.34032 r=2.21 sl=1.33564 mode=1SWING div=hidden` (W1:6971 j=1447850 → hidden bullish)
- `RETESTBOOK bar=2026.07.02 18:10 hits=1 Daily-POC:r10:dL` (W1:6931 j=1447651)
- `ANCHOR_ELECT bar=2026.07.07 14:40 action=SEED poi=Daily-POC rank=10 tier=5 dir=SHORT` (W2:3707 j=1469638)
- `SLIMB fields=19 bar=2026.07.02 18:10 site=S3ARM dir=LONG branch=1SWING obValid=1 slRef=1.32815 slShift=137 slShiftT=2026.07.02 06:45 latestFlag=0 latestShift=1 latestShiftT=2026.07.02 18:05 latestAvail=1 latestApexMatch=1 chosenFlag=1 chosenShift=137 chosenShiftT=2026.07.02 06:45 chosenAvail=1 nuanceClass=OB_VALID_LATEST_NOIMB cands=-` (W1:6948)
- `XOBINPLAY bar=2026.07.02 18:10 dir=LONG zoneSrc=XOB zoneLo=1.32815 zoneHi=1.32832 promoT=2026.07.02 07:00 bounded=1 scanned=135 swings=24 hits=0 firstShift=-1 firstVal=- capHit=0 legacy=0 legacyVia=none widened=0 flip=0` (W1:6943 j=1447679)
- Midline: 'mid' hits (28/56/29) all ZONESHADOW R ratios (e.g. W2:634 `... near=1.44/sl1/tp1 mid=3.89/sl1/tp1 far=inf/sl0/tp1`) → zone midline NOT PRINTED.

## R2 2 July rows

- (a) POI XOB 2405 rows above; formT NOT PRINTED (origin=2405 hits 0/0/0 all weeks); kill state `XOBINPLAY hits=0 scanned=135 swings=24; INPLAYCOMMIT applied=1 commitVia=SWING` (`INPLAYCOMMIT bar=2026.07.02 18:10 dir=LONG zoneSrc=XOB zoneLo=1.32815 zoneHi=1.32832 promoT=2026.07.02 07:00 applied=1 bounded=1 scanned=137 swings=25 hits=1 firstShift=137 firstVal=1.32815 commitVia=SWING legacy=0 ...`, W1:6949).
- (b) 18:10 B152PR set (W1:6916-6925 j=1447634-1447643, nz=9): 150,S + 1582,1869,1875,1899,1909,1941,1943,2367 (all ,B,). z1=2405 all packs: 0. haveFvg=1 on 7/02: 0 rows. 2475: `B162ORIGIN ... bar=2026.07.02 17:35 side=B n=10 origin=2475 range=1.33562-1.33684 formT=2026.07.02 16:20 set=1582,1869,1875,1899,1909,1941,1943,2367,2473,2475` (W1:6826) + B152PR z1 rows 17:05-17:40 (e.g. W1:6824 `z1=2475,B,1.33562,1.33684,2026.07.02 16:40,1,2026.07.02 17:00,1.33766,1.33660`); 17:45 set (W1:6830-6839) = 150 + 8 B, no 2475/2473; FRESHCOUNT 17:30-18:15 naming 2475: none. UJBARMAP 16:20: `bar=2026.07.02 16:20 o=1.33684 h=1.33684 l=1.33562 c=1.33572 ...` (day log). UJBARMAP 17:40: `bar=2026.07.02 17:40 o=1.33634 h=1.33643 l=1.33564 c=1.33605 ...` (day log, both runs identical). 2475 middle 1.33623: 17:40 body 1.33634 → 1.33605 through it. Old line (RESULT_B147 L19-20 `invLevel = isBull ? MathMin(mid,obOpen) : MathMax(mid,obOpen)`): bullish → min(1.33623, 1.33684) = 1.33623.
- (c) SL rows above + `B157SL bar=2026.07.02 18:10 side=LONG flag2xOB=1.0 fvgValid=1.0 branch=ONE_OR_NEITHER first_bar=- first_px=- wo_stop_px=- kept_stop_px=1.33564 booked_stop_px=1.33564 R_at_open=2.21 reason=KEPT_PATH` (old W1:5244). Spec L162-171 (XOB touch table), L187 (valid target), L189 (1R admission-only), L195-200 (branches), L210 (selector = 2xOB + imbalance); skill L41 (FVG-validity).
- (d) B-146 skill L230-233; B-147 RESULT_B147 L19-20; B-159 RESULT_B159 L3+L24; B-144 RESULT_B144 L20+L27; XOBSUIT-1 §6 finding L85-88. B2 MATCHES all four cores (details in result); no decision.
- (e) REGIMECENSUS #36 + UJPROBE rows above (TREND; 1.0/1.0/1.0/-1.0-family; 7/02 ltf=1.0; 7/07 `UJPROBE bar_key=2026.07.07 14:40 h4=1.0 h1=-1.0 m15=-1.0 ... ltf=-1.0 div=OPPOSING kind=regular ...`).

## R3 7 July rows

- `RETESTBOOK bar=2026.07.07 14:40 hits=1 Daily-POC:r10:dS` (W2:3704 j=1469631); `RETESTBOOK bar=2026.07.07 14:20 hits=2 Daily-POC:r10:dS Weekly-POC:r8:dS` (W2:3591 j=1469451); 14:25/14:30/14:35 rows (D-POC dS [+ D-VWAP dL]).
- `MTEXIT bar=2026.07.07 15:30 reason=POI_BODY_BREAK line=Weekly-POC lineVal=1.33890 entry=1.33863 exit=1.33895 src=OWNBODY` (W2:4031 j=1470236); census `... line=Daily-POC val=1.33890 side=ahead trigger=1 ... verdict=ok ...` vs `... line=Weekly-POC val=1.33890 side=ahead trigger=1 bodyLo=1.33884 bodyHi=1.33895 verdict=BREAK ... ownBrk=1` (old W2:3227/3229).
- Skill L36 (ANCHOR-RANK a/b); skill L251 (B1).

## Part S rows (committed -B165R MTEXITs + -B165R SETUPS retest lines; 7/07 + 2/07 from -B168F)

- A1 `MTEXIT bar=2026.08.28 11:30 reason=POI_BODY_BREAK line=Daily-POC lineVal=1.16451 entry=1.16466 exit=1.16464 src=OWNBODY` / retest D-VWAP 09:55 → SAME.
- A2 `MTEXIT bar=2026.09.01 17:45 reason=POI_BODY_BREAK line=Yearly-POC lineVal=1.15987 entry=1.16022 exit=1.15987 src=OWNBODY` / retest M-VWAP 16:45 → SAME.
- A3 `MTEXIT bar=2026.09.04 23:50 reason=DAY_CLOSE ... exit=1.16129` / A4 `10:50 TP_TOUCH ... 1.16200` / A5 `17:10 TP_TOUCH ... 1.16315` / A6 `10:40 TP_TOUCH ... 1.16102` / A7 `17:30 SL ... 1.16274` / B2 `19:15 TP_TOUCH ... 160.298` / B3 `15:20 TP_TOUCH ... 160.587` / C-06-03 `09:55 TP_TOUCH ... 159.983` → SAME (no body-break exit).
- 7/07 MTEXIT above / counted retest D-POC dS only → SAME (W-POC dS at 14:20 outside scope). 2/07 `MTEXIT ... reason=SL ...` → SAME.
- Overall DOES NOT SEPARATE. Buildability EA:2288-2289 (g_rkLines/g_rkSide decl), EA:2319-2325 (per-bar store), EA:2331-2333 (side check), EA:2785-2803 (exit-side rank use), EA:2345-2374 (RETESTBOOK print, EA:138 flag).

## R4 tables

- Kills: TP_RR_FAIL 7/01 (W1:3848, TPCENSUS #25 `winner=YASH best=1.32513` W1:3813, R0.71), 7/06 ×3 (W2:663/1346/1527; TPCENSUS `winner=Quarterly-POC best=1.33542` W2:627 R0.50 / `winner=Weekly-POC best=1.33430 distPts=2` W2:1310 R0.03 / `winner=Quarterly-POC best=1.33542` W2:1492 R0.25). DIV_FALLBACK 7/03 ×2 (W1:7889/8053; latches `verdict=1 ... verdictBar=2026.07.03 11:30` W1:7886 vs SHORT / `verdict=-1 ... verdictBar=2026.07.03 14:10` W1:8050 vs LONG; `CQD DIV verdict=+1 shift=2 bar=2026.07.03 11:30` W1:7785), 7/06 (W2:2343), 7/14 ×2 (W3:2688/3353). LTF_MISALIGN 7/08 SHORT (W2:6129; UJPROBE ltf=1.0 W2:6087 j=1478563), 7/09 (W2:9005; ltf=-1.0 W2:9027 j=1489615), 7/13 (W3:2097; UJPROBE 18:00 ltf=1.0 W3:2115 j=1509683); session kills 7/01 ×2 (day pl=1046/1134), 7/10 ×4, 7/16 ×4+, 7/17 ×2. CONFIRMPOLL 7/08 LONG confirm=0 touchAttr=1 (W2:5924).
- His words per step: 1R skill L44; nearest L66/L89/L126-127; CQD L138-141/L207-211; 5m L116/L139/L185-187; confirmation L105/L112; CONTEXT L43 (record-first 5m rule).
- Silent first-stops: 7/01 NY 5m (day pl=1046/1134, Q-VWAP seeds); 7/02 LDN no-retest (36 RETESTBOOK all hits=0); 7/07 LDN no-confirm (11:20 D-POC dS seed, confirm=0 polls); 7/08 LDN 5m (LTF 10:05 S4 + SEEDBIAS 11:05 S2); 7/09 LDN no-seed; 7/10 LDN freshness→5m (FRESH_OB_DEAD 09:30 S4, LTF 09:40 S3) / NY 5m (14:30, 15:25 S3); 7/13 LDN 5m + HOLDER_EXPIRED 11:35 S1; 7/14 NY freshness (FRESH_OB_DEAD 15:20 S4); 7/15 LDN 5m/freshness (SEEDBIAS 10:30 S2, FRESH 10:55 S4) / NY no-confirm + freshness (FRESH 15:10 S4); 7/16 LDN 5m (09:15 S4, 10:10 S3; B60POT kept day pl=125/705) / NY no-retest; 7/17 LDN 5m (10:30/10:50 S3; 10:25 poll confirm=1 killed first) / NY freshness (FRESH 18:30 S4).
- Line maps (UJBARMAP, B-162 segment): j=1439222 (7/01 14:00 o=1.32522 h=1.32533 l=1.32451 c=1.32457 mpoc=1.32393 mvwap=1.32435 wpoc=NA wvwap=NA dpoc=1.32393 dvwap=1.32435 ltf=-1.0); j=1445504 (7/02 09:00 ... dpoc=1.32791 dvwap=1.32833 wpoc/wvwap NA ltf=1.0); j=1467064 (7/07 09:00 wpoc=1.33430 wvwap=1.33590 dpoc=1.33898 ltf=1.0); j=1474490 (7/08 09:00 ...); j=1484990 (7/09 09:00 ...); j=1494319/1498871 (7/10 ...); j=1504948 (7/13 ...); j=1518448 (7/14 ...); j=1525220/1527760 (7/15 ...); j=1532368/1537095 (7/16 ...); j=1541497/1543248 (7/17 ...). Full texts in result work files (linemap_b168.txt filtered j<1556926).
- Ranked: LTF_MISALIGN top (8 sessions + 3 candidates; inputs live ±1.0 readFail=0) → candidate first fix, nothing drafted. Then DIV_FALLBACK 5, TP_RR_FAIL 4, FRESH_OB_DEAD 4 sessions, SEEDBIAS 2, never-confirm 4, no-retest 3, HOLDER_EXPIRED 1.

(End of slice)
