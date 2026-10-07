# BUILDER SLICE B-79 - raw R1 map, raw R2 rows per rule, raw R3 diff table (records only; kept EA 6CFE8F8B; hunk RK .B78RK read-only; no edit/compile/run)

Conventions: 1-based lines. j37 77F454AB (kept EA 6CFE8F8B); j41 DD4128CB 69508 lines (hunk RK ex5 773DB69E, bal 10429.29); j38 6019A461 (kept); j42 ED757045 (RK, bal 10395.28). Ranks per SLICE_B76 line 3. R = |target - entry| / |entry - stop| on printed values. "15:35 candidate" = j41 15:35 bar -> 15:40 open entry 1.15964. "His take" = j37 15:55 bar -> 16:00 open entry 1.16018 (register A row 3; journal row 312).

## R1 RAW MAP (4 Sep 15:20-16:05, j37 beside j41)

===== j37 RECON62-B66K_JOURNAL.log 15:20-16:05 2026.09.04 =====
--- bar 2026.09.04 15:20 ---
43305: JR	0	16:05:17.602	Core 04	2026.09.04 15:25:00   [SRJ-EA] UJBARMAP bar=2026.09.04 15:20 o=1.16242 h=1.16248 l=1.16230 c=1.16234 mpoc=1.15935 mvwap=1.16027 wpoc=1.15935 wvwap=1.16021 dpoc=1.16284 dvwap=1.16251 ltf=1.0
43306: KF	0	16:05:17.602	Core 04	2026.09.04 15:25:00   [SRJ-EA] RETESTBOOK bar=2026.09.04 15:20 hits=0
--- bar 2026.09.04 15:25 ---
43313: DD	0	16:05:17.602	Core 04	2026.09.04 15:30:00   [SRJ-EA] UJBARMAP bar=2026.09.04 15:25 o=1.16233 h=1.16270 l=1.16232 c=1.16258 mpoc=1.15935 mvwap=1.16028 wpoc=1.15935 wvwap=1.16022 dpoc=1.16284 dvwap=1.16251 ltf=1.0
43314: FL	0	16:05:17.602	Core 04	2026.09.04 15:30:00   [SRJ-EA] RETESTBOOK bar=2026.09.04 15:25 hits=0
--- bar 2026.09.04 15:30 ---
43334: PP	0	16:05:17.602	Core 04	2026.09.04 15:35:00   [SRJ-EA] UJBARMAP bar=2026.09.04 15:30 o=1.16260 h=1.16260 l=1.15847 c=1.15945 mpoc=1.15935 mvwap=1.16026 wpoc=1.15935 wvwap=1.16020 dpoc=1.16284 dvwap=1.16220 ltf=-1.0
43338: KJ	0	16:05:17.602	Core 04	2026.09.04 15:35:00   [SRJ-EA] RETESTBOOK bar=2026.09.04 15:30 hits=2 Weekly-POC:r8:dL Monthly-POC:r6:dL
43342: CN	0	16:05:17.602	Core 04	2026.09.04 15:35:00   [SRJ-EA] CONFIRMPOLL bar=2026.09.04 15:30 anchor=Monthly-POC dir=LONG oppCandle=0 bodyDir=0 body=315pts doji=0 touchAttr=0 confirm=0 shadow=true
43345: CD	0	16:05:17.602	Core 04	2026.09.04 15:35:00   [SRJ-EA] ANCHOR_ELECT bar=2026.09.04 15:30 action=SEED poi=Monthly-POC rank=6 tier=3 dir=LONG
43346: II	0	16:05:17.602	Core 04	2026.09.04 15:35:00   [SRJ-EA] SIDE1T_SEEDBIAS bar=2026.09.04 15:30 dir=LONG biasAligned=0 verdict=REJECT-BIAS-TIMING
71331: PG	0	16:06:01.841	Core 04	2026.09.09 23:59:58   [SRJ-EA] A6SUPP bar=2026.09.04 15:30 class=FRACTAL_SUPPRESSED target=UNRESOLVED_WALK reason=NO_CENSUS_ROW verdict=NONE
--- bar 2026.09.04 15:35 ---
43396: FQ	0	16:05:17.602	Core 04	2026.09.04 15:40:00   [SRJ-EA] UJBARMAP bar=2026.09.04 15:35 o=1.15946 h=1.16018 l=1.15914 c=1.15964 mpoc=1.15935 mvwap=1.16025 wpoc=1.15935 wvwap=1.16020 dpoc=1.16284 dvwap=1.16204 ltf=1.0
43524: EP	0	16:05:17.602	Core 04	2026.09.04 15:40:00   [SRJ-EA] TPCENSUS #212 bar=2026.09.04 15:35 dir=LONG ref=1.15964 winner=Yearly-POC best=1.15987 distPts=23 empties=0 admitted= PDH:448 ASH:367 ASL:260 LOH:338 LOL:224 NYH:306 PMH:415 PML:288 YASH:367 YASL:260 YLOH:338 YLOL:224 YNYH:337 YNYL:53 YPMH:415 YPML:288 LIVE:177 LIVE:33 LIVE:88 LIVE:873 LIVE:734 LIVE:1033 LIVE:769 LIVE:807 LIVE:28 LIVE:826 LIVE:618 LIVE:1043 LIV
43536: IQ	0	16:05:17.602	Core 04	2026.09.04 15:40:00   [SRJ-EA] UJ1R bar=2026.09.04 15:35 src=POLL entry=1.15964 sl=1.15907 tp=1.15987 risk=0.00057 reward=0.00023 R=0.40 verdict=FAIL
43546: HD	0	16:05:17.602	Core 04	2026.09.04 15:40:00   [SRJ-EA] SUPPRESSED bar=2026.09.04 15:35 poi=Yearly-POC dir=SHORT opp=1 higher=1 heldPoi=Monthly-POC heldDir=LONG heldState=S4_ARMED cum_n=84 cum_opp=11 cum_hi=2 cum_both=1 action=HELD
43547: IP	0	16:05:17.602	Core 04	2026.09.04 15:40:00   [SRJ-EA] RETESTBOOK bar=2026.09.04 15:35 hits=3 Weekly-POC:r8:dL Monthly-POC:r6:dL Yearly-POC:r2:dS
43550: PO	0	16:05:17.602	Core 04	2026.09.04 15:40:00   [SRJ-EA] CONFIRMPOLL bar=2026.09.04 15:35 anchor=Monthly-POC dir=LONG oppCandle=1 bodyDir=1 body=18pts doji=0 touchAttr=1 confirm=1 shadow=true
43684: JO	0	16:05:17.602	Core 04	2026.09.04 15:40:00   [SRJ-EA] TPCENSUS #213 bar=2026.09.04 15:35 dir=LONG ref=1.15964 winner=Yearly-POC best=1.15987 distPts=23 empties=0 admitted= PDH:448 ASH:367 ASL:260 LOH:338 LOL:224 NYH:306 PMH:415 PML:288 YASH:367 YASL:260 YLOH:338 YLOL:224 YNYH:337 YNYL:53 YPMH:415 YPML:288 LIVE:177 LIVE:33 LIVE:88 LIVE:873 LIVE:734 LIVE:1033 LIVE:769 LIVE:807 LIVE:28 LIVE:826 LIVE:618 LIVE:1043 LIV
43785: JQ	0	16:05:17.602	Core 04	2026.09.04 15:40:00   [SRJ-EA] SIDE1O_ELIGSTATE bar=2026.09.04 15:35 dir=LONG sessUsed=0 divLatch=1 cqd=UNREAD confirm=S4_ARMED slRef=1.15835 rLive=0.18 livePass=0
43786: LH	0	16:05:17.602	Core 04	2026.09.04 15:40:00   [SRJ-EA] SIDE1Q_CQDKILL bar=2026.09.04 15:35 dir=LONG obValid=1.0 fvgValid=1.0 cqdDiv=UNREAD
43789: MI	0	16:05:17.602	Core 04	2026.09.04 15:40:00   [SRJ-EA] TP_ELECT shadow=true entry=1.15964 sl=1.15835 tp=1.15987 R=0.18 bar=2026.09.04 15:35 latchBar=2026.09.04 15:40
71332: KJ	0	16:06:01.841	Core 04	2026.09.09 23:59:58   [SRJ-EA] A6SUPP bar=2026.09.04 15:35 class=FRACTAL_SUPPRESSED target=UNRESOLVED_WALK reason=NO_CENSUS_ROW verdict=NONE
71333: KQ	0	16:06:01.841	Core 04	2026.09.09 23:59:58   [SRJ-EA] A6SUPP bar=2026.09.04 15:35 class=FRACTAL_SUPPRESSED target=UNRESOLVED_WALK reason=NO_CENSUS_ROW verdict=NONE
--- bar 2026.09.04 15:40 ---
43795: DH	0	16:05:17.602	Core 04	2026.09.04 15:40:00   [SRJ-EA] A6REFUSED class=ABSENT_DECLINED bar=2026.09.04 15:40 state=S5_GATE_CHECK dir=LONG predicate=TP_RR_FAIL
43804: JN	0	16:05:17.602	Core 04	2026.09.04 15:45:00   [SRJ-EA] UJBARMAP bar=2026.09.04 15:40 o=1.15964 h=1.16006 l=1.15920 c=1.15990 mpoc=1.15935 mvwap=1.16025 wpoc=1.15935 wvwap=1.16020 dpoc=1.16284 dvwap=1.16196 ltf=1.0
43805: KN	0	16:05:17.602	Core 04	2026.09.04 15:45:00   [SRJ-EA] RETESTBOOK bar=2026.09.04 15:40 hits=2 Weekly-POC:r8:dL Monthly-POC:r6:dL
43809: JL	0	16:05:17.602	Core 04	2026.09.04 15:45:00   [SRJ-EA] CONFIRMPOLL bar=2026.09.04 15:40 anchor=Monthly-POC dir=LONG oppCandle=0 bodyDir=1 body=26pts doji=0 touchAttr=1 confirm=0 shadow=true
43812: EG	0	16:05:17.602	Core 04	2026.09.04 15:45:00   [SRJ-EA] ANCHOR_ELECT bar=2026.09.04 15:40 action=SEED poi=Monthly-POC rank=6 tier=3 dir=LONG
43813: GN	0	16:05:17.602	Core 04	2026.09.04 15:45:00   [SRJ-EA] SIDE1T_SEEDBIAS bar=2026.09.04 15:40 dir=LONG biasAligned=1 verdict=CONSIDER
71334: MD	0	16:06:01.841	Core 04	2026.09.09 23:59:58   [SRJ-EA] A6SUPP bar=2026.09.04 15:40 class=FRACTAL_SUPPRESSED target=UNRESOLVED_WALK reason=NO_CENSUS_ROW verdict=NONE
--- bar 2026.09.04 15:45 ---
43854: QG	0	16:05:17.602	Core 04	2026.09.04 15:50:00   [SRJ-EA] UJBARMAP bar=2026.09.04 15:45 o=1.15990 h=1.16016 l=1.15902 c=1.16006 mpoc=1.15935 mvwap=1.16025 wpoc=1.15935 wvwap=1.16019 dpoc=1.16284 dvwap=1.16186 ltf=1.0
43855: QI	0	16:05:17.602	Core 04	2026.09.04 15:50:00   [SRJ-EA] FRESHCOUNT #93 bar=2026.09.04 15:45 state=S4_ARMED obDead=0 fvgDead=1 oppFvg=0 adverse=1 verdict=HOLD scope=pre cum1=27 cum2=7 cum3=0
43981: RN	0	16:05:17.602	Core 04	2026.09.04 15:50:00   [SRJ-EA] TPCENSUS #214 bar=2026.09.04 15:45 dir=LONG ref=1.16007 winner=Monthly-VWAP best=1.16025 distPts=18 empties=0 admitted= PDH:405 ASH:324 ASL:217 LOH:295 LOL:181 NYH:263 PMH:372 PML:245 YASH:324 YASL:217 YLOH:295 YLOL:181 YNYH:294 YNYL:10 YPMH:372 YPML:245 LIVE:134 LIVE:45 LIVE:830 LIVE:691 LIVE:990 LIVE:726 LIVE:764 LIVE:783 LIVE:575 LIVE:1000 LIVE:822 LIVE:1056
43993: JO	0	16:05:17.602	Core 04	2026.09.04 15:50:00   [SRJ-EA] UJ1R bar=2026.09.04 15:45 src=POLL entry=1.16007 sl=1.15907 tp=1.16025 risk=0.00100 reward=0.00018 R=0.18 verdict=FAIL
44002: QI	0	16:05:17.602	Core 04	2026.09.04 15:50:00   [SRJ-EA] SUPPRESSED bar=2026.09.04 15:45 poi=Yearly-POC dir=LONG opp=0 higher=0 heldPoi=Yearly-POC heldDir=LONG heldState=S3_ZONE_WAIT cum_n=85 cum_opp=11 cum_hi=2 cum_both=1 action=SUPERSEDED
44003: LJ	0	16:05:17.602	Core 04	2026.09.04 15:50:00   [SRJ-EA] RETESTBOOK bar=2026.09.04 15:45 hits=3 Weekly-POC:r8:dL Monthly-POC:r6:dL Yearly-POC:r2:dL
44006: CH	0	16:05:17.602	Core 04	2026.09.04 15:50:00   [SRJ-EA] CONFIRMPOLL bar=2026.09.04 15:45 anchor=Yearly-POC dir=LONG oppCandle=0 bodyDir=1 body=16pts doji=0 touchAttr=1 confirm=0 shadow=true
71335: RK	0	16:06:01.841	Core 04	2026.09.09 23:59:58   [SRJ-EA] A6SUPP bar=2026.09.04 15:45 class=FRACTAL_SUPPRESSED target=UNRESOLVED_WALK reason=NO_CENSUS_ROW verdict=NONE
--- bar 2026.09.04 15:50 ---
44032: QL	0	16:05:17.602	Core 04	2026.09.04 15:55:00   [SRJ-EA] UJBARMAP bar=2026.09.04 15:50 o=1.16007 h=1.16044 l=1.15978 c=1.15996 mpoc=1.15935 mvwap=1.16024 wpoc=1.15935 wvwap=1.16019 dpoc=1.16284 dvwap=1.16178 ltf=1.0
44034: JE	0	16:05:17.602	Core 04	2026.09.04 15:55:00   [SRJ-EA] FRESHCOUNT #94 bar=2026.09.04 15:50 state=S4_ARMED obDead=0 fvgDead=1 oppFvg=0 adverse=1 verdict=HOLD scope=pre cum1=28 cum2=7 cum3=0
44160: PL	0	16:05:17.602	Core 04	2026.09.04 15:55:00   [SRJ-EA] TPCENSUS #215 bar=2026.09.04 15:50 dir=LONG ref=1.15997 winner=YLOH best=1.16302 distPts=305 empties=0 admitted= PDH:415 ASH:334 ASL:227 LOH:305 LOL:191 NYH:273 PMH:382 PML:255 YASH:334 YASL:227 YLOH:305 YLOL:191 YNYH:304 YNYL:20 YPMH:382 YPML:255 LIVE:144 LIVE:55 LIVE:840 LIVE:701 LIVE:1000 LIVE:736 LIVE:774 LIVE:793 LIVE:585 LIVE:1010 LIVE:832 LIVE:1066 LIVE:
44172: PQ	0	16:05:17.602	Core 04	2026.09.04 15:55:00   [SRJ-EA] UJ1R bar=2026.09.04 15:50 src=POLL entry=1.15997 sl=1.15907 tp=1.16302 risk=0.00090 reward=0.00305 R=3.39 verdict=PASS
44178: RJ	0	16:05:17.602	Core 04	2026.09.04 15:55:00   [SRJ-EA] SUPPRESSED bar=2026.09.04 15:50 poi=Yearly-POC dir=LONG opp=0 higher=0 heldPoi=Yearly-POC heldDir=LONG heldState=S4_ARMED cum_n=86 cum_opp=11 cum_hi=2 cum_both=1 action=HELD
44179: MF	0	16:05:17.602	Core 04	2026.09.04 15:55:00   [SRJ-EA] RETESTBOOK bar=2026.09.04 15:50 hits=3 Weekly-VWAP:r9:dS Monthly-VWAP:r7:dS Yearly-POC:r2:dL
44182: RL	0	16:05:17.602	Core 04	2026.09.04 15:55:00   [SRJ-EA] CONFIRMPOLL bar=2026.09.04 15:50 anchor=Yearly-POC dir=LONG oppCandle=0 bodyDir=0 body=11pts doji=0 touchAttr=1 confirm=0 shadow=true
71336: NN	0	16:06:01.841	Core 04	2026.09.09 23:59:58   [SRJ-EA] A6SUPP bar=2026.09.04 15:50 class=FRACTAL_SUPPRESSED target=UNRESOLVED_WALK reason=NO_CENSUS_ROW verdict=NONE
--- bar 2026.09.04 15:55 ---
44195: GS	0	16:05:17.602	Core 04	2026.09.04 16:00:00   [SRJ-EA] UJBARMAP bar=2026.09.04 15:55 o=1.15997 h=1.16023 l=1.15964 c=1.16017 mpoc=1.15935 mvwap=1.16024 wpoc=1.15935 wvwap=1.16019 dpoc=1.16284 dvwap=1.16174 ltf=1.0
44196: DE	0	16:05:17.602	Core 04	2026.09.04 16:00:00   [SRJ-EA] FRESHCOUNT #95 bar=2026.09.04 15:55 state=S4_ARMED obDead=0 fvgDead=1 oppFvg=0 adverse=1 verdict=HOLD scope=pre cum1=29 cum2=7 cum3=0
44322: IL	0	16:05:17.602	Core 04	2026.09.04 16:00:00   [SRJ-EA] TPCENSUS #216 bar=2026.09.04 15:55 dir=LONG ref=1.16018 winner=YLOH best=1.16302 distPts=284 empties=0 admitted= PDH:394 ASH:313 ASL:206 LOH:284 LOL:170 NYH:252 PMH:361 PML:234 YASH:313 YASL:206 YLOH:284 YLOL:170 YNYH:283 YPMH:361 YPML:234 LIVE:123 LIVE:34 LIVE:819 LIVE:680 LIVE:979 LIVE:715 LIVE:753 LIVE:772 LIVE:564 LIVE:989 LIVE:811 LIVE:1045 LIVE:848 LIVE:9
44334: OQ	0	16:05:17.602	Core 04	2026.09.04 16:00:00   [SRJ-EA] UJ1R bar=2026.09.04 15:55 src=POLL entry=1.16018 sl=1.15907 tp=1.16302 risk=0.00111 reward=0.00284 R=2.56 verdict=PASS
44339: KS	0	16:05:17.602	Core 04	2026.09.04 16:00:00   [SRJ-EA] SUPPRESSED bar=2026.09.04 15:55 poi=Yearly-POC dir=LONG opp=0 higher=0 heldPoi=Yearly-POC heldDir=LONG heldState=S4_ARMED cum_n=87 cum_opp=11 cum_hi=2 cum_both=1 action=HELD
44340: JO	0	16:05:17.602	Core 04	2026.09.04 16:00:00   [SRJ-EA] RETESTBOOK bar=2026.09.04 15:55 hits=2 Weekly-VWAP:r9:dS Yearly-POC:r2:dL
44343: QF	0	16:05:17.602	Core 04	2026.09.04 16:00:00   [SRJ-EA] CONFIRMPOLL bar=2026.09.04 15:55 anchor=Yearly-POC dir=LONG oppCandle=1 bodyDir=1 body=20pts doji=0 touchAttr=1 confirm=1 shadow=true
44475: RG	0	16:05:17.602	Core 04	2026.09.04 16:00:00   [SRJ-EA] TPCENSUS #217 bar=2026.09.04 15:55 dir=LONG ref=1.16018 winner=YLOH best=1.16302 distPts=284 empties=0 admitted= PDH:394 ASH:313 ASL:206 LOH:284 LOL:170 NYH:252 PMH:361 PML:234 YASH:313 YASL:206 YLOH:284 YLOL:170 YNYH:283 YPMH:361 YPML:234 LIVE:123 LIVE:34 LIVE:819 LIVE:680 LIVE:979 LIVE:715 LIVE:753 LIVE:772 LIVE:564 LIVE:989 LIVE:811 LIVE:1045 LIVE:848 LIVE:9
44600: QQ	0	16:05:17.602	Core 04	2026.09.04 16:00:00   [SRJ-EA] SIDE1O_ELIGSTATE bar=2026.09.04 15:55 dir=LONG sessUsed=0 divLatch=1 cqd=UNREAD confirm=S4_ARMED slRef=1.15847 rLive=1.66 livePass=1
44601: HH	0	16:05:17.602	Core 04	2026.09.04 16:00:00   [SRJ-EA] SIDE1Q_CQDKILL bar=2026.09.04 15:55 dir=LONG obValid=1.0 fvgValid=0.0 cqdDiv=UNREAD
44604: MN	0	16:05:17.602	Core 04	2026.09.04 16:00:00   [SRJ-EA] TP_ELECT shadow=true entry=1.16018 sl=1.15847 tp=1.16302 R=1.66 bar=2026.09.04 15:55 latchBar=2026.09.04 16:00
44607: HS	0	16:05:17.602	Core 04	2026.09.04 16:00:00   [SRJ-EA] A6FIRED class=SELECTED state=FIRED bar=2026.09.04 15:55 dir=LONG tp=1.16302 r=1.66 sl=1.15847 mode=1SWING div=hidden
44610: IG	0	16:05:17.602	Core 04	2026.09.04 16:00:00   [SRJ-EA] UJ1R bar=2026.09.04 15:55 src=FIRE entry=1.16018 sl=1.15847 tp=1.16302 risk=0.00171 reward=0.00284 R=1.66 verdict=PASS
44623: NK	0	16:05:17.602	Core 04	2026.09.04 16:00:00   [SRJ-EA] ENTRY_TICKET bar=2026.09.04 15:55 ticket=6 deal=6 pid=6 ppid=6 magic=773002
71337: CE	0	16:06:01.841	Core 04	2026.09.09 23:59:58   [SRJ-EA] A6SUPP bar=2026.09.04 15:55 class=FRACTAL_SUPPRESSED targetPx=1.15847 targetBT=2026.09.04 15:30 verdict=NONE
71338: QH	0	16:06:01.841	Core 04	2026.09.09 23:59:58   [SRJ-EA] A6SUPP bar=2026.09.04 15:55 class=FRACTAL_SUPPRESSED targetPx=1.15847 targetBT=2026.09.04 15:30 verdict=NONE
--- bar 2026.09.04 16:00 ---
44628: LM	0	16:05:17.602	Core 04	2026.09.04 16:05:01   [SRJ-EA] UJBARMAP bar=2026.09.04 16:00 o=1.16018 h=1.16037 l=1.15989 c=1.15990 mpoc=1.15935 mvwap=1.16024 wpoc=1.15935 wvwap=1.16019 dpoc=1.16284 dvwap=1.16170 ltf=1.0
44629: PN	0	16:05:17.602	Core 04	2026.09.04 16:05:01   [SRJ-EA] RETESTBOOK bar=2026.09.04 16:00 hits=2 Weekly-VWAP:r9:dS Monthly-VWAP:r7:dS
44633: OL	0	16:05:17.602	Core 04	2026.09.04 16:05:01   [SRJ-EA] CONFIRMPOLL bar=2026.09.04 16:00 anchor=Monthly-VWAP dir=SHORT oppCandle=1 bodyDir=1 body=28pts doji=0 touchAttr=0 confirm=0 shadow=true
--- bar 2026.09.04 16:05 ---
44650: IK	0	16:05:17.602	Core 04	2026.09.04 16:10:00   [SRJ-EA] UJBARMAP bar=2026.09.04 16:05 o=1.15990 h=1.16007 l=1.15968 c=1.15982 mpoc=1.15935 mvwap=1.16024 wpoc=1.15935 wvwap=1.16019 dpoc=1.16284 dvwap=1.16167 ltf=1.0
44651: LM	0	16:05:17.602	Core 04	2026.09.04 16:10:00   [SRJ-EA] RETESTBOOK bar=2026.09.04 16:05 hits=0
===== j41 RECON62-B78_JOURNAL.log 15:20-16:05 2026.09.04 =====
--- bar 2026.09.04 15:20 ---
43512: CS	0	00:48:36.837	SRJ_FlowNexus_EA (EURUSD,M5)	2026.09.04 15:25:00   [SRJ-EA] UJBARMAP bar=2026.09.04 15:20 o=1.16242 h=1.16248 l=1.16230 c=1.16234 mpoc=1.15935 mvwap=1.16027 wpoc=1.15935 wvwap=1.16021 dpoc=1.16284 dvwap=1.16251 ltf=1.0
43513: CS	0	00:48:36.837	SRJ_FlowNexus_EA (EURUSD,M5)	2026.09.04 15:25:00   [SRJ-EA] RETESTBOOK bar=2026.09.04 15:20 hits=0
--- bar 2026.09.04 15:25 ---
43520: CS	0	00:48:36.999	SRJ_FlowNexus_EA (EURUSD,M5)	2026.09.04 15:30:00   [SRJ-EA] UJBARMAP bar=2026.09.04 15:25 o=1.16233 h=1.16270 l=1.16232 c=1.16258 mpoc=1.15935 mvwap=1.16028 wpoc=1.15935 wvwap=1.16022 dpoc=1.16284 dvwap=1.16251 ltf=1.0
43521: CS	0	00:48:36.999	SRJ_FlowNexus_EA (EURUSD,M5)	2026.09.04 15:30:00   [SRJ-EA] RETESTBOOK bar=2026.09.04 15:25 hits=0
--- bar 2026.09.04 15:30 ---
43541: CS	0	00:48:37.111	SRJ_FlowNexus_EA (EURUSD,M5)	2026.09.04 15:35:00   [SRJ-EA] UJBARMAP bar=2026.09.04 15:30 o=1.16260 h=1.16260 l=1.15847 c=1.15945 mpoc=1.15935 mvwap=1.16026 wpoc=1.15935 wvwap=1.16020 dpoc=1.16284 dvwap=1.16220 ltf=-1.0
43545: CS	0	00:48:37.111	SRJ_FlowNexus_EA (EURUSD,M5)	2026.09.04 15:35:00   [SRJ-EA] RETESTBOOK bar=2026.09.04 15:30 hits=2 Weekly-POC:r8:dL Monthly-POC:r6:dL
43549: CS	0	00:48:37.111	SRJ_FlowNexus_EA (EURUSD,M5)	2026.09.04 15:35:00   [SRJ-EA] CONFIRMPOLL bar=2026.09.04 15:30 anchor=Monthly-POC dir=LONG oppCandle=0 bodyDir=0 body=315pts doji=0 touchAttr=0 confirm=0 shadow=true
43552: CS	0	00:48:37.111	SRJ_FlowNexus_EA (EURUSD,M5)	2026.09.04 15:35:00   [SRJ-EA] ANCHOR_ELECT bar=2026.09.04 15:30 action=SEED poi=Monthly-POC rank=6 tier=3 dir=LONG
43553: CS	0	00:48:37.111	SRJ_FlowNexus_EA (EURUSD,M5)	2026.09.04 15:35:00   [SRJ-EA] SIDE1T_SEEDBIAS bar=2026.09.04 15:30 dir=LONG biasAligned=0 verdict=REJECT-BIAS-TIMING
69423: CS	0	00:49:38.097	SRJ_FlowNexus_EA (EURUSD,M5)	2026.09.09 23:59:58   [SRJ-EA] A6SUPP bar=2026.09.04 15:30 class=FRACTAL_SUPPRESSED target=UNRESOLVED_WALK reason=NO_CENSUS_ROW verdict=NONE
--- bar 2026.09.04 15:35 ---
43603: CS	0	00:48:37.173	SRJ_FlowNexus_EA (EURUSD,M5)	2026.09.04 15:40:00   [SRJ-EA] UJBARMAP bar=2026.09.04 15:35 o=1.15946 h=1.16018 l=1.15914 c=1.15964 mpoc=1.15935 mvwap=1.16025 wpoc=1.15935 wvwap=1.16020 dpoc=1.16284 dvwap=1.16204 ltf=1.0
43607: CS	0	00:48:37.173	SRJ_FlowNexus_EA (EURUSD,M5)	2026.09.04 15:40:00   [SRJ-EA] ROWKEY bar=2026.09.04 15:35 row=2026.09.04 15:35 lines=Weekly-POC:8,Monthly-POC:6,Yearly-POC:2 key=Yearly-POC tier=1 own=Weekly-POC,Monthly-POC,Yearly-POC fallback=0
43732: CS	0	00:48:37.174	SRJ_FlowNexus_EA (EURUSD,M5)	2026.09.04 15:40:00   [SRJ-EA] TPCENSUS #212 bar=2026.09.04 15:35 dir=LONG ref=1.15964 winner=YLOH best=1.16302 distPts=338 empties=0 admitted= PDH:448 ASH:367 ASL:260 LOH:338 LOL:224 NYH:306 PMH:415 PML:288 YASH:367 YASL:260 YLOH:338 YLOL:224 YNYH:337 YNYL:53 YPMH:415 YPML:288 LIVE:177 LIVE:33 LIVE:88 LIVE:873 LIVE:734 LIVE:1033 LIVE:769 LIVE:807 LIVE:28 LIVE:826 LIVE:6
43744: CS	0	00:48:37.175	SRJ_FlowNexus_EA (EURUSD,M5)	2026.09.04 15:40:00   [SRJ-EA] UJ1R bar=2026.09.04 15:35 src=POLL entry=1.15964 sl=1.15907 tp=1.16302 risk=0.00057 reward=0.00338 R=5.93 verdict=PASS
43752: CS	0	00:48:37.175	SRJ_FlowNexus_EA (EURUSD,M5)	2026.09.04 15:40:00   [SRJ-EA] SUPPRESSED bar=2026.09.04 15:35 poi=Yearly-POC dir=SHORT opp=1 higher=1 heldPoi=Monthly-POC heldDir=LONG heldState=S4_ARMED cum_n=84 cum_opp=11 cum_hi=2 cum_both=1 action=HELD
43753: CS	0	00:48:37.175	SRJ_FlowNexus_EA (EURUSD,M5)	2026.09.04 15:40:00   [SRJ-EA] RETESTBOOK bar=2026.09.04 15:35 hits=3 Weekly-POC:r8:dL Monthly-POC:r6:dL Yearly-POC:r2:dS
43756: CS	0	00:48:37.175	SRJ_FlowNexus_EA (EURUSD,M5)	2026.09.04 15:40:00   [SRJ-EA] CONFIRMPOLL bar=2026.09.04 15:35 anchor=Monthly-POC dir=LONG oppCandle=1 bodyDir=1 body=18pts doji=0 touchAttr=1 confirm=1 shadow=true
43766: CS	0	00:48:37.175	SRJ_FlowNexus_EA (EURUSD,M5)	2026.09.04 15:40:00   [SRJ-EA] ROWKEY bar=2026.09.04 15:35 row=2026.09.04 15:35 lines=Weekly-POC:8,Monthly-POC:6,Yearly-POC:2 key=Yearly-POC tier=1 own=Weekly-POC,Monthly-POC,Yearly-POC fallback=0
43891: CS	0	00:48:37.176	SRJ_FlowNexus_EA (EURUSD,M5)	2026.09.04 15:40:00   [SRJ-EA] TPCENSUS #213 bar=2026.09.04 15:35 dir=LONG ref=1.15964 winner=YLOH best=1.16302 distPts=338 empties=0 admitted= PDH:448 ASH:367 ASL:260 LOH:338 LOL:224 NYH:306 PMH:415 PML:288 YASH:367 YASL:260 YLOH:338 YLOL:224 YNYH:337 YNYL:53 YPMH:415 YPML:288 LIVE:177 LIVE:33 LIVE:88 LIVE:873 LIVE:734 LIVE:1033 LIVE:769 LIVE:807 LIVE:28 LIVE:826 LIVE:6
43992: CS	0	00:48:37.177	SRJ_FlowNexus_EA (EURUSD,M5)	2026.09.04 15:40:00   [SRJ-EA] SIDE1O_ELIGSTATE bar=2026.09.04 15:35 dir=LONG sessUsed=0 divLatch=1 cqd=UNREAD confirm=S4_ARMED slRef=1.15835 rLive=2.62 livePass=1
43993: CS	0	00:48:37.177	SRJ_FlowNexus_EA (EURUSD,M5)	2026.09.04 15:40:00   [SRJ-EA] SIDE1Q_CQDKILL bar=2026.09.04 15:35 dir=LONG obValid=1.0 fvgValid=1.0 cqdDiv=UNREAD
43996: CS	0	00:48:37.177	SRJ_FlowNexus_EA (EURUSD,M5)	2026.09.04 15:40:00   [SRJ-EA] TP_ELECT shadow=true entry=1.15964 sl=1.15835 tp=1.16302 R=2.62 bar=2026.09.04 15:35 latchBar=2026.09.04 15:40
43999: CS	0	00:48:37.177	SRJ_FlowNexus_EA (EURUSD,M5)	2026.09.04 15:40:00   [SRJ-EA] A6FIRED class=SELECTED state=FIRED bar=2026.09.04 15:35 dir=LONG tp=1.16302 r=2.62 sl=1.15835 mode=1SWING div=regular
44002: CS	0	00:48:37.177	SRJ_FlowNexus_EA (EURUSD,M5)	2026.09.04 15:40:00   [SRJ-EA] UJ1R bar=2026.09.04 15:35 src=FIRE entry=1.15964 sl=1.15835 tp=1.16302 risk=0.00129 reward=0.00338 R=2.62 verdict=PASS
44015: CS	0	00:48:37.177	SRJ_FlowNexus_EA (EURUSD,M5)	2026.09.04 15:40:00   [SRJ-EA] ENTRY_TICKET bar=2026.09.04 15:35 ticket=6 deal=6 pid=6 ppid=6 magic=773002
69424: CS	0	00:49:38.097	SRJ_FlowNexus_EA (EURUSD,M5)	2026.09.09 23:59:58   [SRJ-EA] A6SUPP bar=2026.09.04 15:35 class=FRACTAL_SUPPRESSED target=UNRESOLVED_WALK reason=NO_CENSUS_ROW verdict=NONE
69425: CS	0	00:49:38.097	SRJ_FlowNexus_EA (EURUSD,M5)	2026.09.09 23:59:58   [SRJ-EA] A6SUPP bar=2026.09.04 15:35 class=FRACTAL_SUPPRESSED target=UNRESOLVED_WALK reason=NO_CENSUS_ROW verdict=NONE
--- bar 2026.09.04 15:40 ---
44023: CS	0	00:48:37.315	SRJ_FlowNexus_EA (EURUSD,M5)	2026.09.04 15:45:00   [SRJ-EA] UJBARMAP bar=2026.09.04 15:40 o=1.15964 h=1.16006 l=1.15920 c=1.15990 mpoc=1.15935 mvwap=1.16025 wpoc=1.15935 wvwap=1.16020 dpoc=1.16284 dvwap=1.16196 ltf=1.0
44024: CS	0	00:48:37.315	SRJ_FlowNexus_EA (EURUSD,M5)	2026.09.04 15:45:00   [SRJ-EA] RETESTBOOK bar=2026.09.04 15:40 hits=2 Weekly-POC:r8:dL Monthly-POC:r6:dL
44028: CS	0	00:48:37.316	SRJ_FlowNexus_EA (EURUSD,M5)	2026.09.04 15:45:00   [SRJ-EA] CONFIRMPOLL bar=2026.09.04 15:40 anchor=Monthly-POC dir=LONG oppCandle=0 bodyDir=1 body=26pts doji=0 touchAttr=1 confirm=0 shadow=true
44043: CS	0	00:48:37.316	SRJ_FlowNexus_EA (EURUSD,M5)	2026.09.04 15:45:00   [SRJ-EA] MTEXIT bar=2026.09.04 15:40 reason=POI_BODY_BREAK line=Yearly-POC lineVal=1.15987 entry=1.15964 exit=1.15990
--- bar 2026.09.04 15:45 ---
44055: CS	0	00:48:37.350	SRJ_FlowNexus_EA (EURUSD,M5)	2026.09.04 15:50:00   [SRJ-EA] UJBARMAP bar=2026.09.04 15:45 o=1.15990 h=1.16016 l=1.15902 c=1.16006 mpoc=1.15935 mvwap=1.16025 wpoc=1.15935 wvwap=1.16019 dpoc=1.16284 dvwap=1.16186 ltf=1.0
44056: CS	0	00:48:37.350	SRJ_FlowNexus_EA (EURUSD,M5)	2026.09.04 15:50:00   [SRJ-EA] RETESTBOOK bar=2026.09.04 15:45 hits=3 Weekly-POC:r8:dL Monthly-POC:r6:dL Yearly-POC:r2:dL
44060: CS	0	00:48:37.350	SRJ_FlowNexus_EA (EURUSD,M5)	2026.09.04 15:50:00   [SRJ-EA] CONFIRMPOLL bar=2026.09.04 15:45 anchor=Yearly-POC dir=LONG oppCandle=0 bodyDir=1 body=16pts doji=0 touchAttr=1 confirm=0 shadow=true
--- bar 2026.09.04 15:50 ---
44065: CS	0	00:48:37.395	SRJ_FlowNexus_EA (EURUSD,M5)	2026.09.04 15:55:00   [SRJ-EA] UJBARMAP bar=2026.09.04 15:50 o=1.16007 h=1.16044 l=1.15978 c=1.15996 mpoc=1.15935 mvwap=1.16024 wpoc=1.15935 wvwap=1.16019 dpoc=1.16284 dvwap=1.16178 ltf=1.0
44068: CS	0	00:48:37.395	SRJ_FlowNexus_EA (EURUSD,M5)	2026.09.04 15:55:00   [SRJ-EA] RETESTBOOK bar=2026.09.04 15:50 hits=3 Weekly-VWAP:r9:dS Monthly-VWAP:r7:dS Yearly-POC:r2:dL
44072: CS	0	00:48:37.395	SRJ_FlowNexus_EA (EURUSD,M5)	2026.09.04 15:55:00   [SRJ-EA] CONFIRMPOLL bar=2026.09.04 15:50 anchor=Yearly-POC dir=LONG oppCandle=0 bodyDir=0 body=11pts doji=0 touchAttr=1 confirm=0 shadow=true
--- bar 2026.09.04 15:55 ---
44078: CS	0	00:48:37.757	SRJ_FlowNexus_EA (EURUSD,M5)	2026.09.04 16:00:00   [SRJ-EA] UJBARMAP bar=2026.09.04 15:55 o=1.15997 h=1.16023 l=1.15964 c=1.16017 mpoc=1.15935 mvwap=1.16024 wpoc=1.15935 wvwap=1.16019 dpoc=1.16284 dvwap=1.16174 ltf=1.0
44079: CS	0	00:48:37.757	SRJ_FlowNexus_EA (EURUSD,M5)	2026.09.04 16:00:00   [SRJ-EA] RETESTBOOK bar=2026.09.04 15:55 hits=2 Weekly-VWAP:r9:dS Yearly-POC:r2:dL
44083: CS	0	00:48:37.757	SRJ_FlowNexus_EA (EURUSD,M5)	2026.09.04 16:00:00   [SRJ-EA] CONFIRMPOLL bar=2026.09.04 15:55 anchor=Yearly-POC dir=LONG oppCandle=1 bodyDir=1 body=20pts doji=0 touchAttr=1 confirm=1 shadow=true
--- bar 2026.09.04 16:00 ---
44087: CS	0	00:48:37.772	SRJ_FlowNexus_EA (EURUSD,M5)	2026.09.04 16:05:01   [SRJ-EA] UJBARMAP bar=2026.09.04 16:00 o=1.16018 h=1.16037 l=1.15989 c=1.15990 mpoc=1.15935 mvwap=1.16024 wpoc=1.15935 wvwap=1.16019 dpoc=1.16284 dvwap=1.16170 ltf=1.0
44088: CS	0	00:48:37.772	SRJ_FlowNexus_EA (EURUSD,M5)	2026.09.04 16:05:01   [SRJ-EA] RETESTBOOK bar=2026.09.04 16:00 hits=2 Weekly-VWAP:r9:dS Monthly-VWAP:r7:dS
44092: CS	0	00:48:37.772	SRJ_FlowNexus_EA (EURUSD,M5)	2026.09.04 16:05:01   [SRJ-EA] CONFIRMPOLL bar=2026.09.04 16:00 anchor=Monthly-VWAP dir=SHORT oppCandle=1 bodyDir=1 body=28pts doji=0 touchAttr=0 confirm=0 shadow=true
--- bar 2026.09.04 16:05 ---
44095: CS	0	00:48:37.782	SRJ_FlowNexus_EA (EURUSD,M5)	2026.09.04 16:10:00   [SRJ-EA] UJBARMAP bar=2026.09.04 16:05 o=1.15990 h=1.16007 l=1.15968 c=1.15982 mpoc=1.15935 mvwap=1.16024 wpoc=1.15935 wvwap=1.16019 dpoc=1.16284 dvwap=1.16167 ltf=1.0
44096: CS	0	00:48:37.782	SRJ_FlowNexus_EA (EURUSD,M5)	2026.09.04 16:10:00   [SRJ-EA] RETESTBOOK bar=2026.09.04 16:05 hits=0

