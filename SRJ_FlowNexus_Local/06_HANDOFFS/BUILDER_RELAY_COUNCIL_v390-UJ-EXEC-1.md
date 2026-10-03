# BUILDER RELAY COUNCIL v390-UJ-EXEC-1 - packet P-RECON78-UJ-EXEC-1 v1 (new execution-path diagnosis, page-only)
Status: DRAFT - packet SHA-256 
4C37E18FC0D95F8DDDD09D815315DEF3B11B72EF3EDC8B1F04864CA1B4A4095F
 / 
15225
 bytes / 
132
 physical lines; exact twin 
132
/
132
; PSEQ P001-P
132
; source and run facts are operator-machine evidence, not chat verification.
Project brief (standing): alert-only EA; no live trades or funded money moves. Sonnet and GLM are required; Astra/Opus optional by operator choice. The operator carries replies verbatim. This relay authorizes no code edit, build, run, key request, commit, push, or live activation.
History: V389 on P-RECON74FIX-2 v39 was CONFIRM/CONFIRM page-only and the authorized single UJ run has now completed as RECON78-V26-UJ. This is a separate evidence-led follow-up, not a request to repeat the prior run.
Scope: judge this pasted page only. Luna verifies source bytes and actual tester deals on disk. Do not infer strategy authority or build/run authorization. No V390 verdicts have been returned.

## 0. New evidence and decision scope
- The registered June 5 NY USDJPY LONG is owed at 16:15, target Old high 160.723. RECON78 actually entered later at 16:55.
- RECON78 records internal retarget to 160.298 on the 19:00 session-close bar and internal MTEXIT TP_TOUCH on the 19:15 bar, but the actual broker order retained TP 160.723 and stopped on June 11 at 159.725.
- Source diagnosis: retarget changes only the managed `tpRef`; execution closes only body-break/day-close positions. TP/SL remain broker-owned.
- The 16:05 16:00-bar Daily-POC LONG candidate was killed by `SEEDBIAS_REFUSED`; the later 16:45 retest produced the 16:55 entry. No 5m-flip rule may be weakened.
- Packet provides exact source excerpts and raw rows. Review both independent questions.

## Q1 - actual broker execution follows closed-session retarget
Q1 verdict: CONFIRM / OBJECT / DISCREPANCY.
Analytic ask A: identify any page defect, missing source path, or safer narrow code mechanism; say whether the diagnosis in packet sections 6-8 follows from the excerpts and actual rows.
Analytic ask B: recommend ordering and a run predicate proving modeled retarget, accepted broker TP update or close, and actual deal exit at revised target, while preserving SL behavior. Name the code sites.

## Q2 - 16:15 valid entry miss
Q2 verdict: CONFIRM / OBJECT / DISCREPANCY.
Analytic ask A: evaluate whether section 4 supports `SEEDBIAS_REFUSED` as the immediate refusal and identify the narrowest implementation investigation or correction that preserves the pre-confirmation 5m structure-bias flip kill, confirm-once, and next-open entry.
Analytic ask B: state row-level acceptance proving the 16:15 valid take for its own reasons, the 8 June invalid short stays silent, and the later 16:55 trade is not counted as a substitute.
Answer both A and B for each question. Cite packet physical P-lines. List every condition, gap, or missing evidence; do not invent strategy rules.

Verification split: seats judge only pasted text. Disk hashes, excerpts, journals, and deal facts are checked by Luna on the operator machine. Do not request files. No model grants a key or run word.
Close each question separately. State conditions and any HOLD. Council opinion does not replace the operator on strategy or the required future build/run authorization.

