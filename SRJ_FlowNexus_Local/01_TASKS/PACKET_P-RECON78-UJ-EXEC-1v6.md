# PACKET P-RECON78-UJ-EXEC-1 v6 - June UJ execution repair and same-pass flip release

Status: v6 DRAFT for one focused page review by Sonnet and GLM. CONTINUE after V394 / packet v5. V391 is the earlier Codex-authored relay reference; V392-V394 review artifacts are inputs to this fold, not templates. The 2026-06-01 through 2026-06-13 RECON78 run is the only current run evidence. Its one-run authorization is consumed. This page authorizes no source edit, build, tester run, key request, live action, commit, or push.

Line convention: physical lines; blank lines count; title is line 1. The twin below must reproduce every physical packet line exactly. This page asks only about the unresolved execution repair and June 11 arbitration design. Q2 (June 5 NY 16:15 seed-bias refusal) is carried closed on the required Sonnet+GLM seats; no Q2 re-review is requested. R1/R2 register application remains gated on your explicit word.

## 1 - Build defect carried from RECON78

On 5 June New York USDJPY, the EA changed only its model `g_mtrade.tpRef` from 160.723 to the closed-session target 160.298. It later emitted model `TP_TOUCH` at 160.298, while the broker TP remained 160.723 and the live position was stopped on 11 June at 159.725. The 5 June London short shows the same model/broker divergence: model retarget 159.908 and `TP_TOUCH`; the broker still filled the original 159.900. This is the execution defect that Q1 must solve. Exact-price/no-leniency remains in force; a model print is not a broker execution.

## 2 - Governing operator pins and fixed boundaries

- SRJ strategy memory: `.opencode/skills/srj-strategy/SKILL.md` §§1, 2, 8, 10. `RETARGET-CLOSED-AM` and `SYMMETRY-NEAREST`: only a closed session's directional extreme can become the nearest valid target. `EXACT-PRICE-NO-LENIENCY`: next-candle entry open and booked/revised target exit are exact; spread drift is a defect, never tolerance.
- `FLIP-KILLED-NEVER-VETOES`: a potential killed by the 5m structure-bias flip cannot keep vetoing the challenger. `LIVE-TRADE-BLOCKS-ALL`: an already-live position of the same pair/session still blocks a new setup. These govern different states: candidate arbitration versus a broker-open trade.
- June 11 New York USDJPY: retest + confirmation bar 14:35; entry bar is 14:40 open. 14:45 is post-entry and cannot grade selection.
- June 5 New York USDJPY 16:15 is still a distinct missed entry; the later 16:55 position is not its substitute. It is carried context only and not reopened as Q2.
- Alert-only remains structural. There is no live order path authorized here. No new run is authorized.

## 3 - V394 disposition and this fold's scope

The V394 replies are already filed. Required seats: Sonnet returned Q1 DISCREPANCY, Q2 CONFIRM, Q3 DISCREPANCY; GLM returned Q1 DISCREPANCY, Q2 CONFIRM, Q3 CONFIRM. Thus Q1 amends; Q2 is closed by the required seats and is not re-asked; Q3 carries Sonnet's state-flow conditions into this narrowed review. Luna's builder review is evidence input, not a voting seat. V394 did not grant build/run authority.

This page changes the Q3 design premise: the `SUPPRESSED` print is a diagnostic census row; it is not the gate. The operative seed gate is the `g_state == ST_IDLE` path. The proposed release consumes a same-pass, identity-matched deferred abort before that seed gate, then allows the challenger through the normal IDLE seed path. It does not transfer an S4_ARMED state, zone, or latch to a new direction.

## 4 - Q1: proposed broker TP synchronization contract

This is a proposed design, not implemented code. The helper body and retry block do not exist in the current EA and are not claimed as source exhibits.

