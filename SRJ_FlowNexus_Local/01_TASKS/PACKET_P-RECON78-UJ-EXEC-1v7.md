# PACKET P-RECON78-UJ-EXEC-1 v7 - June UJ execution repair and same-pass flip release

Status: v7 DRAFT for one focused page review by Sonnet and GLM. CONTINUE after V394 / packet v5. V391 is the Codex-authored structural reference. V392-V394 are review evidence; unverified design claims from those pages are not carried forward. The 2026-06-01 through 2026-06-13 RECON78 run is the only current run evidence. Its one-run authorization is consumed. This page authorizes no source edit, build, tester run, key request, live action, commit, or push.

Line convention: physical lines; blank lines count; title is line 1. The twin below must reproduce every physical packet line exactly. This page asks only about the unresolved execution repair and June 11 arbitration design. Q2 (June 5 NY 16:15 seed-bias refusal) is carried closed on the required Sonnet+GLM seats; no Q2 re-review is requested. R1/R2 register application remains gated on your explicit word.

## 1 - Build defect carried from RECON78

On 5 June New York USDJPY, the EA changed only model `g_mtrade.tpRef` from 160.723 to the closed-session target 160.298. `UJRETARGET` is stamped on bar 19:00; model `TP_TOUCH` is stamped on bar 19:15, three M5 bars later. The broker TP remained 160.723. The position was stopped on 11 June at 22:30:51, with deal fill 159.725 against the 159.726 stop (one tick execution difference; this is not target tolerance). The 5 June London short shows the same divergence: its 12:00-bar retarget changed model TP 159.900 to 159.908; model `TP_TOUCH` followed on the 12:10 bar, but the broker filled the original 159.900 TP at 12:19:21. This is the build defect Q1 must solve. Exact-price/no-leniency remains in force; a model print is not broker execution.

## 2 - Governing operator pins and fixed boundaries

- SRJ strategy memory: `.opencode/skills/srj-strategy/SKILL.md` sections 1, 2, 8, 10. `RETARGET-CLOSED-AM` and `SYMMETRY-NEAREST`: only a closed session's directional extreme can become the nearest valid target. `EXACT-PRICE-NO-LENIENCY`: next-candle entry open and booked/revised target exit are exact; spread drift is a defect, never tolerance.
- `FLIP-KILLED-NEVER-VETOES`: a potential killed by the 5m structure-bias flip cannot keep vetoing the challenger. `LIVE-TRADE-BLOCKS-ALL`: an already-live position of the same pair/session still blocks a new setup. `ONE-TAKE-PER-PAIR-PER-SESSION`: one take per pair per session; London and New York remain independent. These govern different states: candidate arbitration versus a broker-open trade.
- June 11 New York USDJPY: retest + confirmation bar 14:35; entry bar is the 14:40 open at 160.524 per the operator ruling recorded in `BUILDER_FINDING_USDJPY-MISSES.md` (Rulings-G/J) and register row 26. 14:45 is post-entry and cannot grade selection. The current journal contains no 14:40 LONG alert or deal at that level. The fixed acceptance price is operator evidence, not an outcome observed in RECON78.
- June 5 New York USDJPY 16:15 is still a distinct missed entry; the later 16:55 position is not its substitute. It is carried context only and not reopened as Q2.
- Alert-only remains structural. There is no live order path authorized here. No new run is authorized.

## 3 - V394 disposition and this fold's scope

The V394 replies are filed. Sonnet returned Q1 DISCREPANCY, Q2 CONFIRM, Q3 DISCREPANCY; GLM returned Q1 DISCREPANCY, Q2 CONFIRM, Q3 CONFIRM. Q1 therefore reopens for this focused design review; Q2 remains closed by both required seats and is not re-asked. Q3 carries forward the unresolved state-flow concerns. Luna is evidence review, not a voting seat. V394 granted no build/run authority. Folded V394 defects: retry insertion is between EA 11845 and 11846; instance state and a named skip are proposed; attempts are limited per M5 bar and capped at three; the required same-session position gate is given candidate-admission and pre-SIGNAL sites and the current late gate is exhibited; exact 160.524 is sourced to the operator record and separated from the current Ask/deal path; London entry, retarget and deal rows plus its three-bar timing are included; the one-tick stop execution is explained; the unscoped UJNORETARGET census assertion is dropped; Q3 removes S4 transfer, distinguishes the diagnostic print from the singleton seed path, scopes the live-position condition to the same pair/session, and labels all June 11 outcomes as unobserved future predicates.

Backing carried on this page: valid-trade register row 26 identifies the 11 June NY LONG, Daily-POC (=anchor), owed at the 14:40 open. Operator Rulings-G/J in `BUILDER_FINDING_USDJPY-MISSES.md` set the 14:35 retest+confirmation, 14:40 open, exact 160.524, and exclude 14:45 as post-entry; the filed correction says, "the confirmation and retest candle is at 14:35 and the entry is at the candle open of 14:40." This is authority for the future requirement, not evidence that RECON78 produced the LONG confirm, alert, or deal.

