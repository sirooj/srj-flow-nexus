# BUILDER RELAY COUNCIL v396-UJ-EXEC-6 - packet P-RECON78-UJ-EXEC-1 v8 (consolidated TP sync and same-pass flip release design)
Status: V396 RELAY READY. Packet SHA-256 BAFC55650CC1289C4CDE5083131466AD40390085D9B6A7BFE60CA1F51AF918E3 / 148563 bytes / 1968 physical lines; the twin must reproduce every line P001-P1968.
Round status: CONTINUE after V395. V395 Q1 and Q3 each split 1-1 DISCREPANCY; Q2 was confirmed by both required seats, remains closed, and is not re-asked. V8 consolidates the Q1/Q3 conditions and new source exhibits into one review page.
Authority and safety: the operator owns strategy rulings. SRJ remains alert-only; the prior RECON78 run authorization is consumed. This relay authorizes no EA edit, build, tester run, key request, live action, commit, or push.
Review scope: review the complete v8 packet, with section 9 operative and sections 4, 5, and 8 explicitly historical/superseded. Give one verdict for Q1 and Q3; answer A and B separately; cite physical P-lines; close each question. Q2 stays closed. Do not assert an unobserved June 11 outcome.
Seat handling: Sonnet and GLM are the required voting seats. Luna is not a vote. A refusal to state a verdict is NO-VERDICT, not confirmation. A design confirmation does not grant build/run authority.
Operator carry: paste this complete relay identically to Sonnet and GLM once, then return both complete replies verbatim with seat names. This is the consolidated review of all V395 findings; no sequential partial question relays are requested.