**Recommendation.** Add `UjSyncBrokerTp(entryPid, target)` at the retarget site immediately after `g_mtrade.tpRef` is revised and before `tpBookedTouch` is evaluated. Resolve the live ticket from the position identifier, then require matching symbol and magic. Read and preserve that position's live SL. Submit `PositionModify(ticket, liveSL, NormalizeDouble(target,_Digits))`; a successful library return alone is insufficient: require the documented success retcode and a broker-position TP readback equal to the normalized target. If already equal, emit a named `UJTPMODIFY_SKIP` and do not count a modify attempt.

Per-instance proposed fields: `ujTpSyncAttempts`, `ujTpSyncAttemptBarTime`, `ujTpSyncState`, and `ujTpSyncTarget`. Attempt at most once per evaluated M5 bar and at most three attempts total for one retargeted instance. Each unsuccessful request or failed exact readback consumes one attempt. After attempt three, latch terminal FAIL and stop retrying; unclassified retcodes do not create an unbounded retry path. Emit `UJTPMODIFY_FAIL` with instance, target, retcode, attempt number and final state. Do not market-close on failure: the original broker SL/TP stay in control, the acceptance fails, and the mismatch remains visible in `UJORPHAN`.

The retry host is after the active check at EA 11845 and before the state gate at EA 11846. The current source sets `g_mtrade.active=false` only at initialization (EA 351) and true on fill (EA 10702); model close changes state to `MT_CLOSED` but does not clear active. This proposed host can therefore service a closed-model/open-broker instance before the state gate, subject to exact per-instance position resolution.

O6 admission rule: before emitting a new same-pair/same-session SIGNAL, block while a broker position belonging to that pair/session remains open, including an older position from that session. This is session-scoped; a London position does not block a New York setup. Use broker-confirmed exit as the end of the live instance. This rule is essential to Q3: the June 11 Long can be admitted only if Q1's June 5 New York position has already broker-closed; if it remains open, suppressing the new setup is correct under the live-position pin.

**Q1 review asks.**

Q1 verdict: CONFIRM / OBJECT / DISCREPANCY.

- Ask A: is this proposed helper, bounded retry contract, exact insert site and same-session live-position gate complete and internally consistent for the 5 June retarget defect? Identify any missing field, source site, failure disposition, or MQL5 behavior that must be settled before a build task.
- Ask B: is the future acceptance exact and sufficient? Require both June 5 NY (160.723 -> 160.298) and London (159.900 -> 159.908) to show the broker TP modification/readback and actual broker TP deal at the revised value, preserved SL, and no later broker stop; require zero successful acceptance when the modify fails or the broker fill remains at the original target. The current run has no modify call, modify event, or revised-target deal; do not claim those outcomes already happened.

## 5 - Q3: same-pass flip release without S4 state transfer

Current sequence on 11 June: at the pass evaluating bar 14:35, the opposite SHORT S4_ARMED holder gets `LTFFLIP` and sets `uj_saAbort` keyed to anchor, direction and bar time; the equal-tier LONG Daily-POC candidate is then excluded while the singleton is occupied; deferred abort is applied only later. The source's `SUPPRESSED` print reports the exclusion; it does not perform it.

**Recommendation.** When `uj_saAbort` matches the current holder identity, consume that abort once before the normal IDLE seed check. Capture/retain no S4 zone, touch, entry, SL, TP, or confirmation latches. Let `GoAbort` reset the dead holder, clear the consumed deferred-abort local, then pass the current bar once through the existing IDLE seed path so the 14:35 LONG retest+confirmation is freshly evaluated. Do not rerun the whole bar or process the candidate twice. If this placement cannot safely reach the existing IDLE path in the same pass, council must give one concrete alternative state map; no S4-to-LONG state transfer is presumed safe.

Do not release or seed a candidate while a same-pair/same-session broker position remains open. Q1 must first demonstrate broker exit of the 5 June NY trade at 160.298 before a June 11 NY entry can be expected. Q3 outcome is conditional on that prerequisite; the baseline June 11 miss does not contain a LONG confirm, alert, admission, or deal at 160.524.

