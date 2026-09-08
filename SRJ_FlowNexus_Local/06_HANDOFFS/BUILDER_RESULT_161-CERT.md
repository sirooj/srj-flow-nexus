# BUILDER RESULT — 161-CERT (certification of the on-disk EA state)
Report destination: C:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\SRJ_FlowNexus_Local\06_HANDOFFS\BUILDER_RESULT_161-CERT.md
Session: 2026-09-08 late evening (operator present). Authorization: operator direct (council of record), option chosen: "Certify, then CQD audit".
Production files modified: ZERO canonical sources. Artifacts written: T161H_P1.ini + tabulate_161h.ps1 (00_CURRENT_WORKING); T161H_COMPILE.log + T161H_JOURNAL.log + T161H_TABULATION.txt (06_HANDOFFS). Nothing under 02_TASK_CHECKPOINTS. No git mutations (no add/commit/push; history untouched).

## 1. WHY THIS EXISTS (the digest miss, diagnosed)
Session-start re-hash (§8.2) found the working-tree EA at SHA256
4CD717289EDD1AB3F49FD16AC1930B60BA131CBB3B04FAA6F06DF19E413B48A1, 4,190 lines, 206,852 bytes,
CRLF=4190 LONELF=0, UTF-8 BOM, NONASCII=369 — matching NO digest in the record (§6 abe5aaaf/4,131;
§7.1 27569701/4,179). Content changed (+11 net lines), so not the R-236 mtime-only effect.
Diagnosis (read-only): working tree CLEAN vs HEAD; HEAD 2049ae8 (relay packaging; did not touch the EA);
the last EA-touching commit is 71c50ab, which in real ancestry sits ABOVE STEP 2's 7080c06
(§7.1's stated linear order was wrong); diff 7080c06->HEAD = +14/-3, verbatim one thing: the S3-arming
copy's SL-leg in-play reconciliation (ComputeSlReference "S3ARM" tag; bound extended to the
stop-reference swing with the stop swing as terminator; promotion-time bound kept as fail-safe;
[STEP 1 / charter ruling 3] comment block). Commit-message digests (2f996de9 in 71c50ab and
b4300f7) match no recorded state.
T161G archaeology: T161G_JOURNAL.log is byte-identical to T161REG_JOURNAL.log (both 60E37711...) —
a copy, not a run; T161G_COMPILE.log exists ("0 errors, 0 warnings, 1898 ms") with unrecorded
provenance.
Content check: BOTH steps present in the on-disk file (L1947 [STEP 2 / operator ruling];
STEP 1 SL-leg markers at L2276, L3358, L3649) — i.e., the complete declared STEP 1 four-copy scope
+ the STEP 2 gate. Conclusion: benign content, broken bookkeeping; never certified until this run.

## 2. CERTIFICATION (T161H), all measured
- Pre-compile re-hash: 4cd71728..., 4,190 lines (invariant 10 held).
- Chain of custody: git diff --stat af5a9bf HEAD -- Include/ Indicators/SRJ_FlowLogic.mq5 = EMPTY
  (the fifteen non-EA canonical files bit-identical to the state verified 15/15 at af5a9bf).
- Compiler per R-52/origin.txt (re-read live): C:\Program Files\Dukascopy MetaTrader
  5\metaeditor64.exe. Compile T161H: "Result: 0 errors, 0 warnings, 6011 ms elapsed,
  cpu='X64 Regular'" (T161H_COMPILE.log). Source untouched by the compile (re-hash after
  compile: 4cd71728...).
