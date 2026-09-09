# BUILDER RESULT — 161-R (P-CQDRESTORE: the CQD restored + the strict fractal marking only; T161R run-verified)
Report: C:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\SRJ_FlowNexus_Local\06_HANDOFFS\BUILDER_RESULT_161-R.md
Session: 2026-09-09. Authorization: the operator's in-session directive (verbatim in
PACKET_P-CQDRESTORE.md §1) — the P-CQD-FLAGGATE UNIFY change ruled a REGRESSION; restore the
pre-change CQD and change ONLY the swing-detection validity. T161Q VOID (operator-terminated,
RESULT=UNDETERMINED 18:27:18). Canonical file touched: exactly ONE —
Indicators\SRJ_CQD_TickBased_MT5.mq5. The EA (A0701893...3FD57E with the P-HTFLOG diagnostic),
FlowLogic, OrderblockMgr, the fourteen includes UNTOUCHED. Nothing under 02_TASK_CHECKPOINTS.
No git token.

## WHAT WAS DONE
- R1 THE RECOVERY (digest-verified): the pre-change CQD found IN GIT — commit f6f7e53
  (origin/main, the initial add) blob = 50,557 B = 4B2D688C...96C2, EXACTLY the
  P-CQD-FLAGGATE Stage-1 pre-edit digest (the manual commits hold only the post-UNIFY
  92F3A62B — declared). The working file overwritten from the blob; post-copy digest
  measured = 4B2D688C...96C2. The flags (IsPriceSwing/IsCqdSwing) and BOTH divergence
  gates are back BYTE-EXACT to the pre-change behavior.