**Q3 review asks.**

Q3 verdict: CONFIRM / OBJECT / DISCREPANCY.

- Ask A: does consuming the matching deferred abort before the IDLE seed path express `FLIP-KILLED-NEVER-VETOES` while preserving the pre-confirmation 5m flip kill, normal fresh S1/S2/S3/S4 initialization, same-bar POC-over-VWAP ranking, and no duplicate pass? Trace the proposed sequence against the spliced source and name any missing clear/write/return site.
- Ask B: is this future acceptance gradeable without asserting an unobserved outcome? Require (i) Q1's prior same-session broker position closed at its exact revised TP before 11 June; (ii) 11 June 14:35 LONG retest+confirmation processed through normal state initialization; (iii) 14:40 open signal/deal exactly 160.524 for the registered Daily-POC LONG; (iv) no 14:45+ selection evidence; (v) June 8 invalid SHORT remains silent under the 5m flip kill; (vi) 6/9 09:50 never-reseeded candidate remains refused; and (vii) 5 June London 09:45 remains correct. This is a future-run predicate only; no run is requested or authorized.

## 6 - Source exhibits (current EA; line numbers are physical source lines)

EA source lines 11771-11785:
```mql5
11771:      {
11772:       ulong mtp_t = PositionGetTicket(mtp_i);
11773:       if(mtp_t == 0 || !PositionSelectByTicket(mtp_t)) continue;
11774:       if(PositionGetString(POSITION_SYMBOL) != _Symbol) continue;
11775:       if(PositionGetInteger(POSITION_IDENTIFIER) != pid) continue;
11776:       return mtp_t;
11777:      }
11778:    return 0;
11779:   }
11780: 
11781: 
11782: 
11783: //================= [P-EXITEXEC-1] broker close for the paper-only exit legs ========
11784: //--- Q2 (his COMBINE word): BREAK and DAY_CLOSE verdicts flipped paper state only
11785: //--- (ALERT-ONLY preserved, never an order), so the broker position lived on
```

EA source lines 11843-11846:
```mql5
11843: void EvaluateManagedTrade(const int barShift)
11844:   {
11845:    if(!g_mtrade.active) return;
11846:    if(g_mtrade.state != MT_MANAGING && g_mtrade.state != MT_PENDING_FILL) return;
```

EA source lines 11912-11923:
```mql5
11912:     //--- [P-RECON74FIX-2 R] session-close retarget (his RETARGET rule; closed-session values only; instance-contained plus caller-strict-tighter jointly bound the revision to one per trade instance).
11913:     if(g_mtrade.tpRef != EMPTY_VALUE && g_mtrade.tpRef > 0.0)
11914:       {
11915:        double uj_rtPx = 0.0;
11916:        if(UjClosedSessionTarget(g_mtrade, barShift, uj_rtPx) && uj_rtPx > 0.0
11917:           && ((g_mtrade.dir == DIR_LONG && NormalizeDouble(uj_rtPx, _Digits) < NormalizeDouble(g_mtrade.tpRef, _Digits)) || (g_mtrade.dir == DIR_SHORT && NormalizeDouble(uj_rtPx, _Digits) > NormalizeDouble(g_mtrade.tpRef, _Digits))))
11918:          {
11919:           double uj_oldRef = g_mtrade.tpRef;
11920:           g_mtrade.tpRef = uj_rtPx;
11921:           if(InpDebugLog) PrintFormat("[SRJ-EA] UJRETARGET bar=%s dir=%s old=%s sess=%d tp=%s seq=%I64d admit=%s - session-close retarget (Fix R)", TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES), DirName(g_mtrade.dir), DoubleToString(uj_oldRef, _Digits), g_mtrade.sessionAtEntry, DoubleToString(g_mtrade.tpRef, _Digits), (long)g_mtrade.uj_tradeSeq, TimeToString(g_mtrade.uj_admitBarTime, TIME_DATE|TIME_MINUTES));
11922:          }
11923:        else if(InpDebugLog && uj_rtPx > 0.0) PrintFormat("[SRJ-EA] UJNORETARGET bar=%s dir=%s tp=%s rt=%s why=%s sess=%d seq=%I64d admit=%s - helper true but not tighter (Fix R)", TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES), DirName(g_mtrade.dir), DoubleToString(g_mtrade.tpRef, _Digits), DoubleToString(uj_rtPx, _Digits), (NormalizeDouble(uj_rtPx, _Digits) == NormalizeDouble(g_mtrade.tpRef, _Digits) ? "eq" : "loose"), g_mtrade.sessionAtEntry, (long)g_mtrade.uj_tradeSeq, TimeToString(g_mtrade.uj_admitBarTime, TIME_DATE|TIME_MINUTES)); // helper-true discriminator
```

