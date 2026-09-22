CODE REVIEW REQUEST - v204 - 2026-09-20 (CLEARANCE 2: PACKET_P-EXITGATE-1 v2 with corrected E4 anchor, one build plus one run; nothing builds or spends on this verdict alone)

Project brief (standing - read first):
- Money: clearance ask for exactly one build plus one tester run under the stated envelope. Alert-only EA. No live trades. No funded money moves on any verdict here. Build and run only on dual-key clear plus his run word plus token. Nothing here builds, runs, or spends by itself.
- People: one operator (trader, strategy owner, money authority) plus AI seats. No second human reviewer - declined, his call. He carries every text both ways verbatim. That carry IS the anti-fake check: he compares what a seat sent with what got filed.
- History: exit thread - v203 relay (AD80A9C834AFFB3F553D68A268B719CFACB50C58A9A2AEB6DFCAED55CF4E15F8/10878 B/111 lines) ruled Luna-ACCEPT with key Luna-V203-001 plus Sonnet/GLM amend-conditional (filed whole 1x each, zero halts); the amend condition is mechanical and carried here as v2 (E4 re-anchor with insert framing, tpRef regions relayed below, 4-space deviation recorded, G1/G2/G4 grading rules, line budget); his break-retest rule plus booked-TP discipline stand unchanged. EXT1LIVE v201 round closed separately (RECON50 passed).
- Your verdict: rules on the page only (code lines, numbers, logic). Disk truth (digests, logs, builds) is proven on his machine, never in chat. Keys come only from the key seat. No ruling here builds code, runs anything, or spends money.

Change (one plain sentence): clear PACKET_P-EXITGATE-1 v2 by name for exactly one build (E-b gate to booked-TP touch plus exit-price plus re-anchored instrumentation rail, STAGE-1 exact-diff gated) plus one run under the RECON50 envelope with G1-G4 graded as stated.

Money (standing): behavior-change build confined to the exit engine E-b plus log rail. Alert-only EA. No live trades. No funded money moves on any verdict here. Build and run only on dual-key clear plus his run word plus token. No commit without token.
Session: CONTINUE previous council session (the v203 thread, same seats; v2 deltas ride whole below so no seat memory is required). Prior texts ride labeled with file plus marker plus digest, never as anyone's words.
Packet: 01_TASKS\PACKET_P-EXITGATE-1.md v2 DRAFT: 6E5A54A753176F10F11B40EA42F5C03F2B4A1FFBBC306EF1897DAA3690A7882B / 9973 B / 40 lines (E1 gate, E2 price, E3 keep-walk, E4 rail re-anchored, G1/G2/G4 rules, run cost). Pre-build tree: A897790523AE06A47F89D8E8301E317529D97661447CE23D57551D065E3BAED9 / 614371 B / 11235 lines (v38, uncommitted; STAGE-1 halts on drift).
Seat packaging: identical text to Luna plus Sonnet plus GLM; keys volunteered only; any seat halts on a checkable discrepancy with line numbers.

