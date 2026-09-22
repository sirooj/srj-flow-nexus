CODE REVIEW REQUEST - v205 - 2026-09-20 (CLEARANCE 3: PACKET_P-EXITGATE-1 v3 folding the v204 amend-deltas, one build plus one run; nothing builds or spends on this verdict alone)

Project brief (standing - read first):
- Money: clearance ask for exactly one build plus one tester run under the stated envelope. Alert-only EA. No live trades. No funded money moves on any verdict here. Build and run only on dual-key clear plus his run word plus token. Nothing here builds, runs, or spends by itself.
- People: one operator (trader, strategy owner, money authority) plus AI seats. No second human reviewer - declined, his call. He carries every text both ways verbatim. That carry IS the anti-fake check: he compares what a seat sent with what got filed.
- History: exit thread - v204 relay (FA54235BE5F0078E4D66B618AF6E8B6D27B1AF307A554D5CE4B26F897A9826AD/13116 B/86 lines) ruled Luna AMEND-WITH-DELTA key Luna-V204-EXITGATE-001 plus Sonnet advisory amend (no key, standing) plus GLM AMEND-WITH-DELTA key GLM-V204-001 binding to this v3 fold not to v2 (all filed whole 1x each, zero halts); v203 relay (AD80A9C834AFFB3F553D68A268B719CFACB50C58A9A2AEB6DFCAED55CF4E15F8/10878 B/111 lines) ruled Luna-ACCEPT Luna-V203-001 plus Sonnet/GLM amend-conditional. This v3 folds every v204 delta mechanically; E1/E2/E4 literals unchanged. His break-retest rule plus booked-TP discipline stand unchanged. EXT1LIVE v201 round closed separately (RECON50 passed).
- Your verdict: rules on the page only (code lines, numbers, logic). Disk truth (digests, logs, builds) is proven on his machine, never in chat. Keys come only from the key seat. No ruling here builds code, runs anything, or spends money.

Change (one plain sentence): clear PACKET_P-EXITGATE-1 v3 by name for exactly one build (E-b gate to booked-TP touch plus exit-price plus re-anchored instrumentation rail, STAGE-1 exact-diff gated) plus one run under the RECON50 envelope with G1-G4 graded as stated.

Money (standing): behavior-change build confined to the exit engine E-b plus log rail. Alert-only EA. No live trades. No funded money moves on any verdict here. Build and run only on dual-key clear plus his run word plus token. No commit without token.
Session: NEW fresh session every time (his order 2026-09-20, overruling the v203/v204 CONTINUE line). Prior texts ride labeled with file plus marker plus digest, never as anyone's words.
Packet: 01_TASKS\PACKET_P-EXITGATE-1.md v3 DRAFT: 125EB93EC447F6CB8AE19581C69F9BDD61FA21B63FDF21FF0E80FD937F6203FE / 11482 B / 40 lines (E1 gate, E2 price, E3 keep-walk, E4 rail re-anchored, G1/G2/G4 rules as folded, run cost). Pre-build tree: A897790523AE06A47F89D8E8301E317529D97661447CE23D57551D065E3BAED9 / 614371 B / 11235 lines (v38, uncommitted; STAGE-1 halts on drift).
Seat packaging: identical text to Luna plus Sonnet plus GLM; keys volunteered only; any seat halts on a checkable discrepancy with line numbers.