EA source lines 12036-12060:
```mql5
12036:    //--- close the trade (the priority order stated in the header)
12037:    g_mtrade.state       = MT_CLOSED;
12038:    g_mtrade.exitBarTime = barTime;
12039:    if(vSL)         { g_mtrade.exitReason = MT_EXIT_SL;             g_mtrade.exitPrice = g_mtrade.slRef; }
12040:     else if(vTP)    { g_mtrade.exitReason = MT_EXIT_TP_TOUCH;       g_mtrade.exitPrice = g_mtrade.tpRef; }
12041:    else if(vBREAK) { g_mtrade.exitReason = MT_EXIT_POI_BODY_BREAK; g_mtrade.exitPrice = nextOpenPx; }
12042:    else if(vHTF)   { g_mtrade.exitReason = MT_EXIT_HTF_FLIP;       g_mtrade.exitPrice = nextOpenPx; }
12043:    else if(vDAY)   { g_mtrade.exitReason = MT_EXIT_DAY_CLOSE;  g_mtrade.exitPrice = nextOpenPx; }
12044: 
12045:     PrintFormat("[SRJ-EA] MTEXIT bar=%s reason=%s line=%s lineVal=%s entry=%s exit=%s",
12046:                 TimeToString(barTime, TIME_DATE|TIME_MINUTES),
12047:                 MtExitName(g_mtrade.exitReason),
12048:                 (vBREAK ? breakLineName : "-"),
12049:                 (vBREAK ? DoubleToString(breakLineVal, _Digits) : "-"),
12050:                 DoubleToString(g_mtrade.entryPrice, _Digits),
12051:                 DoubleToString(g_mtrade.exitPrice, _Digits));
12052:     //--- [P-EXITEXEC-1 E7] execution legs: SL/TP broker-owned, HTF stays off,
12053:     //--- CANCEL_BIAS returned above - only the WINNING BREAK/DAY_CLOSE verdict closes.
12054:     //--- Price reference = g_mtrade.exitPrice (= nextOpenPx on the gated legs per EA 11290/11292); paper MTEXIT/MTLIFE/EXIT rows print regardless.
12055:     if(g_mtrade.exitReason == MT_EXIT_POI_BODY_BREAK || g_mtrade.exitReason == MT_EXIT_DAY_CLOSE)
12056:       {
12057:        int mtexecRc = MtCloseBrokerPosition(MtExitName(g_mtrade.exitReason), g_mtrade.exitPrice, barTime);
12058:        if(mtexecRc == 0)
12059:           PrintFormat("[SRJ-EA] MTCLOSE_FAIL bar=%s reason=%s entryTicket=%I64u entryPid=%I64d", TimeToString(barTime, TIME_DATE|TIME_MINUTES), MtExitName(g_mtrade.exitReason), g_mtrade.ticket, g_mtrade.entryPid);
12060:       }
```