## Twin (packet P-RECON78-UJ-EXEC-1 v8, mechanical splice from saved bytes; PSEQ P001-P1968)
P001: # PACKET P-RECON78-UJ-EXEC-1 v8 - June UJ execution repair and same-pass flip release
P002: 
P003: Status: v8 DRAFT for one consolidated design review by Sonnet and GLM. CONTINUE after V395 / packet v7. V391 is the Codex-authored structural reference. V392-V394 are review evidence, not templates. V395 seat findings are filed in the grade record and addressed in section 9 below. The 2026-06-01 through 2026-06-13 RECON78 run is the only current run evidence. Its one-run authorization is consumed. This page authorizes no source edit, build, tester run, key request, live action, commit, or push.
P004: 
P005: Line convention: physical lines; blank lines count; title is line 1. The twin below must reproduce every physical packet line exactly. This page asks only about the unresolved execution repair and June 11 arbitration design. Section 9 is the operative v8 proposal and supersedes the v7 Q1/Q3 designs and answer form in sections 4, 5, and 8; earlier evidence remains labeled as baseline/history. Q2 (June 5 NY 16:15 seed-bias refusal) is carried closed on the required Sonnet+GLM seats; no Q2 re-review is requested. R1/R2 register application remains gated on your explicit word.
P006: 
P007: ## 1 - Build defect carried from RECON78
P008: 
P009: On 5 June New York USDJPY, the EA changed only model `g_mtrade.tpRef` from 160.723 to the closed-session target 160.298. `UJRETARGET` is stamped on bar 19:00; model `TP_TOUCH` is stamped on bar 19:15, three M5 bars later. The broker TP remained 160.723. The position was stopped on 11 June at 22:30:51, with deal fill 159.725 against the 159.726 stop (one tick execution difference; this is not target tolerance). The 5 June London short shows the same divergence: its 12:00-bar retarget changed model TP 159.900 to 159.908; model `TP_TOUCH` followed on the 12:10 bar, but the broker filled the original 159.900 TP at 12:19:21. This is the build defect Q1 must solve. Exact-price/no-leniency remains in force; a model print is not broker execution.
P010: 
P011: ## 2 - Governing operator pins and fixed boundaries
P012: 
P013: - SRJ strategy memory: `.opencode/skills/srj-strategy/SKILL.md` sections 1, 2, 8, 10. `RETARGET-CLOSED-AM` and `SYMMETRY-NEAREST`: only a closed session's directional extreme can become the nearest valid target. `EXACT-PRICE-NO-LENIENCY`: next-candle entry open and booked/revised target exit are exact; spread drift is a defect, never tolerance.
P014: - `FLIP-KILLED-NEVER-VETOES`: a potential killed by the 5m structure-bias flip cannot keep vetoing the challenger. `LIVE-TRADE-BLOCKS-ALL`: an already-live position of the same pair/session still blocks a new setup. `ONE-TAKE-PER-PAIR-PER-SESSION`: one take per pair per session; London and New York remain independent. These govern different states: candidate arbitration versus a broker-open trade.
P015: - June 11 New York USDJPY: retest + confirmation bar 14:35; entry bar is the 14:40 open at 160.524 per the operator ruling recorded in `BUILDER_FINDING_USDJPY-MISSES.md` (Rulings-G/J) and register row 26. 14:45 is post-entry and cannot grade selection. The current journal contains no 14:40 LONG alert or deal at that level. The fixed acceptance price is operator evidence, not an outcome observed in RECON78.
P016: - June 5 New York USDJPY 16:15 is still a distinct missed entry; the later 16:55 position is not its substitute. It is carried context only and not reopened as Q2.
P017: - Alert-only remains structural. There is no live order path authorized here. No new run is authorized.
P018: 
P019: ## 3 - V395 grade and v8 fold scope
P020: 
P021: V395 seat texts are filed whole and graded in `06_HANDOFFS/BUILDER_RESULT_V395-GRADE.md`. Sonnet returned Q1 DISCREPANCY and Q3 DISCREPANCY. GLM returned CONFIRM on Q1 with binding C1-C12/S1-S2 and CONFIRM on Q3 with binding D1-D10. Both questions therefore remain split 1-1 DISCREPANCY. Q2 was CONFIRMED by both required seats, remains closed, and is not re-asked. No build or run authority was granted.
P022: 
P023: Section 9 is the only operative v8 design and answer form. It consolidates both V395 replies, adds source excerpts that were missing, separates the settled same-bar strategy tie from code design, and puts the remaining conditions into one review. Sections 4-5 and 8 are preserved V7 text only; they are superseded wherever section 9 says so. Do not grade those historical questions as the current proposal.
P024: ## 4 - Historical V7 Q1 proposal (superseded by section 9)
P025: 
P026: This is a proposed design, not implemented code. The helper body and retry block do not exist in the current EA and are not claimed as source exhibits.
P027: 
P028: **Recommendation.** Add `UjSyncBrokerTp(entryPid, target)` at the retarget site immediately after `g_mtrade.tpRef` is revised and before `tpBookedTouch` is evaluated. Resolve the live ticket from the position identifier, then require matching symbol and magic. Read and preserve that position's live SL. Submit `PositionModify(ticket, liveSL, NormalizeDouble(target,_Digits))`; a successful library return alone is insufficient: require the documented success retcode and a broker-position TP readback equal to the normalized target. If already equal, emit a named `UJTPMODIFY_SKIP` and do not count a modify attempt.
P029: 
P030: Proposed per-instance fields: `ujTpSyncAttempts`, `ujTpSyncAttemptBarTime`, `ujTpSyncState`, and `ujTpSyncTarget`, keyed by position identifier plus trade sequence/admission bar. Attempt no more than once per evaluated M5 bar and no more than three times per target revision. Each unsuccessful request or failed exact readback consumes one attempt. After attempt three, latch terminal FAIL; unclassified retcodes must not become an unlimited retry class. Name the retryable/permanent retcode sets or explain the default. Every modify, skip, and fail event carries pair, session, sequence, admission bar, position identifier, target and attempt/state. If TP is already equal, emit `UJTPMODIFY_SKIP` and do not count a modify attempt; explicitly exclude that skip from modify-call counts. No market close on failure: original broker SL/TP remain in control, acceptance fails, and the mismatch remains visible in `UJORPHAN` until actual broker exit. Do not mark revised-price `TP_TOUCH` as a successful broker exit while sync is pending or failed; council should settle the precise managed-model state and alert/log disposition for that case.
P031: 
P032: The retry host is after the active check at EA 11845 and before the state gate at EA 11846. EA 351 inside `MtReset` sets `g_mtrade.active=false`; the fill path sets it true at EA 10702. Model close at EA 12037 changes state to `MT_CLOSED` without clearing `active`. The proposed host sits after the active check and before the state gate, so it can service a closed-model/open-broker instance if no reset has already cleared active; verify every `MtReset` caller and the actual instance lifecycle.
P033: 
P034: O6 admission rule: before any same-pair/same-session new setup is seeded/admitted, block it while a broker position for that pair/session remains open, including an older position. A London position does not block New York. Broker-confirmed exit ends the live instance. The proposed design should gate candidate admission immediately before the IDLE seed path at EA 8072 and recheck before EmitAlert SIGNAL at EA 10625. Current IsSessionPositionOpen(magic) filters symbol and session magic, but its call at EA 10756 follows the signal alert and the MODE_ALERT_ONLY return at EA 10740-10749; it is too late for the settled admission rule. Council must confirm the proposed sites and older same-session positions are included. This boundary controls Q3: June 11 NY admission is expected only if Q1's 5 June NY position broker-closed at its revised target beforehand; otherwise the same-session block is correct.
P035: 
P036: **Q1 review asks.**
P037: 
P038: Q1 verdict: CONFIRM / OBJECT / DISCREPANCY.
P039: 
P040: - Ask A: is the proposed helper, per-instance state, retry cap, exact EA insertion sites and pre-SIGNAL O6 gate complete and internally consistent for this defect? The retry host is after the active check EA 11845 and before the state gate EA 11846; the retarget call is immediately after EA 11920 changes `tpRef` and before TP_TOUCH evaluation. Resolve ticket by position identifier, verify symbol/magic, preserve current SL, require broker success retcode and exact normalized TP readback. Name any missing field, source site, retcode rule, MQL5 behavior, or failure-state transition. In particular, state what the model must do if revised-price TP_TOUCH occurs before broker synchronization is confirmed or after the three-attempt terminal FAIL; it must not claim a revised-price broker exit that did not occur. Verify whether the retry host can still identify the position after every `MtReset` path.
P041: - Ask B: is the future acceptance exact and sufficient? For both June 5 NY (160.723 -> 160.298) and London (159.900 -> 159.908), require an instance-labeled retarget, accepted broker modification, exact broker TP readback, preserved SL, and actual broker TP deal exactly at the revised value before any later stop. London baseline is fully visible: 09:45 SIGNAL/deal #4 at 159.948 with SL 159.972 and TP 159.900; the 12:00 retarget precedes model TP_TOUCH at 12:10; the original broker TP fills at 12:19:21. A revised-target deal is a future predicate, not baseline evidence. Require no acceptance if modification/readback fails or the deal fills at the old target. Name identity fields in modify/skip/fail rows (pair, session, trade sequence/admission bar and position identifier); name and exclude idempotent skips from modify-attempt counts. Keep the operator-set entry open and actual deal as separate exact observations: the 5 June NY baseline signal/model entry is 160.115, Ask/deal is 160.120; do not assert they are equal or waive EXACT-PRICE-NO-LENIENCY. The current run has no modify call/event or revised-target deal; do not claim those outcomes happened.
P042: 
P043: ## 5 - Historical V7 Q3 proposal (superseded by section 9)
P044: 
P045: Current sequence on 11 June: the 14:40:22 pass evaluates the 14:35 bar. The opposite SHORT S4_ARMED holder gets `LTFFLIP` and sets `uj_saAbort` keyed to anchor, direction and bar time; the equal-tier LONG Daily-POC retest is excluded while the singleton is occupied; deferred abort is applied later. `SUPPRESSED` reports the exclusion; it does not perform it. The only confirm poll in the supplied 14:35 rows is for the held SHORT and is `shadow=true, confirm=0`; the baseline does not prove a LONG confirm or outcome.
P046: 
P047: **Recommendation.** When `uj_saAbort` matches the current holder identity, consume that abort once before the normal IDLE seed check. Capture/retain no S4 zone, touch, entry, SL, TP, or confirmation latches. Let `GoAbort` reset the dead holder, clear the consumed deferred-abort local, then pass the current bar once through the existing IDLE seed path so the 14:35 LONG retest+confirmation is freshly evaluated. Do not rerun the whole bar or process the candidate twice. If this placement cannot safely reach the existing IDLE path in the same pass, council must give one concrete alternative state map; no S4-to-LONG state transfer is presumed safe.
P048: 
P049: Do not release or seed a candidate while a same-pair/same-session broker position remains open. Q1 must first demonstrate broker exit of the 5 June NY trade at 160.298 before a June 11 NY entry can be expected. Q3 outcome is conditional on that prerequisite; the baseline June 11 miss does not contain a LONG confirm, alert, admission, or deal at 160.524.
P050: 
P051: **Q3 review asks.**
P052: 
P053: Q3 verdict: CONFIRM / OBJECT / DISCREPANCY.
P054: 
P055: - Ask A: does consuming the matching deferred abort before the IDLE seed path express `FLIP-KILLED-NEVER-VETOES` while preserving the pre-confirmation 5m flip kill, normal fresh S1/S2/S3/S4 initialization, same-bar POC-over-VWAP ranking, and no duplicate pass? Trace the proposed sequence against the spliced source and name any missing clear/write/return site.
P056: - Ask B: is this future acceptance gradeable without asserting an unobserved outcome? Require (i) Q1's prior same-session broker position closed at its exact revised TP before 11 June; (ii) the 14:35 LONG retest+confirmation processed through normal fresh initialization; (iii) the registered Daily-POC LONG signal and actual deal at the operator-set 14:40 open 160.524, with no spread tolerance and no relabeling the open as Ask; existing source reads `SYMBOL_ASK` for LONG at EA 10759, so disclose any unresolved execution conflict; (iv) no 14:45+ selection evidence; (v) June 8 invalid SHORT remains silent under the applicable 5m flip rule; the baseline S2SEEDBIAS_KILL is a separate observed refusal, not proof of a 5m-flip kill; (vi) 6/9 09:50 never-reseeded candidate remains refused; (vii) 5 June London 09:45 remains correct; and (viii) one accepted June 11 NY take for this registered instance, scoped by pair/session/date/anchor/direction, not a run-wide deal count. These are future-run predicates only: current rows show no June 11 LONG alert, admission, or deal. No run is requested or authorized.
P057: 
P058: ## 6 - Source exhibits (current EA; line numbers are physical source lines)
P059: 
P060: Current source/result identity: EA SHA-256 E80FF0C24149AB0946EB6A4341C0503A79BFE82E9843867CEF0DBA89BF587BBC; archived journal SHA-256 48F5C196462B08FFF38E6CCA79F3F61737F03C1F85B3A9BB9C33F5E06795926D; RECON78 result SHA-256 06465B2510E7C6DEC9B0E1EBF227DF4ABB6BD5B381899BD63AD2A64AE64C13A5.
P061: 
P062: EA source lines 11771-11785:
P063: ```mql5
P064: 11771:      {
P065: 11772:       ulong mtp_t = PositionGetTicket(mtp_i);
P066: 11773:       if(mtp_t == 0 || !PositionSelectByTicket(mtp_t)) continue;
P067: 11774:       if(PositionGetString(POSITION_SYMBOL) != _Symbol) continue;
P068: 11775:       if(PositionGetInteger(POSITION_IDENTIFIER) != pid) continue;
P069: 11776:       return mtp_t;
P070: 11777:      }
P071: 11778:    return 0;
P072: 11779:   }
P073: 11780: 
P074: 11781: 
P075: 11782: 
P076: 11783: //================= [P-EXITEXEC-1] broker close for the paper-only exit legs ========
P077: 11784: //--- Q2 (his COMBINE word): BREAK and DAY_CLOSE verdicts flipped paper state only
P078: 11785: //--- (ALERT-ONLY preserved, never an order), so the broker position lived on
P079: ```
P080: 
P081: EA source lines 11843-11846:
P082: ```mql5
P083: 11843: void EvaluateManagedTrade(const int barShift)
P084: 11844:   {
P085: 11845:    if(!g_mtrade.active) return;
P086: 11846:    if(g_mtrade.state != MT_MANAGING && g_mtrade.state != MT_PENDING_FILL) return;
P087: ```
P088: 
P089: EA source lines 11912-11923:
P090: ```mql5
P091: 11912:     //--- [P-RECON74FIX-2 R] session-close retarget (his RETARGET rule; closed-session values only; instance-contained plus caller-strict-tighter jointly bound the revision to one per trade instance).
P092: 11913:     if(g_mtrade.tpRef != EMPTY_VALUE && g_mtrade.tpRef > 0.0)
P093: 11914:       {
P094: 11915:        double uj_rtPx = 0.0;
P095: 11916:        if(UjClosedSessionTarget(g_mtrade, barShift, uj_rtPx) && uj_rtPx > 0.0
P096: 11917:           && ((g_mtrade.dir == DIR_LONG && NormalizeDouble(uj_rtPx, _Digits) < NormalizeDouble(g_mtrade.tpRef, _Digits)) || (g_mtrade.dir == DIR_SHORT && NormalizeDouble(uj_rtPx, _Digits) > NormalizeDouble(g_mtrade.tpRef, _Digits))))
P097: 11918:          {
P098: 11919:           double uj_oldRef = g_mtrade.tpRef;
P099: 11920:           g_mtrade.tpRef = uj_rtPx;
P100: 11921:           if(InpDebugLog) PrintFormat("[SRJ-EA] UJRETARGET bar=%s dir=%s old=%s sess=%d tp=%s seq=%I64d admit=%s - session-close retarget (Fix R)", TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES), DirName(g_mtrade.dir), DoubleToString(uj_oldRef, _Digits), g_mtrade.sessionAtEntry, DoubleToString(g_mtrade.tpRef, _Digits), (long)g_mtrade.uj_tradeSeq, TimeToString(g_mtrade.uj_admitBarTime, TIME_DATE|TIME_MINUTES));
P101: 11922:          }
P102: 11923:        else if(InpDebugLog && uj_rtPx > 0.0) PrintFormat("[SRJ-EA] UJNORETARGET bar=%s dir=%s tp=%s rt=%s why=%s sess=%d seq=%I64d admit=%s - helper true but not tighter (Fix R)", TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES), DirName(g_mtrade.dir), DoubleToString(g_mtrade.tpRef, _Digits), DoubleToString(uj_rtPx, _Digits), (NormalizeDouble(uj_rtPx, _Digits) == NormalizeDouble(g_mtrade.tpRef, _Digits) ? "eq" : "loose"), g_mtrade.sessionAtEntry, (long)g_mtrade.uj_tradeSeq, TimeToString(g_mtrade.uj_admitBarTime, TIME_DATE|TIME_MINUTES)); // helper-true discriminator
P103: ```
P104: 
P105: EA source lines 12036-12060:
P106: ```mql5
P107: 12036:    //--- close the trade (the priority order stated in the header)
P108: 12037:    g_mtrade.state       = MT_CLOSED;
P109: 12038:    g_mtrade.exitBarTime = barTime;
P110: 12039:    if(vSL)         { g_mtrade.exitReason = MT_EXIT_SL;             g_mtrade.exitPrice = g_mtrade.slRef; }
P111: 12040:     else if(vTP)    { g_mtrade.exitReason = MT_EXIT_TP_TOUCH;       g_mtrade.exitPrice = g_mtrade.tpRef; }
P112: 12041:    else if(vBREAK) { g_mtrade.exitReason = MT_EXIT_POI_BODY_BREAK; g_mtrade.exitPrice = nextOpenPx; }
P113: 12042:    else if(vHTF)   { g_mtrade.exitReason = MT_EXIT_HTF_FLIP;       g_mtrade.exitPrice = nextOpenPx; }
P114: 12043:    else if(vDAY)   { g_mtrade.exitReason = MT_EXIT_DAY_CLOSE;  g_mtrade.exitPrice = nextOpenPx; }
P115: 12044: 
P116: 12045:     PrintFormat("[SRJ-EA] MTEXIT bar=%s reason=%s line=%s lineVal=%s entry=%s exit=%s",
P117: 12046:                 TimeToString(barTime, TIME_DATE|TIME_MINUTES),
P118: 12047:                 MtExitName(g_mtrade.exitReason),
P119: 12048:                 (vBREAK ? breakLineName : "-"),
P120: 12049:                 (vBREAK ? DoubleToString(breakLineVal, _Digits) : "-"),
P121: 12050:                 DoubleToString(g_mtrade.entryPrice, _Digits),
P122: 12051:                 DoubleToString(g_mtrade.exitPrice, _Digits));
P123: 12052:     //--- [P-EXITEXEC-1 E7] execution legs: SL/TP broker-owned, HTF stays off,
P124: 12053:     //--- CANCEL_BIAS returned above - only the WINNING BREAK/DAY_CLOSE verdict closes.
P125: 12054:     //--- Price reference = g_mtrade.exitPrice (= nextOpenPx on the gated legs per EA 11290/11292); paper MTEXIT/MTLIFE/EXIT rows print regardless.
P126: 12055:     if(g_mtrade.exitReason == MT_EXIT_POI_BODY_BREAK || g_mtrade.exitReason == MT_EXIT_DAY_CLOSE)
P127: 12056:       {
P128: 12057:        int mtexecRc = MtCloseBrokerPosition(MtExitName(g_mtrade.exitReason), g_mtrade.exitPrice, barTime);
P129: 12058:        if(mtexecRc == 0)
P130: 12059:           PrintFormat("[SRJ-EA] MTCLOSE_FAIL bar=%s reason=%s entryTicket=%I64u entryPid=%I64d", TimeToString(barTime, TIME_DATE|TIME_MINUTES), MtExitName(g_mtrade.exitReason), g_mtrade.ticket, g_mtrade.entryPid);
P131: 12060:       }
P132: ```
P133: 
P134: EA source lines 7450-7456:
P135: ```mql5
P136: 7450:           if((uj_hm15r && uj_hm15 == uj_hwant) || uj_hcarve)
P137: 7451:             { if(InpDebugLog) PrintFormat("[SRJ-EA] UJLTFHOLD bar=%s dir=%s poi=%s state=%s m15=%s rf=%d mode=%s term=%s - LTF opposed, hold (Fix F11)", TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES), DirName(g_dir), AnchorStr(), StateName(g_state), DoubleToString(uj_hm15, 1), (uj_hm15r ? 1 : 0), ((uj_hm15r && uj_hm15 == uj_hwant) ? "M15" : "CARVE"), uj_hterm); }
P138: 7452:           else
P139: 7453:             {
P140: 7454:              uj_saAbort = true; uj_saA = g_anchorLine; uj_saD = (int)g_dir; uj_saT = g_anchorBarTime;
P141: 7455:              if(InpDebugLog) PrintFormat("[SRJ-EA] UJDEFERABORT bar=%s dir=%s poi=%s state=%s - LTF opposed, abort deferred past evaluation (Fix S-a)", TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES), DirName(g_dir), AnchorStr(), StateName(g_state));
P142: 7456:             }
P143: ```
P144: 
P145: EA source lines 8070-8094:
P146: ```mql5
P147: 8070:     bool s1f_seedArmed = (g_state == ST_IDLE);   //--- [SIDE1F] (i) seed-bar exactness flag (new local only)
P148: 8071: 
P149: 8072:     if(g_state == ST_IDLE)
P150: 8073:       {
P151: 8074:        if(!inWindow) { if(InpDebugLog && TimeToString(barTime, TIME_MINUTES) == "17:00") PrintFormat("[SRJ-EA] SEEDDIAG bar=%s branch=WINDOW inWin=0 sess=%s retestFound=%d", TimeToString(barTime, TIME_DATE|TIME_MINUTES), SessionName(sess), -1); return; }
P152: 8075:       if(SessionAlreadyUsed(sess, barTime))
P153: 8076:         {
P154: 8077:          static datetime s_limitDay  = 0;
P155: 8078:          static int      s_limitSess = -1;
P156: 8079:          datetime dayKey = TC_DayStart(barTime);
P157: 8080:          if(InpDebugLog && (dayKey != s_limitDay || (int)sess != s_limitSess))
P158: 8081:            {
P159: 8082:             s_limitDay  = dayKey;
P160: 8083:             s_limitSess = (int)sess;
P161: 8084:             PrintFormat("[SRJ-EA] %s SESSION_LIMIT: %s window already used today - "
P162: 8085:                         "all further candidates suppressed until the next window",
P163: 8086:                         TimeToString(TimeCurrent(), TIME_DATE|TIME_SECONDS),
P164: 8087:                         SessionName(sess));
P165: 8088:            }
P166: 8089:          if(InpDebugLog && TimeToString(barTime, TIME_MINUTES) == "17:00") PrintFormat("[SRJ-EA] SEEDDIAG bar=%s branch=SESSION inWin=1 sess=%s retestFound=%d", TimeToString(barTime, TIME_DATE|TIME_MINUTES), SessionName(sess), -1);
P167: 8090:          return;
P168: 8091:         }
P169: 8092:         PoiRetestResult pr;
P170: 8093:         if(!DetectPoiRetest(barShift, pr) || !pr.found) { if(InpDebugLog && TimeToString(barTime, TIME_MINUTES) == "17:00") PrintFormat("[SRJ-EA] SEEDDIAG bar=%s branch=RETEST inWin=1 sess=%s retestFound=%d", TimeToString(barTime, TIME_DATE|TIME_MINUTES), SessionName(sess), (pr.found ? 1 : 0)); return; }
P171: 8094:         //--- [P-RESQUAT-1 F-a] eviction-paired read gate: a candidate identical to
P172: ```
P173: 
P174: EA source lines 8462-8476:
P175: ```mql5
P176: 8462:        //--- [v20 S-a] deferred-abort application (identity-keyed on anchor+dir+barTime; set in Fix F11 tail).
P177: 8463:        if(uj_saAbort)
P178: 8464:          {
P179: 8465:           if(uj_saA == g_anchorLine && uj_saD == (int)g_dir && uj_saT == g_anchorBarTime)
P180: 8466:             {
P181: 8467:              if(InpDebugLog) PrintFormat("[SRJ-EA] UJDEFERAPPLY bar=%s dir=%s poi=%s - deferred LTF abort applies, holder unchanged (Fix S-a)", TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES), DirName(g_dir), AnchorStr());
P182: 8468:              GoAbort(ABORT_LTF_MISALIGN, g_state);
P183: 8469:              return;
P184: 8470:             }
P185: 8471:           else
P186: 8472:             {
P187: 8473:              if(InpDebugLog) PrintFormat("[SRJ-EA] UJDEFERDROP bar=%s dir=%s poi=%s - deferred LTF abort dropped, holder changed (Fix S-a)", TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES), DirName(g_dir), AnchorStr());
P188: 8474:             }
P189: 8475:           uj_saAbort = false;
P190: 8476:          }
P191: ```
P192: 
P193: EA source lines 1754-1763 (existing session-position resolver):
P194: ```mql5
P195: 1754: bool IsSessionPositionOpen(long magic)
P196: 1755:   {
P197: 1756:    for(int i = PositionsTotal() - 1; i >= 0; i--)
P198: 1757:      {
P199: 1758:       ulong ticket = PositionGetTicket(i);
P200: 1759:       if(PositionGetString(POSITION_SYMBOL) == _Symbol && PositionGetInteger(POSITION_MAGIC) == magic)
P201: 1760:          return true;
P202: 1761:      }
P203: 1762:    return false;
P204: 1763:   }
P205: ```
P206: 
P207: EA source lines 10618-10645 (SIGNAL alert precedes current position guard; managed-trade record is snapshotted afterward):
P208: ```mql5
P209: 10618:         LogSignal(tpTarget, tpR, slRef, slMode, divKind);
P210: 10619:         if(InpDebugLog) A6Fired(barShift, tpTarget, tpR, slRef, slMode, divKind);   //--- [A6-HOOK] (ii)
P211: 10620:         if(InpDebugLog) PrintFormat("[SRJ-EA] SIDE1F_WATCH bar=%s dir=%s", TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES), DirName(g_dir));   //--- [SIDE1F] (iii) fire watch (read-only)
P212: 10621: 
P213: 10622:       if(!g_alertedSignal)
P214: 10623:         {
P215: 10624:          g_alertedSignal = true;
P216: 10625:          EmitAlert("SIGNAL",
P217: 10626:                    StringFormat("R=%.2f SL %s TP %s spr=%d",
P218: 10627:                                 tpR,
P219: 10628:                                 DoubleToString(slRef,    _Digits),
P220: 10629:                                 DoubleToString(tpTarget, _Digits),
P221: 10630:                                 (int)SymbolInfoInteger(_Symbol, SYMBOL_SPREAD)),
P222: 10631:                    true);
P223: 10632:         }
P224: 10633: 
P225: 10634:       //--- [P-EXITMODEL 2026-09-09, operator-issued packet] The section 5 exit phase
P226: 10635:       //--- now exists: snapshot the trade into the managed record BEFORE
P227: 10636:       //--- ResetSequence (the R-201 ordering discipline). The entry reference IS the
P228: 10637:       //--- next candle's open (currentPrice above), so the fill is immediate at that
P229: 10638:       //--- open (section 5.5's limit "fills on a wick" - the forming bar's own open
P230: 10639:       //--- is the fill tick); the fill candle's own close is then tested like every
P231: 10640:       //--- bar ("exit immediately rather than waiting for a subsequent close").
P232: 10641:       //--- DECLARED BOUNDARY: one managed record (the R-201 precedent). A second
P233: 10642:       //--- signal while one trade is managing logs MTCOLLISION and REPLACES the
P234: 10643:       //--- record (spec section 6's blessed London+NY exception would need a
P235: 10644:       //--- registry - a separate packet item if it ever fires).
P236: 10645:       if(g_mtrade.active && g_mtrade.state == MT_MANAGING)
P237: ```
P238: 
P239: EA source lines 10740-10761 (alert-only returns before the current execution-only position guard; LONG execution reads Ask):
P240: ```mql5
P241: 10740:       if(InpMode == MODE_ALERT_ONLY)
P242: 10741:         {
P243: 10742:          PrintFormat("[SRJ-EA] ALERT_ONLY mode - no order sent. Session %s marked used.",
P244: 10743:                      SessionName(g_sessionAtEntry));
P245: 10744:          MarkSessionUsed(g_sessionAtEntry, g_anchorBarTime);
P246: 10745:          ENUM_SRJ_STATE prevA = g_state;
P247: 10746:          g_state = ST_SIGNAL;
P248: 10747:          LogState(prevA, g_state);
P249: 10748:          ResetSequence();
P250: 10749:          return;
P251: 10750:         }
P252: 10751: 
P253: 10752:        // ------ Phase 2 Execution Logic ------
P254: 10753:        if(InpMode == MODE_EXECUTE) PrintFormat("[SRJ-EA] EXECUTE_ACCT mode=%d login=%d", (int)AccountInfoInteger(ACCOUNT_TRADE_MODE), (int)AccountInfoInteger(ACCOUNT_LOGIN));
P255: 10754:        long magic = (g_sessionAtEntry == SESSION_LONDON) ? InpMagicBase + 1 : InpMagicBase + 2;
P256: 10755: 
P257: 10756:       if(IsSessionPositionOpen(magic))
P258: 10757:         { GoAbort(ABORT_CONCURRENCY, g_state); return; }
P259: 10758: 
P260: 10759:       double entryPrice = (g_dir == DIR_LONG) ? SymbolInfoDouble(_Symbol, SYMBOL_ASK) : SymbolInfoDouble(_Symbol, SYMBOL_BID);
P261: 10760:       double riskMoney  = AccountInfoDouble(ACCOUNT_EQUITY) * InpRiskPercent / 100.0;
P262: 10761:       double slDistanceReal = MathAbs(entryPrice - slRef);
P263: ```
P264: 
P265: EA source lines 6571-6595 (ResetSequence clears the old candidate; the next comment line is omitted because it contains a non-ASCII dash and no executable statement):
P266: ```mql5
P267: 6571: void ResetSequence()
P268: 6572:   {
P269: 6573:    g_state          = ST_IDLE;
P270: 6574:    g_dir            = DIR_NONE;
P271: 6575:    SrjSideNote("ResetSequence", g_dir);
P272: 6576:    g_regime         = REGIME_NONE;
P273: 6577:    g_sessionAtEntry = SESSION_NONE;
P274: 6578:    g_anchorLine     = -1;
P275: 6579:    g_anchorPrice    = 0.0;
P276: 6580:    g_anchorBarTime  = 0;
P277: 6581:    g_divLatch       = false;
P278: 6582:    g_touchSeen      = false;
P279: 6583:    g_touchBarHi     = 0.0;
P280: 6584:    g_touchBarLo     = 0.0;
P281: 6585:    g_zoneHi         = 0.0;
P282: 6586:    g_zoneLo         = 0.0;
P283: 6587:    g_alertedArmed   = false;
P284: 6588:    g_alertedSignal  = false;
P285: 6589:    g_latchedEntry   = 0.0;
P286: 6590:    g_latchedSl      = 0.0;
P287: 6591:    g_latchedTp      = 0.0;
P288: 6592:    g_latchedR       = 0.0;
P289: 6593:    g_latchBarTime   = 0;
P290: 6594:    g_confirmFromState = ST_IDLE;
P291: 6595:    //--- [P-BUILD3 E5] no new working-set field: the re-bind assigns anchor,
P292: ```
P293: 
P294: EA source lines 6597-6634 (GoAbort calls ResetSequence):
P295: ```mql5
P296: 6597:    //--- existing members (fields 4/5/6, 11/12, 8/9/10, 0, 15-19, 20).
P297: 6598:   }
P298: 6599: 
P299: 6600: void GoAbort(const string reason, ENUM_SRJ_STATE atState)
P300: 6601:   {
P301: 6602:    LogAbort(reason, atState);
P302: 6603:    if(InpDebugLog && g_dir != DIR_NONE)
P303: 6604:      {
P304: 6605:       string a6rBT = TimeToString(TimeCurrent(), TIME_DATE|TIME_MINUTES);
P305: 6606:       string a6rLn = StringFormat("[SRJ-EA] A6REFUSED class=ABSENT_DECLINED bar=%s state=%s dir=%s predicate=%s",
P306: 6607:                                   a6rBT, StateName(atState), DirName(g_dir), reason);
P307: 6608:       A6Emit("REF" + a6rBT + reason + StateName(atState), a6rLn);
P308: 6609:      }   //--- [A6-HOOK] (ii) refused decision row (candidate alive => born+rejected)
P309: 6610:    //--- TASK 19c: count NO_REGIME aborts so the census can be read against
P310: 6611:    //--- them directly. Measurement only.
P311: 6612:    if(InpDebugLog && reason == ABORT_NO_REGIME) g_ea19_noRegimeAborts++;
P312: 6613:    if(InpAlertStandDown && g_alertedArmed && !g_alertedSignal)
P313: 6614:       EmitAlert("STAND-DOWN", "reason=" + reason, false);
P314: 6615: 
P315: 6616:    //--- TASK 15: shadow record. Must fire BEFORE ResetSequence()
P316: 6617:    //--- clears g_dir and g_anchorLine. Read-only measurement.
P317: 6618:    if(InpDebugLog &&
P318: 6619:       (reason == ABORT_NO_REGIME || reason == ABORT_LTF_MISALIGN))
P319: 6620:      {
P320: 6621:       g_shadowActive = true;
P321: 6622:       g_shadowDir    = g_dir;
P322: 6623:       g_shadowLine   = g_anchorLine;
P323: 6624:       g_shadowOpened = g_anchorBarTime;
P324: 6625:       g_shadowSess   = g_sessionAtEntry;
P325: 6626:       g_shadowFail   = reason;
P326: 6627:       g_shadowBars   = 0;
P327: 6628:      }
P328: 6629: 
P329: 6630:    ENUM_SRJ_STATE prev = g_state;
P330: 6631:    g_state = ST_ABORT;
P331: 6632:    LogState(prev, g_state);
P332: 6633:    ResetSequence();
P333: 6634:   }
P334: ```
P335: 
P336: EA source lines 8430-8476 (same-pass contender handling followed by the current deferred-abort apply/drop site):
P337: ```mql5
P338: 8430:        if(g_state == ST_S3_ZONE_WAIT || g_state == ST_S4_ARMED) {
P339: 8431:        bool uj_sbHave = false; ENUM_SRJ_DIR uj_sbDir = DIR_NONE; int uj_sbLine = -1;
P340: 8432:        {
P341: 8433:         PoiRetestResult uj_sbPr;
P342: 8434:         if(DetectPoiRetest(barShift, uj_sbPr) && uj_sbPr.found)
P343: 8435:           { uj_sbHave = true; uj_sbDir = uj_sbPr.isLong ? DIR_LONG : DIR_SHORT; uj_sbLine = uj_sbPr.topLine; }
P344: 8436:        }
P345: 8437:        string uj_sbTermC = "", uj_sbTermH = "";
P346: 8438:         bool uj_sbConfC = (uj_sbHave && (uj_sbDir != g_dir)) ? IsConfirmationCandle(barShift, uj_sbLine, uj_sbDir, uj_sbTermC, true) : false;
P347: 8439:        bool uj_sbConfH = IsConfirmationCandle(barShift, g_anchorLine, g_dir, uj_sbTermH);
P348: 8440:         double uj_sbLineVal = 0.0; if(uj_sbHave && uj_sbLine >= 0 && !ReadBuf1(g_hPoi, uj_sbLine, uj_sbLineVal, barShift)) uj_sbLineVal = 0.0;
P349: 8441:         double uj_sbo1 = iOpen (_Symbol, PERIOD_CURRENT, barShift + 1); double uj_sbc1 = iClose(_Symbol, PERIOD_CURRENT, barShift + 1); double uj_sbc0 = iClose(_Symbol, PERIOD_CURRENT, barShift); int uj_sbarm = 1;
P350: 8442:         if(InpDebugLog) PrintFormat("[SRJ-EA] UJSBTELEM bar=%s dir=%s have=%d sbDir=%s sbLine=%d confC=%d confH=%d sbL=%s o1=%s c1=%s c0=%s arm=%d termC=%s termH=%s - contender evaluation (Fix S3)", TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES), DirName(g_dir), (int)uj_sbHave, DirName(uj_sbDir), uj_sbLine, (int)uj_sbConfC, (int)uj_sbConfH, DoubleToString(uj_sbLineVal, _Digits), DoubleToString(uj_sbo1, _Digits), DoubleToString(uj_sbc1, _Digits), DoubleToString(uj_sbc0, _Digits), uj_sbarm, uj_sbTermC, uj_sbTermH);
P351: 8443:        if(uj_sbConfC && !uj_sbConfH && (g_state == ST_S3_ZONE_WAIT || g_state == ST_S4_ARMED))
P352: 8444:          {
P353: 8445:           int uj_sbFromLine = g_anchorLine; ENUM_SRJ_DIR uj_sbFromDir = g_dir;
P354: 8446:           g_anchorLine = uj_sbLine; g_dir = uj_sbDir;
P355: 8447:           ReadBuf1(g_hPoi, uj_sbLine, g_anchorPrice, barShift);
P356: 8448:           g_anchorBarTime = barTime;
P357: 8449:           g_zoneHi = 0.0; g_zoneLo = 0.0; g_touchSeen = false;
P358: 8450:           g_touchBarHi = 0.0; g_touchBarLo = 0.0;
P359: 8451:           g_latchedEntry = 0.0; g_latchedSl = 0.0; g_latchedTp = 0.0; g_latchedR = 0.0;
P360: 8452:           g_latchBarTime = 0; g_confirmFromState = ST_IDLE;
P361: 8453:           uj_memo_valid = false;
P362: 8454:           if(InpDebugLog)
P363: 8455:              PrintFormat("[SRJ-EA] SIDE1C_YIELD bar=%s from=%s fromDir=%s to=%s toDir=%s state=%s term=%s",
P364: 8456:                          TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES),
P365: 8457:                          g_lineCode[uj_sbFromLine], DirName(uj_sbFromDir),
P366: 8458:                          g_lineCode[uj_sbLine], DirName(uj_sbDir),
P367: 8459:                          StateName(g_state), uj_sbTermC);
P368: 8460:          }
P369: 8461:        }
P370: 8462:        //--- [v20 S-a] deferred-abort application (identity-keyed on anchor+dir+barTime; set in Fix F11 tail).
P371: 8463:        if(uj_saAbort)
P372: 8464:          {
P373: 8465:           if(uj_saA == g_anchorLine && uj_saD == (int)g_dir && uj_saT == g_anchorBarTime)
P374: 8466:             {
P375: 8467:              if(InpDebugLog) PrintFormat("[SRJ-EA] UJDEFERAPPLY bar=%s dir=%s poi=%s - deferred LTF abort applies, holder unchanged (Fix S-a)", TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES), DirName(g_dir), AnchorStr());
P376: 8468:              GoAbort(ABORT_LTF_MISALIGN, g_state);
P377: 8469:              return;
P378: 8470:             }
P379: 8471:           else
P380: 8472:             {
P381: 8473:              if(InpDebugLog) PrintFormat("[SRJ-EA] UJDEFERDROP bar=%s dir=%s poi=%s - deferred LTF abort dropped, holder changed (Fix S-a)", TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES), DirName(g_dir), AnchorStr());
P382: 8474:             }
P383: 8475:           uj_saAbort = false;
P384: 8476:          }
P385: ```
P386: 
P387: EA source lines 7991-8043 (SUPPRESSED census is diagnostic; it is not the IDLE seed gate):
P388: ```mql5
P389: 7991:    //--- [Task 73 / Stage 3 cost side] Suppression census. DIAGNOSTIC ONLY.
P390: 7992:    //--- Two unmeasured quantities, both needed before Stage 3 is sized:
P391: 7993:    //---   1. The singleton discards every POI retest that arrives while a
P392: 7994:    //---      sequence is alive. 103 candidates were ADMITTED across this
P393: 7995:    //---      window; how many were silently dropped is unknown, and Stage 3
P394: 7996:    //---      lengthens candidate lifetime, so it raises that number.
P395: 7997:    //---   2. Part A carries a rule the EA does not implement - an
P396: 7998:    //---      opposite-direction HIGHER-TIER retest replaces the candidate.
P397: 7999:    //---      Its frequency has never been counted.
P398: 8000:    //---
P399: 8001:    //--- DetectPoiRetest is read-only: it fills a caller-owned struct from the
P400: 8002:    //--- 12 POI buffers and mutates no sequence state. It is called here on the
P401: 8003:    //--- SAME barShift the live cascade uses, so a hit is exactly a retest the
P402: 8004:    //--- IDLE block would have consumed had the singleton been free.
P403: 8005:    //---
P404: 8006:    //--- Tier comparison uses g_authorityRank (lower is more authoritative),
P405: 8007:    //--- the same ranking D-3 and G-2 already use. No distance, no size, no bar
P406: 8008:    //--- count, no tolerance - Part A section 7 is not engaged.
P407: 8009:    //---
P408: 8010:    //--- Gated on InpDebugLog. Assigns nothing outside its own statics, reads
P409: 8011:    //--- g_state / g_dir / g_anchorLine for labelling only, and cannot alter
P410: 8012:    //--- control flow. R8 is NOT engaged.
P411: 8013:    if(InpDebugLog && inWindow &&
P412: 8014:       g_state > ST_IDLE && g_state != ST_ABORT && g_anchorLine >= 0)
P413: 8015:      {
P414: 8016:       static int s_t73_n      = 0;
P415: 8017:       static int s_t73_higher = 0;
P416: 8018:       static int s_t73_opp    = 0;
P417: 8019:       static int s_t73_both   = 0;
P418: 8020:       static int s_t73_bars   = 0;
P419: 8021:       s_t73_bars++;
P420: 8022:       PoiRetestResult t73_pr;
P421: 8023:       if(DetectPoiRetest(barShift, t73_pr) && t73_pr.found)
P422: 8024:         {
P423: 8025:          s_t73_n++;
P424: 8026:          ENUM_SRJ_DIR t73_dir    = t73_pr.isLong ? DIR_LONG : DIR_SHORT;
P425: 8027:          bool         t73_isOpp  = (t73_dir != g_dir);
P426: 8028:          bool         t73_isHigh = (g_authorityRank[t73_pr.topLine] <
P427: 8029:                                     g_authorityRank[g_anchorLine]);
P428: 8030:          if(t73_isHigh)               s_t73_higher++;
P429: 8031:          if(t73_isOpp)                s_t73_opp++;
P430: 8032:          if(t73_isOpp && t73_isHigh)  s_t73_both++;
P431: 8033:          PrintFormat("[SRJ-EA] SUPPRESSED bar=%s poi=%s dir=%s opp=%d higher=%d "
P432: 8034:                      "heldPoi=%s heldDir=%s heldState=%s "
P433: 8035:                      "cum_n=%d cum_opp=%d cum_hi=%d cum_both=%d action=%s",
P434: 8036:                      TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift),
P435: 8037:                                   TIME_DATE|TIME_MINUTES),
P436: 8038:                      g_lineCode[t73_pr.topLine], DirName(t73_dir),
P437: 8039:                      (int)t73_isOpp, (int)t73_isHigh,
P438: 8040:                      g_lineCode[g_anchorLine], DirName(g_dir), StateName(g_state),
P439: 8041:                      s_t73_n, s_t73_opp, s_t73_higher, s_t73_both,
P440: 8042:                      b3_superseded ? "SUPERSEDED" : "HELD");
P441: 8043:         }
P442: ```
P443: 
P444: EA source lines 103-104 (Daily-POC ranks ahead of Daily-VWAP):
P445: ```mql5
P446: 103:    g_authorityRank[POI_BUF_D_POC]  = 10;  g_lineCode[POI_BUF_D_POC]  = "Daily-POC";
P447: 104:    g_authorityRank[POI_BUF_D_VWAP] = 11;  g_lineCode[POI_BUF_D_VWAP] = "Daily-VWAP";
P448: ```
P449: 
P450: EA source lines 2115-2125 (retest election selects the best-ranked valid long/short line):
P451: ```mql5
P452: 2115:        if(l <= L - P + EPS && bodyLo >= L - EPS)
P453: 2116:         { int rk = g_authorityRank[k]; if(rk < bestLongRank) { bestLongRank = rk; bestLongLine = k; } }
P454: 2117:       if(h >= L + P - EPS && bodyHi <= L + EPS)
P455: 2118:         { int rk = g_authorityRank[k]; if(rk < bestShortRank) { bestShortRank = rk; bestShortLine = k; } }
P456: 2119:      }
P457: 2120:     if(bestLongLine < 0 && bestShortLine < 0)
P458: 2121:       { g_n1_entryWickInv += n1e_nW; g_n1_entryBodyInv += n1e_nB; return false; }
P459: 2122:     if(bestLongLine >= 0 && (bestShortLine < 0 || bestLongRank <= bestShortRank))
P460: 2123:       { r.found = true; r.isLong = true;  r.topLine = bestLongLine; }
P461: 2124:      else
P462: 2125:        { r.found = true; r.isLong = false; r.topLine = bestShortLine; }
P463: ```
P464: 
P465: EA source lines 349-352 (reset marks the managed trade inactive):
P466: ```mql5
P467: 349: void MtReset()
P468: 350:   {
P469: 351:    g_mtrade.active            = false;
P470: 352:    g_mtrade.state             = MT_INACTIVE;
P471: ```
P472: 
P473: EA source lines 10702-10704 (managed-trade active is set on fill):
P474: ```mql5
P475: 10702:       g_mtrade.active            = true;
P476: 10703:       g_mtrade.state             = MT_MANAGING;
P477: 10704:       g_mtrade.dir               = g_dir;
P478: ```
P479: 
P480: ## 7 - RECON78 source rows (physical journal lines; rows are evidence, not a future outcome)
P481: 
P482: Journal source rows (SEG is the physical, 1-indexed journal line):
P483: ```text
P484: SEG 13085: HK	0	16:41:34.132	Core 04	2026.06.05 09:45:00   [SRJ-EA] 2026.06.05 09:45:00 SIGNAL dir=SHORT poi=Daily-POC regime=TREND div=hidden sess=LONDON tp_target=159.900 tp_R=2.00 sl_ref=159.972 sl_mode=2-swing spreadPts=3 bid=159.948 ask=159.951
P485: SEG 13097: OF	0	16:41:34.132	Core 04	2026.06.05 09:45:00   deal #4 sell 6.74 USDJPY at 159.948 done (based on order #4)
P486: SEG 13393: QO	0	16:42:10.830	Core 04	2026.06.05 12:05:00   [SRJ-EA] UJRETARGET bar=2026.06.05 12:00 dir=SHORT old=159.900 sess=1 tp=159.908 seq=2 admit=2026.06.05 09:40 - session-close retarget (Fix R)
P487: SEG 13417: NN	0	16:42:10.830	Core 04	2026.06.05 12:15:00   [SRJ-EA] MTEXIT bar=2026.06.05 12:10 reason=TP_TOUCH line=- lineVal=- entry=159.948 exit=159.908
P488: SEG 13418: FD	0	16:42:10.830	Core 04	2026.06.05 12:15:00   [SRJ-EA] MTLIFE fields=11 openBar=2026.06.05 09:45 dir=SHORT entry=159.948 sl=159.972 tp=159.908 verdict=TP_TOUCH closeBar=2026.06.05 12:10 closePx=159.908 openAtNewsStart=0 openAtDayClose=0 openAtWeekClose=0
P489: SEG 13419: CJ	0	16:42:10.830	Core 04	2026.06.05 12:15:00   [SRJ-EA] ALERT SRJ EXIT NONE USDJPY M5 | - | NONE | TP_TOUCH at 159.908 (entry 159.948)
P490: SEG 13420: IH	0	16:42:10.830	Core 04	2026.06.05 12:19:21   take profit triggered #4 sell 6.74 USDJPY 159.948 sl: 159.972 tp: 159.900 [#5 buy 6.74 USDJPY at 159.900]
P491: SEG 13421: OJ	0	16:42:10.830	Core 04	2026.06.05 12:19:21   deal #5 buy 6.74 USDJPY at 159.900 done (based on order #5)
P492: SEG 14047: MQ	0	16:43:24.215	Core 04	2026.06.05 16:55:00   [SRJ-EA] 2026.06.05 16:55:00 SIGNAL dir=LONG poi=Daily-POC regime=TREND div=regular sess=NYAM tp_target=160.723 tp_R=1.56 sl_ref=159.726 sl_mode=1-swing spreadPts=5 bid=160.115 ask=160.120
P493: SEG 14057: LR	0	16:43:24.215	Core 04	2026.06.05 16:55:00   [SRJ-EA] PRE-SEND lots=0.41 entry=160.120 slPts=394 tpPts=603 stopsLevel=0 freezeLevel=0 spreadPts=5
P494: SEG 14058: OS	0	16:43:24.215	Core 04	2026.06.05 16:55:00   market buy 0.41 USDJPY sl: 159.726 tp: 160.723 (160.115 / 160.120)
P495: SEG 14059: CQ	0	16:43:24.215	Core 04	2026.06.05 16:55:00   deal #6 buy 0.41 USDJPY at 160.120 done (based on order #6)
P496: SEG 14331: MS	0	16:44:00.911	Core 04	2026.06.05 19:05:01   [SRJ-EA] UJRETARGET bar=2026.06.05 19:00 dir=LONG old=160.723 sess=2 tp=160.298 seq=3 admit=2026.06.05 16:50 - session-close retarget (Fix R)
P497: SEG 14354: GF	0	16:44:07.028	Core 04	2026.06.05 19:20:01   [SRJ-EA] MTEXIT bar=2026.06.05 19:15 reason=TP_TOUCH line=- lineVal=- entry=160.115 exit=160.298
P498: SEG 15006: KP	0	16:47:53.340	Core 04	2026.06.08 09:30:00   [SRJ-EA] UJPROV bar=2026.06.08 09:25 dir=SHORT reseedBar=1970.01.01 00:00 seedBiasAl=0 reseedDir=0 exempt=0 - reseed provenance at S2 edge (Fix CARRY)
P499: SEG 15007: HP	0	16:47:53.340	Core 04	2026.06.08 09:30:00   [SRJ-EA] S2SEEDBIAS_KILL bar=2026.06.08 09:25 dir=SHORT poi=Weekly-POC - seedbias refused, promotion killed (Fix B2)
P500: SEG 16565: GR	0	16:54:24.798	Core 04	2026.06.09 09:55:00   [SRJ-EA] UJPROV bar=2026.06.09 09:50 dir=SHORT reseedBar=1970.01.01 00:00 seedBiasAl=0 reseedDir=0 exempt=0 - reseed provenance at S2 edge (Fix CARRY)
P501: SEG 16566: HJ	0	16:54:24.798	Core 04	2026.06.09 09:55:00   [SRJ-EA] S2SEEDBIAS_KILL bar=2026.06.09 09:50 dir=SHORT poi=Weekly-VWAP - seedbias refused, promotion killed (Fix B2)
P502: SEG 22629: CS	0	17:08:16.498	Core 04	2026.06.11 14:40:22   [SRJ-EA] LTFFLIP bar=2026.06.11 14:35 dir=SHORT poi=Daily-POC state=S4_ARMED - LTF bias turned against the locked direction
P503: SEG 22631: QN	0	17:08:16.498	Core 04	2026.06.11 14:40:22   [SRJ-EA] UJDEFERABORT bar=2026.06.11 14:35 dir=SHORT poi=Daily-POC state=S4_ARMED - LTF opposed, abort deferred past evaluation (Fix S-a)
P504: SEG 22652: PL	0	17:08:16.498	Core 04	2026.06.11 14:40:22   [SRJ-EA] SIDE1H_WOULDPREEMPT bar=2026.06.11 14:35 newPoi=Daily-POC newDir=LONG heldPoi=Daily-POC heldDir=SHORT heldState=S4_ARMED newTier=5 heldTier=5 wouldPreempt=0 wouldTierPassLegacy=0
P505: SEG 22654: RO	0	17:08:16.498	Core 04	2026.06.11 14:40:22   [SRJ-EA] SUPPRESSED bar=2026.06.11 14:35 poi=Daily-POC dir=LONG opp=1 higher=0 heldPoi=Daily-POC heldDir=SHORT heldState=S4_ARMED cum_n=79 cum_opp=19 cum_hi=7 cum_both=4 action=HELD
P506: SEG 22655: GL	0	17:08:16.498	Core 04	2026.06.11 14:40:22   [SRJ-EA] RETESTBOOK bar=2026.06.11 14:35 hits=2 Daily-POC:r10:dL Daily-VWAP:r11:dL
P507: SEG 22658: CQ	0	17:08:16.498	Core 04	2026.06.11 14:40:22   [SRJ-EA] CONFIRMPOLL bar=2026.06.11 14:35 anchor=Daily-POC dir=SHORT oppCandle=0 bodyDir=0 body=3pts doji=0 touchAttr=1 confirm=0 shadow=true
P508: SEG 22661: CQ	0	17:08:16.498	Core 04	2026.06.11 14:40:22   [SRJ-EA] UJDEFERAPPLY bar=2026.06.11 14:35 dir=SHORT poi=Daily-POC - deferred LTF abort applies, holder unchanged (Fix S-a)
P509: SEG 22664: JF	0	17:08:16.498	Core 04	2026.06.11 14:40:22   [SRJ-EA] ALERT SRJ STAND-DOWN SHORT USDJPY M5 | Daily-POC | NYAM | reason=LTF_MISALIGN
P510: SEG 24023: QG	0	17:10:18.795	Core 04	2026.06.11 22:30:51   stop loss triggered #6 buy 0.41 USDJPY 160.120 sl: 159.726 tp: 160.723 [#7 sell 0.41 USDJPY at 159.726]
P511: SEG 24024: JG	0	17:10:18.795	Core 04	2026.06.11 22:30:51   deal #7 sell 0.41 USDJPY at 159.725 done (based on order #7)
P512: ```
P513: 
P514: ## 8 - Historical V7 review boundaries (superseded by section 9)
P515: 
P516: Review only this complete page. Give one verdict for Q1 and Q3, answer A and B for each, cite physical P-lines, identify every remaining defect/condition, and close each question separately. Q2 is closed by both required seats and is not re-asked. Distinguish settled operator rules from implementation recommendations and future acceptance predicates. Do not claim unobserved outcomes or rely on unspliced source behavior. This review authorizes no source edit, build, tester run, live trade, Luna key, operator run word, commit, or push. The prior run authorization is consumed.
P517: ## 9 - V8 operative design and council questions
P518: 
P519: ### 9.1 Decision scope
P520: 
P521: Review this section together with the complete baseline and source evidence above. It replaces the V7 Q1/Q3 proposal and answer asks. Give one current verdict for Q1 and Q3; answer A and B for each; close each separately; identify any condition that is not met by this page. Do not reopen Q2. No seat is asked to authorize code, a build, a tester run, or live use.
P522: 
P523: ### 9.2 Q1 proposed design: position-instance manager plus exact broker TP synchronization
P524: 
P525: **The singleton replacement is part of the defect, not a safe assumption.** Current EA lines 10641-10656 explicitly replace the one `g_mtrade` record on a later signal, and line 10656 calls `MtReset`; the same file has one `MtReset` call site plus its definition. The strategy record says London and New York are independent. Therefore v8 does not rely on per-target fields inside the replaceable singleton, nor on an argument that the retry window is practically empty.
P526: 
P527: **Recommendation:** replace the single managed-position slot with an instance collection keyed by broker `POSITION_IDENTIFIER` plus SRJ trade sequence and admission bar. Each filled position owns its full management snapshot, entry ticket, pair, direction, session/magic, SL, current booked TP, target revision, model state, and sync state. Filling a later London/NY trade adds an instance; it never resets or overwrites another open instance. `MtReset` becomes slot-local and can retire a slot only after that PID is absent and its closing deal has been resolved. Evaluate every active instance once per closed M5 bar. This is a design requirement to preserve both positions and their retries; the packet does not claim the collection exists.
P528: 
P529: For each instance, the retarget site updates that instance's model target, increments its target revision, resets that revision's attempt counter, emits `UJRETARGET`, and makes the immediate broker call attempt 1 before `tpBookedTouch` evaluation. The retry host runs once per evaluated M5 bar for each still-open instance, before any model-state early return, including while the model is waiting for broker exit. If the host already ran earlier on the same bar for the prior revision, the revision-keyed bar guard still permits attempt 1 for the newly retargeted value; there is at most one modify call per bar per revision and three calls total per revision. A readback-only lag is not a second call in the same bar. A successful target revision is latched; emit one `UJTPMODIFY_SKIP` when already equal and no repeated per-bar skip noise.
P530: 
P531: The helper is execute-mode only. In `MODE_ALERT_ONLY`, or before a filled broker position resolves to the instance, it emits `UJTPMODIFY_NOPOS`/paper-only disposition, consumes no attempt, and does not claim broker synchronization. No market close is sent on modify failure. Resolve a live ticket by enumerating positions and matching PID, symbol, and expected session magic, then reselect and verify the ticket/PID before modification. Use ticket overload, never the symbol overload. Read the live SL immediately before modification; pass that exact SL (including 0.0 when there is no SL), and require normalized readback SL to equal the pre-call SL.
P532: 
P533: `PositionModify` is a `CTrade` method. Official MQL5 documentation says its Boolean return reports basic request-structure checks and requires checking `ResultRetcode`; the ticket overload targets a ticket, while the symbol overload in hedging accounts can select the lowest-ticket position. The EA has one `CTrade g_trade` declaration, two `SetTypeFilling` calls, no `PositionModify` call, and no `SetAsyncMode` call. The build packet must explicitly verify the deployed object's async configuration and the account's netting/hedging mode before relying on readback timing or identity behavior. References: `https://www.mql5.com/en/docs/standardlibrary/tradeclasses/ctrade/ctradepositionmodify` and `https://www.mql5.com/en/docs/constants/errorswarnings/enum_trade_return_codes`.
P534: 
P535: A modify is CONFIRMED only if the method returns true, `ResultRetcode()==TRADE_RETCODE_DONE (10009)`, the same PID/ticket remains selected, normalized TP readback equals the target revision, and normalized SL readback equals the pre-call SL. `NO_CHANGES (10025)` or an already-equal TP is `SKIP`, consumes no call, and is not counted as a modify. Retcode proposal, to be encoded as a closed table: retryable `REQUOTE (10004)`, `PRICE_CHANGED (10020)`, `TIMEOUT (10012)`, `CONNECTION (10031)`, `TOO_MANY_REQUESTS (10024)`, `MARKET_CLOSED (10018)`; immediate terminal FAIL `INVALID (10013)`, `ERROR (10011)`, `INVALID_PRICE (10015)`, `INVALID_STOPS (10016)`, `TRADE_DISABLED (10017)`, `LOCKED (10028)`, `FROZEN (10029)`. `POSITION_CLOSED (10036)` routes to broker-exit resolution. Every other retcode consumes one of the three calls and cannot retry past the cap. These are proposed classifications, not claimed facts about broker behavior; the build packet must preserve the raw code and re-verify each symbolic code against the current MQL5 table.
P536: 
P537: Before sending a modify, compare the current executable side against the normalized target: Bid for LONG TP and Ask for SHORT TP. If price has already passed the proposed target, do not submit a stale stop level; emit terminal `UJTPMODIFY_FAIL reason=TARGET_PASSED`, keep broker SL/TP authoritative, mark acceptance failed, and retain the live instance until broker exit. This avoids spending retries on a target that can no longer meet exact-price acceptance.
P538: 
P539: **TP_TOUCH never substitutes for the broker deal.** In MODE_EXECUTE, if the revised model target is touched while sync is PENDING, terminal FAIL, or CONFIRMED, do not set the managed instance to broker-closed and do not emit ordinary `MTEXIT`, `MTLIFE`, or `ALERT EXIT TP_TOUCH` as if execution occurred. Emit `UJTPTOUCH_UNSYNCED` (when not yet confirmed) or `UJTPTOUCH_MODEL_ONLY` (when confirmed) with PID, ticket, state, target, attempts, and live broker TP; retain the instance in `EXIT_PENDING_BROKER`, keep the retry host alive, and leave broker SL/TP in control. No market close. Emit distinct operator alert `EXIT-UNSYNCED` only once per instance/target revision; it identifies the live broker TP and cannot say the revised target filled. In MODE_ALERT_ONLY, keep the existing paper-model touch exit and clearly mark the row/alert `mode=ALERT_ONLY`; no broker fill is implied. A no-position/pending-fill row consumes no attempt.
P540: 
P541: Resolve actual close by polling each outstanding PID in the M5 host. If the PID is gone, select its position history (`HistorySelectByPosition`) and scan deals for that PID, entry direction, closing `DEAL_ENTRY_OUT`, `DEAL_REASON_TP` or SL, deal ticket, timestamp, price, and volume. Emit `UJTPBROKEREXIT` only when the actual closing deal is identified; otherwise retain `EXIT_PENDING_BROKER`, emit `UJORPHAN`/`UJTPEXIT_PENDING`, and do not silently retire the instance. The official deal properties define `DEAL_POSITION_ID`, `DEAL_ENTRY`, `DEAL_REASON`, `DEAL_PRICE`, and `DEAL_VOLUME`; partial closes do not satisfy full-position acceptance. Reference: `https://www.mql5.com/en/docs/constants/tradingconstants/dealproperties` and `https://www.mql5.com/en/docs/trading/historyselectbyposition`.
P542: 
P543: Every retarget/modify/skip/fail/touch/exit row is unconditional and carries: pair, session, trade sequence, admission bar, PID, current ticket, target revision, original TP, revised target, attempt/cap, sync/model state, raw method Boolean, raw retcode, readback TP and SL, pre-call SL, live volume, and reason. `UJRETARGET` must not be debug-only for acceptance. Modify-call counters exclude skip and no-position events. Synchronized rows should not repeat every bar.
P544: 
P545: O6 is applied before candidate seed at EA 8072 and rechecked before any `LogSignal`, `A6Fired`, or `EmitAlert(SIGNAL)` side effect (currently EA 10618-10625). Both gates use the local `sess` to map the correct magic, inspect all open positions for this symbol/session, include older positions, and emit a named `UJPOSITION_BLOCKED`/`ABORT_CONCURRENCY` row. A blocked candidate emits no SIGNAL or A6Fired row and does not call `MarkSessionUsed`; London does not block NY. The second gate must run before EA 10618, not just before the alert at 10625. In alert-only mode the broker-position gate is inert, but the instance manager still prevents record replacement and maintains one-take-per-session accounting.
P546: 
P547: **Q1 Ask A:** Is this complete and internally consistent as a design for (1) multi-instance management, (2) execute-only broker modification, (3) exact per-revision retry and retcode behavior, (4) model-touch/open-broker lifecycle, (5) broker exit proof, and (6) both pre-seed/pre-signal O6 gates? Name any remaining source site or state-transition defect. Verify the official method and retcode references cited here; do not treat a Boolean success alone as execution.
P548: 
P549: **Q1 Ask B:** Is future acceptance exact and sufficient for both June 5 instances independently? Require unconditional instance-labeled rows; a successful modify and exact normalized TP/SL readback; unchanged SL; and a full closing broker TP deal for the same PID at the revised target exactly, with no gap/slippage leniency. A deal at the old target, SL, or any other price fails. The model touch bar need not equal the broker-deal bar. Skip events are excluded from call counts. Also require a classified diff of every admission, signal, abort, and deal after June 5 19:15 against baseline, since earlier NY broker exit can change June 8-11 behavior. Preserve the separate exact observations 160.115 model entry and 160.120 Ask/deal; the operator-set 160.524 cannot be relabeled as Ask or relaxed. One-tick stop execution 159.725 vs 159.726 is not TP tolerance.
P550: 
P551: ### 9.3 Q3 proposed design: preserve holder order, then run the fresh candidate pipeline once
P552: 
P553: The strategy record `.opencode/skills/srj-strategy/SKILL.md` section 117 already settles the tie: a flip-killed holder never vetoes a challenger; the same-bar flip-plus-confirm tie is unexercised and keeps current order. The 5m kill is pre-confirmation only (section 116). The June 11 baseline has `UJDEFERABORT`, `SUPPRESSED action=HELD`, RETESTBOOK hits=2, and a SHORT-only shadow CONFIRMPOLL with `confirm=0`; it has no `UJSBTELEM` row and proves neither a LONG confirm nor a June 11 outcome.
P554: 
P555: **Do not consume the abort before the holder current-order evaluation.** Split the per-bar flow into an incumbent phase and an outer resolver. The incumbent phase preserves the current evaluation, including contender confirmation/yield and all existing early-return behavior, and returns its outcome to the resolver instead of returning from the whole per-bar function. The resolver always handles a matching pending `uj_saAbort` after the incumbent phase, including when an internal early-return path ran. The measured range EA 7457-8069 contains four returns (7578, 7580, 7601, 7621); the implementation packet must census every return in the full extracted phase and prove none can bypass resolution. The RECON78 June 11 baseline reaches the old `UJDEFERAPPLY` row at the existing EA 8462-8476 site, proving that the four earlier returns did not fire on the target pass. Keep holder evaluation and its current same-bar tie order first. If the abort still matches the holder identity, print `UJDEFERCONSUME` with old holder identity, call `GoAbort(ABORT_LTF_MISALIGN)` unless that exact holder was already reset by its existing terminal path, clear `uj_saAbort`, `uj_saA/D/T`, and invalidate stale `uj_memo_*`; preserve the diagnostic shadow/STAND-DOWN. Then invoke the extracted candidate pipeline once on the same `barShift`, `barTime`, and local `sess`: it owns the normal seed-and-candidate path from EA 8070-8429, its candidate-specific contender evaluation at EA 8430-8461, and candidate continuation from EA 8478 through the signal/admission boundary at EA 10625. It excludes only the outer incumbent deferred-abort resolver at EA 8462-8476, which the wrapper already handled. The normal IDLE path calls this same extracted unit, including its contender evaluation once. It uses normal `DetectPoiRetest`, confirmation, session/seed/1R gates, O6 checks, and signal/admission rules. It carries no S4 state, zone, latch, confirmation, or entry plan. After this one candidate-pipeline call, the outer resolver returns; it does not fall through and evaluate the fresh candidate again in the old outer tail. This is not recursive `EvaluatePerBar` and does not repeat bar-wide prepass work or incumbent evaluation.
P556: 
P557: If the incumbent's existing contender evaluation yields to a confirmed opposite candidate before deferred-abort application, retain the existing `SIDE1C_YIELD` result and do not also consume/reseed. The pending abort no longer matches the rebound holder; emit exactly one `UJDEFERDROP reason=HOLDER_YIELDED` and clear it. This is the current-order same-bar tie behavior. If that evaluation does not yield, the matching flip-killed holder is aborted and the freed slot may run a fresh challenger pipeline on the same evaluated bar. A matching abort cannot survive into the fresh seed; a nonmatching stale abort follows the explicitly logged drop path. The release runs before O6's same-session broker-position gate; an existing open same-session position blocks the seed after the holder kill, which is the correct combined outcome.
P558: 
P559: The incumbent candidate flow and fresh challenger flow are each evaluated once for their own identity. The prepass suppression census and read-only shadow poll run once; when a matching abort is pending, `SUPPRESSED` must not print a false `action=HELD` for the challenger that is about to receive the free slot. Candidate counters (`r2_evals`, S1F/S1G/S1C counters and any other static/bar counts) are scoped by `(barTime, phase, candidate identity)` so the incumbent and challenger are each counted once without duplicating a bar-wide total. The consume path returns after the fresh candidate pipeline, so the old outer S3/S4 and signal tail cannot evaluate it again. Preserve normal POC-over-VWAP ranking and no reseed provenance/exemption. The implementation packet must provide an exhaustive `g_mtrade` read/write migration map and counter census; no legacy singleton reference may be silently left behind.
P560: 
P561: This design is conditional on the 14:35 LONG actually passing normal confirmation. The source must show the full `IsConfirmationCandle` implementation and the normal seed path. The 14:35 SHORT holder shadow `confirm=0` is not evidence for the LONG's normal result. Add the missing June 11 `UJSBTELEM` and normal-path confirm diagnostics to future acceptance; if the seed confirmation evaluates false, the expected outcome is no 14:40 signal and the confirmation cause is a separate defect, not something the release hook can waive.
P562: 
P563: **Q3 Ask A:** Does the staged state map preserve (1) current holder evaluation and SIDE1C_YIELD precedence, (2) pre-confirmation 5m flip kill, (3) holder reset and fresh normal seed, (4) same-pass once-only counters and no duplicate stage evaluation, (5) shadow/STAND-DOWN, (6) O6 ordering/local session scope, and (7) POC-over-VWAP ranking? Identify any missing clear/write/return or a safer concrete map. Check against the full source excerpts in section 10.
P564: 
P565: **Q3 Ask B:** Is this future-only acceptance gradeable? (i) Q1's same-session NY position has actual broker-close at exact 160.298 before June 11, otherwise O6 correctly blocks; (ii) source/journal prove 14:35 LONG Daily-POC retest and normal confirmation pass, with `UJSBTELEM` and normal confirm evidence; (iii) one registered LONG SIGNAL and actual deal at exactly operator-set 14:40 open 160.524, no spread tolerance and no relabeling to Ask; EA reads Ask for LONG, so if actual Ask/deal differs from 160.524 this predicate fails; (iv) no 14:45+ selection; (v) June 8 invalid SHORT remains silent for the 5m-flip reason, distinct from its baseline `S2SEEDBIAS_KILL`; (vi) 6/9 09:50 Weekly-VWAP remains refused without a reseed exemption; (vii) June 5 London 09:45 remains correct; (viii) exactly one accepted June 11 NY take for this registered pair/session/date/anchor/direction instance; (ix) the abort-consume path emits one `UJDEFERABORT`, one `UJDEFERCONSUME`, and one STAND-DOWN, with no `UJDEFERAPPLY` or false `SUPPRESSED action=HELD`; the SIDE1C_YIELD path instead records its yield and exactly one `UJDEFERDROP`, with no consume; (x) scoped counts of `UJDEFERAPPLY`, `UJDEFERDROP`, `SIDE1C_YIELD`, and `UJDEFERCONSUME` reconcile to the chosen branch; (xi) classified same-bar counter census proves no duplicate work. These are future-run predicates only. The prior run authorization is consumed.
P566: 
P567: ### 9.4 V395 finding crosswalk and reply form
P568: 
P569: The following V395 findings are dispositions for this page, not claims that code has been changed:
P570: 
P571: - Sonnet Q1 items 1-3 and GLM C1-C4: ADOPTED by position-instance collection, per-instance lifecycle, revision-scoped attempts, and pre-side-effect gates.
P572: - Sonnet Q1 item 4 and GLM C6/C11/C12/S1: ADOPTED by pending-broker-exit state, distinct touch rows/alert, continued retry, and PID-matched closing-deal resolution; full TP-touch and exit source is appended.
P573: - Sonnet Q1 items 5-7 and GLM C5/C8-C10/S2: ADOPTED by named retcode table, normalized TP/SL readback, 0-SL preservation, idempotent skip, three-call cap, and MQL docs citations. Anything beyond the closed retcode table consumes the finite cap.
P574: - Sonnet Q1 item 8 and GLM Ask B: ADOPTED by unconditional full-identity rows, exact deal acceptance, same-session later-event diff, and explicit treatment of the Ask/open conflict and stop execution.
P575: - GLM C7 plus Sonnet gate-side-effect finding: ADOPTED by using local session magic at both gates and placing pre-signal check before `LogSignal`/`A6Fired`; blocked candidates do not consume the session.
P576: - Sonnet Q3 item 1 and GLM D1/D7: ADOPTED by holding the existing current-order contender evaluation before abort consumption; section 117 already rules the flip/confirm tie, so no operator question is opened.
P577: - Sonnet Q3 items 2-4 and GLM D2-D6/D8-D9: ADOPTED by same-bar candidate pipeline extraction, full source spans, missing telemetry callout, explicit stale-state clearing, shadow preservation, once-only counters, and a named consume row.
P578: - Sonnet Q3 item 5 and GLM O6 comments: ADOPTED by local-session gate mapping and release-before-gate ordering.
P579: - Sonnet Q3 item 6 and GLM Q3 Ask B: ADOPTED by binding exact 160.524, naming the Ask mismatch as a fail condition, preserving no-tolerance, and requiring instance-scoped future evidence.
P580: - GLM D10: ADOPTED by keeping one-take accounting session/day scoped; no global run-wide count is used.
P581: 
P582: Seat answer form: quote one verdict per Q1 and Q3 (`CONFIRM`, `OBJECT`, or `DISCREPANCY`); answer A and B separately; give exact physical P-line citations; list each remaining defect/condition with its disposition; state whether Q2 remains closed; close each question. Do not infer that any proposed helper, instance collection, hook, telemetry row, broker exit, or June 11 outcome already exists. No build/run/source/key/live/commit/push authority is requested or granted.
P583: 
P584: ### 9.5 Official source references
P585: 
P586: - MQL5 `CTrade::PositionModify`: `https://www.mql5.com/en/docs/standardlibrary/tradeclasses/ctrade/ctradepositionmodify`
P587: - MQL5 trade-server return codes: `https://www.mql5.com/en/docs/constants/errorswarnings/enum_trade_return_codes`
P588: - MQL5 deal properties: `https://www.mql5.com/en/docs/constants/tradingconstants/dealproperties`
P589: - MQL5 `HistorySelectByPosition`: `https://www.mql5.com/en/docs/trading/historyselectbyposition`
P590: 
P591: ## 10 - Additional exact source exhibits for V8
P592: 
P593: Current source identity remains the EA digest stated in section 6. The excerpts below are mechanically numbered from the current saved EA. Non-ASCII or ellipsis-bearing comment-only lines are omitted and listed after their affected excerpt; every executable line in each named continuous range is present. No omitted source line is used to support behavior.
P594: 
P595: ### Q1 reset body - source lines 349-378
P596: 
P597: ```mql5
P598: 349: void MtReset()
P599: 350:   {
P600: 351:    g_mtrade.active            = false;
P601: 352:    g_mtrade.state             = MT_INACTIVE;
P602: 353:    g_mtrade.dir               = DIR_NONE;
P603: 354:    g_mtrade.anchorLine        = -1;
P604: 355:    g_mtrade.anchorPrice0      = 0.0;
P605: 356:    g_mtrade.anchorBarTime     = 0;
P606: 357:    g_mtrade.sessionAtEntry    = -1;
P607: 358:    g_mtrade.entryPrice        = 0.0;
P608: 359:    g_mtrade.slRef             = 0.0;
P609: 360:    g_mtrade.tpRef             = 0.0;
P610: 361:    g_mtrade.regimeAtAdmission = 0;
P611: 362:    g_mtrade.fillBarTime       = 0;
P612: 363:    g_mtrade.signalBarTime     = 0;
P613: 364:    g_mtrade.exitReason        = MT_EXIT_NONE;
P614: 365:    g_mtrade.exitBarTime       = 0;
P615: 366:    g_mtrade.exitPrice         = 0.0;
P616: 367:    g_mtrade.ticket            = 0;
P617: 368:    g_mtrade.entryPid          = 0;
P618: 369:    //--- [P-UJIMPL-IMPL-1 v8 IE8] touch/admit reset rides the reset path;
P619: 370:    //--- the 10215 site repeats these assignments explicitly (memo untouched,
P620: 371:    //--- global uj_tradeSeqNext never reset).
P621: 372:    g_mtrade.uj_touchDone      = false;
P622: 373:    g_mtrade.uj_touchLevel     = 0.0;
P623: 374:    g_mtrade.uj_touchType      = "";
P624: 375:    g_mtrade.uj_touchBarTime   = 0;
P625: 376:    g_mtrade.uj_admitBarTime   = 0;
P626: 377:    g_mtrade.uj_tradeSeq       = 0;
P627: 378:   }
P628: ```
P629: 
P630: ### Q1 managed-record replacement - source lines 10641-10656
P631: 
P632: ```mql5
P633: 10641:       //--- DECLARED BOUNDARY: one managed record (the R-201 precedent). A second
P634: 10642:       //--- signal while one trade is managing logs MTCOLLISION and REPLACES the
P635: 10643:       //--- record (spec section 6's blessed London+NY exception would need a
P636: 10644:       //--- registry - a separate packet item if it ever fires).
P637: 10645:       if(g_mtrade.active && g_mtrade.state == MT_MANAGING)
P638: 10646:         {
P639: 10647:          if(InpDebugLog)
P640: 10648:             PrintFormat("[SRJ-EA] MTCOLLISION old bar=%s reason=REPLACED by bar=%s",
P641: 10649:                         TimeToString(g_mtrade.fillBarTime, TIME_DATE|TIME_MINUTES),
P642: 10650:                         TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift),
P643: 10651:                                      TIME_DATE|TIME_MINUTES));
P644: 10652:          g_mtrade.state      = MT_CLOSED;
P645: 10653:          g_mtrade.exitReason = MT_EXIT_REPLACED;
P646: 10654:          g_mtrade.exitBarTime = iTime(_Symbol, PERIOD_CURRENT, barShift);
P647: 10655:         }
P648: 10656:       MtReset();
P649: ```
P650: 
P651: ### Q1 pre-signal effects and alert - source lines 10608-10634
P652: 
P653: ```mql5
P654: 10608:             {
P655: 10609:              g_slext_lostN++;
P656: 10610:              g_slext_lostRows += TimeToString(ordFireT, TIME_DATE|TIME_MINUTES) + ";";
P657: 10611:              string psLine = StringFormat("[SRJ-EA] SLEXTLOST fields=6 bar=%s dir=%s ext1R=%.2f ext1RewardPts=%.5f ext1RiskPts=%.5f threshold=%.2f",
P658: 10612:                        TimeToString(ordFireT, TIME_DATE|TIME_MINUTES), DirName(g_dir),
P659: 10613:                        psR, g_slext_rewardPts, g_slext_riskPts, InpMinRewardRisk);
P660: 10614:              LwAudit("SLEXTLOST", psLine);
P661: 10615:              Print(psLine);
P662: 10616:             }
P663: 10617:          }
P664: 10618:         LogSignal(tpTarget, tpR, slRef, slMode, divKind);
P665: 10619:         if(InpDebugLog) A6Fired(barShift, tpTarget, tpR, slRef, slMode, divKind);   //--- [A6-HOOK] (ii)
P666: 10620:         if(InpDebugLog) PrintFormat("[SRJ-EA] SIDE1F_WATCH bar=%s dir=%s", TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES), DirName(g_dir));   //--- [SIDE1F] (iii) fire watch (read-only)
P667: 10621: 
P668: 10622:       if(!g_alertedSignal)
P669: 10623:         {
P670: 10624:          g_alertedSignal = true;
P671: 10625:          EmitAlert("SIGNAL",
P672: 10626:                    StringFormat("R=%.2f SL %s TP %s spr=%d",
P673: 10627:                                 tpR,
P674: 10628:                                 DoubleToString(slRef,    _Digits),
P675: 10629:                                 DoubleToString(tpTarget, _Digits),
P676: 10630:                                 (int)SymbolInfoInteger(_Symbol, SYMBOL_SPREAD)),
P677: 10631:                    true);
P678: 10632:         }
P679: 10633: 
P680: 10634:       //--- [P-EXITMODEL 2026-09-09, operator-issued packet] The section 5 exit phase
P681: ```
P682: 
P683: ### Q1 current TP resolver - source lines 11771-11785
P684: 
P685: ```mql5
P686: 11771:      {
P687: 11772:       ulong mtp_t = PositionGetTicket(mtp_i);
P688: 11773:       if(mtp_t == 0 || !PositionSelectByTicket(mtp_t)) continue;
P689: 11774:       if(PositionGetString(POSITION_SYMBOL) != _Symbol) continue;
P690: 11775:       if(PositionGetInteger(POSITION_IDENTIFIER) != pid) continue;
P691: 11776:       return mtp_t;
P692: 11777:      }
P693: 11778:    return 0;
P694: 11779:   }
P695: 11780: 
P696: 11781: 
P697: 11782: 
P698: 11783: //================= [P-EXITEXEC-1] broker close for the paper-only exit legs ========
P699: 11784: //--- Q2 (his COMBINE word): BREAK and DAY_CLOSE verdicts flipped paper state only
P700: 11785: //--- (ALERT-ONLY preserved, never an order), so the broker position lived on
P701: ```
P702: 
P703: ### Q1 current managed-trade host - source lines 11843-11850
P704: 
P705: ```mql5
P706: 11843: void EvaluateManagedTrade(const int barShift)
P707: 11844:   {
P708: 11845:    if(!g_mtrade.active) return;
P709: 11846:    if(g_mtrade.state != MT_MANAGING && g_mtrade.state != MT_PENDING_FILL) return;
P710: 11847: 
P711: 11848:    datetime barTime = iTime(_Symbol, PERIOD_CURRENT, barShift);
P712: 11849:    if(barTime < g_mtrade.fillBarTime) return;   // bars predating the fill are not ours
P713: 11850: 
P714: ```
P715: 
P716: ### Q1 retarget and TP touch - source lines 11913-11938
P717: 
P718: ```mql5
P719: 11913:     if(g_mtrade.tpRef != EMPTY_VALUE && g_mtrade.tpRef > 0.0)
P720: 11914:       {
P721: 11915:        double uj_rtPx = 0.0;
P722: 11916:        if(UjClosedSessionTarget(g_mtrade, barShift, uj_rtPx) && uj_rtPx > 0.0
P723: 11917:           && ((g_mtrade.dir == DIR_LONG && NormalizeDouble(uj_rtPx, _Digits) < NormalizeDouble(g_mtrade.tpRef, _Digits)) || (g_mtrade.dir == DIR_SHORT && NormalizeDouble(uj_rtPx, _Digits) > NormalizeDouble(g_mtrade.tpRef, _Digits))))
P724: 11918:          {
P725: 11919:           double uj_oldRef = g_mtrade.tpRef;
P726: 11920:           g_mtrade.tpRef = uj_rtPx;
P727: 11921:           if(InpDebugLog) PrintFormat("[SRJ-EA] UJRETARGET bar=%s dir=%s old=%s sess=%d tp=%s seq=%I64d admit=%s - session-close retarget (Fix R)", TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES), DirName(g_mtrade.dir), DoubleToString(uj_oldRef, _Digits), g_mtrade.sessionAtEntry, DoubleToString(g_mtrade.tpRef, _Digits), (long)g_mtrade.uj_tradeSeq, TimeToString(g_mtrade.uj_admitBarTime, TIME_DATE|TIME_MINUTES));
P728: 11922:          }
P729: 11923:        else if(InpDebugLog && uj_rtPx > 0.0) PrintFormat("[SRJ-EA] UJNORETARGET bar=%s dir=%s tp=%s rt=%s why=%s sess=%d seq=%I64d admit=%s - helper true but not tighter (Fix R)", TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES), DirName(g_mtrade.dir), DoubleToString(g_mtrade.tpRef, _Digits), DoubleToString(uj_rtPx, _Digits), (NormalizeDouble(uj_rtPx, _Digits) == NormalizeDouble(g_mtrade.tpRef, _Digits) ? "eq" : "loose"), g_mtrade.sessionAtEntry, (long)g_mtrade.uj_tradeSeq, TimeToString(g_mtrade.uj_admitBarTime, TIME_DATE|TIME_MINUTES)); // helper-true discriminator
P730: 11924:       }
P731: 11925:     bool tpBookedTouch = false;
P732: 11926:     if(g_mtrade.tpRef != EMPTY_VALUE && g_mtrade.tpRef > 0.0)
P733: 11927:       {
P734: 11928:        if(g_mtrade.dir == DIR_LONG  && h >= g_mtrade.tpRef) tpBookedTouch = true;
P735: 11929:        if(g_mtrade.dir == DIR_SHORT && l <= g_mtrade.tpRef) tpBookedTouch = true;
P736: 11930:       }
P737: 11931:     bool tpRecomputeTouch = false;
P738: 11932:     if(haveTp)
P739: 11933:       {
P740: 11934:        if(g_mtrade.dir == DIR_LONG  && h >= curTp) tpRecomputeTouch = true;
P741: 11935:        if(g_mtrade.dir == DIR_SHORT && l <= curTp) tpRecomputeTouch = true;
P742: 11936:       }
P743: 11937:     if(tpRecomputeTouch && !tpBookedTouch) g_n1_tpRecomputeSupp++;
P744: 11938:     if(tpBookedTouch) vTP = true;
P745: ```
P746: 
P747: ### Q1 model-close and alert - source lines 12034-12069
P748: 
P749: ```mql5
P750: 12034: if(!(vSL || vTP || vBREAK || vHTF || vDAY)) return;
P751: 12035: 
P752: 12036:    //--- close the trade (the priority order stated in the header)
P753: 12037:    g_mtrade.state       = MT_CLOSED;
P754: 12038:    g_mtrade.exitBarTime = barTime;
P755: 12039:    if(vSL)         { g_mtrade.exitReason = MT_EXIT_SL;             g_mtrade.exitPrice = g_mtrade.slRef; }
P756: 12040:     else if(vTP)    { g_mtrade.exitReason = MT_EXIT_TP_TOUCH;       g_mtrade.exitPrice = g_mtrade.tpRef; }
P757: 12041:    else if(vBREAK) { g_mtrade.exitReason = MT_EXIT_POI_BODY_BREAK; g_mtrade.exitPrice = nextOpenPx; }
P758: 12042:    else if(vHTF)   { g_mtrade.exitReason = MT_EXIT_HTF_FLIP;       g_mtrade.exitPrice = nextOpenPx; }
P759: 12043:    else if(vDAY)   { g_mtrade.exitReason = MT_EXIT_DAY_CLOSE;  g_mtrade.exitPrice = nextOpenPx; }
P760: 12044: 
P761: 12045:     PrintFormat("[SRJ-EA] MTEXIT bar=%s reason=%s line=%s lineVal=%s entry=%s exit=%s",
P762: 12046:                 TimeToString(barTime, TIME_DATE|TIME_MINUTES),
P763: 12047:                 MtExitName(g_mtrade.exitReason),
P764: 12048:                 (vBREAK ? breakLineName : "-"),
P765: 12049:                 (vBREAK ? DoubleToString(breakLineVal, _Digits) : "-"),
P766: 12050:                 DoubleToString(g_mtrade.entryPrice, _Digits),
P767: 12051:                 DoubleToString(g_mtrade.exitPrice, _Digits));
P768: 12052:     //--- [P-EXITEXEC-1 E7] execution legs: SL/TP broker-owned, HTF stays off,
P769: 12053:     //--- CANCEL_BIAS returned above - only the WINNING BREAK/DAY_CLOSE verdict closes.
P770: 12054:     //--- Price reference = g_mtrade.exitPrice (= nextOpenPx on the gated legs per EA 11290/11292); paper MTEXIT/MTLIFE/EXIT rows print regardless.
P771: 12055:     if(g_mtrade.exitReason == MT_EXIT_POI_BODY_BREAK || g_mtrade.exitReason == MT_EXIT_DAY_CLOSE)
P772: 12056:       {
P773: 12057:        int mtexecRc = MtCloseBrokerPosition(MtExitName(g_mtrade.exitReason), g_mtrade.exitPrice, barTime);
P774: 12058:        if(mtexecRc == 0)
P775: 12059:           PrintFormat("[SRJ-EA] MTCLOSE_FAIL bar=%s reason=%s entryTicket=%I64u entryPid=%I64d", TimeToString(barTime, TIME_DATE|TIME_MINUTES), MtExitName(g_mtrade.exitReason), g_mtrade.ticket, g_mtrade.entryPid);
P776: 12060:       }
P777: 12061:     if(InpDebugLog) MtLifeEmit();
P778: 12062:    EmitAlert("EXIT",
P779: 12063:              StringFormat("%s%s at %s (entry %s)",
P780: 12064:                           MtExitName(g_mtrade.exitReason),
P781: 12065:                           (vBREAK ? " [" + breakLineName + "]" : ""),
P782: 12066:                           DoubleToString(g_mtrade.exitPrice, _Digits),
P783: 12067:                           DoubleToString(g_mtrade.entryPrice, _Digits)),
P784: 12068:              true);
P785: 12069:   }
P786: ```
P787: 
P788: ### Q3 deferred abort set - source lines 7445-7457
P789: 
P790: ```mql5
P791: 7445:           double uj_hm15 = 0.0;
P792: 7446:           bool uj_hm15r = ReadFlow(FL_BUF_HTF_LOW, uj_hm15, barShift);
P793: 7447:           double uj_hwant = (g_dir == DIR_LONG ? 1.0 : -1.0);
P794: 7448:           string uj_hterm = "";
P795: 7449:           bool uj_hcarve = IsConfirmationCandle(barShift, g_anchorLine, g_dir, uj_hterm);
P796: 7450:           if((uj_hm15r && uj_hm15 == uj_hwant) || uj_hcarve)
P797: 7451:             { if(InpDebugLog) PrintFormat("[SRJ-EA] UJLTFHOLD bar=%s dir=%s poi=%s state=%s m15=%s rf=%d mode=%s term=%s - LTF opposed, hold (Fix F11)", TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES), DirName(g_dir), AnchorStr(), StateName(g_state), DoubleToString(uj_hm15, 1), (uj_hm15r ? 1 : 0), ((uj_hm15r && uj_hm15 == uj_hwant) ? "M15" : "CARVE"), uj_hterm); }
P798: 7452:           else
P799: 7453:             {
P800: 7454:              uj_saAbort = true; uj_saA = g_anchorLine; uj_saD = (int)g_dir; uj_saT = g_anchorBarTime;
P801: 7455:              if(InpDebugLog) PrintFormat("[SRJ-EA] UJDEFERABORT bar=%s dir=%s poi=%s state=%s - LTF opposed, abort deferred past evaluation (Fix S-a)", TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES), DirName(g_dir), AnchorStr(), StateName(g_state));
P802: 7456:             }
P803: 7457:          }
P804: ```
P805: 
P806: ### Q3 incumbent region before seed locals - source lines 7457-8069
P807: 
P808: ```mql5
P809: 7457:          }
P810: 7458:      }
P811: 7459: 
P812: 7460:    //--- [Task 135 / A-3 section 5.1 / v4.2 section 3.4 errata] The
P813: 7461:    //--- candidate-specific structural invalidation window OPENS AT BUNDLE
P814: 7462:    //--- BINDING, not at candidate creation. Under today's architecture the
P815: 7463:    //--- S3->S4 arming transition IS the binding point: g_zoneHi and g_zoneLo are
P816: 7464:    //--- assigned there and nothing before it identifies a structure at all. A
P817: 7465:    //--- candidate that has not yet adopted a zone has no candidate-specific
P818: 7466:    //--- structure for these three flags to describe, so a 2-of-3 verdict against
P819: 7467:    //--- it is not attributable to anything the candidate is built on.
P820: 7468:    //---
P821: 7469:    //--- R-Q2 keeps the flags legitimately GLOBAL - they are the panel's
P822: 7470:    //--- current-structure flags and no per-candidate copy is wanted. Section 5.1
P823: 7471:    //--- fixes only WHEN they may kill a candidate.
P824: 7472:    //---
P825: 7473:    //--- Measured, Tier 1, Task 134: of 25 aborts, 11 are freshness deaths and
P826: 7474:    //--- SIX fired before the candidate had armed - FRESH_OPP_FVG at
P827: 7475:    //--- S2_LTF_ALIGN 08.14 11:35, FRESH_OPP_FVG at S3_ZONE_WAIT 08.18 10:20 and
P828: 7476:    //--- 08.18 11:50, FRESH_OB_DEAD at S2_LTF_ALIGN 08.18 16:25 and 08.18 18:05,
P829: 7477:    //--- FRESH_OB_DEAD at S3_ZONE_WAIT 08.21 09:35. Corroborated at Tier 3 scale
P830: 7478:    //--- by FRESHCOUNT #1050, which fires 08.03 09:25 with state=S2_LTF_ALIGN
P831: 7479:    //--- adverse=2 verdict=ABORT against a candidate that had bound nothing.
P832: 7480:    //---
P833: 7481:    //--- STRICTLY RETENTION. This edit can only let a candidate live longer. It
P834: 7482:    //--- can never kill one, and it can never admit a signal the freshness rule
P835: 7483:    //--- would have blocked at S4 or S5, because the poll still runs there
P836: 7484:    //--- unchanged. Same character as Stage 3a's S1WAIT / S2WAIT retention, and
P837: 7485:    //--- deliberately the opposite character to Task 79's strictly-removal LTF
P838: 7486:    //--- invariant, so the two journals read against each other cleanly.
P839: 7487:    //---
P840: 7488:    //--- SCENARIO B IS PRESERVED. The operator's 08/03 setup-1 rejection fires at
P841: 7489:    //--- state=S5_GATE_CHECK, inside the retained range, on the same fvgDead plus
P842: 7490:    //--- oppFvg pair. This edit does not touch it.
P843: 7491:    //---
P844: 7492:    //--- ACCEPTED CONSEQUENCE 1, and the reason Task 134 ran first: a candidate
P845: 7493:    //--- freed here does not necessarily survive. It carries whatever other
P846: 7494:    //--- pending deaths it already had, and removing the one that fires first
P847: 7495:    //--- reveals the next (section 16.3). Expect the abort MIX to shift toward
P848: 7496:    //--- SESSION_CLOSED, NO_TP_TARGET and LTF_MISALIGN rather than the abort
P849: 7497:    //--- COUNT to fall.
P850: 7498:    //---
P851: 7499:    //--- ACCEPTED CONSEQUENCE 2, and the real risk: this is a RETENTION edit
P852: 7500:    //--- under a SINGLETON architecture. A candidate that lives longer holds the
P853: 7501:    //--- singleton longer and can suppress POI retests that previously seeded
P854: 7502:    //--- their own candidates. So the candidate COUNT may FALL and SUPPRESSED may
P855: 7503:    //--- RISE even though this edit cannot kill anything directly. Both are
P856: 7504:    //--- censused. A net loss by that route is an argument for section 5.6's
P857: 7505:    //--- concurrency work, not against this ruling.
P858: 7506:    //---
P859: 7507:    //--- ACCEPTED CONSEQUENCE 3, diagnostic: CheckFreshness is NOT called in the
P860: 7508:    //--- newly exempt range, because its side effects - the FRESHCOUNT print and
P861: 7509:    //--- its cum1/cum2/cum3 counters - are not on record as harmless and this
P862: 7510:    //--- task does not read its body. So FRESHCOUNT lines DISAPPEAR for pre-arm
P863: 7511:    //--- bars and the cum counters RENUMBER. Task 133's FRESHCOUNT numbering is
P864: 7512:    //--- therefore NOT comparable to this run's. The FRESHSKIP line below records
P865: 7513:    //--- every skipped bar and its state so attribution survives the loss.
P866: 7514:    //---
P867: 7515:    //--- Threshold-free: the change is a STATE comparison, ST_S2_LTF_ALIGN to
P868: 7516:    //--- ST_S4_ARMED. No distance, no size, no bar count, no tolerance. Part A
P869: 7517:    //--- section 7 is not engaged.
P870: 7518:    //---
P871: 7519:    //--- The upper bound ST_S5_GATE_CHECK is DELIBERATELY UNCHANGED. EA-104 stays
P872: 7520:    //--- withdrawn: setup completion, not the confirming close, ends the window,
P873: 7521:    //--- and divergence may still be pending at S5.
P874: 7522:    //---
P875: 
P876: ```
P877: 
P878: [Source comment line 7523 omitted because it contains non-ASCII; no executable code omitted.]
P879: 
P880: ```mql5
P881: 
P882: 7524:    //--- block. That one is NOT changed - it is Task 31's advisory poll and its
P883: 
P884: ```
P885: 
P886: [Source comment line 7525 omitted because it contains non-ASCII; no executable code omitted.]
P887: 
P888: ```mql5
P889: 
P890: 7526:    //---
P891: 7527:    //--- The FRESHSKIP print reports the anchor through AnchorStr(), which is the
P892: 7528:    //--- same accessor LogState and LogAbort already use for their poi= field.
P893: 7529:    //--- Revision A of this task: the first issue named a nonexistent identifier
P894: 7530:    //--- and the builder correctly halted on the Block C-bis census rather than
P895: 7531:    //--- substituting one. Planner defect nineteen, section 16.8.
P896: 7532:    //---
P897: 7533:    //--- Nothing is deleted. The superseded condition is retained verbatim on the
P898: 7534:    //--- annotated comment line directly beneath this one:
P899: 7535:    //---
P900: 7536:    //--- SUPERSEDED BY TASK 135, retained per P4:
P901: 7537:    //---   if(g_state >= ST_S2_LTF_ALIGN && g_state <= ST_S5_GATE_CHECK)
P902: 7538:    //---
P903: 7539:    if(InpDebugLog && g_state >= ST_S2_LTF_ALIGN && g_state < ST_S4_ARMED)
P904: 7540:       PrintFormat("[SRJ-EA] FRESHSKIP bar=%s dir=%s state=%s poi=%s reason=PRE_BINDING",
P905: 7541:                   TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES),
P906: 7542:                   DirName(g_dir),
P907: 7543:                   StateName(g_state),
P908: 7544:                   AnchorStr());
P909: 7545: 
P910: 7546:    if(g_state >= ST_S4_ARMED && g_state <= ST_S5_GATE_CHECK)
P911: 7547:      {
P912: 7548:       //--- [P-SCOPE34] the 2-of-3 kill is PRE-CONFIRMATION ONLY: at S4_ARMED the
P913: 7549:       //--- poll kills as built; at S5_GATE_CHECK (post-confirming-close) it is
P914: 7550:       //--- diagnostic-only (scope=post, verdict=HOLD) - the only cancellation
P915: 7551:       //--- there is the live bias flip (the three-flag conjunction is the same
P916: 7552:       //--- event per spec sections 3.4/5.5).
P917: 7553:       string fail = CheckFreshness(barShift, g_state != ST_S5_GATE_CHECK);
P918: 7554:       //--- [P-FRESH-S5OPP E1-K4] veto persistence, S4 ONLY, BEFORE any abort
P919: 7555:       //--- return (Luna/Astra v152: the clear sees the fresh read even when
P920: 
P921: ```
P922: 
P923: [Source comment line 7556 omitted because it contains non-ASCII; no executable code omitted.]
P924: 
P925: ```mql5
P926: 
P927: 7557:       //--- arm (Luna/Opus-D3 v153: a stale-0 fail-open is unfixable in this
P928: 7558:       //--- shape, so the arm is dropped, not narrowed). Audited by VETOCLEAR.
P929: 7559:       //--- [P-VNEXT-1 E4] S4 site mirrors the latch site: DAY-only clear (BOUND removed, same veto-persistence rule; supersedes the L7237 BOUND/DAY note).
P930: 7560:       if(g_state == ST_S4_ARMED && g_freshVetoBar != 0)
P931: 7561:         {
P932: 7562:          string vday = StringSubstr(TimeToString(g_freshVetoBar, TIME_DATE), 0, 10);
P933: 7563:          string cday = StringSubstr(TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE), 0, 10);
P934: 7564:          if(vday != cday)
P935: 7565:            {
P936: 7566:             if(InpDebugLog)
P937: 7567:                PrintFormat("[SRJ-EA] VETOCLEAR bar=%s dir=%s why=%s",
P938: 7568:                            TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES),
P939: 7569:                            DirName(g_dir), "DAY");
P940: 7570:             g_freshVetoBar = 0; g_freshVetoAnchor = -1; g_freshVetoDir = -1;
P941: 7571:            }
P942: 7572:         }
P943: 7573:       if(fail == ABORT_FRESH_OPP_FVG)
P944: 7574:         {
P945: 7575:          g_freshVetoBar = iTime(_Symbol, PERIOD_CURRENT, barShift);
P946: 7576:          g_freshVetoAnchor = g_anchorLine;
P947: 7577:          g_freshVetoDir = (int)g_dir;
P948: 7578:          GoAbort(fail, g_state); return;
P949: 7579:         }
P950: 7580:       if(fail != "") { GoAbort(fail, g_state); return; }
P951: 7581:      }
P952: 7582: 
P953: 7583:     //--- [P-SEL-1 E54] stage-reached marker at probe bars (read-only + line).
P954: 7584:     if(InpDebugLog)
P955: 7585:       {
P956: 7586:        string sl54_s2T = TimeToString(barTime, TIME_DATE|TIME_MINUTES);
P957: 7587:        if(SrjSelIsProbeBar(sl54_s2T))
P958: 7588:          { string sl54_s2L = StringFormat("[SRJ-EA] SEL54STAGE bar=%s stage=S2POLL dir=%s state=%s", sl54_s2T, DirName(g_dir), StateName(g_state)); LwAudit("SEL54STAGE", sl54_s2L); Print(sl54_s2L); }
P959: 7589:       }
P960: 7590:     double s1_stopRef = 0.0; bool s1_haveStop = false;
P961: 7591:    if(g_state >= ST_S2_LTF_ALIGN && g_state <= ST_S5_GATE_CHECK)
P962: 7592:      {
P963: 7593:       //--- [P-UJIMPL-IMPL-1 v8 IE6] entry reference = forming-bar open (would-be fill)
P964: 7594:       double currentPrice = iOpen(_Symbol, PERIOD_CURRENT, 0);
P965: 7595:       double tpTarget;
P966: 7596:       if(!ComputeNearestTpTarget(barShift, g_dir, currentPrice, tpTarget))
P967: 7597:         {
P968: 7598:          if(InpDebugLog)
P969: 7599:             PrintFormat("[SRJ-EA] %s S2POLL_NO_TP_TARGET",
P970: 7600:                         TimeToString(TimeCurrent(), TIME_DATE|TIME_SECONDS));
P971: 7601:          GoAbort(ABORT_NO_TP_TARGET, g_state); return;
P972: 7602:         }
P973: 7603:       double slRef = 0.0; ENUM_SRJ_SLMODE slMode = SL_MODE_NONE;
P974: 7604:       //--- [P-FIX-S2POLL E1 / operator Q1+Q3 2026-09-11] The stop pair is ATOMIC:
P975: 7605:       //--- both set on success, both absent on failure. The superseded form had the
P976: 7606:       //--- if governing ONE statement, so s1_haveStop=true was unconditional and the
P977: 7607:       //--- scope block below read slRef on the failure path. #property strict does
P978: 7608:       //--- not diagnose that shape. Fail-closed per Q3 ("SL should be present at all
P979: 7609:       //--- times"), following the sibling gate in this same block: ABORT_NO_TP_TARGET
P980: 7610:       //--- already kills across S2..S5 from here, and this is its stop-side twin.
P981: 7611:       //--- SUPERSEDED, retained per P4:
P982: 7612:       //---   if(ComputeSlReference(barShift, g_dir, slRef, slMode, "S2POLL"))
P983: 7613:       //---      s1_stopRef = slRef; s1_haveStop = true;
P984: 7614:       if(!SlRefMemo(barShift, barTime, g_dir, slRef, slMode, "S2POLL"))
P985: 7615:         {
P986: 7616:          if(InpDebugLog)
P987: 7617:             PrintFormat("[SRJ-EA] %s S2POLL_NO_SL_REF state=%s dir=%s",
P988: 7618:                         TimeToString(TimeCurrent(), TIME_DATE|TIME_SECONDS),
P989: 7619:                         StateName(g_state), DirName(g_dir));
P990: 7620:          GoAbort(ABORT_NO_SL_REF, g_state);
P991: 7621:          return;
P992: 7622:         }
P993: 7623:       s1_stopRef  = slRef;
P994: 7624:       s1_haveStop = true;
P995: 7625:       //--- [P-UJIMPL-IMPL-2 v10 Fix H1] poll verdict is telemetry + memo write
P996: 7626:       //--- (R-AT-OPEN: the admission verdict fires ONLY at the fire approach
P997: 7627:       //--- on entry-open ref; a poll FAIL no longer aborts).
P998: 7628:         {
P999: 7629:          double uj_risk = 0.0, uj_reward = 0.0, uj_R = 0.0;
P1000: 7630:          string uj_bk7 = TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES);
P1001: 7631:          if(!SrjUjAssert1R(currentPrice, slRef, tpTarget, uj_bk7, "POLL", uj_risk, uj_reward, uj_R))
P1002: 7632:            { if(InpDebugLog) PrintFormat("[SRJ-EA] UJPOLLRISK bar=%s dir=%s R=%.2f - poll-ref verdict telemetry only, admission verdict at fire (Fix H1)", uj_bk7, DirName(g_dir), uj_R); }
P1003: 7633:          uj_memo_tp = tpTarget; uj_memo_sl = slRef; uj_memo_entry = currentPrice;
P1004: 7634:          uj_memo_valid = true;
P1005: 7635:          uj_memo_anchor = g_anchorLine; uj_memo_dir = (int)g_dir; uj_memo_barTime = barTime;
P1006: 7636:          uj_memo_risk = uj_risk; uj_memo_reward = uj_reward; uj_memo_R = uj_R;
P1007: 7637:          uj_memo_src = "POLL";
P1008: 7638:          uj_memo_wsrc = uj_winnerSource; uj_memo_wday = uj_winnerDayKey;
P1009: 7639:          uj_memo_wgen = uj_winnerPoolGen; uj_memo_wage = UjDayDiff(barTime, uj_winnerDayKey);
P1010: 7640:         }
P1011: 7641:         {
P1012: 7642:          double slDist = MathAbs(currentPrice - slRef);
P1013: 7643:          double tpDist = MathAbs(tpTarget - currentPrice);
P1014: 7644:          //--- TASK 23 (EA-23b / EA-23c / EA-20): shadow reward/risk measured from
P1015: 7645:          //--- the entry zone rather than from the closing price, printed for all
P1016: 7646:          //--- three candidate entry references so Ruling 7 can be answered from
P1017: 7647:          //--- data instead of from judgement. Nothing reads these values. No gate,
P1018: 7648:          //--- no abort, no branch, no assignment to any sequence variable.
P1019: 7649:          //--- Skipped before S4 because g_zoneHi/g_zoneLo are still 0.0 until the
P1020: 7650:          //--- S3 block sets them; that is expected, not a failure.
P1021: 7651:          if(InpDebugLog && g_zoneHi > 0.0 && g_zoneLo > 0.0)
P1022: 7652:            {
P1023: 7653:             double zNear = (g_dir == DIR_LONG) ? g_zoneHi : g_zoneLo;
P1024: 7654:             double zFar  = (g_dir == DIR_LONG) ? g_zoneLo : g_zoneHi;
P1025: 7655:             double zMid  = (g_zoneHi + g_zoneLo) * 0.5;
P1026: 7656:             string rs = "";
P1027: 7657:             for(int e = 0; e < 3; e++)
P1028: 7658:               {
P1029: 7659:                double ent = (e == 0) ? zNear : ((e == 1) ? zMid : zFar);
P1030: 7660:                double sd  = MathAbs(ent - slRef);
P1031: 7661:                double td  = MathAbs(tpTarget - ent);
P1032: 7662:                bool slSideOk = (g_dir == DIR_LONG) ? (slRef < ent) : (slRef > ent);
P1033: 7663:                bool tpSideOk = (g_dir == DIR_LONG) ? (tpTarget > ent) : (tpTarget < ent);
P1034: 7664:                rs += ((e == 0) ? "near" : ((e == 1) ? "mid" : "far"));
P1035: 7665:                rs += "=" + ((sd > 0.0) ? DoubleToString(td / sd, 2) : "inf");
P1036: 7666:                rs += "/sl" + IntegerToString((int)slSideOk);
P1037: 7667:                rs += "/tp" + IntegerToString((int)tpSideOk) + " ";
P1038: 7668:               }
P1039: 7669:             bool tpInGap = (g_dir == DIR_LONG)
P1040: 7670:                            ? (tpTarget > zNear && tpTarget < currentPrice)
P1041: 7671:                            : (tpTarget < zNear && tpTarget > currentPrice);
P1042: 7672:             PrintFormat("[SRJ-EA] ZONESHADOW bar=%s dir=%s close=%s zoneLo=%s zoneHi=%s "
P1043: 7673:                         "gapPts=%s slRef=%s tp=%s R_close=%s tpInGap=%d shadow= %s",
P1044: 7674:                         TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES),
P1045: 7675:                         DirName(g_dir),
P1046: 7676:                         DoubleToString(currentPrice, _Digits),
P1047: 7677:                         DoubleToString(g_zoneLo, _Digits),
P1048: 7678:                         DoubleToString(g_zoneHi, _Digits),
P1049: 7679:                         DoubleToString(MathAbs(currentPrice - zNear) / _Point, 0),
P1050: 7680:                         DoubleToString(slRef, _Digits),
P1051: 7681:                         DoubleToString(tpTarget, _Digits),
P1052: 7682:                         (slDist > 0.0) ? DoubleToString(tpDist / slDist, 2) : "inf",
P1053: 7683:                         (int)tpInGap, rs);
P1054: 7684:            }
P1055: 7685:          if(slDist > 0.0 && (tpDist / slDist) < InpMinRewardRisk)
P1056: 7686:            {
P1057: 7687:             if(InpDebugLog)
P1058: 7688:                PrintFormat("[SRJ-EA] %s S2POLL_RR_SHORTFALL tpDist=%.5f slDist=%.5f R=%.2f",
P1059: 7689:                            TimeToString(TimeCurrent(), TIME_DATE|TIME_SECONDS),
P1060: 7690:                            tpDist, slDist, (slDist > 0.0 ? tpDist / slDist : 0.0));
P1061: 7691:             /* [Task 31 / Ruling 7a] ADVISORY. Was GoAbort(ABORT_TP_RR_FAIL). iClose is not an entry price before S5: measured 0.17 to 213.27 on one 7-bar sequence as slDist collapses, and every zone-derived alternative overstates by up to 20x. The hard 1R gate now lives only at S5, where the entry IS the next candle's open (P-NEXTOPEN 2026-09-09). S2POLL_RR_SHORTFALL above still logs every failure. */ ;
P1062: 7692:            }
P1063: 7693:         }
P1064: 7694:      }
P1065: 7695: 
P1066: 7696:    if(g_state >= ST_S1_REGIME && g_dir != DIR_NONE)
P1067: 7697:      {
P1068: 7698:       string kind;
P1069: 7699:       g_divLatch = UpdateDivergenceLatch(barShift, g_dir, kind);
P1070: 7700:      }
P1071: 7701: 
P1072: 7702:    //--- [Task 72 / EA-74] Post-latch CQD re-read. DIAGNOSTIC ONLY.
P1073: 7703:    //--- The CQD census at the top of this function is the FIRST CQD read of
P1074: 7704:    //--- the call. Across 4032 bars it reported ZERO shift=1 verdicts, while
P1075: 7705:    //--- UpdateDivergenceLatch - reading the SAME buffer at the SAME two
P1076: 7706:    //--- shifts, later in the same call - matched and latched (measured:
P1077: 7707:    //--- 2026.08.11 18:35 SIGNAL div=hidden, census silent for the whole
P1078: 7708:    //--- sequence). This block repeats the census read AFTER the latch block,
P1079: 7709:    //--- so two reads of one buffer can be compared within a single call.
P1080: 7710:    //---
P1081: 7711:    //--- Each shift is read TWICE in immediate succession. If pass A and pass
P1082: 7712:    //--- B disagree, the buffer is changing under one call, which is value
P1083: 7713:    //--- instability rather than read-ordering lag - the two candidate
P1084: 7714:    //--- mechanisms behind EA-74 are distinguishable only this way.
P1085: 7715:    //---
P1086: 7716:    //--- The live-value filter is character-identical to the census: skip a
P1087: 7717:    //--- read failure, skip EMPTY_VALUE, skip zero. Gated on InpDebugLog.
P1088: 7718:    //--- Assigns nothing, reads g_state / g_dir / g_divLatch for labelling
P1089: 7719:    //--- only, and cannot alter control flow. R8 is NOT engaged.
P1090: 7720:    if(InpDebugLog)
P1091: 7721:      {
P1092: 7722:       static int s_t72_bars     = 0;
P1093: 7723:       static int s_t72_hit1     = 0;
P1094: 7724:       static int s_t72_hit2     = 0;
P1095: 7725:       static int s_t72_mismatch = 0;
P1096: 7726:       s_t72_bars++;
P1097: 7727:       for(int t72_s = 1; t72_s <= 2; t72_s++)
P1098: 7728:         {
P1099: 7729:          double t72_a = 0.0, t72_b = 0.0;
P1100: 7730:          bool t72_okA = ReadBuf1(g_hCqd, CQD_BUF_DIVVERDICT, t72_a, t72_s);
P1101: 7731:          bool t72_okB = ReadBuf1(g_hCqd, CQD_BUF_DIVVERDICT, t72_b, t72_s);
P1102: 7732:          bool t72_diff = (t72_okA != t72_okB) ||
P1103: 7733:                          (t72_okA && t72_okB && t72_a != t72_b);
P1104: 7734:          bool t72_live = (t72_okA && t72_a != EMPTY_VALUE &&
P1105: 7735:                           (int)MathRound(t72_a) != 0);
P1106: 7736:          if(t72_diff) s_t72_mismatch++;
P1107: 7737:          if(t72_live && t72_s == 1) s_t72_hit1++;
P1108: 7738:          if(t72_live && t72_s == 2) s_t72_hit2++;
P1109: 7739:          if(t72_live || t72_diff)
P1110: 7740:             PrintFormat("[SRJ-EA] CQDRECHECK shift=%d passA=%s passB=%s diff=%d "
P1111: 7741:                         "bar=%s state=%s dir=%s divLatch=%d hit1=%d hit2=%d mism=%d",
P1112: 7742:                         t72_s,
P1113: 7743:                         t72_okA ? ((t72_a == EMPTY_VALUE) ? "EMPTY"
P1114: 7744:                                                           : DoubleToString(t72_a, 1))
P1115: 7745:                                 : "readfail",
P1116: 7746:                         t72_okB ? ((t72_b == EMPTY_VALUE) ? "EMPTY"
P1117: 7747:                                                           : DoubleToString(t72_b, 1))
P1118: 7748:                                 : "readfail",
P1119: 7749:                         (int)t72_diff,
P1120: 7750:                         TimeToString(iTime(_Symbol, PERIOD_CURRENT, t72_s),
P1121: 7751:                                      TIME_DATE|TIME_MINUTES),
P1122: 7752:                         StateName(g_state), DirName(g_dir), (int)g_divLatch,
P1123: 7753:                         s_t72_hit1, s_t72_hit2, s_t72_mismatch);
P1124: 7754:         }
P1125: 7755:       if((s_t72_bars % 500) == 0)
P1126: 7756:          PrintFormat("[SRJ-EA] CQDRECHECK_PROGRESS bars=%d hit1=%d hit2=%d mismatch=%d",
P1127: 7757:                      s_t72_bars, s_t72_hit1, s_t72_hit2, s_t72_mismatch);
P1128: 7758:      }
P1129: 7759: 
P1130: 7760:    //====================== [Task 78 / EA-80 tier reading] POI replacement ====
P1131: 7761:    //--- Part A Step 8, D-3, G-2 and the carried ruling in section 6a: an
P1132: 7762:    //--- OPPOSITE-DIRECTION retest of a HIGHER-HIERARCHY POI replaces the held
P1133: 7763:    //--- candidate. The EA has never implemented it - arrival order won instead
P1134: 7764:    //--- of authority - and Task 77 measured the cost. On 2026.08.11 a Daily-VWAP
P1135: 7765:    //--- LONG candidate held the global singleton for 15 bars, never advanced
P1136: 7766:    //--- past S1, died SESSION_CLOSED at 19:05, and suppressed the three
P1137: 7767:    //--- Weekly-POC SHORT retests at bars 18:10 / 18:20 / 18:30 that produced the
P1138: 7768:    //--- Task 75 signal. Those three are the ONLY tier-crossing instances among
P1139: 7769:    //--- 23 higher=1 suppressions; the other 20 are POC-over-VWAP inside a single
P1140: 7770:    //--- anchor tier.
P1141: 7771:    //---
P1142: 7772:    //--- "Higher hierarchy" is read as the ANCHOR TIER, not the 12-line rank, via
P1143: 7773:    //--- g_authorityRank[]/2 - the identical tier collapse ComputeNearestTpTarget
P1144: 7774:    //--- already applies to its POI candidates. No new constant and no new
P1145: 7775:    //--- concept. Under the tier reading this fires on 3 of 23; under the rank
P1146: 7776:    //--- reading it would fire on all 23, and widening later is the removal of
P1147: 7777:    //--- two /2 operators. Implementing the narrower subset is correct under the
P1148: 7778:    //--- tier ruling and merely incomplete under the rank ruling. EA-80 is NOT
P1149: 7779:    //--- pre-empted by this edit.
P1150: 7780:    //---
P1151: 7781:    //--- G-5's same-direction higher-tier ANCHOR UPGRADE is deliberately NOT
P1152: 7782:    //--- implemented here: all nine measured opp=0 higher=1 instances are
P1153: 7783:    //--- intra-tier, so it has zero live instances under this reading.
P1154: 7784:    //---
P1155: 7785:    //--- Threshold-free: the tests are DIRECTION and TIER ORDER. No distance, no
P1156: 7786:    //--- size, no bar count, no tolerance. Part A section 7 is not engaged.
P1157: 7787:    //---
P1158: 7788:    //--- Monotone within a sequence: the test requires a STRICTLY higher tier
P1159: 7789:    //--- than the held anchor, so once anchored at the most authoritative tier
P1160: 7790:    //--- present nothing can displace it and no oscillation is possible.
P1161: 7791:    //---
P1162: 7792:    //--- DetectPoiRetest is read-only - it fills a caller-owned struct from the
P1163: 7793:    //--- 12 POI buffers and mutates no sequence state - and it already returns
P1164: 7794:    //--- the MOST AUTHORITATIVE matching line. So once GoAbort has cleared the
P1165: 7795:    //--- sequence, the IDLE block below re-detects that same line and seeds it.
P1166: 7796:    //--- No seeding code is duplicated here.
P1167: 7797:    //---
P1168: 
P1169: ```
P1170: 
P1171: [Source comment line 7798 omitted because it contains non-ASCII; no executable code omitted.]
P1172: 
P1173: ```mql5
P1174: 
P1175: 7799:    //--- GoAbort call site returns; this one must fall through so the IDLE block
P1176: 7800:    //--- seeds the replacement on the SAME bar. GoAbort sets ST_ABORT and then
P1177: 7801:    //--- calls ResetSequence, leaving g_state == ST_IDLE, which is exactly the
P1178: 7802:    //--- state the IDLE block requires. Section 3.7's no-early-return cascade is
P1179: 7803:    //--- what makes same-bar promotion possible.
P1180: 7804:    //---
P1181: 7805:    //--- Placed BEFORE the Task 73 census so a replaced retest is not ALSO
P1182: 7806:    //--- counted as suppressed - it was promoted, not discarded. That census is
P1183: 7807:    //--- gated on g_state > ST_IDLE and so skips on a replacement bar.
P1184: 7808:    //---
P1185: 7809:    //--- One-bar divergence-latch consequence, accepted: the latch block sits
P1186: 7810:    //--- ABOVE this one, so the replacement candidate's latch is first evaluated
P1187: 7811:    //--- on the NEXT bar. Part A Step 7 latches at any point with no bar-count
P1188: 7812:    //--- limit, so a one-bar delay can postpone a signal but cannot lose one -
P1189: 7813:    //--- the same reasoning EA-78 records for CQD's shift-2-only visibility.
P1190: 7814:    if(g_state > ST_IDLE && g_state != ST_ABORT && g_anchorLine >= 0 && inWindow)
P1191: 7815:      {
P1192: 7816:       PoiRetestResult t78_pr;
P1193: 7817:       if(DetectPoiRetest(barShift, t78_pr) && t78_pr.found)
P1194: 7818:         {
P1195: 7819:           ENUM_SRJ_DIR t78_dir = t78_pr.isLong ? DIR_LONG : DIR_SHORT;
P1196: 7820:           bool t78_opp  = (t78_dir != g_dir);
P1197: 7821:           bool t78_tier = ((g_authorityRank[t78_pr.topLine] / 2) <
P1198: 7822:                            (g_authorityRank[g_anchorLine]   / 2));
P1199: 7823:           //--- [S2-PREEMPT-SHADOW-001] WOULD-PREEMPT recorder: reuses the computed
P1200: 7824:           //--- t78_pr/t78_dir/t78_opp/t78_tier above (no fresh DetectPoiRetest call,
P1201: 
P1202: ```
P1203: 
P1204: [Source comment line 7825 omitted because it contains non-ASCII; no executable code omitted.]
P1205: 
P1206: ```mql5
P1207: 
P1208: 7826:           //--- FORBIDDEN in this shadow and ABSENT below: g_state / g_anchorLine /
P1209: 7827:           //--- g_dir / anchor price-time / zone-touch-latch / GoAbort /
P1210: 7828:           //--- ResetSequence / order-stop-eligibility-session writes
P1211: 7829:           //--- (documented guarantee, grade-verified).
P1212: 7830:           if(InpDebugLog && t78_opp)
P1213: 7831:             {
P1214: 7832:              int s1h_newTier  = g_authorityRank[t78_pr.topLine] / 2;
P1215: 7833:              int s1h_heldTier = g_authorityRank[g_anchorLine]   / 2;
P1216: 7834:              PrintFormat("[SRJ-EA] SIDE1H_WOULDPREEMPT bar=%s newPoi=%s newDir=%s heldPoi=%s heldDir=%s heldState=%s newTier=%d heldTier=%d wouldPreempt=%d wouldTierPassLegacy=%d",
P1217: 7835:                          TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift),
P1218: 7836:                                       TIME_DATE|TIME_MINUTES),
P1219: 7837:                          g_lineCode[t78_pr.topLine], DirName(t78_dir),
P1220: 7838:                          g_lineCode[g_anchorLine], DirName(g_dir),
P1221: 7839:                          StateName(g_state),
P1222: 7840:                          s1h_newTier, s1h_heldTier,
P1223: 7841:                          ((g_state == ST_S2_LTF_ALIGN) ? 1 : 0),
P1224: 7842:                          (t78_tier ? 1 : 0));
P1225: 7843:             }
P1226: 7844:           if(t78_opp && t78_tier)
P1227: 7845:            {
P1228: 7846:             PrintFormat("[SRJ-EA] POIREPLACE bar=%s newPoi=%s newDir=%s "
P1229: 7847:                         "heldPoi=%s heldDir=%s heldState=%s newTier=%d heldTier=%d",
P1230: 7848:                         TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift),
P1231: 7849:                                      TIME_DATE|TIME_MINUTES),
P1232: 7850:                         g_lineCode[t78_pr.topLine], DirName(t78_dir),
P1233: 7851:                         g_lineCode[g_anchorLine], DirName(g_dir),
P1234: 7852:                         StateName(g_state),
P1235: 7853:                         g_authorityRank[t78_pr.topLine] / 2,
P1236: 7854:                         g_authorityRank[g_anchorLine]   / 2);
P1237: ```
P1238: [Source comment line EA 7855 omitted because the comment contains an ellipsis; no executable code omitted.]
P1239: ```mql5
P1240: 7856:             }
P1241: 7857:           //--- [S2-CROSS-DIR-PREEMPT] live transfer (Luna V87-LIVE-PREEMPT-001
P1242: 
P1243: ```
P1244: 
P1245: [Source comment line 7858 omitted because it contains non-ASCII; no executable code omitted.]
P1246: 
P1247: ```mql5
P1248: 
P1249: 7859:           //--- turn). State-bounded: S2-held candidate yields to the observed; P-VNEXT-1 admits S1-held on opposite-confirm (unconfirmed held only).
P1250: 7860:           //--- opposite-direction candidate. Region-P-equivalent MIRROR (no callable
P1251: 
P1252: ```
P1253: 
P1254: [Source comment line 7861 omitted because it contains non-ASCII; no executable code omitted.]
P1255: 
P1256: ```mql5
P1257: 
P1258: 7862:           //--- (a) g_dir takes t78_dir, Region P keeps dir; (b) NO state write and
P1259: 7863:           //--- NO LogState - state unchanged on either path (S2 stays S2, S1 stays S1), never ST_IDLE;
P1260: 7864:           //--- (c) one InpDebugLog-gated SIDE1C_PREEMPT print, new family,
P1261: 7865:           //--- observation only). Reuses computed t78_pr/t78_dir/t78_opp above (no
P1262: 7866:           //--- fresh DetectPoiRetest, N1 untouched). Tier recorded, never consulted
P1263: 7867:           //--- (no <, no <=). Placed AFTER the POIREPLACE census above (D4) so the
P1264: 7868:           //--- census labels stay pre-transfer and byte-comparable.
P1265: 7869:           //--- [P-VNEXT-1 E1] confirmed-opposite displaces unconfirmed-held (his setup-definition 2026-09-22): opposite booked retest with confirm=1 takes the anchor when the held candidate confirms 0. S1-gated: the N1-instrumented predicate runs only where consumed. Declarations hoisted one level so the widened transfer condition below can read them (block scope).
P1266: 7870:           bool t78_opConf = false, t78_heldConf = false;
P1267: 7871:           if(g_state == ST_S1_REGIME && t78_opp)
P1268: 7872:             {
P1269: 7873:              string t78_failOp = "", t78_failHeld = "";
P1270: 7874:              t78_opConf = IsConfirmationCandle(barShift, t78_pr.topLine, t78_dir, t78_failOp);
P1271: 7875:              t78_heldConf = IsConfirmationCandle(barShift, g_anchorLine, g_dir, t78_failHeld);
P1272: 7876:              if(InpDebugLog) PrintFormat("[SRJ-EA] UJOPCONF bar=%s poi=%s dir=%s opConf=%d heldConf=%d opTerm=%s heldTerm=%s - displace-gate inputs (Fix H1)", TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES), g_lineCode[t78_pr.topLine], DirName(t78_dir), (int)t78_opConf, (int)t78_heldConf, t78_failOp, t78_failHeld);
P1273: 7877:               if(!t78_opConf && !t78_heldConf && !SessionAlreadyUsed(sess, barTime) && (t78_pr.topLine != g_anchorLine || t78_dir != g_dir))
P1274: 7878:                 {
P1275: 7879:                  bool t78_al = false; bool t78_alOk = CheckLtfAlign(barShift, t78_dir, t78_al);
P1276: 7880:                  if(InpDebugLog) PrintFormat("[SRJ-EA] UJRESEED bar=%s poi=%s dir=%s fromPoi=%s fromDir=%s al=%d ok=%d - op-retest reseeded over unconfirmed holder (Fix H1)", TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES), g_lineCode[t78_pr.topLine], DirName(t78_dir), g_lineCode[g_anchorLine], DirName(g_dir), (t78_alOk ? (t78_al ? 1 : 0) : -1), (int)t78_alOk);
P1277: 7881:                  s1g_legDir = t78_pr.isLong ? 1 : -1;
P1278: 7882:                  s1g_seedBiasAl = (!t78_alOk ? -1 : (t78_al ? 1 : 0));
P1279: 7883:                  g_anchorLine = t78_pr.topLine;
P1280: 7884:                  ReadBuf1(g_hPoi, t78_pr.topLine, g_anchorPrice, barShift);
P1281: 7885:                  g_anchorBarTime = barTime;
P1282: 7886:                  g_dir = S2ResolveLive(t78_pr.isLong ? DIR_LONG : DIR_SHORT);
P1283: 7887:                  g_sessionAtEntry = sess;
P1284: 7888:                  g_zoneHi = 0.0;
P1285: 7889:                  g_zoneLo = 0.0;
P1286: 7890:                  g_touchSeen = false;
P1287: 7891:                  g_touchBarHi = 0.0;
P1288: 7892:                  g_touchBarLo = 0.0;
P1289: 7893:                  g_latchedEntry = 0.0;
P1290: 7894:                  g_latchedSl = 0.0;
P1291: 7895:                  g_latchedTp = 0.0;
P1292: 7896:                  g_latchedR = 0.0;
P1293: 7897:                  g_latchBarTime = 0;
P1294: 7898:                  g_confirmFromState = ST_IDLE;
P1295: 7899:                  uj_memo_valid = false;
P1296: 7900:                  g_ujOpReseedBarTime = barTime;
P1297: 7901:                  g_ujOpReseedDir = (g_dir == DIR_LONG ? 1 : (g_dir == DIR_SHORT ? -1 : 0));
P1298: 7902:                 }
P1299: 7903:              }
P1300: 7904:           if(t78_opp && (g_state == ST_S2_LTF_ALIGN || (g_state == ST_S1_REGIME && t78_opConf && !t78_heldConf)))
P1301: 7905:             {
P1302: 7906:              int s1c_fromLine     = g_anchorLine;
P1303: 7907:              ENUM_SRJ_DIR s1c_fromDir = g_dir;
P1304: 7908:              g_anchorLine    = t78_pr.topLine;
P1305: 7909:              ReadBuf1(g_hPoi, t78_pr.topLine, g_anchorPrice, barShift);
P1306: 7910:              g_anchorBarTime = barTime;
P1307: 7911:              g_dir           = t78_dir;
P1308: 7912:              g_zoneHi        = 0.0;
P1309: 7913:              g_zoneLo        = 0.0;
P1310: 7914:              g_touchSeen     = false;
P1311: 7915:              g_touchBarHi    = 0.0;
P1312: 7916:              g_touchBarLo    = 0.0;
P1313: 7917:              g_latchedEntry  = 0.0;
P1314: 7918:              g_latchedSl     = 0.0;
P1315: 7919:              g_latchedTp     = 0.0;
P1316: 7920:              g_latchedR      = 0.0;
P1317: 7921:              g_latchBarTime  = 0;
P1318: 7922:              g_confirmFromState = ST_IDLE;
P1319: 7923:              if(InpDebugLog)
P1320: 7924:                 PrintFormat("[SRJ-EA] SIDE1C_PREEMPT bar=%s from=%s fromDir=%s to=%s toDir=%s state=%s",
P1321: 7925:                             TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift),
P1322: 7926:                                          TIME_DATE|TIME_MINUTES),
P1323: 7927:                             g_lineCode[s1c_fromLine], DirName(s1c_fromDir),
P1324: 7928:                             g_lineCode[t78_pr.topLine], DirName(t78_dir),
P1325: 7929:                             StateName(g_state));
P1326: 7930:             }
P1327: 7931:          }
P1328: 7932:       }
P1329: 7933: 
P1330: 7934:     //--- [P-BUILD3 E3 2026-09-11] the live supersession poll (spec 3.4 L120:
P1331: 7935:    //--- a same-direction higher-tier POI touch mid-sequence upgrades the anchor
P1332: 7936:    //--- tier silently; spec 6: arrival order still governs across time, so this
P1333: 7937:    //--- re-binds WITHIN the alive candidate only). Pre-fire states S1-S4;
P1334: 7938:    //--- IDLE (seed owns it), S5+ (guard 4) never reach here. Regime/LTF kept
P1335: 7939:    //--- (line-agnostic progress); the anchor-relative legs re-derive (zone and
P1336: 7940:    //--- touch unbind; S3/S4 fall back to S3_ZONE_WAIT so arming re-runs).
P1337: 7941:    //--- Runs BEFORE the t73 census so a promoted line is not ALSO counted as
P1338: 7942:    //--- suppressed (the Task-78 placement discipline). Sets b3_superseded for E4.
P1339: 7943:    bool b3_superseded = false;
P1340: 7944:    if(inWindow &&
P1341: 7945:       (g_state == ST_S1_REGIME || g_state == ST_S2_LTF_ALIGN ||
P1342: 7946:        g_state == ST_S3_ZONE_WAIT || g_state == ST_S4_ARMED) &&
P1343: 7947:       g_anchorLine >= 0 && g_dir != DIR_NONE)
P1344: 7948:      {
P1345: 7949:       int b3_cand = B3_ElectAnchor(barShift, g_dir);
P1346: 7950:       if(b3_cand >= 0 &&
P1347: 7951:          B3_AnchorTier(b3_cand) < B3_AnchorTier(g_anchorLine) &&
P1348: 7952:          sess == g_sessionAtEntry)
P1349: 7953:         {
P1350: 7954:          int b3_from      = g_anchorLine;
P1351: 7955:          int b3_fromRank  = g_authorityRank[b3_from];
P1352: 7956:          int b3_fromTier  = B3_AnchorTier(b3_from);
P1353: 7957:          int b3_toRank    = g_authorityRank[b3_cand];
P1354: 7958:          int b3_toTier    = B3_AnchorTier(b3_cand);
P1355: 7959:          ENUM_SRJ_STATE b3_prevState = g_state;
P1356: 7960:          g_anchorLine    = b3_cand;
P1357: 7961:          ReadBuf1(g_hPoi, b3_cand, g_anchorPrice, barShift);
P1358: 7962:          g_anchorBarTime = barTime;
P1359: 7963:          g_zoneHi        = 0.0;
P1360: 7964:          g_zoneLo        = 0.0;
P1361: 7965:          g_touchSeen     = false;
P1362: 7966:          g_touchBarHi    = 0.0;
P1363: 7967:          g_touchBarLo    = 0.0;
P1364: 7968:          g_latchedEntry  = 0.0;
P1365: 7969:          g_latchedSl     = 0.0;
P1366: 7970:          g_latchedTp     = 0.0;
P1367: 7971:          g_latchedR      = 0.0;
P1368: 7972:          g_latchBarTime  = 0;
P1369: 7973:          g_confirmFromState = ST_IDLE;
P1370: 7974:          if(g_state == ST_S3_ZONE_WAIT || g_state == ST_S4_ARMED)
P1371: 7975:            {
P1372: 7976:             ENUM_SRJ_STATE b3_prev = g_state;
P1373: 7977:             g_state = ST_S3_ZONE_WAIT;
P1374: 7978:             LogState(b3_prev, g_state);
P1375: 7979:            }
P1376: 7980:          b3_superseded = true;
P1377: 7981:          if(InpDebugLog)
P1378: 7982:             PrintFormat("[SRJ-EA] ANCHOR_SUPERSEDE bar=%s from=%s rank=%d tier=%d to=%s rank=%d tier=%d dir=%s state=%s",
P1379: 7983:                         TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift),
P1380: 7984:                                      TIME_DATE|TIME_MINUTES),
P1381: 7985:                         g_lineCode[b3_from], b3_fromRank, b3_fromTier,
P1382: 7986:                         g_lineCode[b3_cand], b3_toRank, b3_toTier,
P1383: 7987:                         DirName(g_dir), StateName(b3_prevState));
P1384: 7988:         }
P1385: 7989:      }
P1386: 7990: 
P1387: 7991:    //--- [Task 73 / Stage 3 cost side] Suppression census. DIAGNOSTIC ONLY.
P1388: 7992:    //--- Two unmeasured quantities, both needed before Stage 3 is sized:
P1389: 7993:    //---   1. The singleton discards every POI retest that arrives while a
P1390: 7994:    //---      sequence is alive. 103 candidates were ADMITTED across this
P1391: 7995:    //---      window; how many were silently dropped is unknown, and Stage 3
P1392: 7996:    //---      lengthens candidate lifetime, so it raises that number.
P1393: 7997:    //---   2. Part A carries a rule the EA does not implement - an
P1394: 7998:    //---      opposite-direction HIGHER-TIER retest replaces the candidate.
P1395: 7999:    //---      Its frequency has never been counted.
P1396: 8000:    //---
P1397: 8001:    //--- DetectPoiRetest is read-only: it fills a caller-owned struct from the
P1398: 8002:    //--- 12 POI buffers and mutates no sequence state. It is called here on the
P1399: 8003:    //--- SAME barShift the live cascade uses, so a hit is exactly a retest the
P1400: 8004:    //--- IDLE block would have consumed had the singleton been free.
P1401: 8005:    //---
P1402: 8006:    //--- Tier comparison uses g_authorityRank (lower is more authoritative),
P1403: 8007:    //--- the same ranking D-3 and G-2 already use. No distance, no size, no bar
P1404: 8008:    //--- count, no tolerance - Part A section 7 is not engaged.
P1405: 8009:    //---
P1406: 8010:    //--- Gated on InpDebugLog. Assigns nothing outside its own statics, reads
P1407: 8011:    //--- g_state / g_dir / g_anchorLine for labelling only, and cannot alter
P1408: 8012:    //--- control flow. R8 is NOT engaged.
P1409: 8013:    if(InpDebugLog && inWindow &&
P1410: 8014:       g_state > ST_IDLE && g_state != ST_ABORT && g_anchorLine >= 0)
P1411: 8015:      {
P1412: 8016:       static int s_t73_n      = 0;
P1413: 8017:       static int s_t73_higher = 0;
P1414: 8018:       static int s_t73_opp    = 0;
P1415: 8019:       static int s_t73_both   = 0;
P1416: 8020:       static int s_t73_bars   = 0;
P1417: 8021:       s_t73_bars++;
P1418: 8022:       PoiRetestResult t73_pr;
P1419: 8023:       if(DetectPoiRetest(barShift, t73_pr) && t73_pr.found)
P1420: 8024:         {
P1421: 8025:          s_t73_n++;
P1422: 8026:          ENUM_SRJ_DIR t73_dir    = t73_pr.isLong ? DIR_LONG : DIR_SHORT;
P1423: 8027:          bool         t73_isOpp  = (t73_dir != g_dir);
P1424: 8028:          bool         t73_isHigh = (g_authorityRank[t73_pr.topLine] <
P1425: 8029:                                     g_authorityRank[g_anchorLine]);
P1426: 8030:          if(t73_isHigh)               s_t73_higher++;
P1427: 8031:          if(t73_isOpp)                s_t73_opp++;
P1428: 8032:          if(t73_isOpp && t73_isHigh)  s_t73_both++;
P1429: 8033:          PrintFormat("[SRJ-EA] SUPPRESSED bar=%s poi=%s dir=%s opp=%d higher=%d "
P1430: 8034:                      "heldPoi=%s heldDir=%s heldState=%s "
P1431: 8035:                      "cum_n=%d cum_opp=%d cum_hi=%d cum_both=%d action=%s",
P1432: 8036:                      TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift),
P1433: 8037:                                   TIME_DATE|TIME_MINUTES),
P1434: 8038:                      g_lineCode[t73_pr.topLine], DirName(t73_dir),
P1435: 8039:                      (int)t73_isOpp, (int)t73_isHigh,
P1436: 8040:                      g_lineCode[g_anchorLine], DirName(g_dir), StateName(g_state),
P1437: 8041:                      s_t73_n, s_t73_opp, s_t73_higher, s_t73_both,
P1438: 8042:                      b3_superseded ? "SUPERSEDED" : "HELD");
P1439: 8043:         }
P1440: 8044:       if((s_t73_bars % 500) == 0)
P1441: 8045:          PrintFormat("[SRJ-EA] SUPPRESSED_PROGRESS heldBars=%d n=%d opp=%d "
P1442: 8046:                      "higher=%d both=%d",
P1443: 8047:                      s_t73_bars, s_t73_n, s_t73_opp, s_t73_higher, s_t73_both);
P1444: 8048:      }
P1445: 8049: 
P1446: 8050:    //--- [P-CONFIRM-SHADOW] per-bar retest book + confirmation-candle terms. LOG ONLY -
P1447: 8051:    //--- reads buffers and prints; assigns no state. With a candidate held, CONFIRMPOLL
P1448: 8052:    //--- runs against the held anchor; in IDLE it polls the top-ranked same-direction
P1449: 8053:    //--- retest of the bar (the seed's own input) so the calibration covers the pre-seed
P1450: 8054:    //--- bars too.
P1451: 8055:    if(InpDebugLog && (SHADOW_RETESTBOOK || SHADOW_CONFIRMPOLL) && inWindow)
P1452: 8056:      {
P1453: 8057:       ShadowRetestBook(barShift);
P1454: 8058:       ShadowRetestNearMiss(barShift);
P1455: 8059:       if(g_state > ST_IDLE && g_state != ST_ABORT && g_anchorLine >= 0)
P1456: 8060:          ShadowConfirmPoll(barShift, g_anchorLine, g_dir);
P1457: 8061:       else if(g_state == ST_IDLE)
P1458: 8062:         {
P1459: 8063:          PoiRetestResult sh_pr;
P1460: 8064:          if(DetectPoiRetest(barShift, sh_pr) && sh_pr.found)
P1461: 8065:             ShadowConfirmPoll(barShift, sh_pr.topLine,
P1462: 8066:                               sh_pr.isLong ? DIR_LONG : DIR_SHORT);
P1463: 8067:         }
P1464: 8068:       }
P1465: 8069: 
P1466: ```
P1467: 
P1468: ### Q3 fresh seed and normal stages - source lines 8094-8429
P1469: 
P1470: ```mql5
P1471: 8094:         //--- [P-RESQUAT-1 F-a] eviction-paired read gate: a candidate identical to
P1472: 8095:         //--- one its own abort just evicted (same line, same dir, same session,
P1473: 8096:         //--- same day) may not re-seed into the slot; the slot stays free so the
P1474: 8097:         //--- next evaluation consumes the next bar (the 57 convergence, W6b).
P1475: 8098:         //--- EXPIRE: a day-mismatched set is nonblocking and cleared here;
P1476: 8099:         //--- no timer, no bar count (R-b).
P1477: 8100:         ENUM_SRJ_DIR rsq_dir = pr.isLong ? DIR_LONG : DIR_SHORT;
P1478: 8101:         int rsq_bit = (pr.topLine >= 0 && pr.topLine < POI_NLINES) ? pr.topLine * 2 + (pr.isLong ? 0 : 1) : -1;
P1479: 8102:         bool rsq_blocked = false;
P1480: 8103:         datetime rsq_day = TC_DayStart(barTime);
P1481: 8104:         if(rsq_bit < 0)
P1482: 8105:           {
P1483: 8106:            PrintFormat("[SRJ-EA] RESEED_BLOCKED bar=%s action=INDEX-INVALID", TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES));
P1484: 8107:            return;
P1485: 8108:           }
P1486: 8109:         if(sess == SESSION_LONDON)
P1487: 8110:           {
P1488: 8111:            if(rsq_day != g_evictDayLon) g_evictBitsLon = 0;
P1489: 8112:            else if(rsq_bit >= 0 && (g_evictBitsLon & (1 << rsq_bit)) != 0) rsq_blocked = true;
P1490: 8113:           }
P1491: 8114:         else if(sess == SESSION_NYAM)
P1492: 8115:           {
P1493: 8116:            if(rsq_day != g_evictDayNY) g_evictBitsNY = 0;
P1494: 8117:            else if(rsq_bit >= 0 && (g_evictBitsNY & (1 << rsq_bit)) != 0) rsq_blocked = true;
P1495: 8118:           }
P1496: 8119:         if(rsq_blocked)
P1497: 8120:           {
P1498: 8121:            PrintFormat("[SRJ-EA] RESEED_BLOCKED bar=%s poi=%s dir=%s sess=%s evictedDay=%s action=SKIP",
P1499: 8122:                        TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES),
P1500: 8123:                        g_lineCode[pr.topLine], DirName(rsq_dir), SessionName(sess),
P1501: 8124:                        TimeToString(rsq_day, TIME_DATE));
P1502: 8125:            return;
P1503: 8126:           }
P1504: 8127:         s1g_legDir = pr.isLong ? 1 : -1;   //--- [SIDE1G] (0) independent legDir capture (new local only)
P1505: 8128:         g_s2_seedShift = barShift;   //--- [STAGE-C E-C05] exact-seed bar carriage for the live vote
P1506: 8129:          g_anchorLine    = pr.topLine;
P1507: 8130:        //--- [FP-LIMBSEAT-1 S2-3] F3 owns the carried-side write (single
P1508: 8131:        //--- writer). Live rows carry no declared class -> ABSTAIN
P1509: 8132:        //--- pass-through of the legacy value (D3 holds by construction);
P1510: 8133:        //--- legacy output stays the compared label, fire-log identical.
P1511: 8134:        g_dir           = S2ResolveLive(pr.isLong ? DIR_LONG : DIR_SHORT);
P1512: 8135:         SrjSideNote("DetectPoiRetest", g_dir);
P1513: 8136:       g_anchorBarTime = barTime;
P1514: 8137:       ReadBuf1(g_hPoi, pr.topLine, g_anchorPrice, barShift);
P1515: 8138:       g_sessionAtEntry = sess;
P1516: 8139:       g_divLatch = false;
P1517: 8140:       ENUM_SRJ_STATE prev = g_state;
P1518: 8141:       g_state = ST_S1_REGIME;
P1519: 8142:       LogState(prev, g_state);
P1520: 8143:       //--- [P-BUILD3 E2] seed census: the detector already returns argmin(rank);
P1521: 8144:       //--- tier-best == rank-best at seed (no held line), so ElectAnchor parity
P1522: 8145:       //--- holds by construction. Additive print only; assigns nothing.
P1523: 8146:       if(InpDebugLog)
P1524: 8147:          PrintFormat("[SRJ-EA] ANCHOR_ELECT bar=%s action=SEED poi=%s rank=%d tier=%d dir=%s",
P1525: 8148:                      TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift),
P1526: 8149:                                   TIME_DATE|TIME_MINUTES),
P1527: 8150:                      AnchorStr(), g_authorityRank[g_anchorLine],
P1528: 8151:                       B3_AnchorTier(g_anchorLine), DirName(g_dir));
P1529: 8152:          }
P1530: 8153: 
P1531: 8154:     //--- [P-VALIDITY-1 R2 2026-09-22, his renewal word: a held pre-confirmation seed dies on a session-liquidity touch, retest bar included; entry then needs a fresh POC/VWAP retest. Placed after the per-bar seed block: single pass per bar blocks same-bar re-admission. Fires ST_S1..ST_S4 named set only; S5+ committed; runs before the state-machine body; touch test reads pre-bar line state so extension bars don't false-fire; pre-bar swept-mask exclusion (Luna-2): R-POOL indices already swept as of barShift+1 skipped via disk-derived map, current-bar sweep still counts; tri-state (Luna-B): valid mask excludes, unavailable-or-invalid mask = R2SKIP hold with row; eval counter proves cadence.]
P1532: 8155:     if(g_state > ST_IDLE && g_state < ST_S5_GATE_CHECK && g_anchorBarTime > 0)
P1533: 8156:      {
P1534: 8157:       double r2_hi = iHigh(_Symbol, PERIOD_CURRENT, barShift);
P1535: 8158:       double r2_lo = iLow(_Symbol, PERIOD_CURRENT, barShift);
P1536: 8159:       const int r2_bufs[18] = { FL_BUF_PDAY_HIGH, FL_BUF_PDAY_LOW, FL_BUF_ASIA_HIGH, FL_BUF_ASIA_LOW, FL_BUF_LONDON_HIGH, FL_BUF_LONDON_LOW, FL_BUF_NY_HIGH, FL_BUF_NY_LOW, FL_BUF_PM_HIGH, FL_BUF_PM_LOW, FL_BUF_PD_ASIA_HIGH, FL_BUF_PD_ASIA_LOW, FL_BUF_PD_LONDON_HIGH, FL_BUF_PD_LONDON_LOW, FL_BUF_PD_NY_HIGH, FL_BUF_PD_NY_LOW, FL_BUF_PD_PM_HIGH, FL_BUF_PD_PM_LOW };
P1537: 8160:       bool r2_touch = false;
P1538: 8161:       double r2_val = 0.0;
P1539: 8162:       int r2_buf = -1;
P1540: 8163:       double r2_mask;
P1541: 8164:       if(!ReadFlow(FL_BUF_SWEPT_MASK, r2_mask, barShift + 1)) r2_mask = EMPTY_VALUE;
P1542: 8165:       bool r2_mValid = (MathIsValidNumber(r2_mask) && r2_mask == MathFloor(r2_mask) && r2_mask >= 0.0 && r2_mask < 4194304.0);
P1543: 8166:       int r2_m = (r2_mValid ? (int)MathRound(r2_mask) : 0);
P1544: 8167:       static int r2_evals = 0;
P1545: 8168:       if(!r2_mValid && InpDebugLog) PrintFormat("[SRJ-EA] R2SKIP bar=%s evals=%d (mask unavailable or invalid - seed held)", TimeToString(barTime, TIME_DATE|TIME_MINUTES), r2_evals);
P1546: 8169:       if(r2_mValid) r2_evals++;
P1547: 8170:       for(int r2_k = 0; r2_k < 18 && !r2_touch && r2_mValid; r2_k++)
P1548: 8171:         {
P1549: 8172:          double r2_v;
P1550: 8173:          int r2_sweptBit = (r2_k <= 9 ? r2_k : r2_k + 4);
P1551: 8174:          if((r2_m & (1 << r2_sweptBit)) != 0) continue;
P1552: 8175:          if(ReadFlow(r2_bufs[r2_k], r2_v, barShift + 1) && r2_lo <= r2_v && r2_v <= r2_hi)
P1553: 8176:             { r2_touch = true; r2_val = r2_v; r2_buf = r2_bufs[r2_k]; }
P1554: 8177:          }
P1555: 8178:       if(r2_touch && g_regime == REGIME_MEANREV)
P1556: 8179:         {
P1557: 8180:          ENUM_SRJ_STATE r2_prev = g_state;
P1558: 8181:          g_state = ST_IDLE;
P1559: 8182:          g_anchorLine = -1;
P1560: 8183:          g_anchorBarTime = 0;
P1561: 8184:          LogState(r2_prev, g_state);
P1562: 8185:          if(InpDebugLog) PrintFormat("[SRJ-EA] SEEDVOID bar=%s dir=%s buf=%d line=%s evals=%d hi=%s lo=%s", TimeToString(barTime, TIME_DATE|TIME_MINUTES), DirName(g_dir), r2_buf, DoubleToString(r2_val, _Digits), r2_evals, DoubleToString(r2_hi, _Digits), DoubleToString(r2_lo, _Digits));
P1563: 8186:         }
P1564: 8187:      }
P1565: 8188:          //--- [S2-TIMING-SHADOW-001] seed-bias recorder (Luna V94 F1, cleared BY NAME
P1566: 
P1567: ```
P1568: 
P1569: [Source comment line 8189 omitted because it contains non-ASCII; no executable code omitted.]
P1570: 
P1571: ```mql5
P1572: 
P1573: 8190:          //--- pure helper the S2 path calls (EA:7787), same buffer/semantics; NO new bias
P1574: 8191:           //--- computation (Sonnet build flag). Candidate dir = detector dir via s1g_legDir (equals pr.isLong on a seed bar), matching
P1575: 8192:          //--- the authored candidateDirection. Flip observed at grade via later rows
P1576: 8193:          //--- (pre-declared derivation). FORBIDDEN/ABSENT: any state/dir/latch/order/
P1577: 8194:           //--- stop/N1 write (documented guarantee, grade-verified).
P1578: 8195:           //--- Seed-gated per the s1f_seedThisBar idiom (EA:7664): emits only on the bar the seed fires.
P1579: 8196:           if(s1f_seedArmed && g_state == ST_S1_REGIME && g_dir != DIR_NONE && g_anchorLine >= 0)
P1580: 8197:            {
P1581: 8198:             bool s1t_aligned = false;
P1582: 8199:             string s1t_alOk = "UNREAD";
P1583: 8200:             ENUM_SRJ_DIR s1t_candDir = (s1g_legDir > 0 ? DIR_LONG : DIR_SHORT);   //--- seed-bar pr via file-scope capture (EA:1038 decl, assigned 7609 this pass)
P1584: 8201:              if(CheckLtfAlign(barShift, s1t_candDir, s1t_aligned))
P1585: 8202:                 s1t_alOk = s1t_aligned ? "1" : "0";
P1586: 8203:              s1g_seedBiasAl = ((s1t_alOk == "UNREAD") ? -1 : (s1t_aligned ? 1 : 0));   //--- [STAGE-D-S2-RGATE-001] seed-bias carriage (print-only file-scope; single-candidate machine + IDLE-gated reseed mean the eval reads its own seed; -1 guards never-seeded)
P1587: 8204:             if(InpDebugLog) PrintFormat("[SRJ-EA] SIDE1T_SEEDBIAS bar=%s dir=%s biasAligned=%s verdict=%s",
P1588: 8205:                         TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift),
P1589: 8206:                                      TIME_DATE|TIME_MINUTES),
P1590: 8207:                         DirName(s1t_candDir),
P1591: 8208:                         s1t_alOk,
P1592: 8209:                          (s1t_alOk == "1") ? "CONSIDER" : "REJECT-BIAS-TIMING");
P1593: 8210:             }
P1594: 8211:           //--- [P-BIRTH-PROBE-001] dual-reading birth probe (Luna V105-DUAL-READ-CLEAR-001, cleared BY NAME
P1595: 8212:           //--- print-only). At EVERY seed (same gate as SIDE1T): TF-verdict for SHORT (HTF bufs 19/20/21
P1596: 
P1597: ```
P1598: 
P1599: [Source comment line 8213 omitted because it contains non-ASCII; no executable code omitted.]
P1600: 
P1601: ```mql5
P1602: 
P1603: 8214:           //--- unrestorable, pure reads only, zero new semantics) AND MR-verdict for SHORT (sweep-tag
P1604: 8215:           //--- dir-match: SHORT needs a swept HIGH) printed SEPARATELY (row-type to council grade) +
P1605: 8216:           //--- confirm-for-SHORT via IsConfirmationCandle(DIR_SHORT) with N1 save/restore (6 counters:
P1606: 
P1607: ```
P1608: 
P1609: [Source comment line 8217 omitted because it contains non-ASCII; no executable code omitted.]
P1610: 
P1611: ```mql5
P1612: 
P1613: 8218:           //--- miscount, owned; exactly these 6 written in 2096-2137). Seed-identity: everything here is
P1614: 
P1615: ```
P1616: 
P1617: [Source comment line 8219 omitted because it contains non-ASCII; no executable code omitted.]
P1618: 
P1619: ```mql5
P1620: 
P1621: 8220:           //--- no staleness possible, no live-global re-read. No-race enforced AT GRADE (D6:
P1622: 8221:           //--- transfer-claimed lineages labeled via the PREEMPT join). FORBIDDEN/ABSENT: any state/dir/
P1623: 8222:           //--- latch/order/stop/N1 write (N1 restored), OrderSend, AdoptOff touch, fresh Detect calls,
P1624: 8223:           //--- price literals. tf=-1 guards HTF-read failure (grade asserts 0 occurrences).
P1625: 8224:           if(InpDebugLog && s1f_seedArmed && g_state == ST_S1_REGIME && g_dir != DIR_NONE && g_anchorLine >= 0)
P1626: 8225:             {
P1627: 8226:              double s1v_hH = 0.0, s1v_hM = 0.0, s1v_hL = 0.0;
P1628: 8227:              int s1v_hOk = 0, s1v_votes = 0;
P1629: 8228:              if(ReadFlow(FL_BUF_HTF_HIGH, s1v_hH, barShift) && ReadFlow(FL_BUF_HTF_MID, s1v_hM, barShift) && ReadFlow(FL_BUF_HTF_LOW, s1v_hL, barShift))
P1630: 8229:                {
P1631: 8230:                 s1v_hOk = 1;
P1632: 8231:                 if((int)MathRound(s1v_hH) == -1) s1v_votes++;
P1633: 8232:                 if((int)MathRound(s1v_hM) == -1) s1v_votes++;
P1634: 8233:                 if((int)MathRound(s1v_hL) == -1) s1v_votes++;
P1635: 8234:                }
P1636: 8235:              int s1v_tf = ((s1v_hOk == 0) ? -1 : ((s1v_votes >= 2) ? 1 : 0));
P1637: 8236:              double s1v_swD = 0.0;
P1638: 8237:              int s1v_tag = 0;
P1639: 8238:              if(ReadFlow(FL_BUF_SWEEP_TAG, s1v_swD, barShift)) s1v_tag = (int)MathRound(s1v_swD);
P1640: 8239:              int s1v_mr = (((s1v_tag == SWEEP_ASIA_HIGH) || (s1v_tag == SWEEP_LONDON_HIGH) || (s1v_tag == SWEEP_NY_HIGH) || (s1v_tag == SWEEP_PM_HIGH)) ? 1 : 0);
P1641: 8240:              int s1v_wEq = g_n1_vwapEq, s1v_poEq = g_n1_pocEq, s1v_wIv = g_n1_vwapInv, s1v_poIv = g_n1_pocInv, s1v_wSv = g_n1_vwapSurv, s1v_poSv = g_n1_pocSurv;
P1642: 8241:              string s1v_term = "";
P1643: 8242:              IsConfirmationCandle(barShift, g_anchorLine, DIR_SHORT, s1v_term);
P1644: 8243:              g_n1_vwapEq = s1v_wEq; g_n1_pocEq = s1v_poEq; g_n1_vwapInv = s1v_wIv; g_n1_pocInv = s1v_poIv; g_n1_vwapSurv = s1v_wSv; g_n1_pocSurv = s1v_poSv;
P1645: 8244:              if(s1v_term == "") s1v_term = "PASS";
P1646: 8245:              PrintFormat("[SRJ-EA] SIDE1V_BIRTH bar=%s dir=SHORT tf=%d mr=%d confShort=%s",
P1647: 8246:                          TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift),
P1648: 8247:                                       TIME_DATE|TIME_MINUTES),
P1649: 8248:                          s1v_tf, s1v_mr, s1v_term);
P1650: 8249:             }
P1651: 8250: 
P1652: 8251:     //--- [SIDE-1P-FIX-SPLIT Track-1/Track-2 AdoptOff shadow] print-only recorders.
P1653: 8252:    //--- Reads assigned state only. The gate consult's 6 N1 counter writes are
P1654: 8253:    //--- restored like-for-like (values identical after); every other call is pure.
P1655: 8254:    //--- No live-state, resolver, latch, order, stop, fixture or eligibility write.
P1656: 8255:    //--- Fires only on the exact seed bar (armed==IDLE at block entry, S1 after).
P1657: 8256:     {
P1658: 8257:      bool s1f_seedThisBar = (s1f_seedArmed && g_state == ST_S1_REGIME && g_dir != DIR_NONE && g_anchorLine >= 0);
P1659: 8258:      if(s1f_seedThisBar)
P1660: 8259:        {
P1661: 8260:         s1g_nSeed++;
P1662: 8261:         int s1f_vwEq = g_n1_vwapEq;
P1663: 8262:         int s1f_poEq = g_n1_pocEq;
P1664: 8263:         int s1f_vwIv = g_n1_vwapInv;
P1665: 8264:         int s1f_poIv = g_n1_pocInv;
P1666: 8265:         int s1f_vwSv = g_n1_vwapSurv;
P1667: 8266:         int s1f_poSv = g_n1_pocSurv;
P1668: 8267:         string s1f_term = "";
P1669: 8268:          bool s1f_ok = IsConfirmationCandle(barShift, g_anchorLine, (s1g_legDir > 0 ? DIR_LONG : DIR_SHORT), s1f_term);   //--- [STAGE-C] legacy-pin: shadow diagnoses the legacy path (G-C01/G-C06 parity; value-identical pre-Stage-C)
P1670: 8269:         g_n1_vwapEq = s1f_vwEq;
P1671: 8270:         g_n1_pocEq = s1f_poEq;
P1672: 8271:         g_n1_vwapInv = s1f_vwIv;
P1673: 8272:         g_n1_pocInv = s1f_poIv;
P1674: 8273:         g_n1_vwapSurv = s1f_vwSv;
P1675: 8274:         g_n1_pocSurv = s1f_poSv;
P1676: 8275:         double s1f_h4 = EMPTY_VALUE;
P1677: 8276:         double s1f_h1 = EMPTY_VALUE;
P1678: 8277:         ReadFlow(FL_BUF_HTF_HIGH, s1f_h4, barShift);
P1679: 8278:         ReadFlow(FL_BUF_HTF_MID, s1f_h1, barShift);
P1680: 8279:         int s1f_l4 = S2Leg(s1f_h4);
P1681: 8280:         int s1f_l1 = S2Leg(s1f_h1);
P1682: 8281:         string s1f_hier = "-";
P1683: 8282:         int s1f_conf = 0;
P1684: 8283:         if(s1f_l4 != 0 && s1f_l4 == s1f_l1) s1f_hier = (s1f_l4 > 0) ? "LONG" : "SHORT";
P1685: 8284:         else if(s1f_l4 != 0 && s1f_l1 != 0) s1f_conf = 1;
P1686: 8285:         if(InpDebugLog)
P1687: 8286:            PrintFormat("[SRJ-EA] SIDE1F_VOTE bar=%s dir=%s t1term=%s t1reject=%d hier=%s conf=%d",
P1688: 8287:                        TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES),
P1689: 8288:                        DirName(g_dir), s1f_term, (s1f_ok ? 0 : 1), s1f_hier, s1f_conf);
P1690: 8289:         if(s1f_hier == "SHORT" && InpDebugLog)
P1691: 8290:            PrintFormat("[SRJ-EA] SIDE1F_SHORT bar=%s anchor=%s",
P1692: 8291:                        TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES),
P1693: 8292:                        AnchorStr());
P1694: 8293:         //--- [SIDE1G] R1 PROFILE mirror (independent term booleans + pre-terms; NO second gate call)
P1695: 8294:         double s1g_o1 = iOpen (_Symbol, PERIOD_CURRENT, barShift + 1);
P1696: 8295:         double s1g_c1 = iClose(_Symbol, PERIOD_CURRENT, barShift + 1);
P1697: 8296:         double s1g_h1 = iHigh (_Symbol, PERIOD_CURRENT, barShift + 1);
P1698: 8297:         double s1g_l1 = iLow  (_Symbol, PERIOD_CURRENT, barShift + 1);
P1699: 8298:         double s1g_o0 = iOpen (_Symbol, PERIOD_CURRENT, barShift);
P1700: 8299:         double s1g_c0 = iClose(_Symbol, PERIOD_CURRENT, barShift);
P1701: 8300:         string s1g_pre = "PASS";
P1702: 8301:         if(s1g_o1 <= 0.0 || s1g_c1 <= 0.0 || s1g_o0 <= 0.0 || s1g_c0 <= 0.0) s1g_pre = "NO_DATA";
P1703: 8302:         double s1g_L = g_anchorPrice;
P1704: 8303:         if(s1g_pre == "PASS" && (s1g_L == EMPTY_VALUE || s1g_L <= 0.0)) s1g_pre = "NO_LINE";
P1705: 8304:         int s1g_opp = (((g_dir == DIR_LONG) ? (s1g_c1 < s1g_o1) : (s1g_c1 > s1g_o1))) ? 1 : 0;
P1706: 8305:         int s1g_a2 = (((g_dir == DIR_LONG) ? (s1g_c1 >= s1g_L) : (s1g_c1 <= s1g_L))) ? 1 : 0;
P1707: 8306:         int s1g_isDoji = ((MathAbs(s1g_c0 - s1g_o0) < _Point * 0.0001)) ? 1 : 0;
P1708: 8307:         int s1g_bodyDir = (((g_dir == DIR_LONG) ? (s1g_c0 > s1g_o0) : (s1g_c0 < s1g_o0))) ? 1 : 0;
P1709: 8308:         int s1g_body = ((s1g_isDoji == 0) && (s1g_bodyDir == 1)) ? 1 : 0;
P1710: 8309:         int s1g_touch = (((s1g_h1 >= s1g_L - _Point) && (s1g_l1 <= s1g_L + _Point))) ? 1 : 0;
P1711: 8310:         string s1g_derived = (s1g_pre != "PASS") ? s1g_pre : ((s1g_opp == 0) ? "A_OPP" : ((s1g_a2 == 0) ? "A2_CLOSE_BREAK" : ((s1g_body == 0) ? "B_BODY" : ((s1g_touch == 0) ? "C_TOUCH" : "PASS"))));
P1712: 8311:         string s1g_t1 = (s1f_term == "") ? "PASS" : s1f_term;
P1713: 8312:         int s1g_match = (s1g_derived == s1g_t1) ? 1 : 0;
P1714: 8313:         s1g_nProf++;
P1715: 8314:         if(InpDebugLog)
P1716: 8315:            PrintFormat("[SRJ-EA] SIDE1G_PROFILE bar=%s opp=%d a2=%d body=%d touch=%d pre=%s term=%s t1term=%s match=%d",
P1717: 8316:                        TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES),
P1718: 8317:                        s1g_opp, s1g_a2, s1g_body, s1g_touch, s1g_pre, s1g_derived, s1g_t1, s1g_match);
P1719: 8318:         //--- [SIDE1G] R2 VOTE3 (legDir capture vs buffer vote + 15m read-only leg)
P1720: 8319:         double s1g_m15 = EMPTY_VALUE;
P1721: 8320:         ReadFlow(FL_BUF_HTF_LOW, s1g_m15, barShift);
P1722: 8321:         int s1g_lm = S2Leg(s1g_m15);
P1723: 8322:         int s1g_agree = ((s1f_l4 != 0) && (s1f_l4 == s1f_l1) && (s1g_legDir == s1f_l4)) ? 1 : 0;
P1724: 8323:         s1g_nV3++;
P1725: 8324:         if(InpDebugLog)
P1726: 8325:            PrintFormat("[SRJ-EA] SIDE1G_VOTE3 bar=%s h4=%s h1=%s m15=%s l4=%d l1=%d lm=%d legDir=%d gdir=%s agree=%d",
P1727: 8326:                        TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES),
P1728: 8327:                        DoubleToString(s1f_h4, 1), DoubleToString(s1f_h1, 1), DoubleToString(s1g_m15, 1),
P1729: 8328:                        s1f_l4, s1f_l1, s1g_lm, s1g_legDir, DirName(g_dir), s1g_agree);
P1730: 8329:          //--- [STAGE-C E-C01] Track-1 B_BODY-only live consult (owned g_dir; N1-neutral; Sonnet-v71 S1 live-gating semantics: non-B_BODY false = pass)
P1731: 8330:          int s1c_vwEq = g_n1_vwapEq;
P1732: 8331:          int s1c_poEq = g_n1_pocEq;
P1733: 8332:          int s1c_vwIv = g_n1_vwapInv;
P1734: 8333:          int s1c_poIv = g_n1_pocInv;
P1735: 8334:          int s1c_vwSv = g_n1_vwapSurv;
P1736: 8335:          int s1c_poSv = g_n1_pocSurv;
P1737: 8336:          string s1c_term = "";
P1738: 8337:          bool s1c_ok = IsConfirmationCandle(barShift, g_anchorLine, g_dir, s1c_term);
P1739: 8338:          g_n1_vwapEq = s1c_vwEq;
P1740: 8339:          g_n1_pocEq = s1c_poEq;
P1741: 8340:          g_n1_vwapInv = s1c_vwIv;
P1742: 8341:          g_n1_pocInv = s1c_poIv;
P1743: 8342:          g_n1_vwapSurv = s1c_vwSv;
P1744: 8343:          g_n1_pocSurv = s1c_poSv;
P1745: 8344:          //--- [C0-PROBE] suppression effect DELETED: consult above kept, prints kept, NO g_state write
P1746: 8345:          if(!s1c_ok && s1c_term == "B_BODY")
P1747: 8346:            {
P1748: 8347:             if(InpDebugLog)
P1749: 8348:                PrintFormat("[SRJ-EA] SIDE1C_SUPP bar=%s dir=%s term=%s", TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES), DirName(g_dir), s1c_term);
P1750: 8349:            }
P1751: 8350:          //--- [C0-PROBE] both-dirs failTerm row per seed (each leg N1-neutral, same save/restore idiom)
P1752: 8351:          {
P1753: 8352:           int s1c_bVwEq = g_n1_vwapEq;
P1754: 8353:           int s1c_bPoEq = g_n1_pocEq;
P1755: 8354:           int s1c_bVwIv = g_n1_vwapInv;
P1756: 8355:           int s1c_bPoIv = g_n1_pocInv;
P1757: 8356:           int s1c_bVwSv = g_n1_vwapSurv;
P1758: 8357:           int s1c_bPoSv = g_n1_pocSurv;
P1759: 8358:           string s1c_termLong = "";
P1760: 8359:           string s1c_termShort = "";
P1761: 8360:           IsConfirmationCandle(barShift, g_anchorLine, DIR_LONG, s1c_termLong);
P1762: 8361:           g_n1_vwapEq = s1c_bVwEq;
P1763: 8362:           g_n1_pocEq = s1c_bPoEq;
P1764: 8363:           g_n1_vwapInv = s1c_bVwIv;
P1765: 8364:           g_n1_pocInv = s1c_bPoIv;
P1766: 8365:           g_n1_vwapSurv = s1c_bVwSv;
P1767: 8366:           g_n1_pocSurv = s1c_bPoSv;
P1768: 8367:           IsConfirmationCandle(barShift, g_anchorLine, DIR_SHORT, s1c_termShort);
P1769: 8368:           g_n1_vwapEq = s1c_bVwEq;
P1770: 8369:           g_n1_pocEq = s1c_bPoEq;
P1771: 8370:           g_n1_vwapInv = s1c_bVwIv;
P1772: 8371:           g_n1_pocInv = s1c_bPoIv;
P1773: 8372:           g_n1_vwapSurv = s1c_bVwSv;
P1774: 8373:           g_n1_pocSurv = s1c_bPoSv;
P1775: 8374:           if(InpDebugLog)
P1776: 8375:              PrintFormat("[SRJ-EA] SIDE1C_BOTHDIRS bar=%s live=%s liveTerm=%s longTerm=%s shortTerm=%s",
P1777: 8376:                          TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES),
P1778: 8377:                          DirName(g_dir), s1c_term, s1c_termLong, s1c_termShort);
P1779: 8378:           if(InpDebugLog)
P1780: 8379:              PrintFormat("[SRJ-EA] SIDE1C_CHAIN bar=%s chainN=%d",
P1781: 8380:                          TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES),
P1782: 8381:                          g_side_n);
P1783: 8382:          }
P1784: 8383:         }
P1785: 8384:     }
P1786: 8385: 
P1787: 8386:      if(g_state == ST_S1_REGIME)
P1788: 8387:      {
P1789: 8388:       if((barTime - g_anchorBarTime) >= 3600 && g_anchorLine >= 0)
P1790: 8389:         {
P1791: 8390:          if(InpDebugLog) PrintFormat("[SRJ-EA] UJHOLDEXPIRE bar=%s poi=%s dir=%s heldMin=%d - unconfirmed holder expired, no eviction (Fix H2)", TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES), AnchorStr(), DirName(g_dir), (int)((barTime - g_anchorBarTime) / 60));
P1792: 8391:          GoAbort(ABORT_HOLDER_EXPIRED, g_state); return;
P1793: 8392:         }
P1794: 8393:       ENUM_SRJ_REGIME regime;
P1795: 8394:       if(!ClassifyRegime(barShift, g_dir, regime))
P1796: 8395:         { GoAbort(ABORT_UPSTREAM_UNREADY, g_state); return; }
P1797: 8396:       if(regime == REGIME_NONE)
P1798: 8397:         { if(InpDebugLog) PrintFormat("[SRJ-EA] S1WAIT bar=%s dir=%s poi=%s sess=%s - regime unclassified, candidate RETAINED (Stage 3a)", TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES), DirName(g_dir), AnchorStr(), SessionName(g_sessionAtEntry)); return; }
P1799: 8398:       g_regime = regime;
P1800: 8399:       ENUM_SRJ_STATE prev = g_state;
P1801: 8400:       g_state = ST_S2_LTF_ALIGN;
P1802: 8401:       LogState(prev, g_state);
P1803: 8402:      }
P1804: 8403: 
P1805: 8404:    if(g_state == ST_S2_LTF_ALIGN)
P1806: 8405:      {
P1807: 8406:       bool aligned;
P1808: 8407:       if(!CheckLtfAlign(barShift, g_dir, aligned))
P1809: 8408:         { GoAbort(ABORT_UPSTREAM_UNREADY, g_state); return; }
P1810: 8409:       if(!aligned)
P1811: 8410:         {
P1812: 8411:          double uj_m15b = 0.0;
P1813: 8412:          bool uj_m15r = ReadFlow(FL_BUF_HTF_LOW, uj_m15b, barShift);
P1814: 8413:          double uj_wantb = (g_dir == DIR_LONG ? 1.0 : -1.0);
P1815: 8414:          if(InpDebugLog) PrintFormat("[SRJ-EA] UJPROV bar=%s dir=%s reseedBar=%s seedBiasAl=%d reseedDir=%d exempt=%d - reseed provenance at S2 edge (Fix CARRY)", TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES), DirName(g_dir), TimeToString(g_ujOpReseedBarTime, TIME_DATE|TIME_MINUTES), s1g_seedBiasAl, g_ujOpReseedDir, ((uj_m15r && uj_m15b == uj_wantb && (s1g_seedBiasAl != 0 || (g_ujOpReseedBarTime != 0 && g_ujOpReseedDir != 0 && g_ujOpReseedDir == (g_dir == DIR_LONG ? 1 : (g_dir == DIR_SHORT ? -1 : 0))))) ? 1 : 0));
P1816: 8415:          if(uj_m15r && uj_m15b == uj_wantb && (s1g_seedBiasAl != 0 || (g_ujOpReseedBarTime != 0 && g_ujOpReseedDir != 0 && g_ujOpReseedDir == (g_dir == DIR_LONG ? 1 : (g_dir == DIR_SHORT ? -1 : 0)))))
P1817: 8416:            { double uj_ltfb = 0.0; int uj_ltfOk = ReadFlow(FL_BUF_LTF_BIAS, uj_ltfb, barShift) ? 1 : 0;
P1818: 8417:              int uj_m15s = (int)iTime(_Symbol, PERIOD_CURRENT, barShift);
P1819: 8418:              datetime uj_m15src = (datetime)(uj_m15s - uj_m15s % 900);
P1820: 8419:              if(InpDebugLog) PrintFormat("[SRJ-EA] S2PROMOTE_M15 bar=%s dir=%s poi=%s sess=%s m15=%s m15src=%s ltf=%s sb=%d rf=%d/%d", TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES), DirName(g_dir), AnchorStr(), SessionName(g_sessionAtEntry), DoubleToString(uj_m15b, 1), TimeToString(uj_m15src, TIME_DATE|TIME_MINUTES), UjDbl(uj_ltfb), s1g_seedBiasAl, (uj_m15r ? 1 : 0), uj_ltfOk); }
P1821: 8420:          else if(uj_m15r && uj_m15b == uj_wantb)
P1822: 8421:            { if(InpDebugLog) PrintFormat("[SRJ-EA] S2SEEDBIAS_KILL bar=%s dir=%s poi=%s - seedbias refused, promotion killed (Fix B2)", TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES), DirName(g_dir), AnchorStr()); GoAbort(ABORT_SEEDBIAS_REFUSED, g_state); return; }
P1823: 8422:          else
P1824: 8423:            { if(InpDebugLog) PrintFormat("[SRJ-EA] S2WAIT bar=%s dir=%s poi=%s sess=%s - LTF bias unaligned, candidate RETAINED (Stage 3a)", TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES), DirName(g_dir), AnchorStr(), SessionName(g_sessionAtEntry)); return; }
P1825: 8424:         }
P1826: 8425:       ENUM_SRJ_STATE prev = g_state;
P1827: 8426:       g_state = ST_S3_ZONE_WAIT;
P1828: 8427:       LogState(prev, g_state);
P1829: 8428:      }
P1830: 8429:        //--- [v20 S-b] contender evaluation (self-contained; transfer shape mirrors EA-7813-7829, cited, not pasted).
P1831: ```
P1832: 
P1833: ### Q3 contender evaluation and abort application - source lines 8430-8476
P1834: 
P1835: ```mql5
P1836: 8430:        if(g_state == ST_S3_ZONE_WAIT || g_state == ST_S4_ARMED) {
P1837: 8431:        bool uj_sbHave = false; ENUM_SRJ_DIR uj_sbDir = DIR_NONE; int uj_sbLine = -1;
P1838: 8432:        {
P1839: 8433:         PoiRetestResult uj_sbPr;
P1840: 8434:         if(DetectPoiRetest(barShift, uj_sbPr) && uj_sbPr.found)
P1841: 8435:           { uj_sbHave = true; uj_sbDir = uj_sbPr.isLong ? DIR_LONG : DIR_SHORT; uj_sbLine = uj_sbPr.topLine; }
P1842: 8436:        }
P1843: 8437:        string uj_sbTermC = "", uj_sbTermH = "";
P1844: 8438:         bool uj_sbConfC = (uj_sbHave && (uj_sbDir != g_dir)) ? IsConfirmationCandle(barShift, uj_sbLine, uj_sbDir, uj_sbTermC, true) : false;
P1845: 8439:        bool uj_sbConfH = IsConfirmationCandle(barShift, g_anchorLine, g_dir, uj_sbTermH);
P1846: 8440:         double uj_sbLineVal = 0.0; if(uj_sbHave && uj_sbLine >= 0 && !ReadBuf1(g_hPoi, uj_sbLine, uj_sbLineVal, barShift)) uj_sbLineVal = 0.0;
P1847: 8441:         double uj_sbo1 = iOpen (_Symbol, PERIOD_CURRENT, barShift + 1); double uj_sbc1 = iClose(_Symbol, PERIOD_CURRENT, barShift + 1); double uj_sbc0 = iClose(_Symbol, PERIOD_CURRENT, barShift); int uj_sbarm = 1;
P1848: 8442:         if(InpDebugLog) PrintFormat("[SRJ-EA] UJSBTELEM bar=%s dir=%s have=%d sbDir=%s sbLine=%d confC=%d confH=%d sbL=%s o1=%s c1=%s c0=%s arm=%d termC=%s termH=%s - contender evaluation (Fix S3)", TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES), DirName(g_dir), (int)uj_sbHave, DirName(uj_sbDir), uj_sbLine, (int)uj_sbConfC, (int)uj_sbConfH, DoubleToString(uj_sbLineVal, _Digits), DoubleToString(uj_sbo1, _Digits), DoubleToString(uj_sbc1, _Digits), DoubleToString(uj_sbc0, _Digits), uj_sbarm, uj_sbTermC, uj_sbTermH);
P1849: 8443:        if(uj_sbConfC && !uj_sbConfH && (g_state == ST_S3_ZONE_WAIT || g_state == ST_S4_ARMED))
P1850: 8444:          {
P1851: 8445:           int uj_sbFromLine = g_anchorLine; ENUM_SRJ_DIR uj_sbFromDir = g_dir;
P1852: 8446:           g_anchorLine = uj_sbLine; g_dir = uj_sbDir;
P1853: 8447:           ReadBuf1(g_hPoi, uj_sbLine, g_anchorPrice, barShift);
P1854: 8448:           g_anchorBarTime = barTime;
P1855: 8449:           g_zoneHi = 0.0; g_zoneLo = 0.0; g_touchSeen = false;
P1856: 8450:           g_touchBarHi = 0.0; g_touchBarLo = 0.0;
P1857: 8451:           g_latchedEntry = 0.0; g_latchedSl = 0.0; g_latchedTp = 0.0; g_latchedR = 0.0;
P1858: 8452:           g_latchBarTime = 0; g_confirmFromState = ST_IDLE;
P1859: 8453:           uj_memo_valid = false;
P1860: 8454:           if(InpDebugLog)
P1861: 8455:              PrintFormat("[SRJ-EA] SIDE1C_YIELD bar=%s from=%s fromDir=%s to=%s toDir=%s state=%s term=%s",
P1862: 8456:                          TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES),
P1863: 8457:                          g_lineCode[uj_sbFromLine], DirName(uj_sbFromDir),
P1864: 8458:                          g_lineCode[uj_sbLine], DirName(uj_sbDir),
P1865: 8459:                          StateName(g_state), uj_sbTermC);
P1866: 8460:          }
P1867: 8461:        }
P1868: 8462:        //--- [v20 S-a] deferred-abort application (identity-keyed on anchor+dir+barTime; set in Fix F11 tail).
P1869: 8463:        if(uj_saAbort)
P1870: 8464:          {
P1871: 8465:           if(uj_saA == g_anchorLine && uj_saD == (int)g_dir && uj_saT == g_anchorBarTime)
P1872: 8466:             {
P1873: 8467:              if(InpDebugLog) PrintFormat("[SRJ-EA] UJDEFERAPPLY bar=%s dir=%s poi=%s - deferred LTF abort applies, holder unchanged (Fix S-a)", TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES), DirName(g_dir), AnchorStr());
P1874: 8468:              GoAbort(ABORT_LTF_MISALIGN, g_state);
P1875: 8469:              return;
P1876: 8470:             }
P1877: 8471:           else
P1878: 8472:             {
P1879: 8473:              if(InpDebugLog) PrintFormat("[SRJ-EA] UJDEFERDROP bar=%s dir=%s poi=%s - deferred LTF abort dropped, holder changed (Fix S-a)", TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES), DirName(g_dir), AnchorStr());
P1880: 8474:             }
P1881: 8475:           uj_saAbort = false;
P1882: 8476:          }
P1883: ```
P1884: 
P1885: ## 11 - Confirmation predicate source
P1886: 
P1887: ### Full current IsConfirmationCandle function - EA source lines 2337-2378
P1888: 
P1889: ```mql5
P1890: 2337:  bool IsConfirmationCandle(const int barShift, const int anchorLine,
P1891: 2338:                            const ENUM_SRJ_DIR dir, string &failTerm, const bool allowReclaim = false)
P1892: 2339:   {
P1893: 2340:    failTerm = "";
P1894: 2341:    if(anchorLine < 0 || dir == DIR_NONE) { failTerm = "NO_ANCHOR"; return false; }
P1895: 2342:    double o1 = iOpen (_Symbol, PERIOD_CURRENT, barShift + 1);
P1896: 2343:    double c1 = iClose(_Symbol, PERIOD_CURRENT, barShift + 1);
P1897: 2344:    double h1 = iHigh (_Symbol, PERIOD_CURRENT, barShift + 1);
P1898: 2345:    double l1 = iLow  (_Symbol, PERIOD_CURRENT, barShift + 1);
P1899: 2346:    double o0 = iOpen (_Symbol, PERIOD_CURRENT, barShift);
P1900: 2347:    double c0 = iClose(_Symbol, PERIOD_CURRENT, barShift);
P1901: 2348:    if(o1 <= 0.0 || c1 <= 0.0 || o0 <= 0.0 || c0 <= 0.0)
P1902: 2349:       { failTerm = "NO_DATA"; return false; }
P1903: 2350:    double L;
P1904: 2351:    if(!ReadBuf1(g_hPoi, anchorLine, L, barShift))
P1905: 2352:       { failTerm = "NO_LINE"; return false; }
P1906: 2353:     if(L == EMPTY_VALUE || L <= 0.0)
P1907: 2354:        { failTerm = "NO_LINE"; return false; }
P1908: 2355:     //--- [P-SLDEF-1 E14] N1 counters at the VWAP/POC site. Grounding: A2
P1909: 2356:     //--- needs c1 >= L (LONG) / c1 <= L (SHORT) - "applies to VWAP and POC
P1910: 2357:     //--- alike": exact equality passes. Family by line code.
P1911: 2358:     //--- [P-SLDEF-1b E19] A2 verdict flags: set where equality is encountered,
P1912: 2359:     //--- paired at each terminal return below (no branch touched).
P1913: 2360:     bool n1_vw = false, n1_poc = false;
P1914: 2361:     if(c1 == L)
P1915: 2362:       {
P1916: 2363:        if(StringFind(g_lineCode[anchorLine], "VWAP") >= 0) { g_n1_vwapEq++; n1_vw = true; }
P1917: 2364:        if(StringFind(g_lineCode[anchorLine], "POC") >= 0) { g_n1_pocEq++; n1_poc = true; }
P1918: 2365:       }
P1919: 2366:     bool oppCandle = (dir == DIR_LONG)  ? (c1 < o1) : (c1 > o1);
P1920: 2367:     if(!oppCandle)  { failTerm = "A_OPP"; if(n1_vw) g_n1_vwapInv++; if(n1_poc) g_n1_pocInv++; return false; }
P1921: 2368:     bool closeSideOk = (dir == DIR_LONG) ? (c1 >= L || (allowReclaim && o1 <= L && c0 >= o1)) : (c1 <= L || (allowReclaim && o1 >= L && c0 <= o1));
P1922: 2369:     if(!closeSideOk) { failTerm = "A2_CLOSE_BREAK"; if(n1_vw) g_n1_vwapInv++; if(n1_poc) g_n1_pocInv++; return false; }
P1923: 2370:     double body    = MathAbs(c0 - o0);
P1924: 2371:     bool   isDoji  = (body < _Point * 0.0001);
P1925: 2372:     bool   bodyDir = (dir == DIR_LONG)  ? (c0 > o0) : (c0 < o0);
P1926: 2373:     if(isDoji || !bodyDir) { failTerm = "B_BODY"; if(n1_vw) g_n1_vwapInv++; if(n1_poc) g_n1_pocInv++; return false; }
P1927: 2374:     bool touch = (h1 >= L - _Point && l1 <= L + _Point);
P1928: 2375:     if(!touch)      { failTerm = "C_TOUCH"; if(n1_vw) g_n1_vwapInv++; if(n1_poc) g_n1_pocInv++; return false; }
P1929: 2376:     if(n1_vw) g_n1_vwapSurv++; if(n1_poc) g_n1_pocSurv++;
P1930: 2377:     return true;
P1931: 2378:   }
P1932: ```
P1933: 
P1934: ## 12 - Trade API census
P1935: Current EA grep counts (same saved source identity as section 6): `CTrade` object declaration 1 at EA 13; `SetTypeFilling` calls 2 at EA 10799 and 11815; `PositionModify` calls 0; `SetAsyncMode` calls 0. This is a count of source occurrences: `MtReset` has one definition (EA 349) and one call (EA 10656); no second call site was found. These are source counts, not a claim about the standard-library default. The build packet must pin the actual async configuration and account margin mode before claiming server execution/readback timing.
P1936: ### Trade API declaration - EA source line 13
P1937: 
P1938: ```mql5
P1939: 13: CTrade g_trade;
P1940: ```
P1941: 
P1942: ### Existing trade setup - EA source lines 10796-10802
P1943: 
P1944: ```mql5
P1945: 10796:            { GoAbort(ABORT_BELOW_STOPS, g_state); return; }
P1946: 10797: 
P1947: 10798:          g_trade.SetExpertMagicNumber(magic);
P1948: 10799:          g_trade.SetTypeFilling(GetCorrectFillingMode(_Symbol));
P1949: 10800:          string comment = (g_sessionAtEntry == SESSION_LONDON) ? "SRJ-LONDON" : "SRJ-NYAM";
P1950: 10801: 
P1951: 10802:          bool tradeResult = false;
P1952: ```
P1953: 
P1954: ### Existing close trade setup - EA source lines 11815-11825
P1955: 
P1956: ```mql5
P1957: 11815:    g_trade.SetTypeFilling(GetCorrectFillingMode(_Symbol));
P1958: 11816:    bool ok = g_trade.PositionClose(ticket);
P1959: 11817:    long closerc = g_trade.ResultRetcode();
P1960: 11818:    ulong closedeal = g_trade.ResultDeal();
P1961: 11819:    long closepid = 0;
P1962: 11820:    int closeentry = -1;
P1963: 11821:    if(closedeal > 0 && HistoryDealSelect(closedeal))
P1964: 11822:      {
P1965: 11823:       closepid = HistoryDealGetInteger(closedeal, DEAL_POSITION_ID);
P1966: 11824:       closeentry = (int)HistoryDealGetInteger(closedeal, DEAL_ENTRY);
P1967: 11825:      }
P1968: ```
