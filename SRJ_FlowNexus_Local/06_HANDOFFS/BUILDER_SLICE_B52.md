# BUILDER SLICE B-52 - raw rows behind H, W, P1-P3 and M1-M3 (payloads only; no EA edit/compile/launch/run)

## 0.4 gate SHAs (raw / normalized)
- pointer e4460c06 MATCH (stale D5AA7DF6 proven B-50-era: git diff 48e2783 empty for all five files below).
- RESULT_B51 3c27c2a6 MATCH (stale F2B34030 proven B-50-era).
- SLICE_B51 7e3212ed MATCH (stale 640ED2BF proven B-50-era).
- register d248deec MATCH (stale C1E4AEDE was pre-A2/B-51; A2 landed in 48e2783).
- strategy 7762E905 MATCH (pre-H2; post-H2 4dbdffba).
- context E06BB7B4 MATCH (pre-W2; post-W2 4bd72366).
- relay skill bb467c55 MATCH (accounted).
- EA 63B18C1F / ex5 B0D4AA9E raw MATCH; FlowLogic 956BF3E3 / ex5 27B5F272 raw MATCH; includes 3B1D9D3D/5D14FCE2/FD2B3716/D5FD5B06 MATCH; TickAudit 7AD6ABEF/7C8946D8 MATCH.
- journal 15e568d4 / 261ebd8f MATCH (pre-H3; post-H3 f7489b7c/4947b4b7).
- ledger pre-H4 normalized 8340BC8F MATCH.
- terminal.ini 450ACB4A raw MATCH (report-only).
- j24 JUNE-B38_JOURNAL.log AC07557F (10053954 B, 52748 lines) MATCH; j23 RECON62-B38_JOURNAL.log 75B7321C (15698257 B, 79267 lines) MATCH.

## H1 grep counts for "the entry line POI was based of the M POC and M VWAP": skill 0, journal 0, ledger 0 -> all three written.
## H2/H3/H5 before->after
- skill 7762E905 (60699 B) -> 4dbdffba (61141 B). Section appended at end (LF).
- journal 15e568d4 / 261ebd8f (148956 / 147897 B, 1060 lines) -> f7489b7c / 4947b4b7 (149285 / 148225 B, 1061 lines; row 309 parses, 31 fields, 0 errors file-wide).
- row 309 raw: 309,10/6/26,NY,,,,,,,,,,,,,,,"B-52 BANKED 2026-10-06 (relay B-52 chart-call answer): ""5 June NY Long, the entry line POI was based of the M POC and M VWAP (the highest is Monthly but it also the W) at 16:00.""; skill section Ruling 2026-10-06 - 5 June New York long, entry POI",,,,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,
## H4 ledger ^1194. count 0 -> appended 1194. B52-BANK-0506-POI (221 chars + CRLF).
## .agents strategy copy (stub): untouched (no write; not in F4 list).

## W1/W2/W4/W6
- W1: PLANNER_CONTEXT.md absent -> created verbatim (markers excluded, LF). SHA 7deac0d6 (4568 B).
- W2: PROMPTQL title-line insert (nothing else changed). SHA E06BB7B4 (8837 B) -> 4bd72366 (8970 B).
- W3a old count 1, W3b old count 1 -> both replaced. SHA bb467c55 (10180 B) -> 3039df4e (10355 B).
- W4 old count 1 -> replaced. SHA e7f906e5 (283 B, = HEAD, was clean) -> 7a0e9674 (274 B).
## W5 sweep (git grep -n -i promptql, tracked tree minus 06_HANDOFFS/ + both context files): exactly 1 hit, raw:
.opencode/skills/srj-relay/SKILL.md:9:- Planner: the SuperApp AI in the operator's SuperApp project thread (replaced the PromptQL bot 2026-10-07, relay B-52). Reads this repo on GitHub, read-only, and writes relays B-<n>. Has no terminal. Its context file is SRJ_FlowNexus_Local/99_WORKFLOW/PLANNER_CONTEXT.md.
- Verdict: dated-history line (names the replacement event itself) -> LEFT, no edit. Zero edit-candidates (AGENTS.md 0, .clinerules 0, skills 0 besides this, 99_WORKFLOW 0).

