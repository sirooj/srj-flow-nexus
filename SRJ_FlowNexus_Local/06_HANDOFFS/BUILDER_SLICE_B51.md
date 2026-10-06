# BUILDER SLICE B-51 - raw rows behind A2, P1, P2, P3 and P6 (payloads only; read-only, no run)

## 0.4 gate SHAs (raw / normalized; raw compared for source+ex5 per relay)
- pointer D5AA7DF6 / d5aa7df6 MATCH (1728 B).
- RESULT_B50 F2B34030 / f2b34030 MATCH (9095 B).
- SLICE_B50 640ED2BF / 640ed2bf MATCH (9997 B).
- register pre-A2 C1E4AEDE / c1e4aede MATCH (7329 B); post-A2 appended (new SHA in result).
- strategy 7762E905 / 7762e905 MATCH (60699 B).
- context E06BB7B4 / e06bb7b4 MATCH (8837 B, section 4 present).
- relay skill disk bb467c55 MATCH (accounted).
- EA 63B18C1F raw MATCH; EA.ex5 B0D4AA9E raw MATCH; FlowLogic 956BF3E3 raw MATCH; FlowLogic.ex5 27B5F272 raw MATCH; BiasEngine 3B1D9D3D / OrderblockMgr 5D14FCE2 / Draw FD2B3716 / HTFEngine D5FD5B06 raw MATCH; TickAudit 7AD6ABEF / 7C8946D8 MATCH.
- ledger normalized 8340BC8F (1128403 B) MATCH; journal normalized 261ebd8f (1060 lines) MATCH.
- terminal.ini 450ACB4A raw MATCH (report-only).

## A2 grep + append
- grep `CORRECTION 2026-10-07 (B-51` count 0 -> appended the relay line verbatim at end of section B after the B-46 correction. Row 2 itself untouched.
- A2 source raw (BUILDER_FINDING_USDJPY-MISSES.md:52): `- A2 (6/5 16:15 TP levels): "as i have said previouly, there is no such thing as no profit target, there is only target there is less than 1R. i can understand on the code technical side, because the valid nearest target is the april 30th previous day high for 160.723 and that is more than 10 days of the code max session detection. but eventually, the TP target is revised to the current new york session high once it's over. i want your solution."`