DELTA-TWIN (v3 amends v2: 7 amended packet-lines quoted whole below, 33 identical by construction - builder edits touched only lines 1, 3, 20, 33, 34, 36, 40; ellipsis 0):
P01 (= packet L1, AMENDED, whole): # PACKET_P-EXITGATE-1 v3 DRAFT - gate E-b to booked-TP touch (break-retest rule)
P03 (= packet L3, AMENDED, whole): Status: DRAFT (not issued, not cleared, not executed). Nothing builds or runs on this file. Clearance via a clearance relay plus token plus his run word, all owed. Canonical file: exactly ONE - Experts\SRJ_FlowNexus_EA.mq5 (pre-build tree A897790523AE06A47F89D8E8301E317529D97661447CE23D57551D065E3BAED9 / 614371 B / 11235 lines, v38 build carrying A/B/C/D1/D2/E-hunk; STAGE-1 halts on any drift). Nothing under 02_TASK_CHECKPOINTS. No commit without token. v3 amends v2 per Luna-V204-EXITGATE-001 plus Sonnet-V204 plus GLM-V204-001 (G1 row-level proof plus identity plus equality rule plus rail floor, G2 sole-blocker evidence, budget +13/post-11248 with exact-diff primary, E1/E2/E3 carried whole on the relay page); E1/E2/E4 literals unchanged.
P20 (= packet L20, AMENDED, whole): ## Edit set (exact verbatim; STAGE-1 exact-diff gated at build; NEW literals carry 4-space base vs file 3-space, recorded as accepted per GLM-V203 delta 3; new-log whitespace rides verbatim — `if` at 4-space base, `PrintFormat` at 6, arg/continuation lines at 19 spaces — normalization forbidden per GLM-V204 D5)
P33 (= packet L33, AMENDED, whole): G1 Gate effect per trade (booked MTLIFE tp= vs MTEXIT exit= on RECON50; equality = exact equality of the _Digits-normalized logged values, no tolerance): 08-28 10:05 SHORT booked 1.16322 exit was 1.16459 - NO MTEXIT 10:45, held; 08-28 16:25 SHORT booked 1.16322 exit was 1.16416 - NO MTEXIT 16:25; 09-04 16:00 LONG booked 1.16315 exit was 1.16017 - NO MTEXIT 16:00; 09-07 09:20 LONG booked 1.16315 exit was 1.16188 - NO MTEXIT 09:35; 09-07 16:45 LONG booked 1.16315 exit was 1.16315 - MTEXIT KEPT 17:10 (equality); 09-08 10:10 SHORT booked 1.16072 exit was 1.16102 - NO MTEXIT 10:40; 09-08 17:00 SHORT booked 1.16114 exit was 1.16228 - NO MTEXIT 17:00. Six suppressed, one kept. Grading rule (v204 fold): pass iff (i) zero TP_TOUCH exits anywhere with MTEXIT exit not equal to MTLIFE booked tp; (ii) an MTEXIT row bar 09-07 17:10 reason TP_TOUCH exit 1.16315 exists, whichever admission produced it (the 16:45 trade, or the held 09:20 trade under the G2 cascade); trade match by fillBarTime/signalBarTime plus direction, never price alone; (iii) the six early prices do not recur as TP_TOUCH exits (a same-bar booked-touch exit on one of the six is conformant and annotated, never a failure); (iv) sup is reported with no predicted value (it counts bars: the E1 increment statement runs at most once per EvaluateManagedTrade call, no reset inside the run, cumulative run total); rail floor: sup == 0 together with one or more suppressed exits annotated per (i)/(iii) grades E4-rail wiring defect — annotated plus operator decision on any rerun, never a silent pass. Each of the six named cases is annotated with bar/time, direction, booked TP, recompute-touch basis, and no-MTEXIT (annotation names signal-bar open time and old exit-bar time both). Downstream session/deal cascade from held trades disclosed as mechanism consequence (RECON50 17:00 precedent), never as drift.
P34 (= packet L34, AMENDED, whole): G2 Entry identity: SIGNAL 7, TP_ELECT 12, SIDE1X 14, SIDE1E 14, STOPRESOLVE 43, LOTDIAG 7, SEEDDIAG 6, SESSION_LIMIT 7 - all identical rows to RECON50 (gate sits downstream of the S5 commit). Grading rule (v204 fold): where a held trade blocks a later admission under the single-trade lifecycle (concrete risk 9/07 09:20 held across the 16:45 admission), the blocked admission grades conformant-annotated only with the active managed trade shown as the sole blocking condition (affected bar/time plus lifecycle state recorded); no broader divergence is excused merely because a trade was open.
P36 (= packet L36, AMENDED, whole): G4 Build: 0 errors 0 warnings; post-hash recorded; S5 commit text prepared and identical, the commit itself executing only on token (GLM-V203 delta 6); the STAGE-1 exact-diff allowlist is the primary gate, line budget secondary: pre 11235 post 11248 (+13: E1 +11, E4log +0, E2 +0, E4decl +2 across four hunks; cites after both inserts shift +13 total — E4decl +2 plus E1 +11 — hunks anchored by content). Withdrawn: the v2 +14/post-11249 figure (E4log miscount, GLM-V204 D1, disk-proven 12 old vs 12 new literals). G3 rides unamended at L35 among the 33-identical set.
P40 (= packet L40, AMENDED, whole): One build (E1/E2/E4 literals above) plus one tester run, ceiling 90 minutes, same envelope as RECON50. Novel evidence vs RECON50: first run measuring that booked-vs-recompute divergence occurred and at what prices (sup counter plus tpB/h/l fields; the recompute source buffer is NOT identified — deferred to a future packet); with six predicted suppressions plus one kept equality; entry behavior must reproduce exactly.