## P1 j24 11 June 14:35-15:25 rows (JUNE-B38_JOURNAL.log; CONFIRMPOLL = confirmation poll, A2RECLAIM = prior-close-irrelevant reclaim, STATE ARM/FIRE, A6FIRED = selected fire, ENTRY = ticket, MTEXIT = managed exit)
38949 FH 0 10:23:41.584 Core 04 2026.06.11 14:40:22   [SRJ-EA] CONFIRMPOLL bar=2026.06.11 14:35 anchor=Daily-POC dir=LONG oppCandle=1 bodyDir=1 body=3pts doji=0 touchAttr=1 confirm=1 shadow=true
38950 QO 0 10:23:41.584 Core 04 2026.06.11 14:40:22   [SRJ-EA] 2026.06.11 14:40:22 STATE S2_LTF_ALIGN->S3_ZONE_WAIT dir=LONG poi=Daily-POC
38952 HE 0 10:23:41.584 Core 04 2026.06.11 14:40:22   [SRJ-EA] A2RECLAIM bar=2026.06.11 14:35 anchor=Daily-POC dir=LONG c1=160.522 L=160.523 o0=160.523 c0=160.526 - prior close irrelevant (B38)
38966 RO 0 10:23:41.584 Core 04 2026.06.11 14:40:22   [SRJ-EA] 2026.06.11 14:40:22 STATE S3_ZONE_WAIT->S4_ARMED dir=LONG poi=Daily-POC
38969 FK 0 10:23:41.584 Core 04 2026.06.11 14:40:22   [SRJ-EA] A2RECLAIM bar=2026.06.11 14:35 anchor=Daily-POC dir=LONG c1=160.522 L=160.523 o0=160.523 c0=160.526 - prior close irrelevant (B38)
38974 NK 0 10:23:41.584 Core 04 2026.06.11 14:40:22   [SRJ-EA] A2RECLAIM bar=2026.06.11 14:35 anchor=Daily-POC dir=LONG c1=160.522 L=160.523 o0=160.523 c0=160.526 - prior close irrelevant (B38)
38975 JN 0 10:23:41.584 Core 04 2026.06.11 14:40:22   [SRJ-EA] 2026.06.11 14:40:22 STATE S4_ARMED->S5_GATE_CHECK dir=LONG poi=Daily-POC
39222 HI 0 10:23:41.584 Core 04 2026.06.11 14:40:22   [SRJ-EA] SIDE1O_ELIGSTATE bar=2026.06.11 14:35 dir=LONG sessUsed=0 divLatch=0 cqd=UNREAD confirm=S4_ARMED slRef=160.501 rLive=2.74 livePass=1
39229 FE 0 10:23:41.584 Core 04 2026.06.11 14:40:22   [SRJ-EA] A6FIRED class=SELECTED state=FIRED bar=2026.06.11 14:35 dir=LONG tp=160.587 r=2.74 sl=160.501 mode=1SWING div=regular
39240 JS 0 10:23:41.584 Core 04 2026.06.11 14:40:22   deal #10 buy 5.54 USDJPY at 160.530 done (based on order #10)
39245 QR 0 10:23:41.584 Core 04 2026.06.11 14:40:22   [SRJ-EA] ENTRY_TICKET bar=2026.06.11 14:35 ticket=10 deal=10 pid=10 ppid=10 magic=773002
39246 EP 0 10:23:41.584 Core 04 2026.06.11 14:40:22   [SRJ-EA] 2026.06.11 14:40:22 STATE S5_GATE_CHECK->SIGNAL dir=LONG poi=Daily-POC
39343 IP 0 10:23:47.685 Core 04 2026.06.11 15:23:06   deal #11 sell 5.54 USDJPY at 160.588 done (based on order #11)
39361 DG 0 10:23:47.685 Core 04 2026.06.11 15:25:00   [SRJ-EA] MTEXIT bar=2026.06.11 15:20 reason=TP_TOUCH line=- lineVal=- entry=160.524 exit=160.587
- CONFIRM_STRUCT_FAIL bar=2026.06.11 14:35 count in j24: 0.
- CURRENT_1106 = FIRES (ARM S3->S4 and FIRE S4->S5->SIGNAL all on the 14:40:22 pass; entry ref 160.524; deal #10 buy 14:40:22 at 160.530; MTEXIT TP_TOUCH 15:20 entry=160.524 exit=160.587; deal #11).

## P2 tree proof (DAYLOG = Tester/logs/20261006.log UTF-16)
- 347758-run header: 309237 OK 0 08:35:27.936 Core 04 USDJPY,M5: testing of Experts\SRJ_FlowNexus_EA.ex5 from 2026.06.01 00:00 to 2026.06.13 00:00 started with inputs: / run ends at next header 370170 (10:11:50 EURUSD testing-of row).
- In-run: zero A2RECLAIM rows on 11 June 14:3x (this tree predates the B-38 A2 feature); CONFIRM_STRUCT_FAIL bar=2026.06.11 14:35 count = 1, raw: 347781 MQ 0 08:37:36.155 Core 04 2026.06.11 14:40:22 [SRJ-EA] CONFIRM_STRUCT_FAIL bar=2026.06.11 14:35 dir=LONG term=A2_CLOSE_BREAK (same 14:40:22 pass that armed S4: arm-then-fail, never fired).
- j23 DAYLOG start (PRE 390828): 390828 LM 0 10:13:22.630 Core 04 2026.06.08 05:35:00 [SRJ-EA] UJPROBE ... / 390829-390830 farm-switched-off boundary rows (10:13:58.887).
- j24 DAYLOG start (PRE 470095): 470095 KR 0 10:19:15.308 Core 04 connection closed / 470096-470097 farm-switched-off boundary rows (10:21:09.974). (j23 DONE 10:19:36, j24 completed 10:24:03 per B-38.)
- B38_EACOMPILE.log: NOT_FOUND on disk (no B38 compile log in 06_HANDOFFS/ or 00_CURRENT_WORKING/; only older T162/V logs + compile_*.ps1 scripts). Compile result cited from BUILDER_RESULT_B38 Part B instead: `Result: 0 errors, 0 warnings, 6276 ms elapsed`, ex5 B0D4AA9E (456738 B).
- B51_ROWS_TREE = PRE_B38 (08:35 run predates the B-38 compile window ~10:13-10:24; old A2_CLOSE_BREAK behavior + no A2RECLAIM feature) | CURRENT (j24 on 63B18C1F: A2RECLAIM x3, zero FAILs, FIRE).

## P3 second-confirm pattern, current tree (ARM = S3->S4 row; FIRE = next S4->S5 of same date+dir+poi; rows raw in j23/j24)
j24 LATER_PASS_FIRES=8:
- 6/03 arm 09:05:05 -> fire 09:10:00 LONG Daily-VWAP; 6/03 arm 14:55:00 -> fire 15:00:00 LONG Daily-VWAP; 6/03 arm 16:05:00 -> fire 17:30:00 LONG Daily-POC; 6/04 arm 09:50:00 -> fire 09:55:00 SHORT Daily-POC; 6/04 arm 17:05:00 -> fire 17:10:00 LONG Daily-POC; 6/10 arm 09:35:00 -> fire 10:00:00 LONG Daily-VWAP; 6/11 arm 11:10:04 -> fire 11:25:04 LONG Daily-POC; 6/12 arm 18:15:00 -> fire 18:20:02 LONG Weekly-POC.
j24 ARMED_NEVER_FIRED=9 (arming-bar CONFIRMPOLL confirm + ending row):
- 6/02 16:25 LONG Daily-POC conf 0 -> ABORT FRESH_OB_DEAD 17:40:03; 6/03 14:35:07 LONG Daily-POC conf 0 -> ABORT FRESH_OPP_FVG 14:40:06; 6/03 18:55:33 LONG Daily-POC conf 0 -> ABORT FRESH_OB_DEAD 19:00:00; 6/09 10:45 SHORT Weekly-POC conf 1 -> ABORT FRESH_OB_DEAD 11:00:03; 6/09 12:00 SHORT Weekly-POC conf 0 -> ABORT SESSION_CLOSED 12:05:00; 6/10 16:50 LONG Daily-POC conf 0 -> ABORT FRESH_OB_DEAD 16:55:00; 6/11 10:50 LONG Daily-VWAP conf 1 -> ABORT FRESH_OB_DEAD 11:00:00; 6/12 17:30 LONG Daily-POC conf 0 -> ABORT FRESH_OB_DEAD 17:35:00; 6/12 18:40:01 SHORT Weekly-POC conf 0 -> ABORT SESSION_CLOSED 19:05:01.
j23 LATER_PASS_FIRES=14:
- 8/28 arm 16:20:00 -> fire 16:25:00 SHORT Daily-POC; 8/31 arm 16:35:00 -> fire 16:40:01 LONG Yearly-POC; 9/01 arm 09:10:05 -> fire 09:15:00 SHORT Monthly-POC; 9/01 arm 15:05:05 -> fire 15:30:00 SHORT Monthly-POC; 9/01 arm 16:10:00 -> fire 16:15:00 SHORT Weekly-POC; 9/02 arm 16:30:00 -> fire 16:35:03 SHORT Yearly-POC; 9/04 arm 09:20:00 -> fire 09:30:01 LONG Daily-POC; 9/04 arm 15:35:00 -> fire 15:40:00 LONG Monthly-POC; 9/04 arm 15:50:00 -> fire 16:00:00 LONG Yearly-POC; 9/07 arm 09:05:00 -> fire 09:20:00 LONG Weekly-POC; 9/07 arm 16:20:03 -> fire 16:45:00 LONG Weekly-POC; 9/08 arm 16:20:00 -> fire 16:25:00 LONG Monthly-POC; 9/08 arm 16:35:00 -> fire 16:45:01 SHORT Monthly-POC; 9/08 arm 16:55:00 -> fire 17:00:00 SHORT Monthly-POC.
j23 ARMED_NEVER_FIRED=24 (confirm + ending):
- ABORT-closed (17): 8/26 09:15:01 SHORT Weekly-POC c0 LTF_MISALIGN 10:05:02; 8/26 10:25 LONG Weekly-VWAP c0 FRESH_OPP_FVG 11:40:04; 8/26 15:05 LONG Weekly-POC c0 FRESH_OPP_FVG 15:40:03; 8/27 09:45 SHORT Daily-POC c0 FRESH_OB_DEAD 09:50:00; 8/27 10:15 SHORT Weekly-POC c0 FRESH_OB_DEAD 10:45:00; 8/27 17:35:02 SHORT Weekly-VWAP c0 LTF_MISALIGN 17:40:01; 8/28 15:35 SHORT Daily-POC c0 LTF_MISALIGN 16:05:00; 8/28 18:50 SHORT Yearly-POC c0 SESSION_CLOSED 19:05:00; 8/31 10:25:01 LONG Monthly-VWAP c0 SESSION_CLOSED 12:05:06; 9/02 11:50 SHORT Daily-VWAP c0 SESSION_CLOSED 12:05:00; 9/03 09:05 LONG Yearly-POC c0 FRESH_OB_DEAD 09:25:00; 9/03 11:00 SHORT Daily-POC c0 FRESH_OB_DEAD 11:15:00; 9/03 18:35:02 LONG Daily-POC c0 FRESH_OPP_FVG 18:45:00; 9/04 09:35:01 LONG Daily-POC c0 FRESH_OB_DEAD 09:40:01; 9/04 11:50 SHORT Daily-POC c0 FRESH_OB_DEAD 11:55:00; 9/07 15:10 SHORT Weekly-POC c0 LTF_MISALIGN 15:35:04; 8/31 15:20 LONG Yearly-POC c0 SUPERSEDED by 16:35 re-arm (which fired 16:40:01).
- Transferred (1): 9/01 09:20 SHORT Yearly-POC c0 -> SIDE1C_YIELD 09:55 to LONG Weekly-VWAP, LONG fired same pass (S4 holder transfer, not a re-arm).
- Silent, NONE_PRINTED close (6): 8/28 17:00 SHORT Daily-POC c0; 8/28 17:05 SHORT Weekly-POC c0; 8/31 16:25:02 LONG Weekly-POC c0; 9/02 15:45:01 SHORT Daily-VWAP c0; 9/04 15:45 LONG Monthly-POC c0; 9/08 10:05 SHORT Weekly-POC c0 (armed, then no S4->S5, no ABORT, no YIELD on record for the own candidate; next same-key rows are new-candidate seeds days later or never).
- SECOND_CONFIRM_LATE_FIRES = 22, ARMED_NEVER_FIRED = 33. (Same-pass fires: j24 4 incl 11 June 14:40:22; j23 8. Arming-bar confirm=1 in only 2 of 33 never-fired.)

## M1 j24 5 June 15:55-16:20 rows (POC/VWAP/POI/zone/retest/CONFIRMPOLL/STATE/A6FIRED/ENTRY; Z3-zone family summarized after)
20457 QN 0 10:22:46.635 Core 04 2026.06.05 16:05:00   Alert: USDJPY M5 - POI RETEST LONG at 159.945  [D-POC +1]
20491 JS 0 10:22:46.635 Core 04 2026.06.05 16:05:00   [SRJ-EA] S3INPLAY bar=2026.06.05 16:00 dir=LONG inPlay=0 via=none zoneLo=0.000 zoneHi=0.000 barLo=159.726 barHi=160.262 close=160.034 sw1=-@-1 sw2=-@-1
20633 EJ 0 10:22:46.635 Core 04 2026.06.05 16:10:00   [SRJ-EA] RETESTBOOK bar=2026.06.05 16:05 hits=0
20634 FN 0 10:22:46.635 Core 04 2026.06.05 16:10:00   [SRJ-EA] UJDTTERMS bar=2026.06.05 16:05 Daily-POC=Lno-penetration/Sbody-above Daily-VWAP=Lno-penetration/Sbody-above
20635 OD 0 10:22:46.635 Core 04 2026.06.05 16:10:00   [SRJ-EA] RETESTDIAG bar=2026.06.05 16:05 inside=- nearAbove=-:-pts nearBelow=Daily-VWAP:25.8pts
20636 HI 0 10:22:46.635 Core 04 2026.06.05 16:10:00   [SRJ-EA] CONFIRMPOLL bar=2026.06.05 16:05 anchor=Daily-POC dir=LONG oppCandle=1 bodyDir=0 body=24pts doji=0 touchAttr=1 confirm=0 shadow=true
20641 NH 0 10:22:46.635 Core 04 2026.06.05 16:10:00   [SRJ-EA] S3INPLAY bar=2026.06.05 16:05 dir=LONG inPlay=0 via=none zoneLo=0.000 zoneHi=0.000 barLo=159.992 barHi=160.086 close=160.008 sw1=159.726@1 sw2=-@-1
20781 HL 0 10:22:46.635 Core 04 2026.06.05 16:15:00   [SRJ-EA] RETESTBOOK bar=2026.06.05 16:10 hits=0
20782 OS 0 10:22:46.635 Core 04 2026.06.05 16:15:00   [SRJ-EA] UJDTTERMS bar=2026.06.05 16:10 Daily-POC=Lno-penetration/Sbody-above Daily-VWAP=Lno-penetration/Sbody-above
20783 FF 0 10:22:46.635 Core 04 2026.06.05 16:15:00   [SRJ-EA] RETESTDIAG bar=2026.06.05 16:10 inside=- nearAbove=-:-pts nearBelow=Daily-VWAP:13.1pts
20784 DF 0 10:22:46.635 Core 04 2026.06.05 16:15:00   [SRJ-EA] CONFIRMPOLL bar=2026.06.05 16:10 anchor=Daily-POC dir=LONG oppCandle=1 bodyDir=1 body=49pts doji=0 touchAttr=0 confirm=0 shadow=true
20789 GJ 0 10:22:46.635 Core 04 2026.06.05 16:15:00   [SRJ-EA] S3INPLAY bar=2026.06.05 16:10 dir=LONG inPlay=0 via=none zoneLo=159.881 zoneHi=159.916 barLo=159.981 barHi=160.062 close=160.058 sw1=159.726@2 sw2=-@-1
20928 GM 0 10:22:46.635 Core 04 2026.06.05 16:20:00   [SRJ-EA] RETESTBOOK bar=2026.06.05 16:15 hits=0
20929 PR 0 10:22:46.635 Core 04 2026.06.05 16:20:00   [SRJ-EA] UJDTTERMS bar=2026.06.05 16:15 Daily-POC=Lno-penetration/Sbody-above Daily-VWAP=Lno-penetration/Sbody-above
20930 HQ 0 10:22:46.635 Core 04 2026.06.05 16:20:00   [SRJ-EA] RETESTDIAG bar=2026.06.05 16:15 inside=- nearAbove=-:-pts nearBelow=Daily-VWAP:51.4pts
20931 LE 0 10:22:46.635 Core 04 2026.06.05 16:20:00   [SRJ-EA] CONFIRMPOLL bar=2026.06.05 16:15 anchor=Daily-POC dir=LONG oppCandle=0 bodyDir=1 body=14pts doji=0 touchAttr=0 confirm=0 shadow=true
20936 GK 0 10:22:46.635 Core 04 2026.06.05 16:20:00   [SRJ-EA] S3INPLAY bar=2026.06.05 16:15 dir=LONG inPlay=0 via=none zoneLo=159.881 zoneHi=159.916 barLo=160.022 barHi=160.082 close=160.073 sw1=159.981@1 sw2=-@-1
(Zero Monthly/Weekly POC/VWAP rows in j24 15:55-16:20: every POI row names Daily-POC/Daily-VWAP only. FRESHSKIP PRE_BINDING LONG Daily-POC at 16:10/16:15/16:20 (state S3); UJPOISKIP line=Daily-POC anchor=Daily-POC; SL_REF 1-swing 159.881; XOBINPLAY/INPLAYCOMMIT zone 159.881-159.916 promoT 15:40 (OB zone 15:40-born, not a POI line); no A6FIRED/ENTRY on 5 June NY in j24 - the 5 June long never fired on any build.)

## M2 entry-POI timeframes in code (git grep, disk EA + Include/SRJ; line numbers this report only)
- Experts/SRJ_FlowNexus_EA.mq5:86 #define POI_NLINES 12 (12 POI lines read via ReadBuf1).
- EA:99 g_lineCode[POI_BUF_M_POC] = "Monthly-POC"; EA:100 g_lineCode[POI_BUF_M_VWAP] = "Monthly-VWAP" (buffers 6/7).
- EA:101-102 Weekly-POC/Weekly-VWAP (buffers 8/9); EA:103-104 Daily-POC/Daily-VWAP (buffers 10/11); EA:93-98 FOMC/Yearly/Quarterly pairs (buffers 0-5).
- Include/SRJ/SRJ_TickCore.mqh:47 ANCHOR_MONTHLY = 2 (monthly anchor type exists).
- EA_POI_LINES = D + W + M (Daily + Weekly + Monthly all read; his "M POC and M VWAP" = buffers 6/7; "also the W" = buffers 8/9 at the same price).

## M3 16:00 levels (rows already written; run tree: j24 CURRENT on 63B18C1F)
- 16:00 candle H/L (S3INPLAY j24:20491): barLo=159.726 barHi=160.262 close=160.034.
- D POC: TOUCHED_1600 (alert j24:20457 retest LONG at 159.945 [D-POC +1]; RETESTBOOK 16:00-bar hits=2 incl Daily-POC; UJDTTERMS LHIT). Absolute line value NOT printed (159.945 = touch price).
- D VWAP: TOUCHED_1600 (same hits=2 + LHIT; absolute NOT printed).
- MPOC: NOT_LOGGED. MVWAP: NOT_LOGGED. WPOC: NOT_LOGGED. WVWAP: NOT_LOGGED (no Monthly/Weekly POI rows 15:55-16:20 in j24; entry-POI logic reads the lines per M2 but no 16:00 touch rows exist for them).

(End of slice)