This page changes the Q3 design premise: `SUPPRESSED` is diagnostic only. A candidate reaches the seed logic only when the singleton state is `ST_IDLE`. V394's S4-to-challenger form-(b) transfer is withdrawn. This page proposes consuming a matching same-pass deferred abort before the normal IDLE seed check, then freshly processing the current bar once. It transfers no S4 state, zone, latch, or plan. This is a design proposal; the page does not claim that the hook is implemented or that the June 11 outcome is proven.

## 4 - Q1: proposed broker TP synchronization contract

This is a proposed design, not implemented code. The helper body and retry block do not exist in the current EA and are not claimed as source exhibits.

**Recommendation.** Add `UjSyncBrokerTp(entryPid, target)` at the retarget site immediately after `g_mtrade.tpRef` is revised and before `tpBookedTouch` is evaluated. Resolve the live ticket from the position identifier, then require matching symbol and magic. Read and preserve that position's live SL. Submit `PositionModify(ticket, liveSL, NormalizeDouble(target,_Digits))`; a successful library return alone is insufficient: require the documented success retcode and a broker-position TP readback equal to the normalized target. If already equal, emit a named `UJTPMODIFY_SKIP` and do not count a modify attempt.

Proposed per-instance fields: `ujTpSyncAttempts`, `ujTpSyncAttemptBarTime`, `ujTpSyncState`, and `ujTpSyncTarget`, keyed by position identifier plus trade sequence/admission bar. Attempt no more than once per evaluated M5 bar and no more than three times per target revision. Each unsuccessful request or failed exact readback consumes one attempt. After attempt three, latch terminal FAIL; unclassified retcodes must not become an unlimited retry class. Name the retryable/permanent retcode sets or explain the default. Every modify, skip, and fail event carries pair, session, sequence, admission bar, position identifier, target and attempt/state. If TP is already equal, emit `UJTPMODIFY_SKIP` and do not count a modify attempt; explicitly exclude that skip from modify-call counts. No market close on failure: original broker SL/TP remain in control, acceptance fails, and the mismatch remains visible in `UJORPHAN` until actual broker exit. Do not mark revised-price `TP_TOUCH` as a successful broker exit while sync is pending or failed; council should settle the precise managed-model state and alert/log disposition for that case.

The retry host is after the active check at EA 11845 and before the state gate at EA 11846. EA 351 inside `MtReset` sets `g_mtrade.active=false`; the fill path sets it true at EA 10702. Model close at EA 12037 changes state to `MT_CLOSED` without clearing `active`. The proposed host sits after the active check and before the state gate, so it can service a closed-model/open-broker instance if no reset has already cleared active; verify every `MtReset` caller and the actual instance lifecycle.

O6 admission rule: before any same-pair/same-session new setup is seeded/admitted, block it while a broker position for that pair/session remains open, including an older position. A London position does not block New York. Broker-confirmed exit ends the live instance. The proposed design should gate candidate admission immediately before the IDLE seed path at EA 8072 and recheck before EmitAlert SIGNAL at EA 10625. Current IsSessionPositionOpen(magic) filters symbol and session magic, but its call at EA 10756 follows the signal alert and the MODE_ALERT_ONLY return at EA 10740-10749; it is too late for the settled admission rule. Council must confirm the proposed sites and older same-session positions are included. This boundary controls Q3: June 11 NY admission is expected only if Q1's 5 June NY position broker-closed at its revised target beforehand; otherwise the same-session block is correct.

**Q1 review asks.**

Q1 verdict: CONFIRM / OBJECT / DISCREPANCY.

- Ask A: is the proposed helper, per-instance state, retry cap, exact EA insertion sites and pre-SIGNAL O6 gate complete and internally consistent for this defect? The retry host is after the active check EA 11845 and before the state gate EA 11846; the retarget call is immediately after EA 11920 changes `tpRef` and before TP_TOUCH evaluation. Resolve ticket by position identifier, verify symbol/magic, preserve current SL, require broker success retcode and exact normalized TP readback. Name any missing field, source site, retcode rule, MQL5 behavior, or failure-state transition. In particular, state what the model must do if revised-price TP_TOUCH occurs before broker synchronization is confirmed or after the three-attempt terminal FAIL; it must not claim a revised-price broker exit that did not occur. Verify whether the retry host can still identify the position after every `MtReset` path.
- Ask B: is the future acceptance exact and sufficient? For both June 5 NY (160.723 -> 160.298) and London (159.900 -> 159.908), require an instance-labeled retarget, accepted broker modification, exact broker TP readback, preserved SL, and actual broker TP deal exactly at the revised value before any later stop. London baseline is fully visible: 09:45 SIGNAL/deal #4 at 159.948 with SL 159.972 and TP 159.900; the 12:00 retarget precedes model TP_TOUCH at 12:10; the original broker TP fills at 12:19:21. A revised-target deal is a future predicate, not baseline evidence. Require no acceptance if modification/readback fails or the deal fills at the old target. Name identity fields in modify/skip/fail rows (pair, session, trade sequence/admission bar and position identifier); name and exclude idempotent skips from modify-attempt counts. Keep the operator-set entry open and actual deal as separate exact observations: the 5 June NY baseline signal/model entry is 160.115, Ask/deal is 160.120; do not assert they are equal or waive EXACT-PRICE-NO-LENIENCY. The current run has no modify call/event or revised-target deal; do not claim those outcomes happened.

