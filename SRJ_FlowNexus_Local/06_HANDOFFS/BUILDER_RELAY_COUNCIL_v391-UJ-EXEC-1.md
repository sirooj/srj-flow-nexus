# BUILDER RELAY COUNCIL v391-UJ-EXEC-1 - packet P-RECON78-UJ-EXEC-1 v2 (June UJ execution and entry defects)
Status: V391 DRAFT - page-only review. Packet SHA-256 676F25C2C36776DBBEF0BC4F6E4DFDF8E46F5FE03367C60FECFA57DFBF3152A6 / 24719 bytes / 201 physical lines; twin must be exact 201/201, PSEQ P001-P201. Disk execution facts are checked by Luna on the operator machine, not independently by the reviewer seats.
Round status: CONTINUE of the June UJ review (not NEW). V389 was the previous page-only review. V390 was drafted after RECON78 with Q1/Q2 but was not carried to the seats; it omitted the June 11 miss from its questions. This v2/V391 replaces it before transport and adds June 11 as Q3.
Project boundary: SRJ Flow Nexus EA is alert-only; no live trades or funded-money movement. The prior one-run authorization was consumed by RECON78. This relay authorizes no source edit, build, tester run, key request, live activation, commit, or push.
Scope: review the pasted packet as-is and answer Q1 broker-target synchronization, Q2 the June 5 NY 16:15 entry miss, and Q3 the June 11 NY 14:40 LONG arbitration miss. Strategy authority remains the operator's later settled rules. Do not invent rules or treat telemetry as an operator ruling.

## 0. New evidence and decision scope - V391 / packet v2
- RECON78 actually passed its USDJPY M5 simulation over 2026-06-01 00:00 to 2026-06-13 00:00 with 542258 ticks and 2880 bars. It produced three actual positions; only the June 3 LONG and June 5 London SHORT match registered entries. The run's tester PASSED status is not goal acceptance.
- Q1 covers the June 5 NY LONG: modeled retarget to 160.298, internal TP_TOUCH, actual broker TP still 160.723 and actual stop on June 11 at 159.725; June 5 London shows a related model/broker mismatch.
- Q2 covers the registered June 5 NY 16:15 LONG refusal at the 16:05 pass (SEEDBIAS_REFUSED) and separates the later 16:55 trade.
- Q3 covers the registered June 11 NY LONG: at the 14:40:22 pass on evaluated 14:35, LTFFLIP/UJDEFERABORT first log the 5m structure-bias flip against the equal-tier SHORT Daily-POC S4_ARMED holder, but defer the state change; the LONG Daily-POC retest is then logged as SUPPRESSED, and UJDEFERAPPLY/ABORT remove the SHORT afterward. The operator frame is the 14:35 retest+confirmation and 14:40 open entry; 14:45 is post-entry.
- Prior-run cause reconciliation: the register's former RECON63 FRESHCOUNT note is contradicted by the later finding at line 85 (zero freshness involvement); line 123 records the RECON71 VWAP 160.522 / R 0.11 refusal. Both are historical, not RECON78 decision rows.
- Settled rule boundary for Q3: one take per pair per session; same-session contention resolves to one candidate, a non-firing holder expires and never becomes a permanent veto; cross-session setups remain independent. Preserve confirm-once / next-open, POC-over-VWAP same-bar ranking, and the pre-confirmation 5m structure-bias flip kill.

## Q1 - actual broker execution follows closed-session retarget
Q1 verdict: CONFIRM / OBJECT / DISCREPANCY.
Ask A: identify any page defect, missing source path, or safer narrow code mechanism; say whether the diagnosis in packet sections 6-8 follows from the excerpts and actual rows.
Ask B: recommend ordering and a future run predicate proving modeled retarget, accepted broker TP update or close, and actual deal exit at revised target, while preserving SL behavior. Name the code sites and conditions.

## Q2 - June 5 NY 16:15 valid entry miss
Q2 verdict: CONFIRM / OBJECT / DISCREPANCY.
Ask A: evaluate whether the packet supports SEEDBIAS_REFUSED as the immediate refusal and identify the narrowest implementation investigation or correction that preserves pre-confirmation 5m flip kill, confirm-once and next-open entry.
Ask B: state row-level acceptance proving the 16:15 valid take for its own reasons, the June 8 invalid SHORT remains silent, and the later 16:55 trade is not counted as a substitute. Name conditions and code sites.