- R2 THE ONE CHANGE: IsCqdFractalHigh/Low LEFT-side strictified (>= -> >, <= -> <) — the
  classic strict-3 fractal (the CQD-FRAC-1 fix; the T161J packet's E5/E6 hunks exactly).
  Two one-token edits, -2 bytes total.

## STAGES (all measured)
S1 PASS (the restored file = 4B2D688C...96C2 before R2). S3 post-R2 CQD =
BE6FD84FB970B255F7809EF81CDDE829644DCC8B859166E8B2CEB9BF1D8A421F (50,555 B, CRLF=1454
LONELF=0). S4 T161R CQD compile "Result: 0 errors, 0 warnings, 1177 ms elapsed"
(T161R_CQDCOMPILE.log; source re-hash unchanged). S5 run T161R: harness v2.3, T161R_P1.ini
(the T161P shape): "Test passed in 0:31:07.688", 321,404 ticks, 1,728 bars. WRAPPER
INCIDENT (declared): the wrapper died before its DONE marker (consistent with the VS Code
closure); the builder completed the archive step manually — PRE_JOURNAL_LINES=46943 ->
T161R_JOURNAL.log (7,485-line segment) — and tabulated (tabulate_161r.ps1). The run's own
leftover terminal (PID 18788) closed and verified gone.

## GATES — ALL PASS (G5 carries a REPORTED DEVIATION, mechanism named)
G1 compile 0/0. G2 the restoration proof: R1 digest = 4B2D688C...96C2 exactly.
G3 THE CQD VERDICT STREAM RESTORED: CQD_DIV_TOTAL=493 (+1=68 +2=195 -1=146 -2=84) = the
   EXACT pre-change identity; the 08.18 verdicts verbatim: -2 bar=14:20 (read 14:30:01)
   and -2 bar=14:40 (read 14:50:01) PRESENT again.
G4 FLOWLOGIC-DRIVEN CENSUSES = T161P VERBATIM: BIASCENSUS sh1 701/1027 sh2 702/1026;
   ZONECENSUS bars=1728 both=0 xobOnly=1616 fvgOnly=0 neither=112 | inWindow=576
   xobInWin=548; XOB-PROMOCENSUS 369; OBPROV 769/887; HTFCENSUS 19/20/21 = 467/1261,
   663/1065, 703/1025; WS161 loads=stores=1728 mismatch=0, LOAD NOSTORE present, FIELD=0
   (changes=90 measured — the latch dynamics under the restored stream); FRESHCOUNT
   total=19 (pre 4 ABORT + 10 HOLD; post 0 ABORT + 5 HOLD — the P-SCOPE34 fix holds);
   ABORT=23; FRESHSKIP=110; SUPPRESSED=40; REGIMECENSUS=62; the XOB 2159 lifecycle
   reproduced verbatim (the single code=4 kill at 08.18 16:40 bar=121521).
G5 THE SIGNALS — SIGNAL_COUNT=2 (NOT 3): 08.17 16:35:02 LONG Weekly-VWAP R=1.42 SL
   1.15870 TP 1.16141 VERBATIM; 08.20 09:35:04 LONG Daily-VWAP R=1.60 SL 1.16733 TP
   1.16837 VERBATIM. THE 08.18 14:50 SHORT DID NOT RETURN — MEASURED, NOT SUPPRESSED:
   the restored -2 verdicts latched, and the candidate aborted at the gate-check with
   reason=TP_RR_FAIL — the 1R admission gate, NOT the divergence. CROSS-VERIFIED: T161P
   carried the IDENTICAL two TP_RR_FAIL aborts (08.18 14:30:01 + 14:50:01) — the aborts
   are latch-independent; the lifecycle is unchanged. MECHANISM: T161I's R=1.06 was
   computed with the confirming-CLOSE entry reference; P-NEXTOPEN (E2) moved the entry
   reference to the NEXT OPEN, recomputing R below 1.00 -> the 1R gate kills it. The
   divergence detection itself is FULLY RESTORED.
G6 THE HTFLOG FIELDS: EXITVERDICT_ROWS=57, WITH_ANTI=57, ANTI_MINUS1=0 — every managed
   bar logged the three legs. MTSNAP_COUNT=2 (entries 1.15982/1.16773); MTEXIT_COUNT=2
   (both HTF_FLIP: 08.17 16:45 exit 1.15921; 08.20 14:05 exit 1.16955 — verbatim);
   EXITCENSUS_ROWS=684; MTCOLLISION=0.
G7 post-run re-hashes byte-identical: EA A0701893...3FD57E (228,604 B); CQD BE6FD84F...
   (50,555 B); OrderblockMgr D286621C... (48,050 B); FlowLogic 1EA7858F... (58,657 B).
## THE P-HTFLOG PAYOFF — THE HTF LEG ANSWERS (measured, per bar)
- 08.17 trade (LONG Weekly-VWAP): bar=16:35 htfH=-1 htfM=1 htfL=1 anti=1; bar=16:40
  identical; bar=16:45 htfH=-1 htfM=1 htfL=-1 anti=2 -> EXIT. THE H4 LEG WAS AGAINST ON
  EVERY MANAGED BAR (frozen at its 16:00 open-instant replay); THE M15 LEG FLIPPED AT
  THE 16:45 BOUNDARY (its open-instant replay — the only leg that re-ran there); the H1
  leg stayed FOR throughout. The operator's chart: the confirmed 15m flip at 17:30 —
  the divergence between the EA's open-instant M15 read and the confirmed-bar read is
  now measured leg-by-leg.
- 08.20 trade (LONG Daily-VWAP): bars 09:35-13:35 htfH=1 htfM=1 htfL=1 anti=0; bars
  13:40-13:55 htfL=-1 (anti=1); bar=14:00 htfM=-1 -> anti=2 -> EXIT. THE M15 LEG WENT
  AGAINST FROM 13:40; THE H1 LEG FLIPPED AT THE 14:00 BOUNDARY; H4 stayed FOR
  throughout.
- The HTFAUDIT-1 mechanism (open-instant replays, frozen legs, repaint-at-open) is
  CONFIRMED with per-leg numbers. Any change to that mechanism (e.g. P-HTFCONF
  confirmed-only) is now measurable against this run's EXITVERDICT population.

## DECLARED
- The first tabulate_161r.ps1 stdout hit an R-180 capture failure — the tabulation FILE
  (the instrument) was verified complete via the IDE file-read; no re-issue needed.
- The wrapper died before its DONE marker (consistent with the VS Code closure); the
  archive/gates step was completed MANUALLY per the recorded protocol
  (PRE_JOURNAL_LINES=46943 -> the 7,485-line segment).
- T161Q artifacts: T161Q_COMPILE.log kept (the 0/0 compile is real); the run itself VOID.

## NEW BASELINES (T161R-verified)
- CQD: Indicators\SRJ_CQD_TickBased_MT5.mq5 =
  BE6FD84FB970B255F7809EF81CDDE829644DCC8B859166E8B2CEB9BF1D8A421F (50,555 B, 1,454
  CRLFs) — the pre-UNIFY source + exactly the strict-fractal pair; the 92F3A62B UNIFY
  state is SUPERSEDED.
- EA: A0701893...3FD57E (228,604 B, 4,610 CRLFs) unchanged; OrderblockMgr D286621C...
  unchanged; FlowLogic 1EA7858F... unchanged.

## ARTIFACTS
06_HANDOFFS: BUILDER_RESULT_161-R.md (this file), T161R_TABULATION.txt,
T161R_JOURNAL.log (gitignored), T161R_CQDCOMPILE.log (gitignored).
00_CURRENT_WORKING: T161R_P1.ini, tabulate_161r.ps1, T161R_STATUS.txt.
01_TASKS: PACKET_P-CQDRESTORE.md (ISSUED — EXECUTED).

## OPEN FOR THE OPERATOR (strategy rules — the builder's input points)
(a) The 08.18 14:50 SHORT: the divergence is marked (their indicator, restored); the
candidate latches; the 1R admission gate kills it under the next-open entry reference
(R < 1.00). If they consider that setup valid at R<1, the 1R-gate behavior is a
discretionary-rule question — the spec's 1R gate is working as specified.
(b) The divergence-validity classification of the restored stream (the 08.18 14:20/14:40
code-4s are marked again; their reserved standard governs what the EA should do with
them — currently it consumes them, per "the EA follows the indicator").

## VERDICT (mechanical)
P-CQDRESTORE EXECUTED AND VERIFIED — ALL GATES PASS (G5's deviation measured and
mechanism-named, per the packet's own terms). THE UNIFY REGRESSION IS REVERTED; the CQD
marks all divergences again with the strict fractal marking retained. NO git token;
nothing under 02_TASK_CHECKPOINTS; no canonical file beyond the ONE packet-named file.

