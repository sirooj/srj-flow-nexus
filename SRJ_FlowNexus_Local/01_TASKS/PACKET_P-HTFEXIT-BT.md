# PACKET P-HTFEXIT-BT — the §5.6 backtest: MT_HTF_EXIT false (one-token compile-time flip)
Status: DRAFT — NOT ISSUED — NOT EXECUTED. Written 2026-09-09 for the operator's parked
§5.6 experiment ("the experiment to consider the HTF change to invalidate or early exit
for the trend following setup is open item to backtest in the future" — HTFAUDIT-1 §1).
Issuance gate: the operator's explicit "P-HTFEXIT-BT issued" (invariant 1; the P-DIVCON-B
precedent). Canonical file touched: exactly ONE — Experts\SRJ_FlowNexus_EA.mq5 (one
token). CQD, FlowLogic, OrderblockMgr, the fourteen includes UNTOUCHED. Nothing under
02_TASK_CHECKPOINTS. No git token.

## 1. WHAT IT DOES (the experiment, nothing else)
MT_HTF_EXIT is a compile-time constant (EA L117: `#define MT_HTF_EXIT true`; spec §4:
toggles must be compile-time constants, not user inputs). The packet flips it to `false`
and re-runs the SAME Tier-1 harness window. WITH THE EXIT OFF, the two managed trades run
to the REMAINING exit tests — the §5.1 TP-touch, the §5.1/§9.1 POI body-close break
(MT_SCOPE_FAMILY_POC stands), and the SL trade-through — instead of the §5.6 HTF flip.
THE MEASUREMENT: per-trade exit bar, exit price, and resulting R for 08.17 and 08.20
under each toggle, from one run each (T161R = the true arm, already on disk; T161S = the
false arm). NO entry-pipeline edit of any kind.

## 2. THE EDIT SET (one token)
E1 — EA L117: `#define MT_HTF_EXIT          true` → `#define MT_HTF_EXIT          false`
(exact whitespace probed raw before edit; the comment above it stays).

## 3. STAGES
S1 pre-hash gate: SHA256(Experts\SRJ_FlowNexus_EA.mq5) MUST equal
   A0701893299B82370BC62AA19CA280E7064A1C46D6830D82EB7C3E65DC3FD57E (228,604 B) — a miss
   is DIAGNOSED (R-236), never assumed, never reverted.
S2 apply E1 (one token). S3 post-hash + shape (digest, bytes, CRLF/LONELF after the write).
S4 compile T161S: metaeditor64 /compile; EXPECT 0 errors 0 warnings (T161S_COMPILE.log,
   gitignored); re-hash after compile unchanged.
S5 run T161S: harness v2.3 (00_CURRENT_WORKING\run_tester_v2.ps1), T161S_P1.ini = the
   T161R_P1.ini shape (InpDebugLog=true; the same Tier-1 window 08.14-08.22). POLLING
   RULE: stage, launch detached, STOP — the operator signals completion; the builder then
   archives (manually if the wrapper died) and tabulates (tabulate_161s.ps1).
S6 gates (section 4). S7 report: 06_HANDOFFS\BUILDER_RESULT_161-S.md; post-run re-hashes
   byte-identical; the run's leftover terminal closed and verified gone.

## 4. THE GATES
G1 compile 0/0.
G2 THE ENTRY-SIDE IDENTITIES = T161R VERBATIM (the entry pipeline is untouched by E1):
   WS161 loads=stores=1728 mismatch=0, LOAD NOSTORE present, no FIELD rows (the changes
   count re-measured); BIASCENSUS sh1 701/1027 sh2 702/1026; ZONECENSUS exact
   (xobOnly=1616 fvgOnly=0 neither=112 | inWindow=576 xobInWin=548); XOB-PROMOCENSUS 369;
   OBPROV 769/887; the CQD verdict stream 493 (68/195/146/84); FRESHSKIP=110
   SUPPRESSED=40 ABORT=23; FRESHCOUNT 19 (post_ABORT=0); REGIMECENSUS=62; the SIGNAL pair
   verbatim (08.17 16:35:02 LONG Weekly-VWAP R=1.42 SL 1.15870 TP 1.16141; 08.20 09:35:04
   LONG Daily-VWAP R=1.60 SL 1.16733 TP 1.16837); MTSNAP pair identical (entries
   1.15982/1.16773).
G3 THE EXIT PHASE CHANGES BY DESIGN (measured, not gated): the MTEXIT pair and the
   EXITVERDICT/EXITCENSUS populations are RE-MEASURED and REPORTED — the packet's
   deliverable is the per-trade delta table (exit bar, exit price, per-trade R, and the
   exit reason that replaced HTF_FLIP: TP_TOUCH / POI_BREAK / SL trade-through / NONE =
   held to window end). MTCOLLISION=0 expected.
G4 THE TOGGLE PROVEN: the T161S EXITVERDICT rows carry vHTF irrelevant / no HTF-flip
   exit fires anywhere in the window (grep-verifiable), while every other census line
   matches T161R per G2.
G5 post-run re-hashes byte-identical: EA (the S3 digest), CQD BE6FD84F..., OrderblockMgr
   D286621C..., FlowLogic 1EA7858F.... NOTHING under 02_TASK_CHECKPOINTS. No git token.

## 5. STOP CONDITIONS
On ANY gate failure (G2 in particular: any entry-side identity moving = the edit touched
more than the toggle): report BLOCKED, name the gate and its measured value, write
nothing further, REVERT NOTHING. R-180 capture failures: report verbatim, probe, re-issue.

## 6. WHAT THIS PACKET DOES NOT DO
No decision on §5.6's fate — the operator already parked it; this packet only produces
the backtest data they reserved the right to request. MT_EXIT_SCOPE stays
MT_SCOPE_FAMILY_POC. No FlowLogic/HTFEngine change (P-HTFCONF's confirmed-only flavor
remains a separate, never-drafted packet). No alert/pipeline edits. No git add/commit/
push. No execution before the operator's explicit issuance.