## 5 - Q3: same-pass flip release without S4 state transfer

Current sequence on 11 June: the 14:40:22 pass evaluates the 14:35 bar. The opposite SHORT S4_ARMED holder gets `LTFFLIP` and sets `uj_saAbort` keyed to anchor, direction and bar time; the equal-tier LONG Daily-POC retest is excluded while the singleton is occupied; deferred abort is applied later. `SUPPRESSED` reports the exclusion; it does not perform it. The only confirm poll in the supplied 14:35 rows is for the held SHORT and is `shadow=true, confirm=0`; the baseline does not prove a LONG confirm or outcome.

**Recommendation.** When `uj_saAbort` matches the current holder identity, consume that abort once before the normal IDLE seed check. Capture/retain no S4 zone, touch, entry, SL, TP, or confirmation latches. Let `GoAbort` reset the dead holder, clear the consumed deferred-abort local, then pass the current bar once through the existing IDLE seed path so the 14:35 LONG retest+confirmation is freshly evaluated. Do not rerun the whole bar or process the candidate twice. If this placement cannot safely reach the existing IDLE path in the same pass, council must give one concrete alternative state map; no S4-to-LONG state transfer is presumed safe.

Do not release or seed a candidate while a same-pair/same-session broker position remains open. Q1 must first demonstrate broker exit of the 5 June NY trade at 160.298 before a June 11 NY entry can be expected. Q3 outcome is conditional on that prerequisite; the baseline June 11 miss does not contain a LONG confirm, alert, admission, or deal at 160.524.

**Q3 review asks.**

Q3 verdict: CONFIRM / OBJECT / DISCREPANCY.

- Ask A: does consuming the matching deferred abort before the IDLE seed path express `FLIP-KILLED-NEVER-VETOES` while preserving the pre-confirmation 5m flip kill, normal fresh S1/S2/S3/S4 initialization, same-bar POC-over-VWAP ranking, and no duplicate pass? Trace the proposed sequence against the spliced source and name any missing clear/write/return site.
- Ask B: is this future acceptance gradeable without asserting an unobserved outcome? Require (i) Q1's prior same-session broker position closed at its exact revised TP before 11 June; (ii) the 14:35 LONG retest+confirmation processed through normal fresh initialization; (iii) the registered Daily-POC LONG signal and actual deal at the operator-set 14:40 open 160.524, with no spread tolerance and no relabeling the open as Ask; existing source reads `SYMBOL_ASK` for LONG at EA 10759, so disclose any unresolved execution conflict; (iv) no 14:45+ selection evidence; (v) June 8 invalid SHORT remains silent under the applicable 5m flip rule; the baseline S2SEEDBIAS_KILL is a separate observed refusal, not proof of a 5m-flip kill; (vi) 6/9 09:50 never-reseeded candidate remains refused; (vii) 5 June London 09:45 remains correct; and (viii) one accepted June 11 NY take for this registered instance, scoped by pair/session/date/anchor/direction, not a run-wide deal count. These are future-run predicates only: current rows show no June 11 LONG alert, admission, or deal. No run is requested or authorized.

## 6 - Source exhibits (current EA; line numbers are physical source lines)

Current source/result identity: EA SHA-256 E80FF0C24149AB0946EB6A4341C0503A79BFE82E9843867CEF0DBA89BF587BBC; archived journal SHA-256 48F5C196462B08FFF38E6CCA79F3F61737F03C1F85B3A9BB9C33F5E06795926D; RECON78 result SHA-256 06465B2510E7C6DEC9B0E1EBF227DF4ABB6BD5B381899BD63AD2A64AE64C13A5.

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

EA source lines 1754-1763 (existing session-position resolver):
```mql5
1754: bool IsSessionPositionOpen(long magic)
1755:   {
1756:    for(int i = PositionsTotal() - 1; i >= 0; i--)
1757:      {
1758:       ulong ticket = PositionGetTicket(i);
1759:       if(PositionGetString(POSITION_SYMBOL) == _Symbol && PositionGetInteger(POSITION_MAGIC) == magic)
1760:          return true;
1761:      }
1762:    return false;
1763:   }
```