## Q3 - June 11 NY 14:40 valid LONG suppressed by same-session arbitration
Q3 verdict: CONFIRM / OBJECT / DISCREPANCY.
Ask A: does the source and row sequence support the same-session candidate-arbitration defect against the settled non-firing-holder-expiry rule? Identify any missing downstream proof before claiming that an arbitration correction alone guarantees a fill.
Ask B: recommend the narrowest implementation correction and future acceptance predicate releasing the 14:35 LONG candidate without weakening pre-confirmation 5m flip kill, confirm-once / 14:40 next-open timing, same-bar POC-over-VWAP ranking, or one-take-per-pair-per-session. Require June 11 admission for its own registered reason; June 8 invalid SHORT silent under the 5m flip kill; June 5 London 09:45 correct; 6/9 09:50 never-reseeded keep silent; no post-entry 14:45 evidence. State conditions, unresolved evidence and code sites.

Answer packaging: give one verdict separately for each question, answer A and B, cite packet physical P-lines, list every additional defect/gap, state conditions/missing evidence, and close Q1/Q2/Q3 separately. The packet is the full page; do not ask for files. A Sonnet refusal to state a verdict is NO-VERDICT per the operator's standing direction, never an OBJECT or automatic rejection to build; it also does not supply a second confirmation or itself authorize a build.
Verification split: the reviewer seats judge only the pasted page. Luna owns disk checks of source, packet hash, and actual tester deals. No council opinion grants a key, build/run word, or operator strategy authority.
Operator carry: paste this whole relay identically to Sonnet and GLM and bring both complete replies back verbatim, with each source identified. Do not transport the old V390 file.

