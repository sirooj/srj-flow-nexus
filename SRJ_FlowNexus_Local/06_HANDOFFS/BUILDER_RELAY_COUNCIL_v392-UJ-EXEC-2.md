# BUILDER RELAY COUNCIL v392-UJ-EXEC-2 - packet P-RECON78-UJ-EXEC-1 v3 (June UJ implementation)
Status: V392 DRAFT - implementation review. Packet SHA-256 67D02A4FF391A59D0C1AFC6A40F57C8622607FECBFD822F37BEAF1AF95410855 / 18144 bytes / 131/131 physical lines; twin must be exact 131/131/131/131, PSEQ P001-P131. Disk execution facts are checked by Luna on the operator machine, not independently by the reviewer seats.
Round status: CONTINUE of the June UJ review (not NEW). V391 was the page-only review: Luna Q1/Q2/Q3 CONFIRM; Sonnet Q1 CONFIRM-conditional, Q2 DISCREPANCY, Q3 CONFIRM-narrowed-to-14:35; GLM Q1/Q2/Q3 CONFIRM. This v3/V392 implements the confirmed diagnoses; Q2 carries no code edit (print-only exhibits plus one owed operator question).
Project boundary: SRJ Flow Nexus EA is alert-only; no live trades or funded-money movement. The prior one-run authorization was consumed by RECON78. This relay authorizes no source edit, build, tester run, key request, live activation, commit, or push.
Scope: rule on the Q1 broker-TP sync spec (section 2), the Q2 no-edit disposition with its exhibit battery and operator question O3 (section 3), and the Q3 same-pass reorder narrowed to the 14:35 pass (section 4). Operator questions O1-O5 ride for his word; council notes which block progress but invents no strategy rule. Strategy authority remains the operator's later settled rules.

## Q1 - UjSyncBrokerTp at the retarget branch
Q1 verdict: CONFIRM / OBJECT / DISCREPANCY.
Ask A: does the specified helper (select by ticket/entryPid, PositionModify with live SL, UJTPMODIFY/FAIL/NOPOS rows, idempotent skip, per-bar retry, retarget-branch siting) follow from exhibits E6-E8 and the 0x PositionModify census? Rule on the orphan-hold proposal versus the reconciliation-print alternative; state which you adopt.
Ask B: is the relative acceptance predicate (UJRETARGET unchanged, same-bar modify success, actual TP-trigger deal at the revised level, SL byte-unchanged, zero modifies on UJNORETARGET trades, orphan count zero, London entry-only) complete and gradeable from actual deals?

## Q2 - June 5 NY 16:15: no gate edit
Q2 verdict: CONFIRM / OBJECT / DISCREPANCY.
Ask A: does the exhibit battery (B2 gate, H1 condition/write, zero-June-5 UJRESEED census, 16:05 triple rows, 16:50 RGATE Al=1 row, 6/9 twin-tuple rows, 6/4 wrong-direction rows) support print-only disposition with the defect-attribution dissent left to operator question O3? Say whether any code edit is supported.
Ask B: is the register row-2 old-to-new correction accurate, and is withholding the register edit until V392 clears the right boundary?

## Q3 - June 11 NY 14:40: same-pass reorder
Q3 verdict: CONFIRM / OBJECT / DISCREPANCY.
Ask A: does the narrowed 14:35-pass claim follow from exhibits (wouldPreempt hardcode, S-a set/apply/clear) plus the v2 row sequence? Is the adopted narrowing (14:20-14:30 as context only) correct?
Ask B: pick reorder form (a) or (b) with reasons, or name the narrower third form; rule on the stated unresolved list (LONG confirmation, candidate lifetime, O4 tie, downstream gates, deal-6 confound ordering) and on the acceptance predicate including O5 tolerances.

Answer packaging: give one verdict separately for each question, answer A and B, cite packet physical P-lines, list every additional defect/gap, state conditions/missing evidence, and close Q1/Q2/Q3 separately. The packet is the full page; do not ask for files. A Sonnet refusal to state a verdict is NO-VERDICT per the operator's standing direction, never an OBJECT or automatic rejection to build; it also does not supply a second confirmation or itself authorize a build.
Verification split: the reviewer seats judge only the pasted page. Luna owns disk checks of source, packet hash, and actual tester deals. No council opinion grants a key, build/run word, or operator strategy authority.
Operator carry: paste this whole relay identically to Sonnet and GLM and bring both complete replies back verbatim, with each source identified.