EA source lines 10618-10645 (SIGNAL alert precedes current position guard; managed-trade record is snapshotted afterward):
```mql5
10618:         LogSignal(tpTarget, tpR, slRef, slMode, divKind);
10619:         if(InpDebugLog) A6Fired(barShift, tpTarget, tpR, slRef, slMode, divKind);   //--- [A6-HOOK] (ii)
10620:         if(InpDebugLog) PrintFormat("[SRJ-EA] SIDE1F_WATCH bar=%s dir=%s", TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES), DirName(g_dir));   //--- [SIDE1F] (iii) fire watch (read-only)
10621: 
10622:       if(!g_alertedSignal)
10623:         {
10624:          g_alertedSignal = true;
10625:          EmitAlert("SIGNAL",
10626:                    StringFormat("R=%.2f SL %s TP %s spr=%d",
10627:                                 tpR,
10628:                                 DoubleToString(slRef,    _Digits),
10629:                                 DoubleToString(tpTarget, _Digits),
10630:                                 (int)SymbolInfoInteger(_Symbol, SYMBOL_SPREAD)),
10631:                    true);
10632:         }
10633: 
10634:       //--- [P-EXITMODEL 2026-09-09, operator-issued packet] The section 5 exit phase
10635:       //--- now exists: snapshot the trade into the managed record BEFORE
10636:       //--- ResetSequence (the R-201 ordering discipline). The entry reference IS the
10637:       //--- next candle's open (currentPrice above), so the fill is immediate at that
10638:       //--- open (section 5.5's limit "fills on a wick" - the forming bar's own open
10639:       //--- is the fill tick); the fill candle's own close is then tested like every
10640:       //--- bar ("exit immediately rather than waiting for a subsequent close").
10641:       //--- DECLARED BOUNDARY: one managed record (the R-201 precedent). A second
10642:       //--- signal while one trade is managing logs MTCOLLISION and REPLACES the
10643:       //--- record (spec section 6's blessed London+NY exception would need a
10644:       //--- registry - a separate packet item if it ever fires).
10645:       if(g_mtrade.active && g_mtrade.state == MT_MANAGING)
```

EA source lines 10740-10761 (alert-only returns before the current execution-only position guard; LONG execution reads Ask):
```mql5
10740:       if(InpMode == MODE_ALERT_ONLY)
10741:         {
10742:          PrintFormat("[SRJ-EA] ALERT_ONLY mode - no order sent. Session %s marked used.",
10743:                      SessionName(g_sessionAtEntry));
10744:          MarkSessionUsed(g_sessionAtEntry, g_anchorBarTime);
10745:          ENUM_SRJ_STATE prevA = g_state;
10746:          g_state = ST_SIGNAL;
10747:          LogState(prevA, g_state);
10748:          ResetSequence();
10749:          return;
10750:         }
10751: 
10752:        // ------ Phase 2 Execution Logic ------
10753:        if(InpMode == MODE_EXECUTE) PrintFormat("[SRJ-EA] EXECUTE_ACCT mode=%d login=%d", (int)AccountInfoInteger(ACCOUNT_TRADE_MODE), (int)AccountInfoInteger(ACCOUNT_LOGIN));
10754:        long magic = (g_sessionAtEntry == SESSION_LONDON) ? InpMagicBase + 1 : InpMagicBase + 2;
10755: 
10756:       if(IsSessionPositionOpen(magic))
10757:         { GoAbort(ABORT_CONCURRENCY, g_state); return; }
10758: 
10759:       double entryPrice = (g_dir == DIR_LONG) ? SymbolInfoDouble(_Symbol, SYMBOL_ASK) : SymbolInfoDouble(_Symbol, SYMBOL_BID);
10760:       double riskMoney  = AccountInfoDouble(ACCOUNT_EQUITY) * InpRiskPercent / 100.0;
10761:       double slDistanceReal = MathAbs(entryPrice - slRef);
```

EA source lines 6571-6595 (ResetSequence clears the old candidate; the next comment line is omitted because it contains a non-ASCII dash and no executable statement):
```mql5
6571: void ResetSequence()
6572:   {
6573:    g_state          = ST_IDLE;
6574:    g_dir            = DIR_NONE;
6575:    SrjSideNote("ResetSequence", g_dir);
6576:    g_regime         = REGIME_NONE;
6577:    g_sessionAtEntry = SESSION_NONE;
6578:    g_anchorLine     = -1;
6579:    g_anchorPrice    = 0.0;
6580:    g_anchorBarTime  = 0;
6581:    g_divLatch       = false;
6582:    g_touchSeen      = false;
6583:    g_touchBarHi     = 0.0;
6584:    g_touchBarLo     = 0.0;
6585:    g_zoneHi         = 0.0;
6586:    g_zoneLo         = 0.0;
6587:    g_alertedArmed   = false;
6588:    g_alertedSignal  = false;
6589:    g_latchedEntry   = 0.0;
6590:    g_latchedSl      = 0.0;
6591:    g_latchedTp      = 0.0;
6592:    g_latchedR       = 0.0;
6593:    g_latchBarTime   = 0;
6594:    g_confirmFromState = ST_IDLE;
6595:    //--- [P-BUILD3 E5] no new working-set field: the re-bind assigns anchor,
```