- Harness run: headless /config (T161H_P1.ini: EURUSD M5, model 4 real ticks, JPY 10,000,
  InpDebugLog=true as tester input only, dates 2026.08.14-2026.08.22). Instance PID 29076 after
  the operator authorized closing the leftover instance (PID 12144, the prior session's T161F run).
  Run: 321,404 ticks, 1,728 bars, "Test passed in 0:26:56.152". Journal split at the MetaTester
  startup marker (23:20:31 "MetaTester 5 build 6182") and archived: T161H_JOURNAL.log
  (6,419 lines, split-verified: exactly 1 census, 2 signals).

- GATES, all PASSED:
  1. WS161_CENSUS fields=15 loads=1728 stores=1728 changes=59 mismatch=0 — IDENTICAL to
     T161F (STEP 2). WS161_LOAD_COUNT=1 (NOSTORE first bar); WS161_MISMATCH_COUNT=0.
  2. Census identity: BIASCENSUS_FINAL bars=1728 fail=0, shard counts IDENTICAL to T161F's
     (sh1 neg=699 zero=0 pos=1029; sh2 neg=700 pos=1028); XOB-PROMOCENSUS 372 = T161F's 372.
  3. Signals: 08.18 14:50:01 SHORT R=1.06 SL 1.15813 TP 1.15665 IDENTICAL to T161F.
     08.17 = 16:10:01 LONG R=1.38 SL 1.15870 TP 1.16141 — exactly the STEP 1 four-copy
     behavior (the "new early admission, ten minutes earlier than Tier-1's 16:20, R=1.38"
     measured in the T161D/E verification); the restored S3ARM copy re-enables it.
     Tier-1's SL 1.15870 present.
  4. Post-run EA digest: 4cd71728... BYTE-IDENTICAL (the run touched no source).
- Tabulation (T161H_TABULATION.txt, 53 lines): S3INPLAY 47 bars, inPlay=1 on 32 (via
  BAR=2 SWING1=5 SWING2=1); XOBINPLAY capped 47, capHit=1 on 2; XOBINPLAY2 cls2 BOTH=7
  LEGACYONLY=25 WIDEONLY=6 NEITHER=9, REACHED2_1=45 REACHED2_0=2 (both unbounded;
  REACHED2_0 in both packet windows 0/0 — no abort); ZONEPICK 47 haveFvg=0 downgraded=0;
  ZONEID 67 promoT_unset=0; XOBPROMO 47; SLSRC_COUNT=171 with SLSRC_1swing=0 SLSRC_2swing=0
  and the obStruct trio=0 — DECLARED TABULATOR PATTERN GAP: the STEP 0 script's
  sl_mode/trio regexes do not match the current SLSRC print format; the zeros are a
  script gap, not a behavior anomaly. SLSIDEGUARD 30 (noProtectiveSideSwing=9);
  SLZONEGUARD 0.
- P18 held: newest 02_TASK_CHECKPOINTS entry 9/6/2026 5:11:18 PM (Rev062_Task160_Contracts);
  the record's "Task-160 snapshot 20:57:01" entry was not visible at top level this session
  (noted, not gating). Nothing was written under 02_TASK_CHECKPOINTS this session.
- .ex5 observation (record-only, inadmissible as identity evidence): 127,354 B @
  9/8/2026 11:12:15 PM, built from 4cd71728 by the T161H compile.

## CERTIFICATION VERDICT (mechanical)
  provenance: on-disk EA = HEAD-committed, clean tree, complete declared STEP 1+2 scope
  compile T161H: 0 errors, 0 warnings
  run T161H: Test passed, 1,728 bars; WS161 mismatch=0 loads=stores=1728; census identity held
  signals: 08.17 16:10 LONG R=1.38 (STEP 1 behavior restored) + 08.18 14:50 SHORT R=1.06 (held)
  digests: source 4cd71728 before and after the run; fifteen non-EA canonical files EQUAL by
  diff lineage; no canonical source edited by this certification
  checkpoints: 02_TASK_CHECKPOINTS untouched all session (P18 held)
No revert performed at any point. The 4cd71728 state is hereby CERTIFIED as the working baseline.
Caveat: the T161F-era tabulations were measured on a source lacking the S3ARM hunk; T161H
supersedes them. The 08.18 14:50 SHORT remains the known FALSE POSITIVE (divergence encoding +
anchor tier — the CQD audit and the anchor-tier rule are the open items).