DELTA-TWIN (v2 amends v1: 6 amended packet-lines quoted whole below, 34 identical by construction - builder edits touched only lines 1, 20, 25, 33, 34, 36; ellipsis 0):
P01 (= packet L1, AMENDED): # PACKET_P-EXITGATE-1 v2 DRAFT - gate E-b to booked-TP touch (break-retest rule)
P20 (= packet L20, AMENDED): ## Edit set (exact verbatim; STAGE-1 exact-diff gated at build; NEW literals carry 4-space base vs file 3-space, recorded as accepted per GLM-V203 delta 3)
P25 (= packet L25, AMENDED): E4 Counter home (INSERT after EA L1055 - anchor shown for position only, never removed): anchor `int              g_n1_exitBodySurv = 0;` plus `int              g_n1_exitBodyInv  = 0;` (global N1 exit counters beside family counters, asserted present pre-build); INSERT immediately after L1055: `//--- [P-EXITGATE-1] suppressed recompute touches (diagnostic)` + `int              g_n1_tpRecomputeSupp = 0;` (file-convention indent, machine-derived col 17); EXITVERDICT log gains booked/raw fields (old verbatim EA L11176-L11187): `   if(InpDebugLog)` + `      PrintFormat("[SRJ-EA] EXITVERDICT bar=%s dir=%s entry=%s curTp=%s vSL=%d "` + `                  "vTP=%d vBREAK=%s vHTF=%d scope=%d "` + `                  "htfH=%g htfM=%g htfL=%g want=%d anti=%d",` + `                  TimeToString(barTime, TIME_DATE|TIME_MINUTES),` + `                  DirName(g_mtrade.dir),` + `                  DoubleToString(g_mtrade.entryPrice, _Digits),` + `                  (haveTp ? DoubleToString(curTp, _Digits) : "none"),` + `                  (int)vSL, (int)vTP,` + `                  (vBREAK ? breakLineName : "none"),` + `                  (int)vHTF, (int)MT_EXIT_SCOPE,` + `                  mtlH, mtlM, mtlL, mtlWant, mtlAnti);` - new verbatim (full raw, matches relay E4LNEW): `    if(InpDebugLog)` + `      PrintFormat("[SRJ-EA] EXITVERDICT bar=%s dir=%s entry=%s curTp=%s vSL=%d "` + `                   "vTP=%d vBREAK=%s vHTF=%d scope=%d "` + `                   "htfH=%g htfM=%g htfL=%g want=%d anti=%d tpB=%s h=%s l=%s sup=%d",` + `                   TimeToString(barTime, TIME_DATE|TIME_MINUTES),` + `                   DirName(g_mtrade.dir),` + `                   DoubleToString(g_mtrade.entryPrice, _Digits),` + `                   (haveTp ? DoubleToString(curTp, _Digits) : "none"),` + `                   (int)vSL, (int)vTP,` + `                   (vBREAK ? breakLineName : "none"),` + `                   (int)vHTF, (int)MT_EXIT_SCOPE,` + `                   mtlH, mtlM, mtlL, mtlWant, mtlAnti, (g_mtrade.tpRef != EMPTY_VALUE && g_mtrade.tpRef > 0.0 ? DoubleToString(g_mtrade.tpRef, _Digits) : "none"), DoubleToString(h, _Digits), DoubleToString(l, _Digits), g_n1_tpRecomputeSupp);`
P33 (= packet L33, AMENDED): G1 Gate effect per trade (booked MTLIFE tp= vs MTEXIT exit= on RECON50; equality counts as touch): 08-28 10:05 SHORT booked 1.16322 exit was 1.16459 - NO MTEXIT 10:45, held; 08-28 16:25 SHORT booked 1.16322 exit was 1.16416 - NO MTEXIT 16:25; 09-04 16:00 LONG booked 1.16315 exit was 1.16017 - NO MTEXIT 16:00; 09-07 09:20 LONG booked 1.16315 exit was 1.16188 - NO MTEXIT 09:35; 09-07 16:45 LONG booked 1.16315 exit was 1.16315 - MTEXIT KEPT 17:10 (equality); 09-08 10:10 SHORT booked 1.16072 exit was 1.16102 - NO MTEXIT 10:40; 09-08 17:00 SHORT booked 1.16114 exit was 1.16228 - NO MTEXIT 17:00. Six suppressed, one kept. Grading rule (GLM-V203 delta 5): pass iff (i) zero TP_TOUCH exits anywhere with MTEXIT exit not equal to MTLIFE booked tp; (ii) the 9/07 17:10 trade still exits TP_TOUCH at 1.16315; (iii) the six early prices do not recur as TP_TOUCH exits (a same-bar booked-touch exit on one of the six is conformant and annotated, never a failure); (iv) sup is reported with no predicted value (it counts bars, not trades). Downstream session/deal cascade from held trades disclosed as mechanism consequence (RECON50 17:00 precedent), never as drift.
P34 (= packet L34, AMENDED): G2 Entry identity: SIGNAL 7, TP_ELECT 12, SIDE1X 14, SIDE1E 14, STOPRESOLVE 43, LOTDIAG 7, SEEDDIAG 6, SESSION_LIMIT 7 - all identical rows to RECON50 (gate sits downstream of the S5 commit). Grading rule (GLM-V203 delta 4): where a held trade blocks a later admission under the single-trade lifecycle (concrete risk 9/07 09:20 held across the 16:45 admission), the divergence traced to the still-open trade grades conformant-annotated, never drift.
P36 (= packet L36, AMENDED): G4 Build: 0 errors 0 warnings; post-hash recorded; S5 commit text prepared and identical, the commit itself executing only on token (GLM-V203 delta 6); line budget pre 11235 post 11249 (+14: E1 +11, E4log +1, E2 +0, E4decl +2 across four hunks; E2/E4 cites shift +11 after E1, hunks anchored by content).

TPREF DECL (whole contiguous region EA L238-L257, pulled from disk this turn, byte-exact; closes Sonnet-1/GLM-A10 and Luna-A3 on provenance):
struct SManagedTrade
  {
   bool         active;
   int          state;             // ENUM_MT_STATE
   ENUM_SRJ_DIR dir;
   int          anchorLine;        // POI_BUF_*
   double       anchorPrice0;      // provenance only (tests use current values, 5.2)
   datetime     anchorBarTime;
   int          sessionAtEntry;    // ENUM_SRJ_SESSION as int
   double       entryPrice;        // the S5 next-open reference = the fill level
   double       slRef;             // the latched two-branch stop
   double       tpRef;             // the admission TP figure (provenance)
   int          regimeAtAdmission; // ENUM_SRJ_REGIME as int (drives the 5.6 scope)
   datetime     fillBarTime;       // the fill candle's OPEN time (the next candle)
   datetime     signalBarTime;     // the confirming candle's open time
   int          exitReason;        // ENUM_MT_EXIT
   datetime     exitBarTime;
   double       exitPrice;
  };
SManagedTrade g_mtrade;