EA source lines 6597-6634 (GoAbort calls ResetSequence):
```mql5
6597:    //--- existing members (fields 4/5/6, 11/12, 8/9/10, 0, 15-19, 20).
6598:   }
6599: 
6600: void GoAbort(const string reason, ENUM_SRJ_STATE atState)
6601:   {
6602:    LogAbort(reason, atState);
6603:    if(InpDebugLog && g_dir != DIR_NONE)
6604:      {
6605:       string a6rBT = TimeToString(TimeCurrent(), TIME_DATE|TIME_MINUTES);
6606:       string a6rLn = StringFormat("[SRJ-EA] A6REFUSED class=ABSENT_DECLINED bar=%s state=%s dir=%s predicate=%s",
6607:                                   a6rBT, StateName(atState), DirName(g_dir), reason);
6608:       A6Emit("REF" + a6rBT + reason + StateName(atState), a6rLn);
6609:      }   //--- [A6-HOOK] (ii) refused decision row (candidate alive => born+rejected)
6610:    //--- TASK 19c: count NO_REGIME aborts so the census can be read against
6611:    //--- them directly. Measurement only.
6612:    if(InpDebugLog && reason == ABORT_NO_REGIME) g_ea19_noRegimeAborts++;
6613:    if(InpAlertStandDown && g_alertedArmed && !g_alertedSignal)
6614:       EmitAlert("STAND-DOWN", "reason=" + reason, false);
6615: 
6616:    //--- TASK 15: shadow record. Must fire BEFORE ResetSequence()
6617:    //--- clears g_dir and g_anchorLine. Read-only measurement.
6618:    if(InpDebugLog &&
6619:       (reason == ABORT_NO_REGIME || reason == ABORT_LTF_MISALIGN))
6620:      {
6621:       g_shadowActive = true;
6622:       g_shadowDir    = g_dir;
6623:       g_shadowLine   = g_anchorLine;
6624:       g_shadowOpened = g_anchorBarTime;
6625:       g_shadowSess   = g_sessionAtEntry;
6626:       g_shadowFail   = reason;
6627:       g_shadowBars   = 0;
6628:      }
6629: 
6630:    ENUM_SRJ_STATE prev = g_state;
6631:    g_state = ST_ABORT;
6632:    LogState(prev, g_state);
6633:    ResetSequence();
6634:   }
```

