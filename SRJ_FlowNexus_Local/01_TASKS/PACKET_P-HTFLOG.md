# PACKET P-HTFLOG — the EXITVERDICT print gains the three HTF leg values + anti
Status: DRAFT — NOT ISSUED — NOT EXECUTED. Written 2026-09-09 per the operator's in-session
selection ("P-HTFLOG first") after BUILDER_FINDING_HTFAUDIT-1. Issuance gate: the operator's
explicit "P-HTFLOG issued" (invariant 1; the P-DIVCON-B precedent — a selection is NOT an
issuance). Canonical file touched: exactly ONE — Experts\SRJ_FlowNexus_EA.mq5. CQD, FlowLogic,
OrderblockMgr, the fourteen includes UNTOUCHED. Nothing under 02_TASK_CHECKPOINTS. No git token.

## 1. WHAT IT DOES (diagnostic-only; spec §4's measurement-first mitigation)
The §5.6 HTF-exit question "which leg(s) voted against at 16:45 / at 14:05" is UNLOGGED
today: the EXITVERDICT line prints only the boolean vHTF (EA L4554-4563), and the three leg
values (buffers 19/20/21) live only inside the guarded block (EA L4539-4550). This packet
extends the EXITVERDICT print with the three leg values, the wanted direction, and the
anti count — ONE canonical EA edit, logging only. NO behavior change: vHTF's computation,
the exit logic, the entry pipeline, and every other census line are untouched. MT_HTF_EXIT
stays TRUE (the operator's §5.6 ruling parks the experiment; this packet only MEASURES).
DECLARED FORMAT EXCEPTION: the EXITVERDICT line format CHANGES (five additive fields). The
T161Q tabulation compares EXITVERDICT by COUNT (57) not by verbatim text; every OTHER gate
line must be byte-identical to T161P.

## 2. THE EDIT SET (anchors probed raw before edit — the P-DIVCON-B discipline)
E1 — hoist the leg variables to function scope with sentinels, assign inside the guarded
block (the ReadFlow triple, the want/anti arithmetic, and the vHTF assignment keep their
exact order and conditions; only the declaration site and the local names change):
  BEFORE (EA L4534-4552, current):
    if(MT_HTF_EXIT && !vSL && !vTP && !vBREAK)
      {
       if(g_mtrade.regimeAtAdmission == REGIME_TREND ||
          g_mtrade.regimeAtAdmission == REGIME_BOTH)
         {
          double htfH, htfM, htfL;
          if(ReadFlow(FL_BUF_HTF_HIGH, htfH, barShift) &&
             ReadFlow(FL_BUF_HTF_MID,  htfM, barShift) &&
             ReadFlow(FL_BUF_HTF_LOW,  htfL, barShift))
            {
             int want = (g_mtrade.dir == DIR_LONG) ? 1 : -1;
             int anti = 0;
             if((int)MathRound(htfH) == -want) anti++;
             if((int)MathRound(htfM) == -want) anti++;
             if((int)MathRound(htfL) == -want) anti++;
             vHTF = (anti >= 2);   // the majority flipped AGAINST the trade
            }
         }
      }
  AFTER:
    double mtlH = 0.0, mtlM = 0.0, mtlL = 0.0; // [P-HTFLOG] the HTF leg values (diagnostic)
    int    mtlWant = 0, mtlAnti = -1;          // [P-HTFLOG] anti=-1 => the leg block did not run
    if(MT_HTF_EXIT && !vSL && !vTP && !vBREAK)
      {
       if(g_mtrade.regimeAtAdmission == REGIME_TREND ||
          g_mtrade.regimeAtAdmission == REGIME_BOTH)
         {
          if(ReadFlow(FL_BUF_HTF_HIGH, mtlH, barShift) &&
             ReadFlow(FL_BUF_HTF_MID,  mtlM, barShift) &&
             ReadFlow(FL_BUF_HTF_LOW,  mtlL, barShift))
            {
             mtlWant = (g_mtrade.dir == DIR_LONG) ? 1 : -1;
             int anti = 0;
             if((int)MathRound(mtlH) == -mtlWant) anti++;
             if((int)MathRound(mtlM) == -mtlWant) anti++;
             if((int)MathRound(mtlL) == -mtlWant) anti++;
             mtlAnti = anti;
             vHTF = (anti >= 2);   // the majority flipped AGAINST the trade
            }
         }
      }
E2 — the print gains five fields (append-only; all existing fields and order preserved):
  BEFORE (EA L4554-4563): PrintFormat("[SRJ-EA] EXITVERDICT bar=%s dir=%s entry=%s curTp=%s
    vSL=%d vTP=%d vBREAK=%s vHTF=%d scope=%d", ..., (int)vHTF, (int)MT_EXIT_SCOPE);
  AFTER: the format string gains " htfH=%g htfM=%g htfL=%g want=%d anti=%d" and the argument
    list gains mtlH, mtlM, mtlL, mtlWant, mtlAnti after (int)MT_EXIT_SCOPE.

## 3. STAGES
S1 pre-hash gate: SHA256(Experts\SRJ_FlowNexus_EA.mq5) MUST equal
   82DDAB3324E1C0A1D299D7243E3FF1DBE91FD9047D26FA2BE055B25F7BD3E709 (228,294 B, 4,606
   CRLFs — the T161P-verified baseline). A miss is DIAGNOSED (R-236 class), never assumed,
   never reverted on assumption; report BLOCKED with the measured value.
S2 apply E1 then E2 (probe raw lines first; one edit at a time).
S3 post-hash + shape: record the digest, byte count, CRLF/LONELF counts AFTER the write.
S4 compile T161Q: expect "0 errors, 0 warnings" (metaeditor CLI, the T161P command shape;
   log T161Q_COMPILE.log, gitignored per R-220). Re-hash after compile: unchanged.
S5 run T161Q: harness v2.3 (00_CURRENT_WORKING\run_tester_v2.ps1), T161Q_P1.ini = the
   T161P_P1.ini shape (InpDebugLog=true; the same Tier-1 window 08.14-08.22). POLLING RULE:
   stage everything, close nothing without authorization, launch detached, then STOP — the
   OPERATOR signals completion; the builder then completes the archive/gates step (manually
   if the wrapper died with VS Code closed: PRE_JOURNAL_LINES -> segment -> tabulate).
S6 gates (section 4) on the archived segment; tabulation T161Q_TABULATION.txt
   (tabulate_161q.ps1 = the 161p script + the EXITVERDICT field extraction).
S7 report: BUILDER_RESULT_161-Q.md; post-run re-hashes byte-identical (EA + CQD +
   OrderblockMgr + FlowLogic); the run's own leftover terminal closed and verified gone.

## 4. THE GATES
G1 compile 0/0.
G2 THE ENTRY-SIDE IDENTITIES = T161P VERBATIM: WS161 loads=stores=1728 changes=79
   mismatch=0 (LOAD NOSTORE present); BIASCENSUS sh1 701/1027 sh2 702/1026; ZONECENSUS
   bars=1728 both=0 xobOnly=1616 fvgOnly=0 neither=112 | inWindow=576 xobInWin=548;
   XOB-PROMOCENSUS 369; CQD stream 254 (43/84/88/39); OBPROV 769/887; FRESHCOUNT
   pre=14 post=5 post_ABORT=0; FRESHSKIP=110 SUPPRESSED=40 ABORT=23; SIGNAL_COUNT=2 with
   BOTH signals verbatim (08.17 16:35:02 LONG Weekly-VWAP R=1.42; 08.20 09:35:04 LONG
   Daily-VWAP R=1.60).
G3 THE EXIT-PHASE COUNTS = T161P: MTSNAP_COUNT=2 (entries 1.15982 / 1.16773);
   MTCOLLISION=0; MTEXIT pair identical (both HTF_FLIP: 08.17 16:45 exit 1.15921;
   08.20 14:05 exit 1.16955); EXITCENSUS_ROWS=684; BREAK_ON_TRIGGER=0;
   EXITVERDICT_ROWS=57 (count-gate only — the line FORMAT is excepted per §1).
G4 THE NEW FIELDS PRESENT AND READABLE: all 57 EXITVERDICT rows carry
   htfH/htfM/htfL/want/anti; on every row anti != -1 (the block ran for both trend
   trades); THE TWO EXIT ROWS show anti>=2 with want=1 (both trades LONG) and the three
   leg values from which the against-votes are read off directly — THE MEASUREMENT THIS
   PACKET EXISTS FOR (which leg(s) voted against at 16:45 and at 14:00-14:05).
G5 post-run re-hashes byte-identical: EA (the S3 digest), CQD 92F3A62B..., OrderblockMgr
   D286621C..., FlowLogic 1EA7858F.... NOTHING under 02_TASK_CHECKPOINTS.

## 5. STOP CONDITIONS
On ANY gate failure: report BLOCKED, name the gate and its measured value, write nothing
further, REVERT NOTHING. On S1 miss: diagnose (the metadata-touch cause, R-236), never
assume drift. On any R-180 capture failure: report verbatim, probe trivial, re-issue.

## 6. WHAT THIS PACKET DOES NOT DO
No behavior change of any kind (the vHTF arithmetic is reproduced verbatim). MT_HTF_EXIT
stays TRUE. No FlowLogic change (the live-vs-confirmed flavor question = separate packet
P-HTFCONF, NOT drafted as issued, decision deferred to the operator on the T161Q
evidence). No entry-pipeline edit. No git add/commit/push. No execution before the
operator's explicit issuance.

