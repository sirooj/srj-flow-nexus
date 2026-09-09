# PACKET P-DIVCON-B — EA divergence latch: strict latest-at-confirmation clearing
STATUS: ISSUED by the operator 2026-09-09 ("P-DIVCON-B issued") and EXECUTED AND VERIFIED the
same session — see 06_HANDOFFS\BUILDER_RESULT_161-I.md. New EA baseline AB102C0A2966B1BF9C62A8B7
9276A19563E936E9675980C95A0B8453E3A24EAC. (Original draft header below retained for the record.)

BASIS (operator ruling 2026-09-09, verbatim): "option 1 with the addition of when there is a
conflicting CQD divergence being simultaneously validated, i consider that as an invalid or i wait
for a new valid in direction of the bias to occur." + "The latest is the latest on the indicator."
Full mechanism context: 06_HANDOFFS\BUILDER_FINDING_DIVCON-1.md (§1 mechanism, §3 D3, §7 addendum).

## OBJECTIVE (one behavioral change, nothing else)
Implement the strict latest-at-confirmation consumption rule: the divergence latch mirrors THE
NEWEST CONFIRMED CQD verdict within the candidate's [anchor..evaluation] window on EVERY bar.
A matched newest holds the latch; an opposing newest CLEARS it (the requirement is invalid at that
bar); a later matched newest RE-LATCHES (the setup kept waiting and fires only then). Confirmed
lines only — the preview surface is excluded by ruling (P-DIVCON-A not needed).

## THE EDIT (one line, in the ONLY call site)
File: Experts\SRJ_FlowNexus_EA.mq5  (canonical; digest before edit MUST equal
4CD717289EDD1AB3F49FD16AC1930B60BA131CBB3B04FAA6F06DF19E413B48A1, 4,190 lines, 206,852 bytes)
Current (L2955):
    if(!g_divLatch && g_state >= ST_S1_REGIME && g_dir != DIR_NONE)
Replace with:
    if(g_state >= ST_S1_REGIME && g_dir != DIR_NONE)
Everything else at the site (L2956-2959: `string kind; g_divLatch = UpdateDivergenceLatch(barShift,
g_dir, kind);`) is UNCHANGED. The STEP 2 comment inside UpdateDivergenceLatch (L1947-1954) becomes
TRUE under this edit and stays as-is. No other line, file, or buffer changes.

## EXECUTION SEQUENCE (per .clinerules §5)
STAGE 1 — RE-HASH the EA before any write (invariant 10). Digest MUST equal the value above.
  A mismatch is DIAGNOSED (possible metadata-touch cause, R-236), never assumed, never reverted.
STAGE 2 — apply the one-line edit (literal absolute path; editor tool).
STAGE 3 — re-hash; record the NEW digest AFTER the write (invariant 4).
STAGE 4 — compile with the R-52 compiler (C:\Program Files\Dukascopy MetaTrader 5\metaeditor64.exe);
  EXPECT 0 errors 0 warnings; archive the log as 06_HANDOFFS\T161I_COMPILE.log (gitignored per R-220).
STAGE 5 — verification run, headless /config (the T161H harness shape: EURUSD M5, real ticks,
  InpDebugLog=true as tester input only, full Tier-1 superset date range).
  GATES (all measured, reported verbatim):
    a. WS161_CENSUS fields=15 loads=1728 stores=1728 mismatch=0 (loads==stores==1728).
    b. BIASCENSUS_FINAL bars=1728 fail=0, shard counts IDENTICAL to T161H; XOB-PROMOCENSUS 372=372.
    c. Signals printed verbatim and compared against T161H (08.17 16:10:01 LONG R=1.38 SL 1.15870;
       08.18 14:50:01 SHORT R=1.06 SL 1.15813). A signal delta is a RESULT, not a failure — the
       strict rule may legitimately change a late-sequence latch; any delta is reported and the
       08.18 traces compared bar-by-bar.
    d. WS161 changes count: EXPECTED TO RISE above T161H's 59 (clears + re-latches now observable).
       The rise itself is declared expected; the count is reported.
    e. Post-run EA re-hash byte-identical to the Stage 3 digest.
STAGE 6 — write 06_HANDOFFS\BUILDER_RESULT_161-I.md with the digests, the gate table, and the raw
  signal lines. NOTHING under 02_TASK_CHECKPOINTS. No git add/commit/push (separate token required).

## STOP CONDITIONS
- Any Stage 1 digest mismatch: STOP, diagnose, report. Do not revert on assumption.
- Any gate failure at Stage 5: report BLOCKED with the gate name and measured value; write nothing
  further; REVERT NOTHING (invariant 8).
- Transport truncation of any capture: say so, stop, re-issue (invariant 7).

## EXPECTED SEMANTIC CONSEQUENCES (declared a priori, from the mechanism — not predicted numbers)
- The latch becomes non-monotone: divLatch=1 periods can now END (an opposing newest) and RESUME
  (a newer matched newest). S5 waiting periods may lengthen; a signal can only fire on a bar whose
  newest confirmed divergence is direction-matched.
- 08.18 outcome UNCHANGED by mechanism analysis (no opposing verdict confirmable before 14:50:01).
- 08.17 outcome: not pre-asserted; measured at Stage 5.