## R2 RAW ROWS (machine rows beside his words; grades in the result)

R2.4/R2.5 UJPROBE (h4/h1/m15/ltf; identical both journals):
- 15:30 j37:43333/j41:43540: h4=1.0 h1=-1.0 m15=1.0 ltf=-1.0 (5m bearish pre-seed).
- 15:35 j37:43395/j41:43602: h4=1.0 h1=-1.0 m15=1.0 ltf=1.0 (5m bullish at the 15:35 bar).
- 15:40 j37:43802/j41:44021: ltf=1.0. 15:45 j37:43853/j41:44054: ltf=1.0. 15:50 j37:44031/j41:44064: ltf=1.0.
- 15:55 j37:44193/j41:44076: h4=1.0 h1=-1.0 m15=1.0 ltf=1.0 (5m bullish at the 15:55 bar).
- 16:00 j37:44627/j41:44086: ltf=1.0 (5m bullish at the 16:00 open bar).
- HTF majority (4H bull + 1H bear + 15m bull = bull majority) supports LONG at both bars on both journals.
R2.5 sweep: London session low (09:00-12:00 server per spec §3.0) from UJBARMAP rows = 1.16188 at 11:05 (37 bars); first strict wick below = 12:50 low 1.16173 (before 15:35). Same context both bars. His rows 279 (NY TF ++, 4H Bull 1H Bear 15m Bull bias bull POI Y AVP CVD 3) + 280 (NY MR sweep LD.L, 0.84) quoted whole in result.
R2.6 FRESHCOUNT: j37 #93 (15:45 bar) j37:43855, #94 (15:50) j37:44034, #95 (15:55) j37:44196 - all state=S4_ARMED obDead=0 fvgDead=1 oppFvg=0 adverse=1 verdict=HOLD scope=pre. Never 2-of-3. At the 15:35-bar pass (seed just planted) NO ROW.
R2.7 census (j37 kept, bullish, B-75 R1 method): 15:35 -> 188 tot (76 live, 112 dead), live-zoned 6, WP-met 5, WF-met 6. 15:55 -> identical counts (no promo/kill between). Machine pick zones: 15:30 pick 2973 1.16245-1.16275 (j37:43360-43362/j41:43567-43569); 15:35 S4RQZ 2793 (j37:43553/j41:43759); 15:40+ pick 2793 1.15907-1.15933 (j37:43825-43827); 15:55 pick 2793 (SLICE_B74/B-75).
R2.8 CQD rows: 15:35 j37:43785 ELIGSTATE cqd=UNREAD + j37:43786 CQDKILL cqdDiv=UNREAD; j41:43992 + j41:43993 same UNREAD. 15:55 j37:44600 + j37:44601 same UNREAD. His CVD=3 quoted whole from rows 279/280, no interpretation.
R2.10 j37 9/4 NY pre-15:35 fires: NONE (no A6FIRED/ENTRY_TICKET before 15:35; 10:40 SHORT is London-morning tester-only INVALID per register C/s57).
R2.11 j41 15:45 exit beside: MTEXIT j41:44043 bar=15:40 reason=POI_BODY_BREAK line=Yearly-POC lineVal=1.15987 entry=1.15964 exit=1.15990; machine anchor at 15:45 = Yearly-POC (CONFIRMPOLL j41:44060 anchor=Yearly-POC); s36 same-Y-POC-cross-does-not-matter + s87 quoted in result, no verdict.