## Twin (packet P-RECON78-UJ-EXEC-1 v3, exact mechanical splice from saved bytes; PSEQ P001-P131)
P001: # PACKET P-RECON78-UJ-EXEC-1 v3 - June UJ implementation: broker-TP sync, seed-provenance prints, same-pass arbitration reorder
P002: 
P003: Status: v3 DRAFT for implementation review by Sonnet and GLM. CONTINUE of the June UJ review after V391 triple verdicts (Luna Q1/Q2/Q3 CONFIRM; Sonnet Q1 CONFIRM-conditional, Q2 DISCREPANCY, Q3 CONFIRM-narrowed-to-14:35; GLM Q1/Q2/Q3 CONFIRM). No EA edit, build, tester run, live action, or deployment is authorized by this packet. The prior one-run grant stays consumed. Council rules implementation scope and acceptance; operator strategy rules remain governing.
P004: 
P005: ## 1 - Aim, order, and what v3 changes from v2
P006: 
P007: Implement the three V391-confirmed diagnoses in dependency order (Sonnet overall: Q1 sync, then Q2 provenance prints, then Q3 re-admission, so confounds clear in that order): (a) a same-bar broker-TP amendment at the closed-session retarget branch; (b) print-only seed-provenance exhibits plus the owed operator 5m question, with NO Q2 gate edit; (c) a same-pass arbitration reorder so a flip-killed holder cannot veto before its deferred abort applies. v3 repairs the v2 page defects both seats caught: stale P-trailer, unannotated June-4 ABORT splice (replaced by the June-5 row), and register staleness (explicit old-to-new below, applied only after V392 clears).
P008: 
P009: ## 2 - Q1 spec: UjSyncBrokerTp at the retarget branch
P010: 
P011: At EA 11912-11923, immediately after `g_mtrade.tpRef = uj_rtPx`, call a new narrow helper that selects the open position by `g_mtrade.ticket`/`entryPid`; if open and normalized position TP differs from `uj_rtPx`, calls `g_trade.PositionModify(ticket, <live position SL unchanged>, uj_rtPx)`; logs `UJTPMODIFY bar ticket old new sl rc` on success and `UJTPMODIFY_FAIL` with retcode on failure, never silent; skips idempotently when already equal; logs `UJTPMODIFY_NOPOS` when no open position. The CTrade object exists (EA 13, counted 1x) while `PositionModify` counts 0x by two patterns: the leg is absent, not broken.
P012: Retry rule (Sonnet): while the position stays open with unchanged `tpRef` and broker TP still differs, re-attempt each bar; every reject prints. The sync sits in the retarget branch only, never in the MTEXIT leg (EA 12036-12068): by the touch bar it is too late. Managed-close for the TP leg is rejected (GLM): `MtCloseBrokerPosition` performs a market `PositionClose` (EA 11815-11818) with retcode/deal accounting (EA 11826-11829), which would convert a broker-owned resting TP into an EA market fill, contradicting P027 exact-fill semantics and the BREAK/DAY_CLOSE priority legs. Luna's managed-close fallback stays parked.
P013: Orphan rule (Sonnet defect, council to rule): once the model sets MT_CLOSED, NOTHING-TO-CLOSE aside, no leg owns the live broker position (deal 6 survived its day close, the weekend, and four more closes to the stop). v3 proposes the model hold MT_MANAGING until broker-confirmed exit (MTCLOSE flat=1 or TP trigger deal), with MTEXIT/MTLIFE marked provisional until then. If council rejects, the alternative (a nightly orphan reconciliation print plus vanish count) must be named, not assumed.
P014: Crossed-branch operator question O1: if price already crossed the revised level when the retarget computes, the broker rejects a TP on the wrong side; whether the rule then means a market close is yours to state - code decides nothing here. Not exercised in RECON78 (retarget 19:05, touch 19:15).
P015: Pin wording O2: the pin says closed-session HIGH while the code takes the session extreme symmetric by direction (EA 1920-1924: LONG high, SHORT low); London SHORT retargeted 159.900 to 159.908 on the same path. Confirm the symmetry is intended.
P016: Acceptance is relative (Sonnet: Q2 changes the entry, so nothing hard-codes deal 6 or 160.120): per retargeted instance, UJRETARGET row unchanged, same-bar UJTPMODIFY success plus tester modify event to 160.298/159.908, actual TP-trigger deal at the revised level on the retarget day, no later-day stop, SL values byte-unchanged (159.726/159.972), zero modify rows on UJNORETARGET trades, orphan count zero. London acceptance is entry-only (a sync moves its actual exit 159.900 to 159.908, rule-conformant but 0.8 pips worse).
P017: 
P018: ## 3 - Q2: no gate edit; exhibit battery plus the owed 5m question
P019: 
P020: The B2 gate (EA 8414-8421) kills an M15-aligned candidate exactly when provenance fails: `seedBiasAl == 0` AND no recorded directional reseed. Reseed records only on opposite-retest over an unconfirmed holder (Fix H1, EA 7877-7880 sets the print; EA 7900-7901 writes `g_ujOpReseedBarTime/Dir`). Run-wide UJRESEED census is 10 hits with ZERO on June 5: no reseed event fired in NYAM before 16:00, so epoch provenance at 16:05 is input-correct, not a missed recording. The 16:55 take passed because the gate inputs changed, not the gate: SIDE1R_RGATE at the 16:50 pass reads `seedBT=2026.06.05 16:45 seedBiasAl=1` (SEG 14043). The 6/9 09:45 keep carries the byte-identical epoch tuple and was killed too (SEG 16535/16566); the 6/4 11:45 refusal had a recorded reseed of the WRONG direction (SEG 10762 reseedDir=-1 vs LONG) and stays refused as an unregistered negative control. Code therefore cannot separate valid-16:15 from keep-silent-6/9 on these rows: Sonnet DISCREPANCY sustained on attribution, Luna/GLM CONFIRM sustained on the observed refusal.
P021: Owed operator question O3: at 6/5 16:00 was `seedBiasAl=0` rule-correct (5m not yet flipped), making the 16:05 refusal correct behavior? If yes, 16:15 validity becomes a validity-vs-gate matter for your word, never a code inference. If no, name the 16:00-bar 5m evidence and v4 carries a provenance-spec change.
P022: Row battery (mechanical splice from the archived journal, SEG = 1-indexed journal line):
P023: SEG 13692 HO	0	16:43:11.995	Core 04	2026.06.05 16:05:00   [SRJ-EA] UJPROV bar=2026.06.05 16:00 dir=LONG reseedBar=1970.01.01 00:00 seedBiasAl=0 reseedDir=0 exempt=0 - reseed provenance at S2 edge (Fix CARRY)
P024: SEG 13693 QD	0	16:43:11.995	Core 04	2026.06.05 16:05:00   [SRJ-EA] S2SEEDBIAS_KILL bar=2026.06.05 16:00 dir=LONG poi=Daily-POC - seedbias refused, promotion killed (Fix B2)
P025: SEG 13694 GP	0	16:43:11.995	Core 04	2026.06.05 16:05:00   [SRJ-EA] 2026.06.05 16:05:00 ABORT reason=SEEDBIAS_REFUSED state=S2_LTF_ALIGN poi=Daily-POC dir=LONG
P026: SEG 13695 CO	0	16:43:11.995	Core 04	2026.06.05 16:05:00   [SRJ-EA] A6REFUSED class=ABSENT_DECLINED bar=2026.06.05 16:05 state=S2_LTF_ALIGN dir=LONG predicate=SEEDBIAS_REFUSED
P027: SEG 16535 MQ	0	16:54:18.682	Core 04	2026.06.09 09:50:00   [SRJ-EA] UJPROV bar=2026.06.09 09:45 dir=SHORT reseedBar=1970.01.01 00:00 seedBiasAl=0 reseedDir=0 exempt=0 - reseed provenance at S2 edge (Fix CARRY)
P028: SEG 16566 HJ	0	16:54:24.798	Core 04	2026.06.09 09:55:00   [SRJ-EA] S2SEEDBIAS_KILL bar=2026.06.09 09:50 dir=SHORT poi=Weekly-VWAP - seedbias refused, promotion killed (Fix B2)
P029: SEG 10762 QP	0	16:35:39.439	Core 04	2026.06.04 11:50:00   [SRJ-EA] UJPROV bar=2026.06.04 11:45 dir=LONG reseedBar=2026.06.04 10:20 seedBiasAl=0 reseedDir=-1 exempt=0 - reseed provenance at S2 edge (Fix CARRY)
P030: SEG 10763 JK	0	16:35:39.439	Core 04	2026.06.04 11:50:00   [SRJ-EA] S2SEEDBIAS_KILL bar=2026.06.04 11:45 dir=LONG poi=Daily-POC - seedbias refused, promotion killed (Fix B2)
P031: SEG 14043 MI	0	16:43:24.215	Core 04	2026.06.05 16:55:00   [SRJ-EA] SIDE1R_RGATE evalBar=2026.06.05 16:50 seedBT=2026.06.05 16:45 dir=LONG seedBiasAl=1 rLive=1.56 livePass=1 slRef=159.726
P032: 
P033: ## 4 - Q3: same-pass reorder, claim narrowed to the 14:35 pass
P034: 
P035: Adopted narrowing (Sonnet): the defect instance is the 14:40:22 pass evaluating 14:35 only; 14:20-14:30 rows stay context (the SHORT was not yet flipped there and the page defines no expiry criterion). At 14:40:22 the holder was already flip-killed (LTFFLIP + UJDEFERABORT logged) when it vetoed the LONG, and the deferred abort applied after. Root mechanism on disk: `wouldPreempt` is hardcoded to `(g_state == ST_S2_LTF_ALIGN)` (EA 7841), so an S4_ARMED holder vetoes every challenger by construction; opposite transfer is bounded to S2/S1 (EA 7904-7913, v2 excerpt D).
P036: Correction, two equivalent narrow forms (council to pick one): (a) move the UJDEFERAPPLY block (EA 8462-8469) ahead of the preemption evaluation within the pass, reusing the abort machinery unchanged; (b) keep order but treat a holder with a pending identity-matched deferred abort (`uj_saAbort` with anchor/dir/barTime match, EA 8465) as already expired for preemption only. Form (b) touches holder eligibility alone. Neither touches tier bounds, timeouts, confirm-once timing, or the S-a deferral itself (Fix S-a rationale exhibited at EA 7450-7456: M15-opposed without confirmation-carve defers past evaluation so the holder is fully evaluated first; v3 keeps that evaluation, only the veto use changes). Stale-abort clearing already exists (EA 8475) plus the holder-changed drop row (EA 8471-8474).
P037: Unresolved, honestly stated: no live LONG CONFIRMPOLL exists in RECON78 (release does not guarantee a fill); candidate lifetime after HELD is unproven (drop vs retain decides whether post-apply re-admission is even possible); the same-bar flip-and-confirm tie is yours (O4: keep current order, June 11 has confirm=0 so the tie is unexercised); Q2 provenance and R/spread gates apply to the released LONG afterwards; deal-6-open confound means control silence needs decision-row reasons (Sonnet), so Q1 lands first in run order.
P038: Acceptance: 14:20-14:30 rows identical (no earlier release); at the 14:40 pass the SHORT abort row family still present and SHORT never enters; LONG admitted for the register reason with a live `shadow=false` LONG poll `confirm=1` on eval 14:35; ALERT plus market-buy deal at the 14:40 open within pre-agreed tolerance of 160.524 (O5 also covers TP-fill exactness and the bid/ask same-bar rule: model touches bid bars, broker SHORT exits ask, so the predicate must not require the same bar); exactly one June-11 NYAM take; no 14:45+ evidence; controls silent with rows (6/8 flip-kill, 6/9 UJPROV, London entry unchanged, 6/3 unchanged, 6/4 11:50 refused).
P039: 
P040: ## 5 - Source exhibits (byte-exact from EA E80FF0C2 tree, read 2026-10-02)
P041: 
P042: B2 gate, EA 8414-8421 (UJPROV print plus kill predicate):
P043: ```mql5
P044:          if(InpDebugLog) PrintFormat("[SRJ-EA] UJPROV bar=%s dir=%s reseedBar=%s seedBiasAl=%d reseedDir=%d exempt=%d - reseed provenance at S2 edge (Fix CARRY)", TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES), DirName(g_dir), TimeToString(g_ujOpReseedBarTime, TIME_DATE|TIME_MINUTES), s1g_seedBiasAl, g_ujOpReseedDir, ((uj_m15r && uj_m15b == uj_wantb && (s1g_seedBiasAl != 0 || (g_ujOpReseedBarTime != 0 && g_ujOpReseedDir != 0 && g_ujOpReseedDir == (g_dir == DIR_LONG ? 1 : (g_dir == DIR_SHORT ? -1 : 0))))) ? 1 : 0));
P045:          if(uj_m15r && uj_m15b == uj_wantb && (s1g_seedBiasAl != 0 || (g_ujOpReseedBarTime != 0 && g_ujOpReseedDir != 0 && g_ujOpReseedDir == (g_dir == DIR_LONG ? 1 : (g_dir == DIR_SHORT ? -1 : 0)))))
P046:            { double uj_ltfb = 0.0; int uj_ltfOk = ReadFlow(FL_BUF_LTF_BIAS, uj_ltfb, barShift) ? 1 : 0;
P047:              int uj_m15s = (int)iTime(_Symbol, PERIOD_CURRENT, barShift);
P048:              datetime uj_m15src = (datetime)(uj_m15s - uj_m15s % 900);
P049:              if(InpDebugLog) PrintFormat("[SRJ-EA] S2PROMOTE_M15 bar=%s dir=%s poi=%s sess=%s m15=%s m15src=%s ltf=%s sb=%d rf=%d/%d", TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES), DirName(g_dir), AnchorStr(), SessionName(g_sessionAtEntry), DoubleToString(uj_m15b, 1), TimeToString(uj_m15src, TIME_DATE|TIME_MINUTES), UjDbl(uj_ltfb), s1g_seedBiasAl, (uj_m15r ? 1 : 0), uj_ltfOk); }
P050:          else if(uj_m15r && uj_m15b == uj_wantb)
P051:            { if(InpDebugLog) PrintFormat("[SRJ-EA] S2SEEDBIAS_KILL bar=%s dir=%s poi=%s - seedbias refused, promotion killed (Fix B2)", TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES), DirName(g_dir), AnchorStr()); GoAbort(ABORT_SEEDBIAS_REFUSED, g_state); return; }
P052: ```
P053: H1 reseed condition plus write, EA 7877-7880 and EA 7900-7901:
P054: ```mql5
P055:               if(!t78_opConf && !t78_heldConf && !SessionAlreadyUsed(sess, barTime) && (t78_pr.topLine != g_anchorLine || t78_dir != g_dir))
P056:                 {
P057:                  bool t78_al = false; bool t78_alOk = CheckLtfAlign(barShift, t78_dir, t78_al);
P058:                  if(InpDebugLog) PrintFormat("[SRJ-EA] UJRESEED bar=%s poi=%s dir=%s fromPoi=%s fromDir=%s al=%d ok=%d - op-retest reseeded over unconfirmed holder (Fix H1)", TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES), g_lineCode[t78_pr.topLine], DirName(t78_dir), g_lineCode[g_anchorLine], DirName(g_dir), (t78_alOk ? (t78_al ? 1 : 0) : -1), (int)t78_alOk);
P059: ```
P060: ```mql5
P061:                  g_ujOpReseedBarTime = barTime;
P062:                  g_ujOpReseedDir = (g_dir == DIR_LONG ? 1 : (g_dir == DIR_SHORT ? -1 : 0));
P063: ```
P064: S-a deferral set, EA 7450-7456, and apply/drop/clear, EA 8462-8476:
P065: ```mql5
P066:           if((uj_hm15r && uj_hm15 == uj_hwant) || uj_hcarve)
P067:             { if(InpDebugLog) PrintFormat("[SRJ-EA] UJLTFHOLD bar=%s dir=%s poi=%s state=%s m15=%s rf=%d mode=%s term=%s - LTF opposed, hold (Fix F11)", TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES), DirName(g_dir), AnchorStr(), StateName(g_state), DoubleToString(uj_hm15, 1), (uj_hm15r ? 1 : 0), ((uj_hm15r && uj_hm15 == uj_hwant) ? "M15" : "CARVE"), uj_hterm); }
P068:           else
P069:             {
P070:              uj_saAbort = true; uj_saA = g_anchorLine; uj_saD = (int)g_dir; uj_saT = g_anchorBarTime;
P071:              if(InpDebugLog) PrintFormat("[SRJ-EA] UJDEFERABORT bar=%s dir=%s poi=%s state=%s - LTF opposed, abort deferred past evaluation (Fix S-a)", TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES), DirName(g_dir), AnchorStr(), StateName(g_state));
P072:             }
P073: ```
P074: ```mql5
P075:        //--- [v20 S-a] deferred-abort application (identity-keyed on anchor+dir+barTime; set in Fix F11 tail).
P076:        if(uj_saAbort)
P077:          {
P078:           if(uj_saA == g_anchorLine && uj_saD == (int)g_dir && uj_saT == g_anchorBarTime)
P079:             {
P080:              if(InpDebugLog) PrintFormat("[SRJ-EA] UJDEFERAPPLY bar=%s dir=%s poi=%s - deferred LTF abort applies, holder unchanged (Fix S-a)", TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES), DirName(g_dir), AnchorStr());
P081:              GoAbort(ABORT_LTF_MISALIGN, g_state);
P082:              return;
P083:             }
P084:           else
P085:             {
P086:              if(InpDebugLog) PrintFormat("[SRJ-EA] UJDEFERDROP bar=%s dir=%s poi=%s - deferred LTF abort dropped, holder changed (Fix S-a)", TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES), DirName(g_dir), AnchorStr());
P087:             }
P088:           uj_saAbort = false;
P089:          }
P090: ```
P091: Preemption recorder plus wouldPreempt hardcode, EA 7830-7842:
P092: ```mql5
P093:           if(InpDebugLog && t78_opp)
P094:             {
P095:              int s1h_newTier  = g_authorityRank[t78_pr.topLine] / 2;
P096:              int s1h_heldTier = g_authorityRank[g_anchorLine]   / 2;
P097:              PrintFormat("[SRJ-EA] SIDE1H_WOULDPREEMPT bar=%s newPoi=%s newDir=%s heldPoi=%s heldDir=%s heldState=%s newTier=%d heldTier=%d wouldPreempt=%d wouldTierPassLegacy=%d",
P098:                          TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift),
P099:                                       TIME_DATE|TIME_MINUTES),
P100:                          g_lineCode[t78_pr.topLine], DirName(t78_dir),
P101:                          g_lineCode[g_anchorLine], DirName(g_dir),
P102:                          StateName(g_state),
P103:                          s1h_newTier, s1h_heldTier,
P104:                          ((g_state == ST_S2_LTF_ALIGN) ? 1 : 0),
P105:                          (t78_tier ? 1 : 0));
P106: ```
P107: Symmetric session extreme, EA 1920-1924:
P108: ```mql5
P109:        if(uj_newest == 0) { uj_newest = bk; uj_oldest = bk; }
P110:        else uj_oldest = bk;
P111:        double v = (t.dir == DIR_LONG) ? iHigh(_Symbol, PERIOD_CURRENT, k) : iLow(_Symbol, PERIOD_CURRENT, k);
P112:        if(v <= 0.0) continue;
P113:        if(!have || (t.dir == DIR_LONG && v > ext) || (t.dir == DIR_SHORT && v < ext)) { ext = v; have = true; }
P114: ```
P115: Market-close mechanism (why TP leg must not reuse it), EA 11815-11818:
P116: ```mql5
P117:    g_trade.SetTypeFilling(GetCorrectFillingMode(_Symbol));
P118:    bool ok = g_trade.PositionClose(ticket);
P119:    long closerc = g_trade.ResultRetcode();
P120:    ulong closedeal = g_trade.ResultDeal();
P121: ```
P122: 
P123: ## 6 - Register corrections carried old-to-new (applied only after V392 clears)
P124: 
P125: R1 section B title old: `## B. UJ VALID MISSED - his 3, NONE taken by the EA (blind window 1-13 June 2026)` / new: `## B. UJ VALID MISSED - his 3; RECON78 reproduced 5 June London 09:45 entry (deal 4 at 159.948, TP deal 5 at 12:19:21)` (header line only; rows keep their numbers).
P126: R2 row 2 Refuse old: `16:10 NO_TP_TARGET, 5 levels invalid [R63 QO]` / new: `RECON78 16:05 SEEDBIAS_REFUSED: UJPROV epoch SEG 13692, S2SEEDBIAS_KILL SEG 13693, ABORT SEG 13694`.
P127: R3 row 1 Cause append: `RECON78: entry reproduced at 09:45 (deal 4, 159.948); exit graded under Q1 (model 159.908 vs broker 159.900)`.
P128: 
P129: ## 7 - Run and scope boundary
P130: 
P131: No build/run is requested in this review round. Any implementation needs a fresh council disposition plus an exact new Luna key and operator run word. Same window 2026-06-01 to 2026-06-13, InpDebugLog=true, InpMode=1 on any future run. No EU run or EU behavior is in scope. Live trading is prohibited.

## Review answer form
For each question give one verdict line (`Q1: CONFIRM / OBJECT / DISCREPANCY`; `Q2: CONFIRM / OBJECT / DISCREPANCY`; `Q3: CONFIRM / OBJECT / DISCREPANCY`), then answer both A and B, cite packet lines, list every additional defect/gap, and state conditions or missing evidence. Review only the pasted packet. No code key or operator strategy ruling is requested.
