# PACKET_P-EXITRANK-1 v1 DRAFT - anchor-rank BREAK gate (his 2026-09-23 rule; supersedes the E3 MEANREV fork; exit-only, selection untouched)

Status: v1 DRAFT. Nothing builds, runs, or commits on this file. Clearance via a clearance relay plus token plus his run word, all owed. Canonical files: exactly ONE - Experts\SRJ_FlowNexus_EA.mq5 (EvaluateManagedTrade: delete the E3 isMeanRev decl pair, re-key the break gate on g_authorityRank). No new indicator buffers. Nothing under 02_TASK_CHECKPOINTS. No commit without token. Selection/booking/gate/R-floor/regime/confirmation/alert/SL/TP/HTF/session code: all UNCHANGED. Exit-only scope (his 2026-09-22 order): seed-carry and classifier threads are parked, never drafted here - they need his explicit scope word first, in that order.
Successor context: PACKET_P-VNEXT-1 v3 (built tree 3F4D617B, RECON55 graded takes 5 with 9/4 BREAK-exit 16:10 + 17:00 BREAK-exit 17:05 both same-line under the new rule); this packet changes exit behavior only, graded per fix below.

## Authority (all on record, no invention)

- His anchor-rank ruling 2026-09-23 (verbatim: "the 9/4 trade POI entry originate from the same Y POC, so when the same Y POC crossed it over it does not matter. while the 28 originates from the D VWAP which i have explained and stated on the nuance of the VWAP hierarchy is lower than the POC/AVP"): same-line cross never exits; higher-hierarchy break exits a lower-anchored trade.
- Journaled hierarchy (EXITMODEL-1 L70: AVP-POC over VWAP inside each family; strategy skill section 3; filed long before, never applied to exits - builder defect owned ledger 619).
- His NO-TOLERANCE principle 2026-09-23 (any undercut counts; fundamental). Scope note: equality strictness (E14: exact equality never breaks) is EXPLICITLY UNCHANGED by this packet - his 17:45 instance was through on his feed (close 1.15984 under 1.15987), so tester-touch behavior stays until he rules touch. Listed open, never smuggled.
- His universal day-close rule 2026-09-21/22 (16:55 ET mark, every managed trade; F3 built+armed, never yet fired). Untouched by this packet.
- Proved instances on disk (RECON55 segment EA5BCC5C + RECON51 segment): 9/4 anchor Y-POC vs 16:10 cross Y-POC (MTEXIT BREAK, should hold); 8/28 anchor D-VWAP vs 11:40 BREAK D-POC exit 1.16439 (51 MTEXIT, correctly exits - preserved).
- Charter 9.1(2) amendment (on record in code comment EA L122-124: "the origin/anchor line's own break DOES exit"): his later word overrules it for the same-line case. The E3 MEANREV-only fork (P-VNEXT-1) is superseded twice over (redundant same-line, wrong on higher-breaks) and is removed by this packet, never carried.

## Rule (one gate, journaled table)

- The BREAK gate fires if and only if the breaking line STRICTLY OUTRANKS the entry anchor in g_authorityRank (lower number = higher authority: FOMC-POC 0 through Daily-VWAP 11, InitAuthorityTable EA L91-105, unchanged). Same rank (including the same line) never exits; lower-authority breaks never exit (charter 9.1 VWAP-never-exits-POC preserved as a corollary).
- Reachable truth table under MT_SCOPE_FAMILY_POC (non-anchor VWAPs never trigger): anchor==break line always holds (9/4 shape, 17:00 shape); anchor VWAP + breaking POC exits iff rank[POC] < rank[VWAP] (8/28 shape: D-POC 10 < D-VWAP 11); cross-family POC pairs decide by family rank (journaled table). No other exit leg moves (SL/TP/HTF/DAY order untouched).
- E-quality, trigger set, behind/through geometry, first-break-wins order, census prints: all UNCHANGED. Anchor-invalid guard (anchorLine outside [0,12)): no BREAK exit (SL/TP/DAY still catch; all takes prove anchor set 5/5 in RECON55).

## Scope (exit behavior only; suppression census intended-shift graded in G3)

- Takes, elections, seeds, vetoes, freshness, booking, R floor, regime votes, confirmation, alert kinds, SL/TP legs, HTF leg, day-close leg, session handling: all UNCHANGED. EXITCENSUS verdict flips are intended ONLY on same-line crosses (itemized in G3); geometric census rows print unchanged.
- Predicted deltas vs RECON55 (same feed): 9/4 LONG holds 16:10, survives to the 16:55 mark, DAY_CLOSE fires (first live fire); 17:00 SHORT holds 17:05 (same-line M-POC), exits later via SL/TP/DAY (first exit opportunity the 9/9 mark modulo TP/SL - stated, not promised); 9/1 LONG unchanged (17:45 touch, side=ahead, SL 17:50); 8/28 untestable on this tree (no take - selection unchanged by design); 9/7 + 9/8-10:10 TP_TOUCH unchanged.

## Edit set (exact verbatim; STAGE-1 exact-diff gated; byte-verified anchors)

