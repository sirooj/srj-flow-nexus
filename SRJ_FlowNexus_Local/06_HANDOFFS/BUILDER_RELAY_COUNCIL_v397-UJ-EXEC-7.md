# BUILDER RELAY COUNCIL v397-UJ-EXEC-7 - packet P-RECON78-UJ-EXEC-1 v9
Status: V397 RELAY-READY - consolidated implementation-contract review by Sonnet and GLM. Packet SHA-256 382DBB9913FC8477CBA5B0D51766319CD7FB743E5EF2F8AC2B6702ED30BA78E9 / 159863 bytes / 2014 physical lines. The June 5 day-close path is a code regression against the prior EU test where it fired; June 11 setup validity is settled, while current EA execution remains unproven. Q2 stays closed.
Project goal: reproduce every valid operator-taken trade for its settled reason and keep every invalid/rejected setup silent across the full journal. Alert-only remains. RECON78's one-run authorization is consumed.

## 0. V397 controlling scope - packet v9

Review the entire packet, with section 13 controlling where prior V7/V8 history conflicts. Q1 and Q3 are separate verdicts. Q2 is closed and must not be re-asked. The operator carries this exact relay once to Sonnet and GLM and returns both complete replies verbatim with seat names. This is design review only; no EA edit, build, tester run, key, live use, commit, or push is authorized. Any later OpenCode implementation requires separate authorization and must preserve every V396 condition.

## Decision questions

### Q1 - closed-session TP revisions and previously working day-close exit
Verdict: CONFIRM / OBJECT / DISCREPANCY.

A. Is the position-instance contract complete for every newly nearer eligible closed-session high/low, broker TP synchronization, exact retcode/readback/SL preservation, pending-exit management, and PID-matched closing-deal resolution? Does it correctly identify day-close as prior working behavior (RECON57 proved a real 4 September EURUSD exit at 23:55) and the current June 5 USDJPY failure as a regression where model TP_TOUCH retires management while the broker position remains open? Name any missing transition, source/row evidence, or contradictory state.

B. Is acceptance exact enough for both branches on the 5 June New York LONG: when its 19:00 New York AM high is the nearest eligible closed-session target, synchronize that exact target and prove the full-volume same-PID TP deal; when no eligible target closes the position by the daily mark, restore the existing universal day-close behavior and prove the actual 23:55 verdict-day close? Keep SL/BREAK/valid-TP priority, London 12:05 onward in the diff, all later target revisions, and model 160.115 separate from Ask/deal 160.120. State remaining conditions and close Q1.

### Q3 - settled valid 11 June LONG and same-pass release
Verdict: CONFIRM / OBJECT / DISCREPANCY.

A. Does the packet correctly treat the 11 June New York USDJPY Daily-POC LONG setup as already ruled valid (14:35 retest plus confirmation; 14:40 open exactly 160.524), while treating the EA's arbitration, normal confirmation/admission, and fill path as unproven? Is same-pass release constrained to consume the matching flip-killed SHORT holder before LONG suppression, then process the LONG exactly once through normal logic without waiving any settled guard? Identify every remaining path/state/return/counter/eviction gap.

B. Is acceptance exact and complete: the registered LONG candidate identity reaches its ordinary path and entry at precisely 160.524, with no spread tolerance, Ask relabel, rounding, or 14:45+ selection evidence; required June 8 invalid SHORT silence, June 9 never-reseeded refusal, June 5 London 09:45 preservation, one take per pair/session, cross-session independence, and no double/lost counters all remain true? Require full return census through function end, F11/S1WAIT/S2WAIT coverage, g_evictBits write map, observation-only pre-decision suppression label, mutually exclusive yield/drop versus abort/consume rows, neutral pending-abort accounting, missing SEG 22656-22660 and run/source provenance treatment without inference. State conditions and close Q3.

## Goal and authority boundary

The audited register remains the row inventory. Its seven valid EURUSD takes are must-keep regressions. The three registered USDJPY misses remain visible: 5 June London 09:45 SHORT, 5 June New York 16:15 LONG (Q2 remains closed; neither erase the register entry nor claim it fixed), and 11 June New York 14:40 LONG. June 3 USDJPY 09:10 LONG remains reproduced. The later 5 June NY 16:55 trade is not a substitute for the registered 16:15 entry; it is relevant to the exit regression. No partial packet review or simulation PASS means the full-journal goal is met.

Review the full packet with physical P-lines. Give separate verdicts and A/B responses for Q1 and Q3, enumerate every remaining condition, and close each separately. Distinguish operator-set strategy facts from implementation proof and future acceptance. Do not infer a June 11 fill, missing journal rows, or RECON78 source provenance. Do not send messages on the operator's behalf.

## Twin (packet P-RECON78-UJ-EXEC-1 v9; rebuilt from saved packet bytes; PSEQ P001-P2014)

