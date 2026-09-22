CODE REVIEW REQUEST - v203 - 2026-09-20 (CLEARANCE: PACKET_P-EXITGATE-1 v1, one build plus one run; nothing builds or spends on this verdict alone)

Project brief (standing - read first):
- Money: clearance ask for exactly one build plus one tester run under the stated envelope. Alert-only EA. No live trades. No funded money moves on any verdict here. Build and run only on dual-key clear plus his run word plus token. Nothing here builds, runs, or spends by itself.
- People: one operator (trader, strategy owner, money authority) plus AI seats. No second human reviewer - declined, his call. He carries every text both ways verbatim. That carry IS the anti-fake check: he compares what a seat sent with what got filed.
- History: exit thread - v202 relay (3A4D9AE9F8C85849ACA8DB171D8800D5A574D5F4D7D28F298CE9A16EC5378C91/18465 B/224 lines) ruled amend-with-delta by Luna-V202-001 plus Sonnet-V202-001 plus GLM-V202-001 (filed whole 1x each, zero halts, no key line yet); his break-retest rule plus booked-TP discipline (srj-strategy skill); P-EXITMODEL executed 161-O carried in-tree. EXT1LIVE v201 round closed separately (RECON50 passed).
- Your verdict: rules on the page only (code lines, numbers, logic). Disk truth (digests, logs, builds) is proven on his machine, never in chat. Keys come only from the key seat. No ruling here builds code, runs anything, or spends money.

Change (one plain sentence): clear PACKET_P-EXITGATE-1 v1 by name for exactly one build (E-b gate to booked-TP touch plus exit-price plus instrumentation rail, STAGE-1 exact-diff gated) plus one run under the RECON50 envelope with G1-G4 graded as stated.

Money (standing): behavior-change build confined to the exit engine E-b plus log rail. Alert-only EA. No live trades. No funded money moves on any verdict here. Build and run only on dual-key clear plus his run word plus token. No commit without token.
Session: CONTINUE previous council session (the v202 thread, same seats; this page repeats every operative literal so no seat memory is required). Prior texts ride labeled with file plus marker plus digest, never as anyone's words.
Packet: 01_TASKS\PACKET_P-EXITGATE-1.md v1 DRAFT: 818621D524BCC6FBCEDA8CCF62A3B4777EA835C6D80047D3A2029017A44F4504 / 8713 B / 40 lines (E1 gate, E2 price, E3 keep-walk, E4 rail, G1-G4, run cost). Pre-build tree: A897790523AE06A47F89D8E8301E317529D97661447CE23D57551D065E3BAED9 / 614371 B / 11235 lines (v38, uncommitted; STAGE-1 halts on drift).
Seat packaging: identical text to Luna plus Sonnet plus GLM; keys volunteered only; any seat halts on a checkable discrepancy with line numbers.

E1 OLD (whole EA L11097-L11102, pulled from disk this turn, byte-exact):
   //--- (b) TP: the CURRENT nearest valid target (Q6), exit on TOUCH (5.1/2.2)
   if(haveTp)
     {
      if(g_mtrade.dir == DIR_LONG  && h >= curTp) vTP = true;
      if(g_mtrade.dir == DIR_SHORT && l <= curTp) vTP = true;
     }

E1 NEW (packet literal, ruled by v202 consensus; build gated by exact-diff):
    //--- (b) TP: the BOOKED target (tpRef) only, exit on TOUCH. Break-retest
    //--- rule 2026-09-20 (E4A85FD4): touch/retest of non-booked lines does
    //--- nothing once entered; only body-close break (E-c) exits early.
    bool tpBookedTouch = false;
    if(g_mtrade.tpRef != EMPTY_VALUE && g_mtrade.tpRef > 0.0)
      {
       if(g_mtrade.dir == DIR_LONG  && h >= g_mtrade.tpRef) tpBookedTouch = true;
       if(g_mtrade.dir == DIR_SHORT && l <= g_mtrade.tpRef) tpBookedTouch = true;
      }
    bool tpRecomputeTouch = false;
    if(haveTp)
      {
       if(g_mtrade.dir == DIR_LONG  && h >= curTp) tpRecomputeTouch = true;
       if(g_mtrade.dir == DIR_SHORT && l <= curTp) tpRecomputeTouch = true;
      }
    if(tpRecomputeTouch && !tpBookedTouch) g_n1_tpRecomputeSupp++;
    if(tpBookedTouch) vTP = true;

E2 OLD (whole EA L11195, pulled from disk this turn, byte-exact):
   else if(vTP)    { g_mtrade.exitReason = MT_EXIT_TP_TOUCH;       g_mtrade.exitPrice = curTp; }