EA source lines 7450-7456:
```mql5
7450:           if((uj_hm15r && uj_hm15 == uj_hwant) || uj_hcarve)
7451:             { if(InpDebugLog) PrintFormat("[SRJ-EA] UJLTFHOLD bar=%s dir=%s poi=%s state=%s m15=%s rf=%d mode=%s term=%s - LTF opposed, hold (Fix F11)", TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES), DirName(g_dir), AnchorStr(), StateName(g_state), DoubleToString(uj_hm15, 1), (uj_hm15r ? 1 : 0), ((uj_hm15r && uj_hm15 == uj_hwant) ? "M15" : "CARVE"), uj_hterm); }
7452:           else
7453:             {
7454:              uj_saAbort = true; uj_saA = g_anchorLine; uj_saD = (int)g_dir; uj_saT = g_anchorBarTime;
7455:              if(InpDebugLog) PrintFormat("[SRJ-EA] UJDEFERABORT bar=%s dir=%s poi=%s state=%s - LTF opposed, abort deferred past evaluation (Fix S-a)", TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES), DirName(g_dir), AnchorStr(), StateName(g_state));
7456:             }
```

EA source lines 8070-8094:
```mql5
8070:     bool s1f_seedArmed = (g_state == ST_IDLE);   //--- [SIDE1F] (i) seed-bar exactness flag (new local only)
8071: 
8072:     if(g_state == ST_IDLE)
8073:       {
8074:        if(!inWindow) { if(InpDebugLog && TimeToString(barTime, TIME_MINUTES) == "17:00") PrintFormat("[SRJ-EA] SEEDDIAG bar=%s branch=WINDOW inWin=0 sess=%s retestFound=%d", TimeToString(barTime, TIME_DATE|TIME_MINUTES), SessionName(sess), -1); return; }
8075:       if(SessionAlreadyUsed(sess, barTime))
8076:         {
8077:          static datetime s_limitDay  = 0;
8078:          static int      s_limitSess = -1;
8079:          datetime dayKey = TC_DayStart(barTime);
8080:          if(InpDebugLog && (dayKey != s_limitDay || (int)sess != s_limitSess))
8081:            {
8082:             s_limitDay  = dayKey;
8083:             s_limitSess = (int)sess;
8084:             PrintFormat("[SRJ-EA] %s SESSION_LIMIT: %s window already used today - "
8085:                         "all further candidates suppressed until the next window",
8086:                         TimeToString(TimeCurrent(), TIME_DATE|TIME_SECONDS),
8087:                         SessionName(sess));
8088:            }
8089:          if(InpDebugLog && TimeToString(barTime, TIME_MINUTES) == "17:00") PrintFormat("[SRJ-EA] SEEDDIAG bar=%s branch=SESSION inWin=1 sess=%s retestFound=%d", TimeToString(barTime, TIME_DATE|TIME_MINUTES), SessionName(sess), -1);
8090:          return;
8091:         }
8092:         PoiRetestResult pr;
8093:         if(!DetectPoiRetest(barShift, pr) || !pr.found) { if(InpDebugLog && TimeToString(barTime, TIME_MINUTES) == "17:00") PrintFormat("[SRJ-EA] SEEDDIAG bar=%s branch=RETEST inWin=1 sess=%s retestFound=%d", TimeToString(barTime, TIME_DATE|TIME_MINUTES), SessionName(sess), (pr.found ? 1 : 0)); return; }
8094:         //--- [P-RESQUAT-1 F-a] eviction-paired read gate: a candidate identical to
```

EA source lines 8462-8476:
```mql5
8462:        //--- [v20 S-a] deferred-abort application (identity-keyed on anchor+dir+barTime; set in Fix F11 tail).
8463:        if(uj_saAbort)
8464:          {
8465:           if(uj_saA == g_anchorLine && uj_saD == (int)g_dir && uj_saT == g_anchorBarTime)
8466:             {
8467:              if(InpDebugLog) PrintFormat("[SRJ-EA] UJDEFERAPPLY bar=%s dir=%s poi=%s - deferred LTF abort applies, holder unchanged (Fix S-a)", TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES), DirName(g_dir), AnchorStr());
8468:              GoAbort(ABORT_LTF_MISALIGN, g_state);
8469:              return;
8470:             }
8471:           else
8472:             {
8473:              if(InpDebugLog) PrintFormat("[SRJ-EA] UJDEFERDROP bar=%s dir=%s poi=%s - deferred LTF abort dropped, holder changed (Fix S-a)", TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES), DirName(g_dir), AnchorStr());
8474:             }
8475:           uj_saAbort = false;
8476:          }
```