## P1 PASS_MAP_1106 rows (Tester/logs/20261006.log UTF-16; 08:37 full-June current-tree run; j32 lacks 11 June so j18-class rows used per relay; B-35 j18 cites match the same shape)
14:10 pass (judges 14:05 bar; SHORT seed):
347204 MD 0 08:37:36.155 Core 04 2026.06.11 14:10:00   [SRJ-EA] RETESTBOOK bar=2026.06.11 14:05 hits=1 Daily-POC:r10:dS
347210 ND 0 08:37:36.155 Core 04 2026.06.11 14:10:00   [SRJ-EA] 2026.06.11 14:10:00 STATE IDLE->S1_REGIME dir=SHORT poi=Daily-POC
347211 OD 0 08:37:36.155 Core 04 2026.06.11 14:10:00   [SRJ-EA] ANCHOR_ELECT bar=2026.06.11 14:05 action=SEED poi=Daily-POC rank=10 tier=5 dir=SHORT
14:15 pass (judges 14:10 bar; SHORT fades, no abort/kill rows):
347224 GS 0 08:37:36.155 Core 04 2026.06.11 14:15:00   [SRJ-EA] RETESTBOOK bar=2026.06.11 14:10 hits=0
14:20 pass (judges 14:15 bar; LONG seeds):
347231 ML 0 08:37:36.155 Core 04 2026.06.11 14:20:00   [SRJ-EA] UJPROBE bar_key=2026.06.11 14:15 h4=1.0 h1=1.0 m15=-1.0 confirmedFeed=1 ltf=-1.0 div=OPPOSING kind=regular readFail=0 empty=107046 zero=0 complete=1 latestNZ=1 covReq=2026.04.29 covAch=2026.04.29 dayCoun
347232 NE 0 08:37:36.155 Core 04 2026.06.11 14:20:00   [SRJ-EA] RETESTBOOK bar=2026.06.11 14:15 hits=0
347235 CD 0 08:37:36.155 Core 04 2026.06.11 14:20:00   [SRJ-EA] CONFIRMPOLL bar=2026.06.11 14:15 anchor=Daily-POC dir=SHORT oppCandle=0 bodyDir=0 body=2pts doji=0 touchAttr=0 confirm=0 shadow=true
(No SHORT holder forms: no SHORT S4/armed rows at any 14:15-14:45 pass; the 14:10 SHORT never arms.)
14:25:21 pass (judges 14:20 bar; LONG S1->S2):
347240 RP 0 08:37:36.155 Core 04 2026.06.11 14:25:21   [SRJ-EA] UJPROBE bar_key=2026.06.11 14:20 h4=1.0 h1=1.0 m15=-1.0 confirmedFeed=1 ltf=-1.0 div=OPPOSING kind=regular readFail=0 empty=107047 zero=0 complete=1 latestNZ=1 covReq=2026.04.29 covAch=2026.04.29 dayCoun
347246 PO 0 08:37:36.155 Core 04 2026.06.11 14:25:21   [SRJ-EA] SUPPRESSED bar=2026.06.11 14:20 poi=Daily-POC dir=LONG opp=0 higher=0 heldPoi=Daily-POC heldDir=LONG heldState=S1_REGIME cum_n=68 cum_opp=14 cum_hi=5 cum_both=1 action=HELD
347247 MO 0 08:37:36.155 Core 04 2026.06.11 14:25:21   [SRJ-EA] RETESTBOOK bar=2026.06.11 14:20 hits=2 Daily-POC:r10:dL Daily-VWAP:r11:dL
347250 PL 0 08:37:36.155 Core 04 2026.06.11 14:25:21   [SRJ-EA] CONFIRMPOLL bar=2026.06.11 14:20 anchor=Daily-POC dir=LONG oppCandle=0 bodyDir=1 body=1pts doji=0 touchAttr=1 confirm=0 shadow=true
347252 NH 0 08:37:36.155 Core 04 2026.06.11 14:25:21   [SRJ-EA] 2026.06.11 14:25:21 STATE S1_REGIME->S2_LTF_ALIGN dir=LONG poi=Daily-POC
14:30 pass (judges 14:25 bar; LONG S2 held, own-census HELD opp=0):
347258 MH 0 08:37:36.155 Core 04 2026.06.11 14:30:00   [SRJ-EA] UJPROBE bar_key=2026.06.11 14:25 h4=1.0 h1=1.0 m15=-1.0 confirmedFeed=1 ltf=-1.0 div=ALIGNED kind=regular readFail=0 empty=107048 zero=0 complete=1 latestNZ=1 covReq=2026.04.29 covAch=2026.04.29 dayCount
347417 KE 0 08:37:36.155 Core 04 2026.06.11 14:30:00   [SRJ-EA] SUPPRESSED bar=2026.06.11 14:25 poi=Daily-POC dir=LONG opp=0 higher=0 heldPoi=Daily-POC heldDir=LONG heldState=S2_LTF_ALIGN cum_n=69 cum_opp=14 cum_hi=5 cum_both=1 action=HELD
347418 ME 0 08:37:36.155 Core 04 2026.06.11 14:30:00   [SRJ-EA] RETESTBOOK bar=2026.06.11 14:25 hits=2 Daily-POC:r10:dL Daily-VWAP:r11:dL
347421 QG 0 08:37:36.155 Core 04 2026.06.11 14:30:00   [SRJ-EA] CONFIRMPOLL bar=2026.06.11 14:25 anchor=Daily-POC dir=LONG oppCandle=0 bodyDir=0 body=1pts doji=0 touchAttr=1 confirm=0 shadow=true
14:35:10 pass (judges 14:30 bar; LONG S2 held):
347425 DP 0 08:37:36.155 Core 04 2026.06.11 14:35:10   [SRJ-EA] UJPROBE bar_key=2026.06.11 14:30 h4=1.0 h1=1.0 m15=-1.0 confirmedFeed=1 ltf=-1.0 div=ALIGNED kind=regular readFail=0 empty=107049 zero=0 complete=1 latestNZ=1 covReq=2026.04.29 covAch=2026.04.29 dayCount
347583 GM 0 08:37:36.155 Core 04 2026.06.11 14:35:10   [SRJ-EA] SUPPRESSED bar=2026.06.11 14:30 poi=Daily-POC dir=LONG opp=0 higher=0 heldPoi=Daily-POC heldDir=LONG heldState=S2_LTF_ALIGN cum_n=70 cum_opp=14 cum_hi=5 cum_both=1 action=HELD
347584 IJ 0 08:37:36.155 Core 04 2026.06.11 14:35:10   [SRJ-EA] RETESTBOOK bar=2026.06.11 14:30 hits=2 Daily-POC:r10:dL Daily-VWAP:r11:dL
347587 NN 0 08:37:36.155 Core 04 2026.06.11 14:35:10   [SRJ-EA] CONFIRMPOLL bar=2026.06.11 14:30 anchor=Daily-POC dir=LONG oppCandle=1 bodyDir=0 body=3pts doji=0 touchAttr=1 confirm=0 shadow=true
14:40:22 pass (judges 14:35 bar; LONG confirms + ARMS; ltf flips to +1.0):
347595 PO 0 08:37:36.155 Core 04 2026.06.11 14:40:22   [SRJ-EA] UJPROBE bar_key=2026.06.11 14:35 h4=1.0 h1=1.0 m15=-1.0 confirmedFeed=1 ltf=1.0 div=ALIGNED kind=regular readFail=0 empty=107050 zero=0 complete=1 latestNZ=1 covReq=2026.04.29 covAch=2026.04.29 dayCount=
347754 FF 0 08:37:36.155 Core 04 2026.06.11 14:40:22   [SRJ-EA] SUPPRESSED bar=2026.06.11 14:35 poi=Daily-POC dir=LONG opp=0 higher=0 heldPoi=Daily-POC heldDir=LONG heldState=S2_LTF_ALIGN cum_n=71 cum_opp=14 cum_hi=5 cum_both=1 action=HELD
347755 CS 0 08:37:36.155 Core 04 2026.06.11 14:40:22   [SRJ-EA] RETESTBOOK bar=2026.06.11 14:35 hits=2 Daily-POC:r10:dL Daily-VWAP:r11:dL
347758 PG 0 08:37:36.155 Core 04 2026.06.11 14:40:22   [SRJ-EA] CONFIRMPOLL bar=2026.06.11 14:35 anchor=Daily-POC dir=LONG oppCandle=1 bodyDir=1 body=3pts doji=0 touchAttr=1 confirm=1 shadow=true
347759 CG 0 08:37:36.155 Core 04 2026.06.11 14:40:22   [SRJ-EA] 2026.06.11 14:40:22 STATE S2_LTF_ALIGN->S3_ZONE_WAIT dir=LONG poi=Daily-POC
347774 FI 0 08:37:36.155 Core 04 2026.06.11 14:40:22   [SRJ-EA] 2026.06.11 14:40:22 STATE S3_ZONE_WAIT->S4_ARMED dir=LONG poi=Daily-POC
347776 CG 0 08:37:36.155 Core 04 2026.06.11 14:40:22   [SRJ-EA] ALERT SRJ HEADS-UP LONG USDJPY M5 | Daily-POC | NYAM | zone 160.489-160.504 awaiting confirm
347738 NM 0 08:37:36.155 Core 04 2026.06.11 14:40:22   [SRJ-EA] TPCENSUS #161 bar=2026.06.11 14:35 dir=LONG ref=160.524 winner=YLOH best=160.587 distPts=63 empties=8 admitted= PDH:47 ASH:24 LOH:63 NYH:10 PMH:17 YASH:24 YLOH:63 YNYH:5 YPMH:17
14:45:05 pass (judges 14:40 bar; second confirm fails, S4 held):
347784 IO 0 08:37:36.155 Core 04 2026.06.11 14:45:05   [SRJ-EA] UJPROBE bar_key=2026.06.11 14:40 h4=1.0 h1=1.0 m15=-1.0 confirmedFeed=1 ltf=1.0 div=ALIGNED kind=regular readFail=0 empty=107051 zero=0 complete=1 latestNZ=1 covReq=2026.04.29 covAch=2026.04.29 dayCount=
347786 OH 0 08:37:36.155 Core 04 2026.06.11 14:45:05   [SRJ-EA] IDCHANGE bar=2026.06.11 14:40 inWin=1 state=S4_ARMED dir=LONG xobId=3070->3103 fvgId=0->0 xobLo=160.498 xobHi=160.518 cumX=349 cumF=0 bars=2482
347787 RQ 0 08:37:36.155 Core 04 2026.06.11 14:45:05   [SRJ-EA] FRESHCOUNT #59 bar=2026.06.11 14:40 state=S4_ARMED obDead=0 fvgDead=1 oppFvg=0 adverse=1 verdict=HOLD scope=pre cum1=24 cum2=7 cum3=0
347945 JE 0 08:37:36.155 Core 04 2026.06.11 14:45:05   [SRJ-EA] RETESTBOOK bar=2026.06.11 14:40 hits=0
347948 OJ 0 08:37:36.155 Core 04 2026.06.11 14:45:05   [SRJ-EA] CONFIRMPOLL bar=2026.06.11 14:40 anchor=Daily-POC dir=LONG oppCandle=0 bodyDir=0 body=3pts doji=0 touchAttr=1 confirm=0 shadow=true
347928 NP 0 08:37:36.155 Core 04 2026.06.11 14:45:05   [SRJ-EA] TPCENSUS #162 bar=2026.06.11 14:40 dir=LONG ref=160.520 winner=Daily-VWAP best=160.522 distPts=2 empties=8 admitted= PDH:51 ASH:28 LOH:67 NYH:14 PMH:20 YASH:28 YLOH:67 YNYH:9 YPMH:20 Daily-VWAP:2
(SUPPRESSED = holder census: heldPoi/heldDir/heldState name the holder; opp=0 means the candidate IS the holder (self-census), no opposite holder. No SHORT S4_ARMED holder at any 14:15-14:45 pass. The 14:50 SHORT candidate (bar 14:45 hits=2 SHORT, wouldPreempt=0, line 348118) is post-window. FRESHCOUNT HOLD = held, never killed (no ABORT). TPCENSUS #161/#162 are census prints; booking never executes (S5 unreached; BOOKING-INNOCENT). ref=160.524 at #161 = his 14:40 entry per Rulings-J:119.)

## P2 code spot (Experts/SRJ_FlowNexus_EA.mq5:9284-9305, S4->S5 edge, located by text IsConfirmationCandle + g_confirmFromState)
9284:          //--- [P-CONFIRM-GATE E2] the S4->S5 edge IS the confirmation predicate
9285:          //--- now (terms A/A2/B/C; the ruled retracement term A2: the prior
9286:          //--- candle's CLOSE stays on the setup side of the anchor line - a wick
9287:          //--- through is the retracement, a CLOSE through is a line break).
9288:          //--- One-bar validity: promotion happens ONLY on a true test bar; a
9289:          //--- failed term consumes the confirmation (no carry-forward) and a
9290:          //--- later bar can present a fresh confirmation while the candidate is
9291:          //--- alive and in-window. The touch fallback above STAYS (it sets
9293:          string cfTerm = "";
9294:          if(IsConfirmationCandle(barShift, g_anchorLine, g_dir, cfTerm))
9295:            {
9296:             ENUM_SRJ_STATE prev = g_state;
9297:             g_confirmFromState = prev;
9298:             g_state = ST_S5_GATE_CHECK;
9299:             LogState(prev, g_state);
9300:            }
9301:          else if(InpDebugLog)
9302:             PrintFormat("[SRJ-EA] CONFIRM_STRUCT_FAIL bar=%s dir=%s term=%s",
9305:          else if(InpDebugLog)
(The 14:40 arming confirm is consumed by S3->S4; S4->S5 re-tests the CURRENT (14:40) bar: hits=0 + confirm=0 above, so no promotion. B-35 CONFIRM_1435_USED_BY = ARM + second-confirm-needed is the same gate.)

## P3 FOUND raws (his banked words ruling the blocker)
- Rulings-F session rebuke (BUILDER_FINDING_USDJPY-MISSES.md:96): "you still conflicting this rule that shows either you didn't read the skill strategy or the strategy specification. this confusion and problem is not new and has been explained by me before. what is the 8:30 potential non executed setup doing here that is preventing the 14:40 entry? why has not been invalidated by the line POI break bias or the flip of the 5m structure bias. besides that, the london setup is irrelevant to prevent setup on the NY, the one position at a time does not apply multi session. meaning i can execute a setup on NY session while the london setup is still floating, even if it's conflicting bias direction wise. also why is the 8:30 setup even considered? the london session begins at 9:00 or at most 8:55 that could be executed at the 9:00 open candle?"
- Rulings-G sequencing (findings:102): "if so then on 11 jun for the NY trend following setup, the 5m bias flip is at the same candle for the retest, and confirmation candle which is at 14:35 and the entry is at 14:40 open candle price. idk why are still considering the 14:45, DO NOT REPEAT THIS MISTAKE!"
- Rulings-J entry bar (findings:119): "I see the problem, with that entry price of 160.520, that is the opening candle price of 14:45 NOT 14:40 which should be 160.524. the confirmation and retest candle is at 14:35 and the entry is at the candle open of 14:40"
- Register B3 HIS rule (register:27): "HIS rule: 14:35 retest+confirmation, FVG irrelevant post-flip".
- Strategy CONFIRM-ONCE (skill:85): "the latest D POC retest is at 9:35 and then the confirmation candle is the 9:40 and the EA should enter at 9:45 open candle price. the 9:35 is still relevant" + pin: ONE confirmation bar suffices with entry at the next open; later bars never re-litigate the confirmation.
- Strategy CONFIRMATION-BAR (skill:53): "the confirmation candle and the candle that did the latest POI retest was 16:55, so the entry is the next 17:00 candle open price" + pin: confirmation bar N, entry N+1 open.
- Strategy TIMING-N/N+1 (skill:55): "5 June London USDJPY = 9:35 retest, 9:40 confirmation, 9:45 open entry; 11 June New York USDJPY = 14:35 retest + confirmation, 14:40 open entry".
- Strategy FLIP-KILLED-NEVER-VETOES (skill:117): "like the 5m bias? if so then no" (flip-killed holder never vetoes) + LIVE-TRADE-BLOCKS-ALL (live position blocks; candidate contention only without one).
- Strategy POTENTIAL-vs-SETUP (skill:52): "when the liquidity is swept or when there is a valid POI retest, it is only a potential setup forming" + pin: unconfirmed held seed carries no arrival protection at any stage before confirmation.
- Strategy BOOKING-INNOCENT (skill:56): nearest-TP rule never causes a selection miss - booking runs only after election (S5 unreached here: no ABORT/booking rows past S4).
- Strategy 5M-BIAS-AT-ENTRY (skill:139): no entry against the 5m structure bias at the entry open (ltf +1.0 at the 14:35 bar, 347595: agreed, not a blocker).
- Armed-holder question: Rulings-F (above) + POTENTIAL-vs-SETUP (:52) + FLIP-KILLED-NEVER-VETOES (:117) FOUND; no banked word lets an armed-never-filled setup hold a session (nothing found; not needed - no such holder on current rows).

## P6 retest-line search (his own words on which line the 5 June NY long retested)
- Journal 304/305/307/308 (neighbours of 306): 1-Sep-INVALID, 8/27-INVALID, 5M-FLIP-TRIGGER-0605LDN (London 5m), 0605LDN-REVISED (London gap + NOT VALID). None names a 5 June NY retest line.
- Register B row 2 Line cell (pre-A2): "Old high 160.723 (April-30th day high) [HIS]" = target per A2, not retest line (A2 correction filed).
- Strategy 13 (JUN05NY-ENTRY-1615): entry 16:15 open only. Strategy 15: RAW-GAP-0605 (hole), OB0750-VALID (London OB), 0605LDN-FLIPS (London flips). None names the NY retest line.
- Findings Miss 2 (:21-27): machine seed Daily-POC LONG (machine's line, R63-era NO_TP_TARGET path, superseded) + "His 16:15 entry had no live seed". Not his retest line.
- Ledger items naming 5 June New York (812, 1016, 1176, 1190, 1192): entry 16:15 + target 160.723 + seed/kill rows. None names his retest line.
- Terms searched: Daily-POC, Daily-VWAP, old high 160.723, "retest" near 16:15/NY0605.
- Verdict: NO_RULING_FOUND -> carried-note chart call (exact relay wording).

(End of slice)