## R3 RAW DIFF (race winner/value/R/PASS-FAIL by bar+direction; kept vs RK)

===== j37 =====
43346: II	0	16:05:17.602	Core 04	2026.09.04 15:35:00   [SRJ-EA] SIDE1T_SEEDBIAS bar=2026.09.04 15:30 dir=LONG biasAligned=0 verdict=REJECT-BIAS-TIMING
43360: KL	0	16:05:17.602	Core 04	2026.09.04 15:35:00   [SRJ-EA] ZONEID bar=2026.09.04 15:30 site=S3PICK xobId=2973 fvgId=0
43361: PO	0	16:05:17.602	Core 04	2026.09.04 15:35:00   [SRJ-EA] XOBPROMO bar=2026.09.04 15:30 site=S3PICK xobId=2973 raw=1788519600.0 promoT=2026.09.04 11:00
43362: RR	0	16:05:17.602	Core 04	2026.09.04 15:35:00   [SRJ-EA] ZONEPICK bar=2026.09.04 15:30 dir=LONG haveFvg=0 fvgInPlay=0 haveXob=1 xobInPlay=1 downgraded=0 fvg=--- xob=1.16245-1.16275
43364: PS	0	16:05:17.602	Core 04	2026.09.04 15:35:00   [SRJ-EA] XOBINPLAY bar=2026.09.04 15:30 dir=LONG zoneSrc=XOB zoneLo=1.16245 zoneHi=1.16275 promoT=2026.09.04 11:00 bounded=1 scanned=55 swings=10 hits=0 firstShift=-1 firstVal=- capHit=0 legacy=1 legacyVia=BAR widened=1 flip=0
43378: LD	0	16:05:17.602	Core 04	2026.09.04 15:35:00   [SRJ-EA] INPLAYCOMMIT bar=2026.09.04 15:30 dir=LONG zoneSrc=XOB zoneLo=1.16245 zoneHi=1.16275 promoT=2026.09.04 11:00 applied=1 bounded=1 scanned=377 swings=71 hits=21 firstShift=58 firstVal=1.16260 commitVia=BAR legacy=1 legacyVia=BAR committed=1 changed=0 haveStop=1
43382: PF	0	16:05:17.602	Core 04	2026.09.04 15:35:00   [SRJ-EA] ZONEID bar=2026.09.04 15:30 site=S4RQZ xobId=2973 fvgId=0
43553: IE	0	16:05:17.602	Core 04	2026.09.04 15:40:00   [SRJ-EA] ZONEID bar=2026.09.04 15:35 site=S4RQZ xobId=2793 fvgId=0
43813: GN	0	16:05:17.602	Core 04	2026.09.04 15:45:00   [SRJ-EA] SIDE1T_SEEDBIAS bar=2026.09.04 15:40 dir=LONG biasAligned=1 verdict=CONSIDER
43825: ES	0	16:05:17.602	Core 04	2026.09.04 15:45:00   [SRJ-EA] ZONEID bar=2026.09.04 15:40 site=S3PICK xobId=2793 fvgId=0
43826: KO	0	16:05:17.602	Core 04	2026.09.04 15:45:00   [SRJ-EA] XOBPROMO bar=2026.09.04 15:40 site=S3PICK xobId=2793 raw=1788415800.0 promoT=2026.09.03 06:10
43827: PR	0	16:05:17.602	Core 04	2026.09.04 15:45:00   [SRJ-EA] ZONEPICK bar=2026.09.04 15:40 dir=LONG haveFvg=0 fvgInPlay=0 haveXob=1 xobInPlay=1 downgraded=0 fvg=--- xob=1.15907-1.15933
43829: IP	0	16:05:17.602	Core 04	2026.09.04 15:45:00   [SRJ-EA] XOBINPLAY bar=2026.09.04 15:40 dir=LONG zoneSrc=XOB zoneLo=1.15907 zoneHi=1.15933 promoT=2026.09.03 06:10 bounded=1 scanned=403 swings=78 hits=0 firstShift=-1 firstVal=- capHit=0 legacy=1 legacyVia=BAR widened=1 flip=0
43842: QQ	0	16:05:17.602	Core 04	2026.09.04 15:45:00   [SRJ-EA] INPLAYCOMMIT bar=2026.09.04 15:40 dir=LONG zoneSrc=XOB zoneLo=1.15907 zoneHi=1.15933 promoT=2026.09.03 06:10 applied=1 bounded=1 scanned=2 swings=1 hits=0 firstShift=-1 firstVal=- commitVia=BAR legacy=1 legacyVia=BAR committed=1 changed=0 haveStop=1
43846: JD	0	16:05:17.602	Core 04	2026.09.04 15:45:00   [SRJ-EA] ZONEID bar=2026.09.04 15:40 site=S4RQZ xobId=2793 fvgId=0
43855: QI	0	16:05:17.602	Core 04	2026.09.04 15:50:00   [SRJ-EA] FRESHCOUNT #93 bar=2026.09.04 15:45 state=S4_ARMED obDead=0 fvgDead=1 oppFvg=0 adverse=1 verdict=HOLD scope=pre cum1=27 cum2=7 cum3=0
44009: RR	0	16:05:17.602	Core 04	2026.09.04 15:50:00   [SRJ-EA] ZONEID bar=2026.09.04 15:45 site=S3PICK xobId=2793 fvgId=0
44010: HQ	0	16:05:17.602	Core 04	2026.09.04 15:50:00   [SRJ-EA] XOBPROMO bar=2026.09.04 15:45 site=S3PICK xobId=2793 raw=1788415800.0 promoT=2026.09.03 06:10
44011: CP	0	16:05:17.602	Core 04	2026.09.04 15:50:00   [SRJ-EA] ZONEPICK bar=2026.09.04 15:45 dir=LONG haveFvg=0 fvgInPlay=0 haveXob=1 xobInPlay=1 downgraded=0 fvg=--- xob=1.15907-1.15933
44013: IG	0	16:05:17.602	Core 04	2026.09.04 15:50:00   [SRJ-EA] XOBINPLAY bar=2026.09.04 15:45 dir=LONG zoneSrc=XOB zoneLo=1.15907 zoneHi=1.15933 promoT=2026.09.03 06:10 bounded=1 scanned=404 swings=78 hits=0 firstShift=-1 firstVal=- capHit=0 legacy=1 legacyVia=BAR widened=1 flip=0
44020: GD	0	16:05:17.602	Core 04	2026.09.04 15:50:00   [SRJ-EA] INPLAYCOMMIT bar=2026.09.04 15:45 dir=LONG zoneSrc=XOB zoneLo=1.15907 zoneHi=1.15933 promoT=2026.09.03 06:10 applied=1 bounded=1 scanned=3 swings=1 hits=0 firstShift=-1 firstVal=- commitVia=BAR legacy=1 legacyVia=BAR committed=1 changed=0 haveStop=1
44023: KL	0	16:05:17.602	Core 04	2026.09.04 15:50:00   [SRJ-EA] ZONEID bar=2026.09.04 15:45 site=S4RQZ xobId=2793 fvgId=0
44034: JE	0	16:05:17.602	Core 04	2026.09.04 15:55:00   [SRJ-EA] FRESHCOUNT #94 bar=2026.09.04 15:50 state=S4_ARMED obDead=0 fvgDead=1 oppFvg=0 adverse=1 verdict=HOLD scope=pre cum1=28 cum2=7 cum3=0
44185: NQ	0	16:05:17.602	Core 04	2026.09.04 15:55:00   [SRJ-EA] ZONEID bar=2026.09.04 15:50 site=S4RQZ xobId=2793 fvgId=0
44196: DE	0	16:05:17.602	Core 04	2026.09.04 16:00:00   [SRJ-EA] FRESHCOUNT #95 bar=2026.09.04 15:55 state=S4_ARMED obDead=0 fvgDead=1 oppFvg=0 adverse=1 verdict=HOLD scope=pre cum1=29 cum2=7 cum3=0
44346: PL	0	16:05:17.602	Core 04	2026.09.04 16:00:00   [SRJ-EA] ZONEID bar=2026.09.04 15:55 site=S4RQZ xobId=2793 fvgId=0
===== j41 =====
43553: CS	0	00:48:37.111	SRJ_FlowNexus_EA (EURUSD,M5)	2026.09.04 15:35:00   [SRJ-EA] SIDE1T_SEEDBIAS bar=2026.09.04 15:30 dir=LONG biasAligned=0 verdict=REJECT-BIAS-TIMING
43567: CS	0	00:48:37.112	SRJ_FlowNexus_EA (EURUSD,M5)	2026.09.04 15:35:00   [SRJ-EA] ZONEID bar=2026.09.04 15:30 site=S3PICK xobId=2973 fvgId=0
43568: CS	0	00:48:37.112	SRJ_FlowNexus_EA (EURUSD,M5)	2026.09.04 15:35:00   [SRJ-EA] XOBPROMO bar=2026.09.04 15:30 site=S3PICK xobId=2973 raw=1788519600.0 promoT=2026.09.04 11:00
43569: CS	0	00:48:37.112	SRJ_FlowNexus_EA (EURUSD,M5)	2026.09.04 15:35:00   [SRJ-EA] ZONEPICK bar=2026.09.04 15:30 dir=LONG haveFvg=0 fvgInPlay=0 haveXob=1 xobInPlay=1 downgraded=0 fvg=--- xob=1.16245-1.16275
43571: CS	0	00:48:37.112	SRJ_FlowNexus_EA (EURUSD,M5)	2026.09.04 15:35:00   [SRJ-EA] XOBINPLAY bar=2026.09.04 15:30 dir=LONG zoneSrc=XOB zoneLo=1.16245 zoneHi=1.16275 promoT=2026.09.04 11:00 bounded=1 scanned=55 swings=10 hits=0 firstShift=-1 firstVal=- capHit=0 legacy=1 legacyVia=BAR widened=1 flip=0
43585: CS	0	00:48:37.112	SRJ_FlowNexus_EA (EURUSD,M5)	2026.09.04 15:35:00   [SRJ-EA] INPLAYCOMMIT bar=2026.09.04 15:30 dir=LONG zoneSrc=XOB zoneLo=1.16245 zoneHi=1.16275 promoT=2026.09.04 11:00 applied=1 bounded=1 scanned=377 swings=71 hits=21 firstShift=58 firstVal=1.16260 commitVia=BAR legacy=1 legacyVia=BAR committed=1 changed=0 haveStop=1
43589: CS	0	00:48:37.112	SRJ_FlowNexus_EA (EURUSD,M5)	2026.09.04 15:35:00   [SRJ-EA] ZONEID bar=2026.09.04 15:30 site=S4RQZ xobId=2973 fvgId=0
43759: CS	0	00:48:37.175	SRJ_FlowNexus_EA (EURUSD,M5)	2026.09.04 15:40:00   [SRJ-EA] ZONEID bar=2026.09.04 15:35 site=S4RQZ xobId=2793 fvgId=0
===== j37 9/4 NY A6FIRED/ENTRY before 15:35 =====
===== j37 =====
43333: OJ	0	16:05:17.602	Core 04	2026.09.04 15:35:00   [SRJ-EA] UJPROBE bar_key=2026.09.04 15:30 h4=1.0 h1=-1.0 m15=1.0 confirmedFeed=1 ltf=-1.0 div=OPPOSING kind=regular readFail=0 empty=123089 zero=0 complete=1 latestNZ=-1 covReq=2026.04.29 covAch=2026.04.29 dayCount=93 ticktime=2026.09.04 15:35:00 lag=c
43395: GF	0	16:05:17.602	Core 04	2026.09.04 15:40:00   [SRJ-EA] UJPROBE bar_key=2026.09.04 15:35 h4=1.0 h1=-1.0 m15=1.0 confirmedFeed=1 ltf=1.0 div=ALIGNED kind=regular readFail=0 empty=123089 zero=0 complete=1 latestNZ=1 covReq=2026.04.29 covAch=2026.04.29 dayCount=93 ticktime=2026.09.04 15:40:00 lag=char
43802: HG	0	16:05:17.602	Core 04	2026.09.04 15:45:00   [SRJ-EA] UJPROBE bar_key=2026.09.04 15:40 h4=1.0 h1=-1.0 m15=1.0 confirmedFeed=1 ltf=1.0 div=OPPOSING kind=regular readFail=0 empty=123090 zero=0 complete=1 latestNZ=1 covReq=2026.04.29 covAch=2026.04.29 dayCount=93 ticktime=2026.09.04 15:45:00 lag=cha
43853: QD	0	16:05:17.602	Core 04	2026.09.04 15:50:00   [SRJ-EA] UJPROBE bar_key=2026.09.04 15:45 h4=1.0 h1=-1.0 m15=1.0 confirmedFeed=1 ltf=1.0 div=ALIGNED kind=regular readFail=0 empty=123091 zero=0 complete=1 latestNZ=1 covReq=2026.04.29 covAch=2026.04.29 dayCount=93 ticktime=2026.09.04 15:50:00 lag=char
44031: FF	0	16:05:17.602	Core 04	2026.09.04 15:55:00   [SRJ-EA] UJPROBE bar_key=2026.09.04 15:50 h4=1.0 h1=-1.0 m15=1.0 confirmedFeed=1 ltf=1.0 div=ALIGNED kind=hidden readFail=0 empty=123091 zero=0 complete=1 latestNZ=2 covReq=2026.04.29 covAch=2026.04.29 dayCount=93 ticktime=2026.09.04 15:55:00 lag=chart
44193: RG	0	16:05:17.602	Core 04	2026.09.04 16:00:00   [SRJ-EA] UJPROBE bar_key=2026.09.04 15:55 h4=1.0 h1=-1.0 m15=1.0 confirmedFeed=1 ltf=1.0 div=ALIGNED kind=hidden readFail=0 empty=123092 zero=0 complete=1 latestNZ=2 covReq=2026.04.29 covAch=2026.04.29 dayCount=93 ticktime=2026.09.04 16:00:00 lag=chart
44627: EH	0	16:05:17.602	Core 04	2026.09.04 16:05:01   [SRJ-EA] UJPROBE bar_key=2026.09.04 16:00 h4=1.0 h1=-1.0 m15=1.0 confirmedFeed=1 ltf=1.0 div=OPPOSING kind=hidden readFail=0 empty=123093 zero=0 complete=1 latestNZ=2 covReq=2026.04.29 covAch=2026.04.29 dayCount=93 ticktime=2026.09.04 16:05:01 lag=char
===== j41 =====
43540: CS	0	00:48:37.111	SRJ_FlowNexus_EA (EURUSD,M5)	2026.09.04 15:35:00   [SRJ-EA] UJPROBE bar_key=2026.09.04 15:30 h4=1.0 h1=-1.0 m15=1.0 confirmedFeed=1 ltf=-1.0 div=OPPOSING kind=regular readFail=0 empty=123089 zero=0 complete=1 latestNZ=-1 covReq=2026.04.29 covAch=2026.04.29 dayCount=93 ticktime=2026
43602: CS	0	00:48:37.173	SRJ_FlowNexus_EA (EURUSD,M5)	2026.09.04 15:40:00   [SRJ-EA] UJPROBE bar_key=2026.09.04 15:35 h4=1.0 h1=-1.0 m15=1.0 confirmedFeed=1 ltf=1.0 div=ALIGNED kind=regular readFail=0 empty=123089 zero=0 complete=1 latestNZ=1 covReq=2026.04.29 covAch=2026.04.29 dayCount=93 ticktime=2026.09
44021: CS	0	00:48:37.315	SRJ_FlowNexus_EA (EURUSD,M5)	2026.09.04 15:45:00   [SRJ-EA] UJPROBE bar_key=2026.09.04 15:40 h4=1.0 h1=-1.0 m15=1.0 confirmedFeed=1 ltf=1.0 div=OPPOSING kind=regular readFail=0 empty=123090 zero=0 complete=1 latestNZ=1 covReq=2026.04.29 covAch=2026.04.29 dayCount=93 ticktime=2026.0
44054: CS	0	00:48:37.350	SRJ_FlowNexus_EA (EURUSD,M5)	2026.09.04 15:50:00   [SRJ-EA] UJPROBE bar_key=2026.09.04 15:45 h4=1.0 h1=-1.0 m15=1.0 confirmedFeed=1 ltf=1.0 div=OPPOSING kind=regular readFail=0 empty=123091 zero=0 complete=1 latestNZ=1 covReq=2026.04.29 covAch=2026.04.29 dayCount=93 ticktime=2026.0
44064: CS	0	00:48:37.395	SRJ_FlowNexus_EA (EURUSD,M5)	2026.09.04 15:55:00   [SRJ-EA] UJPROBE bar_key=2026.09.04 15:50 h4=1.0 h1=-1.0 m15=1.0 confirmedFeed=1 ltf=1.0 div=OPPOSING kind=hidden readFail=0 empty=123091 zero=0 complete=1 latestNZ=2 covReq=2026.04.29 covAch=2026.04.29 dayCount=93 ticktime=2026.09
44076: CS	0	00:48:37.757	SRJ_FlowNexus_EA (EURUSD,M5)	2026.09.04 16:00:00   [SRJ-EA] UJPROBE bar_key=2026.09.04 15:55 h4=1.0 h1=-1.0 m15=1.0 confirmedFeed=1 ltf=1.0 div=OPPOSING kind=hidden readFail=0 empty=123092 zero=0 complete=1 latestNZ=2 covReq=2026.04.29 covAch=2026.04.29 dayCount=93 ticktime=2026.09
44086: CS	0	00:48:37.772	SRJ_FlowNexus_EA (EURUSD,M5)	2026.09.04 16:05:01   [SRJ-EA] UJPROBE bar_key=2026.09.04 16:00 h4=1.0 h1=-1.0 m15=1.0 confirmedFeed=1 ltf=1.0 div=OPPOSING kind=hidden readFail=0 empty=123093 zero=0 complete=1 latestNZ=2 covReq=2026.04.29 covAch=2026.04.29 dayCount=93 ticktime=2026.09
===== EU TPCENSUS diffs (bar,dir) =====
('2026.08.27 16:55', 'SHORT') kept Yearly-VWAP/1.16322 vs RK Daily-VWAP/1.16498
('2026.08.27 17:00', 'SHORT') kept Yearly-VWAP/1.16322 vs RK Daily-VWAP/1.16498
('2026.09.01 09:25', 'SHORT') kept YNYL/1.15916 vs RK Weekly-POC/1.15976
('2026.09.01 09:30', 'SHORT') kept YNYL/1.15916 vs RK Weekly-POC/1.15976
('2026.09.01 09:35', 'SHORT') kept YNYL/1.15916 vs RK Weekly-POC/1.15976
('2026.09.01 09:40', 'SHORT') kept YNYL/1.15916 vs RK Weekly-POC/1.15976
('2026.09.01 09:45', 'SHORT') kept YNYL/1.15916 vs RK Weekly-POC/1.15976
('2026.09.01 09:50', 'SHORT') kept YNYL/1.15916 vs RK Weekly-POC/1.15976
('2026.09.01 17:30', 'SHORT') kept YLOL/1.15878 vs RK Monthly-POC/1.15931
('2026.09.02 17:20', 'LONG') kept PDH/1.16244 vs RK Monthly-VWAP/1.15905
('2026.09.02 18:40', 'LONG') kept Monthly-VWAP/1.15906 vs RK Yearly-POC/1.15987
('2026.09.02 18:50', 'LONG') kept Monthly-VWAP/1.15906 vs RK Yearly-POC/1.15987
('2026.09.04 15:35', 'LONG') kept Yearly-POC/1.15987 vs RK YLOH/1.16302
('2026.09.04 15:45', 'LONG') only-kept: (43981, '1.16007', 'Monthly-VWAP', '1.16025')
('2026.09.04 15:50', 'LONG') only-kept: (44160, '1.15997', 'YLOH', '1.16302')
('2026.09.04 15:55', 'LONG') only-kept: (44322, '1.16018', 'YLOH', '1.16302')
('2026.09.08 16:15', 'SHORT') kept Monthly-POC/1.16229 vs RK Yearly-POC/1.16114
('2026.09.09 18:15', 'LONG') kept LIVE/1.16553 vs RK Monthly-POC/1.16234
('2026.09.09 18:45', 'LONG') kept Yearly-VWAP/1.16315 vs RK LIVE/1.16553
('2026.09.09 18:50', 'LONG') kept Yearly-VWAP/1.16315 vs RK LIVE/1.16553
census-diffs=20
===== EU TP_ELECT diffs (bar) =====
2026.09.04 15:35 kept 1.15835/1.15987/R0.18 vs RK 1.15835/1.16302/R2.62
2026.09.04 15:55 only-kept: (44604, '1.16018', '1.15847', '1.16302', '1.66')
elect-diffs=2
===== EU UJ1R-POLL diffs (bar) =====
2026.08.27 16:55 kept tp=1.16322 R=19.67 PASS vs RK tp=1.16498 R=3.64 PASS
2026.08.27 17:00 kept tp=1.16322 R=1.58 PASS vs RK tp=1.16498 R=0.20 FAIL
2026.09.01 09:25 kept tp=1.15916 R=1.27 PASS vs RK tp=1.15976 R=0.53 FAIL
2026.09.01 09:30 kept tp=1.15916 R=1.09 PASS vs RK tp=1.15976 R=0.41 FAIL
2026.09.01 09:35 kept tp=1.15916 R=1.36 PASS vs RK tp=1.15976 R=0.59 FAIL
2026.09.01 09:40 kept tp=1.15916 R=1.59 PASS vs RK tp=1.15976 R=0.75 FAIL
2026.09.01 09:45 kept tp=1.15916 R=1.36 PASS vs RK tp=1.15976 R=0.59 FAIL
2026.09.01 09:50 kept tp=1.15916 R=1.56 PASS vs RK tp=1.15976 R=0.72 FAIL
2026.09.01 17:30 kept tp=1.15878 R=2.44 PASS vs RK tp=1.15931 R=1.54 PASS
2026.09.02 17:20 kept tp=1.16244 R=16.24 PASS vs RK tp=1.15905 R=0.08 FAIL
2026.09.02 18:40 kept tp=1.15906 R=0.19 FAIL vs RK tp=1.15987 R=5.25 PASS
2026.09.02 18:50 kept tp=1.15906 R=0.50 FAIL vs RK tp=1.15987 R=8.60 PASS
2026.09.04 15:35 kept tp=1.15987 R=0.40 FAIL vs RK tp=1.16302 R=5.93 PASS
2026.09.04 15:45 only-kept
2026.09.04 15:50 only-kept
2026.09.04 15:55 only-kept
2026.09.08 16:15 kept tp=1.16229 R=0.17 FAIL vs RK tp=1.16114 R=6.56 PASS
2026.09.09 18:15 kept tp=1.16553 R=55.00 PASS vs RK tp=1.16234 R=1.83 PASS
2026.09.09 18:45 kept tp=1.16315 R=0.13 FAIL vs RK tp=1.16553 R=1.28 PASS
2026.09.09 18:50 kept tp=1.16315 R=0.13 FAIL vs RK tp=1.16553 R=1.28 PASS
poll-diffs=20
===== UJ TPCENSUS diffs (bar,dir) =====
('2026.05.29 15:50', 'LONG') kept Daily-VWAP/159.279 vs RK YLOH/159.330
('2026.05.29 17:05', 'LONG') kept Daily-VWAP/159.279 vs RK YASH/159.367
('2026.06.01 10:55', 'LONG') kept Monthly-POC/159.466 vs RK YASH/159.497
('2026.06.01 11:05', 'LONG') kept Monthly-POC/159.466 vs RK YASH/159.497
('2026.06.09 10:35', 'SHORT') kept Weekly-VWAP/160.156 vs RK Daily-POC/160.189
('2026.06.09 10:50', 'SHORT') kept Weekly-VWAP/160.156 vs RK Monthly-POC/159.960
('2026.06.09 15:15', 'SHORT') kept Weekly-POC/160.161 vs RK YLOL/160.052
('2026.06.09 16:00', 'SHORT') kept Weekly-VWAP/160.158 vs RK Daily-POC/160.161
('2026.06.10 16:30', 'LONG') kept Daily-VWAP/160.402 vs RK NONE/160.723
census-diffs=9
===== UJ TP_ELECT diffs (bar) =====
elect-diffs=0
===== UJ UJ1R-POLL diffs (bar) =====
2026.05.29 15:50 kept tp=159.279 R=0.56 FAIL vs RK tp=159.330 R=3.39 PASS
2026.05.29 17:05 kept tp=159.279 R=0.74 FAIL vs RK tp=159.367 R=18.40 PASS
2026.06.01 10:55 kept tp=159.466 R=0.10 FAIL vs RK tp=159.497 R=1.57 PASS
2026.06.01 11:05 kept tp=159.466 R=0.64 FAIL vs RK tp=159.497 R=2.86 PASS
2026.06.09 10:35 kept tp=160.156 R=1.65 PASS vs RK tp=160.189 R=0.14 FAIL
2026.06.09 10:50 kept tp=160.156 R=0.25 FAIL vs RK tp=159.960 R=2.89 PASS
2026.06.09 15:15 kept tp=160.161 R=3.50 PASS vs RK tp=160.052 R=30.75 PASS
2026.06.09 16:00 kept tp=160.158 R=1.90 PASS vs RK tp=160.161 R=1.74 PASS
2026.06.10 16:30 kept tp=160.402 R=0.14 FAIL vs RK tp=160.723 R=4.85 PASS
poll-diffs=9
=== RECON6 2026.09.02 18:40 ===
36803: CS	0	00:48:02.051	SRJ_FlowNexus_EA (EURUSD,M5)	2026.09.02 18:45:00   [SRJ-EA] RETESTBOOK bar=2026.09.02 18:40 hits=0
36806: CS	0	00:48:02.051	SRJ_FlowNexus_EA (EURUSD,M5)	2026.09.02 18:45:00   [SRJ-EA] CONFIRMPOLL bar=2026.09.02 18:40 anchor=Monthly-POC dir=LONG oppCandle=0 bodyDir=0 body=37pts doji=0 touchAttr=1 confirm=0 shadow=true
36822: CS	0	00:48:02.051	SRJ_FlowNexus_EA (EURUSD,M5)	2026.09.02 18:45:00   [SRJ-EA] CONFIRM_PREBIND_FAIL bar=2026.09.02 18:40 dir=LONG term=A_OPP
69393: CS	0	00:49:38.097	SRJ_FlowNexus_EA (EURUSD,M5)	2026.09.09 23:59:58   [SRJ-EA] A6SUPP bar=2026.09.02 18:40 class=FRACTAL_SUPPRESSED target=UNRESOLVED_WALK reason=NO_CENSUS_ROW verdict=NONE
=== RECON6 2026.09.02 18:50 ===
37105: CS	0	00:48:02.077	SRJ_FlowNexus_EA (EURUSD,M5)	2026.09.02 18:55:00   [SRJ-EA] RETESTBOOK bar=2026.09.02 18:50 hits=0
37108: CS	0	00:48:02.077	SRJ_FlowNexus_EA (EURUSD,M5)	2026.09.02 18:55:00   [SRJ-EA] CONFIRMPOLL bar=2026.09.02 18:50 anchor=Monthly-POC dir=LONG oppCandle=0 bodyDir=0 body=12pts doji=0 touchAttr=0 confirm=0 shadow=true
37124: CS	0	00:48:02.077	SRJ_FlowNexus_EA (EURUSD,M5)	2026.09.02 18:55:00   [SRJ-EA] CONFIRM_PREBIND_FAIL bar=2026.09.02 18:50 dir=LONG term=A_OPP
69395: CS	0	00:49:38.097	SRJ_FlowNexus_EA (EURUSD,M5)	2026.09.09 23:59:58   [SRJ-EA] A6SUPP bar=2026.09.02 18:50 class=FRACTAL_SUPPRESSED target=UNRESOLVED_WALK reason=NO_CENSUS_ROW verdict=NONE
=== RECON6 2026.09.08 16:15 ===
51789: CS	0	00:49:14.351	SRJ_FlowNexus_EA (EURUSD,M5)	2026.09.08 16:20:00   [SRJ-EA] SUPPRESSED bar=2026.09.08 16:15 poi=Monthly-POC dir=LONG opp=0 higher=0 heldPoi=Monthly-POC heldDir=LONG heldState=S2_LTF_ALIGN cum_n=99 cum_opp=12 cum_hi=3 cum_both=2 action=HELD
51790: CS	0	00:49:14.351	SRJ_FlowNexus_EA (EURUSD,M5)	2026.09.08 16:20:00   [SRJ-EA] RETESTBOOK bar=2026.09.08 16:15 hits=1 Monthly-POC:r6:dL
51793: CS	0	00:49:14.352	SRJ_FlowNexus_EA (EURUSD,M5)	2026.09.08 16:20:00   [SRJ-EA] CONFIRMPOLL bar=2026.09.08 16:15 anchor=Monthly-POC dir=LONG oppCandle=1 bodyDir=0 body=2pts doji=0 touchAttr=0 confirm=0 shadow=true
69450: CS	0	00:49:38.097	SRJ_FlowNexus_EA (EURUSD,M5)	2026.09.09 23:59:58   [SRJ-EA] A6SUPP bar=2026.09.08 16:15 class=FRACTAL_SUPPRESSED target=UNRESOLVED_WALK reason=NO_CENSUS_ROW verdict=NONE
69451: CS	0	00:49:38.097	SRJ_FlowNexus_EA (EURUSD,M5)	2026.09.09 23:59:58   [SRJ-EA] A6SUPP bar=2026.09.08 16:15 class=FRACTAL_SUPPRESSED target=UNRESOLVED_WALK reason=NO_CENSUS_ROW verdict=NONE
=== RECON6 2026.09.09 18:45 ===
56559: CS	0	00:49:34.353	SRJ_FlowNexus_EA (EURUSD,M5)	2026.09.09 18:50:00   [SRJ-EA] SUPPRESSED bar=2026.09.09 18:45 poi=Yearly-VWAP dir=SHORT opp=1 higher=1 heldPoi=Weekly-POC heldDir=LONG heldState=S4_ARMED cum_n=108 cum_opp=14 cum_hi=4 cum_both=3 action=HELD
56560: CS	0	00:49:34.353	SRJ_FlowNexus_EA (EURUSD,M5)	2026.09.09 18:50:00   [SRJ-EA] RETESTBOOK bar=2026.09.09 18:45 hits=1 Yearly-VWAP:r3:dS
56563: CS	0	00:49:34.353	SRJ_FlowNexus_EA (EURUSD,M5)	2026.09.09 18:50:00   [SRJ-EA] CONFIRMPOLL bar=2026.09.09 18:45 anchor=Weekly-POC dir=LONG oppCandle=1 bodyDir=0 body=27pts doji=0 touchAttr=0 confirm=0 shadow=true
69468: CS	0	00:49:38.097	SRJ_FlowNexus_EA (EURUSD,M5)	2026.09.09 23:59:58   [SRJ-EA] A6SUPP bar=2026.09.09 18:45 class=FRACTAL_SUPPRESSED target=UNRESOLVED_WALK reason=NO_CENSUS_ROW verdict=NONE
=== RECON6 2026.09.09 18:50 ===
56749: CS	0	00:49:34.365	SRJ_FlowNexus_EA (EURUSD,M5)	2026.09.09 18:55:01   [SRJ-EA] SUPPRESSED bar=2026.09.09 18:50 poi=Yearly-VWAP dir=SHORT opp=1 higher=1 heldPoi=Weekly-POC heldDir=LONG heldState=S4_ARMED cum_n=109 cum_opp=15 cum_hi=5 cum_both=4 action=HELD
56750: CS	0	00:49:34.365	SRJ_FlowNexus_EA (EURUSD,M5)	2026.09.09 18:55:01   [SRJ-EA] RETESTBOOK bar=2026.09.09 18:50 hits=2 Daily-POC:r10:dS Yearly-VWAP:r3:dS
56753: CS	0	00:49:34.365	SRJ_FlowNexus_EA (EURUSD,M5)	2026.09.09 18:55:01   [SRJ-EA] CONFIRMPOLL bar=2026.09.09 18:50 anchor=Weekly-POC dir=LONG oppCandle=1 bodyDir=0 body=1pts doji=0 touchAttr=0 confirm=0 shadow=true
69469: CS	0	00:49:38.097	SRJ_FlowNexus_EA (EURUSD,M5)	2026.09.09 23:59:58   [SRJ-EA] A6SUPP bar=2026.09.09 18:50 class=FRACTAL_SUPPRESSED target=UNRESOLVED_WALK reason=NO_CENSUS_ROW verdict=NONE
=== JUNE05 2026.05.29 15:50 ===
11502: CS	0	00:58:24.637	SRJ_FlowNexus_EA (USDJPY,M5)	2026.05.29 15:55:00   [SRJ-EA] SUPPRESSED bar=2026.05.29 15:50 poi=Daily-VWAP dir=SHORT opp=1 higher=0 heldPoi=Daily-POC heldDir=LONG heldState=S4_ARMED cum_n=10 cum_opp=1 cum_hi=2 cum_both=0 action=HELD
11503: CS	0	00:58:24.637	SRJ_FlowNexus_EA (USDJPY,M5)	2026.05.29 15:55:00   [SRJ-EA] RETESTBOOK bar=2026.05.29 15:50 hits=1 Daily-VWAP:r11:dS
11506: CS	0	00:58:24.637	SRJ_FlowNexus_EA (USDJPY,M5)	2026.05.29 15:55:00   [SRJ-EA] CONFIRMPOLL bar=2026.05.29 15:50 anchor=Daily-POC dir=LONG oppCandle=1 bodyDir=0 body=11pts doji=0 touchAttr=1 confirm=0 shadow=true
71136: CS	0	01:00:57.765	SRJ_FlowNexus_EA (USDJPY,M5)	2026.06.12 23:59:58   [SRJ-EA] A6SUPP bar=2026.05.29 15:50 class=FRACTAL_SUPPRESSED target=UNRESOLVED_WALK reason=NO_CENSUS_ROW verdict=NONE
=== JUNE05 2026.05.29 17:05 ===
11685: CS	0	00:58:25.499	SRJ_FlowNexus_EA (USDJPY,M5)	2026.05.29 17:10:00   [SRJ-EA] UJDEFERABORT bar=2026.05.29 17:05 dir=LONG poi=Daily-POC state=S4_ARMED - LTF opposed, abort deferred past evaluation (Fix S-a)
11807: CS	0	00:58:25.499	SRJ_FlowNexus_EA (USDJPY,M5)	2026.05.29 17:10:00   [SRJ-EA] RETESTBOOK bar=2026.05.29 17:05 hits=0
11810: CS	0	00:58:25.499	SRJ_FlowNexus_EA (USDJPY,M5)	2026.05.29 17:10:00   [SRJ-EA] CONFIRMPOLL bar=2026.05.29 17:05 anchor=Daily-POC dir=LONG oppCandle=1 bodyDir=0 body=8pts doji=0 touchAttr=1 confirm=0 shadow=true
71138: CS	0	01:00:57.765	SRJ_FlowNexus_EA (USDJPY,M5)	2026.06.12 23:59:58   [SRJ-EA] A6SUPP bar=2026.05.29 17:05 class=FRACTAL_SUPPRESSED target=UNRESOLVED_WALK reason=NO_CENSUS_ROW verdict=NONE
=== JUNE05 2026.06.01 10:55 ===
15722: CS	0	00:58:37.325	SRJ_FlowNexus_EA (USDJPY,M5)	2026.06.01 11:00:00   [SRJ-EA] RETESTBOOK bar=2026.06.01 10:55 hits=0
15725: CS	0	00:58:37.325	SRJ_FlowNexus_EA (USDJPY,M5)	2026.06.01 11:00:00   [SRJ-EA] CONFIRMPOLL bar=2026.06.01 10:55 anchor=Monthly-VWAP dir=LONG oppCandle=0 bodyDir=0 body=11pts doji=0 touchAttr=0 confirm=0 shadow=true
71159: CS	0	01:00:57.765	SRJ_FlowNexus_EA (USDJPY,M5)	2026.06.12 23:59:58   [SRJ-EA] A6SUPP bar=2026.06.01 10:55 class=FRACTAL_SUPPRESSED target=UNRESOLVED_WALK reason=NO_CENSUS_ROW verdict=NONE
=== JUNE05 2026.06.01 11:05 ===
16013: CS	0	00:58:37.341	SRJ_FlowNexus_EA (USDJPY,M5)	2026.06.01 11:10:02   [SRJ-EA] SUPPRESSED bar=2026.06.01 11:05 poi=Monthly-POC dir=SHORT opp=1 higher=1 heldPoi=Monthly-VWAP heldDir=LONG heldState=S4_ARMED cum_n=16 cum_opp=3 cum_hi=6 cum_both=2 action=HELD
16014: CS	0	00:58:37.341	SRJ_FlowNexus_EA (USDJPY,M5)	2026.06.01 11:10:02   [SRJ-EA] RETESTBOOK bar=2026.06.01 11:05 hits=3 Daily-POC:r10:dS Weekly-POC:r8:dS Monthly-POC:r6:dS
16017: CS	0	00:58:37.341	SRJ_FlowNexus_EA (USDJPY,M5)	2026.06.01 11:10:02   [SRJ-EA] CONFIRMPOLL bar=2026.06.01 11:05 anchor=Monthly-VWAP dir=LONG oppCandle=0 bodyDir=0 body=9pts doji=0 touchAttr=0 confirm=0 shadow=true
71161: CS	0	01:00:57.765	SRJ_FlowNexus_EA (USDJPY,M5)	2026.06.12 23:59:58   [SRJ-EA] A6SUPP bar=2026.06.01 11:05 class=FRACTAL_SUPPRESSED target=UNRESOLVED_WALK reason=NO_CENSUS_ROW verdict=NONE
=== JUNE05 2026.06.10 16:30 ===
54954: CS	0	01:00:24.017	SRJ_FlowNexus_EA (USDJPY,M5)	2026.06.10 16:35:00   [SRJ-EA] RETESTBOOK bar=2026.06.10 16:30 hits=0
54957: CS	0	01:00:24.017	SRJ_FlowNexus_EA (USDJPY,M5)	2026.06.10 16:35:00   [SRJ-EA] CONFIRMPOLL bar=2026.06.10 16:30 anchor=Daily-POC dir=LONG oppCandle=1 bodyDir=0 body=25pts doji=0 touchAttr=0 confirm=0 shadow=true
54973: CS	0	01:00:24.017	SRJ_FlowNexus_EA (USDJPY,M5)	2026.06.10 16:35:00   [SRJ-EA] CONFIRM_PREBIND_FAIL bar=2026.06.10 16:30 dir=LONG term=B_BODY
71334: CS	0	01:00:57.765	SRJ_FlowNexus_EA (USDJPY,M5)	2026.06.12 23:59:58   [SRJ-EA] A6SUPP bar=2026.06.10 16:30 class=FRACTAL_SUPPRESSED target=UNRESOLVED_WALK reason=NO_CENSUS_ROW verdict=NONE
## R3 STOPPING ROWS (kept-FAIL turned RK-PASS but never fired; the row that stopped each)