ADMISSION LATCH (whole contiguous region EA L10053-L10066, pulled from disk this turn, byte-exact; tpRef latched at L10062 in the S5 snapshot, never mutated mid-trade - 4 tpRef hits tree-wide):
      g_mtrade.active            = true;
      g_mtrade.state             = MT_MANAGING;
      g_mtrade.dir               = g_dir;
      g_mtrade.anchorLine        = g_anchorLine;
      g_mtrade.anchorPrice0      = g_anchorPrice;
      g_mtrade.anchorBarTime     = g_anchorBarTime;
      g_mtrade.sessionAtEntry    = (int)g_sessionAtEntry;
      g_mtrade.entryPrice        = currentPrice;
      g_mtrade.slRef             = slRef;
      g_mtrade.tpRef             = tpTarget;
      g_mtrade.regimeAtAdmission = (int)g_regime;
      g_mtrade.fillBarTime       = iTime(_Symbol, PERIOD_CURRENT, 0);
      g_mtrade.signalBarTime     = iTime(_Symbol, PERIOD_CURRENT, barShift);
      g_mtrade.exitReason        = MT_EXIT_NONE;

E4 TRUE ANCHOR (whole EA L1054-L1055, pulled from disk this turn, byte-exact; global N1 exit counters beside family counters - replaces v203's mislabeled block):
int              g_n1_exitBodySurv = 0;
int              g_n1_exitBodyInv  = 0;

E4 NEW COUNTER (packet v2 design literal; INSERT immediately after L1055, anchor never removed):
//--- [P-EXITGATE-1] suppressed recompute touches (diagnostic)
int              g_n1_tpRecomputeSupp = 0;

TPB TERNARY (packet v2 design literal; the one changed EXITVERDICT arg):
                   mtlH, mtlM, mtlL, mtlWant, mtlAnti, (g_mtrade.tpRef != EMPTY_VALUE && g_mtrade.tpRef > 0.0 ? DoubleToString(g_mtrade.tpRef, _Digits) : "none"), DoubleToString(h, _Digits), DoubleToString(l, _Digits), g_n1_tpRecomputeSupp);

G1 METRIC RULES (packet v2 G1): pass iff (i) zero TP_TOUCH exits with MTEXIT exit not equal to MTLIFE booked tp; (ii) the 9/07 17:10 trade still exits TP_TOUCH at 1.16315; (iii) the six early prices do not recur as TP_TOUCH exits (a same-bar booked-touch exit is conformant and annotated, never a failure); (iv) sup is reported with no predicted value. Six suppressed, one kept (equality counts as touch).
G2 RULE (packet v2 G2): entry counts identical to RECON50 (SIGNAL 7, TP_ELECT 12, SIDE1X 14, SIDE1E 14, STOPRESOLVE 43, LOTDIAG 7, SEEDDIAG 6, SESSION_LIMIT 7); where a held trade blocks a later admission under the single-trade lifecycle, the divergence traced to the still-open trade grades conformant-annotated, never drift.
G4 RESTATED (packet v2 G4): commit text prepared and identical, the commit itself executing only on token; line budget pre 11235 post 11249 (+14: E1 +11, E4log +1, E2 +0, E4decl +2 across four hunks; E2/E4 cites shift +11 after E1, hunks anchored by content). Build 0/0.
E-b old, assignment, E4-log-old, candidate set, and pair rows rode byte-verified in v203 (file digest AD80A9C834AFFB3F553D68A268B719CFACB50C58A9A2AEB6DFCAED55CF4E15F8) - carried by labeled reference, never re-inserted.

RUN-COST: one build (E1/E2/E4 literals per packet v2, STAGE-1 exact-diff gated) plus one tester run RECON51-EXITGATE-V1, ceiling 90 minutes, same envelope (RECON50_DEMO_USD, InpMode 1, 08-26 to 09-10, InpDebugLog=true, same terminal). Build and run only on dual-key clear plus his run word plus token. No commit without token.
NOVEL-EVIDENCE: this run returns what no prior run did, named against RECON50 (V38, takes 4/4): (a) six predicted TP-exit suppressions with the booked equality kept (09-07 17:10); (b) first measurement of booked-vs-recompute divergence (sup counter plus tpB/h/l fields); (c) entry behavior reproduced exactly under the gate. Takes move at exit-fidelity level; the 8/28 hold moves rule-conformance.

Question (one, specific): clear PACKET_P-EXITGATE-1 v2 by name for exactly one build plus one run under the envelope above, with G1-G4 graded as stated - accept, amend-with-delta, or halt, with line numbers and any volunteered key.
Analytic ask A (standing): name every defect, gap, or imprecision you see in the page, each with line numbers - freetext, no length limit.
Analytic ask B (standing, code relays): state any better mechanism you see for the stated goal, with the code lines it would touch.
Answer form: plain accept / amend-with-delta / halt, with line numbers, plus analytic answers and any volunteered key.
Verification split: rule on the page only - genuineness vs disk is proven on disk (digests plus counts above) and is not answerable from chat by any model tier. Do not ask for files.
Nothing else is asked. Thank you.
