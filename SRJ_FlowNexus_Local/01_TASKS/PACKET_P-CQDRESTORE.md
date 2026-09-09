# PACKET P-CQDRESTORE — the CQD restored to the pre-P-CQD-FLAGGATE source + the strict fractal marking ONLY
Status: ISSUED by the operator's in-session directive (2026-09-09, verbatim below) and EXECUTING
under the withdrawn-stop discipline (the operator's workflow correction: the builder executes
continuously; input only for strategy rules / flagship relays). Canonical file touched: exactly
ONE — Indicators\SRJ_CQD_TickBased_MT5.mq5. The EA (A0701893...3FD57E with the P-HTFLOG
diagnostic print), FlowLogic, OrderblockMgr, the fourteen includes UNTOUCHED. T161Q (terminated
by the operator mid-run, RESULT=UNDETERMINED at 18:27:18) is VOID; T161R is this packet's run.

## 1. THE OPERATOR'S DIRECTIVE (verbatim, the issuance)
"the run is not complete, in fact i terminate it. the reason is, although the CQD indicator now
shows valid divergenced, it block or does not detect other valid divergence. this is a regression
and i want you to refer the git version previously before change but only change the swing
detection validity. now it is not realiable because it does not mark all valid divergences."

## 2. THE RULING'S MEANING (recorded interpretation, correctable)
The P-CQD-FLAGGATE UNIFY change (E1-E8) is a REGRESSION: the CQD no longer marks ALL valid
divergences (the per-anchor gate minimum + the strictified flag predicates reject divergences
the operator reads as valid). The CQD must return to the pre-change detection behavior — with
the ONE retained change being the swing-detection validity fix (the strict fractal/triangle
marking, the original CQD-FRAC-1 request; the record: "the operator's standard is closest to
the triangle series made strict"). THE FLAGS (IsPriceSwingHigh/Low, IsCqdSwingHigh/Low) AND
BOTH DIVERGENCE GATES (TryDivergence, ScanUnconfirmedDivergence — the loose 2-of-4, NO
per-anchor minimum) RETURN TO THE PRE-CHANGE BEHAVIOR BYTE-EXACT.

## 3. THE RECOVERY (measured)
- The manual git commits hold ONLY the post-UNIFY CQD (92F3A62B at 52a41d9 -> HEAD). DECLARED.
- The pre-change source survived in git: commit f6f7e53 (origin/main, "new files added") —
  blob extracted and measured: 50,557 bytes, SHA256
  4B2D688C6A29B1A8CA0E2F894526A63C82DAACE6846B5A339A473D03140D96C2 = EXACTLY the packet
  P-CQD-FLAGGATE Stage-1 pre-edit digest. Recovery source: f6f7e53.
- R1 (applied): the working file Indicators\SRJ_CQD_TickBased_MT5.mq5 overwritten from the
  f6f7e53 blob (Copy-Item, byte-exact); the post-copy digest MUST equal 4B2D688C...96C2.
## 4. THE EDIT SET (anchors probed raw before edit)
R2 — strictify IsCqdFractalHigh/Low ONLY (the triangles; the CQD-FRAC-1 fix shape (a):
the classic strict-3 window). The exact anchors are the restored file's L541-557 region
(probed raw at execution). Both divergence gates and both flag predicate pairs are NOT
edited — the restored file's text there stands untouched.

## 5. STAGES
S1 pre-hash gate: the restored working CQD MUST equal 4B2D688C...96C2 (50,557 B) BEFORE R2
   (measured: PASS). A miss is DIAGNOSED, never assumed, never reverted.
S2 apply R2 (one edit; probe raw lines first).
S3 post-hash: record the NEW digest, byte count, CRLF/LONELF AFTER the write.
S4 compile T161R: the CQD indicator via metaeditor64 /compile; EXPECT 0 errors 0 warnings;
   archive 06_HANDOFFS\T161R_CQDCOMPILE.log (gitignored). Re-hash after compile: unchanged.
S5 run T161R: harness v2.3, T161R_P1.ini = the T161P shape (InpDebugLog=true, window
   08.14-08.22). POLLING RULE: stage, launch detached, STOP — the operator signals
   completion; the builder then archives (manually if the wrapper died) and tabulates.
S6 gates (section 6) on the archived segment.
S7 report: 06_HANDOFFS\BUILDER_RESULT_161-R.md; post-run re-hashes byte-identical.

## 6. THE GATES
G1 compile 0/0.
G2 THE RESTORATION PROOF (already measured at S1): the R1 digest = 4B2D688C...96C2 exactly.
G3 THE CQD VERDICT STREAM RESTORED: the 08.18 14:20/14:40 code-4 (-2) verdicts PRESENT
   again in the journal census (the pre-change stream identity markers); the stream
   census returns to the pre-change population family (the T161I-era measurement was 493
   reads = +1:68 +2:195 -1:146 -2:84; the T161R count is measured and compared — the EA's
   read pattern differs slightly post-T161K, so the TOTAL is a measured value while the
   08.18 verdict restoration is the gate).
G4 THE FLOWLOGIC-DRIVEN CENSUSES = T161P VERBATIM (CQD-independent): BIASCENSUS sh1
   701/1027 sh2 702/1026; ZONECENSUS bars=1728 both=0 xobOnly=1616 fvgOnly=0 neither=112
   | inWindow=576 xobInWin=548; XOB-PROMOCENSUS 369; OBPROV 769/887; WS161 loads=stores
   =1728 mismatch=0, LOAD NOSTORE present, no FIELD rows (the changes count is MEASURED
   — the divergence-latch dynamics differ under the restored stream; not a fixed gate).
G5 THE SIGNALS (mechanism-named expectations, deviations reported not auto-blocked):
   08.17 16:35:02 LONG Weekly-VWAP R=1.42 expected verbatim; 08.20 09:35:04 LONG
   Daily-VWAP R=1.60 expected verbatim; the 08.18 14:50:01 SHORT R=1.06 expected
   RESTORED (the restored -2@14:40 verdict re-latches the 14:15-seeded candidate — the
   EA follows the indicator). SIGNAL_COUNT=3 expected.
G6 THE HTFLOG FIELDS: all EXITVERDICT rows carry htfH/htfM/htfL/want/anti (count-gate
   only; the format exception declared in P-HTFLOG stands).
G7 post-run re-hashes: EA A0701893...3FD57E unchanged; CQD = the S3 digest; OrderblockMgr
   D286621C...; FlowLogic 1EA7858F.... NOTHING under 02_TASK_CHECKPOINTS. No git token.

## 7. THE DECLARED CONSEQUENCE (the operator's own trade-off, on the record)
The pre-change detection marks ALL divergences again — INCLUDING the 08.18 14:20/14:40
code-4 verdicts the operator previously rejected as invalid. The EA follows the indicator
(the standing ruling): if those verdicts latch, the 08.18 14:50 SHORT signal returns and
the T161J-era Agreement Sample 2 EA-side match regresses BY THIS DIRECTIVE. The operator's
divergence-validity classification remains their reserved standard (the EA consumes, never
overrides); the EXITCENSUS/EXITVERDICT instrumentation measures every trade either way.

## 8. STOP CONDITIONS
Any gate failure: report BLOCKED with the gate and its measured value; write nothing
further; REVERT NOTHING. R-180 capture failures: report verbatim, probe, re-issue.