P001: # PACKET P-RECON78-UJ-EXEC-1 v9 - valid-trade entry and closed-session exit execution
P002: 
P003: Status: v9 DRAFT for one consolidated design review by Sonnet and GLM, following V396 CONDITIONAL-CONFIRM dispositions. V391 is the Codex-authored structural reference. V392-V394 are review evidence, not templates. V395/V396 findings are preserved in their grade records and addressed by this packet and its controlling section 13. RECON78 (2026-06-01 through 2026-06-13) is the current execution baseline; its one-run authorization is consumed. This page authorizes no source edit, build, tester run, key request, live action, commit, or push.
P004: 
P005: Line convention: physical lines; blank lines count; title is line 1. The relay twin reproduces every packet line exactly. Section 13 is the controlling v9 scope and supersedes conflicting statements in section 9; prior designs remain history. The June 11 14:35 setup validity and 14:40 open at 160.524 are settled operator rulings; the EA path and outcome remain unproven. Q2 (June 5 NY 16:15) stays closed and is not re-asked. R1/R2 register application remains gated on your explicit word.
P006: 
P007: ## 0 - V9 controlling scope
P008: 
P009: Section 13 controls the V9 design review and supersedes conflicting V7/V8 proposal text. The 11 June New York USDJPY Daily-POC LONG is settled valid: 14:35 retest-plus-confirmation; 14:40 open exactly 160.524. The EA's same-pass release and normal entry path remain unproven. The 5 June New York management path includes both the closed-session NY AM high target and the universal day-close exit. Day-close is prior working behavior, demonstrated by the EU RECON57 4 September exit, and its loss after RECON78 model-only TP_TOUCH is treated as a code regression. Q2 remains closed. This page authorizes no edit, build, run, key, live action, commit, or push.
P010: ## 1 - Build defect carried from RECON78
P011: 
P012: On 5 June New York USDJPY, the EA changed only model `g_mtrade.tpRef` from 160.723 to the closed-session target 160.298. `UJRETARGET` is stamped on bar 19:00; model `TP_TOUCH` is stamped on bar 19:15, three M5 bars later. The broker TP remained 160.723. The position was stopped on 11 June at 22:30:51, with deal fill 159.725 against the 159.726 stop (one tick execution difference; this is not target tolerance). The 5 June London short shows the same divergence: its 12:00-bar retarget changed model TP 159.900 to 159.908; model `TP_TOUCH` followed on the 12:10 bar, but the broker filled the original 159.900 TP at 12:19:21. This is the build defect Q1 must solve. Exact-price/no-leniency remains in force; a model print is not broker execution.
P013: 
P014: ## 2 - Governing operator pins and fixed boundaries
P015: 
P016: - SRJ strategy memory: `.opencode/skills/srj-strategy/SKILL.md` sections 1, 2, 8, 10. `RETARGET-CLOSED-AM` and `SYMMETRY-NEAREST`: only a closed session's directional extreme can become the nearest valid target. `EXACT-PRICE-NO-LENIENCY`: next-candle entry open and booked/revised target exit are exact; spread drift is a defect, never tolerance.
P017: - `FLIP-KILLED-NEVER-VETOES`: a potential killed by the 5m structure-bias flip cannot keep vetoing the challenger. `LIVE-TRADE-BLOCKS-ALL`: an already-live position of the same pair/session still blocks a new setup. `ONE-TAKE-PER-PAIR-PER-SESSION`: one take per pair per session; London and New York remain independent. These govern different states: candidate arbitration versus a broker-open trade.
P018: - June 11 New York USDJPY: retest + confirmation bar 14:35; entry bar is the 14:40 open at 160.524 per the operator ruling recorded in `BUILDER_FINDING_USDJPY-MISSES.md` (Rulings-G/J) and register row 26. 14:45 is post-entry and cannot grade selection. The current journal contains no 14:40 LONG alert or deal at that level. The fixed acceptance price is operator evidence, not an outcome observed in RECON78.
P019: - June 5 New York USDJPY 16:15 is still a distinct missed entry; the later 16:55 position is not its substitute. It is carried context only and not reopened as Q2.
P020: - Alert-only remains structural. There is no live order path authorized here. No new run is authorized.
P021: 
P022: ## 3 - V395 grade and v8 fold scope
P023: 
P024: V395 seat texts are filed whole and graded in `06_HANDOFFS/BUILDER_RESULT_V395-GRADE.md`. Sonnet returned Q1 DISCREPANCY and Q3 DISCREPANCY. GLM returned CONFIRM on Q1 with binding C1-C12/S1-S2 and CONFIRM on Q3 with binding D1-D10. Both questions therefore remain split 1-1 DISCREPANCY. Q2 was CONFIRMED by both required seats, remains closed, and is not re-asked. No build or run authority was granted.
P025: 
P026: For V8 history, section 9 was the operative design and answer form, superseding V7. V9 section 13 now controls this review; sections 4-5, 8, and 9 are historical wherever they conflict. It consolidates both V395 replies, adds source excerpts that were missing, separates the settled same-bar strategy tie from code design, and puts the remaining conditions into one review. Sections 4-5 and 8 are preserved V7 text only; they are superseded wherever section 9 says so. Do not grade those historical questions as the current proposal.
P027: ## 4 - Historical V7 Q1 proposal (superseded by section 9)
P028: 
P029: This is a proposed design, not implemented code. The helper body and retry block do not exist in the current EA and are not claimed as source exhibits.
P030: 
P031: **Recommendation.** Add `UjSyncBrokerTp(entryPid, target)` at the retarget site immediately after `g_mtrade.tpRef` is revised and before `tpBookedTouch` is evaluated. Resolve the live ticket from the position identifier, then require matching symbol and magic. Read and preserve that position's live SL. Submit `PositionModify(ticket, liveSL, NormalizeDouble(target,_Digits))`; a successful library return alone is insufficient: require the documented success retcode and a broker-position TP readback equal to the normalized target. If already equal, emit a named `UJTPMODIFY_SKIP` and do not count a modify attempt.
P032: 
P033: Proposed per-instance fields: `ujTpSyncAttempts`, `ujTpSyncAttemptBarTime`, `ujTpSyncState`, and `ujTpSyncTarget`, keyed by position identifier plus trade sequence/admission bar. Attempt no more than once per evaluated M5 bar and no more than three times per target revision. Each unsuccessful request or failed exact readback consumes one attempt. After attempt three, latch terminal FAIL; unclassified retcodes must not become an unlimited retry class. Name the retryable/permanent retcode sets or explain the default. Every modify, skip, and fail event carries pair, session, sequence, admission bar, position identifier, target and attempt/state. If TP is already equal, emit `UJTPMODIFY_SKIP` and do not count a modify attempt; explicitly exclude that skip from modify-call counts. No market close on failure: original broker SL/TP remain in control, acceptance fails, and the mismatch remains visible in `UJORPHAN` until actual broker exit. Do not mark revised-price `TP_TOUCH` as a successful broker exit while sync is pending or failed; council should settle the precise managed-model state and alert/log disposition for that case.
P034: 
P035: The retry host is after the active check at EA 11845 and before the state gate at EA 11846. EA 351 inside `MtReset` sets `g_mtrade.active=false`; the fill path sets it true at EA 10702. Model close at EA 12037 changes state to `MT_CLOSED` without clearing `active`. The proposed host sits after the active check and before the state gate, so it can service a closed-model/open-broker instance if no reset has already cleared active; verify every `MtReset` caller and the actual instance lifecycle.
P036: 
P037: O6 admission rule: before any same-pair/same-session new setup is seeded/admitted, block it while a broker position for that pair/session remains open, including an older position. A London position does not block New York. Broker-confirmed exit ends the live instance. The proposed design should gate candidate admission immediately before the IDLE seed path at EA 8072 and recheck before EmitAlert SIGNAL at EA 10625. Current IsSessionPositionOpen(magic) filters symbol and session magic, but its call at EA 10756 follows the signal alert and the MODE_ALERT_ONLY return at EA 10740-10749; it is too late for the settled admission rule. Council must confirm the proposed sites and older same-session positions are included. This boundary controls Q3: June 11 NY admission is expected only if Q1's 5 June NY position broker-closed at its revised target beforehand; otherwise the same-session block is correct.
P038: 
P039: **Q1 review asks.**
P040: 
P041: Q1 verdict: CONFIRM / OBJECT / DISCREPANCY.
P042: 
P043: - Ask A: is the proposed helper, per-instance state, retry cap, exact EA insertion sites and pre-SIGNAL O6 gate complete and internally consistent for this defect? The retry host is after the active check EA 11845 and before the state gate EA 11846; the retarget call is immediately after EA 11920 changes `tpRef` and before TP_TOUCH evaluation. Resolve ticket by position identifier, verify symbol/magic, preserve current SL, require broker success retcode and exact normalized TP readback. Name any missing field, source site, retcode rule, MQL5 behavior, or failure-state transition. In particular, state what the model must do if revised-price TP_TOUCH occurs before broker synchronization is confirmed or after the three-attempt terminal FAIL; it must not claim a revised-price broker exit that did not occur. Verify whether the retry host can still identify the position after every `MtReset` path.
P044: - Ask B: is the future acceptance exact and sufficient? For both June 5 NY (160.723 -> 160.298) and London (159.900 -> 159.908), require an instance-labeled retarget, accepted broker modification, exact broker TP readback, preserved SL, and actual broker TP deal exactly at the revised value before any later stop. London baseline is fully visible: 09:45 SIGNAL/deal #4 at 159.948 with SL 159.972 and TP 159.900; the 12:00 retarget precedes model TP_TOUCH at 12:10; the original broker TP fills at 12:19:21. A revised-target deal is a future predicate, not baseline evidence. Require no acceptance if modification/readback fails or the deal fills at the old target. Name identity fields in modify/skip/fail rows (pair, session, trade sequence/admission bar and position identifier); name and exclude idempotent skips from modify-attempt counts. Keep the operator-set entry open and actual deal as separate exact observations: the 5 June NY baseline signal/model entry is 160.115, Ask/deal is 160.120; do not assert they are equal or waive EXACT-PRICE-NO-LENIENCY. The current run has no modify call/event or revised-target deal; do not claim those outcomes happened.
P045: 
P046: ## 5 - Historical V7 Q3 proposal (superseded by section 9)
P047: 
P048: Current sequence on 11 June: the 14:40:22 pass evaluates the 14:35 bar. The opposite SHORT S4_ARMED holder gets `LTFFLIP` and sets `uj_saAbort` keyed to anchor, direction and bar time; the equal-tier LONG Daily-POC retest is excluded while the singleton is occupied; deferred abort is applied later. `SUPPRESSED` reports the exclusion; it does not perform it. The only confirm poll in the supplied 14:35 rows is for the held SHORT and is `shadow=true, confirm=0`; the baseline does not prove a LONG confirm or outcome.
P049: 
P050: **Recommendation.** When `uj_saAbort` matches the current holder identity, consume that abort once before the normal IDLE seed check. Capture/retain no S4 zone, touch, entry, SL, TP, or confirmation latches. Let `GoAbort` reset the dead holder, clear the consumed deferred-abort local, then pass the current bar once through the existing IDLE seed path so the 14:35 LONG retest+confirmation is freshly evaluated. Do not rerun the whole bar or process the candidate twice. If this placement cannot safely reach the existing IDLE path in the same pass, council must give one concrete alternative state map; no S4-to-LONG state transfer is presumed safe.
P051: 
P052: Do not release or seed a candidate while a same-pair/same-session broker position remains open. Q1 must first demonstrate broker exit of the 5 June NY trade at 160.298 before a June 11 NY entry can be expected. Q3 outcome is conditional on that prerequisite; the baseline June 11 miss does not contain a LONG confirm, alert, admission, or deal at 160.524.
P053: 
P054: **Q3 review asks.**
P055: 
P056: Q3 verdict: CONFIRM / OBJECT / DISCREPANCY.
P057: 
P058: - Ask A: does consuming the matching deferred abort before the IDLE seed path express `FLIP-KILLED-NEVER-VETOES` while preserving the pre-confirmation 5m flip kill, normal fresh S1/S2/S3/S4 initialization, same-bar POC-over-VWAP ranking, and no duplicate pass? Trace the proposed sequence against the spliced source and name any missing clear/write/return site.
P059: - Ask B: is this future acceptance gradeable without asserting an unobserved outcome? Require (i) Q1's prior same-session broker position closed at its exact revised TP before 11 June; (ii) the 14:35 LONG retest+confirmation processed through normal fresh initialization; (iii) the registered Daily-POC LONG signal and actual deal at the operator-set 14:40 open 160.524, with no spread tolerance and no relabeling the open as Ask; existing source reads `SYMBOL_ASK` for LONG at EA 10759, so disclose any unresolved execution conflict; (iv) no 14:45+ selection evidence; (v) June 8 invalid SHORT remains silent under the applicable 5m flip rule; the baseline S2SEEDBIAS_KILL is a separate observed refusal, not proof of a 5m-flip kill; (vi) 6/9 09:50 never-reseeded candidate remains refused; (vii) 5 June London 09:45 remains correct; and (viii) one accepted June 11 NY take for this registered instance, scoped by pair/session/date/anchor/direction, not a run-wide deal count. These are future-run predicates only: current rows show no June 11 LONG alert, admission, or deal. No run is requested or authorized.
P060: 
P061: ## 6 - Source exhibits (current EA; line numbers are physical source lines)
P062: 
P063: Current source/result identity: EA SHA-256 E80FF0C24149AB0946EB6A4341C0503A79BFE82E9843867CEF0DBA89BF587BBC; archived journal SHA-256 48F5C196462B08FFF38E6CCA79F3F61737F03C1F85B3A9BB9C33F5E06795926D; RECON78 result SHA-256 06465B2510E7C6DEC9B0E1EBF227DF4ABB6BD5B381899BD63AD2A64AE64C13A5.
P064: 
P065: EA source lines 11771-11785:
P066: ```mql5
P067: 11771:      {
P068: 11772:       ulong mtp_t = PositionGetTicket(mtp_i);
P069: 11773:       if(mtp_t == 0 || !PositionSelectByTicket(mtp_t)) continue;
P070: 11774:       if(PositionGetString(POSITION_SYMBOL) != _Symbol) continue;
P071: 11775:       if(PositionGetInteger(POSITION_IDENTIFIER) != pid) continue;
P072: 11776:       return mtp_t;
P073: 11777:      }
P074: 11778:    return 0;
P075: 11779:   }
P076: 11780: 
P077: 11781: 
P078: 11782: 
P079: 11783: //================= [P-EXITEXEC-1] broker close for the paper-only exit legs ========
P080: 11784: //--- Q2 (his COMBINE word): BREAK and DAY_CLOSE verdicts flipped paper state only
P081: 11785: //--- (ALERT-ONLY preserved, never an order), so the broker position lived on
P082: ```
P083: 
P084: EA source lines 11843-11846:
P085: ```mql5
P086: 11843: void EvaluateManagedTrade(const int barShift)
P087: 11844:   {
P088: 11845:    if(!g_mtrade.active) return;
P089: 11846:    if(g_mtrade.state != MT_MANAGING && g_mtrade.state != MT_PENDING_FILL) return;
P090: ```
P091: 
P092: EA source lines 11912-11923:
P093: ```mql5
P094: 11912:     //--- [P-RECON74FIX-2 R] session-close retarget (his RETARGET rule; closed-session values only; instance-contained plus caller-strict-tighter jointly bound the revision to one per trade instance).
P095: 11913:     if(g_mtrade.tpRef != EMPTY_VALUE && g_mtrade.tpRef > 0.0)
P096: 11914:       {
P097: 11915:        double uj_rtPx = 0.0;
P098: 11916:        if(UjClosedSessionTarget(g_mtrade, barShift, uj_rtPx) && uj_rtPx > 0.0
P099: 11917:           && ((g_mtrade.dir == DIR_LONG && NormalizeDouble(uj_rtPx, _Digits) < NormalizeDouble(g_mtrade.tpRef, _Digits)) || (g_mtrade.dir == DIR_SHORT && NormalizeDouble(uj_rtPx, _Digits) > NormalizeDouble(g_mtrade.tpRef, _Digits))))
P100: 11918:          {
P101: 11919:           double uj_oldRef = g_mtrade.tpRef;
P102: 11920:           g_mtrade.tpRef = uj_rtPx;
P103: 11921:           if(InpDebugLog) PrintFormat("[SRJ-EA] UJRETARGET bar=%s dir=%s old=%s sess=%d tp=%s seq=%I64d admit=%s - session-close retarget (Fix R)", TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES), DirName(g_mtrade.dir), DoubleToString(uj_oldRef, _Digits), g_mtrade.sessionAtEntry, DoubleToString(g_mtrade.tpRef, _Digits), (long)g_mtrade.uj_tradeSeq, TimeToString(g_mtrade.uj_admitBarTime, TIME_DATE|TIME_MINUTES));
P104: 11922:          }
P105: 11923:        else if(InpDebugLog && uj_rtPx > 0.0) PrintFormat("[SRJ-EA] UJNORETARGET bar=%s dir=%s tp=%s rt=%s why=%s sess=%d seq=%I64d admit=%s - helper true but not tighter (Fix R)", TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES), DirName(g_mtrade.dir), DoubleToString(g_mtrade.tpRef, _Digits), DoubleToString(uj_rtPx, _Digits), (NormalizeDouble(uj_rtPx, _Digits) == NormalizeDouble(g_mtrade.tpRef, _Digits) ? "eq" : "loose"), g_mtrade.sessionAtEntry, (long)g_mtrade.uj_tradeSeq, TimeToString(g_mtrade.uj_admitBarTime, TIME_DATE|TIME_MINUTES)); // helper-true discriminator
P106: ```
P107: 
P108: EA source lines 12036-12060:
P109: ```mql5
P110: 12036:    //--- close the trade (the priority order stated in the header)
P111: 12037:    g_mtrade.state       = MT_CLOSED;
P112: 12038:    g_mtrade.exitBarTime = barTime;
P113: 12039:    if(vSL)         { g_mtrade.exitReason = MT_EXIT_SL;             g_mtrade.exitPrice = g_mtrade.slRef; }
P114: 12040:     else if(vTP)    { g_mtrade.exitReason = MT_EXIT_TP_TOUCH;       g_mtrade.exitPrice = g_mtrade.tpRef; }
P115: 12041:    else if(vBREAK) { g_mtrade.exitReason = MT_EXIT_POI_BODY_BREAK; g_mtrade.exitPrice = nextOpenPx; }
P116: 12042:    else if(vHTF)   { g_mtrade.exitReason = MT_EXIT_HTF_FLIP;       g_mtrade.exitPrice = nextOpenPx; }
P117: 12043:    else if(vDAY)   { g_mtrade.exitReason = MT_EXIT_DAY_CLOSE;  g_mtrade.exitPrice = nextOpenPx; }
P118: 12044: 
P119: 12045:     PrintFormat("[SRJ-EA] MTEXIT bar=%s reason=%s line=%s lineVal=%s entry=%s exit=%s",
P120: 12046:                 TimeToString(barTime, TIME_DATE|TIME_MINUTES),
P121: 12047:                 MtExitName(g_mtrade.exitReason),
P122: 12048:                 (vBREAK ? breakLineName : "-"),
P123: 12049:                 (vBREAK ? DoubleToString(breakLineVal, _Digits) : "-"),
P124: 12050:                 DoubleToString(g_mtrade.entryPrice, _Digits),
P125: 12051:                 DoubleToString(g_mtrade.exitPrice, _Digits));
P126: 12052:     //--- [P-EXITEXEC-1 E7] execution legs: SL/TP broker-owned, HTF stays off,
P127: 12053:     //--- CANCEL_BIAS returned above - only the WINNING BREAK/DAY_CLOSE verdict closes.
P128: 12054:     //--- Price reference = g_mtrade.exitPrice (= nextOpenPx on the gated legs per EA 11290/11292); paper MTEXIT/MTLIFE/EXIT rows print regardless.
P129: 12055:     if(g_mtrade.exitReason == MT_EXIT_POI_BODY_BREAK || g_mtrade.exitReason == MT_EXIT_DAY_CLOSE)
P130: 12056:       {
P131: 12057:        int mtexecRc = MtCloseBrokerPosition(MtExitName(g_mtrade.exitReason), g_mtrade.exitPrice, barTime);
P132: 12058:        if(mtexecRc == 0)
P133: 12059:           PrintFormat("[SRJ-EA] MTCLOSE_FAIL bar=%s reason=%s entryTicket=%I64u entryPid=%I64d", TimeToString(barTime, TIME_DATE|TIME_MINUTES), MtExitName(g_mtrade.exitReason), g_mtrade.ticket, g_mtrade.entryPid);
P134: 12060:       }
P135: ```
P136: 
P137: EA source lines 7450-7456:
P138: ```mql5
P139: 7450:           if((uj_hm15r && uj_hm15 == uj_hwant) || uj_hcarve)
P140: 7451:             { if(InpDebugLog) PrintFormat("[SRJ-EA] UJLTFHOLD bar=%s dir=%s poi=%s state=%s m15=%s rf=%d mode=%s term=%s - LTF opposed, hold (Fix F11)", TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES), DirName(g_dir), AnchorStr(), StateName(g_state), DoubleToString(uj_hm15, 1), (uj_hm15r ? 1 : 0), ((uj_hm15r && uj_hm15 == uj_hwant) ? "M15" : "CARVE"), uj_hterm); }
P141: 7452:           else
P142: 7453:             {
P143: 7454:              uj_saAbort = true; uj_saA = g_anchorLine; uj_saD = (int)g_dir; uj_saT = g_anchorBarTime;
P144: 7455:              if(InpDebugLog) PrintFormat("[SRJ-EA] UJDEFERABORT bar=%s dir=%s poi=%s state=%s - LTF opposed, abort deferred past evaluation (Fix S-a)", TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES), DirName(g_dir), AnchorStr(), StateName(g_state));
P145: 7456:             }
P146: ```
P147: 
P148: EA source lines 8070-8094:
P149: ```mql5
P150: 8070:     bool s1f_seedArmed = (g_state == ST_IDLE);   //--- [SIDE1F] (i) seed-bar exactness flag (new local only)
P151: 8071: 
P152: 8072:     if(g_state == ST_IDLE)
P153: 8073:       {
P154: 8074:        if(!inWindow) { if(InpDebugLog && TimeToString(barTime, TIME_MINUTES) == "17:00") PrintFormat("[SRJ-EA] SEEDDIAG bar=%s branch=WINDOW inWin=0 sess=%s retestFound=%d", TimeToString(barTime, TIME_DATE|TIME_MINUTES), SessionName(sess), -1); return; }
P155: 8075:       if(SessionAlreadyUsed(sess, barTime))
P156: 8076:         {
P157: 8077:          static datetime s_limitDay  = 0;
P158: 8078:          static int      s_limitSess = -1;
P159: 8079:          datetime dayKey = TC_DayStart(barTime);
P160: 8080:          if(InpDebugLog && (dayKey != s_limitDay || (int)sess != s_limitSess))
P161: 8081:            {
P162: 8082:             s_limitDay  = dayKey;
P163: 8083:             s_limitSess = (int)sess;
P164: 8084:             PrintFormat("[SRJ-EA] %s SESSION_LIMIT: %s window already used today - "
P165: 8085:                         "all further candidates suppressed until the next window",
P166: 8086:                         TimeToString(TimeCurrent(), TIME_DATE|TIME_SECONDS),
P167: 8087:                         SessionName(sess));
P168: 8088:            }
P169: 8089:          if(InpDebugLog && TimeToString(barTime, TIME_MINUTES) == "17:00") PrintFormat("[SRJ-EA] SEEDDIAG bar=%s branch=SESSION inWin=1 sess=%s retestFound=%d", TimeToString(barTime, TIME_DATE|TIME_MINUTES), SessionName(sess), -1);
P170: 8090:          return;
P171: 8091:         }
P172: 8092:         PoiRetestResult pr;
P173: 8093:         if(!DetectPoiRetest(barShift, pr) || !pr.found) { if(InpDebugLog && TimeToString(barTime, TIME_MINUTES) == "17:00") PrintFormat("[SRJ-EA] SEEDDIAG bar=%s branch=RETEST inWin=1 sess=%s retestFound=%d", TimeToString(barTime, TIME_DATE|TIME_MINUTES), SessionName(sess), (pr.found ? 1 : 0)); return; }
P174: 8094:         //--- [P-RESQUAT-1 F-a] eviction-paired read gate: a candidate identical to
P175: ```
P176: 
P177: EA source lines 8462-8476:
P178: ```mql5
P179: 8462:        //--- [v20 S-a] deferred-abort application (identity-keyed on anchor+dir+barTime; set in Fix F11 tail).
P180: 8463:        if(uj_saAbort)
P181: 8464:          {
P182: 8465:           if(uj_saA == g_anchorLine && uj_saD == (int)g_dir && uj_saT == g_anchorBarTime)
P183: 8466:             {
P184: 8467:              if(InpDebugLog) PrintFormat("[SRJ-EA] UJDEFERAPPLY bar=%s dir=%s poi=%s - deferred LTF abort applies, holder unchanged (Fix S-a)", TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES), DirName(g_dir), AnchorStr());
P185: 8468:              GoAbort(ABORT_LTF_MISALIGN, g_state);
P186: 8469:              return;
P187: 8470:             }
P188: 8471:           else
P189: 8472:             {
P190: 8473:              if(InpDebugLog) PrintFormat("[SRJ-EA] UJDEFERDROP bar=%s dir=%s poi=%s - deferred LTF abort dropped, holder changed (Fix S-a)", TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES), DirName(g_dir), AnchorStr());
P191: 8474:             }
P192: 8475:           uj_saAbort = false;
P193: 8476:          }
P194: ```
P195: 
P196: EA source lines 1754-1763 (existing session-position resolver):
P197: ```mql5
P198: 1754: bool IsSessionPositionOpen(long magic)
P199: 1755:   {
P200: 1756:    for(int i = PositionsTotal() - 1; i >= 0; i--)
P201: 1757:      {
P202: 1758:       ulong ticket = PositionGetTicket(i);
P203: 1759:       if(PositionGetString(POSITION_SYMBOL) == _Symbol && PositionGetInteger(POSITION_MAGIC) == magic)
P204: 1760:          return true;
P205: 1761:      }
P206: 1762:    return false;
P207: 1763:   }
P208: ```
P209: 
P210: EA source lines 10618-10645 (SIGNAL alert precedes current position guard; managed-trade record is snapshotted afterward):
P211: ```mql5
P212: 10618:         LogSignal(tpTarget, tpR, slRef, slMode, divKind);
P213: 10619:         if(InpDebugLog) A6Fired(barShift, tpTarget, tpR, slRef, slMode, divKind);   //--- [A6-HOOK] (ii)
P214: 10620:         if(InpDebugLog) PrintFormat("[SRJ-EA] SIDE1F_WATCH bar=%s dir=%s", TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES), DirName(g_dir));   //--- [SIDE1F] (iii) fire watch (read-only)
P215: 10621: 
P216: 10622:       if(!g_alertedSignal)
P217: 10623:         {
P218: 10624:          g_alertedSignal = true;
P219: 10625:          EmitAlert("SIGNAL",
P220: 10626:                    StringFormat("R=%.2f SL %s TP %s spr=%d",
P221: 10627:                                 tpR,
P222: 10628:                                 DoubleToString(slRef,    _Digits),
P223: 10629:                                 DoubleToString(tpTarget, _Digits),
P224: 10630:                                 (int)SymbolInfoInteger(_Symbol, SYMBOL_SPREAD)),
P225: 10631:                    true);
P226: 10632:         }
P227: 10633: 
P228: 10634:       //--- [P-EXITMODEL 2026-09-09, operator-issued packet] The section 5 exit phase
P229: 10635:       //--- now exists: snapshot the trade into the managed record BEFORE
P230: 10636:       //--- ResetSequence (the R-201 ordering discipline). The entry reference IS the
P231: 10637:       //--- next candle's open (currentPrice above), so the fill is immediate at that
P232: 10638:       //--- open (section 5.5's limit "fills on a wick" - the forming bar's own open
P233: 10639:       //--- is the fill tick); the fill candle's own close is then tested like every
P234: 10640:       //--- bar ("exit immediately rather than waiting for a subsequent close").
P235: 10641:       //--- DECLARED BOUNDARY: one managed record (the R-201 precedent). A second
P236: 10642:       //--- signal while one trade is managing logs MTCOLLISION and REPLACES the
P237: 10643:       //--- record (spec section 6's blessed London+NY exception would need a
P238: 10644:       //--- registry - a separate packet item if it ever fires).
P239: 10645:       if(g_mtrade.active && g_mtrade.state == MT_MANAGING)
P240: ```
P241: 
P242: EA source lines 10740-10761 (alert-only returns before the current execution-only position guard; LONG execution reads Ask):
P243: ```mql5
P244: 10740:       if(InpMode == MODE_ALERT_ONLY)
P245: 10741:         {
P246: 10742:          PrintFormat("[SRJ-EA] ALERT_ONLY mode - no order sent. Session %s marked used.",
P247: 10743:                      SessionName(g_sessionAtEntry));
P248: 10744:          MarkSessionUsed(g_sessionAtEntry, g_anchorBarTime);
P249: 10745:          ENUM_SRJ_STATE prevA = g_state;
P250: 10746:          g_state = ST_SIGNAL;
P251: 10747:          LogState(prevA, g_state);
P252: 10748:          ResetSequence();
P253: 10749:          return;
P254: 10750:         }
P255: 10751: 
P256: 10752:        // ------ Phase 2 Execution Logic ------
P257: 10753:        if(InpMode == MODE_EXECUTE) PrintFormat("[SRJ-EA] EXECUTE_ACCT mode=%d login=%d", (int)AccountInfoInteger(ACCOUNT_TRADE_MODE), (int)AccountInfoInteger(ACCOUNT_LOGIN));
P258: 10754:        long magic = (g_sessionAtEntry == SESSION_LONDON) ? InpMagicBase + 1 : InpMagicBase + 2;
P259: 10755: 
P260: 10756:       if(IsSessionPositionOpen(magic))
P261: 10757:         { GoAbort(ABORT_CONCURRENCY, g_state); return; }
P262: 10758: 
P263: 10759:       double entryPrice = (g_dir == DIR_LONG) ? SymbolInfoDouble(_Symbol, SYMBOL_ASK) : SymbolInfoDouble(_Symbol, SYMBOL_BID);
P264: 10760:       double riskMoney  = AccountInfoDouble(ACCOUNT_EQUITY) * InpRiskPercent / 100.0;
P265: 10761:       double slDistanceReal = MathAbs(entryPrice - slRef);
P266: ```
P267: 
P268: EA source lines 6571-6595 (ResetSequence clears the old candidate; the next comment line is omitted because it contains a non-ASCII dash and no executable statement):
P269: ```mql5
P270: 6571: void ResetSequence()
P271: 6572:   {
P272: 6573:    g_state          = ST_IDLE;
P273: 6574:    g_dir            = DIR_NONE;
P274: 6575:    SrjSideNote("ResetSequence", g_dir);
P275: 6576:    g_regime         = REGIME_NONE;
P276: 6577:    g_sessionAtEntry = SESSION_NONE;
P277: 6578:    g_anchorLine     = -1;
P278: 6579:    g_anchorPrice    = 0.0;
P279: 6580:    g_anchorBarTime  = 0;
P280: 6581:    g_divLatch       = false;
P281: 6582:    g_touchSeen      = false;
P282: 6583:    g_touchBarHi     = 0.0;
P283: 6584:    g_touchBarLo     = 0.0;
P284: 6585:    g_zoneHi         = 0.0;
P285: 6586:    g_zoneLo         = 0.0;
P286: 6587:    g_alertedArmed   = false;
P287: 6588:    g_alertedSignal  = false;
P288: 6589:    g_latchedEntry   = 0.0;
P289: 6590:    g_latchedSl      = 0.0;
P290: 6591:    g_latchedTp      = 0.0;
P291: 6592:    g_latchedR       = 0.0;
P292: 6593:    g_latchBarTime   = 0;
P293: 6594:    g_confirmFromState = ST_IDLE;
P294: 6595:    //--- [P-BUILD3 E5] no new working-set field: the re-bind assigns anchor,
P295: ```
P296: 
P297: EA source lines 6597-6634 (GoAbort calls ResetSequence):
P298: ```mql5
P299: 6597:    //--- existing members (fields 4/5/6, 11/12, 8/9/10, 0, 15-19, 20).
P300: 6598:   }
P301: 6599: 
P302: 6600: void GoAbort(const string reason, ENUM_SRJ_STATE atState)
P303: 6601:   {
P304: 6602:    LogAbort(reason, atState);
P305: 6603:    if(InpDebugLog && g_dir != DIR_NONE)
P306: 6604:      {
P307: 6605:       string a6rBT = TimeToString(TimeCurrent(), TIME_DATE|TIME_MINUTES);
P308: 6606:       string a6rLn = StringFormat("[SRJ-EA] A6REFUSED class=ABSENT_DECLINED bar=%s state=%s dir=%s predicate=%s",
P309: 6607:                                   a6rBT, StateName(atState), DirName(g_dir), reason);
P310: 6608:       A6Emit("REF" + a6rBT + reason + StateName(atState), a6rLn);
P311: 6609:      }   //--- [A6-HOOK] (ii) refused decision row (candidate alive => born+rejected)
P312: 6610:    //--- TASK 19c: count NO_REGIME aborts so the census can be read against
P313: 6611:    //--- them directly. Measurement only.
P314: 6612:    if(InpDebugLog && reason == ABORT_NO_REGIME) g_ea19_noRegimeAborts++;
P315: 6613:    if(InpAlertStandDown && g_alertedArmed && !g_alertedSignal)
P316: 6614:       EmitAlert("STAND-DOWN", "reason=" + reason, false);
P317: 6615: 
P318: 6616:    //--- TASK 15: shadow record. Must fire BEFORE ResetSequence()
P319: 6617:    //--- clears g_dir and g_anchorLine. Read-only measurement.
P320: 6618:    if(InpDebugLog &&
P321: 6619:       (reason == ABORT_NO_REGIME || reason == ABORT_LTF_MISALIGN))
P322: 6620:      {
P323: 6621:       g_shadowActive = true;
P324: 6622:       g_shadowDir    = g_dir;
P325: 6623:       g_shadowLine   = g_anchorLine;
P326: 6624:       g_shadowOpened = g_anchorBarTime;
P327: 6625:       g_shadowSess   = g_sessionAtEntry;
P328: 6626:       g_shadowFail   = reason;
P329: 6627:       g_shadowBars   = 0;
P330: 6628:      }
P331: 6629: 
P332: 6630:    ENUM_SRJ_STATE prev = g_state;
P333: 6631:    g_state = ST_ABORT;
P334: 6632:    LogState(prev, g_state);
P335: 6633:    ResetSequence();
P336: 6634:   }
P337: ```
P338: 
P339: EA source lines 8430-8476 (same-pass contender handling followed by the current deferred-abort apply/drop site):
P340: ```mql5
P341: 8430:        if(g_state == ST_S3_ZONE_WAIT || g_state == ST_S4_ARMED) {
P342: 8431:        bool uj_sbHave = false; ENUM_SRJ_DIR uj_sbDir = DIR_NONE; int uj_sbLine = -1;
P343: 8432:        {
P344: 8433:         PoiRetestResult uj_sbPr;
P345: 8434:         if(DetectPoiRetest(barShift, uj_sbPr) && uj_sbPr.found)
P346: 8435:           { uj_sbHave = true; uj_sbDir = uj_sbPr.isLong ? DIR_LONG : DIR_SHORT; uj_sbLine = uj_sbPr.topLine; }
P347: 8436:        }
P348: 8437:        string uj_sbTermC = "", uj_sbTermH = "";
P349: 8438:         bool uj_sbConfC = (uj_sbHave && (uj_sbDir != g_dir)) ? IsConfirmationCandle(barShift, uj_sbLine, uj_sbDir, uj_sbTermC, true) : false;
P350: 8439:        bool uj_sbConfH = IsConfirmationCandle(barShift, g_anchorLine, g_dir, uj_sbTermH);
P351: 8440:         double uj_sbLineVal = 0.0; if(uj_sbHave && uj_sbLine >= 0 && !ReadBuf1(g_hPoi, uj_sbLine, uj_sbLineVal, barShift)) uj_sbLineVal = 0.0;
P352: 8441:         double uj_sbo1 = iOpen (_Symbol, PERIOD_CURRENT, barShift + 1); double uj_sbc1 = iClose(_Symbol, PERIOD_CURRENT, barShift + 1); double uj_sbc0 = iClose(_Symbol, PERIOD_CURRENT, barShift); int uj_sbarm = 1;
P353: 8442:         if(InpDebugLog) PrintFormat("[SRJ-EA] UJSBTELEM bar=%s dir=%s have=%d sbDir=%s sbLine=%d confC=%d confH=%d sbL=%s o1=%s c1=%s c0=%s arm=%d termC=%s termH=%s - contender evaluation (Fix S3)", TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES), DirName(g_dir), (int)uj_sbHave, DirName(uj_sbDir), uj_sbLine, (int)uj_sbConfC, (int)uj_sbConfH, DoubleToString(uj_sbLineVal, _Digits), DoubleToString(uj_sbo1, _Digits), DoubleToString(uj_sbc1, _Digits), DoubleToString(uj_sbc0, _Digits), uj_sbarm, uj_sbTermC, uj_sbTermH);
P354: 8443:        if(uj_sbConfC && !uj_sbConfH && (g_state == ST_S3_ZONE_WAIT || g_state == ST_S4_ARMED))
P355: 8444:          {
P356: 8445:           int uj_sbFromLine = g_anchorLine; ENUM_SRJ_DIR uj_sbFromDir = g_dir;
P357: 8446:           g_anchorLine = uj_sbLine; g_dir = uj_sbDir;
P358: 8447:           ReadBuf1(g_hPoi, uj_sbLine, g_anchorPrice, barShift);
P359: 8448:           g_anchorBarTime = barTime;
P360: 8449:           g_zoneHi = 0.0; g_zoneLo = 0.0; g_touchSeen = false;
P361: 8450:           g_touchBarHi = 0.0; g_touchBarLo = 0.0;
P362: 8451:           g_latchedEntry = 0.0; g_latchedSl = 0.0; g_latchedTp = 0.0; g_latchedR = 0.0;
P363: 8452:           g_latchBarTime = 0; g_confirmFromState = ST_IDLE;
P364: 8453:           uj_memo_valid = false;
P365: 8454:           if(InpDebugLog)
P366: 8455:              PrintFormat("[SRJ-EA] SIDE1C_YIELD bar=%s from=%s fromDir=%s to=%s toDir=%s state=%s term=%s",
P367: 8456:                          TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES),
P368: 8457:                          g_lineCode[uj_sbFromLine], DirName(uj_sbFromDir),
P369: 8458:                          g_lineCode[uj_sbLine], DirName(uj_sbDir),
P370: 8459:                          StateName(g_state), uj_sbTermC);
P371: 8460:          }
P372: 8461:        }
P373: 8462:        //--- [v20 S-a] deferred-abort application (identity-keyed on anchor+dir+barTime; set in Fix F11 tail).
P374: 8463:        if(uj_saAbort)
P375: 8464:          {
P376: 8465:           if(uj_saA == g_anchorLine && uj_saD == (int)g_dir && uj_saT == g_anchorBarTime)
P377: 8466:             {
P378: 8467:              if(InpDebugLog) PrintFormat("[SRJ-EA] UJDEFERAPPLY bar=%s dir=%s poi=%s - deferred LTF abort applies, holder unchanged (Fix S-a)", TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES), DirName(g_dir), AnchorStr());
P379: 8468:              GoAbort(ABORT_LTF_MISALIGN, g_state);
P380: 8469:              return;
P381: 8470:             }
P382: 8471:           else
P383: 8472:             {
P384: 8473:              if(InpDebugLog) PrintFormat("[SRJ-EA] UJDEFERDROP bar=%s dir=%s poi=%s - deferred LTF abort dropped, holder changed (Fix S-a)", TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES), DirName(g_dir), AnchorStr());
P385: 8474:             }
P386: 8475:           uj_saAbort = false;
P387: 8476:          }
P388: ```
P389: 
P390: EA source lines 7991-8043 (SUPPRESSED census is diagnostic; it is not the IDLE seed gate):
P391: ```mql5
P392: 7991:    //--- [Task 73 / Stage 3 cost side] Suppression census. DIAGNOSTIC ONLY.
P393: 7992:    //--- Two unmeasured quantities, both needed before Stage 3 is sized:
P394: 7993:    //---   1. The singleton discards every POI retest that arrives while a
P395: 7994:    //---      sequence is alive. 103 candidates were ADMITTED across this
P396: 7995:    //---      window; how many were silently dropped is unknown, and Stage 3
P397: 7996:    //---      lengthens candidate lifetime, so it raises that number.
P398: 7997:    //---   2. Part A carries a rule the EA does not implement - an
P399: 7998:    //---      opposite-direction HIGHER-TIER retest replaces the candidate.
P400: 7999:    //---      Its frequency has never been counted.
P401: 8000:    //---
P402: 8001:    //--- DetectPoiRetest is read-only: it fills a caller-owned struct from the
P403: 8002:    //--- 12 POI buffers and mutates no sequence state. It is called here on the
P404: 8003:    //--- SAME barShift the live cascade uses, so a hit is exactly a retest the
P405: 8004:    //--- IDLE block would have consumed had the singleton been free.
P406: 8005:    //---
P407: 8006:    //--- Tier comparison uses g_authorityRank (lower is more authoritative),
P408: 8007:    //--- the same ranking D-3 and G-2 already use. No distance, no size, no bar
P409: 8008:    //--- count, no tolerance - Part A section 7 is not engaged.
P410: 8009:    //---
P411: 8010:    //--- Gated on InpDebugLog. Assigns nothing outside its own statics, reads
P412: 8011:    //--- g_state / g_dir / g_anchorLine for labelling only, and cannot alter
P413: 8012:    //--- control flow. R8 is NOT engaged.
P414: 8013:    if(InpDebugLog && inWindow &&
P415: 8014:       g_state > ST_IDLE && g_state != ST_ABORT && g_anchorLine >= 0)
P416: 8015:      {
P417: 8016:       static int s_t73_n      = 0;
P418: 8017:       static int s_t73_higher = 0;
P419: 8018:       static int s_t73_opp    = 0;
P420: 8019:       static int s_t73_both   = 0;
P421: 8020:       static int s_t73_bars   = 0;
P422: 8021:       s_t73_bars++;
P423: 8022:       PoiRetestResult t73_pr;
P424: 8023:       if(DetectPoiRetest(barShift, t73_pr) && t73_pr.found)
P425: 8024:         {
P426: 8025:          s_t73_n++;
P427: 8026:          ENUM_SRJ_DIR t73_dir    = t73_pr.isLong ? DIR_LONG : DIR_SHORT;
P428: 8027:          bool         t73_isOpp  = (t73_dir != g_dir);
P429: 8028:          bool         t73_isHigh = (g_authorityRank[t73_pr.topLine] <
P430: 8029:                                     g_authorityRank[g_anchorLine]);
P431: 8030:          if(t73_isHigh)               s_t73_higher++;
P432: 8031:          if(t73_isOpp)                s_t73_opp++;
P433: 8032:          if(t73_isOpp && t73_isHigh)  s_t73_both++;
P434: 8033:          PrintFormat("[SRJ-EA] SUPPRESSED bar=%s poi=%s dir=%s opp=%d higher=%d "
P435: 8034:                      "heldPoi=%s heldDir=%s heldState=%s "
P436: 8035:                      "cum_n=%d cum_opp=%d cum_hi=%d cum_both=%d action=%s",
P437: 8036:                      TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift),
P438: 8037:                                   TIME_DATE|TIME_MINUTES),
P439: 8038:                      g_lineCode[t73_pr.topLine], DirName(t73_dir),
P440: 8039:                      (int)t73_isOpp, (int)t73_isHigh,
P441: 8040:                      g_lineCode[g_anchorLine], DirName(g_dir), StateName(g_state),
P442: 8041:                      s_t73_n, s_t73_opp, s_t73_higher, s_t73_both,
P443: 8042:                      b3_superseded ? "SUPERSEDED" : "HELD");
P444: 8043:         }
P445: ```
P446: 
P447: EA source lines 103-104 (Daily-POC ranks ahead of Daily-VWAP):
P448: ```mql5
P449: 103:    g_authorityRank[POI_BUF_D_POC]  = 10;  g_lineCode[POI_BUF_D_POC]  = "Daily-POC";
P450: 104:    g_authorityRank[POI_BUF_D_VWAP] = 11;  g_lineCode[POI_BUF_D_VWAP] = "Daily-VWAP";
P451: ```
P452: 
P453: EA source lines 2115-2125 (retest election selects the best-ranked valid long/short line):
P454: ```mql5
P455: 2115:        if(l <= L - P + EPS && bodyLo >= L - EPS)
P456: 2116:         { int rk = g_authorityRank[k]; if(rk < bestLongRank) { bestLongRank = rk; bestLongLine = k; } }
P457: 2117:       if(h >= L + P - EPS && bodyHi <= L + EPS)
P458: 2118:         { int rk = g_authorityRank[k]; if(rk < bestShortRank) { bestShortRank = rk; bestShortLine = k; } }
P459: 2119:      }
P460: 2120:     if(bestLongLine < 0 && bestShortLine < 0)
P461: 2121:       { g_n1_entryWickInv += n1e_nW; g_n1_entryBodyInv += n1e_nB; return false; }
P462: 2122:     if(bestLongLine >= 0 && (bestShortLine < 0 || bestLongRank <= bestShortRank))
P463: 2123:       { r.found = true; r.isLong = true;  r.topLine = bestLongLine; }
P464: 2124:      else
P465: 2125:        { r.found = true; r.isLong = false; r.topLine = bestShortLine; }
P466: ```
P467: 
P468: EA source lines 349-352 (reset marks the managed trade inactive):
P469: ```mql5
P470: 349: void MtReset()
P471: 350:   {
P472: 351:    g_mtrade.active            = false;
P473: 352:    g_mtrade.state             = MT_INACTIVE;
P474: ```
P475: 
P476: EA source lines 10702-10704 (managed-trade active is set on fill):
P477: ```mql5
P478: 10702:       g_mtrade.active            = true;
P479: 10703:       g_mtrade.state             = MT_MANAGING;
P480: 10704:       g_mtrade.dir               = g_dir;
P481: ```
P482: 
P483: ## 7 - RECON78 source rows (physical journal lines; rows are evidence, not a future outcome)
P484: 
P485: Journal source rows (SEG is the physical, 1-indexed journal line):
P486: ```text
P487: SEG 13085: HK	0	16:41:34.132	Core 04	2026.06.05 09:45:00   [SRJ-EA] 2026.06.05 09:45:00 SIGNAL dir=SHORT poi=Daily-POC regime=TREND div=hidden sess=LONDON tp_target=159.900 tp_R=2.00 sl_ref=159.972 sl_mode=2-swing spreadPts=3 bid=159.948 ask=159.951
P488: SEG 13097: OF	0	16:41:34.132	Core 04	2026.06.05 09:45:00   deal #4 sell 6.74 USDJPY at 159.948 done (based on order #4)
P489: SEG 13393: QO	0	16:42:10.830	Core 04	2026.06.05 12:05:00   [SRJ-EA] UJRETARGET bar=2026.06.05 12:00 dir=SHORT old=159.900 sess=1 tp=159.908 seq=2 admit=2026.06.05 09:40 - session-close retarget (Fix R)
P490: SEG 13417: NN	0	16:42:10.830	Core 04	2026.06.05 12:15:00   [SRJ-EA] MTEXIT bar=2026.06.05 12:10 reason=TP_TOUCH line=- lineVal=- entry=159.948 exit=159.908
P491: SEG 13418: FD	0	16:42:10.830	Core 04	2026.06.05 12:15:00   [SRJ-EA] MTLIFE fields=11 openBar=2026.06.05 09:45 dir=SHORT entry=159.948 sl=159.972 tp=159.908 verdict=TP_TOUCH closeBar=2026.06.05 12:10 closePx=159.908 openAtNewsStart=0 openAtDayClose=0 openAtWeekClose=0
P492: SEG 13419: CJ	0	16:42:10.830	Core 04	2026.06.05 12:15:00   [SRJ-EA] ALERT SRJ EXIT NONE USDJPY M5 | - | NONE | TP_TOUCH at 159.908 (entry 159.948)
P493: SEG 13420: IH	0	16:42:10.830	Core 04	2026.06.05 12:19:21   take profit triggered #4 sell 6.74 USDJPY 159.948 sl: 159.972 tp: 159.900 [#5 buy 6.74 USDJPY at 159.900]
P494: SEG 13421: OJ	0	16:42:10.830	Core 04	2026.06.05 12:19:21   deal #5 buy 6.74 USDJPY at 159.900 done (based on order #5)
P495: SEG 14047: MQ	0	16:43:24.215	Core 04	2026.06.05 16:55:00   [SRJ-EA] 2026.06.05 16:55:00 SIGNAL dir=LONG poi=Daily-POC regime=TREND div=regular sess=NYAM tp_target=160.723 tp_R=1.56 sl_ref=159.726 sl_mode=1-swing spreadPts=5 bid=160.115 ask=160.120
P496: SEG 14057: LR	0	16:43:24.215	Core 04	2026.06.05 16:55:00   [SRJ-EA] PRE-SEND lots=0.41 entry=160.120 slPts=394 tpPts=603 stopsLevel=0 freezeLevel=0 spreadPts=5
P497: SEG 14058: OS	0	16:43:24.215	Core 04	2026.06.05 16:55:00   market buy 0.41 USDJPY sl: 159.726 tp: 160.723 (160.115 / 160.120)
P498: SEG 14059: CQ	0	16:43:24.215	Core 04	2026.06.05 16:55:00   deal #6 buy 0.41 USDJPY at 160.120 done (based on order #6)
P499: SEG 14331: MS	0	16:44:00.911	Core 04	2026.06.05 19:05:01   [SRJ-EA] UJRETARGET bar=2026.06.05 19:00 dir=LONG old=160.723 sess=2 tp=160.298 seq=3 admit=2026.06.05 16:50 - session-close retarget (Fix R)
P500: SEG 14354: GF	0	16:44:07.028	Core 04	2026.06.05 19:20:01   [SRJ-EA] MTEXIT bar=2026.06.05 19:15 reason=TP_TOUCH line=- lineVal=- entry=160.115 exit=160.298
P501: SEG 15006: KP	0	16:47:53.340	Core 04	2026.06.08 09:30:00   [SRJ-EA] UJPROV bar=2026.06.08 09:25 dir=SHORT reseedBar=1970.01.01 00:00 seedBiasAl=0 reseedDir=0 exempt=0 - reseed provenance at S2 edge (Fix CARRY)
P502: SEG 15007: HP	0	16:47:53.340	Core 04	2026.06.08 09:30:00   [SRJ-EA] S2SEEDBIAS_KILL bar=2026.06.08 09:25 dir=SHORT poi=Weekly-POC - seedbias refused, promotion killed (Fix B2)
P503: SEG 16565: GR	0	16:54:24.798	Core 04	2026.06.09 09:55:00   [SRJ-EA] UJPROV bar=2026.06.09 09:50 dir=SHORT reseedBar=1970.01.01 00:00 seedBiasAl=0 reseedDir=0 exempt=0 - reseed provenance at S2 edge (Fix CARRY)
P504: SEG 16566: HJ	0	16:54:24.798	Core 04	2026.06.09 09:55:00   [SRJ-EA] S2SEEDBIAS_KILL bar=2026.06.09 09:50 dir=SHORT poi=Weekly-VWAP - seedbias refused, promotion killed (Fix B2)
P505: SEG 22629: CS	0	17:08:16.498	Core 04	2026.06.11 14:40:22   [SRJ-EA] LTFFLIP bar=2026.06.11 14:35 dir=SHORT poi=Daily-POC state=S4_ARMED - LTF bias turned against the locked direction
P506: SEG 22631: QN	0	17:08:16.498	Core 04	2026.06.11 14:40:22   [SRJ-EA] UJDEFERABORT bar=2026.06.11 14:35 dir=SHORT poi=Daily-POC state=S4_ARMED - LTF opposed, abort deferred past evaluation (Fix S-a)
P507: SEG 22652: PL	0	17:08:16.498	Core 04	2026.06.11 14:40:22   [SRJ-EA] SIDE1H_WOULDPREEMPT bar=2026.06.11 14:35 newPoi=Daily-POC newDir=LONG heldPoi=Daily-POC heldDir=SHORT heldState=S4_ARMED newTier=5 heldTier=5 wouldPreempt=0 wouldTierPassLegacy=0
P508: SEG 22654: RO	0	17:08:16.498	Core 04	2026.06.11 14:40:22   [SRJ-EA] SUPPRESSED bar=2026.06.11 14:35 poi=Daily-POC dir=LONG opp=1 higher=0 heldPoi=Daily-POC heldDir=SHORT heldState=S4_ARMED cum_n=79 cum_opp=19 cum_hi=7 cum_both=4 action=HELD
P509: SEG 22655: GL	0	17:08:16.498	Core 04	2026.06.11 14:40:22   [SRJ-EA] RETESTBOOK bar=2026.06.11 14:35 hits=2 Daily-POC:r10:dL Daily-VWAP:r11:dL
P510: SEG 22658: CQ	0	17:08:16.498	Core 04	2026.06.11 14:40:22   [SRJ-EA] CONFIRMPOLL bar=2026.06.11 14:35 anchor=Daily-POC dir=SHORT oppCandle=0 bodyDir=0 body=3pts doji=0 touchAttr=1 confirm=0 shadow=true
P511: SEG 22661: CQ	0	17:08:16.498	Core 04	2026.06.11 14:40:22   [SRJ-EA] UJDEFERAPPLY bar=2026.06.11 14:35 dir=SHORT poi=Daily-POC - deferred LTF abort applies, holder unchanged (Fix S-a)
P512: SEG 22664: JF	0	17:08:16.498	Core 04	2026.06.11 14:40:22   [SRJ-EA] ALERT SRJ STAND-DOWN SHORT USDJPY M5 | Daily-POC | NYAM | reason=LTF_MISALIGN
P513: SEG 24023: QG	0	17:10:18.795	Core 04	2026.06.11 22:30:51   stop loss triggered #6 buy 0.41 USDJPY 160.120 sl: 159.726 tp: 160.723 [#7 sell 0.41 USDJPY at 159.726]
P514: SEG 24024: JG	0	17:10:18.795	Core 04	2026.06.11 22:30:51   deal #7 sell 0.41 USDJPY at 159.725 done (based on order #7)
P515: ```
P516: 
P517: ## 8 - Historical V7 review boundaries (superseded by section 9)
P518: 
P519: Review only this complete page. Give one verdict for Q1 and Q3, answer A and B for each, cite physical P-lines, identify every remaining defect/condition, and close each question separately. Q2 is closed by both required seats and is not re-asked. Distinguish settled operator rules from implementation recommendations and future acceptance predicates. Do not claim unobserved outcomes or rely on unspliced source behavior. This review authorizes no source edit, build, tester run, live trade, Luna key, operator run word, commit, or push. The prior run authorization is consumed.
P520: ## 9 - Historical V8 operative design and council questions (superseded by section 13)
P521: 
P522: ### 9.1 Decision scope
P523: 
P524: This section records the V8 proposal and question form for audit. It is superseded by section 13. Do not grade this historical answer form in place of the V9 Q1/Q3 asks. Q2 remains closed.
P525: 
P526: ### 9.2 Q1 proposed design: position-instance manager plus exact broker TP synchronization
P527: 
P528: **The singleton replacement is part of the defect, not a safe assumption.** Current EA lines 10641-10656 explicitly replace the one `g_mtrade` record on a later signal, and line 10656 calls `MtReset`; the same file has one `MtReset` call site plus its definition. The strategy record says London and New York are independent. Therefore v8 does not rely on per-target fields inside the replaceable singleton, nor on an argument that the retry window is practically empty.
P529: 
P530: **Recommendation:** replace the single managed-position slot with an instance collection keyed by broker `POSITION_IDENTIFIER` plus SRJ trade sequence and admission bar. Each filled position owns its full management snapshot, entry ticket, pair, direction, session/magic, SL, current booked TP, target revision, model state, and sync state. Filling a later London/NY trade adds an instance; it never resets or overwrites another open instance. `MtReset` becomes slot-local and can retire a slot only after that PID is absent and its closing deal has been resolved. Evaluate every active instance once per closed M5 bar. This is a design requirement to preserve both positions and their retries; the packet does not claim the collection exists.
P531: 
P532: For each instance, the retarget site updates that instance's model target, increments its target revision, resets that revision's attempt counter, emits `UJRETARGET`, and makes the immediate broker call attempt 1 before `tpBookedTouch` evaluation. The retry host runs once per evaluated M5 bar for each still-open instance, before any model-state early return, including while the model is waiting for broker exit. If the host already ran earlier on the same bar for the prior revision, the revision-keyed bar guard still permits attempt 1 for the newly retargeted value; there is at most one modify call per bar per revision and three calls total per revision. A readback-only lag is not a second call in the same bar. A successful target revision is latched; emit one `UJTPMODIFY_SKIP` when already equal and no repeated per-bar skip noise.
P533: 
P534: The helper is execute-mode only. In `MODE_ALERT_ONLY`, or before a filled broker position resolves to the instance, it emits `UJTPMODIFY_NOPOS`/paper-only disposition, consumes no attempt, and does not claim broker synchronization. No market close is sent on modify failure. Resolve a live ticket by enumerating positions and matching PID, symbol, and expected session magic, then reselect and verify the ticket/PID before modification. Use ticket overload, never the symbol overload. Read the live SL immediately before modification; pass that exact SL (including 0.0 when there is no SL), and require normalized readback SL to equal the pre-call SL.
P535: 
P536: `PositionModify` is a `CTrade` method. Official MQL5 documentation says its Boolean return reports basic request-structure checks and requires checking `ResultRetcode`; the ticket overload targets a ticket, while the symbol overload in hedging accounts can select the lowest-ticket position. The EA has one `CTrade g_trade` declaration, two `SetTypeFilling` calls, no `PositionModify` call, and no `SetAsyncMode` call. The build packet must explicitly verify the deployed object's async configuration and the account's netting/hedging mode before relying on readback timing or identity behavior. References: `https://www.mql5.com/en/docs/standardlibrary/tradeclasses/ctrade/ctradepositionmodify` and `https://www.mql5.com/en/docs/constants/errorswarnings/enum_trade_return_codes`.
P537: 
P538: A modify is CONFIRMED only if the method returns true, `ResultRetcode()==TRADE_RETCODE_DONE (10009)`, the same PID/ticket remains selected, normalized TP readback equals the target revision, and normalized SL readback equals the pre-call SL. `NO_CHANGES (10025)` or an already-equal TP is `SKIP`, consumes no call, and is not counted as a modify. Retcode proposal, to be encoded as a closed table: retryable `REQUOTE (10004)`, `PRICE_CHANGED (10020)`, `TIMEOUT (10012)`, `CONNECTION (10031)`, `TOO_MANY_REQUESTS (10024)`, `MARKET_CLOSED (10018)`; immediate terminal FAIL `INVALID (10013)`, `ERROR (10011)`, `INVALID_PRICE (10015)`, `INVALID_STOPS (10016)`, `TRADE_DISABLED (10017)`, `LOCKED (10028)`, `FROZEN (10029)`. `POSITION_CLOSED (10036)` routes to broker-exit resolution. Every other retcode consumes one of the three calls and cannot retry past the cap. These are proposed classifications, not claimed facts about broker behavior; the build packet must preserve the raw code and re-verify each symbolic code against the current MQL5 table.
P539: 
P540: Before sending a modify, compare the current executable side against the normalized target: Bid for LONG TP and Ask for SHORT TP. If price has already passed the proposed target, do not submit a stale stop level; emit terminal `UJTPMODIFY_FAIL reason=TARGET_PASSED`, keep broker SL/TP authoritative, mark acceptance failed, and retain the live instance until broker exit. This avoids spending retries on a target that can no longer meet exact-price acceptance.
P541: 
P542: **TP_TOUCH never substitutes for the broker deal.** In MODE_EXECUTE, if the revised model target is touched while sync is PENDING, terminal FAIL, or CONFIRMED, do not set the managed instance to broker-closed and do not emit ordinary `MTEXIT`, `MTLIFE`, or `ALERT EXIT TP_TOUCH` as if execution occurred. Emit `UJTPTOUCH_UNSYNCED` (when not yet confirmed) or `UJTPTOUCH_MODEL_ONLY` (when confirmed) with PID, ticket, state, target, attempts, and live broker TP; retain the instance in `EXIT_PENDING_BROKER`, keep the retry host alive, and leave broker SL/TP in control. No market close. Emit distinct operator alert `EXIT-UNSYNCED` only once per instance/target revision; it identifies the live broker TP and cannot say the revised target filled. In MODE_ALERT_ONLY, keep the existing paper-model touch exit and clearly mark the row/alert `mode=ALERT_ONLY`; no broker fill is implied. A no-position/pending-fill row consumes no attempt.
P543: 
P544: Resolve actual close by polling each outstanding PID in the M5 host. If the PID is gone, select its position history (`HistorySelectByPosition`) and scan deals for that PID, entry direction, closing `DEAL_ENTRY_OUT`, `DEAL_REASON_TP` or SL, deal ticket, timestamp, price, and volume. Emit `UJTPBROKEREXIT` only when the actual closing deal is identified; otherwise retain `EXIT_PENDING_BROKER`, emit `UJORPHAN`/`UJTPEXIT_PENDING`, and do not silently retire the instance. The official deal properties define `DEAL_POSITION_ID`, `DEAL_ENTRY`, `DEAL_REASON`, `DEAL_PRICE`, and `DEAL_VOLUME`; partial closes do not satisfy full-position acceptance. Reference: `https://www.mql5.com/en/docs/constants/tradingconstants/dealproperties` and `https://www.mql5.com/en/docs/trading/historyselectbyposition`.
P545: 
P546: Every retarget/modify/skip/fail/touch/exit row is unconditional and carries: pair, session, trade sequence, admission bar, PID, current ticket, target revision, original TP, revised target, attempt/cap, sync/model state, raw method Boolean, raw retcode, readback TP and SL, pre-call SL, live volume, and reason. `UJRETARGET` must not be debug-only for acceptance. Modify-call counters exclude skip and no-position events. Synchronized rows should not repeat every bar.
P547: 
P548: O6 is applied before candidate seed at EA 8072 and rechecked before any `LogSignal`, `A6Fired`, or `EmitAlert(SIGNAL)` side effect (currently EA 10618-10625). Both gates use the local `sess` to map the correct magic, inspect all open positions for this symbol/session, include older positions, and emit a named `UJPOSITION_BLOCKED`/`ABORT_CONCURRENCY` row. A blocked candidate emits no SIGNAL or A6Fired row and does not call `MarkSessionUsed`; London does not block NY. The second gate must run before EA 10618, not just before the alert at 10625. In alert-only mode the broker-position gate is inert, but the instance manager still prevents record replacement and maintains one-take-per-session accounting.
P549: 
P550: **Q1 Ask A:** Is this complete and internally consistent as a design for (1) multi-instance management, (2) execute-only broker modification, (3) exact per-revision retry and retcode behavior, (4) model-touch/open-broker lifecycle, (5) broker exit proof, and (6) both pre-seed/pre-signal O6 gates? Name any remaining source site or state-transition defect. Verify the official method and retcode references cited here; do not treat a Boolean success alone as execution.
P551: 
P552: **Q1 Ask B:** Is future acceptance exact and sufficient for both June 5 instances independently? Require unconditional instance-labeled rows; a successful modify and exact normalized TP/SL readback; unchanged SL; and a full closing broker TP deal for the same PID at the revised target exactly, with no gap/slippage leniency. A deal at the old target, SL, or any other price fails. The model touch bar need not equal the broker-deal bar. Skip events are excluded from call counts. Also require a classified diff of every admission, signal, abort, and deal after June 5 19:15 against baseline, since earlier NY broker exit can change June 8-11 behavior. Preserve the separate exact observations 160.115 model entry and 160.120 Ask/deal; the operator-set 160.524 cannot be relabeled as Ask or relaxed. One-tick stop execution 159.725 vs 159.726 is not TP tolerance.
P553: 
P554: ### 9.3 Q3 proposed design: preserve holder order, then run the fresh candidate pipeline once
P555: 
P556: The strategy record `.opencode/skills/srj-strategy/SKILL.md` section 117 already settles the tie: a flip-killed holder never vetoes a challenger; the same-bar flip-plus-confirm tie is unexercised and keeps current order. The 5m kill is pre-confirmation only (section 116). The June 11 baseline has `UJDEFERABORT`, `SUPPRESSED action=HELD`, RETESTBOOK hits=2, and a SHORT-only shadow CONFIRMPOLL with `confirm=0`; it has no `UJSBTELEM` row and proves neither a LONG confirm nor a June 11 outcome.
P557: 
P558: **Do not consume the abort before the holder current-order evaluation.** Split the per-bar flow into an incumbent phase and an outer resolver. The incumbent phase preserves the current evaluation, including contender confirmation/yield and all existing early-return behavior, and returns its outcome to the resolver instead of returning from the whole per-bar function. The resolver always handles a matching pending `uj_saAbort` after the incumbent phase, including when an internal early-return path ran. The measured range EA 7457-8069 contains four returns (7578, 7580, 7601, 7621); the implementation packet must census every return in the full extracted phase and prove none can bypass resolution. The RECON78 June 11 baseline reaches the old `UJDEFERAPPLY` row at the existing EA 8462-8476 site, proving that the four earlier returns did not fire on the target pass. Keep holder evaluation and its current same-bar tie order first. If the abort still matches the holder identity, print `UJDEFERCONSUME` with old holder identity, call `GoAbort(ABORT_LTF_MISALIGN)` unless that exact holder was already reset by its existing terminal path, clear `uj_saAbort`, `uj_saA/D/T`, and invalidate stale `uj_memo_*`; preserve the diagnostic shadow/STAND-DOWN. Then invoke the extracted candidate pipeline once on the same `barShift`, `barTime`, and local `sess`: it owns the normal seed-and-candidate path from EA 8070-8429, its candidate-specific contender evaluation at EA 8430-8461, and candidate continuation from EA 8478 through the signal/admission boundary at EA 10625. It excludes only the outer incumbent deferred-abort resolver at EA 8462-8476, which the wrapper already handled. The normal IDLE path calls this same extracted unit, including its contender evaluation once. It uses normal `DetectPoiRetest`, confirmation, session/seed/1R gates, O6 checks, and signal/admission rules. It carries no S4 state, zone, latch, confirmation, or entry plan. After this one candidate-pipeline call, the outer resolver returns; it does not fall through and evaluate the fresh candidate again in the old outer tail. This is not recursive `EvaluatePerBar` and does not repeat bar-wide prepass work or incumbent evaluation.
P559: 
P560: If the incumbent's existing contender evaluation yields to a confirmed opposite candidate before deferred-abort application, retain the existing `SIDE1C_YIELD` result and do not also consume/reseed. The pending abort no longer matches the rebound holder; emit exactly one `UJDEFERDROP reason=HOLDER_YIELDED` and clear it. This is the current-order same-bar tie behavior. If that evaluation does not yield, the matching flip-killed holder is aborted and the freed slot may run a fresh challenger pipeline on the same evaluated bar. A matching abort cannot survive into the fresh seed; a nonmatching stale abort follows the explicitly logged drop path. The release runs before O6's same-session broker-position gate; an existing open same-session position blocks the seed after the holder kill, which is the correct combined outcome.
P561: 
P562: The incumbent candidate flow and fresh challenger flow are each evaluated once for their own identity. The prepass suppression census and read-only shadow poll run once; when a matching abort is pending, `SUPPRESSED` must not print a false `action=HELD` for the challenger that is about to receive the free slot. Candidate counters (`r2_evals`, S1F/S1G/S1C counters and any other static/bar counts) are scoped by `(barTime, phase, candidate identity)` so the incumbent and challenger are each counted once without duplicating a bar-wide total. The consume path returns after the fresh candidate pipeline, so the old outer S3/S4 and signal tail cannot evaluate it again. Preserve normal POC-over-VWAP ranking and no reseed provenance/exemption. The implementation packet must provide an exhaustive `g_mtrade` read/write migration map and counter census; no legacy singleton reference may be silently left behind.
P563: 
P564: This design is conditional on the 14:35 LONG actually passing normal confirmation. The source must show the full `IsConfirmationCandle` implementation and the normal seed path. The 14:35 SHORT holder shadow `confirm=0` is not evidence for the LONG's normal result. Add the missing June 11 `UJSBTELEM` and normal-path confirm diagnostics to future acceptance; if the seed confirmation evaluates false, the expected outcome is no 14:40 signal and the confirmation cause is a separate defect, not something the release hook can waive.
P565: 
P566: **Q3 Ask A:** Does the staged state map preserve (1) current holder evaluation and SIDE1C_YIELD precedence, (2) pre-confirmation 5m flip kill, (3) holder reset and fresh normal seed, (4) same-pass once-only counters and no duplicate stage evaluation, (5) shadow/STAND-DOWN, (6) O6 ordering/local session scope, and (7) POC-over-VWAP ranking? Identify any missing clear/write/return or a safer concrete map. Check against the full source excerpts in section 10.
P567: 
P568: **Q3 Ask B:** Is this future-only acceptance gradeable? (i) Q1's same-session NY position has actual broker-close at exact 160.298 before June 11, otherwise O6 correctly blocks; (ii) source/journal prove 14:35 LONG Daily-POC retest and normal confirmation pass, with `UJSBTELEM` and normal confirm evidence; (iii) one registered LONG SIGNAL and actual deal at exactly operator-set 14:40 open 160.524, no spread tolerance and no relabeling to Ask; EA reads Ask for LONG, so if actual Ask/deal differs from 160.524 this predicate fails; (iv) no 14:45+ selection; (v) June 8 invalid SHORT remains silent for the 5m-flip reason, distinct from its baseline `S2SEEDBIAS_KILL`; (vi) 6/9 09:50 Weekly-VWAP remains refused without a reseed exemption; (vii) June 5 London 09:45 remains correct; (viii) exactly one accepted June 11 NY take for this registered pair/session/date/anchor/direction instance; (ix) the abort-consume path emits one `UJDEFERABORT`, one `UJDEFERCONSUME`, and one STAND-DOWN, with no `UJDEFERAPPLY` or false `SUPPRESSED action=HELD`; the SIDE1C_YIELD path instead records its yield and exactly one `UJDEFERDROP`, with no consume; (x) scoped counts of `UJDEFERAPPLY`, `UJDEFERDROP`, `SIDE1C_YIELD`, and `UJDEFERCONSUME` reconcile to the chosen branch; (xi) classified same-bar counter census proves no duplicate work. These are future-run predicates only. The prior run authorization is consumed.
P569: 
P570: ### 9.4 V395 finding crosswalk and reply form
P571: 
P572: The following V395 findings are dispositions for this page, not claims that code has been changed:
P573: 
P574: - Sonnet Q1 items 1-3 and GLM C1-C4: ADOPTED by position-instance collection, per-instance lifecycle, revision-scoped attempts, and pre-side-effect gates.
P575: - Sonnet Q1 item 4 and GLM C6/C11/C12/S1: ADOPTED by pending-broker-exit state, distinct touch rows/alert, continued retry, and PID-matched closing-deal resolution; full TP-touch and exit source is appended.
P576: - Sonnet Q1 items 5-7 and GLM C5/C8-C10/S2: ADOPTED by named retcode table, normalized TP/SL readback, 0-SL preservation, idempotent skip, three-call cap, and MQL docs citations. Anything beyond the closed retcode table consumes the finite cap.
P577: - Sonnet Q1 item 8 and GLM Ask B: ADOPTED by unconditional full-identity rows, exact deal acceptance, same-session later-event diff, and explicit treatment of the Ask/open conflict and stop execution.
P578: - GLM C7 plus Sonnet gate-side-effect finding: ADOPTED by using local session magic at both gates and placing pre-signal check before `LogSignal`/`A6Fired`; blocked candidates do not consume the session.
P579: - Sonnet Q3 item 1 and GLM D1/D7: ADOPTED by holding the existing current-order contender evaluation before abort consumption; section 117 already rules the flip/confirm tie, so no operator question is opened.
P580: - Sonnet Q3 items 2-4 and GLM D2-D6/D8-D9: ADOPTED by same-bar candidate pipeline extraction, full source spans, missing telemetry callout, explicit stale-state clearing, shadow preservation, once-only counters, and a named consume row.
P581: - Sonnet Q3 item 5 and GLM O6 comments: ADOPTED by local-session gate mapping and release-before-gate ordering.
P582: - Sonnet Q3 item 6 and GLM Q3 Ask B: ADOPTED by binding exact 160.524, naming the Ask mismatch as a fail condition, preserving no-tolerance, and requiring instance-scoped future evidence.
P583: - GLM D10: ADOPTED by keeping one-take accounting session/day scoped; no global run-wide count is used.
P584: 
P585: Seat answer form: quote one verdict per Q1 and Q3 (`CONFIRM`, `OBJECT`, or `DISCREPANCY`); answer A and B separately; give exact physical P-line citations; list each remaining defect/condition with its disposition; state whether Q2 remains closed; close each question. Do not infer that any proposed helper, instance collection, hook, telemetry row, broker exit, or June 11 outcome already exists. No build/run/source/key/live/commit/push authority is requested or granted.
P586: 
P587: ### 9.5 Official source references
P588: 
P589: - MQL5 `CTrade::PositionModify`: `https://www.mql5.com/en/docs/standardlibrary/tradeclasses/ctrade/ctradepositionmodify`
P590: - MQL5 trade-server return codes: `https://www.mql5.com/en/docs/constants/errorswarnings/enum_trade_return_codes`
P591: - MQL5 deal properties: `https://www.mql5.com/en/docs/constants/tradingconstants/dealproperties`
P592: - MQL5 `HistorySelectByPosition`: `https://www.mql5.com/en/docs/trading/historyselectbyposition`
P593: 
P594: ## 10 - Additional exact source exhibits for V8
P595: 
P596: Current source identity remains the EA digest stated in section 6. The excerpts below are mechanically numbered from the current saved EA. Non-ASCII or ellipsis-bearing comment-only lines are omitted and listed after their affected excerpt; every executable line in each named continuous range is present. No omitted source line is used to support behavior.
P597: 
P598: ### Q1 reset body - source lines 349-378
P599: 
P600: ```mql5
P601: 349: void MtReset()
P602: 350:   {
P603: 351:    g_mtrade.active            = false;
P604: 352:    g_mtrade.state             = MT_INACTIVE;
P605: 353:    g_mtrade.dir               = DIR_NONE;
P606: 354:    g_mtrade.anchorLine        = -1;
P607: 355:    g_mtrade.anchorPrice0      = 0.0;
P608: 356:    g_mtrade.anchorBarTime     = 0;
P609: 357:    g_mtrade.sessionAtEntry    = -1;
P610: 358:    g_mtrade.entryPrice        = 0.0;
P611: 359:    g_mtrade.slRef             = 0.0;
P612: 360:    g_mtrade.tpRef             = 0.0;
P613: 361:    g_mtrade.regimeAtAdmission = 0;
P614: 362:    g_mtrade.fillBarTime       = 0;
P615: 363:    g_mtrade.signalBarTime     = 0;
P616: 364:    g_mtrade.exitReason        = MT_EXIT_NONE;
P617: 365:    g_mtrade.exitBarTime       = 0;
P618: 366:    g_mtrade.exitPrice         = 0.0;
P619: 367:    g_mtrade.ticket            = 0;
P620: 368:    g_mtrade.entryPid          = 0;
P621: 369:    //--- [P-UJIMPL-IMPL-1 v8 IE8] touch/admit reset rides the reset path;
P622: 370:    //--- the 10215 site repeats these assignments explicitly (memo untouched,
P623: 371:    //--- global uj_tradeSeqNext never reset).
P624: 372:    g_mtrade.uj_touchDone      = false;
P625: 373:    g_mtrade.uj_touchLevel     = 0.0;
P626: 374:    g_mtrade.uj_touchType      = "";
P627: 375:    g_mtrade.uj_touchBarTime   = 0;
P628: 376:    g_mtrade.uj_admitBarTime   = 0;
P629: 377:    g_mtrade.uj_tradeSeq       = 0;
P630: 378:   }
P631: ```
P632: 
P633: ### Q1 managed-record replacement - source lines 10641-10656
P634: 
P635: ```mql5
P636: 10641:       //--- DECLARED BOUNDARY: one managed record (the R-201 precedent). A second
P637: 10642:       //--- signal while one trade is managing logs MTCOLLISION and REPLACES the
P638: 10643:       //--- record (spec section 6's blessed London+NY exception would need a
P639: 10644:       //--- registry - a separate packet item if it ever fires).
P640: 10645:       if(g_mtrade.active && g_mtrade.state == MT_MANAGING)
P641: 10646:         {
P642: 10647:          if(InpDebugLog)
P643: 10648:             PrintFormat("[SRJ-EA] MTCOLLISION old bar=%s reason=REPLACED by bar=%s",
P644: 10649:                         TimeToString(g_mtrade.fillBarTime, TIME_DATE|TIME_MINUTES),
P645: 10650:                         TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift),
P646: 10651:                                      TIME_DATE|TIME_MINUTES));
P647: 10652:          g_mtrade.state      = MT_CLOSED;
P648: 10653:          g_mtrade.exitReason = MT_EXIT_REPLACED;
P649: 10654:          g_mtrade.exitBarTime = iTime(_Symbol, PERIOD_CURRENT, barShift);
P650: 10655:         }
P651: 10656:       MtReset();
P652: ```
P653: 
P654: ### Q1 pre-signal effects and alert - source lines 10608-10634
P655: 
P656: ```mql5
P657: 10608:             {
P658: 10609:              g_slext_lostN++;
P659: 10610:              g_slext_lostRows += TimeToString(ordFireT, TIME_DATE|TIME_MINUTES) + ";";
P660: 10611:              string psLine = StringFormat("[SRJ-EA] SLEXTLOST fields=6 bar=%s dir=%s ext1R=%.2f ext1RewardPts=%.5f ext1RiskPts=%.5f threshold=%.2f",
P661: 10612:                        TimeToString(ordFireT, TIME_DATE|TIME_MINUTES), DirName(g_dir),
P662: 10613:                        psR, g_slext_rewardPts, g_slext_riskPts, InpMinRewardRisk);
P663: 10614:              LwAudit("SLEXTLOST", psLine);
P664: 10615:              Print(psLine);
P665: 10616:             }
P666: 10617:          }
P667: 10618:         LogSignal(tpTarget, tpR, slRef, slMode, divKind);
P668: 10619:         if(InpDebugLog) A6Fired(barShift, tpTarget, tpR, slRef, slMode, divKind);   //--- [A6-HOOK] (ii)
P669: 10620:         if(InpDebugLog) PrintFormat("[SRJ-EA] SIDE1F_WATCH bar=%s dir=%s", TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES), DirName(g_dir));   //--- [SIDE1F] (iii) fire watch (read-only)
P670: 10621: 
P671: 10622:       if(!g_alertedSignal)
P672: 10623:         {
P673: 10624:          g_alertedSignal = true;
P674: 10625:          EmitAlert("SIGNAL",
P675: 10626:                    StringFormat("R=%.2f SL %s TP %s spr=%d",
P676: 10627:                                 tpR,
P677: 10628:                                 DoubleToString(slRef,    _Digits),
P678: 10629:                                 DoubleToString(tpTarget, _Digits),
P679: 10630:                                 (int)SymbolInfoInteger(_Symbol, SYMBOL_SPREAD)),
P680: 10631:                    true);
P681: 10632:         }
P682: 10633: 
P683: 10634:       //--- [P-EXITMODEL 2026-09-09, operator-issued packet] The section 5 exit phase
P684: ```
P685: 
P686: ### Q1 current TP resolver - source lines 11771-11785
P687: 
P688: ```mql5
P689: 11771:      {
P690: 11772:       ulong mtp_t = PositionGetTicket(mtp_i);
P691: 11773:       if(mtp_t == 0 || !PositionSelectByTicket(mtp_t)) continue;
P692: 11774:       if(PositionGetString(POSITION_SYMBOL) != _Symbol) continue;
P693: 11775:       if(PositionGetInteger(POSITION_IDENTIFIER) != pid) continue;
P694: 11776:       return mtp_t;
P695: 11777:      }
P696: 11778:    return 0;
P697: 11779:   }
P698: 11780: 
P699: 11781: 
P700: 11782: 
P701: 11783: //================= [P-EXITEXEC-1] broker close for the paper-only exit legs ========
P702: 11784: //--- Q2 (his COMBINE word): BREAK and DAY_CLOSE verdicts flipped paper state only
P703: 11785: //--- (ALERT-ONLY preserved, never an order), so the broker position lived on
P704: ```
P705: 
P706: ### Q1 current managed-trade host - source lines 11843-11850
P707: 
P708: ```mql5
P709: 11843: void EvaluateManagedTrade(const int barShift)
P710: 11844:   {
P711: 11845:    if(!g_mtrade.active) return;
P712: 11846:    if(g_mtrade.state != MT_MANAGING && g_mtrade.state != MT_PENDING_FILL) return;
P713: 11847: 
P714: 11848:    datetime barTime = iTime(_Symbol, PERIOD_CURRENT, barShift);
P715: 11849:    if(barTime < g_mtrade.fillBarTime) return;   // bars predating the fill are not ours
P716: 11850: 
P717: ```
P718: 
P719: ### Q1 retarget and TP touch - source lines 11913-11938
P720: 
P721: ```mql5
P722: 11913:     if(g_mtrade.tpRef != EMPTY_VALUE && g_mtrade.tpRef > 0.0)
P723: 11914:       {
P724: 11915:        double uj_rtPx = 0.0;
P725: 11916:        if(UjClosedSessionTarget(g_mtrade, barShift, uj_rtPx) && uj_rtPx > 0.0
P726: 11917:           && ((g_mtrade.dir == DIR_LONG && NormalizeDouble(uj_rtPx, _Digits) < NormalizeDouble(g_mtrade.tpRef, _Digits)) || (g_mtrade.dir == DIR_SHORT && NormalizeDouble(uj_rtPx, _Digits) > NormalizeDouble(g_mtrade.tpRef, _Digits))))
P727: 11918:          {
P728: 11919:           double uj_oldRef = g_mtrade.tpRef;
P729: 11920:           g_mtrade.tpRef = uj_rtPx;
P730: 11921:           if(InpDebugLog) PrintFormat("[SRJ-EA] UJRETARGET bar=%s dir=%s old=%s sess=%d tp=%s seq=%I64d admit=%s - session-close retarget (Fix R)", TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES), DirName(g_mtrade.dir), DoubleToString(uj_oldRef, _Digits), g_mtrade.sessionAtEntry, DoubleToString(g_mtrade.tpRef, _Digits), (long)g_mtrade.uj_tradeSeq, TimeToString(g_mtrade.uj_admitBarTime, TIME_DATE|TIME_MINUTES));
P731: 11922:          }
P732: 11923:        else if(InpDebugLog && uj_rtPx > 0.0) PrintFormat("[SRJ-EA] UJNORETARGET bar=%s dir=%s tp=%s rt=%s why=%s sess=%d seq=%I64d admit=%s - helper true but not tighter (Fix R)", TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES), DirName(g_mtrade.dir), DoubleToString(g_mtrade.tpRef, _Digits), DoubleToString(uj_rtPx, _Digits), (NormalizeDouble(uj_rtPx, _Digits) == NormalizeDouble(g_mtrade.tpRef, _Digits) ? "eq" : "loose"), g_mtrade.sessionAtEntry, (long)g_mtrade.uj_tradeSeq, TimeToString(g_mtrade.uj_admitBarTime, TIME_DATE|TIME_MINUTES)); // helper-true discriminator
P733: 11924:       }
P734: 11925:     bool tpBookedTouch = false;
P735: 11926:     if(g_mtrade.tpRef != EMPTY_VALUE && g_mtrade.tpRef > 0.0)
P736: 11927:       {
P737: 11928:        if(g_mtrade.dir == DIR_LONG  && h >= g_mtrade.tpRef) tpBookedTouch = true;
P738: 11929:        if(g_mtrade.dir == DIR_SHORT && l <= g_mtrade.tpRef) tpBookedTouch = true;
P739: 11930:       }
P740: 11931:     bool tpRecomputeTouch = false;
P741: 11932:     if(haveTp)
P742: 11933:       {
P743: 11934:        if(g_mtrade.dir == DIR_LONG  && h >= curTp) tpRecomputeTouch = true;
P744: 11935:        if(g_mtrade.dir == DIR_SHORT && l <= curTp) tpRecomputeTouch = true;
P745: 11936:       }
P746: 11937:     if(tpRecomputeTouch && !tpBookedTouch) g_n1_tpRecomputeSupp++;
P747: 11938:     if(tpBookedTouch) vTP = true;
P748: ```
P749: 
P750: ### Q1 model-close and alert - source lines 12034-12069
P751: 
P752: ```mql5
P753: 12034: if(!(vSL || vTP || vBREAK || vHTF || vDAY)) return;
P754: 12035: 
P755: 12036:    //--- close the trade (the priority order stated in the header)
P756: 12037:    g_mtrade.state       = MT_CLOSED;
P757: 12038:    g_mtrade.exitBarTime = barTime;
P758: 12039:    if(vSL)         { g_mtrade.exitReason = MT_EXIT_SL;             g_mtrade.exitPrice = g_mtrade.slRef; }
P759: 12040:     else if(vTP)    { g_mtrade.exitReason = MT_EXIT_TP_TOUCH;       g_mtrade.exitPrice = g_mtrade.tpRef; }
P760: 12041:    else if(vBREAK) { g_mtrade.exitReason = MT_EXIT_POI_BODY_BREAK; g_mtrade.exitPrice = nextOpenPx; }
P761: 12042:    else if(vHTF)   { g_mtrade.exitReason = MT_EXIT_HTF_FLIP;       g_mtrade.exitPrice = nextOpenPx; }
P762: 12043:    else if(vDAY)   { g_mtrade.exitReason = MT_EXIT_DAY_CLOSE;  g_mtrade.exitPrice = nextOpenPx; }
P763: 12044: 
P764: 12045:     PrintFormat("[SRJ-EA] MTEXIT bar=%s reason=%s line=%s lineVal=%s entry=%s exit=%s",
P765: 12046:                 TimeToString(barTime, TIME_DATE|TIME_MINUTES),
P766: 12047:                 MtExitName(g_mtrade.exitReason),
P767: 12048:                 (vBREAK ? breakLineName : "-"),
P768: 12049:                 (vBREAK ? DoubleToString(breakLineVal, _Digits) : "-"),
P769: 12050:                 DoubleToString(g_mtrade.entryPrice, _Digits),
P770: 12051:                 DoubleToString(g_mtrade.exitPrice, _Digits));
P771: 12052:     //--- [P-EXITEXEC-1 E7] execution legs: SL/TP broker-owned, HTF stays off,
P772: 12053:     //--- CANCEL_BIAS returned above - only the WINNING BREAK/DAY_CLOSE verdict closes.
P773: 12054:     //--- Price reference = g_mtrade.exitPrice (= nextOpenPx on the gated legs per EA 11290/11292); paper MTEXIT/MTLIFE/EXIT rows print regardless.
P774: 12055:     if(g_mtrade.exitReason == MT_EXIT_POI_BODY_BREAK || g_mtrade.exitReason == MT_EXIT_DAY_CLOSE)
P775: 12056:       {
P776: 12057:        int mtexecRc = MtCloseBrokerPosition(MtExitName(g_mtrade.exitReason), g_mtrade.exitPrice, barTime);
P777: 12058:        if(mtexecRc == 0)
P778: 12059:           PrintFormat("[SRJ-EA] MTCLOSE_FAIL bar=%s reason=%s entryTicket=%I64u entryPid=%I64d", TimeToString(barTime, TIME_DATE|TIME_MINUTES), MtExitName(g_mtrade.exitReason), g_mtrade.ticket, g_mtrade.entryPid);
P779: 12060:       }
P780: 12061:     if(InpDebugLog) MtLifeEmit();
P781: 12062:    EmitAlert("EXIT",
P782: 12063:              StringFormat("%s%s at %s (entry %s)",
P783: 12064:                           MtExitName(g_mtrade.exitReason),
P784: 12065:                           (vBREAK ? " [" + breakLineName + "]" : ""),
P785: 12066:                           DoubleToString(g_mtrade.exitPrice, _Digits),
P786: 12067:                           DoubleToString(g_mtrade.entryPrice, _Digits)),
P787: 12068:              true);
P788: 12069:   }
P789: ```
P790: 
P791: ### Q3 deferred abort set - source lines 7445-7457
P792: 
P793: ```mql5
P794: 7445:           double uj_hm15 = 0.0;
P795: 7446:           bool uj_hm15r = ReadFlow(FL_BUF_HTF_LOW, uj_hm15, barShift);
P796: 7447:           double uj_hwant = (g_dir == DIR_LONG ? 1.0 : -1.0);
P797: 7448:           string uj_hterm = "";
P798: 7449:           bool uj_hcarve = IsConfirmationCandle(barShift, g_anchorLine, g_dir, uj_hterm);
P799: 7450:           if((uj_hm15r && uj_hm15 == uj_hwant) || uj_hcarve)
P800: 7451:             { if(InpDebugLog) PrintFormat("[SRJ-EA] UJLTFHOLD bar=%s dir=%s poi=%s state=%s m15=%s rf=%d mode=%s term=%s - LTF opposed, hold (Fix F11)", TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES), DirName(g_dir), AnchorStr(), StateName(g_state), DoubleToString(uj_hm15, 1), (uj_hm15r ? 1 : 0), ((uj_hm15r && uj_hm15 == uj_hwant) ? "M15" : "CARVE"), uj_hterm); }
P801: 7452:           else
P802: 7453:             {
P803: 7454:              uj_saAbort = true; uj_saA = g_anchorLine; uj_saD = (int)g_dir; uj_saT = g_anchorBarTime;
P804: 7455:              if(InpDebugLog) PrintFormat("[SRJ-EA] UJDEFERABORT bar=%s dir=%s poi=%s state=%s - LTF opposed, abort deferred past evaluation (Fix S-a)", TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES), DirName(g_dir), AnchorStr(), StateName(g_state));
P805: 7456:             }
P806: 7457:          }
P807: ```
P808: 
P809: ### Q3 incumbent region before seed locals - source lines 7457-8069
P810: 
P811: ```mql5
P812: 7457:          }
P813: 7458:      }
P814: 7459: 
P815: 7460:    //--- [Task 135 / A-3 section 5.1 / v4.2 section 3.4 errata] The
P816: 7461:    //--- candidate-specific structural invalidation window OPENS AT BUNDLE
P817: 7462:    //--- BINDING, not at candidate creation. Under today's architecture the
P818: 7463:    //--- S3->S4 arming transition IS the binding point: g_zoneHi and g_zoneLo are
P819: 7464:    //--- assigned there and nothing before it identifies a structure at all. A
P820: 7465:    //--- candidate that has not yet adopted a zone has no candidate-specific
P821: 7466:    //--- structure for these three flags to describe, so a 2-of-3 verdict against
P822: 7467:    //--- it is not attributable to anything the candidate is built on.
P823: 7468:    //---
P824: 7469:    //--- R-Q2 keeps the flags legitimately GLOBAL - they are the panel's
P825: 7470:    //--- current-structure flags and no per-candidate copy is wanted. Section 5.1
P826: 7471:    //--- fixes only WHEN they may kill a candidate.
P827: 7472:    //---
P828: 7473:    //--- Measured, Tier 1, Task 134: of 25 aborts, 11 are freshness deaths and
P829: 7474:    //--- SIX fired before the candidate had armed - FRESH_OPP_FVG at
P830: 7475:    //--- S2_LTF_ALIGN 08.14 11:35, FRESH_OPP_FVG at S3_ZONE_WAIT 08.18 10:20 and
P831: 7476:    //--- 08.18 11:50, FRESH_OB_DEAD at S2_LTF_ALIGN 08.18 16:25 and 08.18 18:05,
P832: 7477:    //--- FRESH_OB_DEAD at S3_ZONE_WAIT 08.21 09:35. Corroborated at Tier 3 scale
P833: 7478:    //--- by FRESHCOUNT #1050, which fires 08.03 09:25 with state=S2_LTF_ALIGN
P834: 7479:    //--- adverse=2 verdict=ABORT against a candidate that had bound nothing.
P835: 7480:    //---
P836: 7481:    //--- STRICTLY RETENTION. This edit can only let a candidate live longer. It
P837: 7482:    //--- can never kill one, and it can never admit a signal the freshness rule
P838: 7483:    //--- would have blocked at S4 or S5, because the poll still runs there
P839: 7484:    //--- unchanged. Same character as Stage 3a's S1WAIT / S2WAIT retention, and
P840: 7485:    //--- deliberately the opposite character to Task 79's strictly-removal LTF
P841: 7486:    //--- invariant, so the two journals read against each other cleanly.
P842: 7487:    //---
P843: 7488:    //--- SCENARIO B IS PRESERVED. The operator's 08/03 setup-1 rejection fires at
P844: 7489:    //--- state=S5_GATE_CHECK, inside the retained range, on the same fvgDead plus
P845: 7490:    //--- oppFvg pair. This edit does not touch it.
P846: 7491:    //---
P847: 7492:    //--- ACCEPTED CONSEQUENCE 1, and the reason Task 134 ran first: a candidate
P848: 7493:    //--- freed here does not necessarily survive. It carries whatever other
P849: 7494:    //--- pending deaths it already had, and removing the one that fires first
P850: 7495:    //--- reveals the next (section 16.3). Expect the abort MIX to shift toward
P851: 7496:    //--- SESSION_CLOSED, NO_TP_TARGET and LTF_MISALIGN rather than the abort
P852: 7497:    //--- COUNT to fall.
P853: 7498:    //---
P854: 7499:    //--- ACCEPTED CONSEQUENCE 2, and the real risk: this is a RETENTION edit
P855: 7500:    //--- under a SINGLETON architecture. A candidate that lives longer holds the
P856: 7501:    //--- singleton longer and can suppress POI retests that previously seeded
P857: 7502:    //--- their own candidates. So the candidate COUNT may FALL and SUPPRESSED may
P858: 7503:    //--- RISE even though this edit cannot kill anything directly. Both are
P859: 7504:    //--- censused. A net loss by that route is an argument for section 5.6's
P860: 7505:    //--- concurrency work, not against this ruling.
P861: 7506:    //---
P862: 7507:    //--- ACCEPTED CONSEQUENCE 3, diagnostic: CheckFreshness is NOT called in the
P863: 7508:    //--- newly exempt range, because its side effects - the FRESHCOUNT print and
P864: 7509:    //--- its cum1/cum2/cum3 counters - are not on record as harmless and this
P865: 7510:    //--- task does not read its body. So FRESHCOUNT lines DISAPPEAR for pre-arm
P866: 7511:    //--- bars and the cum counters RENUMBER. Task 133's FRESHCOUNT numbering is
P867: 7512:    //--- therefore NOT comparable to this run's. The FRESHSKIP line below records
P868: 7513:    //--- every skipped bar and its state so attribution survives the loss.
P869: 7514:    //---
P870: 7515:    //--- Threshold-free: the change is a STATE comparison, ST_S2_LTF_ALIGN to
P871: 7516:    //--- ST_S4_ARMED. No distance, no size, no bar count, no tolerance. Part A
P872: 7517:    //--- section 7 is not engaged.
P873: 7518:    //---
P874: 7519:    //--- The upper bound ST_S5_GATE_CHECK is DELIBERATELY UNCHANGED. EA-104 stays
P875: 7520:    //--- withdrawn: setup completion, not the confirming close, ends the window,
P876: 7521:    //--- and divergence may still be pending at S5.
P877: 7522:    //---
P878: 
P879: ```
P880: 
P881: [Source comment line 7523 omitted because it contains non-ASCII; no executable code omitted.]
P882: 
P883: ```mql5
P884: 
P885: 7524:    //--- block. That one is NOT changed - it is Task 31's advisory poll and its
P886: 
P887: ```
P888: 
P889: [Source comment line 7525 omitted because it contains non-ASCII; no executable code omitted.]
P890: 
P891: ```mql5
P892: 
P893: 7526:    //---
P894: 7527:    //--- The FRESHSKIP print reports the anchor through AnchorStr(), which is the
P895: 7528:    //--- same accessor LogState and LogAbort already use for their poi= field.
P896: 7529:    //--- Revision A of this task: the first issue named a nonexistent identifier
P897: 7530:    //--- and the builder correctly halted on the Block C-bis census rather than
P898: 7531:    //--- substituting one. Planner defect nineteen, section 16.8.
P899: 7532:    //---
P900: 7533:    //--- Nothing is deleted. The superseded condition is retained verbatim on the
P901: 7534:    //--- annotated comment line directly beneath this one:
P902: 7535:    //---
P903: 7536:    //--- SUPERSEDED BY TASK 135, retained per P4:
P904: 7537:    //---   if(g_state >= ST_S2_LTF_ALIGN && g_state <= ST_S5_GATE_CHECK)
P905: 7538:    //---
P906: 7539:    if(InpDebugLog && g_state >= ST_S2_LTF_ALIGN && g_state < ST_S4_ARMED)
P907: 7540:       PrintFormat("[SRJ-EA] FRESHSKIP bar=%s dir=%s state=%s poi=%s reason=PRE_BINDING",
P908: 7541:                   TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES),
P909: 7542:                   DirName(g_dir),
P910: 7543:                   StateName(g_state),
P911: 7544:                   AnchorStr());
P912: 7545: 
P913: 7546:    if(g_state >= ST_S4_ARMED && g_state <= ST_S5_GATE_CHECK)
P914: 7547:      {
P915: 7548:       //--- [P-SCOPE34] the 2-of-3 kill is PRE-CONFIRMATION ONLY: at S4_ARMED the
P916: 7549:       //--- poll kills as built; at S5_GATE_CHECK (post-confirming-close) it is
P917: 7550:       //--- diagnostic-only (scope=post, verdict=HOLD) - the only cancellation
P918: 7551:       //--- there is the live bias flip (the three-flag conjunction is the same
P919: 7552:       //--- event per spec sections 3.4/5.5).
P920: 7553:       string fail = CheckFreshness(barShift, g_state != ST_S5_GATE_CHECK);
P921: 7554:       //--- [P-FRESH-S5OPP E1-K4] veto persistence, S4 ONLY, BEFORE any abort
P922: 7555:       //--- return (Luna/Astra v152: the clear sees the fresh read even when
P923: 
P924: ```
P925: 
P926: [Source comment line 7556 omitted because it contains non-ASCII; no executable code omitted.]
P927: 
P928: ```mql5
P929: 
P930: 7557:       //--- arm (Luna/Opus-D3 v153: a stale-0 fail-open is unfixable in this
P931: 7558:       //--- shape, so the arm is dropped, not narrowed). Audited by VETOCLEAR.
P932: 7559:       //--- [P-VNEXT-1 E4] S4 site mirrors the latch site: DAY-only clear (BOUND removed, same veto-persistence rule; supersedes the L7237 BOUND/DAY note).
P933: 7560:       if(g_state == ST_S4_ARMED && g_freshVetoBar != 0)
P934: 7561:         {
P935: 7562:          string vday = StringSubstr(TimeToString(g_freshVetoBar, TIME_DATE), 0, 10);
P936: 7563:          string cday = StringSubstr(TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE), 0, 10);
P937: 7564:          if(vday != cday)
P938: 7565:            {
P939: 7566:             if(InpDebugLog)
P940: 7567:                PrintFormat("[SRJ-EA] VETOCLEAR bar=%s dir=%s why=%s",
P941: 7568:                            TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES),
P942: 7569:                            DirName(g_dir), "DAY");
P943: 7570:             g_freshVetoBar = 0; g_freshVetoAnchor = -1; g_freshVetoDir = -1;
P944: 7571:            }
P945: 7572:         }
P946: 7573:       if(fail == ABORT_FRESH_OPP_FVG)
P947: 7574:         {
P948: 7575:          g_freshVetoBar = iTime(_Symbol, PERIOD_CURRENT, barShift);
P949: 7576:          g_freshVetoAnchor = g_anchorLine;
P950: 7577:          g_freshVetoDir = (int)g_dir;
P951: 7578:          GoAbort(fail, g_state); return;
P952: 7579:         }
P953: 7580:       if(fail != "") { GoAbort(fail, g_state); return; }
P954: 7581:      }
P955: 7582: 
P956: 7583:     //--- [P-SEL-1 E54] stage-reached marker at probe bars (read-only + line).
P957: 7584:     if(InpDebugLog)
P958: 7585:       {
P959: 7586:        string sl54_s2T = TimeToString(barTime, TIME_DATE|TIME_MINUTES);
P960: 7587:        if(SrjSelIsProbeBar(sl54_s2T))
P961: 7588:          { string sl54_s2L = StringFormat("[SRJ-EA] SEL54STAGE bar=%s stage=S2POLL dir=%s state=%s", sl54_s2T, DirName(g_dir), StateName(g_state)); LwAudit("SEL54STAGE", sl54_s2L); Print(sl54_s2L); }
P962: 7589:       }
P963: 7590:     double s1_stopRef = 0.0; bool s1_haveStop = false;
P964: 7591:    if(g_state >= ST_S2_LTF_ALIGN && g_state <= ST_S5_GATE_CHECK)
P965: 7592:      {
P966: 7593:       //--- [P-UJIMPL-IMPL-1 v8 IE6] entry reference = forming-bar open (would-be fill)
P967: 7594:       double currentPrice = iOpen(_Symbol, PERIOD_CURRENT, 0);
P968: 7595:       double tpTarget;
P969: 7596:       if(!ComputeNearestTpTarget(barShift, g_dir, currentPrice, tpTarget))
P970: 7597:         {
P971: 7598:          if(InpDebugLog)
P972: 7599:             PrintFormat("[SRJ-EA] %s S2POLL_NO_TP_TARGET",
P973: 7600:                         TimeToString(TimeCurrent(), TIME_DATE|TIME_SECONDS));
P974: 7601:          GoAbort(ABORT_NO_TP_TARGET, g_state); return;
P975: 7602:         }
P976: 7603:       double slRef = 0.0; ENUM_SRJ_SLMODE slMode = SL_MODE_NONE;
P977: 7604:       //--- [P-FIX-S2POLL E1 / operator Q1+Q3 2026-09-11] The stop pair is ATOMIC:
P978: 7605:       //--- both set on success, both absent on failure. The superseded form had the
P979: 7606:       //--- if governing ONE statement, so s1_haveStop=true was unconditional and the
P980: 7607:       //--- scope block below read slRef on the failure path. #property strict does
P981: 7608:       //--- not diagnose that shape. Fail-closed per Q3 ("SL should be present at all
P982: 7609:       //--- times"), following the sibling gate in this same block: ABORT_NO_TP_TARGET
P983: 7610:       //--- already kills across S2..S5 from here, and this is its stop-side twin.
P984: 7611:       //--- SUPERSEDED, retained per P4:
P985: 7612:       //---   if(ComputeSlReference(barShift, g_dir, slRef, slMode, "S2POLL"))
P986: 7613:       //---      s1_stopRef = slRef; s1_haveStop = true;
P987: 7614:       if(!SlRefMemo(barShift, barTime, g_dir, slRef, slMode, "S2POLL"))
P988: 7615:         {
P989: 7616:          if(InpDebugLog)
P990: 7617:             PrintFormat("[SRJ-EA] %s S2POLL_NO_SL_REF state=%s dir=%s",
P991: 7618:                         TimeToString(TimeCurrent(), TIME_DATE|TIME_SECONDS),
P992: 7619:                         StateName(g_state), DirName(g_dir));
P993: 7620:          GoAbort(ABORT_NO_SL_REF, g_state);
P994: 7621:          return;
P995: 7622:         }
P996: 7623:       s1_stopRef  = slRef;
P997: 7624:       s1_haveStop = true;
P998: 7625:       //--- [P-UJIMPL-IMPL-2 v10 Fix H1] poll verdict is telemetry + memo write
P999: 7626:       //--- (R-AT-OPEN: the admission verdict fires ONLY at the fire approach
P1000: 7627:       //--- on entry-open ref; a poll FAIL no longer aborts).
P1001: 7628:         {
P1002: 7629:          double uj_risk = 0.0, uj_reward = 0.0, uj_R = 0.0;
P1003: 7630:          string uj_bk7 = TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES);
P1004: 7631:          if(!SrjUjAssert1R(currentPrice, slRef, tpTarget, uj_bk7, "POLL", uj_risk, uj_reward, uj_R))
P1005: 7632:            { if(InpDebugLog) PrintFormat("[SRJ-EA] UJPOLLRISK bar=%s dir=%s R=%.2f - poll-ref verdict telemetry only, admission verdict at fire (Fix H1)", uj_bk7, DirName(g_dir), uj_R); }
P1006: 7633:          uj_memo_tp = tpTarget; uj_memo_sl = slRef; uj_memo_entry = currentPrice;
P1007: 7634:          uj_memo_valid = true;
P1008: 7635:          uj_memo_anchor = g_anchorLine; uj_memo_dir = (int)g_dir; uj_memo_barTime = barTime;
P1009: 7636:          uj_memo_risk = uj_risk; uj_memo_reward = uj_reward; uj_memo_R = uj_R;
P1010: 7637:          uj_memo_src = "POLL";
P1011: 7638:          uj_memo_wsrc = uj_winnerSource; uj_memo_wday = uj_winnerDayKey;
P1012: 7639:          uj_memo_wgen = uj_winnerPoolGen; uj_memo_wage = UjDayDiff(barTime, uj_winnerDayKey);
P1013: 7640:         }
P1014: 7641:         {
P1015: 7642:          double slDist = MathAbs(currentPrice - slRef);
P1016: 7643:          double tpDist = MathAbs(tpTarget - currentPrice);
P1017: 7644:          //--- TASK 23 (EA-23b / EA-23c / EA-20): shadow reward/risk measured from
P1018: 7645:          //--- the entry zone rather than from the closing price, printed for all
P1019: 7646:          //--- three candidate entry references so Ruling 7 can be answered from
P1020: 7647:          //--- data instead of from judgement. Nothing reads these values. No gate,
P1021: 7648:          //--- no abort, no branch, no assignment to any sequence variable.
P1022: 7649:          //--- Skipped before S4 because g_zoneHi/g_zoneLo are still 0.0 until the
P1023: 7650:          //--- S3 block sets them; that is expected, not a failure.
P1024: 7651:          if(InpDebugLog && g_zoneHi > 0.0 && g_zoneLo > 0.0)
P1025: 7652:            {
P1026: 7653:             double zNear = (g_dir == DIR_LONG) ? g_zoneHi : g_zoneLo;
P1027: 7654:             double zFar  = (g_dir == DIR_LONG) ? g_zoneLo : g_zoneHi;
P1028: 7655:             double zMid  = (g_zoneHi + g_zoneLo) * 0.5;
P1029: 7656:             string rs = "";
P1030: 7657:             for(int e = 0; e < 3; e++)
P1031: 7658:               {
P1032: 7659:                double ent = (e == 0) ? zNear : ((e == 1) ? zMid : zFar);
P1033: 7660:                double sd  = MathAbs(ent - slRef);
P1034: 7661:                double td  = MathAbs(tpTarget - ent);
P1035: 7662:                bool slSideOk = (g_dir == DIR_LONG) ? (slRef < ent) : (slRef > ent);
P1036: 7663:                bool tpSideOk = (g_dir == DIR_LONG) ? (tpTarget > ent) : (tpTarget < ent);
P1037: 7664:                rs += ((e == 0) ? "near" : ((e == 1) ? "mid" : "far"));
P1038: 7665:                rs += "=" + ((sd > 0.0) ? DoubleToString(td / sd, 2) : "inf");
P1039: 7666:                rs += "/sl" + IntegerToString((int)slSideOk);
P1040: 7667:                rs += "/tp" + IntegerToString((int)tpSideOk) + " ";
P1041: 7668:               }
P1042: 7669:             bool tpInGap = (g_dir == DIR_LONG)
P1043: 7670:                            ? (tpTarget > zNear && tpTarget < currentPrice)
P1044: 7671:                            : (tpTarget < zNear && tpTarget > currentPrice);
P1045: 7672:             PrintFormat("[SRJ-EA] ZONESHADOW bar=%s dir=%s close=%s zoneLo=%s zoneHi=%s "
P1046: 7673:                         "gapPts=%s slRef=%s tp=%s R_close=%s tpInGap=%d shadow= %s",
P1047: 7674:                         TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES),
P1048: 7675:                         DirName(g_dir),
P1049: 7676:                         DoubleToString(currentPrice, _Digits),
P1050: 7677:                         DoubleToString(g_zoneLo, _Digits),
P1051: 7678:                         DoubleToString(g_zoneHi, _Digits),
P1052: 7679:                         DoubleToString(MathAbs(currentPrice - zNear) / _Point, 0),
P1053: 7680:                         DoubleToString(slRef, _Digits),
P1054: 7681:                         DoubleToString(tpTarget, _Digits),
P1055: 7682:                         (slDist > 0.0) ? DoubleToString(tpDist / slDist, 2) : "inf",
P1056: 7683:                         (int)tpInGap, rs);
P1057: 7684:            }
P1058: 7685:          if(slDist > 0.0 && (tpDist / slDist) < InpMinRewardRisk)
P1059: 7686:            {
P1060: 7687:             if(InpDebugLog)
P1061: 7688:                PrintFormat("[SRJ-EA] %s S2POLL_RR_SHORTFALL tpDist=%.5f slDist=%.5f R=%.2f",
P1062: 7689:                            TimeToString(TimeCurrent(), TIME_DATE|TIME_SECONDS),
P1063: 7690:                            tpDist, slDist, (slDist > 0.0 ? tpDist / slDist : 0.0));
P1064: 7691:             /* [Task 31 / Ruling 7a] ADVISORY. Was GoAbort(ABORT_TP_RR_FAIL). iClose is not an entry price before S5: measured 0.17 to 213.27 on one 7-bar sequence as slDist collapses, and every zone-derived alternative overstates by up to 20x. The hard 1R gate now lives only at S5, where the entry IS the next candle's open (P-NEXTOPEN 2026-09-09). S2POLL_RR_SHORTFALL above still logs every failure. */ ;
P1065: 7692:            }
P1066: 7693:         }
P1067: 7694:      }
P1068: 7695: 
P1069: 7696:    if(g_state >= ST_S1_REGIME && g_dir != DIR_NONE)
P1070: 7697:      {
P1071: 7698:       string kind;
P1072: 7699:       g_divLatch = UpdateDivergenceLatch(barShift, g_dir, kind);
P1073: 7700:      }
P1074: 7701: 
P1075: 7702:    //--- [Task 72 / EA-74] Post-latch CQD re-read. DIAGNOSTIC ONLY.
P1076: 7703:    //--- The CQD census at the top of this function is the FIRST CQD read of
P1077: 7704:    //--- the call. Across 4032 bars it reported ZERO shift=1 verdicts, while
P1078: 7705:    //--- UpdateDivergenceLatch - reading the SAME buffer at the SAME two
P1079: 7706:    //--- shifts, later in the same call - matched and latched (measured:
P1080: 7707:    //--- 2026.08.11 18:35 SIGNAL div=hidden, census silent for the whole
P1081: 7708:    //--- sequence). This block repeats the census read AFTER the latch block,
P1082: 7709:    //--- so two reads of one buffer can be compared within a single call.
P1083: 7710:    //---
P1084: 7711:    //--- Each shift is read TWICE in immediate succession. If pass A and pass
P1085: 7712:    //--- B disagree, the buffer is changing under one call, which is value
P1086: 7713:    //--- instability rather than read-ordering lag - the two candidate
P1087: 7714:    //--- mechanisms behind EA-74 are distinguishable only this way.
P1088: 7715:    //---
P1089: 7716:    //--- The live-value filter is character-identical to the census: skip a
P1090: 7717:    //--- read failure, skip EMPTY_VALUE, skip zero. Gated on InpDebugLog.
P1091: 7718:    //--- Assigns nothing, reads g_state / g_dir / g_divLatch for labelling
P1092: 7719:    //--- only, and cannot alter control flow. R8 is NOT engaged.
P1093: 7720:    if(InpDebugLog)
P1094: 7721:      {
P1095: 7722:       static int s_t72_bars     = 0;
P1096: 7723:       static int s_t72_hit1     = 0;
P1097: 7724:       static int s_t72_hit2     = 0;
P1098: 7725:       static int s_t72_mismatch = 0;
P1099: 7726:       s_t72_bars++;
P1100: 7727:       for(int t72_s = 1; t72_s <= 2; t72_s++)
P1101: 7728:         {
P1102: 7729:          double t72_a = 0.0, t72_b = 0.0;
P1103: 7730:          bool t72_okA = ReadBuf1(g_hCqd, CQD_BUF_DIVVERDICT, t72_a, t72_s);
P1104: 7731:          bool t72_okB = ReadBuf1(g_hCqd, CQD_BUF_DIVVERDICT, t72_b, t72_s);
P1105: 7732:          bool t72_diff = (t72_okA != t72_okB) ||
P1106: 7733:                          (t72_okA && t72_okB && t72_a != t72_b);
P1107: 7734:          bool t72_live = (t72_okA && t72_a != EMPTY_VALUE &&
P1108: 7735:                           (int)MathRound(t72_a) != 0);
P1109: 7736:          if(t72_diff) s_t72_mismatch++;
P1110: 7737:          if(t72_live && t72_s == 1) s_t72_hit1++;
P1111: 7738:          if(t72_live && t72_s == 2) s_t72_hit2++;
P1112: 7739:          if(t72_live || t72_diff)
P1113: 7740:             PrintFormat("[SRJ-EA] CQDRECHECK shift=%d passA=%s passB=%s diff=%d "
P1114: 7741:                         "bar=%s state=%s dir=%s divLatch=%d hit1=%d hit2=%d mism=%d",
P1115: 7742:                         t72_s,
P1116: 7743:                         t72_okA ? ((t72_a == EMPTY_VALUE) ? "EMPTY"
P1117: 7744:                                                           : DoubleToString(t72_a, 1))
P1118: 7745:                                 : "readfail",
P1119: 7746:                         t72_okB ? ((t72_b == EMPTY_VALUE) ? "EMPTY"
P1120: 7747:                                                           : DoubleToString(t72_b, 1))
P1121: 7748:                                 : "readfail",
P1122: 7749:                         (int)t72_diff,
P1123: 7750:                         TimeToString(iTime(_Symbol, PERIOD_CURRENT, t72_s),
P1124: 7751:                                      TIME_DATE|TIME_MINUTES),
P1125: 7752:                         StateName(g_state), DirName(g_dir), (int)g_divLatch,
P1126: 7753:                         s_t72_hit1, s_t72_hit2, s_t72_mismatch);
P1127: 7754:         }
P1128: 7755:       if((s_t72_bars % 500) == 0)
P1129: 7756:          PrintFormat("[SRJ-EA] CQDRECHECK_PROGRESS bars=%d hit1=%d hit2=%d mismatch=%d",
P1130: 7757:                      s_t72_bars, s_t72_hit1, s_t72_hit2, s_t72_mismatch);
P1131: 7758:      }
P1132: 7759: 
P1133: 7760:    //====================== [Task 78 / EA-80 tier reading] POI replacement ====
P1134: 7761:    //--- Part A Step 8, D-3, G-2 and the carried ruling in section 6a: an
P1135: 7762:    //--- OPPOSITE-DIRECTION retest of a HIGHER-HIERARCHY POI replaces the held
P1136: 7763:    //--- candidate. The EA has never implemented it - arrival order won instead
P1137: 7764:    //--- of authority - and Task 77 measured the cost. On 2026.08.11 a Daily-VWAP
P1138: 7765:    //--- LONG candidate held the global singleton for 15 bars, never advanced
P1139: 7766:    //--- past S1, died SESSION_CLOSED at 19:05, and suppressed the three
P1140: 7767:    //--- Weekly-POC SHORT retests at bars 18:10 / 18:20 / 18:30 that produced the
P1141: 7768:    //--- Task 75 signal. Those three are the ONLY tier-crossing instances among
P1142: 7769:    //--- 23 higher=1 suppressions; the other 20 are POC-over-VWAP inside a single
P1143: 7770:    //--- anchor tier.
P1144: 7771:    //---
P1145: 7772:    //--- "Higher hierarchy" is read as the ANCHOR TIER, not the 12-line rank, via
P1146: 7773:    //--- g_authorityRank[]/2 - the identical tier collapse ComputeNearestTpTarget
P1147: 7774:    //--- already applies to its POI candidates. No new constant and no new
P1148: 7775:    //--- concept. Under the tier reading this fires on 3 of 23; under the rank
P1149: 7776:    //--- reading it would fire on all 23, and widening later is the removal of
P1150: 7777:    //--- two /2 operators. Implementing the narrower subset is correct under the
P1151: 7778:    //--- tier ruling and merely incomplete under the rank ruling. EA-80 is NOT
P1152: 7779:    //--- pre-empted by this edit.
P1153: 7780:    //---
P1154: 7781:    //--- G-5's same-direction higher-tier ANCHOR UPGRADE is deliberately NOT
P1155: 7782:    //--- implemented here: all nine measured opp=0 higher=1 instances are
P1156: 7783:    //--- intra-tier, so it has zero live instances under this reading.
P1157: 7784:    //---
P1158: 7785:    //--- Threshold-free: the tests are DIRECTION and TIER ORDER. No distance, no
P1159: 7786:    //--- size, no bar count, no tolerance. Part A section 7 is not engaged.
P1160: 7787:    //---
P1161: 7788:    //--- Monotone within a sequence: the test requires a STRICTLY higher tier
P1162: 7789:    //--- than the held anchor, so once anchored at the most authoritative tier
P1163: 7790:    //--- present nothing can displace it and no oscillation is possible.
P1164: 7791:    //---
P1165: 7792:    //--- DetectPoiRetest is read-only - it fills a caller-owned struct from the
P1166: 7793:    //--- 12 POI buffers and mutates no sequence state - and it already returns
P1167: 7794:    //--- the MOST AUTHORITATIVE matching line. So once GoAbort has cleared the
P1168: 7795:    //--- sequence, the IDLE block below re-detects that same line and seeds it.
P1169: 7796:    //--- No seeding code is duplicated here.
P1170: 7797:    //---
P1171: 
P1172: ```
P1173: 
P1174: [Source comment line 7798 omitted because it contains non-ASCII; no executable code omitted.]
P1175: 
P1176: ```mql5
P1177: 
P1178: 7799:    //--- GoAbort call site returns; this one must fall through so the IDLE block
P1179: 7800:    //--- seeds the replacement on the SAME bar. GoAbort sets ST_ABORT and then
P1180: 7801:    //--- calls ResetSequence, leaving g_state == ST_IDLE, which is exactly the
P1181: 7802:    //--- state the IDLE block requires. Section 3.7's no-early-return cascade is
P1182: 7803:    //--- what makes same-bar promotion possible.
P1183: 7804:    //---
P1184: 7805:    //--- Placed BEFORE the Task 73 census so a replaced retest is not ALSO
P1185: 7806:    //--- counted as suppressed - it was promoted, not discarded. That census is
P1186: 7807:    //--- gated on g_state > ST_IDLE and so skips on a replacement bar.
P1187: 7808:    //---
P1188: 7809:    //--- One-bar divergence-latch consequence, accepted: the latch block sits
P1189: 7810:    //--- ABOVE this one, so the replacement candidate's latch is first evaluated
P1190: 7811:    //--- on the NEXT bar. Part A Step 7 latches at any point with no bar-count
P1191: 7812:    //--- limit, so a one-bar delay can postpone a signal but cannot lose one -
P1192: 7813:    //--- the same reasoning EA-78 records for CQD's shift-2-only visibility.
P1193: 7814:    if(g_state > ST_IDLE && g_state != ST_ABORT && g_anchorLine >= 0 && inWindow)
P1194: 7815:      {
P1195: 7816:       PoiRetestResult t78_pr;
P1196: 7817:       if(DetectPoiRetest(barShift, t78_pr) && t78_pr.found)
P1197: 7818:         {
P1198: 7819:           ENUM_SRJ_DIR t78_dir = t78_pr.isLong ? DIR_LONG : DIR_SHORT;
P1199: 7820:           bool t78_opp  = (t78_dir != g_dir);
P1200: 7821:           bool t78_tier = ((g_authorityRank[t78_pr.topLine] / 2) <
P1201: 7822:                            (g_authorityRank[g_anchorLine]   / 2));
P1202: 7823:           //--- [S2-PREEMPT-SHADOW-001] WOULD-PREEMPT recorder: reuses the computed
P1203: 7824:           //--- t78_pr/t78_dir/t78_opp/t78_tier above (no fresh DetectPoiRetest call,
P1204: 
P1205: ```
P1206: 
P1207: [Source comment line 7825 omitted because it contains non-ASCII; no executable code omitted.]
P1208: 
P1209: ```mql5
P1210: 
P1211: 7826:           //--- FORBIDDEN in this shadow and ABSENT below: g_state / g_anchorLine /
P1212: 7827:           //--- g_dir / anchor price-time / zone-touch-latch / GoAbort /
P1213: 7828:           //--- ResetSequence / order-stop-eligibility-session writes
P1214: 7829:           //--- (documented guarantee, grade-verified).
P1215: 7830:           if(InpDebugLog && t78_opp)
P1216: 7831:             {
P1217: 7832:              int s1h_newTier  = g_authorityRank[t78_pr.topLine] / 2;
P1218: 7833:              int s1h_heldTier = g_authorityRank[g_anchorLine]   / 2;
P1219: 7834:              PrintFormat("[SRJ-EA] SIDE1H_WOULDPREEMPT bar=%s newPoi=%s newDir=%s heldPoi=%s heldDir=%s heldState=%s newTier=%d heldTier=%d wouldPreempt=%d wouldTierPassLegacy=%d",
P1220: 7835:                          TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift),
P1221: 7836:                                       TIME_DATE|TIME_MINUTES),
P1222: 7837:                          g_lineCode[t78_pr.topLine], DirName(t78_dir),
P1223: 7838:                          g_lineCode[g_anchorLine], DirName(g_dir),
P1224: 7839:                          StateName(g_state),
P1225: 7840:                          s1h_newTier, s1h_heldTier,
P1226: 7841:                          ((g_state == ST_S2_LTF_ALIGN) ? 1 : 0),
P1227: 7842:                          (t78_tier ? 1 : 0));
P1228: 7843:             }
P1229: 7844:           if(t78_opp && t78_tier)
P1230: 7845:            {
P1231: 7846:             PrintFormat("[SRJ-EA] POIREPLACE bar=%s newPoi=%s newDir=%s "
P1232: 7847:                         "heldPoi=%s heldDir=%s heldState=%s newTier=%d heldTier=%d",
P1233: 7848:                         TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift),
P1234: 7849:                                      TIME_DATE|TIME_MINUTES),
P1235: 7850:                         g_lineCode[t78_pr.topLine], DirName(t78_dir),
P1236: 7851:                         g_lineCode[g_anchorLine], DirName(g_dir),
P1237: 7852:                         StateName(g_state),
P1238: 7853:                         g_authorityRank[t78_pr.topLine] / 2,
P1239: 7854:                         g_authorityRank[g_anchorLine]   / 2);
P1240: ```
P1241: [Source comment line EA 7855 omitted because the comment contains an ellipsis; no executable code omitted.]
P1242: ```mql5
P1243: 7856:             }
P1244: 7857:           //--- [S2-CROSS-DIR-PREEMPT] live transfer (Luna V87-LIVE-PREEMPT-001
P1245: 
P1246: ```
P1247: 
P1248: [Source comment line 7858 omitted because it contains non-ASCII; no executable code omitted.]
P1249: 
P1250: ```mql5
P1251: 
P1252: 7859:           //--- turn). State-bounded: S2-held candidate yields to the observed; P-VNEXT-1 admits S1-held on opposite-confirm (unconfirmed held only).
P1253: 7860:           //--- opposite-direction candidate. Region-P-equivalent MIRROR (no callable
P1254: 
P1255: ```
P1256: 
P1257: [Source comment line 7861 omitted because it contains non-ASCII; no executable code omitted.]
P1258: 
P1259: ```mql5
P1260: 
P1261: 7862:           //--- (a) g_dir takes t78_dir, Region P keeps dir; (b) NO state write and
P1262: 7863:           //--- NO LogState - state unchanged on either path (S2 stays S2, S1 stays S1), never ST_IDLE;
P1263: 7864:           //--- (c) one InpDebugLog-gated SIDE1C_PREEMPT print, new family,
P1264: 7865:           //--- observation only). Reuses computed t78_pr/t78_dir/t78_opp above (no
P1265: 7866:           //--- fresh DetectPoiRetest, N1 untouched). Tier recorded, never consulted
P1266: 7867:           //--- (no <, no <=). Placed AFTER the POIREPLACE census above (D4) so the
P1267: 7868:           //--- census labels stay pre-transfer and byte-comparable.
P1268: 7869:           //--- [P-VNEXT-1 E1] confirmed-opposite displaces unconfirmed-held (his setup-definition 2026-09-22): opposite booked retest with confirm=1 takes the anchor when the held candidate confirms 0. S1-gated: the N1-instrumented predicate runs only where consumed. Declarations hoisted one level so the widened transfer condition below can read them (block scope).
P1269: 7870:           bool t78_opConf = false, t78_heldConf = false;
P1270: 7871:           if(g_state == ST_S1_REGIME && t78_opp)
P1271: 7872:             {
P1272: 7873:              string t78_failOp = "", t78_failHeld = "";
P1273: 7874:              t78_opConf = IsConfirmationCandle(barShift, t78_pr.topLine, t78_dir, t78_failOp);
P1274: 7875:              t78_heldConf = IsConfirmationCandle(barShift, g_anchorLine, g_dir, t78_failHeld);
P1275: 7876:              if(InpDebugLog) PrintFormat("[SRJ-EA] UJOPCONF bar=%s poi=%s dir=%s opConf=%d heldConf=%d opTerm=%s heldTerm=%s - displace-gate inputs (Fix H1)", TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES), g_lineCode[t78_pr.topLine], DirName(t78_dir), (int)t78_opConf, (int)t78_heldConf, t78_failOp, t78_failHeld);
P1276: 7877:               if(!t78_opConf && !t78_heldConf && !SessionAlreadyUsed(sess, barTime) && (t78_pr.topLine != g_anchorLine || t78_dir != g_dir))
P1277: 7878:                 {
P1278: 7879:                  bool t78_al = false; bool t78_alOk = CheckLtfAlign(barShift, t78_dir, t78_al);
P1279: 7880:                  if(InpDebugLog) PrintFormat("[SRJ-EA] UJRESEED bar=%s poi=%s dir=%s fromPoi=%s fromDir=%s al=%d ok=%d - op-retest reseeded over unconfirmed holder (Fix H1)", TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES), g_lineCode[t78_pr.topLine], DirName(t78_dir), g_lineCode[g_anchorLine], DirName(g_dir), (t78_alOk ? (t78_al ? 1 : 0) : -1), (int)t78_alOk);
P1280: 7881:                  s1g_legDir = t78_pr.isLong ? 1 : -1;
P1281: 7882:                  s1g_seedBiasAl = (!t78_alOk ? -1 : (t78_al ? 1 : 0));
P1282: 7883:                  g_anchorLine = t78_pr.topLine;
P1283: 7884:                  ReadBuf1(g_hPoi, t78_pr.topLine, g_anchorPrice, barShift);
P1284: 7885:                  g_anchorBarTime = barTime;
P1285: 7886:                  g_dir = S2ResolveLive(t78_pr.isLong ? DIR_LONG : DIR_SHORT);
P1286: 7887:                  g_sessionAtEntry = sess;
P1287: 7888:                  g_zoneHi = 0.0;
P1288: 7889:                  g_zoneLo = 0.0;
P1289: 7890:                  g_touchSeen = false;
P1290: 7891:                  g_touchBarHi = 0.0;
P1291: 7892:                  g_touchBarLo = 0.0;
P1292: 7893:                  g_latchedEntry = 0.0;
P1293: 7894:                  g_latchedSl = 0.0;
P1294: 7895:                  g_latchedTp = 0.0;
P1295: 7896:                  g_latchedR = 0.0;
P1296: 7897:                  g_latchBarTime = 0;
P1297: 7898:                  g_confirmFromState = ST_IDLE;
P1298: 7899:                  uj_memo_valid = false;
P1299: 7900:                  g_ujOpReseedBarTime = barTime;
P1300: 7901:                  g_ujOpReseedDir = (g_dir == DIR_LONG ? 1 : (g_dir == DIR_SHORT ? -1 : 0));
P1301: 7902:                 }
P1302: 7903:              }
P1303: 7904:           if(t78_opp && (g_state == ST_S2_LTF_ALIGN || (g_state == ST_S1_REGIME && t78_opConf && !t78_heldConf)))
P1304: 7905:             {
P1305: 7906:              int s1c_fromLine     = g_anchorLine;
P1306: 7907:              ENUM_SRJ_DIR s1c_fromDir = g_dir;
P1307: 7908:              g_anchorLine    = t78_pr.topLine;
P1308: 7909:              ReadBuf1(g_hPoi, t78_pr.topLine, g_anchorPrice, barShift);
P1309: 7910:              g_anchorBarTime = barTime;
P1310: 7911:              g_dir           = t78_dir;
P1311: 7912:              g_zoneHi        = 0.0;
P1312: 7913:              g_zoneLo        = 0.0;
P1313: 7914:              g_touchSeen     = false;
P1314: 7915:              g_touchBarHi    = 0.0;
P1315: 7916:              g_touchBarLo    = 0.0;
P1316: 7917:              g_latchedEntry  = 0.0;
P1317: 7918:              g_latchedSl     = 0.0;
P1318: 7919:              g_latchedTp     = 0.0;
P1319: 7920:              g_latchedR      = 0.0;
P1320: 7921:              g_latchBarTime  = 0;
P1321: 7922:              g_confirmFromState = ST_IDLE;
P1322: 7923:              if(InpDebugLog)
P1323: 7924:                 PrintFormat("[SRJ-EA] SIDE1C_PREEMPT bar=%s from=%s fromDir=%s to=%s toDir=%s state=%s",
P1324: 7925:                             TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift),
P1325: 7926:                                          TIME_DATE|TIME_MINUTES),
P1326: 7927:                             g_lineCode[s1c_fromLine], DirName(s1c_fromDir),
P1327: 7928:                             g_lineCode[t78_pr.topLine], DirName(t78_dir),
P1328: 7929:                             StateName(g_state));
P1329: 7930:             }
P1330: 7931:          }
P1331: 7932:       }
P1332: 7933: 
P1333: 7934:     //--- [P-BUILD3 E3 2026-09-11] the live supersession poll (spec 3.4 L120:
P1334: 7935:    //--- a same-direction higher-tier POI touch mid-sequence upgrades the anchor
P1335: 7936:    //--- tier silently; spec 6: arrival order still governs across time, so this
P1336: 7937:    //--- re-binds WITHIN the alive candidate only). Pre-fire states S1-S4;
P1337: 7938:    //--- IDLE (seed owns it), S5+ (guard 4) never reach here. Regime/LTF kept
P1338: 7939:    //--- (line-agnostic progress); the anchor-relative legs re-derive (zone and
P1339: 7940:    //--- touch unbind; S3/S4 fall back to S3_ZONE_WAIT so arming re-runs).
P1340: 7941:    //--- Runs BEFORE the t73 census so a promoted line is not ALSO counted as
P1341: 7942:    //--- suppressed (the Task-78 placement discipline). Sets b3_superseded for E4.
P1342: 7943:    bool b3_superseded = false;
P1343: 7944:    if(inWindow &&
P1344: 7945:       (g_state == ST_S1_REGIME || g_state == ST_S2_LTF_ALIGN ||
P1345: 7946:        g_state == ST_S3_ZONE_WAIT || g_state == ST_S4_ARMED) &&
P1346: 7947:       g_anchorLine >= 0 && g_dir != DIR_NONE)
P1347: 7948:      {
P1348: 7949:       int b3_cand = B3_ElectAnchor(barShift, g_dir);
P1349: 7950:       if(b3_cand >= 0 &&
P1350: 7951:          B3_AnchorTier(b3_cand) < B3_AnchorTier(g_anchorLine) &&
P1351: 7952:          sess == g_sessionAtEntry)
P1352: 7953:         {
P1353: 7954:          int b3_from      = g_anchorLine;
P1354: 7955:          int b3_fromRank  = g_authorityRank[b3_from];
P1355: 7956:          int b3_fromTier  = B3_AnchorTier(b3_from);
P1356: 7957:          int b3_toRank    = g_authorityRank[b3_cand];
P1357: 7958:          int b3_toTier    = B3_AnchorTier(b3_cand);
P1358: 7959:          ENUM_SRJ_STATE b3_prevState = g_state;
P1359: 7960:          g_anchorLine    = b3_cand;
P1360: 7961:          ReadBuf1(g_hPoi, b3_cand, g_anchorPrice, barShift);
P1361: 7962:          g_anchorBarTime = barTime;
P1362: 7963:          g_zoneHi        = 0.0;
P1363: 7964:          g_zoneLo        = 0.0;
P1364: 7965:          g_touchSeen     = false;
P1365: 7966:          g_touchBarHi    = 0.0;
P1366: 7967:          g_touchBarLo    = 0.0;
P1367: 7968:          g_latchedEntry  = 0.0;
P1368: 7969:          g_latchedSl     = 0.0;
P1369: 7970:          g_latchedTp     = 0.0;
P1370: 7971:          g_latchedR      = 0.0;
P1371: 7972:          g_latchBarTime  = 0;
P1372: 7973:          g_confirmFromState = ST_IDLE;
P1373: 7974:          if(g_state == ST_S3_ZONE_WAIT || g_state == ST_S4_ARMED)
P1374: 7975:            {
P1375: 7976:             ENUM_SRJ_STATE b3_prev = g_state;
P1376: 7977:             g_state = ST_S3_ZONE_WAIT;
P1377: 7978:             LogState(b3_prev, g_state);
P1378: 7979:            }
P1379: 7980:          b3_superseded = true;
P1380: 7981:          if(InpDebugLog)
P1381: 7982:             PrintFormat("[SRJ-EA] ANCHOR_SUPERSEDE bar=%s from=%s rank=%d tier=%d to=%s rank=%d tier=%d dir=%s state=%s",
P1382: 7983:                         TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift),
P1383: 7984:                                      TIME_DATE|TIME_MINUTES),
P1384: 7985:                         g_lineCode[b3_from], b3_fromRank, b3_fromTier,
P1385: 7986:                         g_lineCode[b3_cand], b3_toRank, b3_toTier,
P1386: 7987:                         DirName(g_dir), StateName(b3_prevState));
P1387: 7988:         }
P1388: 7989:      }
P1389: 7990: 
P1390: 7991:    //--- [Task 73 / Stage 3 cost side] Suppression census. DIAGNOSTIC ONLY.
P1391: 7992:    //--- Two unmeasured quantities, both needed before Stage 3 is sized:
P1392: 7993:    //---   1. The singleton discards every POI retest that arrives while a
P1393: 7994:    //---      sequence is alive. 103 candidates were ADMITTED across this
P1394: 7995:    //---      window; how many were silently dropped is unknown, and Stage 3
P1395: 7996:    //---      lengthens candidate lifetime, so it raises that number.
P1396: 7997:    //---   2. Part A carries a rule the EA does not implement - an
P1397: 7998:    //---      opposite-direction HIGHER-TIER retest replaces the candidate.
P1398: 7999:    //---      Its frequency has never been counted.
P1399: 8000:    //---
P1400: 8001:    //--- DetectPoiRetest is read-only: it fills a caller-owned struct from the
P1401: 8002:    //--- 12 POI buffers and mutates no sequence state. It is called here on the
P1402: 8003:    //--- SAME barShift the live cascade uses, so a hit is exactly a retest the
P1403: 8004:    //--- IDLE block would have consumed had the singleton been free.
P1404: 8005:    //---
P1405: 8006:    //--- Tier comparison uses g_authorityRank (lower is more authoritative),
P1406: 8007:    //--- the same ranking D-3 and G-2 already use. No distance, no size, no bar
P1407: 8008:    //--- count, no tolerance - Part A section 7 is not engaged.
P1408: 8009:    //---
P1409: 8010:    //--- Gated on InpDebugLog. Assigns nothing outside its own statics, reads
P1410: 8011:    //--- g_state / g_dir / g_anchorLine for labelling only, and cannot alter
P1411: 8012:    //--- control flow. R8 is NOT engaged.
P1412: 8013:    if(InpDebugLog && inWindow &&
P1413: 8014:       g_state > ST_IDLE && g_state != ST_ABORT && g_anchorLine >= 0)
P1414: 8015:      {
P1415: 8016:       static int s_t73_n      = 0;
P1416: 8017:       static int s_t73_higher = 0;
P1417: 8018:       static int s_t73_opp    = 0;
P1418: 8019:       static int s_t73_both   = 0;
P1419: 8020:       static int s_t73_bars   = 0;
P1420: 8021:       s_t73_bars++;
P1421: 8022:       PoiRetestResult t73_pr;
P1422: 8023:       if(DetectPoiRetest(barShift, t73_pr) && t73_pr.found)
P1423: 8024:         {
P1424: 8025:          s_t73_n++;
P1425: 8026:          ENUM_SRJ_DIR t73_dir    = t73_pr.isLong ? DIR_LONG : DIR_SHORT;
P1426: 8027:          bool         t73_isOpp  = (t73_dir != g_dir);
P1427: 8028:          bool         t73_isHigh = (g_authorityRank[t73_pr.topLine] <
P1428: 8029:                                     g_authorityRank[g_anchorLine]);
P1429: 8030:          if(t73_isHigh)               s_t73_higher++;
P1430: 8031:          if(t73_isOpp)                s_t73_opp++;
P1431: 8032:          if(t73_isOpp && t73_isHigh)  s_t73_both++;
P1432: 8033:          PrintFormat("[SRJ-EA] SUPPRESSED bar=%s poi=%s dir=%s opp=%d higher=%d "
P1433: 8034:                      "heldPoi=%s heldDir=%s heldState=%s "
P1434: 8035:                      "cum_n=%d cum_opp=%d cum_hi=%d cum_both=%d action=%s",
P1435: 8036:                      TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift),
P1436: 8037:                                   TIME_DATE|TIME_MINUTES),
P1437: 8038:                      g_lineCode[t73_pr.topLine], DirName(t73_dir),
P1438: 8039:                      (int)t73_isOpp, (int)t73_isHigh,
P1439: 8040:                      g_lineCode[g_anchorLine], DirName(g_dir), StateName(g_state),
P1440: 8041:                      s_t73_n, s_t73_opp, s_t73_higher, s_t73_both,
P1441: 8042:                      b3_superseded ? "SUPERSEDED" : "HELD");
P1442: 8043:         }
P1443: 8044:       if((s_t73_bars % 500) == 0)
P1444: 8045:          PrintFormat("[SRJ-EA] SUPPRESSED_PROGRESS heldBars=%d n=%d opp=%d "
P1445: 8046:                      "higher=%d both=%d",
P1446: 8047:                      s_t73_bars, s_t73_n, s_t73_opp, s_t73_higher, s_t73_both);
P1447: 8048:      }
P1448: 8049: 
P1449: 8050:    //--- [P-CONFIRM-SHADOW] per-bar retest book + confirmation-candle terms. LOG ONLY -
P1450: 8051:    //--- reads buffers and prints; assigns no state. With a candidate held, CONFIRMPOLL
P1451: 8052:    //--- runs against the held anchor; in IDLE it polls the top-ranked same-direction
P1452: 8053:    //--- retest of the bar (the seed's own input) so the calibration covers the pre-seed
P1453: 8054:    //--- bars too.
P1454: 8055:    if(InpDebugLog && (SHADOW_RETESTBOOK || SHADOW_CONFIRMPOLL) && inWindow)
P1455: 8056:      {
P1456: 8057:       ShadowRetestBook(barShift);
P1457: 8058:       ShadowRetestNearMiss(barShift);
P1458: 8059:       if(g_state > ST_IDLE && g_state != ST_ABORT && g_anchorLine >= 0)
P1459: 8060:          ShadowConfirmPoll(barShift, g_anchorLine, g_dir);
P1460: 8061:       else if(g_state == ST_IDLE)
P1461: 8062:         {
P1462: 8063:          PoiRetestResult sh_pr;
P1463: 8064:          if(DetectPoiRetest(barShift, sh_pr) && sh_pr.found)
P1464: 8065:             ShadowConfirmPoll(barShift, sh_pr.topLine,
P1465: 8066:                               sh_pr.isLong ? DIR_LONG : DIR_SHORT);
P1466: 8067:         }
P1467: 8068:       }
P1468: 8069: 
P1469: ```
P1470: 
P1471: ### Q3 fresh seed and normal stages - source lines 8094-8429
P1472: 
P1473: ```mql5
P1474: 8094:         //--- [P-RESQUAT-1 F-a] eviction-paired read gate: a candidate identical to
P1475: 8095:         //--- one its own abort just evicted (same line, same dir, same session,
P1476: 8096:         //--- same day) may not re-seed into the slot; the slot stays free so the
P1477: 8097:         //--- next evaluation consumes the next bar (the 57 convergence, W6b).
P1478: 8098:         //--- EXPIRE: a day-mismatched set is nonblocking and cleared here;
P1479: 8099:         //--- no timer, no bar count (R-b).
P1480: 8100:         ENUM_SRJ_DIR rsq_dir = pr.isLong ? DIR_LONG : DIR_SHORT;
P1481: 8101:         int rsq_bit = (pr.topLine >= 0 && pr.topLine < POI_NLINES) ? pr.topLine * 2 + (pr.isLong ? 0 : 1) : -1;
P1482: 8102:         bool rsq_blocked = false;
P1483: 8103:         datetime rsq_day = TC_DayStart(barTime);
P1484: 8104:         if(rsq_bit < 0)
P1485: 8105:           {
P1486: 8106:            PrintFormat("[SRJ-EA] RESEED_BLOCKED bar=%s action=INDEX-INVALID", TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES));
P1487: 8107:            return;
P1488: 8108:           }
P1489: 8109:         if(sess == SESSION_LONDON)
P1490: 8110:           {
P1491: 8111:            if(rsq_day != g_evictDayLon) g_evictBitsLon = 0;
P1492: 8112:            else if(rsq_bit >= 0 && (g_evictBitsLon & (1 << rsq_bit)) != 0) rsq_blocked = true;
P1493: 8113:           }
P1494: 8114:         else if(sess == SESSION_NYAM)
P1495: 8115:           {
P1496: 8116:            if(rsq_day != g_evictDayNY) g_evictBitsNY = 0;
P1497: 8117:            else if(rsq_bit >= 0 && (g_evictBitsNY & (1 << rsq_bit)) != 0) rsq_blocked = true;
P1498: 8118:           }
P1499: 8119:         if(rsq_blocked)
P1500: 8120:           {
P1501: 8121:            PrintFormat("[SRJ-EA] RESEED_BLOCKED bar=%s poi=%s dir=%s sess=%s evictedDay=%s action=SKIP",
P1502: 8122:                        TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES),
P1503: 8123:                        g_lineCode[pr.topLine], DirName(rsq_dir), SessionName(sess),
P1504: 8124:                        TimeToString(rsq_day, TIME_DATE));
P1505: 8125:            return;
P1506: 8126:           }
P1507: 8127:         s1g_legDir = pr.isLong ? 1 : -1;   //--- [SIDE1G] (0) independent legDir capture (new local only)
P1508: 8128:         g_s2_seedShift = barShift;   //--- [STAGE-C E-C05] exact-seed bar carriage for the live vote
P1509: 8129:          g_anchorLine    = pr.topLine;
P1510: 8130:        //--- [FP-LIMBSEAT-1 S2-3] F3 owns the carried-side write (single
P1511: 8131:        //--- writer). Live rows carry no declared class -> ABSTAIN
P1512: 8132:        //--- pass-through of the legacy value (D3 holds by construction);
P1513: 8133:        //--- legacy output stays the compared label, fire-log identical.
P1514: 8134:        g_dir           = S2ResolveLive(pr.isLong ? DIR_LONG : DIR_SHORT);
P1515: 8135:         SrjSideNote("DetectPoiRetest", g_dir);
P1516: 8136:       g_anchorBarTime = barTime;
P1517: 8137:       ReadBuf1(g_hPoi, pr.topLine, g_anchorPrice, barShift);
P1518: 8138:       g_sessionAtEntry = sess;
P1519: 8139:       g_divLatch = false;
P1520: 8140:       ENUM_SRJ_STATE prev = g_state;
P1521: 8141:       g_state = ST_S1_REGIME;
P1522: 8142:       LogState(prev, g_state);
P1523: 8143:       //--- [P-BUILD3 E2] seed census: the detector already returns argmin(rank);
P1524: 8144:       //--- tier-best == rank-best at seed (no held line), so ElectAnchor parity
P1525: 8145:       //--- holds by construction. Additive print only; assigns nothing.
P1526: 8146:       if(InpDebugLog)
P1527: 8147:          PrintFormat("[SRJ-EA] ANCHOR_ELECT bar=%s action=SEED poi=%s rank=%d tier=%d dir=%s",
P1528: 8148:                      TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift),
P1529: 8149:                                   TIME_DATE|TIME_MINUTES),
P1530: 8150:                      AnchorStr(), g_authorityRank[g_anchorLine],
P1531: 8151:                       B3_AnchorTier(g_anchorLine), DirName(g_dir));
P1532: 8152:          }
P1533: 8153: 
P1534: 8154:     //--- [P-VALIDITY-1 R2 2026-09-22, his renewal word: a held pre-confirmation seed dies on a session-liquidity touch, retest bar included; entry then needs a fresh POC/VWAP retest. Placed after the per-bar seed block: single pass per bar blocks same-bar re-admission. Fires ST_S1..ST_S4 named set only; S5+ committed; runs before the state-machine body; touch test reads pre-bar line state so extension bars don't false-fire; pre-bar swept-mask exclusion (Luna-2): R-POOL indices already swept as of barShift+1 skipped via disk-derived map, current-bar sweep still counts; tri-state (Luna-B): valid mask excludes, unavailable-or-invalid mask = R2SKIP hold with row; eval counter proves cadence.]
P1535: 8155:     if(g_state > ST_IDLE && g_state < ST_S5_GATE_CHECK && g_anchorBarTime > 0)
P1536: 8156:      {
P1537: 8157:       double r2_hi = iHigh(_Symbol, PERIOD_CURRENT, barShift);
P1538: 8158:       double r2_lo = iLow(_Symbol, PERIOD_CURRENT, barShift);
P1539: 8159:       const int r2_bufs[18] = { FL_BUF_PDAY_HIGH, FL_BUF_PDAY_LOW, FL_BUF_ASIA_HIGH, FL_BUF_ASIA_LOW, FL_BUF_LONDON_HIGH, FL_BUF_LONDON_LOW, FL_BUF_NY_HIGH, FL_BUF_NY_LOW, FL_BUF_PM_HIGH, FL_BUF_PM_LOW, FL_BUF_PD_ASIA_HIGH, FL_BUF_PD_ASIA_LOW, FL_BUF_PD_LONDON_HIGH, FL_BUF_PD_LONDON_LOW, FL_BUF_PD_NY_HIGH, FL_BUF_PD_NY_LOW, FL_BUF_PD_PM_HIGH, FL_BUF_PD_PM_LOW };
P1540: 8160:       bool r2_touch = false;
P1541: 8161:       double r2_val = 0.0;
P1542: 8162:       int r2_buf = -1;
P1543: 8163:       double r2_mask;
P1544: 8164:       if(!ReadFlow(FL_BUF_SWEPT_MASK, r2_mask, barShift + 1)) r2_mask = EMPTY_VALUE;
P1545: 8165:       bool r2_mValid = (MathIsValidNumber(r2_mask) && r2_mask == MathFloor(r2_mask) && r2_mask >= 0.0 && r2_mask < 4194304.0);
P1546: 8166:       int r2_m = (r2_mValid ? (int)MathRound(r2_mask) : 0);
P1547: 8167:       static int r2_evals = 0;
P1548: 8168:       if(!r2_mValid && InpDebugLog) PrintFormat("[SRJ-EA] R2SKIP bar=%s evals=%d (mask unavailable or invalid - seed held)", TimeToString(barTime, TIME_DATE|TIME_MINUTES), r2_evals);
P1549: 8169:       if(r2_mValid) r2_evals++;
P1550: 8170:       for(int r2_k = 0; r2_k < 18 && !r2_touch && r2_mValid; r2_k++)
P1551: 8171:         {
P1552: 8172:          double r2_v;
P1553: 8173:          int r2_sweptBit = (r2_k <= 9 ? r2_k : r2_k + 4);
P1554: 8174:          if((r2_m & (1 << r2_sweptBit)) != 0) continue;
P1555: 8175:          if(ReadFlow(r2_bufs[r2_k], r2_v, barShift + 1) && r2_lo <= r2_v && r2_v <= r2_hi)
P1556: 8176:             { r2_touch = true; r2_val = r2_v; r2_buf = r2_bufs[r2_k]; }
P1557: 8177:          }
P1558: 8178:       if(r2_touch && g_regime == REGIME_MEANREV)
P1559: 8179:         {
P1560: 8180:          ENUM_SRJ_STATE r2_prev = g_state;
P1561: 8181:          g_state = ST_IDLE;
P1562: 8182:          g_anchorLine = -1;
P1563: 8183:          g_anchorBarTime = 0;
P1564: 8184:          LogState(r2_prev, g_state);
P1565: 8185:          if(InpDebugLog) PrintFormat("[SRJ-EA] SEEDVOID bar=%s dir=%s buf=%d line=%s evals=%d hi=%s lo=%s", TimeToString(barTime, TIME_DATE|TIME_MINUTES), DirName(g_dir), r2_buf, DoubleToString(r2_val, _Digits), r2_evals, DoubleToString(r2_hi, _Digits), DoubleToString(r2_lo, _Digits));
P1566: 8186:         }
P1567: 8187:      }
P1568: 8188:          //--- [S2-TIMING-SHADOW-001] seed-bias recorder (Luna V94 F1, cleared BY NAME
P1569: 
P1570: ```
P1571: 
P1572: [Source comment line 8189 omitted because it contains non-ASCII; no executable code omitted.]
P1573: 
P1574: ```mql5
P1575: 
P1576: 8190:          //--- pure helper the S2 path calls (EA:7787), same buffer/semantics; NO new bias
P1577: 8191:           //--- computation (Sonnet build flag). Candidate dir = detector dir via s1g_legDir (equals pr.isLong on a seed bar), matching
P1578: 8192:          //--- the authored candidateDirection. Flip observed at grade via later rows
P1579: 8193:          //--- (pre-declared derivation). FORBIDDEN/ABSENT: any state/dir/latch/order/
P1580: 8194:           //--- stop/N1 write (documented guarantee, grade-verified).
P1581: 8195:           //--- Seed-gated per the s1f_seedThisBar idiom (EA:7664): emits only on the bar the seed fires.
P1582: 8196:           if(s1f_seedArmed && g_state == ST_S1_REGIME && g_dir != DIR_NONE && g_anchorLine >= 0)
P1583: 8197:            {
P1584: 8198:             bool s1t_aligned = false;
P1585: 8199:             string s1t_alOk = "UNREAD";
P1586: 8200:             ENUM_SRJ_DIR s1t_candDir = (s1g_legDir > 0 ? DIR_LONG : DIR_SHORT);   //--- seed-bar pr via file-scope capture (EA:1038 decl, assigned 7609 this pass)
P1587: 8201:              if(CheckLtfAlign(barShift, s1t_candDir, s1t_aligned))
P1588: 8202:                 s1t_alOk = s1t_aligned ? "1" : "0";
P1589: 8203:              s1g_seedBiasAl = ((s1t_alOk == "UNREAD") ? -1 : (s1t_aligned ? 1 : 0));   //--- [STAGE-D-S2-RGATE-001] seed-bias carriage (print-only file-scope; single-candidate machine + IDLE-gated reseed mean the eval reads its own seed; -1 guards never-seeded)
P1590: 8204:             if(InpDebugLog) PrintFormat("[SRJ-EA] SIDE1T_SEEDBIAS bar=%s dir=%s biasAligned=%s verdict=%s",
P1591: 8205:                         TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift),
P1592: 8206:                                      TIME_DATE|TIME_MINUTES),
P1593: 8207:                         DirName(s1t_candDir),
P1594: 8208:                         s1t_alOk,
P1595: 8209:                          (s1t_alOk == "1") ? "CONSIDER" : "REJECT-BIAS-TIMING");
P1596: 8210:             }
P1597: 8211:           //--- [P-BIRTH-PROBE-001] dual-reading birth probe (Luna V105-DUAL-READ-CLEAR-001, cleared BY NAME
P1598: 8212:           //--- print-only). At EVERY seed (same gate as SIDE1T): TF-verdict for SHORT (HTF bufs 19/20/21
P1599: 
P1600: ```
P1601: 
P1602: [Source comment line 8213 omitted because it contains non-ASCII; no executable code omitted.]
P1603: 
P1604: ```mql5
P1605: 
P1606: 8214:           //--- unrestorable, pure reads only, zero new semantics) AND MR-verdict for SHORT (sweep-tag
P1607: 8215:           //--- dir-match: SHORT needs a swept HIGH) printed SEPARATELY (row-type to council grade) +
P1608: 8216:           //--- confirm-for-SHORT via IsConfirmationCandle(DIR_SHORT) with N1 save/restore (6 counters:
P1609: 
P1610: ```
P1611: 
P1612: [Source comment line 8217 omitted because it contains non-ASCII; no executable code omitted.]
P1613: 
P1614: ```mql5
P1615: 
P1616: 8218:           //--- miscount, owned; exactly these 6 written in 2096-2137). Seed-identity: everything here is
P1617: 
P1618: ```
P1619: 
P1620: [Source comment line 8219 omitted because it contains non-ASCII; no executable code omitted.]
P1621: 
P1622: ```mql5
P1623: 
P1624: 8220:           //--- no staleness possible, no live-global re-read. No-race enforced AT GRADE (D6:
P1625: 8221:           //--- transfer-claimed lineages labeled via the PREEMPT join). FORBIDDEN/ABSENT: any state/dir/
P1626: 8222:           //--- latch/order/stop/N1 write (N1 restored), OrderSend, AdoptOff touch, fresh Detect calls,
P1627: 8223:           //--- price literals. tf=-1 guards HTF-read failure (grade asserts 0 occurrences).
P1628: 8224:           if(InpDebugLog && s1f_seedArmed && g_state == ST_S1_REGIME && g_dir != DIR_NONE && g_anchorLine >= 0)
P1629: 8225:             {
P1630: 8226:              double s1v_hH = 0.0, s1v_hM = 0.0, s1v_hL = 0.0;
P1631: 8227:              int s1v_hOk = 0, s1v_votes = 0;
P1632: 8228:              if(ReadFlow(FL_BUF_HTF_HIGH, s1v_hH, barShift) && ReadFlow(FL_BUF_HTF_MID, s1v_hM, barShift) && ReadFlow(FL_BUF_HTF_LOW, s1v_hL, barShift))
P1633: 8229:                {
P1634: 8230:                 s1v_hOk = 1;
P1635: 8231:                 if((int)MathRound(s1v_hH) == -1) s1v_votes++;
P1636: 8232:                 if((int)MathRound(s1v_hM) == -1) s1v_votes++;
P1637: 8233:                 if((int)MathRound(s1v_hL) == -1) s1v_votes++;
P1638: 8234:                }
P1639: 8235:              int s1v_tf = ((s1v_hOk == 0) ? -1 : ((s1v_votes >= 2) ? 1 : 0));
P1640: 8236:              double s1v_swD = 0.0;
P1641: 8237:              int s1v_tag = 0;
P1642: 8238:              if(ReadFlow(FL_BUF_SWEEP_TAG, s1v_swD, barShift)) s1v_tag = (int)MathRound(s1v_swD);
P1643: 8239:              int s1v_mr = (((s1v_tag == SWEEP_ASIA_HIGH) || (s1v_tag == SWEEP_LONDON_HIGH) || (s1v_tag == SWEEP_NY_HIGH) || (s1v_tag == SWEEP_PM_HIGH)) ? 1 : 0);
P1644: 8240:              int s1v_wEq = g_n1_vwapEq, s1v_poEq = g_n1_pocEq, s1v_wIv = g_n1_vwapInv, s1v_poIv = g_n1_pocInv, s1v_wSv = g_n1_vwapSurv, s1v_poSv = g_n1_pocSurv;
P1645: 8241:              string s1v_term = "";
P1646: 8242:              IsConfirmationCandle(barShift, g_anchorLine, DIR_SHORT, s1v_term);
P1647: 8243:              g_n1_vwapEq = s1v_wEq; g_n1_pocEq = s1v_poEq; g_n1_vwapInv = s1v_wIv; g_n1_pocInv = s1v_poIv; g_n1_vwapSurv = s1v_wSv; g_n1_pocSurv = s1v_poSv;
P1648: 8244:              if(s1v_term == "") s1v_term = "PASS";
P1649: 8245:              PrintFormat("[SRJ-EA] SIDE1V_BIRTH bar=%s dir=SHORT tf=%d mr=%d confShort=%s",
P1650: 8246:                          TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift),
P1651: 8247:                                       TIME_DATE|TIME_MINUTES),
P1652: 8248:                          s1v_tf, s1v_mr, s1v_term);
P1653: 8249:             }
P1654: 8250: 
P1655: 8251:     //--- [SIDE-1P-FIX-SPLIT Track-1/Track-2 AdoptOff shadow] print-only recorders.
P1656: 8252:    //--- Reads assigned state only. The gate consult's 6 N1 counter writes are
P1657: 8253:    //--- restored like-for-like (values identical after); every other call is pure.
P1658: 8254:    //--- No live-state, resolver, latch, order, stop, fixture or eligibility write.
P1659: 8255:    //--- Fires only on the exact seed bar (armed==IDLE at block entry, S1 after).
P1660: 8256:     {
P1661: 8257:      bool s1f_seedThisBar = (s1f_seedArmed && g_state == ST_S1_REGIME && g_dir != DIR_NONE && g_anchorLine >= 0);
P1662: 8258:      if(s1f_seedThisBar)
P1663: 8259:        {
P1664: 8260:         s1g_nSeed++;
P1665: 8261:         int s1f_vwEq = g_n1_vwapEq;
P1666: 8262:         int s1f_poEq = g_n1_pocEq;
P1667: 8263:         int s1f_vwIv = g_n1_vwapInv;
P1668: 8264:         int s1f_poIv = g_n1_pocInv;
P1669: 8265:         int s1f_vwSv = g_n1_vwapSurv;
P1670: 8266:         int s1f_poSv = g_n1_pocSurv;
P1671: 8267:         string s1f_term = "";
P1672: 8268:          bool s1f_ok = IsConfirmationCandle(barShift, g_anchorLine, (s1g_legDir > 0 ? DIR_LONG : DIR_SHORT), s1f_term);   //--- [STAGE-C] legacy-pin: shadow diagnoses the legacy path (G-C01/G-C06 parity; value-identical pre-Stage-C)
P1673: 8269:         g_n1_vwapEq = s1f_vwEq;
P1674: 8270:         g_n1_pocEq = s1f_poEq;
P1675: 8271:         g_n1_vwapInv = s1f_vwIv;
P1676: 8272:         g_n1_pocInv = s1f_poIv;
P1677: 8273:         g_n1_vwapSurv = s1f_vwSv;
P1678: 8274:         g_n1_pocSurv = s1f_poSv;
P1679: 8275:         double s1f_h4 = EMPTY_VALUE;
P1680: 8276:         double s1f_h1 = EMPTY_VALUE;
P1681: 8277:         ReadFlow(FL_BUF_HTF_HIGH, s1f_h4, barShift);
P1682: 8278:         ReadFlow(FL_BUF_HTF_MID, s1f_h1, barShift);
P1683: 8279:         int s1f_l4 = S2Leg(s1f_h4);
P1684: 8280:         int s1f_l1 = S2Leg(s1f_h1);
P1685: 8281:         string s1f_hier = "-";
P1686: 8282:         int s1f_conf = 0;
P1687: 8283:         if(s1f_l4 != 0 && s1f_l4 == s1f_l1) s1f_hier = (s1f_l4 > 0) ? "LONG" : "SHORT";
P1688: 8284:         else if(s1f_l4 != 0 && s1f_l1 != 0) s1f_conf = 1;
P1689: 8285:         if(InpDebugLog)
P1690: 8286:            PrintFormat("[SRJ-EA] SIDE1F_VOTE bar=%s dir=%s t1term=%s t1reject=%d hier=%s conf=%d",
P1691: 8287:                        TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES),
P1692: 8288:                        DirName(g_dir), s1f_term, (s1f_ok ? 0 : 1), s1f_hier, s1f_conf);
P1693: 8289:         if(s1f_hier == "SHORT" && InpDebugLog)
P1694: 8290:            PrintFormat("[SRJ-EA] SIDE1F_SHORT bar=%s anchor=%s",
P1695: 8291:                        TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES),
P1696: 8292:                        AnchorStr());
P1697: 8293:         //--- [SIDE1G] R1 PROFILE mirror (independent term booleans + pre-terms; NO second gate call)
P1698: 8294:         double s1g_o1 = iOpen (_Symbol, PERIOD_CURRENT, barShift + 1);
P1699: 8295:         double s1g_c1 = iClose(_Symbol, PERIOD_CURRENT, barShift + 1);
P1700: 8296:         double s1g_h1 = iHigh (_Symbol, PERIOD_CURRENT, barShift + 1);
P1701: 8297:         double s1g_l1 = iLow  (_Symbol, PERIOD_CURRENT, barShift + 1);
P1702: 8298:         double s1g_o0 = iOpen (_Symbol, PERIOD_CURRENT, barShift);
P1703: 8299:         double s1g_c0 = iClose(_Symbol, PERIOD_CURRENT, barShift);
P1704: 8300:         string s1g_pre = "PASS";
P1705: 8301:         if(s1g_o1 <= 0.0 || s1g_c1 <= 0.0 || s1g_o0 <= 0.0 || s1g_c0 <= 0.0) s1g_pre = "NO_DATA";
P1706: 8302:         double s1g_L = g_anchorPrice;
P1707: 8303:         if(s1g_pre == "PASS" && (s1g_L == EMPTY_VALUE || s1g_L <= 0.0)) s1g_pre = "NO_LINE";
P1708: 8304:         int s1g_opp = (((g_dir == DIR_LONG) ? (s1g_c1 < s1g_o1) : (s1g_c1 > s1g_o1))) ? 1 : 0;
P1709: 8305:         int s1g_a2 = (((g_dir == DIR_LONG) ? (s1g_c1 >= s1g_L) : (s1g_c1 <= s1g_L))) ? 1 : 0;
P1710: 8306:         int s1g_isDoji = ((MathAbs(s1g_c0 - s1g_o0) < _Point * 0.0001)) ? 1 : 0;
P1711: 8307:         int s1g_bodyDir = (((g_dir == DIR_LONG) ? (s1g_c0 > s1g_o0) : (s1g_c0 < s1g_o0))) ? 1 : 0;
P1712: 8308:         int s1g_body = ((s1g_isDoji == 0) && (s1g_bodyDir == 1)) ? 1 : 0;
P1713: 8309:         int s1g_touch = (((s1g_h1 >= s1g_L - _Point) && (s1g_l1 <= s1g_L + _Point))) ? 1 : 0;
P1714: 8310:         string s1g_derived = (s1g_pre != "PASS") ? s1g_pre : ((s1g_opp == 0) ? "A_OPP" : ((s1g_a2 == 0) ? "A2_CLOSE_BREAK" : ((s1g_body == 0) ? "B_BODY" : ((s1g_touch == 0) ? "C_TOUCH" : "PASS"))));
P1715: 8311:         string s1g_t1 = (s1f_term == "") ? "PASS" : s1f_term;
P1716: 8312:         int s1g_match = (s1g_derived == s1g_t1) ? 1 : 0;
P1717: 8313:         s1g_nProf++;
P1718: 8314:         if(InpDebugLog)
P1719: 8315:            PrintFormat("[SRJ-EA] SIDE1G_PROFILE bar=%s opp=%d a2=%d body=%d touch=%d pre=%s term=%s t1term=%s match=%d",
P1720: 8316:                        TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES),
P1721: 8317:                        s1g_opp, s1g_a2, s1g_body, s1g_touch, s1g_pre, s1g_derived, s1g_t1, s1g_match);
P1722: 8318:         //--- [SIDE1G] R2 VOTE3 (legDir capture vs buffer vote + 15m read-only leg)
P1723: 8319:         double s1g_m15 = EMPTY_VALUE;
P1724: 8320:         ReadFlow(FL_BUF_HTF_LOW, s1g_m15, barShift);
P1725: 8321:         int s1g_lm = S2Leg(s1g_m15);
P1726: 8322:         int s1g_agree = ((s1f_l4 != 0) && (s1f_l4 == s1f_l1) && (s1g_legDir == s1f_l4)) ? 1 : 0;
P1727: 8323:         s1g_nV3++;
P1728: 8324:         if(InpDebugLog)
P1729: 8325:            PrintFormat("[SRJ-EA] SIDE1G_VOTE3 bar=%s h4=%s h1=%s m15=%s l4=%d l1=%d lm=%d legDir=%d gdir=%s agree=%d",
P1730: 8326:                        TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES),
P1731: 8327:                        DoubleToString(s1f_h4, 1), DoubleToString(s1f_h1, 1), DoubleToString(s1g_m15, 1),
P1732: 8328:                        s1f_l4, s1f_l1, s1g_lm, s1g_legDir, DirName(g_dir), s1g_agree);
P1733: 8329:          //--- [STAGE-C E-C01] Track-1 B_BODY-only live consult (owned g_dir; N1-neutral; Sonnet-v71 S1 live-gating semantics: non-B_BODY false = pass)
P1734: 8330:          int s1c_vwEq = g_n1_vwapEq;
P1735: 8331:          int s1c_poEq = g_n1_pocEq;
P1736: 8332:          int s1c_vwIv = g_n1_vwapInv;
P1737: 8333:          int s1c_poIv = g_n1_pocInv;
P1738: 8334:          int s1c_vwSv = g_n1_vwapSurv;
P1739: 8335:          int s1c_poSv = g_n1_pocSurv;
P1740: 8336:          string s1c_term = "";
P1741: 8337:          bool s1c_ok = IsConfirmationCandle(barShift, g_anchorLine, g_dir, s1c_term);
P1742: 8338:          g_n1_vwapEq = s1c_vwEq;
P1743: 8339:          g_n1_pocEq = s1c_poEq;
P1744: 8340:          g_n1_vwapInv = s1c_vwIv;
P1745: 8341:          g_n1_pocInv = s1c_poIv;
P1746: 8342:          g_n1_vwapSurv = s1c_vwSv;
P1747: 8343:          g_n1_pocSurv = s1c_poSv;
P1748: 8344:          //--- [C0-PROBE] suppression effect DELETED: consult above kept, prints kept, NO g_state write
P1749: 8345:          if(!s1c_ok && s1c_term == "B_BODY")
P1750: 8346:            {
P1751: 8347:             if(InpDebugLog)
P1752: 8348:                PrintFormat("[SRJ-EA] SIDE1C_SUPP bar=%s dir=%s term=%s", TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES), DirName(g_dir), s1c_term);
P1753: 8349:            }
P1754: 8350:          //--- [C0-PROBE] both-dirs failTerm row per seed (each leg N1-neutral, same save/restore idiom)
P1755: 8351:          {
P1756: 8352:           int s1c_bVwEq = g_n1_vwapEq;
P1757: 8353:           int s1c_bPoEq = g_n1_pocEq;
P1758: 8354:           int s1c_bVwIv = g_n1_vwapInv;
P1759: 8355:           int s1c_bPoIv = g_n1_pocInv;
P1760: 8356:           int s1c_bVwSv = g_n1_vwapSurv;
P1761: 8357:           int s1c_bPoSv = g_n1_pocSurv;
P1762: 8358:           string s1c_termLong = "";
P1763: 8359:           string s1c_termShort = "";
P1764: 8360:           IsConfirmationCandle(barShift, g_anchorLine, DIR_LONG, s1c_termLong);
P1765: 8361:           g_n1_vwapEq = s1c_bVwEq;
P1766: 8362:           g_n1_pocEq = s1c_bPoEq;
P1767: 8363:           g_n1_vwapInv = s1c_bVwIv;
P1768: 8364:           g_n1_pocInv = s1c_bPoIv;
P1769: 8365:           g_n1_vwapSurv = s1c_bVwSv;
P1770: 8366:           g_n1_pocSurv = s1c_bPoSv;
P1771: 8367:           IsConfirmationCandle(barShift, g_anchorLine, DIR_SHORT, s1c_termShort);
P1772: 8368:           g_n1_vwapEq = s1c_bVwEq;
P1773: 8369:           g_n1_pocEq = s1c_bPoEq;
P1774: 8370:           g_n1_vwapInv = s1c_bVwIv;
P1775: 8371:           g_n1_pocInv = s1c_bPoIv;
P1776: 8372:           g_n1_vwapSurv = s1c_bVwSv;
P1777: 8373:           g_n1_pocSurv = s1c_bPoSv;
P1778: 8374:           if(InpDebugLog)
P1779: 8375:              PrintFormat("[SRJ-EA] SIDE1C_BOTHDIRS bar=%s live=%s liveTerm=%s longTerm=%s shortTerm=%s",
P1780: 8376:                          TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES),
P1781: 8377:                          DirName(g_dir), s1c_term, s1c_termLong, s1c_termShort);
P1782: 8378:           if(InpDebugLog)
P1783: 8379:              PrintFormat("[SRJ-EA] SIDE1C_CHAIN bar=%s chainN=%d",
P1784: 8380:                          TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES),
P1785: 8381:                          g_side_n);
P1786: 8382:          }
P1787: 8383:         }
P1788: 8384:     }
P1789: 8385: 
P1790: 8386:      if(g_state == ST_S1_REGIME)
P1791: 8387:      {
P1792: 8388:       if((barTime - g_anchorBarTime) >= 3600 && g_anchorLine >= 0)
P1793: 8389:         {
P1794: 8390:          if(InpDebugLog) PrintFormat("[SRJ-EA] UJHOLDEXPIRE bar=%s poi=%s dir=%s heldMin=%d - unconfirmed holder expired, no eviction (Fix H2)", TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES), AnchorStr(), DirName(g_dir), (int)((barTime - g_anchorBarTime) / 60));
P1795: 8391:          GoAbort(ABORT_HOLDER_EXPIRED, g_state); return;
P1796: 8392:         }
P1797: 8393:       ENUM_SRJ_REGIME regime;
P1798: 8394:       if(!ClassifyRegime(barShift, g_dir, regime))
P1799: 8395:         { GoAbort(ABORT_UPSTREAM_UNREADY, g_state); return; }
P1800: 8396:       if(regime == REGIME_NONE)
P1801: 8397:         { if(InpDebugLog) PrintFormat("[SRJ-EA] S1WAIT bar=%s dir=%s poi=%s sess=%s - regime unclassified, candidate RETAINED (Stage 3a)", TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES), DirName(g_dir), AnchorStr(), SessionName(g_sessionAtEntry)); return; }
P1802: 8398:       g_regime = regime;
P1803: 8399:       ENUM_SRJ_STATE prev = g_state;
P1804: 8400:       g_state = ST_S2_LTF_ALIGN;
P1805: 8401:       LogState(prev, g_state);
P1806: 8402:      }
P1807: 8403: 
P1808: 8404:    if(g_state == ST_S2_LTF_ALIGN)
P1809: 8405:      {
P1810: 8406:       bool aligned;
P1811: 8407:       if(!CheckLtfAlign(barShift, g_dir, aligned))
P1812: 8408:         { GoAbort(ABORT_UPSTREAM_UNREADY, g_state); return; }
P1813: 8409:       if(!aligned)
P1814: 8410:         {
P1815: 8411:          double uj_m15b = 0.0;
P1816: 8412:          bool uj_m15r = ReadFlow(FL_BUF_HTF_LOW, uj_m15b, barShift);
P1817: 8413:          double uj_wantb = (g_dir == DIR_LONG ? 1.0 : -1.0);
P1818: 8414:          if(InpDebugLog) PrintFormat("[SRJ-EA] UJPROV bar=%s dir=%s reseedBar=%s seedBiasAl=%d reseedDir=%d exempt=%d - reseed provenance at S2 edge (Fix CARRY)", TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES), DirName(g_dir), TimeToString(g_ujOpReseedBarTime, TIME_DATE|TIME_MINUTES), s1g_seedBiasAl, g_ujOpReseedDir, ((uj_m15r && uj_m15b == uj_wantb && (s1g_seedBiasAl != 0 || (g_ujOpReseedBarTime != 0 && g_ujOpReseedDir != 0 && g_ujOpReseedDir == (g_dir == DIR_LONG ? 1 : (g_dir == DIR_SHORT ? -1 : 0))))) ? 1 : 0));
P1819: 8415:          if(uj_m15r && uj_m15b == uj_wantb && (s1g_seedBiasAl != 0 || (g_ujOpReseedBarTime != 0 && g_ujOpReseedDir != 0 && g_ujOpReseedDir == (g_dir == DIR_LONG ? 1 : (g_dir == DIR_SHORT ? -1 : 0)))))
P1820: 8416:            { double uj_ltfb = 0.0; int uj_ltfOk = ReadFlow(FL_BUF_LTF_BIAS, uj_ltfb, barShift) ? 1 : 0;
P1821: 8417:              int uj_m15s = (int)iTime(_Symbol, PERIOD_CURRENT, barShift);
P1822: 8418:              datetime uj_m15src = (datetime)(uj_m15s - uj_m15s % 900);
P1823: 8419:              if(InpDebugLog) PrintFormat("[SRJ-EA] S2PROMOTE_M15 bar=%s dir=%s poi=%s sess=%s m15=%s m15src=%s ltf=%s sb=%d rf=%d/%d", TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES), DirName(g_dir), AnchorStr(), SessionName(g_sessionAtEntry), DoubleToString(uj_m15b, 1), TimeToString(uj_m15src, TIME_DATE|TIME_MINUTES), UjDbl(uj_ltfb), s1g_seedBiasAl, (uj_m15r ? 1 : 0), uj_ltfOk); }
P1824: 8420:          else if(uj_m15r && uj_m15b == uj_wantb)
P1825: 8421:            { if(InpDebugLog) PrintFormat("[SRJ-EA] S2SEEDBIAS_KILL bar=%s dir=%s poi=%s - seedbias refused, promotion killed (Fix B2)", TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES), DirName(g_dir), AnchorStr()); GoAbort(ABORT_SEEDBIAS_REFUSED, g_state); return; }
P1826: 8422:          else
P1827: 8423:            { if(InpDebugLog) PrintFormat("[SRJ-EA] S2WAIT bar=%s dir=%s poi=%s sess=%s - LTF bias unaligned, candidate RETAINED (Stage 3a)", TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES), DirName(g_dir), AnchorStr(), SessionName(g_sessionAtEntry)); return; }
P1828: 8424:         }
P1829: 8425:       ENUM_SRJ_STATE prev = g_state;
P1830: 8426:       g_state = ST_S3_ZONE_WAIT;
P1831: 8427:       LogState(prev, g_state);
P1832: 8428:      }
P1833: 8429:        //--- [v20 S-b] contender evaluation (self-contained; transfer shape mirrors EA-7813-7829, cited, not pasted).
P1834: ```
P1835: 
P1836: ### Q3 contender evaluation and abort application - source lines 8430-8476
P1837: 
P1838: ```mql5
P1839: 8430:        if(g_state == ST_S3_ZONE_WAIT || g_state == ST_S4_ARMED) {
P1840: 8431:        bool uj_sbHave = false; ENUM_SRJ_DIR uj_sbDir = DIR_NONE; int uj_sbLine = -1;
P1841: 8432:        {
P1842: 8433:         PoiRetestResult uj_sbPr;
P1843: 8434:         if(DetectPoiRetest(barShift, uj_sbPr) && uj_sbPr.found)
P1844: 8435:           { uj_sbHave = true; uj_sbDir = uj_sbPr.isLong ? DIR_LONG : DIR_SHORT; uj_sbLine = uj_sbPr.topLine; }
P1845: 8436:        }
P1846: 8437:        string uj_sbTermC = "", uj_sbTermH = "";
P1847: 8438:         bool uj_sbConfC = (uj_sbHave && (uj_sbDir != g_dir)) ? IsConfirmationCandle(barShift, uj_sbLine, uj_sbDir, uj_sbTermC, true) : false;
P1848: 8439:        bool uj_sbConfH = IsConfirmationCandle(barShift, g_anchorLine, g_dir, uj_sbTermH);
P1849: 8440:         double uj_sbLineVal = 0.0; if(uj_sbHave && uj_sbLine >= 0 && !ReadBuf1(g_hPoi, uj_sbLine, uj_sbLineVal, barShift)) uj_sbLineVal = 0.0;
P1850: 8441:         double uj_sbo1 = iOpen (_Symbol, PERIOD_CURRENT, barShift + 1); double uj_sbc1 = iClose(_Symbol, PERIOD_CURRENT, barShift + 1); double uj_sbc0 = iClose(_Symbol, PERIOD_CURRENT, barShift); int uj_sbarm = 1;
P1851: 8442:         if(InpDebugLog) PrintFormat("[SRJ-EA] UJSBTELEM bar=%s dir=%s have=%d sbDir=%s sbLine=%d confC=%d confH=%d sbL=%s o1=%s c1=%s c0=%s arm=%d termC=%s termH=%s - contender evaluation (Fix S3)", TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES), DirName(g_dir), (int)uj_sbHave, DirName(uj_sbDir), uj_sbLine, (int)uj_sbConfC, (int)uj_sbConfH, DoubleToString(uj_sbLineVal, _Digits), DoubleToString(uj_sbo1, _Digits), DoubleToString(uj_sbc1, _Digits), DoubleToString(uj_sbc0, _Digits), uj_sbarm, uj_sbTermC, uj_sbTermH);
P1852: 8443:        if(uj_sbConfC && !uj_sbConfH && (g_state == ST_S3_ZONE_WAIT || g_state == ST_S4_ARMED))
P1853: 8444:          {
P1854: 8445:           int uj_sbFromLine = g_anchorLine; ENUM_SRJ_DIR uj_sbFromDir = g_dir;
P1855: 8446:           g_anchorLine = uj_sbLine; g_dir = uj_sbDir;
P1856: 8447:           ReadBuf1(g_hPoi, uj_sbLine, g_anchorPrice, barShift);
P1857: 8448:           g_anchorBarTime = barTime;
P1858: 8449:           g_zoneHi = 0.0; g_zoneLo = 0.0; g_touchSeen = false;
P1859: 8450:           g_touchBarHi = 0.0; g_touchBarLo = 0.0;
P1860: 8451:           g_latchedEntry = 0.0; g_latchedSl = 0.0; g_latchedTp = 0.0; g_latchedR = 0.0;
P1861: 8452:           g_latchBarTime = 0; g_confirmFromState = ST_IDLE;
P1862: 8453:           uj_memo_valid = false;
P1863: 8454:           if(InpDebugLog)
P1864: 8455:              PrintFormat("[SRJ-EA] SIDE1C_YIELD bar=%s from=%s fromDir=%s to=%s toDir=%s state=%s term=%s",
P1865: 8456:                          TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES),
P1866: 8457:                          g_lineCode[uj_sbFromLine], DirName(uj_sbFromDir),
P1867: 8458:                          g_lineCode[uj_sbLine], DirName(uj_sbDir),
P1868: 8459:                          StateName(g_state), uj_sbTermC);
P1869: 8460:          }
P1870: 8461:        }
P1871: 8462:        //--- [v20 S-a] deferred-abort application (identity-keyed on anchor+dir+barTime; set in Fix F11 tail).
P1872: 8463:        if(uj_saAbort)
P1873: 8464:          {
P1874: 8465:           if(uj_saA == g_anchorLine && uj_saD == (int)g_dir && uj_saT == g_anchorBarTime)
P1875: 8466:             {
P1876: 8467:              if(InpDebugLog) PrintFormat("[SRJ-EA] UJDEFERAPPLY bar=%s dir=%s poi=%s - deferred LTF abort applies, holder unchanged (Fix S-a)", TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES), DirName(g_dir), AnchorStr());
P1877: 8468:              GoAbort(ABORT_LTF_MISALIGN, g_state);
P1878: 8469:              return;
P1879: 8470:             }
P1880: 8471:           else
P1881: 8472:             {
P1882: 8473:              if(InpDebugLog) PrintFormat("[SRJ-EA] UJDEFERDROP bar=%s dir=%s poi=%s - deferred LTF abort dropped, holder changed (Fix S-a)", TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES), DirName(g_dir), AnchorStr());
P1883: 8474:             }
P1884: 8475:           uj_saAbort = false;
P1885: 8476:          }
P1886: ```
P1887: 
P1888: ## 11 - Confirmation predicate source
P1889: 
P1890: ### Full current IsConfirmationCandle function - EA source lines 2337-2378
P1891: 
P1892: ```mql5
P1893: 2337:  bool IsConfirmationCandle(const int barShift, const int anchorLine,
P1894: 2338:                            const ENUM_SRJ_DIR dir, string &failTerm, const bool allowReclaim = false)
P1895: 2339:   {
P1896: 2340:    failTerm = "";
P1897: 2341:    if(anchorLine < 0 || dir == DIR_NONE) { failTerm = "NO_ANCHOR"; return false; }
P1898: 2342:    double o1 = iOpen (_Symbol, PERIOD_CURRENT, barShift + 1);
P1899: 2343:    double c1 = iClose(_Symbol, PERIOD_CURRENT, barShift + 1);
P1900: 2344:    double h1 = iHigh (_Symbol, PERIOD_CURRENT, barShift + 1);
P1901: 2345:    double l1 = iLow  (_Symbol, PERIOD_CURRENT, barShift + 1);
P1902: 2346:    double o0 = iOpen (_Symbol, PERIOD_CURRENT, barShift);
P1903: 2347:    double c0 = iClose(_Symbol, PERIOD_CURRENT, barShift);
P1904: 2348:    if(o1 <= 0.0 || c1 <= 0.0 || o0 <= 0.0 || c0 <= 0.0)
P1905: 2349:       { failTerm = "NO_DATA"; return false; }
P1906: 2350:    double L;
P1907: 2351:    if(!ReadBuf1(g_hPoi, anchorLine, L, barShift))
P1908: 2352:       { failTerm = "NO_LINE"; return false; }
P1909: 2353:     if(L == EMPTY_VALUE || L <= 0.0)
P1910: 2354:        { failTerm = "NO_LINE"; return false; }
P1911: 2355:     //--- [P-SLDEF-1 E14] N1 counters at the VWAP/POC site. Grounding: A2
P1912: 2356:     //--- needs c1 >= L (LONG) / c1 <= L (SHORT) - "applies to VWAP and POC
P1913: 2357:     //--- alike": exact equality passes. Family by line code.
P1914: 2358:     //--- [P-SLDEF-1b E19] A2 verdict flags: set where equality is encountered,
P1915: 2359:     //--- paired at each terminal return below (no branch touched).
P1916: 2360:     bool n1_vw = false, n1_poc = false;
P1917: 2361:     if(c1 == L)
P1918: 2362:       {
P1919: 2363:        if(StringFind(g_lineCode[anchorLine], "VWAP") >= 0) { g_n1_vwapEq++; n1_vw = true; }
P1920: 2364:        if(StringFind(g_lineCode[anchorLine], "POC") >= 0) { g_n1_pocEq++; n1_poc = true; }
P1921: 2365:       }
P1922: 2366:     bool oppCandle = (dir == DIR_LONG)  ? (c1 < o1) : (c1 > o1);
P1923: 2367:     if(!oppCandle)  { failTerm = "A_OPP"; if(n1_vw) g_n1_vwapInv++; if(n1_poc) g_n1_pocInv++; return false; }
P1924: 2368:     bool closeSideOk = (dir == DIR_LONG) ? (c1 >= L || (allowReclaim && o1 <= L && c0 >= o1)) : (c1 <= L || (allowReclaim && o1 >= L && c0 <= o1));
P1925: 2369:     if(!closeSideOk) { failTerm = "A2_CLOSE_BREAK"; if(n1_vw) g_n1_vwapInv++; if(n1_poc) g_n1_pocInv++; return false; }
P1926: 2370:     double body    = MathAbs(c0 - o0);
P1927: 2371:     bool   isDoji  = (body < _Point * 0.0001);
P1928: 2372:     bool   bodyDir = (dir == DIR_LONG)  ? (c0 > o0) : (c0 < o0);
P1929: 2373:     if(isDoji || !bodyDir) { failTerm = "B_BODY"; if(n1_vw) g_n1_vwapInv++; if(n1_poc) g_n1_pocInv++; return false; }
P1930: 2374:     bool touch = (h1 >= L - _Point && l1 <= L + _Point);
P1931: 2375:     if(!touch)      { failTerm = "C_TOUCH"; if(n1_vw) g_n1_vwapInv++; if(n1_poc) g_n1_pocInv++; return false; }
P1932: 2376:     if(n1_vw) g_n1_vwapSurv++; if(n1_poc) g_n1_pocSurv++;
P1933: 2377:     return true;
P1934: 2378:   }
P1935: ```
P1936: 
P1937: ## 12 - Trade API census
P1938: Current EA grep counts (same saved source identity as section 6): `CTrade` object declaration 1 at EA 13; `SetTypeFilling` calls 2 at EA 10799 and 11815; `PositionModify` calls 0; `SetAsyncMode` calls 0. This is a count of source occurrences: `MtReset` has one definition (EA 349) and one call (EA 10656); no second call site was found. These are source counts, not a claim about the standard-library default. The build packet must pin the actual async configuration and account margin mode before claiming server execution/readback timing.
P1939: ### Trade API declaration - EA source line 13
P1940: 
P1941: ```mql5
P1942: 13: CTrade g_trade;
P1943: ```
P1944: 
P1945: ### Existing trade setup - EA source lines 10796-10802
P1946: 
P1947: ```mql5
P1948: 10796:            { GoAbort(ABORT_BELOW_STOPS, g_state); return; }
P1949: 10797: 
P1950: 10798:          g_trade.SetExpertMagicNumber(magic);
P1951: 10799:          g_trade.SetTypeFilling(GetCorrectFillingMode(_Symbol));
P1952: 10800:          string comment = (g_sessionAtEntry == SESSION_LONDON) ? "SRJ-LONDON" : "SRJ-NYAM";
P1953: 10801: 
P1954: 10802:          bool tradeResult = false;
P1955: ```
P1956: 
P1957: ### Existing close trade setup - EA source lines 11815-11825
P1958: 
P1959: ```mql5
P1960: 11815:    g_trade.SetTypeFilling(GetCorrectFillingMode(_Symbol));
P1961: 11816:    bool ok = g_trade.PositionClose(ticket);
P1962: 11817:    long closerc = g_trade.ResultRetcode();
P1963: 11818:    ulong closedeal = g_trade.ResultDeal();
P1964: 11819:    long closepid = 0;
P1965: 11820:    int closeentry = -1;
P1966: 11821:    if(closedeal > 0 && HistoryDealSelect(closedeal))
P1967: 11822:      {
P1968: 11823:       closepid = HistoryDealGetInteger(closedeal, DEAL_POSITION_ID);
P1969: 11824:       closeentry = (int)HistoryDealGetInteger(closedeal, DEAL_ENTRY);
P1970: 11825:      }
P1971: ```
P1972: ## 13 - V9 controlling contract: reproduce valid trades and manage their exits
P1973: 
P1974: ### 13.1 Strategy ruling versus implementation proof
P1975: 
P1976: The operator has settled the 11 June New York USDJPY setup as valid: the 14:35 bar contains the Daily-POC LONG retest and confirmation, and the required entry is the 14:40 bar open at exactly 160.524. This is not a strategy question and must not be described as unresolved. The implementation question is whether the EA releases the flip-killed SHORT holder before it suppresses the LONG, then runs the LONG once through its ordinary confirmation, admission, alert, and entry path. If that path refuses the settled setup, the refusal is an implementation defect; release must not waive ordinary confirmation or any other settled guard. The current baseline did not produce the 14:40 LONG alert/admission/deal, so it does not prove a future fill.
P1977: 
P1978: ### 13.2 Closed-session target revisions are part of taking the trade correctly
P1979: 
P1980: A valid entry is not correctly managed if the EA changes only its internal target. When a newly closed session high (for a LONG) or low (for a SHORT) becomes the nearer valid target under the operator's existing target rules, the EA must create a target revision for that position and synchronize the broker TP to that exact revision. Re-evaluate each eligible closed-session directional extreme while the position remains open; each strictly nearer valid target is a new revision. Do not invent a target, use a still-forming session extreme, or change nearest-target/1R rules.
P1981: 
P1982: The RECON78 baseline proves the defect on two positions: 5 June London USDJPY SHORT model TP moved 159.900 to 159.908 while the broker TP stayed at 159.900 and filled there; 5 June New York USDJPY LONG model TP moved 160.723 to 160.298 and printed model TP_TOUCH while the broker TP stayed at 160.723, before the position stopped at 159.725 against SL 159.726. These are execution-model divergences, not proof that a revised broker target filled. Q1 must cover the target revision path and actual broker outcome, not just emit UJRETARGET or model TP_TOUCH.
P1983: 
P1984: This day-close path is a regression, not a new rule. The earlier EU run RECON57 already fired DAY_CLOSE on a real 4 September New York EURUSD position at 23:55 and matched the prior model (BUILDER_RESULT_RECON57-DEMOGUARD-V1.md, SHA-256 1E251DDA73FEA04B2287B32EA2E0B78885C64B0318368EFA65D8FA407CD03687, lines 41-44 and 94-96; EA tree 98F6BBAC). RECON78 instead marks the 5 June New York position internally MT_CLOSED on model TP_TOUCH while leaving the broker position open; after that state change the position can stop receiving the day-close evaluation. The 5 June New York AM high did exist and closed at 19:00 per Ruling-H; this packet does not claim it was absent. The fallback branch is still required: if no eligible closed-session high/low exists, or no broker TP deal has closed the position by the daily mark, the existing universal day-close behavior must flatten every managed trade at the first 23:55 verdict-day opening price (the day-close-minus-five mark), not leave it overnight. Require the actual same-PID broker closing deal and preserve higher-priority SL/valid TP/body-break ordering. A model TP_TOUCH while the broker TP is stale or unsynchronized must not retire management state or suppress the previously working day-close path. This is the June 5 management regression; the no-eligible-session-target branch is a future acceptance condition, not a claim about the 5 June NY high.
P1985: 
P1986: Historical proof carried on this page: `06_HANDOFFS/BUILDER_RESULT_RECON57-DEMOGUARD-V1.md` (2026-09-23; SHA-256 `1E251DDA73FEA04B2287B32EA2E0B78885C64B0318368EFA65D8FA407CD03687`; EA tree `98F6BBAC`). The result states:
P1987: 
P1988: > - DELIVERED (b) phantom-vs-real exit match, bar-for-bar with real fills at snapshot entries: 9/1 SL 17:50 at 1.15975; 9/4 DAY_CLOSE 23:55 at 1.16093; 9/7 TP_TOUCH 10:50 at 1.16200; 9/8 TP_TOUCH 10:40 at 1.16102; 17:00 SL 17:30 at 1.16274. Zero divergence vs RECON56 phantom rows.
P1989: > - HIT - 9/4 NY 15:55 LONG R1.66 (signal/entry/fill identical; tester holds 16:10 per his same-line rule to DAY_CLOSE 23:55 - his settled day-close discipline now realized WITH a position; exit-shape match).
P1990: 
P1991: That earlier EU execution is the precedent. The current UJ branch must preserve it while repairing the TP_TOUCH/broker-position state; this is not a request to invent or re-approve day-close behavior.
P1992: For each position instance, preserve PID, ticket, pair, direction, session/magic, trade sequence/admission bar, SL, current TP revision, retry/sync status, and close-resolution status. A second London/New York position must not overwrite the first instance. Retry and target changes must remain reachable after model TP_TOUCH while the broker position is open. BREAK, DAY_CLOSE, and SL legs remain evaluable during pending TP synchronization. A market exit that wins while TP sync is pending must resolve by a PID-matched closing deal before that instance retires; a sync failure never triggers a market-close fallback. Label pending/failed synchronization EXIT-UNSYNCED; label a confirmed model-only touch without a closing broker deal MODEL_ONLY. TP_TOUCH alone never proves a broker exit.
P1993: 
P1994: Require immediate capture of PositionModify's boolean and ResultRetcode. NO_CHANGES is a skip only when normalized TP readback already equals the requested target; otherwise it is a failed attempt. Confirm synchronization only with the accepted retcode, same PID/ticket, normalized TP equal to the revision, and normalized SL unchanged. Pin synchronous/asynchronous behavior and netting/hedging assumptions. Include nonzero ticket validation, candidate-only O6 block emission, no sequence/admission/SIGNAL/A6Fired/session-take consumption on a blocked candidate, correct session-to-magic mapping, and execute-mode MarkSessionUsed behavior.
P1995: 
P1996: ### 13.3 V396 conditions incorporated as implementation-packet requirements
P1997: 
P1998: All V396 Q1 conditions in BUILDER_RESULT_V396-GRADE.md §§Q1 and all V396 Q3 conditions in §§Q3 are binding requirements here, not claims that the EA already implements them. Specifically, the later implementation packet must show: (a) the complete S5-entry-through-EA-10618 pre-signal effect census or an earlier O6 gate, with zero burned admission/take side effects; (b) all g_mtrade resets, reads/writes, fill writes, and BREAK/DAY_CLOSE/SL paths migrated to position instances; (c) all return branches and the full same-pass pipeline through function end, including managed-record replacement, alert-only accounting, and execution; (d) all g_evictBits writes and proof that the consumed SHORT Daily-POC identity cannot evict the LONG Daily-POC candidate; (e) F11/S1WAIT/S2WAIT return coverage and once-only resolver/candidate processing; (f) neutral pre-decision suppression labeling; (g) phase-counter key (barTime, phase, candidate identity), with yield/drop and abort/consume sets disjoint; (h) complete target-modification call census, immediate retcode/readback rules, retry cap, async/account modes, close-deal identity, and exact migration; and (i) missing SEG 22656-22660 plus RECON78 binary/source/build provenance reconciliation. If physical rows or build identity cannot be found, state precisely that the supplied extract lacks them and leave the point unproven; do not infer UJSBTELEM absence or confirmation diagnostics.
P1999: 
P2000: Start the Q1 downstream diff at 5 June London 12:05, the earliest relevant post-retarget pass, and include every later relevant target revision. For acceptance, each revised TP must be followed by the same-PID full-volume DEAL_ENTRY_OUT with DEAL_REASON_TP at the exact revised value, after a successful modify/readback; SL must remain intact. Model 160.115 and Ask/deal 160.120 remain separate observations. No tolerance is granted.
P2001: 
P2002: ### 13.4 Goal ledger, preservation, and exact June 11 acceptance
P2003: 
P2004: The project goal remains the operator's full-journal bar: reproduce every valid taken trade for its reason, keep invalid/rejected setups silent, and do not claim deployment readiness from a partial run. The valid-trade register is the required inventory. Its seven audited EURUSD takes remain must-keep regression cases; the three registered USDJPY misses remain visible in the goal accounting. Q2, the June 5 New York 16:15 refusal question, remains closed under V396 and is not re-opened by this packet. Do not call it fixed, erase the registered miss, or claim the full goal is met. The June 5 London 09:45 entry must remain correct. The later June 5 New York 16:55 entry is not a substitute for the registered 16:15 entry, but its closed-session target/exit remains evidence for Q1 management.
P2005: 
P2006: For the June 11 case, acceptance is evaluated on the registered candidate identity (11 June, New York, USDJPY, LONG, Daily-POC): 14:35 retest-plus-confirmation; no 14:45+ selection evidence; exactly the 14:40 open at 160.524 for the entry; no spread tolerance, Ask relabeling, or rounding allowance. The challenger must be processed through normal fresh initialization and all settled pre-confirmation rules. Preserve June 8 invalid SHORT silence, the distinct June 9 never-reseeded refusal, June 5 London 09:45, one take per pair/session, and cross-session independence. Report the entry and each revised-target exit as separate exact observations.
P2007: 
P2008: ### 13.5 Council decision requested
P2009: 
P2010: Q1 - Is this complete contract sufficient to implement exact broker synchronization for each newly nearer closed-session target and the universal day-close fallback when no eligible target closes the position by the daily mark, while preserving all model and broker exit legs, instance identity, target revisions, retry behavior, and full-volume exact-deal proof? Give CONFIRM / OBJECT / DISCREPANCY, answer A (missing or contradictory contract terms) and B (exact event-level acceptance), and close Q1.
P2011: 
P2012: Q3 - Does this contract correctly separate the settled valid June 11 setup from the unproven EA execution path, and fully constrain same-pass release without bypassing normal confirmation/admission or processing the bar twice? Give CONFIRM / OBJECT / DISCREPANCY, answer A (missing or contradictory path/return/state evidence) and B (exact 160.524 acceptance and required preservation checks), and close Q3.
P2013: 
P2014: Answer separately with physical packet P-lines. Identify every remaining condition for an implementation packet. Q2 stays closed. This council review is design only. It does not authorize source edits, builds, tester runs, keys, live actions, commits, or pushes. After disposition, any OpenCode implementation handoff requires separate authorization and must retain all V396 conditions.
