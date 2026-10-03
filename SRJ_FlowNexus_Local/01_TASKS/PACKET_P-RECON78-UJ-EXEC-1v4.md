P001: # PACKET P-RECON78-UJ-EXEC-1 v4 - June UJ implementation round 2 (self-contained)
P002: 
P003: Status: v4 DRAFT for implementation review by Sonnet and GLM. CONTINUE of the June UJ review after V392 (Q1 1-2 DISCREPANCY, Q2 3-0 CONFIRM, Q3 1-2 DISCREPANCY with form-b settled 3-0). No EA edit, build, tester run, live action, or deployment is authorized by this packet. The prior one-run grant stays consumed. Council rules implementation scope and acceptance; his settled rules govern (spec Part A v4.2 as amended by his later words, consulted before every grade and relay question).
P004: 
P005: ## 1 - What v3 got wrong and what v4 does
P006: 
P007: V3 was held for page defects the builder owns: E6-E8 referenced but never defined or exhibited; the retarget branch, the 0x census, and the June-11 rows asserted but not spliced; one stale cite; mixed line endings; one undefined tolerance. Every V392 seat catch verified true on disk except GLM DEF1 (SEG 13693 reads bar=16:00 on raw bytes, no anomaly) and the exhibit header counts (headers named code lines; fence and prose lines are labeled separately below). V4 splices every cited range whole from the EA E80FF0C2 tree with version labels, LF-normalizes all splices with a trailing-CR census beside the battery, re-resolves every cite post-numbering, and carries exact-equality acceptance throughout per his EXACT-PRICE-NO-LENIENCY rule (entry at the open, exit at the exact target, zero leniency; spread and lag deviations diagnosed, never tolerated). His O2/O3/O4/O5 are answered or withdrawn; O1/O6 go to council with builder recommendations; O7 is settled by his word (flip-killed holder never vetoes) and rides as a settled pin, not a question.
P008: 
P009: ## 2 - Q1 spec: UjSyncBrokerTp at the retarget branch
P010: 
P011: Diagnosis (exhibited): the retarget branch EA 11912-11923 revises only `g_mtrade.tpRef` (assignment EA 11920); entry sends the original tpTarget (EA 10804-10806); the MTEXIT leg EA 12036-12068 closes the broker position only for body-break and day-close (EA 12055-12060) while TP_TOUCH takes the model price with no broker call; MtCloseBrokerPosition is a market PositionClose with retcode/deal accounting (EA 11815-11818, EA 11826-11830), so reusing it for the TP leg would convert a resting broker TP into a market fill and is rejected. Census: PositionModify 0x by two patterns, CTrade object 1x (EA 13) - the leg is absent, not broken.
P012: Helper: select by POSITION_IDENTIFIER == entryPid plus symbol plus magic; pass the position's own ticket to PositionModify with the live SL carried exact and NormalizeDouble to _Digits on both sides. Siting: call immediately after the EA 11920 assignment on retarget bars, plus a per-bar retry guard hosted in the per-bar managed-trade evaluator (EA 11843-11849 region) while the position stays open with unchanged tpRef and broker TP still differs. Prints, never silent: UJTPMODIFY (bar/ticket/old/new/sl/rc) on success with exactly one success per retargeted instance and idempotent skips after; UJTPMODIFY_FAIL with retcode classified transient (retry while conditions hold) vs permanent INVALID_STOPS (terminal, position tracked by the orphan print); UJTPMODIFY_NOPOS when no open position. NOPOS and FAIL counts are stated or explained in every grade.
P013: Orphan rule: reconciliation-print adopted 2v1 (Sonnet + GLM; Luna's hold parked with gating exhibits: state-reader census plus account-mode exhibit). UJORPHAN row format: bar entryPid modelState modelExit brokerOpen brokerTp brokerSl, at each model close plus each day rollover plus a run-end total; categories are armed-unowned (resting broker TP/SL attached, reported benign) vs true orphans (no broker exit order, counted), plus a vanish count of broker-side closes with no model exit row. Acceptance grades true orphans zero.
P014: O1 to council (recommendation: FAIL-row plus orphan print with the position held to its broker exit; market-close parked because it needs his word under alert-only): if price already crossed the revised level when the retarget computes, what is the bounded post-reject action? O6 to council (recommendation: the broker-confirmed exit ends one-at-a-time; model rows stay provisional until broker confirms): when model exit and broker exit diverge, which one ends the trade?
P015: Acceptance, exact throughout: UJRETARGET rows unchanged; same-bar UJTPMODIFY success; tester modify event from the journal operations log (condition: Luna confirms the tester build logs modify operations with old/new TP and SL, else items depending on it are ungradeable); actual TP-trigger deal AT the revised level exact (160.298 / 159.908); no later-day stop for that position; SL taken from the modify-event SL field, byte-unchanged (159.726 / 159.972); old in the row equals the prior broker TP; zero modify rows on UJNORETARGET trades; London modify row expected (159.900 to 159.908, entry-only acceptance); no PositionModify call site other than the helper.
P016: 
P017: ## 3 - Q2: closed as correct behavior, no code edit in any form
P018: 
P019: O3 answered by his word (5m flipped bullish at the 16:50 candle open): seedBiasAl=0 at 16:00 was rule-correct, so the 16:05 SEEDBIAS_REFUSED was correct behavior, never a defect. No provenance-spec change follows. Exhibits re-spliced whole: B2 gate EA 8414-8421; H1 full span EA 7877-7901 (closes the elision: the reseed print EA 7880 fires only on opposite-retest over an unconfirmed holder per EA 7877, and the write EA 7900-7901 sits in the same branch); S-a set EA 7450-7456 and apply EA 8462-8476; RGATE writer EA 10437-10448 (seedBT is g_anchorBarTime at EA 10448, an S1 seed-bias bar time, not the H1 write - so the zero-June-5 UJRESEED census stands uncontradicted). Row battery: the 16:05 triple (UJPROV epoch, KILL, ABORT at SEG 13692-13694), the 16:50 RGATE Al=1 row (SEG 14043), the 6/9 twin-tuple kill pair (SEG 16535, SEG 16566), the 6/4 wrong-direction pair (SEG 10762-10763). Census: UJRESEED 10 run-wide, 0 on June 5.
P020: Register: R1 rewords the MISSED header (pure evidence, applies on his word now); R2 annotates without erasing (R63 text kept, RECON78 16:05 chain appended); R3 waits Q1. Application of R1/R2 needs his explicit word (memo asks it); nothing applies on council clearance alone.
P021: 
P022: ## 4 - Q3: form (b) at EA 7841 with his backing, veto correction owned
P023: 
P024: Correction owned: v3 overstated the recorder. The NAME wouldPreempt occurs once in the tree (EA 7834, recorder-only print); the 7841 value is a positional state test. The operative veto is the transfer state-gate EA 7904-7913 (opposite transfer bounded to S2_LTF_ALIGN or confirmed-opposite S1_REGIME) plus the suppression branch: an S4_ARMED holder can neither transfer nor be preempted on the existing path, so the challenger is suppressed. O7 settled by his word (FLIP-KILLED-NEVER-VETOES, constrained by LIVE-TRADE-BLOCKS-ALL: release governs candidate contention with no live position; a live same-session position blocks everything): a flip-killed holder never vetoes; form (b) has his backing and rides as settled, council notes.
P025: Form (b) implementation: the EA 7841 eligibility computation additionally requires no pending identity-matched deferred abort (identity test EA 8465); the recorder row then shows the suppressed veto and the fix is row-gradeable. S-a set/apply/clear machinery untouched (EA 7450-7456, EA 8462-8476, clear EA 8475); on a same-pass transfer the identity check at EA 8465 fails so the row family is UJDEFERDROP (EA 8471-8474), named in the predicate. New print row: UJPREEMPT_DYINGHOLDER with bar/holder/challenger/abort-identity. Control-flow census between the S-a set and the apply site spliced whole below (code sites only; comment mentions of return excluded with reason; EA 8391 HOLDER_EXPIRED is a separate expiry path, not this case).
P026: Tiered acceptance. Admission tier (reorder verified with or without a take): 14:20-14:30 rows identical; SHORT abort family present with the APPLY-vs-DROP family named per case; SHORT never enters; LONG gate rows present including its own UJPROV with provenance satisfied; branch rule: admitted-then-S2SEEDBIAS_KILL means reorder verified, Q2-limited (not a reorder failure). Outcome tier: live LONG CONFIRMPOLL confirm=1 shadow=false; ALERT plus market-buy deal AT the 14:40 open exact 160.524; exactly one June-11 NYAM take. Register reason defined row-gradeably: Daily-POC anchor LONG (anchor plus direction plus session match). No-14:45 rule: absent families named (no later admission, veto, or abort rows for this instance). 6/8 yield-event count required (form b touches the flip-kill class). Candidate lifetime stays open; the run resolves it (per-pass re-detection evidenced by the 14:40 WOULDPREEMPT re-detection row). Downstream gates (provenance, R/spread) apply to the released LONG afterwards.
P027: 
P028: ## 5 - Source exhibits (byte-exact LF-normalized splices from EA E80FF0C2, read 2026-10-02)
P029: 
P030: Retarget branch EA 11912-11923 (insert after EA 11920):
P031: ```mql5
P032:     //--- [P-RECON74FIX-2 R] session-close retarget (his RETARGET rule; closed-session values only; instance-contained plus caller-strict-tighter jointly bound the revision to one per trade instance).
P033:     if(g_mtrade.tpRef != EMPTY_VALUE && g_mtrade.tpRef > 0.0)
P034:       {
P035:        double uj_rtPx = 0.0;
P036:        if(UjClosedSessionTarget(g_mtrade, barShift, uj_rtPx) && uj_rtPx > 0.0
P037:           && ((g_mtrade.dir == DIR_LONG && NormalizeDouble(uj_rtPx, _Digits) < NormalizeDouble(g_mtrade.tpRef, _Digits)) || (g_mtrade.dir == DIR_SHORT && NormalizeDouble(uj_rtPx, _Digits) > NormalizeDouble(g_mtrade.tpRef, _Digits))))
P038:          {
P039:           double uj_oldRef = g_mtrade.tpRef;
P040:           g_mtrade.tpRef = uj_rtPx;
P041:           if(InpDebugLog) PrintFormat("[SRJ-EA] UJRETARGET bar=%s dir=%s old=%s sess=%d tp=%s seq=%I64d admit=%s - session-close retarget (Fix R)", TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES), DirName(g_mtrade.dir), DoubleToString(uj_oldRef, _Digits), g_mtrade.sessionAtEntry, DoubleToString(g_mtrade.tpRef, _Digits), (long)g_mtrade.uj_tradeSeq, TimeToString(g_mtrade.uj_admitBarTime, TIME_DATE|TIME_MINUTES));
P042:          }
P043:        else if(InpDebugLog && uj_rtPx > 0.0) PrintFormat("[SRJ-EA] UJNORETARGET bar=%s dir=%s tp=%s rt=%s why=%s sess=%d seq=%I64d admit=%s - helper true but not tighter (Fix R)", TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES), DirName(g_mtrade.dir), DoubleToString(g_mtrade.tpRef, _Digits), DoubleToString(uj_rtPx, _Digits), (NormalizeDouble(uj_rtPx, _Digits) == NormalizeDouble(g_mtrade.tpRef, _Digits) ? "eq" : "loose"), g_mtrade.sessionAtEntry, (long)g_mtrade.uj_tradeSeq, TimeToString(g_mtrade.uj_admitBarTime, TIME_DATE|TIME_MINUTES)); // helper-true discriminator
P044: ```
P045: Entry send EA 10804-10806 (original tpTarget):
P046: ```mql5
P047:             tradeResult = g_trade.Buy(lots, _Symbol, entryPrice, slRef, tpTarget, comment);
P048:          else
P049:             tradeResult = g_trade.Sell(lots, _Symbol, entryPrice, slRef, tpTarget, comment);
P050: ```
P051: MTEXIT leg EA 12036-12068 (broker close gated to break/day-close at EA 12055-12060):
P052: ```mql5
P053:    //--- close the trade (the priority order stated in the header)
P054:    g_mtrade.state       = MT_CLOSED;
P055:    g_mtrade.exitBarTime = barTime;
P056:    if(vSL)         { g_mtrade.exitReason = MT_EXIT_SL;             g_mtrade.exitPrice = g_mtrade.slRef; }
P057:     else if(vTP)    { g_mtrade.exitReason = MT_EXIT_TP_TOUCH;       g_mtrade.exitPrice = g_mtrade.tpRef; }
P058:    else if(vBREAK) { g_mtrade.exitReason = MT_EXIT_POI_BODY_BREAK; g_mtrade.exitPrice = nextOpenPx; }
P059:    else if(vHTF)   { g_mtrade.exitReason = MT_EXIT_HTF_FLIP;       g_mtrade.exitPrice = nextOpenPx; }
P060:    else if(vDAY)   { g_mtrade.exitReason = MT_EXIT_DAY_CLOSE;  g_mtrade.exitPrice = nextOpenPx; }
P061: 
P062:     PrintFormat("[SRJ-EA] MTEXIT bar=%s reason=%s line=%s lineVal=%s entry=%s exit=%s",
P063:                 TimeToString(barTime, TIME_DATE|TIME_MINUTES),
P064:                 MtExitName(g_mtrade.exitReason),
P065:                 (vBREAK ? breakLineName : "-"),
P066:                 (vBREAK ? DoubleToString(breakLineVal, _Digits) : "-"),
P067:                 DoubleToString(g_mtrade.entryPrice, _Digits),
P068:                 DoubleToString(g_mtrade.exitPrice, _Digits));
P069:     //--- [P-EXITEXEC-1 E7] execution legs: SL/TP broker-owned, HTF stays off,
P070:     //--- CANCEL_BIAS returned above - only the WINNING BREAK/DAY_CLOSE verdict closes.
P071:     //--- Price reference = g_mtrade.exitPrice (= nextOpenPx on the gated legs per EA 11290/11292); paper MTEXIT/MTLIFE/EXIT rows print regardless.
P072:     if(g_mtrade.exitReason == MT_EXIT_POI_BODY_BREAK || g_mtrade.exitReason == MT_EXIT_DAY_CLOSE)
P073:       {
P074:        int mtexecRc = MtCloseBrokerPosition(MtExitName(g_mtrade.exitReason), g_mtrade.exitPrice, barTime);
P075:        if(mtexecRc == 0)
P076:           PrintFormat("[SRJ-EA] MTCLOSE_FAIL bar=%s reason=%s entryTicket=%I64u entryPid=%I64d", TimeToString(barTime, TIME_DATE|TIME_MINUTES), MtExitName(g_mtrade.exitReason), g_mtrade.ticket, g_mtrade.entryPid);
P077:       }
P078:     if(InpDebugLog) MtLifeEmit();
P079:    EmitAlert("EXIT",
P080:              StringFormat("%s%s at %s (entry %s)",
P081:                           MtExitName(g_mtrade.exitReason),
P082:                           (vBREAK ? " [" + breakLineName + "]" : ""),
P083:                           DoubleToString(g_mtrade.exitPrice, _Digits),
P084:                           DoubleToString(g_mtrade.entryPrice, _Digits)),
P085:              true);
P086: ```
P087: Market-close mechanism EA 11815-11818 plus accounting EA 11826-11830:
P088: ```mql5
P089:    g_trade.SetTypeFilling(GetCorrectFillingMode(_Symbol));
P090:    bool ok = g_trade.PositionClose(ticket);
P091:    long closerc = g_trade.ResultRetcode();
P092:    ulong closedeal = g_trade.ResultDeal();
P093: ```
P094: ```mql5
P095:    PrintFormat("[SRJ-EA] MTCLOSE bar=%s leg=%s ticket=%I64u magic=%I64d action=%d retcode=%d deal=%I64u closepid=%I64d closeentry=%d entryPid=%I64d flat=%d ref=%s",
P096:                TimeToString(barTime, TIME_DATE|TIME_MINUTES), leg, ticket, pmagic,
P097:                (int)ok, (int)closerc, closedeal, closepid, closeentry, entryPid, (MtPidToTicket(entryPid) == 0 ? 1 : 0),
P098:                DoubleToString(refPx, _Digits));
P099:    if(!(ok && closerc == TRADE_RETCODE_DONE && closepid == entryPid && closeentry == DEAL_ENTRY_OUT)) return 0;
P100: ```
P101: CTrade object EA 13:
P102: ```mql5
P103: CTrade g_trade;
P104: ```
P105: Per-bar retry host EA 11843-11849:
P106: ```mql5
P107: void EvaluateManagedTrade(const int barShift)
P108:   {
P109:    if(!g_mtrade.active) return;
P110:    if(g_mtrade.state != MT_MANAGING && g_mtrade.state != MT_PENDING_FILL) return;
P111: 
P112:    datetime barTime = iTime(_Symbol, PERIOD_CURRENT, barShift);
P113:    if(barTime < g_mtrade.fillBarTime) return;   // bars predating the fill are not ours
P114: ```
P115: B2 gate EA 8414-8421:
P116: ```mql5
P117:          if(InpDebugLog) PrintFormat("[SRJ-EA] UJPROV bar=%s dir=%s reseedBar=%s seedBiasAl=%d reseedDir=%d exempt=%d - reseed provenance at S2 edge (Fix CARRY)", TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES), DirName(g_dir), TimeToString(g_ujOpReseedBarTime, TIME_DATE|TIME_MINUTES), s1g_seedBiasAl, g_ujOpReseedDir, ((uj_m15r && uj_m15b == uj_wantb && (s1g_seedBiasAl != 0 || (g_ujOpReseedBarTime != 0 && g_ujOpReseedDir != 0 && g_ujOpReseedDir == (g_dir == DIR_LONG ? 1 : (g_dir == DIR_SHORT ? -1 : 0))))) ? 1 : 0));
P118:          if(uj_m15r && uj_m15b == uj_wantb && (s1g_seedBiasAl != 0 || (g_ujOpReseedBarTime != 0 && g_ujOpReseedDir != 0 && g_ujOpReseedDir == (g_dir == DIR_LONG ? 1 : (g_dir == DIR_SHORT ? -1 : 0)))))
P119:            { double uj_ltfb = 0.0; int uj_ltfOk = ReadFlow(FL_BUF_LTF_BIAS, uj_ltfb, barShift) ? 1 : 0;
P120:              int uj_m15s = (int)iTime(_Symbol, PERIOD_CURRENT, barShift);
P121:              datetime uj_m15src = (datetime)(uj_m15s - uj_m15s % 900);
P122:              if(InpDebugLog) PrintFormat("[SRJ-EA] S2PROMOTE_M15 bar=%s dir=%s poi=%s sess=%s m15=%s m15src=%s ltf=%s sb=%d rf=%d/%d", TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES), DirName(g_dir), AnchorStr(), SessionName(g_sessionAtEntry), DoubleToString(uj_m15b, 1), TimeToString(uj_m15src, TIME_DATE|TIME_MINUTES), UjDbl(uj_ltfb), s1g_seedBiasAl, (uj_m15r ? 1 : 0), uj_ltfOk); }
P123:          else if(uj_m15r && uj_m15b == uj_wantb)
P124:            { if(InpDebugLog) PrintFormat("[SRJ-EA] S2SEEDBIAS_KILL bar=%s dir=%s poi=%s - seedbias refused, promotion killed (Fix B2)", TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES), DirName(g_dir), AnchorStr()); GoAbort(ABORT_SEEDBIAS_REFUSED, g_state); return; }
P125: ```
P126: H1 full span EA 7877-7901:
P127: ```mql5
P128:               if(!t78_opConf && !t78_heldConf && !SessionAlreadyUsed(sess, barTime) && (t78_pr.topLine != g_anchorLine || t78_dir != g_dir))
P129:                 {
P130:                  bool t78_al = false; bool t78_alOk = CheckLtfAlign(barShift, t78_dir, t78_al);
P131:                  if(InpDebugLog) PrintFormat("[SRJ-EA] UJRESEED bar=%s poi=%s dir=%s fromPoi=%s fromDir=%s al=%d ok=%d - op-retest reseeded over unconfirmed holder (Fix H1)", TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES), g_lineCode[t78_pr.topLine], DirName(t78_dir), g_lineCode[g_anchorLine], DirName(g_dir), (t78_alOk ? (t78_al ? 1 : 0) : -1), (int)t78_alOk);
P132:                  s1g_legDir = t78_pr.isLong ? 1 : -1;
P133:                  s1g_seedBiasAl = (!t78_alOk ? -1 : (t78_al ? 1 : 0));
P134:                  g_anchorLine = t78_pr.topLine;
P135:                  ReadBuf1(g_hPoi, t78_pr.topLine, g_anchorPrice, barShift);
P136:                  g_anchorBarTime = barTime;
P137:                  g_dir = S2ResolveLive(t78_pr.isLong ? DIR_LONG : DIR_SHORT);
P138:                  g_sessionAtEntry = sess;
P139:                  g_zoneHi = 0.0;
P140:                  g_zoneLo = 0.0;
P141:                  g_touchSeen = false;
P142:                  g_touchBarHi = 0.0;
P143:                  g_touchBarLo = 0.0;
P144:                  g_latchedEntry = 0.0;
P145:                  g_latchedSl = 0.0;
P146:                  g_latchedTp = 0.0;
P147:                  g_latchedR = 0.0;
P148:                  g_latchBarTime = 0;
P149:                  g_confirmFromState = ST_IDLE;
P150:                  uj_memo_valid = false;
P151:                  g_ujOpReseedBarTime = barTime;
P152:                  g_ujOpReseedDir = (g_dir == DIR_LONG ? 1 : (g_dir == DIR_SHORT ? -1 : 0));
P153: ```
P154: S-a set EA 7450-7456 and apply/drop/clear EA 8462-8476:
P155: ```mql5
P156:           if((uj_hm15r && uj_hm15 == uj_hwant) || uj_hcarve)
P157:             { if(InpDebugLog) PrintFormat("[SRJ-EA] UJLTFHOLD bar=%s dir=%s poi=%s state=%s m15=%s rf=%d mode=%s term=%s - LTF opposed, hold (Fix F11)", TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES), DirName(g_dir), AnchorStr(), StateName(g_state), DoubleToString(uj_hm15, 1), (uj_hm15r ? 1 : 0), ((uj_hm15r && uj_hm15 == uj_hwant) ? "M15" : "CARVE"), uj_hterm); }
P158:           else
P159:             {
P160:              uj_saAbort = true; uj_saA = g_anchorLine; uj_saD = (int)g_dir; uj_saT = g_anchorBarTime;
P161:              if(InpDebugLog) PrintFormat("[SRJ-EA] UJDEFERABORT bar=%s dir=%s poi=%s state=%s - LTF opposed, abort deferred past evaluation (Fix S-a)", TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES), DirName(g_dir), AnchorStr(), StateName(g_state));
P162:             }
P163: ```
P164: ```mql5
P165:        //--- [v20 S-a] deferred-abort application (identity-keyed on anchor+dir+barTime; set in Fix F11 tail).
P166:        if(uj_saAbort)
P167:          {
P168:           if(uj_saA == g_anchorLine && uj_saD == (int)g_dir && uj_saT == g_anchorBarTime)
P169:             {
P170:              if(InpDebugLog) PrintFormat("[SRJ-EA] UJDEFERAPPLY bar=%s dir=%s poi=%s - deferred LTF abort applies, holder unchanged (Fix S-a)", TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES), DirName(g_dir), AnchorStr());
P171:              GoAbort(ABORT_LTF_MISALIGN, g_state);
P172:              return;
P173:             }
P174:           else
P175:             {
P176:              if(InpDebugLog) PrintFormat("[SRJ-EA] UJDEFERDROP bar=%s dir=%s poi=%s - deferred LTF abort dropped, holder changed (Fix S-a)", TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES), DirName(g_dir), AnchorStr());
P177:             }
P178:           uj_saAbort = false;
P179:          }
P180: ```
P181: RGATE writer EA 10437-10448 (seedBT is g_anchorBarTime; the stage comment line directly above the span is excluded for a non-ASCII section sign):
P182: ```mql5
P183:           //--- print-only). Links seed to eval in ONE row: seed barTime (g_anchorBarTime,
P184:           //--- set at seed) + seed bias (s1g_seedBiasAl, carried at seed) + eval-bar R
P185:           //--- (same rLive/livePass exprs as SIDE1O) + live stop. Reuses stamps only;
P186:           //--- no new computation, no state/dir/latch/order/stop/N1 write. Seed-close
P187:           //--- sampling note: both seed fields are close-sampled (ADD1); the link row
P188:           //--- carries seedBT + evalBar so grade verifies linkage without assuming.
P189:           if(InpDebugLog)
P190:             {
P191:              PrintFormat("[SRJ-EA] SIDE1R_RGATE evalBar=%s seedBT=%s dir=%s seedBiasAl=%d rLive=%.2f livePass=%d slRef=%s",
P192:                          TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift),
P193:                                       TIME_DATE|TIME_MINUTES),
P194:                          TimeToString(g_anchorBarTime, TIME_DATE|TIME_MINUTES),
P195: ```
P196: Preemption recorder EA 7830-7842 (wouldPreempt positional state test at EA 7841):
P197: ```mql5
P198:           if(InpDebugLog && t78_opp)
P199:             {
P200:              int s1h_newTier  = g_authorityRank[t78_pr.topLine] / 2;
P201:              int s1h_heldTier = g_authorityRank[g_anchorLine]   / 2;
P202:              PrintFormat("[SRJ-EA] SIDE1H_WOULDPREEMPT bar=%s newPoi=%s newDir=%s heldPoi=%s heldDir=%s heldState=%s newTier=%d heldTier=%d wouldPreempt=%d wouldTierPassLegacy=%d",
P203:                          TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift),
P204:                                       TIME_DATE|TIME_MINUTES),
P205:                          g_lineCode[t78_pr.topLine], DirName(t78_dir),
P206:                          g_lineCode[g_anchorLine], DirName(g_dir),
P207:                          StateName(g_state),
P208:                          s1h_newTier, s1h_heldTier,
P209:                          ((g_state == ST_S2_LTF_ALIGN) ? 1 : 0),
P210:                          (t78_tier ? 1 : 0));
P211: ```
P212: Transfer state-gate EA 7904-7913 (operative veto bound):
P213: ```mql5
P214:           if(t78_opp && (g_state == ST_S2_LTF_ALIGN || (g_state == ST_S1_REGIME && t78_opConf && !t78_heldConf)))
P215:             {
P216:              int s1c_fromLine     = g_anchorLine;
P217:              ENUM_SRJ_DIR s1c_fromDir = g_dir;
P218:              g_anchorLine    = t78_pr.topLine;
P219:              ReadBuf1(g_hPoi, t78_pr.topLine, g_anchorPrice, barShift);
P220:              g_anchorBarTime = barTime;
P221:              g_dir           = t78_dir;
P222:              g_zoneHi        = 0.0;
P223:              g_zoneLo        = 0.0;
P224: ```
P225: Symmetric session extreme EA 1920-1924:
P226: ```mql5
P227:        if(uj_newest == 0) { uj_newest = bk; uj_oldest = bk; }
P228:        else uj_oldest = bk;
P229:        double v = (t.dir == DIR_LONG) ? iHigh(_Symbol, PERIOD_CURRENT, k) : iLow(_Symbol, PERIOD_CURRENT, k);
P230:        if(v <= 0.0) continue;
P231:        if(!have || (t.dir == DIR_LONG && v > ext) || (t.dir == DIR_SHORT && v < ext)) { ext = v; have = true; }
P232: ```
P233: Control-flow census EA 7456-8462 (code return sites, whole lines):
P234: ```mql5
P235:          GoAbort(fail, g_state); return;
P236:       if(fail != "") { GoAbort(fail, g_state); return; }
P237:          GoAbort(ABORT_NO_TP_TARGET, g_state); return;
P238:          return;
P239:        if(!inWindow) { if(InpDebugLog && TimeToString(barTime, TIME_MINUTES) == "17:00") PrintFormat("[SRJ-EA] SEEDDIAG bar=%s branch=WINDOW inWin=0 sess=%s retestFound=%d", TimeToString(barTime, TIME_DATE|TIME_MINUTES), SessionName(sess), -1); return; }
P240:          return;
P241:         if(!DetectPoiRetest(barShift, pr) || !pr.found) { if(InpDebugLog && TimeToString(barTime, TIME_MINUTES) == "17:00") PrintFormat("[SRJ-EA] SEEDDIAG bar=%s branch=RETEST inWin=1 sess=%s retestFound=%d", TimeToString(barTime, TIME_DATE|TIME_MINUTES), SessionName(sess), (pr.found ? 1 : 0)); return; }
P242:            return;
P243:            return;
P244:          GoAbort(ABORT_HOLDER_EXPIRED, g_state); return;
P245:         { GoAbort(ABORT_UPSTREAM_UNREADY, g_state); return; }
P246:         { if(InpDebugLog) PrintFormat("[SRJ-EA] S1WAIT bar=%s dir=%s poi=%s sess=%s - regime unclassified, candidate RETAINED (Stage 3a)", TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES), DirName(g_dir), AnchorStr(), SessionName(g_sessionAtEntry)); return; }
P247:         { GoAbort(ABORT_UPSTREAM_UNREADY, g_state); return; }
P248:            { if(InpDebugLog) PrintFormat("[SRJ-EA] S2SEEDBIAS_KILL bar=%s dir=%s poi=%s - seedbias refused, promotion killed (Fix B2)", TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES), DirName(g_dir), AnchorStr()); GoAbort(ABORT_SEEDBIAS_REFUSED, g_state); return; }
P249:            { if(InpDebugLog) PrintFormat("[SRJ-EA] S2WAIT bar=%s dir=%s poi=%s sess=%s - LTF bias unaligned, candidate RETAINED (Stage 3a)", TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES), DirName(g_dir), AnchorStr(), SessionName(g_sessionAtEntry)); return; }
P250:              GoAbort(ABORT_LTF_MISALIGN, g_state);
P251:              return;
P252: ```
P253: 
P254: ## 6 - Row batteries (mechanical splices from the archived journal, SEG is the 1-indexed journal line)
P255: 
P256: Q2 provenance rows:
P257: SEG 13692 HO	0	16:43:11.995	Core 04	2026.06.05 16:05:00   [SRJ-EA] UJPROV bar=2026.06.05 16:00 dir=LONG reseedBar=1970.01.01 00:00 seedBiasAl=0 reseedDir=0 exempt=0 - reseed provenance at S2 edge (Fix CARRY)
P258: SEG 13693 QD	0	16:43:11.995	Core 04	2026.06.05 16:05:00   [SRJ-EA] S2SEEDBIAS_KILL bar=2026.06.05 16:00 dir=LONG poi=Daily-POC - seedbias refused, promotion killed (Fix B2)
P259: SEG 13694 GP	0	16:43:11.995	Core 04	2026.06.05 16:05:00   [SRJ-EA] 2026.06.05 16:05:00 ABORT reason=SEEDBIAS_REFUSED state=S2_LTF_ALIGN poi=Daily-POC dir=LONG
P260: SEG 13695 CO	0	16:43:11.995	Core 04	2026.06.05 16:05:00   [SRJ-EA] A6REFUSED class=ABSENT_DECLINED bar=2026.06.05 16:05 state=S2_LTF_ALIGN dir=LONG predicate=SEEDBIAS_REFUSED
P261: SEG 16535 MQ	0	16:54:18.682	Core 04	2026.06.09 09:50:00   [SRJ-EA] UJPROV bar=2026.06.09 09:45 dir=SHORT reseedBar=1970.01.01 00:00 seedBiasAl=0 reseedDir=0 exempt=0 - reseed provenance at S2 edge (Fix CARRY)
P262: SEG 16566 HJ	0	16:54:24.798	Core 04	2026.06.09 09:55:00   [SRJ-EA] S2SEEDBIAS_KILL bar=2026.06.09 09:50 dir=SHORT poi=Weekly-VWAP - seedbias refused, promotion killed (Fix B2)
P263: SEG 10762 QP	0	16:35:39.439	Core 04	2026.06.04 11:50:00   [SRJ-EA] UJPROV bar=2026.06.04 11:45 dir=LONG reseedBar=2026.06.04 10:20 seedBiasAl=0 reseedDir=-1 exempt=0 - reseed provenance at S2 edge (Fix CARRY)
P264: SEG 10763 JK	0	16:35:39.439	Core 04	2026.06.04 11:50:00   [SRJ-EA] S2SEEDBIAS_KILL bar=2026.06.04 11:45 dir=LONG poi=Daily-POC - seedbias refused, promotion killed (Fix B2)
P265: SEG 14043 MI	0	16:43:24.215	Core 04	2026.06.05 16:55:00   [SRJ-EA] SIDE1R_RGATE evalBar=2026.06.05 16:50 seedBT=2026.06.05 16:45 dir=LONG seedBiasAl=1 rLive=1.56 livePass=1 slRef=159.726
P266: Q3 June-11 arbitration rows:
P267: SEG 22535 HM	0	17:08:10.382	Core 04	2026.06.11 14:25:21   [SRJ-EA] SIDE1H_WOULDPREEMPT bar=2026.06.11 14:20 newPoi=Daily-POC newDir=LONG heldPoi=Daily-POC heldDir=SHORT heldState=S4_ARMED newTier=5 heldTier=5 wouldPreempt=0 wouldTierPassLegacy=0
P268: SEG 22574 DI	0	17:08:16.498	Core 04	2026.06.11 14:30:00   [SRJ-EA] SIDE1H_WOULDPREEMPT bar=2026.06.11 14:25 newPoi=Daily-POC newDir=LONG heldPoi=Daily-POC heldDir=SHORT heldState=S4_ARMED newTier=5 heldTier=5 wouldPreempt=0 wouldTierPassLegacy=0
P269: SEG 22610 RO	0	17:08:16.498	Core 04	2026.06.11 14:35:10   [SRJ-EA] SIDE1H_WOULDPREEMPT bar=2026.06.11 14:30 newPoi=Daily-POC newDir=LONG heldPoi=Daily-POC heldDir=SHORT heldState=S4_ARMED newTier=5 heldTier=5 wouldPreempt=0 wouldTierPassLegacy=0
P270: SEG 22652 PL	0	17:08:16.498	Core 04	2026.06.11 14:40:22   [SRJ-EA] SIDE1H_WOULDPREEMPT bar=2026.06.11 14:35 newPoi=Daily-POC newDir=LONG heldPoi=Daily-POC heldDir=SHORT heldState=S4_ARMED newTier=5 heldTier=5 wouldPreempt=0 wouldTierPassLegacy=0
P271: SEG 22537 JN	0	17:08:10.382	Core 04	2026.06.11 14:25:21   [SRJ-EA] SUPPRESSED bar=2026.06.11 14:20 poi=Daily-POC dir=LONG opp=1 higher=0 heldPoi=Daily-POC heldDir=SHORT heldState=S4_ARMED cum_n=76 cum_opp=16 cum_hi=7 cum_both=4 action=HELD
P272: SEG 22576 HQ	0	17:08:16.498	Core 04	2026.06.11 14:30:00   [SRJ-EA] SUPPRESSED bar=2026.06.11 14:25 poi=Daily-POC dir=LONG opp=1 higher=0 heldPoi=Daily-POC heldDir=SHORT heldState=S4_ARMED cum_n=77 cum_opp=17 cum_hi=7 cum_both=4 action=HELD
P273: SEG 22612 PP	0	17:08:16.498	Core 04	2026.06.11 14:35:10   [SRJ-EA] SUPPRESSED bar=2026.06.11 14:30 poi=Daily-POC dir=LONG opp=1 higher=0 heldPoi=Daily-POC heldDir=SHORT heldState=S4_ARMED cum_n=78 cum_opp=18 cum_hi=7 cum_both=4 action=HELD
P274: SEG 22654 RO	0	17:08:16.498	Core 04	2026.06.11 14:40:22   [SRJ-EA] SUPPRESSED bar=2026.06.11 14:35 poi=Daily-POC dir=LONG opp=1 higher=0 heldPoi=Daily-POC heldDir=SHORT heldState=S4_ARMED cum_n=79 cum_opp=19 cum_hi=7 cum_both=4 action=HELD
P275: SEG 22401 OL	0	17:08:10.382	Core 04	2026.06.11 14:10:00   [SRJ-EA] RETESTBOOK bar=2026.06.11 14:05 hits=1 Daily-POC:r10:dS
P276: SEG 22655 GL	0	17:08:16.498	Core 04	2026.06.11 14:40:22   [SRJ-EA] RETESTBOOK bar=2026.06.11 14:35 hits=2 Daily-POC:r10:dL Daily-VWAP:r11:dL
P277: SEG 22580 FE	0	17:08:16.498	Core 04	2026.06.11 14:30:00   [SRJ-EA] CONFIRMPOLL bar=2026.06.11 14:25 anchor=Daily-POC dir=SHORT oppCandle=1 bodyDir=1 body=1pts doji=0 touchAttr=1 confirm=1 shadow=true
P278: SEG 22658 CQ	0	17:08:16.498	Core 04	2026.06.11 14:40:22   [SRJ-EA] CONFIRMPOLL bar=2026.06.11 14:35 anchor=Daily-POC dir=SHORT oppCandle=0 bodyDir=0 body=3pts doji=0 touchAttr=1 confirm=0 shadow=true
P279: SEG 22629 CS	0	17:08:16.498	Core 04	2026.06.11 14:40:22   [SRJ-EA] LTFFLIP bar=2026.06.11 14:35 dir=SHORT poi=Daily-POC state=S4_ARMED - LTF bias turned against the locked direction
P280: SEG 22631 QN	0	17:08:16.498	Core 04	2026.06.11 14:40:22   [SRJ-EA] UJDEFERABORT bar=2026.06.11 14:35 dir=SHORT poi=Daily-POC state=S4_ARMED - LTF opposed, abort deferred past evaluation (Fix S-a)
P281: SEG 22661 CQ	0	17:08:16.498	Core 04	2026.06.11 14:40:22   [SRJ-EA] UJDEFERAPPLY bar=2026.06.11 14:35 dir=SHORT poi=Daily-POC - deferred LTF abort applies, holder unchanged (Fix S-a)
P282: SEG 22664 JF	0	17:08:16.498	Core 04	2026.06.11 14:40:22   [SRJ-EA] ALERT SRJ STAND-DOWN SHORT USDJPY M5 | Daily-POC | NYAM | reason=LTF_MISALIGN
P283: 
P284: ## 7 - Register corrections carried old-to-new (application needs his explicit word)
P285: 
P286: R1 section-B title old: UJ VALID MISSED - his 3, NONE taken by the EA (blind window 1-13 June 2026) / new: UJ VALID - his 3; RECON78 reproduced 5 June London 09:45 entry (deal 4 at 159.948, TP deal 5 at 12:19:21).
P287: R2 row-2 Refuse old kept plus annotation: 16:10 NO_TP_TARGET, 5 levels invalid [R63 QO] / appended: RECON78 16:05 SEEDBIAS_REFUSED (UJPROV epoch SEG 13692, KILL SEG 13693, ABORT SEG 13694) - refusal ruled correct behavior per his 16:50 timing word; placement follows O3-settled validity.
P288: R3 row-1 held for Q1 (exit graded under the sync predicate once built).
P289: 
P290: ## 8 - Run and scope boundary
P291: 
P292: No build/run is requested in this review round. Any implementation needs a fresh council disposition plus an exact new Luna key and operator run word. Same window 2026-06-01 to 2026-06-13, InpDebugLog=true, InpMode=1 on any future run. No EU run or EU behavior is in scope. Live trading is prohibited.