## Twin (packet P-RECON78-UJ-EXEC-1 v1 - mechanical splice from final saved packet bytes)
P001: # PACKET P-RECON78-UJ-EXEC-1 v1 - June UJ broker-target synchronization and 5 June NY admission diagnosis
P002: 
P003: Status: v1 DRAFT for page-only review by Sonnet and GLM. This is a new, bounded follow-up to the completed RECON78-V26-UJ run. No EA edit, build, tester run, live action, or deployment is authorized by this packet. The prior one-run grant has been consumed. Council reviews implementation scope and acceptance; operator strategy rules remain governing.
P004: 
P005: ## 1 - Aim and scope
P006: Diagnose why the June 5 NY USDJPY position remained open to its original broker stop after its internal target was retargeted at the NY session close, and why the registered 16:15 LONG was missed while a later 16:55 LONG was executed. Propose the narrowest implementation correction and a run acceptance that can prove actual tester deals follow the modeled target and preserve entry/invalidation rules.
P007: 
P008: ## 2 - Authority and unchanged pins
P009: The audited register is `SRJ_FlowNexus_Local/06_HANDOFFS/BUILDER_REGISTER_VALID_TRADES.md`: UJ valid misses are 5 June London SHORT 09:45, 5 June NY LONG 16:15 with Old high 160.723 (April-30th day high), and 11 June NY LONG 14:40. Its section C lists invalid controls. Later operator rules in `.agents/skills/srj-strategy/SKILL.md` govern: one confirmation then next-open entry; the 5m structure-bias flip kills pre-confirmation; floating trades may retarget to a closed NY session high; POC supremacy and no own-origin target; alert-only, no live orders.
P010: 
P011: ## 3 - Completed run identity
P012: RECON78-V26-UJ completed PASSED on USDJPY M5, tester window 2026-06-01 00:00 through 2026-06-13 00:00, InpDebugLog=true and InpMode=1 (tester simulation). Source SHA-256 `E80FF0C24149AB0946EB6A4341C0503A79BFE82E9843867CEF0DBA89BF587BBC`; EX5 SHA-256 `DDA3257042354F0BCCB816FB52E7B78E3E47F323F54A29DD54DC0441F5E1B705`; archived journal `SRJ_FlowNexus_Local/06_HANDOFFS/RECON78-V26-UJ_JOURNAL.log`, 36,760 lines. This is simulated tester evidence only.
P013: 
P014: ## 4 - Entry and broker fill evidence
P015: The June 5 NY alert at 16:55 was LONG, Daily-POC, entry deal #6 at 160.120, SL 159.726, broker TP 160.723. The 16:15 register row was not entered. At 16:05 the 16:00 Daily-POC LONG candidate was emitted with `UJPROV` printed `reseedBar=1970.01.01 00:00`, `reseedDir=0`, and `exempt=0`, followed by `S2SEEDBIAS_KILL` and `ABORT reason=SEEDBIAS_REFUSED`. At the later 16:45 retest the path advanced and produced the 16:55 signal. The early refusal is the observed proximate cause; this packet does not relax the operator's 5m-flip kill.
P016: 
P017: ## 5 - Internal retarget and modeled exit
P018: At the first bar outside the NYAM entry-session run, the log says `UJRETARGET bar=2026.06.05 19:00 dir=LONG old=160.723 sess=2 tp=160.298 seq=3`. The internal managed-trade model later prints `MTEXIT bar=2026.06.05 19:15 reason=TP_TOUCH` with `exit=160.298` and `MTLIFE` with `verdict=TP_TOUCH`, `closePx=160.298`.
P019: 
P020: ## 6 - Actual tester deal contradicts the modeled exit
P021: No broker TP modification or broker-position close appears for the NY retarget. Actual tester deal #6 retained its original TP 160.723 and SL 159.726; on 11 June 22:30:51 it was stopped, deal #7 at 159.725. Thus the internal MTEXIT/MTLIFE describes a simulated TP_TOUCH, but the actual executed position did not exit there. User's observation that the NY trade did not exit on the closed-session high is confirmed by actual deals. The result file must grade actual deals as the execution outcome, not the internal model row.
P022: 
P023: ## 7 - Source mechanism
P024: `Experts/SRJ_FlowNexus_EA.mq5` lines 11912-11923 update only `g_mtrade.tpRef` after `UjClosedSessionTarget` returns the tighter closed-session extreme. Lines 12036-12043 mark the managed trade closed and choose TP_TOUCH price. Lines 12052-12061 call `MtCloseBrokerPosition` only for `MT_EXIT_POI_BODY_BREAK` or `MT_EXIT_DAY_CLOSE`; TP_TOUCH and SL are explicitly broker-owned and no `PositionModify` synchronizes the revised TP. Entry send at lines 10804-10806 passes the original `tpTarget` to Buy/Sell. The source therefore predicts the observed split: model target 160.298, real broker TP 160.723.
P025: 
P026: ## 8 - Retarget rule boundary
P027: The established rule is a floating trade may retarget to its closed NY session high. This run's NY entry session closed at the 19:00 bar; the code calculated 160.298 from that session instance and its internal model exited at the first later TP touch. The unresolved implementation question is how to carry the revised target to the actual tester position while preserving broker-owned SL/TP handling and exact fill semantics. Do not reinterpret the rule as an immediate market close at session close.
P028: 
P029: ## 9 - Q1 verdict required: actual execution follows retarget
P030: Each seat must return exactly one Q1 verdict: CONFIRM / OBJECT / DISCREPANCY. Evaluate the source diagnosis in sections 6-8 and recommend the narrowest code path that makes the actual tester deal honor the revised 160.298 target. Ask A: identify the required execution action and its ordering relative to retarget/touch evaluation (including whether broker TP modification or a managed close is necessary). Ask B: name an acceptance predicate that separately proves (i) internal retarget value, (ii) broker position TP update or close request accepted, and (iii) actual deal exit at the revised level, while retaining unchanged SL behavior. State assumptions and any code sites to inspect.
P031: 
P032: ## 10 - Q2 verdict required: 16:15 admission miss
P033: Each seat must return exactly one Q2 verdict: CONFIRM / OBJECT / DISCREPANCY. Evaluate the observed 16:05 `SEEDBIAS_REFUSED` at the 16:00 LONG Daily-POC candidate versus the registered 16:15 LONG, and the later 16:55 actual take. Ask A: identify the narrowest permitted implementation investigation or correction for this miss without weakening the 5m-flip-kill rule, confirm-once/next-open timing, or invalid-control behavior. Ask B: specify the row-level acceptance that must demonstrate the 16:15 valid take is admitted for its own reasons, the 8 June invalid SHORT stays silent, and no 16:55 duplicate/later substitute is miscounted as the 16:15 row. If evidence does not establish a safe edit, say what remains unproven; do not invent a strategy rule.
P034: 
P035: ## 11 - Required cross-checks
P036: Any proposed entry change must preserve 5 June London 09:45 SHORT behavior on the correct confirmation bar, the 8 June 09:25 invalid SHORT negative control, the 6/9 09:50 never-reseeded keep, and the separate operator-side 5m-series review. Any proposed exit change must preserve the universal day-close rule and body-break priority, and prove broker deal behavior rather than only MTEXIT/MTLIFE telemetry.
P037: 
P038: ## 12 - Run and scope boundary
P039: No new build/run is requested in this review round. Any subsequent implementation needs a fresh council disposition plus an exact new Luna key and operator run word. No EU run or EU behavior is in scope. Live trading is prohibited.
P040: 
P041: ## 13 - Seat packaging and answer form
P042: Sonnet and GLM are the required seats; Astra/Opus are optional only if the operator chooses. Page-only review. Each reply must contain Q1 and Q2 verdicts, each Ask A and Ask B, source/page findings, explicit conditions or missing evidence, and a close. A seat may not convert implementation advice into operator strategy authority.
P043: 
P044: ## 14 - Review split and close
P045: Council decides whether the diagnosis is supported and whether the proposed implementation/acceptance is complete enough for a future bounded packet. Luna independently verifies source lines and actual deal evidence. The operator remains sole authority for strategy meaning, any new run word, and carrying replies between chats. No result in this packet grants a build, run, activation, or deployment.
P046: 
P047: ## 15 - Source excerpt A (EA lines 11912-11923)
P048: ```mql5
P049:     //--- [P-RECON74FIX-2 R] session-close retarget (his RETARGET rule; closed-session values only; instance-contained plus caller-strict-tighter jointly bound the revision to one per trade instance).
P050:     if(g_mtrade.tpRef != EMPTY_VALUE && g_mtrade.tpRef > 0.0)
P051:       {
P052:        double uj_rtPx = 0.0;
P053:        if(UjClosedSessionTarget(g_mtrade, barShift, uj_rtPx) && uj_rtPx > 0.0
P054:           && ((g_mtrade.dir == DIR_LONG && NormalizeDouble(uj_rtPx, _Digits) < NormalizeDouble(g_mtrade.tpRef, _Digits)) || (g_mtrade.dir == DIR_SHORT && NormalizeDouble(uj_rtPx, _Digits) > NormalizeDouble(g_mtrade.tpRef, _Digits))))
P055:          {
P056:           double uj_oldRef = g_mtrade.tpRef;
P057:           g_mtrade.tpRef = uj_rtPx;
P058:           if(InpDebugLog) PrintFormat("[SRJ-EA] UJRETARGET bar=%s dir=%s old=%s sess=%d tp=%s seq=%I64d admit=%s - session-close retarget (Fix R)", TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES), DirName(g_mtrade.dir), DoubleToString(uj_oldRef, _Digits), g_mtrade.sessionAtEntry, DoubleToString(g_mtrade.tpRef, _Digits), (long)g_mtrade.uj_tradeSeq, TimeToString(g_mtrade.uj_admitBarTime, TIME_DATE|TIME_MINUTES));
P059:          }
P060:        else if(InpDebugLog && uj_rtPx > 0.0) PrintFormat("[SRJ-EA] UJNORETARGET bar=%s dir=%s tp=%s rt=%s why=%s sess=%d seq=%I64d admit=%s - helper true but not tighter (Fix R)", TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES), DirName(g_mtrade.dir), DoubleToString(g_mtrade.tpRef, _Digits), DoubleToString(uj_rtPx, _Digits), (NormalizeDouble(uj_rtPx, _Digits) == NormalizeDouble(g_mtrade.tpRef, _Digits) ? "eq" : "loose"), g_mtrade.sessionAtEntry, (long)g_mtrade.uj_tradeSeq, TimeToString(g_mtrade.uj_admitBarTime, TIME_DATE|TIME_MINUTES)); // helper-true discriminator
P061: ```
P062: 
P063: ## 16 - Source excerpt B (EA lines 12036-12068)
P064: ```mql5
P065:    //--- close the trade (the priority order stated in the header)
P066:    g_mtrade.state       = MT_CLOSED;
P067:    g_mtrade.exitBarTime = barTime;
P068:    if(vSL)         { g_mtrade.exitReason = MT_EXIT_SL;             g_mtrade.exitPrice = g_mtrade.slRef; }
P069:     else if(vTP)    { g_mtrade.exitReason = MT_EXIT_TP_TOUCH;       g_mtrade.exitPrice = g_mtrade.tpRef; }
P070:    else if(vBREAK) { g_mtrade.exitReason = MT_EXIT_POI_BODY_BREAK; g_mtrade.exitPrice = nextOpenPx; }
P071:    else if(vHTF)   { g_mtrade.exitReason = MT_EXIT_HTF_FLIP;       g_mtrade.exitPrice = nextOpenPx; }
P072:    else if(vDAY)   { g_mtrade.exitReason = MT_EXIT_DAY_CLOSE;  g_mtrade.exitPrice = nextOpenPx; }
P073: 
P074:     PrintFormat("[SRJ-EA] MTEXIT bar=%s reason=%s line=%s lineVal=%s entry=%s exit=%s",
P075:                 TimeToString(barTime, TIME_DATE|TIME_MINUTES),
P076:                 MtExitName(g_mtrade.exitReason),
P077:                 (vBREAK ? breakLineName : "-"),
P078:                 (vBREAK ? DoubleToString(breakLineVal, _Digits) : "-"),
P079:                 DoubleToString(g_mtrade.entryPrice, _Digits),
P080:                 DoubleToString(g_mtrade.exitPrice, _Digits));
P081:     //--- [P-EXITEXEC-1 E7] execution legs: SL/TP broker-owned, HTF stays off,
P082:     //--- CANCEL_BIAS returned above - only the WINNING BREAK/DAY_CLOSE verdict closes.
P083:     //--- Price reference = g_mtrade.exitPrice (= nextOpenPx on the gated legs per EA 11290/11292); paper MTEXIT/MTLIFE/EXIT rows print regardless.
P084:     if(g_mtrade.exitReason == MT_EXIT_POI_BODY_BREAK || g_mtrade.exitReason == MT_EXIT_DAY_CLOSE)
P085:       {
P086:        int mtexecRc = MtCloseBrokerPosition(MtExitName(g_mtrade.exitReason), g_mtrade.exitPrice, barTime);
P087:        if(mtexecRc == 0)
P088:           PrintFormat("[SRJ-EA] MTCLOSE_FAIL bar=%s reason=%s entryTicket=%I64u entryPid=%I64d", TimeToString(barTime, TIME_DATE|TIME_MINUTES), MtExitName(g_mtrade.exitReason), g_mtrade.ticket, g_mtrade.entryPid);
P089:       }
P090:     if(InpDebugLog) MtLifeEmit();
P091:    EmitAlert("EXIT",
P092:              StringFormat("%s%s at %s (entry %s)",
P093:                           MtExitName(g_mtrade.exitReason),
P094:                           (vBREAK ? " [" + breakLineName + "]" : ""),
P095:                           DoubleToString(g_mtrade.exitPrice, _Digits),
P096:                           DoubleToString(g_mtrade.entryPrice, _Digits)),
P097:              true);
P098: ```
P099: 
P100: ## 17 - Source excerpt C (EA lines 10804-10806)
P101: ```mql5
P102:             tradeResult = g_trade.Buy(lots, _Symbol, entryPrice, slRef, tpTarget, comment);
P103:          else
P104:             tradeResult = g_trade.Sell(lots, _Symbol, entryPrice, slRef, tpTarget, comment);
P105: ```
P106: 
P107: ## 18 - Raw run rows
P108: ```text
P109: ID	0	16:41:34.132	Core 04	2026.06.05 09:45:00   market sell 6.74 USDJPY sl: 159.972 tp: 159.900 (159.948 / 159.951)
P110: OF	0	16:41:34.132	Core 04	2026.06.05 09:45:00   deal #4 sell 6.74 USDJPY at 159.948 done (based on order #4)
P111: QO	0	16:42:10.830	Core 04	2026.06.05 12:05:00   [SRJ-EA] UJRETARGET bar=2026.06.05 12:00 dir=SHORT old=159.900 sess=1 tp=159.908 seq=2 admit=2026.06.05 09:40 - session-close retarget (Fix R)
P112: NN	0	16:42:10.830	Core 04	2026.06.05 12:15:00   [SRJ-EA] MTEXIT bar=2026.06.05 12:10 reason=TP_TOUCH line=- lineVal=- entry=159.948 exit=159.908
P113: IH	0	16:42:10.830	Core 04	2026.06.05 12:19:21   take profit triggered #4 sell 6.74 USDJPY 159.948 sl: 159.972 tp: 159.900 [#5 buy 6.74 USDJPY at 159.900]
P114: OJ	0	16:42:10.830	Core 04	2026.06.05 12:19:21   deal #5 buy 6.74 USDJPY at 159.900 done (based on order #5)
P115: HO	0	16:43:11.995	Core 04	2026.06.05 16:05:00   [SRJ-EA] UJPROV bar=2026.06.05 16:00 dir=LONG reseedBar=1970.01.01 00:00 seedBiasAl=0 reseedDir=0 exempt=0 - reseed provenance at S2 edge (Fix CARRY)
P116: QD	0	16:43:11.995	Core 04	2026.06.05 16:05:00   [SRJ-EA] S2SEEDBIAS_KILL bar=2026.06.05 16:00 dir=LONG poi=Daily-POC - seedbias refused, promotion killed (Fix B2)
P117: OD	0	16:35:39.439	Core 04	2026.06.04 11:50:00   [SRJ-EA] 2026.06.04 11:50:00 ABORT reason=SEEDBIAS_REFUSED state=S2_LTF_ALIGN poi=Daily-POC dir=LONG
P118: MO	0	16:43:24.215	Core 04	2026.06.05 16:50:00   [SRJ-EA] RETESTBOOK bar=2026.06.05 16:45 hits=2 Daily-POC:r10:dL Daily-VWAP:r11:dL
P119: FN	0	16:43:24.215	Core 04	2026.06.05 16:55:00   [SRJ-EA] ALERT SRJ SIGNAL LONG USDJPY M5 | Daily-POC | NYAM | R=1.56 SL 159.726 TP 160.723 spr=5
P120: OS	0	16:43:24.215	Core 04	2026.06.05 16:55:00   market buy 0.41 USDJPY sl: 159.726 tp: 160.723 (160.115 / 160.120)
P121: CQ	0	16:43:24.215	Core 04	2026.06.05 16:55:00   deal #6 buy 0.41 USDJPY at 160.120 done (based on order #6)
P122: MS	0	16:44:00.911	Core 04	2026.06.05 19:05:01   [SRJ-EA] UJRETARGET bar=2026.06.05 19:00 dir=LONG old=160.723 sess=2 tp=160.298 seq=3 admit=2026.06.05 16:50 - session-close retarget (Fix R)
P123: GF	0	16:44:07.028	Core 04	2026.06.05 19:20:01   [SRJ-EA] MTEXIT bar=2026.06.05 19:15 reason=TP_TOUCH line=- lineVal=- entry=160.115 exit=160.298
P124: GQ	0	16:44:07.028	Core 04	2026.06.05 19:20:01   [SRJ-EA] MTLIFE fields=11 openBar=2026.06.05 16:55 dir=LONG entry=160.115 sl=159.726 tp=160.298 verdict=TP_TOUCH closeBar=2026.06.05 19:15 closePx=160.298 openAtNewsStart=0 openAtDayClose=0 openAtWeekClose=0
P125: QG	0	17:10:18.795	Core 04	2026.06.11 22:30:51   stop loss triggered #6 buy 0.41 USDJPY 160.120 sl: 159.726 tp: 160.723 [#7 sell 0.41 USDJPY at 159.726]
P126: JG	0	17:10:18.795	Core 04	2026.06.11 22:30:51   deal #7 sell 0.41 USDJPY at 159.725 done (based on order #7)
P127: ```
P128: 
P129: ## 19 - Review answer form
P130: For each question give one verdict line (`Q1: CONFIRM / OBJECT / DISCREPANCY`; `Q2: CONFIRM / OBJECT / DISCREPANCY`), then answer both A and B, cite packet lines, list every additional defect/gap, and state conditions or missing evidence. Review only the pasted packet. No code key or operator strategy ruling is requested.
P131: 
P132: (End of file - total 132 lines)

(End of relay - total 174 lines)