- E1 delete E3 decl pair (EA L11157-11158, 3-space indent, -2 deleted):
  old L11157: `   //--- [P-VNEXT-1 E3] B-fork decl (his ruling 2026-09-22): mean-reversion flag for the break gate below.`
  old L11158: `   bool isMeanRev = (g_mtrade.regimeAtAdmission == REGIME_MEANREV);`
  (isMeanRev hits in EA = 2 = this decl plus the gate below; both go; 0-warning gate holds)
- E2 re-key gate (EA L11223-11224, 6-space indent, +2 modified):
  old L11223: `      //--- [P-VNEXT-1 E3] B-fork gate: DAY_CLOSE-minus-5 outranks body-break on mean-reversion; break suppressed here so vDAY decides (SL/TP above untouched).`
  old L11224: `      if(isTrigger && behind && through && !vBREAK && !isMeanRev)`
  new L11223: `      //--- [P-EXITRANK-1] anchor-rank gate (his 2026-09-23 rule: same-line cross never exits; only HIGHER-authority breaks exit; lower number = higher authority; amends charter 9.1(2) same-line case, supersedes E3).`
  new L11224: `      if(isTrigger && behind && through && !vBREAK && g_mtrade.anchorLine >= 0 && g_mtrade.anchorLine < POI_NLINES && g_authorityRank[k] < g_authorityRank[g_mtrade.anchorLine])`
  (loop order k=0..11 scans highest authority first; first qualifying break still wins; census prints above untouched)

## Stages (T161N discipline; RECON55 precedent)

S1 Pre-hash gate: re-hash EA (must equal 3F4D617BB8FD66CA6C74B79C62312732750D58FD08B2A250F5FFF2BDC468664F / 622604 B / 11324 lines) plus Panels 4335F703/17047/456 plus ImbalanceMgr 568F4CE9/26422/612 plus FlowLogic 956BF3E3/70308 plus single-hit plus char-code assert every OLD anchor above; assert no new buffers, seven-family plus RETESTDIAG census intact. Miss = DIAGNOSE, never assume, never revert. S2 Apply E1 plus E2 exact-diff (expected post-build EA 11324 - 2 deleted = 11322 with 2 modified asserted beside the post-hash; rest +0; convention: comment lines count, modified counted once per line, deleted counted). S3 Post-hash plus budget arithmetic from literal counts. S4 Compile both targets 0 errors 0 warnings. S5 Run under RECON50_DEMO_USD (same terminal, InpMode 1, 2026-08-26 to 2026-09-10, InpDebugLog=true), ceiling 90 min.

## Acceptance (replay segment EA5BCC5C produced by pre-build tree 3F4D617B; grade segment-vs-segment)

G1 Build: 0 errors 0 warnings both targets; post-hashes recorded; budget EA +0 new -2 deleted +2 modified from literals, rest +0; commit text prepared, commit only on token.
G2 Selection-identical (hard gate, exit-only): SIGNAL 5 / MTSNAP 5 / CTrade OrderSend 5 / TP_ELECT 10, same bars/entries (lots balance-sized); SIDE1C 10 / FRESH_VETO 4 / VETOCLEAR 4 / FRESHCOUNT 38 with RECON55-identical bars; MTCOLLISION 0 expected (RECON55 0; the election pipeline is exit-independent - a new signal while managing REPLACES via the L10102-10116 boundary, so any MTCOLLISION>0 HALTS); extended-hold windows disturb nothing (9/4 16:10-16:55 has zero seeds; 9/9 seeds die seed-locally as in RECON55); any take/election delta HALTS.
G3 State-identical plus verdict deltas: all non-exit families count-identical segment-vs-segment; EXITCENSUS verdict flips itemized bar-for-bar, every flip a same-line cross (9/4 16:10, 17:00-bar 17:05, plus any further same-line rows - each cited); no higher-break row flips to ok and no ok row flips to BREAK (either HALTS); alert kinds SIGNAL/EXIT/HEADS-UP/STAND-DOWN only.
G4 Exits: 9/4 16:10 MTEXIT absent (HELD, EXITVERDICT vBREAK=none) with DAY_CLOSE firing at the first bar at/after the 16:55 mark (fillBarTime <= mark <= barTime, mark join cited; first live fire; modulo SL/TP - either leg may validly fire first); 17:00 SHORT 17:05 MTEXIT absent (HELD same-line; later exit via SL/TP/DAY itemized, never assumed - first exit opportunity the 9/9 mark modulo TP/SL); 9/1 SL 17:50 intact (touch kept, equality unchanged per scope note); 9/7 + 9/8-10:10 TP_TOUCH identical (the 9/7 AS.H-vs-Yearly-VWAP booking flaw persists untouched - booking scope, parked for his scope word); MTEXIT POI_BODY_BREAK rows == higher-break rows only (each joined to anchor rank); DAY_CLOSE count equals eligible survivors.
L-final Graded set authoritative: G1/G2/G3/G4 above.

## Run cost and novel evidence

One build (EA one-gate re-key, STAGE-1 exact-diff gated) plus one tester run, ceiling 90 minutes, explicit values authoritative (same settings as RECON55). Novel evidence vs RECON55: (a) first DAY_CLOSE fire on a held same-line trade (9/4 16:55); (b) first same-line hold on a live trade (17:00 past 17:05); (c) 9/1 touch-kept proof (equality unchanged). Exit figures are target figures, never realized fills. This run restores one valid hold (9/4) and proves one valid exit shape preserved - rule-fidelity, never profit.

(End of file)