## Twin (packet P-RECON78-UJ-EXEC-1 v2, exact mechanical splice from saved bytes; P001-P201)
P001: # PACKET P-RECON78-UJ-EXEC-1 v2 - June UJ broker-target synchronization and remaining valid entry misses
P002: 
P003: Status: v2 DRAFT for page-only review by Sonnet and GLM. This is a CONTINUE of the June UJ review after the completed RECON78-V26-UJ run. No EA edit, build, tester run, live action, or deployment is authorized by this packet. The prior one-run grant has been consumed. Council reviews implementation scope and acceptance; operator strategy rules remain governing.
P004: 
P005: ## 1 - Aim and scope
P006: Diagnose why the June 5 NY USDJPY position remained open to its original broker stop after its internal target was retargeted at the NY session close; why the registered 16:15 LONG was missed while a later 16:55 LONG was executed; and why the registered June 11 NY 14:40 LONG was suppressed behind an equal-tier opposite SHORT whose pending 5m-flip abort was applied after suppression. Propose narrow implementation corrections and future row-level acceptance that preserve actual execution, entry timing, session election, and invalidation rules.
P007: 
P008: ## 2 - Authority and unchanged pins
P009: The audited register is `SRJ_FlowNexus_Local/06_HANDOFFS/BUILDER_REGISTER_VALID_TRADES.md`: UJ valid misses are 5 June London SHORT 09:45, 5 June NY LONG 16:15 with Old high 160.723 (April-30th day high), and 11 June NY LONG 14:40. Its section C lists invalid controls. Later operator rules in `.agents/skills/srj-strategy/SKILL.md` govern: one valid setup per pair per session; same-session contention resolves to one candidate, with a non-firing holder expiring rather than a permanent veto; cross-session trades remain independent; one confirmation then next-open entry; the 5m structure-bias flip kills the potential before confirmation; June 11 is the 14:35 retest+confirmation and 14:40 open entry, with 14:45 post-entry; floating trades may retarget to a closed NY session high; POC supremacy and no own-origin target; alert-only, no live orders.
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
P035: ## 11 - Q3 verdict required: 11 June NY 14:40 valid LONG held behind a non-firing candidate
P036: The 51-line audited register row is 11 June New York USDJPY LONG, Daily-POC anchor, owed at the 14:40 open: `| 3 | 11 June New York USDJPY, entry owed 14:40 open | LONG | Daily-POC (= anchor) [HIS A2 settled] | RECON78: LONG retests at eval bars 14:20/14:25/14:30/14:35 suppressed behind equal-tier opposite SHORT S4_ARMED holder; at pass 14:40:22 (eval 14:35) SHORT then LTF_MISALIGN-aborted | Current proximate blocker is same-session non-firing-holder veto. Prior-row correction: the later RECON63 refutation (BUILDER_FINDING_USDJPY-MISSES.md line 85) says zero freshness involvement; RECON71 later records a distinct VWAP 160.522 / R 0.11 rejection (line 123). Both are prior-run paths, not the RECON78 decision row. HIS rule: 14:35 retest+confirmation, FVG irrelevant post-flip |`. The settled operator frame is 14:35 retest plus confirmation, entry at 14:40 open 160.524; the 14:45 bar is post-entry. The one-take-per-session rule requires same-session contention to resolve to one candidate, with a non-firing holder expiring and never becoming a permanent veto. The 5m structure-bias flip kills a potential before confirmation.
P037: 
P038: In RECON78, the 14:10:00 pass (evaluated 14:05 bar) records a SHORT Daily-POC retest; by the later suppression rows the held state is S4_ARMED. At the 14:25:21 pass, evaluated 14:20, the LONG Daily-POC retest is already reported but is suppressed by the same-tier SHORT holder; the same pattern repeats for evaluated bars 14:25 and 14:30. A shadow-only SHORT poll at evaluated 14:25 says `confirm=1 shadow=true`; it does not establish a live LONG poll or a fired SHORT entry. At the 14:40:22 pass, evaluated 14:35 and owed entry 14:40 open, the LONG is again suppressed with `wouldPreempt=0`, before the SHORT's deferred LTF_MISALIGN abort is applied. The SHORT held-candidate shadow poll is `confirm=0`; it is not evidence about the LONG confirmation. The LONG was not allowed through to its own confirmation/entry path. Cross-run record reconciliation: `BUILDER_FINDING_USDJPY-MISSES.md` (SHA-256 `5079E3A2EF0BDDC51D521E58223B195D50F3B06247611CD59CC9649102A4477E`), line 85 refutes R63 freshness involvement; line 123 records RECON71's earlier VWAP 160.522 / R 0.11 rejection. The earlier register cell repeated the R63 freshness explanation despite that later refutation; the register is corrected. Both are prior-run paths, not RECON78's blocker. The current proximate blocker is the equal-tier same-session suppression described above.
P039: 
P040: Q3 verdict: CONFIRM / OBJECT / DISCREPANCY.
P041: Ask A: Does the source and row sequence support this as a same-session candidate-arbitration defect against the settled non-firing-holder-expiry rule? Identify any missing downstream proof before claiming the arbitration correction alone guarantees a fill.
P042: Ask B: Recommend the narrowest implementation correction and a future acceptance predicate that releases the 14:35 LONG candidate without weakening the pre-confirmation 5m-flip kill, confirm-once / 14:40 next-open timing, POC-over-VWAP same-bar ranking, or one-take-per-pair-per-session. Require evidence that June 11 is admitted at the 14:40 open for the registered reason; June 8 invalid SHORT remains silent under the 5m-flip kill; June 5 London 09:45 remains correct; the 6/9 09:50 never-reseeded keep remains silent; and no post-entry 14:45 evidence is used. State all conditions, unresolved evidence, and code sites. Do not invent a strategy rule.
P043: 
P044: ## 12 - Source excerpt D (EA lines 7904-7913: opposite-direction transfer is bounded to S2, or confirmed-opposite S1)
P045: ```mql5
P046:           if(t78_opp && (g_state == ST_S2_LTF_ALIGN || (g_state == ST_S1_REGIME && t78_opConf && !t78_heldConf)))
P047:             {
P048:              int s1c_fromLine     = g_anchorLine;
P049:              ENUM_SRJ_DIR s1c_fromDir = g_dir;
P050:              g_anchorLine    = t78_pr.topLine;
P051:              ReadBuf1(g_hPoi, t78_pr.topLine, g_anchorPrice, barShift);
P052:              g_anchorBarTime = barTime;
P053:              g_dir           = t78_dir;
P054:              g_zoneHi        = 0.0;
P055:              g_zoneLo        = 0.0;
P056: ```
P057: 
P058: ## 13 - Source excerpt E (EA lines 8033-8042: suppression row is diagnostic, action labels singleton outcome)
P059: ```mql5
P060:          PrintFormat("[SRJ-EA] SUPPRESSED bar=%s poi=%s dir=%s opp=%d higher=%d "
P061:                      "heldPoi=%s heldDir=%s heldState=%s "
P062:                      "cum_n=%d cum_opp=%d cum_hi=%d cum_both=%d action=%s",
P063:                      TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift),
P064:                                   TIME_DATE|TIME_MINUTES),
P065:                      g_lineCode[t73_pr.topLine], DirName(t73_dir),
P066:                      (int)t73_isOpp, (int)t73_isHigh,
P067:                      g_lineCode[g_anchorLine], DirName(g_dir), StateName(g_state),
P068:                      s_t73_n, s_t73_opp, s_t73_higher, s_t73_both,
P069:                      b3_superseded ? "SUPERSEDED" : "HELD");
P070: ```
P071: 
P072: ## 14 - Source excerpt F (EA lines 8462-8469: deferred 5m-misalignment abort applies to the unchanged holder)
P073: ```mql5
P074:        //--- [v20 S-a] deferred-abort application (identity-keyed on anchor+dir+barTime; set in Fix F11 tail).
P075:        if(uj_saAbort)
P076:          {
P077:           if(uj_saA == g_anchorLine && uj_saD == (int)g_dir && uj_saT == g_anchorBarTime)
P078:             {
P079:              if(InpDebugLog) PrintFormat("[SRJ-EA] UJDEFERAPPLY bar=%s dir=%s poi=%s - deferred LTF abort applies, holder unchanged (Fix S-a)", TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES), DirName(g_dir), AnchorStr());
P080:              GoAbort(ABORT_LTF_MISALIGN, g_state);
P081:              return;
P082: ```
P083: 
P084: ## 15 - Raw RECON78 June 11 rows (pass stamp / evaluated bar / owed entry triple)
P085: ```text
P086: OL	0	17:08:10.382	Core 04	2026.06.11 14:10:00   [SRJ-EA] RETESTBOOK bar=2026.06.11 14:05 hits=1 Daily-POC:r10:dS
P087: HM	0	17:08:10.382	Core 04	2026.06.11 14:25:21   [SRJ-EA] SIDE1H_WOULDPREEMPT bar=2026.06.11 14:20 newPoi=Daily-POC newDir=LONG heldPoi=Daily-POC heldDir=SHORT heldState=S4_ARMED newTier=5 heldTier=5 wouldPreempt=0 wouldTierPassLegacy=0
P088: JN	0	17:08:10.382	Core 04	2026.06.11 14:25:21   [SRJ-EA] SUPPRESSED bar=2026.06.11 14:20 poi=Daily-POC dir=LONG opp=1 higher=0 heldPoi=Daily-POC heldDir=SHORT heldState=S4_ARMED cum_n=76 cum_opp=16 cum_hi=7 cum_both=4 action=HELD
P089: FE	0	17:08:16.498	Core 04	2026.06.11 14:30:00   [SRJ-EA] CONFIRMPOLL bar=2026.06.11 14:25 anchor=Daily-POC dir=SHORT oppCandle=1 bodyDir=1 body=1pts doji=0 touchAttr=1 confirm=1 shadow=true
P090: DI	0	17:08:16.498	Core 04	2026.06.11 14:30:00   [SRJ-EA] SIDE1H_WOULDPREEMPT bar=2026.06.11 14:25 newPoi=Daily-POC newDir=LONG heldPoi=Daily-POC heldDir=SHORT heldState=S4_ARMED newTier=5 heldTier=5 wouldPreempt=0 wouldTierPassLegacy=0
P091: HQ	0	17:08:16.498	Core 04	2026.06.11 14:30:00   [SRJ-EA] SUPPRESSED bar=2026.06.11 14:25 poi=Daily-POC dir=LONG opp=1 higher=0 heldPoi=Daily-POC heldDir=SHORT heldState=S4_ARMED cum_n=77 cum_opp=17 cum_hi=7 cum_both=4 action=HELD
P092: RO	0	17:08:16.498	Core 04	2026.06.11 14:35:10   [SRJ-EA] SIDE1H_WOULDPREEMPT bar=2026.06.11 14:30 newPoi=Daily-POC newDir=LONG heldPoi=Daily-POC heldDir=SHORT heldState=S4_ARMED newTier=5 heldTier=5 wouldPreempt=0 wouldTierPassLegacy=0
P093: PP	0	17:08:16.498	Core 04	2026.06.11 14:35:10   [SRJ-EA] SUPPRESSED bar=2026.06.11 14:30 poi=Daily-POC dir=LONG opp=1 higher=0 heldPoi=Daily-POC heldDir=SHORT heldState=S4_ARMED cum_n=78 cum_opp=18 cum_hi=7 cum_both=4 action=HELD
P094: CS	0	17:08:16.498	Core 04	2026.06.11 14:40:22   [SRJ-EA] LTFFLIP bar=2026.06.11 14:35 dir=SHORT poi=Daily-POC state=S4_ARMED - LTF bias turned against the locked direction
P095: QN	0	17:08:16.498	Core 04	2026.06.11 14:40:22   [SRJ-EA] UJDEFERABORT bar=2026.06.11 14:35 dir=SHORT poi=Daily-POC state=S4_ARMED - LTF opposed, abort deferred past evaluation (Fix S-a)
P096: PL	0	17:08:16.498	Core 04	2026.06.11 14:40:22   [SRJ-EA] SIDE1H_WOULDPREEMPT bar=2026.06.11 14:35 newPoi=Daily-POC newDir=LONG heldPoi=Daily-POC heldDir=SHORT heldState=S4_ARMED newTier=5 heldTier=5 wouldPreempt=0 wouldTierPassLegacy=0
P097: RO	0	17:08:16.498	Core 04	2026.06.11 14:40:22   [SRJ-EA] SUPPRESSED bar=2026.06.11 14:35 poi=Daily-POC dir=LONG opp=1 higher=0 heldPoi=Daily-POC heldDir=SHORT heldState=S4_ARMED cum_n=79 cum_opp=19 cum_hi=7 cum_both=4 action=HELD
P098: GL	0	17:08:16.498	Core 04	2026.06.11 14:40:22   [SRJ-EA] RETESTBOOK bar=2026.06.11 14:35 hits=2 Daily-POC:r10:dL Daily-VWAP:r11:dL
P099: CQ	0	17:08:16.498	Core 04	2026.06.11 14:40:22   [SRJ-EA] CONFIRMPOLL bar=2026.06.11 14:35 anchor=Daily-POC dir=SHORT oppCandle=0 bodyDir=0 body=3pts doji=0 touchAttr=1 confirm=0 shadow=true
P100: CQ	0	17:08:16.498	Core 04	2026.06.11 14:40:22   [SRJ-EA] UJDEFERAPPLY bar=2026.06.11 14:35 dir=SHORT poi=Daily-POC - deferred LTF abort applies, holder unchanged (Fix S-a)
P101: JF	0	17:08:16.498	Core 04	2026.06.11 14:40:22   [SRJ-EA] ALERT SRJ STAND-DOWN SHORT USDJPY M5 | Daily-POC | NYAM | reason=LTF_MISALIGN
P102: ```
P103: 
P104: ## 16 - Required cross-checks
P105: Any proposed entry change must preserve 5 June London 09:45 SHORT behavior on the correct confirmation bar, the 8 June 09:25 invalid SHORT negative control, the 6/9 09:50 never-reseeded keep, the June 11 14:35 retest+confirmation / 14:40 open timing, and the separate operator-side 5m-series review. Any proposed exit change must preserve the universal day-close rule and body-break priority, and prove broker deal behavior rather than only MTEXIT/MTLIFE telemetry.
P106: 
P107: ## 17 - Run and scope boundary
P108: No new build/run is requested in this review round. Any subsequent implementation needs a fresh council disposition plus an exact new Luna key and operator run word. No EU run or EU behavior is in scope. Live trading is prohibited.
P109: 
P110: ## 18 - Seat packaging and answer form
P111: Sonnet and GLM are the required seats; Astra/Opus are optional only if the operator chooses. Page-only review. Each reply must contain Q1, Q2, and Q3 verdicts, each Ask A and Ask B, source/page findings, explicit conditions or missing evidence, and a separate close for all three questions. A seat may not convert implementation advice into operator strategy authority.
P112: 
P113: ## 19 - Review split and close
P114: Council decides whether the diagnosis is supported and whether the proposed implementation/acceptance is complete enough for a future bounded packet. Luna independently verifies source lines and actual deal evidence. The operator remains sole authority for strategy meaning, any new run word, and carrying replies between chats. No result in this packet grants a build, run, activation, or deployment.
P115: 
P116: ## 20 - Source excerpt A (EA lines 11912-11923)
P117: ```mql5
P118:     //--- [P-RECON74FIX-2 R] session-close retarget (his RETARGET rule; closed-session values only; instance-contained plus caller-strict-tighter jointly bound the revision to one per trade instance).
P119:     if(g_mtrade.tpRef != EMPTY_VALUE && g_mtrade.tpRef > 0.0)
P120:       {
P121:        double uj_rtPx = 0.0;
P122:        if(UjClosedSessionTarget(g_mtrade, barShift, uj_rtPx) && uj_rtPx > 0.0
P123:           && ((g_mtrade.dir == DIR_LONG && NormalizeDouble(uj_rtPx, _Digits) < NormalizeDouble(g_mtrade.tpRef, _Digits)) || (g_mtrade.dir == DIR_SHORT && NormalizeDouble(uj_rtPx, _Digits) > NormalizeDouble(g_mtrade.tpRef, _Digits))))
P124:          {
P125:           double uj_oldRef = g_mtrade.tpRef;
P126:           g_mtrade.tpRef = uj_rtPx;
P127:           if(InpDebugLog) PrintFormat("[SRJ-EA] UJRETARGET bar=%s dir=%s old=%s sess=%d tp=%s seq=%I64d admit=%s - session-close retarget (Fix R)", TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES), DirName(g_mtrade.dir), DoubleToString(uj_oldRef, _Digits), g_mtrade.sessionAtEntry, DoubleToString(g_mtrade.tpRef, _Digits), (long)g_mtrade.uj_tradeSeq, TimeToString(g_mtrade.uj_admitBarTime, TIME_DATE|TIME_MINUTES));
P128:          }
P129:        else if(InpDebugLog && uj_rtPx > 0.0) PrintFormat("[SRJ-EA] UJNORETARGET bar=%s dir=%s tp=%s rt=%s why=%s sess=%d seq=%I64d admit=%s - helper true but not tighter (Fix R)", TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES), DirName(g_mtrade.dir), DoubleToString(g_mtrade.tpRef, _Digits), DoubleToString(uj_rtPx, _Digits), (NormalizeDouble(uj_rtPx, _Digits) == NormalizeDouble(g_mtrade.tpRef, _Digits) ? "eq" : "loose"), g_mtrade.sessionAtEntry, (long)g_mtrade.uj_tradeSeq, TimeToString(g_mtrade.uj_admitBarTime, TIME_DATE|TIME_MINUTES)); // helper-true discriminator
P130: ```
P131: 
P132: ## 21 - Source excerpt B (EA lines 12036-12068)
P133: ```mql5
P134:    //--- close the trade (the priority order stated in the header)
P135:    g_mtrade.state       = MT_CLOSED;
P136:    g_mtrade.exitBarTime = barTime;
P137:    if(vSL)         { g_mtrade.exitReason = MT_EXIT_SL;             g_mtrade.exitPrice = g_mtrade.slRef; }
P138:     else if(vTP)    { g_mtrade.exitReason = MT_EXIT_TP_TOUCH;       g_mtrade.exitPrice = g_mtrade.tpRef; }
P139:    else if(vBREAK) { g_mtrade.exitReason = MT_EXIT_POI_BODY_BREAK; g_mtrade.exitPrice = nextOpenPx; }
P140:    else if(vHTF)   { g_mtrade.exitReason = MT_EXIT_HTF_FLIP;       g_mtrade.exitPrice = nextOpenPx; }
P141:    else if(vDAY)   { g_mtrade.exitReason = MT_EXIT_DAY_CLOSE;  g_mtrade.exitPrice = nextOpenPx; }
P142: 
P143:     PrintFormat("[SRJ-EA] MTEXIT bar=%s reason=%s line=%s lineVal=%s entry=%s exit=%s",
P144:                 TimeToString(barTime, TIME_DATE|TIME_MINUTES),
P145:                 MtExitName(g_mtrade.exitReason),
P146:                 (vBREAK ? breakLineName : "-"),
P147:                 (vBREAK ? DoubleToString(breakLineVal, _Digits) : "-"),
P148:                 DoubleToString(g_mtrade.entryPrice, _Digits),
P149:                 DoubleToString(g_mtrade.exitPrice, _Digits));
P150:     //--- [P-EXITEXEC-1 E7] execution legs: SL/TP broker-owned, HTF stays off,
P151:     //--- CANCEL_BIAS returned above - only the WINNING BREAK/DAY_CLOSE verdict closes.
P152:     //--- Price reference = g_mtrade.exitPrice (= nextOpenPx on the gated legs per EA 11290/11292); paper MTEXIT/MTLIFE/EXIT rows print regardless.
P153:     if(g_mtrade.exitReason == MT_EXIT_POI_BODY_BREAK || g_mtrade.exitReason == MT_EXIT_DAY_CLOSE)
P154:       {
P155:        int mtexecRc = MtCloseBrokerPosition(MtExitName(g_mtrade.exitReason), g_mtrade.exitPrice, barTime);
P156:        if(mtexecRc == 0)
P157:           PrintFormat("[SRJ-EA] MTCLOSE_FAIL bar=%s reason=%s entryTicket=%I64u entryPid=%I64d", TimeToString(barTime, TIME_DATE|TIME_MINUTES), MtExitName(g_mtrade.exitReason), g_mtrade.ticket, g_mtrade.entryPid);
P158:       }
P159:     if(InpDebugLog) MtLifeEmit();
P160:    EmitAlert("EXIT",
P161:              StringFormat("%s%s at %s (entry %s)",
P162:                           MtExitName(g_mtrade.exitReason),
P163:                           (vBREAK ? " [" + breakLineName + "]" : ""),
P164:                           DoubleToString(g_mtrade.exitPrice, _Digits),
P165:                           DoubleToString(g_mtrade.entryPrice, _Digits)),
P166:              true);
P167: ```
P168: 
P169: ## 22 - Source excerpt C (EA lines 10804-10806)
P170: ```mql5
P171:             tradeResult = g_trade.Buy(lots, _Symbol, entryPrice, slRef, tpTarget, comment);
P172:          else
P173:             tradeResult = g_trade.Sell(lots, _Symbol, entryPrice, slRef, tpTarget, comment);
P174: ```
P175: 
P176: ## 23 - Raw run rows
P177: ```text
P178: ID	0	16:41:34.132	Core 04	2026.06.05 09:45:00   market sell 6.74 USDJPY sl: 159.972 tp: 159.900 (159.948 / 159.951)
P179: OF	0	16:41:34.132	Core 04	2026.06.05 09:45:00   deal #4 sell 6.74 USDJPY at 159.948 done (based on order #4)
P180: QO	0	16:42:10.830	Core 04	2026.06.05 12:05:00   [SRJ-EA] UJRETARGET bar=2026.06.05 12:00 dir=SHORT old=159.900 sess=1 tp=159.908 seq=2 admit=2026.06.05 09:40 - session-close retarget (Fix R)
P181: NN	0	16:42:10.830	Core 04	2026.06.05 12:15:00   [SRJ-EA] MTEXIT bar=2026.06.05 12:10 reason=TP_TOUCH line=- lineVal=- entry=159.948 exit=159.908
P182: IH	0	16:42:10.830	Core 04	2026.06.05 12:19:21   take profit triggered #4 sell 6.74 USDJPY 159.948 sl: 159.972 tp: 159.900 [#5 buy 6.74 USDJPY at 159.900]
P183: OJ	0	16:42:10.830	Core 04	2026.06.05 12:19:21   deal #5 buy 6.74 USDJPY at 159.900 done (based on order #5)
P184: HO	0	16:43:11.995	Core 04	2026.06.05 16:05:00   [SRJ-EA] UJPROV bar=2026.06.05 16:00 dir=LONG reseedBar=1970.01.01 00:00 seedBiasAl=0 reseedDir=0 exempt=0 - reseed provenance at S2 edge (Fix CARRY)
P185: QD	0	16:43:11.995	Core 04	2026.06.05 16:05:00   [SRJ-EA] S2SEEDBIAS_KILL bar=2026.06.05 16:00 dir=LONG poi=Daily-POC - seedbias refused, promotion killed (Fix B2)
P186: OD	0	16:35:39.439	Core 04	2026.06.04 11:50:00   [SRJ-EA] 2026.06.04 11:50:00 ABORT reason=SEEDBIAS_REFUSED state=S2_LTF_ALIGN poi=Daily-POC dir=LONG
P187: MO	0	16:43:24.215	Core 04	2026.06.05 16:50:00   [SRJ-EA] RETESTBOOK bar=2026.06.05 16:45 hits=2 Daily-POC:r10:dL Daily-VWAP:r11:dL
P188: FN	0	16:43:24.215	Core 04	2026.06.05 16:55:00   [SRJ-EA] ALERT SRJ SIGNAL LONG USDJPY M5 | Daily-POC | NYAM | R=1.56 SL 159.726 TP 160.723 spr=5
P189: OS	0	16:43:24.215	Core 04	2026.06.05 16:55:00   market buy 0.41 USDJPY sl: 159.726 tp: 160.723 (160.115 / 160.120)
P190: CQ	0	16:43:24.215	Core 04	2026.06.05 16:55:00   deal #6 buy 0.41 USDJPY at 160.120 done (based on order #6)
P191: MS	0	16:44:00.911	Core 04	2026.06.05 19:05:01   [SRJ-EA] UJRETARGET bar=2026.06.05 19:00 dir=LONG old=160.723 sess=2 tp=160.298 seq=3 admit=2026.06.05 16:50 - session-close retarget (Fix R)
P192: GF	0	16:44:07.028	Core 04	2026.06.05 19:20:01   [SRJ-EA] MTEXIT bar=2026.06.05 19:15 reason=TP_TOUCH line=- lineVal=- entry=160.115 exit=160.298
P193: GQ	0	16:44:07.028	Core 04	2026.06.05 19:20:01   [SRJ-EA] MTLIFE fields=11 openBar=2026.06.05 16:55 dir=LONG entry=160.115 sl=159.726 tp=160.298 verdict=TP_TOUCH closeBar=2026.06.05 19:15 closePx=160.298 openAtNewsStart=0 openAtDayClose=0 openAtWeekClose=0
P194: QG	0	17:10:18.795	Core 04	2026.06.11 22:30:51   stop loss triggered #6 buy 0.41 USDJPY 160.120 sl: 159.726 tp: 160.723 [#7 sell 0.41 USDJPY at 159.726]
P195: JG	0	17:10:18.795	Core 04	2026.06.11 22:30:51   deal #7 sell 0.41 USDJPY at 159.725 done (based on order #7)
P196: ```
P197: 
P198: ## 24 - Review answer form
P199: For each question give one verdict line (`Q1: CONFIRM / OBJECT / DISCREPANCY`; `Q2: CONFIRM / OBJECT / DISCREPANCY`; `Q3: CONFIRM / OBJECT / DISCREPANCY`), then answer both A and B, cite packet lines, list every additional defect/gap, and state conditions or missing evidence. Review only the pasted packet. No code key or operator strategy ruling is requested.
P200: 
P201: (End of file - total 132 lines)