E1 OLD (whole EA L11097-L11102, pulled from disk this turn, byte-exact; h/l are pre-existing locals at this site - the OLD lines already read them):
   //--- (b) TP: the CURRENT nearest valid target (Q6), exit on TOUCH (5.1/2.2)
   if(haveTp)
     {
      if(g_mtrade.dir == DIR_LONG  && h >= curTp) vTP = true;
      if(g_mtrade.dir == DIR_SHORT && l <= curTp) vTP = true;
     }

E1 NEW (whole 17-line design literal, byte-identical joined form to packet L22 segment; lines: 3 comments + booked block 6 + recompute block 5 + sup increment 1 + gate 1 + close = 17, old 6, delta +11):
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

E2 NEW (whole design literal, delta +0):
    else if(vTP)    { g_mtrade.exitReason = MT_EXIT_TP_TOUCH;       g_mtrade.exitPrice = g_mtrade.tpRef; }

E3 (no code change): walk kept for admission booking plus counterfactual logging; build asserts haveTp/curTp/MtNearestTpTarget occurrences unchanged and EXITCENSUS/EXITVERDICT row counts identical to RECON50.

E4 TRUE ANCHOR (whole EA L1054-L1055, byte-exact; INSERT after, anchor never removed):
int              g_n1_exitBodySurv = 0;
int              g_n1_exitBodyInv  = 0;

E4 NEW COUNTER (design literal, +2 lines):
//--- [P-EXITGATE-1] suppressed recompute touches (diagnostic)
int              g_n1_tpRecomputeSupp = 0;

E4 OLD LOG (whole EA L11176-L11187 = 12 lines, pulled from disk this turn, byte-exact):
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

E4 NEW LOG (whole 12-literal design literal, machine-extracted from packet L25: 12 literals vs 12 old, delta +0; whitespace as recorded - if at 4, PrintFormat at 6, continuation/arg lines at 19, normalization forbidden):
`    if(InpDebugLog)`
`      PrintFormat("[SRJ-EA] EXITVERDICT bar=%s dir=%s entry=%s curTp=%s vSL=%d "`
`                   "vTP=%d vBREAK=%s vHTF=%d scope=%d "`
`                   "htfH=%g htfM=%g htfL=%g want=%d anti=%d tpB=%s h=%s l=%s sup=%d",`
`                   TimeToString(barTime, TIME_DATE|TIME_MINUTES),`
`                   DirName(g_mtrade.dir),`
`                   DoubleToString(g_mtrade.entryPrice, _Digits),`
`                   (haveTp ? DoubleToString(curTp, _Digits) : "none"),`
`                   (int)vSL, (int)vTP,`
`                   (vBREAK ? breakLineName : "none"),`
`                   (int)vHTF, (int)MT_EXIT_SCOPE,`
`                   mtlH, mtlM, mtlL, mtlWant, mtlAnti, (g_mtrade.tpRef != EMPTY_VALUE && g_mtrade.tpRef > 0.0 ? DoubleToString(g_mtrade.tpRef, _Digits) : "none"), DoubleToString(h, _Digits), DoubleToString(l, _Digits), g_n1_tpRecomputeSupp);`

TPB TERNARY (the one changed EXITVERDICT arg line):
                   mtlH, mtlM, mtlL, mtlWant, mtlAnti, (g_mtrade.tpRef != EMPTY_VALUE && g_mtrade.tpRef > 0.0 ? DoubleToString(g_mtrade.tpRef, _Digits) : "none"), DoubleToString(h, _Digits), DoubleToString(l, _Digits), g_n1_tpRecomputeSupp);

