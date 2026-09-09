# BUILDER RESULT — 161-P (P-SCOPE34: the 2-of-3 kill scoped to PRE-CONFIRMATION; T161P run-verified)
Report: C:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\SRJ_FlowNexus_Local\06_HANDOFFS\BUILDER_RESULT_161-P.md
Session: 2026-09-09. Authorization: the operator's "P-EXITMODEL issued — execute
P-SCOPE34" (both packets issued in one message; P-SCOPE34 ran after P-EXITMODEL per
the packet's ORDERING). Canonical file modified: exactly ONE —
Experts\SRJ_FlowNexus_EA.mq5 (from the T161O post-state). Nothing under
02_TASK_CHECKPOINTS. No git token.

## WHAT THE FIX DID (the operator's Q4 ruling, verbatim in EXITMODEL-1 §6)
"yes, that is only pre confirmation entry. even if after entry, the structure flip
then i still hold the trade" — the 2-of-3 adverse-evidence poll now kills ONLY at
the pre-confirmation states; at the gate-check (post-confirming-close) it is
DIAGNOSTIC-ONLY (the FRESHCOUNT census keeps printing with scope=post,
verdict=HOLD), and the only cancellation there is the live bias flip (the
three-flag conjunction is the same event — spec §3.4/§5.5).
EDITS: CheckFreshness(barShift, twoOfThreeKills) — the census line gained
scope=pre/post, the verdict respects the flag, the abort return is gated by
twoOfThreeKills; the single call site (the S4_ARMED..S5_GATE_CHECK span) passes
g_state != ST_S5_GATE_CHECK. E3 comment truthing at both sites. E2: no other poll
sites exist (measured — one call site; the S2/S3 phases print FRESHSKIP only).

## STAGES (all measured)
1. S1 pre-hash PASS: 09A16FB2105035D609845DD62499D31AF477BC06940E49A7A8602EF3323F0581
   (227,030 B) = the T161O post-state.
2. S2 applied (three edits + the call site; one exact-match miss resolved by probing
   the raw lines — the P-DIVCON-B discipline).
3. S3 post-hash: 82DDAB3324E1C0A1D299D7243E3FF1DBE91FD9047D26FA2BE055B25F7BD3E709,
   228,294 B, CRLF=4606 LONELF=0 (+1,264 B, +14 lines).
4. S4 compile T161P: "Result: 0 errors, 0 warnings, 1868 ms elapsed, cpu='X64
   Regular'" (T161P_COMPILE.log, gitignored per R-220).
5. S5 run T161P: harness v2.3, T161P_P1.ini (the T161N/T161O shape). LAUNCH INCIDENT
   (declared): the first launch was REFUSED_TERMINAL_BUSY — the operator's own
   terminal had been REOPENED by them (PID 28548, 15:25) after their earlier
   authorization ("close PID 27908 yourself, run T161O + then P-SCOPE34, leave it
   closed"); the builder read that authorization as covering the P-SCOPE34 run,
   closed PID 28548, launched 15:31:37 (PID 5952), and left it closed. CORRECTION
   SLOT: if the operator wanted the terminal open, this closing is corrected on
   their word. WRAPPER INCIDENT (declared): the wrapper wrote NO DONE marker — it
   was killed before its archive step (consistent with the operator closing VS
   Code); the run itself COMPLETED ("connection closed" 16:06:33 in the journal);
   the builder completed the wrapper's archive step manually (PRE_JOURNAL_LINES
   37791 -> T161P_JOURNAL.log, 7,014-line segment) and tabulated.
   "Test passed in 0:33:26.999", 321,404 ticks, 1,728 bars; no leftover terminal
   found after the run (verified gone).

## GATES — ALL PASS
G1 compile 0/0. G2 THE IDENTITY BASE = T161O VERBATIM: WS161_LOAD NOSTORE present
   (loads=1); WS161_CENSUS fields=15 loads=1728 stores=1728 changes=79 mismatch=0;
   zero FIELD/mismatch rows; BIASCENSUS sh1 701/1027 sh2 702/1026; ZONECENSUS
   bars=1728 both=0 xobOnly=1616 fvgOnly=0 neither=112 | inWindow=576 xobInWin=548;
   XOB-PROMOCENSUS 369; CQD stream 254 (43/84/88/39); FRESHSKIP=110 SUPPRESSED=40
   ABORT=23; SIGNAL_COUNT=2 with BOTH signals verbatim (08.17 16:35:02 LONG
   Weekly-VWAP R=1.42; 08.20 09:35:04 LONG Daily-VWAP R=1.60).
G3 the exit phase reproduced T161O verbatim: MTSNAP pair identical (entries
   1.15982 / 1.16773); MTEXIT pair identical (both HTF_FLIP: 08.17 16:45 exit
   1.15921; 08.20 14:05 exit 1.16955); EXITCENSUS_ROWS=684; BREAK_ON_TRIGGER=0.
G4 THE SCOPING FIX PROVEN: FRESHCOUNT_TOTAL=19 = pre 14 + post 5;
   FRESHCOUNT_post_ABORT=0 (no post-confirmation kill fired anywhere in the
   window); FRESHCOUNT_post_CONJUNCTION=0. THE NAMED INSTANCE: "FRESHCOUNT #7
   bar=2026.08.14 18:55 state=S5_GATE_CHECK obDead=1 fvgDead=1 oppFvg=0 adverse=2
   verdict=HOLD scope=post" — the IDENTICAL poll at the IDENTICAL bar was lethal
   under the pre-fix build (adverse>=2 at the gate-check = ABORT); in T161P it
   holds, the candidate continued, AND THE SIGNAL PAIR DID NOT MOVE — the ruled
   rule implemented with zero identity drift.
G5 re-hashes after the run byte-identical: EA
   82DDAB3324E1C0A1D299D7243E3FF1DBE91FD9047D26FA2BE055B25F7BD3E709; CQD
   92F3A62B...2969F; OrderblockMgr D286621C...20B7B; FlowLogic 1EA7858F...73B08.
   NOTHING under 02_TASK_CHECKPOINTS.

## ARTIFACTS
06_HANDOFFS: BUILDER_RESULT_161-P.md (this file), T161P_TABULATION.txt,
T161P_JOURNAL.log (gitignored), T161P_COMPILE.log (gitignored).
00_CURRENT_WORKING: T161P_P1.ini, tabulate_161p.ps1, T161P_STATUS.txt (the wrapper
died before DONE — declared above).

## VERDICT (mechanical)
P-SCOPE34 EXECUTED AND VERIFIED — ALL GATES PASS. THE SPEC §8 ROW "§3.4
pre-confirmation-only scoping — not built" IS NOW BUILT AND RUN-PROVEN. NEW
BASELINE: Experts\SRJ_FlowNexus_EA.mq5 =
82DDAB3324E1C0A1D299D7243E3FF1DBE91FD9047D26FA2BE055B25F7BD3E709 (228,294 B,
4,606 CRLFs) — T161P-verified; CQD 92F3A62B... / OrderblockMgr D286621C... /
FlowLogic 1EA7858F... unchanged. BOTH ISSUED PACKETS (P-EXITMODEL + P-SCOPE34)
ARE NOW EXECUTED AND VERIFIED. OPEN FOR THE OPERATOR'S JUDGMENT: the §5.6
HTF-flip exits (MT_HTF_EXIT one-constant flip if ruled off); the exit-scope
constant (FAMILY_POC default) stands as ruled. NO git token used.