EU (j41): 9/2 18:40 PREBIND_FAIL A_OPP (j41:36822, confirm=0 j41:36806); 9/2 18:50 PREBIND_FAIL A_OPP (j41:37124, confirm=0); 9/8 16:15 confirm=0 (j41:51793, LONG holder); 9/9 18:45 confirm=0 (j41:56563); 9/9 18:50 confirm=0 (j41:56753). UJ (j42): 5/29 15:50 confirm=0 (j42:11506); 5/29 17:05 UJDEFERABORT LTF-opposed (j42:11685) + confirm=0; 6/1 10:55 confirm=0 (j42:15725); 6/1 11:05 confirm=0 (j42:16017); 6/10 16:30 PREBIND_FAIL B_BODY (j42:54973) + confirm=0. All stopped at confirmation, none reached booking. Opposite direction (kept-PASS turned RK-FAIL, safer): EU 9/1 09:25-09:50 x6 polls (kept R1.09-1.59 PASS vs RK R0.41-0.75 FAIL, no fires either way); 8/27 17:00 kept R1.58 PASS vs RK R0.20 FAIL (the F2 refusal).

## R4 SEARCH (record-first; no word of his on a pre-16:00 4 Sep NY buy)

- Register: A row 3 = 16:00 entry only; no earlier 4 Sep NY buy.
- Skill whole: "15:35" x2 = the 2-June 15:35 buy (s178/s185, different trade); "15:40" x0. Nothing on 4 Sep 15:35/15:40.
- Journal 4-Sep rows 277/278/279/280/312: no 15:35/15:40 entry (row 280 carries 0.84 R values, no entry time).
- Spec: no instance. XOBSUIT-1: 08.18 only. Ledger "15:35/15:40 + 4-Sep context": only B-78's own record (no his-words).
- NOT FOUND -> carried note with ONE chart call (result).

(End of slice)