TPREF PROVENANCE (EA L238-L257 struct region plus admission latch L10053-L10066, carried byte-identical from the v204 page against the unchanged A897 tree; tpRef 4-hit enumeration pulled from disk this turn, complete - decl L249, lifecycle-clear reset L285, single admission write L10062, MTLIFE logger read L10979; never mutated mid-trade):
- L249: double tpRef (struct field, admission TP figure)
- L285: g_mtrade.tpRef = 0.0 (flat-state clear block with active=false, never mid-trade)
- L10062: g_mtrade.tpRef = tpTarget (S5 snapshot latch, the single admission write)
- L10979: DoubleToString(g_mtrade.tpRef, _Digits) (MTLIFE tp= logger, read-only)

G1 METRIC RULES (packet v3 G1): pass iff (i) zero TP_TOUCH exits with MTEXIT exit not equal to MTLIFE booked tp (_Digits-normalized exact equality); (ii) MTEXIT row 09-07 17:10 TP_TOUCH 1.16315 whichever admission; (iii) six early prices do not recur as TP_TOUCH exits (same-bar booked-touch conformant, annotated); (iv) sup reported, no predicted value, with rail floor. Six suppressed, one kept.
G2 RULE (packet v3 G2): entry counts identical to RECON50 (SIGNAL 7, TP_ELECT 12, SIDE1X 14, SIDE1E 14, STOPRESOLVE 43, LOTDIAG 7, SEEDDIAG 6, SESSION_LIMIT 7); held-trade blockage conformant-annotated only with sole-blocking-condition evidence.
G4 RESTATED (packet v3 G4): commit text prepared and identical, commit only on token; exact-diff primary, budget secondary (+13/post-11248). Build 0/0.
Withdrawn on record: v2 +14/post-11249 (E4log +1 miscount) - replaced by disk-proven +13/post-11248 per GLM-V204 D1 12-branch; Luna-V204 confirm of the +14 arithmetic is superseded on this point only, all other Luna-V204 deltas stand folded.
v203-carried evidence (E-b old, assignment, E4-log-old, candidate set, pair rows) rode byte-verified in v203 (AD80A9C834AFFB3F553D68A268B719CFACB50C58A9A2AEB6DFCAED55CF4E15F8) - carried by labeled reference, never re-inserted.

RUN-COST: one build (E1/E2/E4 literals per packet v3, STAGE-1 exact-diff gated) plus one tester run RECON51-EXITGATE-V1, ceiling 90 minutes, same envelope (RECON50_DEMO_USD, InpMode 1, 08-26 to 09-10, InpDebugLog=true, same terminal). Build and run only on dual-key clear plus his run word plus token. No commit without token.
NOVEL-EVIDENCE: this run returns what no prior run did, named against RECON50 (V38, takes 4/4): (a) six predicted TP-exit suppressions with the booked equality kept (09-07 17:10); (b) first measurement that booked-vs-recompute divergence occurred and at what prices (sup counter plus tpB/h/l fields); (c) entry behavior reproduced exactly under the gate. Takes move at exit-fidelity level; the 8/28 hold moves rule-conformance. Readout keeps takes-4/4 (entry grading) distinct from the G1 seven-row (exit grading) baseline.

Question (one, specific): clear PACKET_P-EXITGATE-1 v3 by name for exactly one build plus one run under the envelope above, with G1-G4 graded as stated - accept, amend-with-delta, or halt, with line numbers and any volunteered key.
Analytic ask A (standing): name every defect, gap, or imprecision you see in the page, each with line numbers - freetext, no length limit.
Analytic ask B (standing, code relays): state any better mechanism you see for the stated goal, with the code lines it would touch.
Answer form: plain accept / amend-with-delta / halt, with line numbers, plus analytic answers and any volunteered key.
Verification split: rule on the page only - genuineness vs disk is proven on disk (digests plus counts above) and is not answerable from chat by any model tier. Do not ask for files.
Nothing else is asked. Thank you.
