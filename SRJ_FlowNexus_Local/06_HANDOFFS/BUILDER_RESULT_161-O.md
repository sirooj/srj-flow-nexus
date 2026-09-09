# BUILDER RESULT — 161-O (P-EXITMODEL: the section 5 exit phase; T161O run-verified)
Report: C:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\SRJ_FlowNexus_Local\06_HANDOFFS\BUILDER_RESULT_161-O.md
Session: 2026-09-09. Authorization: PACKET_P-EXITMODEL ISSUED by the operator
("P-EXITMODEL issued — execute P-SCOPE34"); the six rulings of record in
BUILDER_FINDING_EXITMODEL-1.md §6. Canonical file modified: exactly ONE —
Experts\SRJ_FlowNexus_EA.mq5. CQD, FlowLogic, the fourteen includes UNTOUCHED
(post-run re-hashes below). Nothing under 02_TASK_CHECKPOINTS. No git token.

## WHAT WAS BUILT (the §4 site-3 exit phase; ALERT-ONLY preserved)
- SManagedTrade record + g_mtrade + MtReset/MtExitName (declared AFTER the EA's own
  ENUM_SRJ_* block — the first compile attempt placed them ahead of it and failed
  30 errors, diagnosed, relocated; the #defines/enums stay at the top).
- Snapshot (MTSNAP) at the S5 commit BEFORE ResetSequence (the R-201 discipline);
  the fill is immediate at the next open (the S5 entry reference IS the fill tick).
- EvaluateManagedTrade(1) called in OnTick AFTER the entry pipeline and AFTER the
  working-set store (touches NO working-set field; spec §7 separation). Per bar at
  the NEXT open: (a) §5.5 fill/cancel lifecycle; (b) TP touch on the CURRENT nearest
  valid target (Q6 re-computed per bar, even <1R) via MtNearestTpTarget — a declared
  duplicate of ComputeNearestTpTarget's admission taking the anchor tier from the
  TRADE (the shared function reads the wiped g_anchorLine); (c) the body-close early
  exit through BEHIND trigger lines per EXIT_SCOPE (default FAMILY_POC = the six
  family POC lines + the anchor; body = open->next open; "it must be body" — Q5;
  a line's own gap/move alone never exits — Q3/§1.3); (d) SL trade-through;
  (e) §5.6 HTF-aggregate-flip exit for trend trades (MT_HTF_EXIT=true, compile-time).
- EXITCENSUS logs ALL twelve lines' verdicts per managed bar (every EXIT_SCOPE
  variant measurable from one run); EXITVERDICT summarizes; MTEXIT + the EXIT alert
  close the trade. Same-bar priority: SL > TP_TOUCH > POI_BODY_BREAK > HTF_FLIP.

## STAGES (all measured)
1. S1 pre-hash PASS: E5B0E2E4...AFEECA (207,854 B, CRLF=4204 LONELF=0).
2. S2 applied (E1-E6; the enum-order defect above is the only rework).
3. S3 post-hash: 09A16FB2105035D609845DD62499D31AF477BC06940E49A7A8602EF3323F0581,
   227,030 B, CRLF=4592 LONELF=0 (+19,176 B vs the pre-state).
4. S4 compile T161O: "Result: 0 errors, 0 warnings, 2027 ms elapsed, cpu='X64
   Regular'" (T161O_COMPILE.log, gitignored per R-220).
5. S5 run T161O: harness v2.3, T161O_P1.ini (the T161N shape). The operator's live
   terminal (PID 27908) was closed WITH THEIR EXPLICIT AUTHORIZATION before launch;
   this run's own leftover (PID 12228) closed and verified gone after. Launched
   14:24:46; "Test passed in 0:38:44.451", 321,404 ticks, 1,728 bars;
   RESULT=PASSED, DONE=15:04:29; archive T161O_JOURNAL.log (6,995-line segment).
   DECLARED (R-180 class): the shell aborted poll commands twice mid-run; completion
   was confirmed by READING the DONE marker with the IDE file-read tool (the recorded
   poll fallback); the IDE loop-guard halted five identical fallback reads (operator
   present, declared the run complete).

## GATES — ALL PASS
G1 compile 0/0. G2 THE ENTRY-SIDE IDENTITIES REPRODUCE T161N VERBATIM:
   WS161_LOAD NOSTORE present (loads=1); WS161_CENSUS fields=15 loads=1728
   stores=1728 changes=79 mismatch=0; zero FIELD/mismatch rows; BIASCENSUS sh1
   701/1027 sh2 702/1026; ZONECENSUS bars=1728 both=0 xobOnly=1616 fvgOnly=0
   neither=112 | inWindow=576 xobInWin=548 fvgInWin=0; XOB-PROMOCENSUS 369;
   CQD stream 254 (43/84/88/39); OBPROV code3=769 code4=887; FRESHCOUNT=19
   S5_WAIT=0 FRESHSKIP=110 SUPPRESSED=40 ABORT=23 (all = the T161N tabulation
   values); SIGNAL_COUNT=2 with BOTH signals verbatim (08.17 16:35:02 LONG
   Weekly-VWAP R=1.42 SL 1.15870 TP 1.16141; 08.20 09:35:04 LONG Daily-VWAP
   R=1.60 SL 1.16733 TP 1.16837).
G3 the exit phase produced lines ONLY after the signal bars: MTSNAP_COUNT=2 (at the
   two signal instants), MTCOLLISION_COUNT=0, EXITVERDICT_ROWS=57, EXITCENSUS_ROWS=
   684 (=57 managed bars x 12 lines), zero exit lines before the first signal.
G4 THE EXIT VERDICTS (the operator-judged designed observables):
   - 08.17 trade: MTSNAP entry=1.15982 (Weekly-VWAP, regime=TREND); managed 2 bars;
     MTEXIT 2026.08.17 16:45 reason=HTF_FLIP exit=1.15921. The §5.6 aggregate
     (4H/1H/15m majority) flipped against the LONG two bars after entry. THE
     OPERATOR'S OWN 08.17 TRADE HELD TO 17:10 (the W-POC break) — the EA's §5.6
     default exits EARLIER. §5.6 is spec-flagged "ruled, not measured" + toggle.
   - 08.20 trade: MTSNAP entry=1.16773 (Daily-VWAP, regime=TREND); managed 53 bars;
     MTEXIT 2026.08.20 14:05 reason=HTF_FLIP exit=1.16955 (+18.2 pts — in profit).
     The operator's row #233 (1.61R taken) has no journalled exit time to compare.
   - ZERO body-close break verdicts fired (EXITCENSUS BREAK_ON_TRIGGER=0): under
     FAMILY_POC scope no trigger line body-broke during the (short) managed
     windows. The 08.17 W-POC shape (the operator's actual exit) was never reached
     because the §5.6 exit closed the trade first — THE KEY JUDGMENT ITEM.
   - The TP touch test ran with curTp populated per bar (1.16141/1.16837/etc.);
     several bars read curTp=none (no admitted candidate ahead) — the nearest-
     valid-target mechanism working as designed.
G5 re-hashes after the run byte-identical: EA 09A16FB2...23F0581; CQD 92F3A62B...;
   OrderblockMgr D286621C...; FlowLogic 1EA7858F... . NOTHING under
   02_TASK_CHECKPOINTS.

## DECLARED LIMITATIONS / NOTES
- The EXIT alert's dir/session fields render "NONE"/"-" because EmitAlert reads the
  wiped working-set globals; fixing EmitAlert = an entry-pipeline edit (not
  authorized). The MTEXIT/EXITCENSUS/EXITVERDICT lines carry the full facts.
  Journal verbatim: "[SRJ-EA] ALERT SRJ EXIT NONE EURUSD M5 | - | NONE | HTF_FLIP
  at 1.15921 (entry 1.15982)".
- The EA's system Alert() popup is OFF in the tester (0 'Alert: SRJ SIGNAL' lines —
  the SIGNAL path behaves identically), so the EXIT alert is a journal print only.
- One managed record (the R-201 precedent): a second signal while one trade manages
  logs MTCOLLISION and REPLACES the record (did not fire; the §6 London+NY
  exception would need a registry — a separate packet item if ordered).

## ARTIFACTS
06_HANDOFFS: BUILDER_RESULT_161-O.md (this file), T161O_TABULATION.txt,
T161O_JOURNAL.log (gitignored), T161O_COMPILE.log (gitignored).
00_CURRENT_WORKING: T161O_P1.ini, tabulate_161o.ps1, T161O_STATUS.txt,
T161O_DONE.txt.

## VERDICT (mechanical)
P-EXITMODEL EXECUTED AND VERIFIED — ALL GATES PASS. THE ENTRY-SIDE IDENTITIES DID
NOT MOVE. NEW BASELINE: Experts\SRJ_FlowNexus_EA.mq5 =
09A16FB2105035D609845DD62499D31AF477BC06940E49A7A8602EF3323F0581 (227,030 B, 4,592
CRLFs) — T161O-verified; CQD 92F3A62B... / OrderblockMgr D286621C... /
FlowLogic 1EA7858F... unchanged. THE §5 EXIT PHASE EXISTS AND IS RUN-VERIFIED.
THE OPERATOR JUDGES: (1) the §5.6 HTF-flip exits (both trades exited via HTF_FLIP —
the 08.17 trade 25 min before the operator's own W-POC-break exit; MT_HTF_EXIT is a
one-constant flip to false if ruled off); (2) the exit picture under the ruled
scopes. NO git token used. P-SCOPE34 EXECUTES NEXT (issued in the same message).