EA source lines 8430-8476 (same-pass contender handling followed by the current deferred-abort apply/drop site):
```mql5
8430:        if(g_state == ST_S3_ZONE_WAIT || g_state == ST_S4_ARMED) {
8431:        bool uj_sbHave = false; ENUM_SRJ_DIR uj_sbDir = DIR_NONE; int uj_sbLine = -1;
8432:        {
8433:         PoiRetestResult uj_sbPr;
8434:         if(DetectPoiRetest(barShift, uj_sbPr) && uj_sbPr.found)
8435:           { uj_sbHave = true; uj_sbDir = uj_sbPr.isLong ? DIR_LONG : DIR_SHORT; uj_sbLine = uj_sbPr.topLine; }
8436:        }
8437:        string uj_sbTermC = "", uj_sbTermH = "";
8438:         bool uj_sbConfC = (uj_sbHave && (uj_sbDir != g_dir)) ? IsConfirmationCandle(barShift, uj_sbLine, uj_sbDir, uj_sbTermC, true) : false;
8439:        bool uj_sbConfH = IsConfirmationCandle(barShift, g_anchorLine, g_dir, uj_sbTermH);
8440:         double uj_sbLineVal = 0.0; if(uj_sbHave && uj_sbLine >= 0 && !ReadBuf1(g_hPoi, uj_sbLine, uj_sbLineVal, barShift)) uj_sbLineVal = 0.0;
8441:         double uj_sbo1 = iOpen (_Symbol, PERIOD_CURRENT, barShift + 1); double uj_sbc1 = iClose(_Symbol, PERIOD_CURRENT, barShift + 1); double uj_sbc0 = iClose(_Symbol, PERIOD_CURRENT, barShift); int uj_sbarm = 1;
8442:         if(InpDebugLog) PrintFormat("[SRJ-EA] UJSBTELEM bar=%s dir=%s have=%d sbDir=%s sbLine=%d confC=%d confH=%d sbL=%s o1=%s c1=%s c0=%s arm=%d termC=%s termH=%s - contender evaluation (Fix S3)", TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES), DirName(g_dir), (int)uj_sbHave, DirName(uj_sbDir), uj_sbLine, (int)uj_sbConfC, (int)uj_sbConfH, DoubleToString(uj_sbLineVal, _Digits), DoubleToString(uj_sbo1, _Digits), DoubleToString(uj_sbc1, _Digits), DoubleToString(uj_sbc0, _Digits), uj_sbarm, uj_sbTermC, uj_sbTermH);
8443:        if(uj_sbConfC && !uj_sbConfH && (g_state == ST_S3_ZONE_WAIT || g_state == ST_S4_ARMED))
8444:          {
8445:           int uj_sbFromLine = g_anchorLine; ENUM_SRJ_DIR uj_sbFromDir = g_dir;
8446:           g_anchorLine = uj_sbLine; g_dir = uj_sbDir;
8447:           ReadBuf1(g_hPoi, uj_sbLine, g_anchorPrice, barShift);
8448:           g_anchorBarTime = barTime;
8449:           g_zoneHi = 0.0; g_zoneLo = 0.0; g_touchSeen = false;
8450:           g_touchBarHi = 0.0; g_touchBarLo = 0.0;
8451:           g_latchedEntry = 0.0; g_latchedSl = 0.0; g_latchedTp = 0.0; g_latchedR = 0.0;
8452:           g_latchBarTime = 0; g_confirmFromState = ST_IDLE;
8453:           uj_memo_valid = false;
8454:           if(InpDebugLog)
8455:              PrintFormat("[SRJ-EA] SIDE1C_YIELD bar=%s from=%s fromDir=%s to=%s toDir=%s state=%s term=%s",
8456:                          TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES),
8457:                          g_lineCode[uj_sbFromLine], DirName(uj_sbFromDir),
8458:                          g_lineCode[uj_sbLine], DirName(uj_sbDir),
8459:                          StateName(g_state), uj_sbTermC);
8460:          }
8461:        }
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

EA source lines 7991-8043 (SUPPRESSED census is diagnostic; it is not the IDLE seed gate):
```mql5
7991:    //--- [Task 73 / Stage 3 cost side] Suppression census. DIAGNOSTIC ONLY.
7992:    //--- Two unmeasured quantities, both needed before Stage 3 is sized:
7993:    //---   1. The singleton discards every POI retest that arrives while a
7994:    //---      sequence is alive. 103 candidates were ADMITTED across this
7995:    //---      window; how many were silently dropped is unknown, and Stage 3
7996:    //---      lengthens candidate lifetime, so it raises that number.
7997:    //---   2. Part A carries a rule the EA does not implement - an
7998:    //---      opposite-direction HIGHER-TIER retest replaces the candidate.
7999:    //---      Its frequency has never been counted.
8000:    //---
8001:    //--- DetectPoiRetest is read-only: it fills a caller-owned struct from the
8002:    //--- 12 POI buffers and mutates no sequence state. It is called here on the
8003:    //--- SAME barShift the live cascade uses, so a hit is exactly a retest the
8004:    //--- IDLE block would have consumed had the singleton been free.
8005:    //---
8006:    //--- Tier comparison uses g_authorityRank (lower is more authoritative),
8007:    //--- the same ranking D-3 and G-2 already use. No distance, no size, no bar
8008:    //--- count, no tolerance - Part A section 7 is not engaged.
8009:    //---
8010:    //--- Gated on InpDebugLog. Assigns nothing outside its own statics, reads
8011:    //--- g_state / g_dir / g_anchorLine for labelling only, and cannot alter
8012:    //--- control flow. R8 is NOT engaged.
8013:    if(InpDebugLog && inWindow &&
8014:       g_state > ST_IDLE && g_state != ST_ABORT && g_anchorLine >= 0)
8015:      {
8016:       static int s_t73_n      = 0;
8017:       static int s_t73_higher = 0;
8018:       static int s_t73_opp    = 0;
8019:       static int s_t73_both   = 0;
8020:       static int s_t73_bars   = 0;
8021:       s_t73_bars++;
8022:       PoiRetestResult t73_pr;
8023:       if(DetectPoiRetest(barShift, t73_pr) && t73_pr.found)
8024:         {
8025:          s_t73_n++;
8026:          ENUM_SRJ_DIR t73_dir    = t73_pr.isLong ? DIR_LONG : DIR_SHORT;
8027:          bool         t73_isOpp  = (t73_dir != g_dir);
8028:          bool         t73_isHigh = (g_authorityRank[t73_pr.topLine] <
8029:                                     g_authorityRank[g_anchorLine]);
8030:          if(t73_isHigh)               s_t73_higher++;
8031:          if(t73_isOpp)                s_t73_opp++;
8032:          if(t73_isOpp && t73_isHigh)  s_t73_both++;
8033:          PrintFormat("[SRJ-EA] SUPPRESSED bar=%s poi=%s dir=%s opp=%d higher=%d "
8034:                      "heldPoi=%s heldDir=%s heldState=%s "
8035:                      "cum_n=%d cum_opp=%d cum_hi=%d cum_both=%d action=%s",
8036:                      TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift),
8037:                                   TIME_DATE|TIME_MINUTES),
8038:                      g_lineCode[t73_pr.topLine], DirName(t73_dir),
8039:                      (int)t73_isOpp, (int)t73_isHigh,
8040:                      g_lineCode[g_anchorLine], DirName(g_dir), StateName(g_state),
8041:                      s_t73_n, s_t73_opp, s_t73_higher, s_t73_both,
8042:                      b3_superseded ? "SUPERSEDED" : "HELD");
8043:         }
```

EA source lines 103-104 (Daily-POC ranks ahead of Daily-VWAP):
```mql5
103:    g_authorityRank[POI_BUF_D_POC]  = 10;  g_lineCode[POI_BUF_D_POC]  = "Daily-POC";
104:    g_authorityRank[POI_BUF_D_VWAP] = 11;  g_lineCode[POI_BUF_D_VWAP] = "Daily-VWAP";
```

EA source lines 2115-2125 (retest election selects the best-ranked valid long/short line):
```mql5
2115:        if(l <= L - P + EPS && bodyLo >= L - EPS)
2116:         { int rk = g_authorityRank[k]; if(rk < bestLongRank) { bestLongRank = rk; bestLongLine = k; } }
2117:       if(h >= L + P - EPS && bodyHi <= L + EPS)
2118:         { int rk = g_authorityRank[k]; if(rk < bestShortRank) { bestShortRank = rk; bestShortLine = k; } }
2119:      }
2120:     if(bestLongLine < 0 && bestShortLine < 0)
2121:       { g_n1_entryWickInv += n1e_nW; g_n1_entryBodyInv += n1e_nB; return false; }
2122:     if(bestLongLine >= 0 && (bestShortLine < 0 || bestLongRank <= bestShortRank))
2123:       { r.found = true; r.isLong = true;  r.topLine = bestLongLine; }
2124:      else
2125:        { r.found = true; r.isLong = false; r.topLine = bestShortLine; }
```

EA source lines 349-352 (reset marks the managed trade inactive):
```mql5
349: void MtReset()
350:   {
351:    g_mtrade.active            = false;
352:    g_mtrade.state             = MT_INACTIVE;
```

EA source lines 10702-10704 (managed-trade active is set on fill):
```mql5
10702:       g_mtrade.active            = true;
10703:       g_mtrade.state             = MT_MANAGING;
10704:       g_mtrade.dir               = g_dir;
```

## 7 - RECON78 source rows (physical journal lines; rows are evidence, not a future outcome)

Journal source rows (SEG is the physical, 1-indexed journal line):
```text
SEG 13085: HK	0	16:41:34.132	Core 04	2026.06.05 09:45:00   [SRJ-EA] 2026.06.05 09:45:00 SIGNAL dir=SHORT poi=Daily-POC regime=TREND div=hidden sess=LONDON tp_target=159.900 tp_R=2.00 sl_ref=159.972 sl_mode=2-swing spreadPts=3 bid=159.948 ask=159.951
SEG 13097: OF	0	16:41:34.132	Core 04	2026.06.05 09:45:00   deal #4 sell 6.74 USDJPY at 159.948 done (based on order #4)
SEG 13393: QO	0	16:42:10.830	Core 04	2026.06.05 12:05:00   [SRJ-EA] UJRETARGET bar=2026.06.05 12:00 dir=SHORT old=159.900 sess=1 tp=159.908 seq=2 admit=2026.06.05 09:40 - session-close retarget (Fix R)
SEG 13417: NN	0	16:42:10.830	Core 04	2026.06.05 12:15:00   [SRJ-EA] MTEXIT bar=2026.06.05 12:10 reason=TP_TOUCH line=- lineVal=- entry=159.948 exit=159.908
SEG 13418: FD	0	16:42:10.830	Core 04	2026.06.05 12:15:00   [SRJ-EA] MTLIFE fields=11 openBar=2026.06.05 09:45 dir=SHORT entry=159.948 sl=159.972 tp=159.908 verdict=TP_TOUCH closeBar=2026.06.05 12:10 closePx=159.908 openAtNewsStart=0 openAtDayClose=0 openAtWeekClose=0
SEG 13419: CJ	0	16:42:10.830	Core 04	2026.06.05 12:15:00   [SRJ-EA] ALERT SRJ EXIT NONE USDJPY M5 | - | NONE | TP_TOUCH at 159.908 (entry 159.948)
SEG 13420: IH	0	16:42:10.830	Core 04	2026.06.05 12:19:21   take profit triggered #4 sell 6.74 USDJPY 159.948 sl: 159.972 tp: 159.900 [#5 buy 6.74 USDJPY at 159.900]
SEG 13421: OJ	0	16:42:10.830	Core 04	2026.06.05 12:19:21   deal #5 buy 6.74 USDJPY at 159.900 done (based on order #5)
SEG 14047: MQ	0	16:43:24.215	Core 04	2026.06.05 16:55:00   [SRJ-EA] 2026.06.05 16:55:00 SIGNAL dir=LONG poi=Daily-POC regime=TREND div=regular sess=NYAM tp_target=160.723 tp_R=1.56 sl_ref=159.726 sl_mode=1-swing spreadPts=5 bid=160.115 ask=160.120
SEG 14057: LR	0	16:43:24.215	Core 04	2026.06.05 16:55:00   [SRJ-EA] PRE-SEND lots=0.41 entry=160.120 slPts=394 tpPts=603 stopsLevel=0 freezeLevel=0 spreadPts=5
SEG 14058: OS	0	16:43:24.215	Core 04	2026.06.05 16:55:00   market buy 0.41 USDJPY sl: 159.726 tp: 160.723 (160.115 / 160.120)
SEG 14059: CQ	0	16:43:24.215	Core 04	2026.06.05 16:55:00   deal #6 buy 0.41 USDJPY at 160.120 done (based on order #6)
SEG 14331: MS	0	16:44:00.911	Core 04	2026.06.05 19:05:01   [SRJ-EA] UJRETARGET bar=2026.06.05 19:00 dir=LONG old=160.723 sess=2 tp=160.298 seq=3 admit=2026.06.05 16:50 - session-close retarget (Fix R)
SEG 14354: GF	0	16:44:07.028	Core 04	2026.06.05 19:20:01   [SRJ-EA] MTEXIT bar=2026.06.05 19:15 reason=TP_TOUCH line=- lineVal=- entry=160.115 exit=160.298
SEG 15006: KP	0	16:47:53.340	Core 04	2026.06.08 09:30:00   [SRJ-EA] UJPROV bar=2026.06.08 09:25 dir=SHORT reseedBar=1970.01.01 00:00 seedBiasAl=0 reseedDir=0 exempt=0 - reseed provenance at S2 edge (Fix CARRY)
SEG 15007: HP	0	16:47:53.340	Core 04	2026.06.08 09:30:00   [SRJ-EA] S2SEEDBIAS_KILL bar=2026.06.08 09:25 dir=SHORT poi=Weekly-POC - seedbias refused, promotion killed (Fix B2)
SEG 16565: GR	0	16:54:24.798	Core 04	2026.06.09 09:55:00   [SRJ-EA] UJPROV bar=2026.06.09 09:50 dir=SHORT reseedBar=1970.01.01 00:00 seedBiasAl=0 reseedDir=0 exempt=0 - reseed provenance at S2 edge (Fix CARRY)
SEG 16566: HJ	0	16:54:24.798	Core 04	2026.06.09 09:55:00   [SRJ-EA] S2SEEDBIAS_KILL bar=2026.06.09 09:50 dir=SHORT poi=Weekly-VWAP - seedbias refused, promotion killed (Fix B2)
SEG 22629: CS	0	17:08:16.498	Core 04	2026.06.11 14:40:22   [SRJ-EA] LTFFLIP bar=2026.06.11 14:35 dir=SHORT poi=Daily-POC state=S4_ARMED - LTF bias turned against the locked direction
SEG 22631: QN	0	17:08:16.498	Core 04	2026.06.11 14:40:22   [SRJ-EA] UJDEFERABORT bar=2026.06.11 14:35 dir=SHORT poi=Daily-POC state=S4_ARMED - LTF opposed, abort deferred past evaluation (Fix S-a)
SEG 22652: PL	0	17:08:16.498	Core 04	2026.06.11 14:40:22   [SRJ-EA] SIDE1H_WOULDPREEMPT bar=2026.06.11 14:35 newPoi=Daily-POC newDir=LONG heldPoi=Daily-POC heldDir=SHORT heldState=S4_ARMED newTier=5 heldTier=5 wouldPreempt=0 wouldTierPassLegacy=0
SEG 22654: RO	0	17:08:16.498	Core 04	2026.06.11 14:40:22   [SRJ-EA] SUPPRESSED bar=2026.06.11 14:35 poi=Daily-POC dir=LONG opp=1 higher=0 heldPoi=Daily-POC heldDir=SHORT heldState=S4_ARMED cum_n=79 cum_opp=19 cum_hi=7 cum_both=4 action=HELD
SEG 22655: GL	0	17:08:16.498	Core 04	2026.06.11 14:40:22   [SRJ-EA] RETESTBOOK bar=2026.06.11 14:35 hits=2 Daily-POC:r10:dL Daily-VWAP:r11:dL
SEG 22658: CQ	0	17:08:16.498	Core 04	2026.06.11 14:40:22   [SRJ-EA] CONFIRMPOLL bar=2026.06.11 14:35 anchor=Daily-POC dir=SHORT oppCandle=0 bodyDir=0 body=3pts doji=0 touchAttr=1 confirm=0 shadow=true
SEG 22661: CQ	0	17:08:16.498	Core 04	2026.06.11 14:40:22   [SRJ-EA] UJDEFERAPPLY bar=2026.06.11 14:35 dir=SHORT poi=Daily-POC - deferred LTF abort applies, holder unchanged (Fix S-a)
SEG 22664: JF	0	17:08:16.498	Core 04	2026.06.11 14:40:22   [SRJ-EA] ALERT SRJ STAND-DOWN SHORT USDJPY M5 | Daily-POC | NYAM | reason=LTF_MISALIGN
SEG 24023: QG	0	17:10:18.795	Core 04	2026.06.11 22:30:51   stop loss triggered #6 buy 0.41 USDJPY 160.120 sl: 159.726 tp: 160.723 [#7 sell 0.41 USDJPY at 159.726]
SEG 24024: JG	0	17:10:18.795	Core 04	2026.06.11 22:30:51   deal #7 sell 0.41 USDJPY at 159.725 done (based on order #7)
```

## 8 - Review boundaries and answer form

Review only this complete page. Give one verdict for Q1 and Q3, answer A and B for each, cite physical P-lines, identify every remaining defect/condition, and close each question separately. Q2 is closed by both required seats and is not re-asked. Distinguish settled operator rules from implementation recommendations and future acceptance predicates. Do not claim unobserved outcomes or rely on unspliced source behavior. This review authorizes no source edit, build, tester run, live trade, Luna key, operator run word, commit, or push. The prior run authorization is consumed.
