# BUILDER RESULT — 161-I (P-DIVCON-B: the strict latest-at-confirmation latch)
Report: C:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\SRJ_FlowNexus_Local\06_HANDOFFS\BUILDER_RESULT_161-I.md
Session: 2026-09-09 (~01:45-02:25). Authorization: the operator ISSUED packet P-DIVCON-B in-session
("P-DIVCON-B issued"), packet at SRJ_FlowNexus_Local\01_TASKS\PACKET_P-DIVCON-B.md.
Canonical file modified: exactly ONE — Experts\SRJ_FlowNexus_EA.mq5, one line (EA L2955).
Artifacts: T161I_P1.ini + tabulate_161i.ps1 (00_CURRENT_WORKING); T161I_COMPILE.log +
T161I_JOURNAL.log + T161I_TABULATION.txt (06_HANDOFFS; logs gitignored per R-220).
Nothing under 02_TASK_CHECKPOINTS. No git add/commit/push.

## STAGES
1. Pre-edit re-hash: 4CD717289EDD1AB3F49FD16AC1930B60BA131CBB3B04FAA6F06DF19E413B48A1,
   206,852 B, CRLF=4190 LONELF=0 — matches the packet's expected value.
2. Edit applied: `if(!g_divLatch && g_state >= ST_S1_REGIME && g_dir != DIR_NONE)` ->
   `if(g_state >= ST_S1_REGIME && g_dir != DIR_NONE)` (L2955; the ONLY change; the walk body and
   the STEP 2 comment untouched). First editor attempt failed on whitespace and was re-issued
   against the measured raw line — declared in .clinerules, no silent retry.
3. Post-edit: SHA256 AB102C0A2966B1BF9C62A8B79276A19563E936E9675980C95A0B8453E3A24EAC,
   206,837 B (delta -15 = exactly the removed `!g_divLatch && ` token), CRLF=4190 LONELF=0.
4. Compile T161I: "Result: 0 errors, 0 warnings, 3994 ms elapsed, cpu='X64 Regular'"
   (T161I_COMPILE.log; R-52 compiler metaeditor64.exe).
5. Run T161I: headless /config (T161I_P1.ini: EURUSD M5, Model 4, JPY 10,000, InpDebugLog=true as
   tester input, 2026.08.14-2026.08.22 — the Tier-1 superset). terminal64 PID 25816 launched
   01:49:49; "Test passed in 0:27:51.849 (including ticks preprocessing 0:00:00.046)"; 321,404
   ticks, 1,728 bars; final balance 10,000 JPY (alert-only, no trades).
6. Post-run re-hashes: EA AB102C0A... (byte-identical to Stage 3); CQD
   4B2D688C6A29B1A8CA0E2F894526A63C82DAACE6846B5A339A473D03140D96C2 (untouched all session).

## GATES (all PASSED, measured)
1. WS161_CENSUS fields=15 loads=1728 stores=1728 changes=78 mismatch=0. mismatch=0; loads==stores
   ==1728. changes 59 (T161H) -> 78 (+19): the strict latch's clears/re-latches now observable —
   the packet declared this rise expected (packet section "changes count").
2. WS161_LOAD_COUNT=1 (NOSTORE first bar); WS161_MISMATCH_COUNT=0.
3. BIASCENSUS_FINAL bars=1728 fail=0; shards sh1 neg=699 zero=0 pos=1029 / sh2 neg=700 pos=1028 —
   IDENTICAL to T161H.
4. XOB-PROMOCENSUS 372 = 372 (counted like-for-like on both archived journals after resolving an
   apparent 373 — that figure had included the one ZONECENSUS_FINAL line via a combined pattern).
   ZONECENSUS_FINAL line-IDENTICAL to T161H (bars=1728 both=0 xobOnly=1616 fvgOnly=0 neither=112 |
   inWindow=576 xobInWin=548 fvgInWin=0 | samples=0).
5. CQD verdict stream IDENTICAL to T161H (the CQD is untouched): 493 census reads on 08.14-08.22;
   per-value +1=68 +2=195 -1=146 -2=84; on 08.18 the afternoon bars match T161H's stream exactly
   (14:20, 14:30, 14:40, 14:50, 15:00, 15:20, 15:25, 15:30, 15:35, ...).
6. Signals (the RULE CHANGE MADE VISIBLE):
   - 08.17 CHANGED: T161H 16:10:01 LONG R=1.38 SL 1.15870 TP 1.16141 ->
     T161I 16:35:02 LONG R=1.46 SL 1.15870 TP 1.16141 (Weekly-VWAP NYAM). MECHANISM (from the
     journal): the candidate sat at S5 with divLatch=0 through 16:10/16:15/16:20/16:25/16:30 —
     under the strict rule the newest confirmed divergence was direction-MISMATCHED there, so the
     early matched latch (which T161H's permanent latch held) no longer fires; at 16:35:01 a
     direction-matched verdict became the newest and re-latched -> SIGNAL. Same zone, same SL/TP,
     entry 25 minutes later, R improved 1.38 -> 1.46.
   - 08.18 IDENTICAL: 14:50:01 SHORT R=1.06 SL 1.15813 TP 1.15665 Daily-POC NYAM — the packet's
     a-priori analysis ("outcome unchanged; no opposing verdict confirmable before 14:50:01")
     CONFIRMED. Trace: S5 waiting divLatch=0 at 14:15/14:20/14:25; -2@14:20 latched 14:30:01
     (matched, no wait line); seq1 aborted ~14:40 (unchanged abort, not divergence-caused);
     seq2 waiting divLatch=0 at 14:45 (newest = +1@14:30 opposing — the strict hold); -2@14:40
     matched at 14:50:01 -> SIGNAL. The +2 on bar 14:45 confirmable only at 15:00 (post-signal).
   - S5_WAIT_COUNT=10 (record-only). SIGNAL_COUNT=2 (record-only).
7. Checkpoints: nothing written under 02_TASK_CHECKPOINTS (P18 held).

## ARCHIVE NOTE (declared)
T161I_JOURNAL.log (6,504 lines) is the WHOLE agent-side run log (Tester\logs\20260909.log, created
01:50). This capture contains NO "MetaTester 5 build" startup marker, so the T161H-style split was
NOT applied — the file begins at the run preamble ("Local network farm switched off", 01:49:52).
Counted complete: exactly 1 WS161_CENSUS, 1 BIASCENSUS_FINAL, 2 signals.

## VERDICT (mechanical)
P-DIVCON-B EXECUTED AND VERIFIED per its packet gates. The EA's divergence consumption now
implements the operator's ruled rule: the latch mirrors the newest CONFIRMED CQD verdict in the
candidate's [anchor..evaluation] window EVERY bar — a matched newest holds it, an opposing newest
clears it, a later matched newest re-latches (the operator's "conflicting divergence = invalid, or
i wait for a new valid in direction of the bias"). New EA baseline: AB102C0A2966B1BF9C62A8B79276A
19563E936E9675980C95A0B8453E3A24EAC (206,837 B, 4,190 CRLFs). This state is T161I-verified; the
T161H CERTIFICATION title remains attached to 4cd71728 until recertification is requested.
.ex5 observation (record-only, inadmissible as identity evidence): rebuilt by the T161I compile
from AB102C0A.
PENDING: packet P-CQD-FLAGGATE (the operator-ordered CQD same-side flag defect fix) — DRAFT, NOT
ISSUED, at SRJ_FlowNexus_Local\01_TASKS\PACKET_P-CQD-FLAGGATE.md. T161I is its CONTROL run.
