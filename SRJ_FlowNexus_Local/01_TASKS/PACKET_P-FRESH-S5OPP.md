# PACKET P-FRESH-S5OPP — S4 FRESH-abort bar-veto for same anchor+dir (DRAFT — NOT ISSUED)

Packet: `SRJ_FlowNexus_Local\01_TASKS\PACKET_P-FRESH-S5OPP.md`
Date: 2026-09-17. Basis: operator A2 kill verdict 2026-09-17 (9/4 10:35/10:40
SHORT invalid — bias FVG invalidated + OPP FVG validated; same setup as the
previous EA version he rejected) + his v14 ruling ("MUST-DECLINE,
operator-ruled CQD-invalid" for this exact bar) + FAMILYPASS-V4 measured
kill-then-fire sequence (10:35:06 ABORT FRESH_OPP_FVG + STAND-DOWN, then
10:40 SIGNAL fire off the same 10:35 candle, R=10.35). ONE canonical file:
`Experts\SRJ_FlowNexus_EA.mq5` (baseline `AE436EBC`, 599014 B). STATUS: DRAFT
— execution awaits council issuance + operator token+word. V2 2026-09-17: answers v151 (4x issue-amended K2) — K1 WITHDRAWN
(proven no-op on own numbers: stamp 10:30 vs latch 10:35/10:40); E1c stamps
OPP-only (Luna); E1d K2 sticky-until-clean-read (Sonnet/Opus/Astra); E1e
exposes oppFvg for the clean-read clear; S4-scoped persistence+clear block;
FRESHVETO print carries vetoBar; VETOCLEAR audit row; G3 positive FRESHVETO
assertion; anchor label fixed (Daily-POC). V3 2026-09-18: answers v152 (4x
discrepancy, do-not-issue) — K3 EXACTLY-ONCE (Sonnet/Opus D1: pre-kill clean
reads must not clear); E1d BOUND/DAY enforcement (Astra); E1e anchor bytes
fixed (Opus D3); header reworded (Opus D2); dead conjunct dropped (Opus D4);
comment state qualifier (Opus D5). K2's open CLEAN contract WITHDRAWN. V4
2026-09-18: answers v153 (1 yes + 3 discrepancy, v3 HALTED) — K4 CONSUME-ON-
FIRE (Astra/Opus-D2: E1d zeroes the veto as it refuses, so a second refusal
is impossible); CLEAN ARM DROPPED whole (Luna/Opus-D3 stale-0 fail-open dies
with it; E1e dropped, no reader remains); Opus-D1(b) adopted as a G3
REPORT+HALT no-refire row (his adjudication preserved, no presumed decline
extension); D4 labels fixed. V5 2026-09-18: answers v154 (Astra-yes +
Sonnet-dependency + Opus-cosmetic + Luna-criterion) — E1b span L1008-1014,
K4 at-most-one wording, G3 tripwire reframe with bar= unpinned, five-fires
census closed on disk, Sonnet dependency closed on disk, midnight straddle
recorded. NO code change v4→v5 (words only).

## 0. WHAT THIS PACKET DOES NOT DO (scope fences)
- Does NOT give the 2-of-3 any teeth at S5: P-SCOPE34 + his Q4 ruling
  ("even if after entry, the structure flip then i still hold the trade")
  + spec §3.4 forbid post-confirmation kills except the bias flip. A cleared
  packet violating his rule fails closed — so S5 scope stays HOLD-only.
- Does NOT touch TP/SL selection (A1/A3 + STEP-4 queued separately, HIS scope
  word already delegated by priority: validity first, stop second, exit last).
- Does NOT relitigate P-SCOPE34 (header says DRAFT-NOT-ISSUED though the code
  carries it — recorded, not reopened).

## 1. WHAT CHANGES (4 small sites, entry pipeline only)
E1a — abort-reason define: inserts AFTER EA L297 (`ABORT_FRESH_OPP_FVG`, so the
new line lands at L298 — Opus D4 convention): add `#define ABORT_FRESH_VETO "FRESH_VETO"`.
E1b — veto globals: inserts AFTER EA L1007 (`g_confirmFromState`, so the new
lines land at L1008-1014 — seven lines: four comment + three declarations,
decls at L1012-1014): ResetSequence-EXEMPT (survives the abort's own
reset, like the SLIMBR shadows; never working-set members; WS161 fields stay
21). V4 K4 CONTRACT (answers Astra + Opus-D2 v153): the veto refuses AT MOST
ONE latch — E1d zeroes it as it refuses, so a second refusal is impossible
by construction (no spent flag needed; Astra's gate superseded by consume,
which is stronger). Release = BOUND/DAY only (Opus-D1(a) adopted; the CLEAN
arm is GONE — Luna/Opus-D3 stale-0 fail-open dies with it). STATE QUALIFIER
(Opus D5): the S4 clears below run only while `g_state == ST_S4_ARMED`; E1d
enforces BOUND/DAY independently at the latch.
NEW:
```
//--- [P-FRESH-S5OPP E1-K4 2026-09-18] S4 FRESH-OPP-abort veto, consume-on-fire:
//--- stamped on abort, refuses at most one latch, zeroed as it refuses. BOUND/DAY
//--- release (S4) and at the latch (E1d). ResetSequence-EXEMPT +
//--- non-working-set; WS161 stays 21.
datetime         g_freshVetoBar    = 0;
int              g_freshVetoAnchor = -1;
int              g_freshVetoDir    = -1;
```
E1c — stamp on abort (EA L7198-7207 block). OLD:
```
   if(g_state >= ST_S4_ARMED && g_state <= ST_S5_GATE_CHECK)
     {
      //--- [P-SCOPE34] the 2-of-3 kill is PRE-CONFIRMATION ONLY: at S4_ARMED the
      //--- poll kills as built; at S5_GATE_CHECK (post-confirming-close) it is
      //--- diagnostic-only (scope=post, verdict=HOLD) - the only cancellation
      //--- there is the live bias flip (the three-flag conjunction is the same
      //--- event per spec sections 3.4/5.5).
      string fail = CheckFreshness(barShift, g_state != ST_S5_GATE_CHECK);
      if(fail != "") { GoAbort(fail, g_state); return; }
     }
```
NEW (K4 per v153 — consume replaces K3's spent gate; OPP-only stamp per Luna v151 STANDS;
P-SCOPE34 comment byte-untouched; scope stands SOLELY via the OPP gate —
Opus D2 correction adopted: UPSTREAM_UNREADY S5 returns (EA L2208/2210/2211)
exist but never equal OPP_FVG, so no S5 stamp is reachable):
```
   if(g_state >= ST_S4_ARMED && g_state <= ST_S5_GATE_CHECK)
     {
      //--- [P-SCOPE34] the 2-of-3 kill is PRE-CONFIRMATION ONLY: at S4_ARMED the
      //--- poll kills as built; at S5_GATE_CHECK (post-confirming-close) it is
      //--- diagnostic-only (scope=post, verdict=HOLD) - the only cancellation
      //--- there is the live bias flip (the three-flag conjunction is the same
      //--- event per spec sections 3.4/5.5).
      string fail = CheckFreshness(barShift, g_state != ST_S5_GATE_CHECK);
      //--- [P-FRESH-S5OPP E1-K4] veto persistence, S4 ONLY, BEFORE any abort
      //--- return (Luna/Astra v152: the clear sees the fresh read even when
      //--- this poll aborts on another predicate). BOUND/DAY only — no CLEAN
      //--- arm (Luna/Opus-D3 v153: a stale-0 fail-open is unfixable in this
      //--- shape, so the arm is dropped, not narrowed). Audited by VETOCLEAR.
      if(g_state == ST_S4_ARMED && g_freshVetoBar != 0)
        {
         bool sameSetup = (g_freshVetoDir == (int)g_dir && g_freshVetoAnchor == g_anchorLine);
         string vday = StringSubstr(TimeToString(g_freshVetoBar, TIME_DATE), 0, 10);
         string cday = StringSubstr(TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE), 0, 10);
         if(!sameSetup || vday != cday)
           {
            if(InpDebugLog)
               PrintFormat("[SRJ-EA] VETOCLEAR bar=%s dir=%s why=%s",
                           TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES),
                           DirName(g_dir), (!sameSetup ? "BOUND" : "DAY"));
            g_freshVetoBar = 0; g_freshVetoAnchor = -1; g_freshVetoDir = -1;
           }
        }
      if(fail == ABORT_FRESH_OPP_FVG)
        {
         g_freshVetoBar = iTime(_Symbol, PERIOD_CURRENT, barShift);
         g_freshVetoAnchor = g_anchorLine;
         g_freshVetoDir = (int)g_dir;
         GoAbort(fail, g_state); return;
        }
      if(fail != "") { GoAbort(fail, g_state); return; }
     }
```
E1d — check at the S5 latch (before `g_latchedEntry` assignment). OLD:
```
      g_latchedEntry = currentPrice;
```
NEW (K4 per v153 — consume-on-fire; BOUND/DAY enforced at the latch per Astra
v152; no spent flag anywhere — Astra's gate and Opus-D2 superseded by consume,
which is stronger: a second refusal is impossible because the stamp is gone):
```
      //--- [P-FRESH-S5OPP E1-K4] veto (consume-on-fire): an S4 FRESH-OPP abort
      //--- for this anchor+direction refuses ONE latch (his ruled decline
      //--- rides the abort) and is zeroed as it refuses. K3's spent flag and
      //--- K2's CLEAN arm WITHDRAWN v4 (Sonnet/Opus-D1 + Luna/Opus-D3 v153).
      if(g_freshVetoBar != 0
         && (g_freshVetoDir != (int)g_dir || g_freshVetoAnchor != g_anchorLine))
        {
         if(InpDebugLog)
            PrintFormat("[SRJ-EA] VETOCLEAR bar=%s dir=%s why=BOUND",
                        TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES),
                        DirName(g_dir));
         g_freshVetoBar = 0; g_freshVetoAnchor = -1; g_freshVetoDir = -1;
        }
      if(g_freshVetoBar != 0
         && StringSubstr(TimeToString(g_freshVetoBar, TIME_DATE), 0, 10)
            != StringSubstr(TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE), 0, 10))
        {
         if(InpDebugLog)
            PrintFormat("[SRJ-EA] VETOCLEAR bar=%s dir=%s why=DAY",
                        TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES),
                        DirName(g_dir));
         g_freshVetoBar = 0; g_freshVetoAnchor = -1; g_freshVetoDir = -1;
        }
      if(g_freshVetoBar != 0
         && g_freshVetoDir == (int)g_dir
         && g_freshVetoAnchor == g_anchorLine)
        {
         if(InpDebugLog)
            PrintFormat("[SRJ-EA] FRESHVETO bar=%s dir=%s anchor=%s vetoBar=%s",
                        TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES),
                        DirName(g_dir), AnchorStr(),
                        TimeToString(g_freshVetoBar, TIME_DATE|TIME_MINUTES));
         SrjOrderEmit(barShift, "FRESH_VETO");
         g_freshVetoBar = 0; g_freshVetoAnchor = -1; g_freshVetoDir = -1;
         GoAbort(ABORT_FRESH_VETO, g_state); return;
        }
      g_latchedEntry = currentPrice;
```
E1e — DROPPED in v4 (no reader remains: the CLEAN arm is gone, so no poll
needs the last OPP value; Luna/Opus-D3 stale issue dies with the arm).

## 2. PREDICTED DELTAS (from FAMILYPASS-V4 archive `736C24E8`; V4: consume-on-fire)
- 9/4 10:40 SHORT fire (R=10.35) becomes SILENT: veto stamped at the S4 OPP
  abort (10:30-eval, Daily-POC SHORT) is still held at the 10:35 re-arm S4
  poll — which runs with n==0 (fully fresh: NO FRESHCOUNT row for bar 10:35
  although STATE S3->S4->S5 all print at event 10:40:00) — and with no CLEAN
  arm nothing clears it → FRESHVETO at the latch, veto zeroed as it refuses,
  no SIGNAL. His kill realized. (TP_ELECT shadow R=10.35 may still print —
  explicitly allowed, not a fire.)
  V2/V3 post-mortem (on record): K2 would have printed VETOCLEAR why=CLEAN at
  that silent poll and fired identically (Sonnet caught it, disk confirms);
  K3 would have killed 10:40 then released to a re-seed (Opus-D1).
- OPEN (run decides, G3 HALT row): a later same-session Daily-POC SHORT
  re-seed finds no veto (consumed) and may latch → SIGNAL. The pre-patch
  archive cannot settle it (the run entered at 10:40, so no post-10:40
  re-seed rows exist). Silence → pass; any fire → REPORT+HALT for HIS
  adjudication (G4), never auto-failed — his decline covers the 10:35/10:40
  bar, and only he can extend it.
- All five FAMILYPASS fires intact: S4 rows show oppFvg=0 (9/4 15:55, 9/7
  09:15, 9/7 16:40, 9/8 10:05; 8/28 10:00 has no FRESHCOUNT row — pre-binding
  skip, never aborted, veto never sets). No veto fires.
- 9/4 09:30 SHORTFALL (R=0.63) unchanged (dies on R, not freshness).

## 3. STAGES (per invariant 5)
- S1 pre-hash gate: expect EXACTLY `AE436EBC...FEC` (599014 B). Miss =
  BLOCKED + diagnose (never assumed drift, never reverted).
- S2 apply E1 (probe raw lines first; P-DIVCON-B whitespace discipline).
- S3 post-hash + structure verify (CRLF added lines; byte-identical outside).
- S4 compile: "Result: 0 errors, 0 warnings".
- S5 headless run (window 08-26→09-09, 3168 bars): launch detached, STOP; the
  completion signal is the operator's.
- S6 GATES (§4). S7 BUILDER_RESULT + tabulation + standing state. No git
  token; nothing under 02_TASK_CHECKPOINTS.

## 4. GATES
- G1 "Test passed", 3168 bars. G2 WS161 loads=stores mismatch=0.
- G3 MUST-FIRE: the five FAMILYPASS §2 names (3.43 / 1.74 / 4.86 / 2.35±1pt /
  2.52±1pt display bands already fenced). MUST-SILENT: 9/4 10:40 SHORT SIGNAL
  (TP_ELECT shadow allowed). POSITIVE: exactly one FRESHVETO row,
  dir=SHORT, vetoBar stamp 2026.09.04 10:30 (the bar= field is REPORTED not
  asserted — latch barShift resolves per the TP_ELECT convention to 10:35;
  one seat predicted 10:40); zero FRESHVETO rows across the
  five wanted fires; VETOCLEAR rows reported (BOUND/DAY only — no CLEAN arm
  exists, so any VETOCLEAR why=CLEAN row means a stale binary, REPORT+HALT).
  FIRES'-OWN-BARS CENSUS (Opus v154 exposure, closed on disk 2026-09-18):
  all 7 window OPP stamps inventoried — 8/26 Weekly-POC LONG, 8/26
  Weekly-VWAP LONG, 8/27 Weekly-VWAP LONG, 9/1 Yearly-POC LONG, 9/2
  Daily-VWAP SHORT, 9/4 10:30 Daily-POC SHORT, 9/4 17:20 Monthly-VWAP SHORT
  — none same-day/same-key-earlier than any of the five fires (#162 17:20
  postdates all 9/4 fires and meets no later 9/4 latch: dormant, DAY-cleared
  9/7).
  NO-REFIRE TRIPWIRE (Luna v154 framing + Opus-D1(b) v153 — REPORT+HALT, never
  auto-fail): NO `ALERT SRJ SIGNAL SHORT ... Daily-POC` on 2026.09.04 after
  10:40 through session close. This row asserts NOTHING about suppression —
  a later re-fire is MECHANISM-CONSISTENT (veto consumed at 10:40); it exists
  to halt for HIS adjudication under G4 (his decline
  covers the 10:35/10:40 bar; only he extends it). MUST-SILENT every declined day (8/26, 8/27, 8/31,
  9/1, 9/2, 9/3, 9/9 + his-invalid rows) unchanged. Any deviation =
  REPORT+HALT, revert nothing.
- G4 ADJUDICATION RULE (his C5 precedent): any fire outside the G3 set is NOT
  auto-failed — reported row-complete for HIS adjudication; fire on a day he
  marked invalid = BLOCKED per C5.
- G5 post-run digests recorded; FlowLogic untouched.

## 5. RISKS DECLARED
- The veto is NEW state (3 globals: vetoBar/vetoAnchor/vetoDir);
  WS161 count-shape must reproduce exactly (no new persisted fields — veto
  lives in ResetSequence-exempt working-set globals, G2 watches).
- If the 10:40 fire came from a legitimately NEW seed (not the aborted one),
  the veto still kills it by design (same anchor+dir, one latch — K4) — that
  IS the ruled decline (v14 covers the bar, not the seed). At most one latch
  per stamp, then the veto is gone by construction (zeroed as it refuses): a
  later same-session re-seed is decided by the run and HALTed to him (G3
  no-refire row + section 2 OPEN), never presumed. Day-long stickiness
  (Opus-D1(a) alternative, seed-identity binding) was considered and REJECTED:
  it presumes a decline extension only he can rule.
- A→B→A interleaving (Astra v152): B's latch BOUND-clears A's veto at E1d, so
  a later A re-seed fires unvetoed. DECLARED as designed staleness (the veto
  guards the next candle, not the day); a same-day A re-fire after B is
  reported under G4 for HIS adjudication, never auto-failed.
- Luna/Astra v152 contract change, superseded in v4: there is no clean-read
  branch at all anymore (E1e dropped with E1b's lastOpp/spent) — the stale-0
  fail-open Luna/Opus-D3 caught is removed with the arm, not narrowed. The
  persistence block still runs before the abort returns, so BOUND/DAY see
  every S4 poll including aborting ones.
- Anchor-index note (Opus v151 secondary, not a code change): `g_freshVetoAnchor`
  is captured pre-abort and read post-re-seed as int equality on `g_anchorLine`.
  Both alerts print Daily-POC here so it holds on this run; if a re-seed ever
  re-derives the same line to a different index, that conjunct becomes a silent
  false-negative — the run's FRESHVETO/VETOCLEAR rows will show it.
- Midnight-straddle note (Opus v154, not a code change): the stamp carries the
  poll's barShift (closed bar) while E1d compares the latch's barShift, so a
  setup spanning 00:00 can release one bar early toward the fire. Single-bar
  exposure, sessions are bounded, day-scoped by design — recorded, not fixed.
- Sonnet v154 dependency, CLOSED ON DISK 2026-09-18 (EA `AE436EBC`): the
  `g_freshVeto*` names occur 0x on disk, so ResetSequence (L6237-6264,
  enumerated members only, no wipe) cannot clear them — the stamp survives
  GoAbort→ResetSequence (L6299) by construction. SrjOrderEmit takes
  (barShift:int, outcome:string) (L5038) — the call matches; GoAbort handles
  any new code generically (LogAbort + A6REFUSED, L6268-6275); AnchorStr()
  (L1700) and int g_anchorLine (L972) check out at file scope.
- A1/A3/SLFIX/STEP-4 explicitly out of scope; their packets ride separately
  on his delegated priority, never as riders here.
- Opus v151 clean-section staleness noted: his re-verified arithmetic used
  135/53=2.55, superseded by v150's entry-consistent 2.51 — his K2 verdict
  does not depend on it; flagged so nobody re-litigates.