E2 NEW (packet literal):
    else if(vTP)    { g_mtrade.exitReason = MT_EXIT_TP_TOUCH;       g_mtrade.exitPrice = g_mtrade.tpRef; }

E4 DECL OLD (whole EA L1054-L1055, pulled from disk this turn, byte-exact):
   if(g_mtrade.state == MT_PENDING_FILL)
     {

E4 DECL NEW (packet literal):
    //--- [P-EXITGATE-1] suppressed recompute touches (diagnostic)
    int              g_n1_tpRecomputeSupp = 0;

E4 LOG OLD (whole EA L11176-L11187, pulled from disk this turn, byte-exact):
   if(InpDebugLog)
      PrintFormat("[SRJ-EA] EXITVERDICT bar=%s dir=%s entry=%s curTp=%s vSL=%d "
                  "vTP=%d vBREAK=%s vHTF=%d scope=%d "
                  "htfH=%g htfM=%g htfL=%g want=%d anti=%d",
                  TimeToString(barTime, TIME_DATE|TIME_MINUTES),
                  DirName(g_mtrade.dir),
                  DoubleToString(g_mtrade.entryPrice, _Digits),
                  (haveTp ? DoubleToString(curTp, _Digits) : "none"),
                  (int)vSL, (int)vTP,
                  (vBREAK ? breakLineName : "none"),
                  (int)vHTF, (int)MT_EXIT_SCOPE,
                  mtlH, mtlM, mtlL, mtlWant, mtlAnti);

E4 LOG NEW (packet literal):
    if(InpDebugLog)
      PrintFormat("[SRJ-EA] EXITVERDICT bar=%s dir=%s entry=%s curTp=%s vSL=%d "
                   "vTP=%d vBREAK=%s vHTF=%d scope=%d "
                   "htfH=%g htfM=%g htfL=%g want=%d anti=%d tpB=%s h=%s l=%s sup=%d",
                   TimeToString(barTime, TIME_DATE|TIME_MINUTES),
                   DirName(g_mtrade.dir),
                   DoubleToString(g_mtrade.entryPrice, _Digits),
                   (haveTp ? DoubleToString(curTp, _Digits) : "none"),
                   (int)vSL, (int)vTP,
                   (vBREAK ? breakLineName : "none"),
                   (int)vHTF, (int)MT_EXIT_SCOPE,
                   mtlH, mtlM, mtlL, mtlWant, mtlAnti, DoubleToString(g_mtrade.tpRef, _Digits), DoubleToString(h, _Digits), DoubleToString(l, _Digits), g_n1_tpRecomputeSupp);

G1 PREDICTIONS (booked MTLIFE tp= vs MTEXIT exit= on RECON50 43AB634D; equality counts as touch; six suppressed plus one kept):
DF	0	21:22:16.255	Core 04	2026.08.28 10:50:08   [SRJ-EA] MTLIFE fields=11 openBar=2026.08.28 10:05 dir=SHORT entry=1.16466 sl=1.16508 tp=1.16322 verdict=TP_TOUCH closeBar=2026.08.28 10:45 closePx=1.16459 openAtNewsStart=0 openAtDayClose=0 openAtWeekClose=0
JH	0	21:22:16.255	Core 04	2026.08.28 10:50:08   [SRJ-EA] MTEXIT bar=2026.08.28 10:45 reason=TP_TOUCH line=- lineVal=- entry=1.16466 exit=1.16459
QD	0	21:23:23.392	Core 04	2026.08.28 16:30:00   [SRJ-EA] MTLIFE fields=11 openBar=2026.08.28 16:25 dir=SHORT entry=1.16430 sl=1.16508 tp=1.16322 verdict=TP_TOUCH closeBar=2026.08.28 16:25 closePx=1.16416 openAtNewsStart=0 openAtDayClose=0 openAtWeekClose=0
GN	0	21:23:23.392	Core 04	2026.08.28 16:30:00   [SRJ-EA] MTEXIT bar=2026.08.28 16:25 reason=TP_TOUCH line=- lineVal=- entry=1.16430 exit=1.16416
OH	0	21:43:56.301	Core 04	2026.09.04 16:05:01   [SRJ-EA] MTLIFE fields=11 openBar=2026.09.04 16:00 dir=LONG entry=1.16018 sl=1.15847 tp=1.16315 verdict=TP_TOUCH closeBar=2026.09.04 16:00 closePx=1.16017 openAtNewsStart=0 openAtDayClose=0 openAtWeekClose=0
RO	0	21:43:56.301	Core 04	2026.09.04 16:05:01   [SRJ-EA] MTEXIT bar=2026.09.04 16:00 reason=TP_TOUCH line=- lineVal=- entry=1.16018 exit=1.16017
EL	0	21:46:59.404	Core 04	2026.09.07 09:40:01   [SRJ-EA] MTLIFE fields=11 openBar=2026.09.07 09:20 dir=LONG entry=1.16135 sl=1.16098 tp=1.16315 verdict=TP_TOUCH closeBar=2026.09.07 09:35 closePx=1.16188 openAtNewsStart=0 openAtDayClose=0 openAtWeekClose=0
RR	0	21:46:59.404	Core 04	2026.09.07 09:40:01   [SRJ-EA] MTEXIT bar=2026.09.07 09:35 reason=TP_TOUCH line=- lineVal=- entry=1.16135 exit=1.16188
HL	0	21:48:18.750	Core 04	2026.09.07 17:15:01   [SRJ-EA] MTLIFE fields=11 openBar=2026.09.07 16:45 dir=LONG entry=1.16261 sl=1.16238 tp=1.16315 verdict=TP_TOUCH closeBar=2026.09.07 17:10 closePx=1.16315 openAtNewsStart=0 openAtDayClose=0 openAtWeekClose=0
PS	0	21:48:18.750	Core 04	2026.09.07 17:15:01   [SRJ-EA] MTEXIT bar=2026.09.07 17:10 reason=TP_TOUCH line=- lineVal=- entry=1.16261 exit=1.16315
OJ	0	21:51:15.752	Core 04	2026.09.08 10:45:00   [SRJ-EA] MTLIFE fields=11 openBar=2026.09.08 10:10 dir=SHORT entry=1.16205 sl=1.16258 tp=1.16072 verdict=TP_TOUCH closeBar=2026.09.08 10:40 closePx=1.16102 openAtNewsStart=0 openAtDayClose=0 openAtWeekClose=0
LD	0	21:51:15.752	Core 04	2026.09.08 10:45:00   [SRJ-EA] MTEXIT bar=2026.09.08 10:40 reason=TP_TOUCH line=- lineVal=- entry=1.16205 exit=1.16102
CN	0	21:52:16.788	Core 04	2026.09.08 17:05:00   [SRJ-EA] MTLIFE fields=11 openBar=2026.09.08 17:00 dir=SHORT entry=1.16220 sl=1.16274 tp=1.16114 verdict=TP_TOUCH closeBar=2026.09.08 17:00 closePx=1.16228 openAtNewsStart=0 openAtDayClose=0 openAtWeekClose=0
GP	0	21:52:16.788	Core 04	2026.09.08 17:05:00   [SRJ-EA] MTEXIT bar=2026.09.08 17:00 reason=TP_TOUCH line=- lineVal=- entry=1.16220 exit=1.16228

G2-G4 (packet G2-G4): entry identity 8 counts identical to RECON50 (SIGNAL 7, TP_ELECT 12, SIDE1X 14, SIDE1E 14, STOPRESOLVE 43, LOTDIAG 7, SEEDDIAG 6, SESSION_LIMIT 7); instrumentation counts identical with tpB/h/l/sup fields on every EXITVERDICT row and no new alert kinds; build 0/0 with post-hash recorded and S5 commit text identical.

RUN-COST: one build (E1/E2/E4 literals above, STAGE-1 exact-diff gated) plus one tester run RECON51-EXITGATE-V1, ceiling 90 minutes, same envelope (RECON50_DEMO_USD, InpMode 1, 08-26 to 09-10, InpDebugLog=true, same terminal). Build and run only on dual-key clear plus his run word plus token. No commit without token.
NOVEL-EVIDENCE: this run returns what no prior run did, named against RECON50 (V38, takes 4/4): (a) six predicted TP-exit suppressions with the booked equality kept (09-07 17:10); (b) first measurement of booked-vs-recompute divergence (sup counter plus tpB/h/l fields); (c) entry behavior reproduced exactly under the gate. Takes move at exit-fidelity level; the 8/28 hold moves rule-conformance.

Question (one, specific): clear PACKET_P-EXITGATE-1 v1 by name for exactly one build plus one run under the envelope above, with G1-G4 graded as stated - accept, amend-with-delta, or halt, with line numbers.
Analytic ask A (standing): name every defect, gap, or imprecision you see in the page, each with line numbers - freetext, no length limit.
Analytic ask B (standing, code relays): state any better mechanism you see for the stated goal, with the code lines it would touch.
Answer form: plain accept / amend-with-delta / halt, with line numbers, plus analytic answers and any volunteered key.
Verification split: rule on the page only - genuineness vs disk is proven on disk (digests plus counts above) and is not answerable from chat by any model tier. Do not ask for files.
Nothing else is asked. Thank you.