## 7 - RECON78 source rows (physical journal lines; rows are evidence, not a future outcome)

Journal source rows (SEG is the physical, 1-indexed journal line):
```text
SEG 13393: QO	0	16:42:10.830	Core 04	2026.06.05 12:05:00   [SRJ-EA] UJRETARGET bar=2026.06.05 12:00 dir=SHORT old=159.900 sess=1 tp=159.908 seq=2 admit=2026.06.05 09:40 - session-close retarget (Fix R)
SEG 13417: NN	0	16:42:10.830	Core 04	2026.06.05 12:15:00   [SRJ-EA] MTEXIT bar=2026.06.05 12:10 reason=TP_TOUCH line=- lineVal=- entry=159.948 exit=159.908
SEG 13420: IH	0	16:42:10.830	Core 04	2026.06.05 12:19:21   take profit triggered #4 sell 6.74 USDJPY 159.948 sl: 159.972 tp: 159.900 [#5 buy 6.74 USDJPY at 159.900]
SEG 13421: OJ	0	16:42:10.830	Core 04	2026.06.05 12:19:21   deal #5 buy 6.74 USDJPY at 159.900 done (based on order #5)
SEG 14057: LR	0	16:43:24.215	Core 04	2026.06.05 16:55:00   [SRJ-EA] PRE-SEND lots=0.41 entry=160.120 slPts=394 tpPts=603 stopsLevel=0 freezeLevel=0 spreadPts=5
SEG 14058: OS	0	16:43:24.215	Core 04	2026.06.05 16:55:00   market buy 0.41 USDJPY sl: 159.726 tp: 160.723 (160.115 / 160.120)
SEG 14059: CQ	0	16:43:24.215	Core 04	2026.06.05 16:55:00   deal #6 buy 0.41 USDJPY at 160.120 done (based on order #6)
SEG 14331: MS	0	16:44:00.911	Core 04	2026.06.05 19:05:01   [SRJ-EA] UJRETARGET bar=2026.06.05 19:00 dir=LONG old=160.723 sess=2 tp=160.298 seq=3 admit=2026.06.05 16:50 - session-close retarget (Fix R)
SEG 14354: GF	0	16:44:07.028	Core 04	2026.06.05 19:20:01   [SRJ-EA] MTEXIT bar=2026.06.05 19:15 reason=TP_TOUCH line=- lineVal=- entry=160.115 exit=160.298
SEG 14047: MQ	0	16:43:24.215	Core 04	2026.06.05 16:55:00   [SRJ-EA] 2026.06.05 16:55:00 SIGNAL dir=LONG poi=Daily-POC regime=TREND div=regular sess=NYAM tp_target=160.723 tp_R=1.56 sl_ref=159.726 sl_mode=1-swing spreadPts=5 bid=160.115 ask=160.120
SEG 24023: QG	0	17:10:18.795	Core 04	2026.06.11 22:30:51   stop loss triggered #6 buy 0.41 USDJPY 160.120 sl: 159.726 tp: 160.723 [#7 sell 0.41 USDJPY at 159.726]
SEG 24024: JG	0	17:10:18.795	Core 04	2026.06.11 22:30:51   deal #7 sell 0.41 USDJPY at 159.725 done (based on order #7)
SEG 22652: PL	0	17:08:16.498	Core 04	2026.06.11 14:40:22   [SRJ-EA] SIDE1H_WOULDPREEMPT bar=2026.06.11 14:35 newPoi=Daily-POC newDir=LONG heldPoi=Daily-POC heldDir=SHORT heldState=S4_ARMED newTier=5 heldTier=5 wouldPreempt=0 wouldTierPassLegacy=0
SEG 22654: RO	0	17:08:16.498	Core 04	2026.06.11 14:40:22   [SRJ-EA] SUPPRESSED bar=2026.06.11 14:35 poi=Daily-POC dir=LONG opp=1 higher=0 heldPoi=Daily-POC heldDir=SHORT heldState=S4_ARMED cum_n=79 cum_opp=19 cum_hi=7 cum_both=4 action=HELD
SEG 22629: CS	0	17:08:16.498	Core 04	2026.06.11 14:40:22   [SRJ-EA] LTFFLIP bar=2026.06.11 14:35 dir=SHORT poi=Daily-POC state=S4_ARMED - LTF bias turned against the locked direction
SEG 22631: QN	0	17:08:16.498	Core 04	2026.06.11 14:40:22   [SRJ-EA] UJDEFERABORT bar=2026.06.11 14:35 dir=SHORT poi=Daily-POC state=S4_ARMED - LTF opposed, abort deferred past evaluation (Fix S-a)
SEG 22655: GL	0	17:08:16.498	Core 04	2026.06.11 14:40:22   [SRJ-EA] RETESTBOOK bar=2026.06.11 14:35 hits=2 Daily-POC:r10:dL Daily-VWAP:r11:dL
SEG 22658: CQ	0	17:08:16.498	Core 04	2026.06.11 14:40:22   [SRJ-EA] CONFIRMPOLL bar=2026.06.11 14:35 anchor=Daily-POC dir=SHORT oppCandle=0 bodyDir=0 body=3pts doji=0 touchAttr=1 confirm=0 shadow=true
SEG 22661: CQ	0	17:08:16.498	Core 04	2026.06.11 14:40:22   [SRJ-EA] UJDEFERAPPLY bar=2026.06.11 14:35 dir=SHORT poi=Daily-POC - deferred LTF abort applies, holder unchanged (Fix S-a)
SEG 22664: JF	0	17:08:16.498	Core 04	2026.06.11 14:40:22   [SRJ-EA] ALERT SRJ STAND-DOWN SHORT USDJPY M5 | Daily-POC | NYAM | reason=LTF_MISALIGN
SEG 15006: KP	0	16:47:53.340	Core 04	2026.06.08 09:30:00   [SRJ-EA] UJPROV bar=2026.06.08 09:25 dir=SHORT reseedBar=1970.01.01 00:00 seedBiasAl=0 reseedDir=0 exempt=0 - reseed provenance at S2 edge (Fix CARRY)
SEG 15007: HP	0	16:47:53.340	Core 04	2026.06.08 09:30:00   [SRJ-EA] S2SEEDBIAS_KILL bar=2026.06.08 09:25 dir=SHORT poi=Weekly-POC - seedbias refused, promotion killed (Fix B2)
SEG 16565: GR	0	16:54:24.798	Core 04	2026.06.09 09:55:00   [SRJ-EA] UJPROV bar=2026.06.09 09:50 dir=SHORT reseedBar=1970.01.01 00:00 seedBiasAl=0 reseedDir=0 exempt=0 - reseed provenance at S2 edge (Fix CARRY)
SEG 16566: HJ	0	16:54:24.798	Core 04	2026.06.09 09:55:00   [SRJ-EA] S2SEEDBIAS_KILL bar=2026.06.09 09:50 dir=SHORT poi=Weekly-VWAP - seedbias refused, promotion killed (Fix B2)
```

## 8 - Review boundaries and answer form

Review only the complete page. Give one verdict for Q1 and Q3, answer A and B for each, cite the physical P-lines, list all additional defects and conditions, and close Q1/Q3 separately. Q2 is carried closed on the required seats and is not a new question. No source edit, build, tester run, live trade, Luna key, operator run word, commit, or push is authorized. The prior run authorization is consumed.