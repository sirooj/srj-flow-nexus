# PACKET P-FIX-S2POLL - issued by council, relayed by operator 2026-09-11
Builder may execute on the operator's token. Three edits, one canonical file, one compile, one full-window run. E4 deferred to a separate packet (section 5 of the verbatim).
STATUS: ISSUED + EXECUTED AND VERIFIED 2026-09-11 (operator token "issue P-FIX-S2POLL"). S1 pre-hash PASS (7BB1E9B6...C3CB3C). S2 E1-E3 applied (E1 atomic stop pair + S2POLL_NO_SL_REF abort; E2 distinctness + stop-swing witness; E3 gate if(s3_haveStop) + haveStop field). S3 post-hash 1478ADCF...BA74 (261040 B). S4 T162_FIXS2POLL compile "Result: 0 errors, 0 warnings, 2247 ms elapsed". S5 run RECON4-FIXS2POLL PASSED ("Test passed in 0:48:57.099", 563338 ticks, 3168 bars; completed 17:03:44; wrapper died before DONE, archive completed manually per protocol; SEG=15319). S6/S7 gates ALL PASS - see 06_HANDOFFS\BUILDER_RESULT_RECON4-FIXS2POLL.md. NEW EA BASELINE: 1478ADCF9DC2DC57C73A53002E7690723841A9E06E3DA161EB32526669CBBA74 (261040 B) - the 7BB1E9B6 state SUPERSEDED.
Condensed sections 1-4 below; COUNCIL VERBATIM filed after the --- governs over the condensation; E1/E2/E3 edit blocks applied verbatim from the council text at execution.

## 1. Identity baseline moves less than relay states (council correction)
E1 is byte-identical in-window (SWINGPICK site=S2POLL 468 = SL_REF site=S2POLL 468, DIFF=0; failure path never executed; new abort zero instances). E2 + E3 MOVE. Gives a bisect: census differences E2/E3 cannot account for = E1 not inert = edit wrong.
Scope: DIFF=0 established for the debug configuration only.
Classes: E1 unchanged/unchanged; E2 moves (INPLAYCOMMIT values); E3 moves both directions (one field appended).

## 2. E1 - atomic stop capture, fail-closed
Anchor EvaluateClosedBar, unique string ComputeSlReference(barShift, g_dir, slRef, slMode, "S2POLL"). Replace the 3-line dangling-if with the council E1 block: slRef=0.0 + SL_MODE_NONE init; if(!ComputeSlReference(...)) { InpDebugLog S2POLL_NO_SL_REF print; GoAbort(ABORT_NO_SL_REF, g_state); return; } s1_stopRef=slRef; s1_haveStop=true. Bare scope block after LEFT VERBATIM. Reason code REUSES ABORT_NO_SL_REF (sibling precedent ABORT_NO_TP_TARGET at S2POLL + S5). Declared: in-window zero instances; out-of-window S2POLL failure now kills candidate (S5 NO_SL_REF population re-attributes to S2POLL, same string, different debug line). Four consumers (ZoneInPlay, ZoneAdoptable, ReadQualifyingZone, S3 ladder) get valid-or-absent pair; zero-stop asymmetric walk becomes unreachable. Variant (operator-narrower): return alone instead of GoAbort+return; council recommends abort form.
## 3. E2 - stop swing is a witness (operator Q2)
Anchor Task-133 walk, unique string //--- [STEP 1] the SL-leg terminator: the walk ends at the stop swing. Add t133_prev/t133_havePrev/t133_haveStop decls + t133_haveStop=s3_haveStop after s3 init. Replace walk body from EMPTY_VALUE continue through hits block with council E2 block: distinctness filter (ZoneInPlay idiom verbatim; first swing distinct by construction), then test-containment-then-break (SUPERSEDED retained per P4). Declared: s31_inPlay 0->1 where stop swing is sole witness (intended gain); not strictly monotone (distinctness can drop a boundary hit); t133_swings raw-count -> turn-count; deliberate first-swing divergence from ZoneInPlay (unseeded start at barShift).
## 4. E3 - close the unbounded cell, per Q3
See verbatim §4 below for the full block (anchor + replacement + haveStop field + cell table + FVG out-of-scope).

---
## COUNCIL VERBATIM (filed from the operator's paste 2026-09-11; this section governs over the condensation above)
### 1. The identity baseline moves less than the relay states
Relay section 2: *"The fix changes walk bounds on the ruled path, so it cannot reproduce RECON3-BUILD3 verbatim."*
That is true of E2 and E3. It is **not** true of E1. Your own probe proves it: `SWINGPICK site=S2POLL` 468 = `SL_REF site=S2POLL` 468, DIFF=0. The failure path never executed in-window, so on this window the corrupted pair `(s1_haveStop=true, s1_stopRef=0.0)` never existed, and every consumer of the pair already received correct values. E1 is therefore **byte-identical in-window, journal included** — the new abort has zero instances and prints no line.
This matters operationally: it gives you a bisect. If the post-fix run shows a census difference that E2 and E3 cannot account for, the E1 brace was not inert and something else in the edit is wrong. Without this split, any difference is unattributable.
Scope note on the evidence: `SWINGPICK` prints only under `InpDebugLog`, so DIFF=0 is established for the RECON1_P1.ini debug configuration. It does not speak for a debug-off run.
Identity classes for this packet:
| Edit | Signal set | Journal shape |
|---|---|---|
| E1 | unchanged in-window (proved) | unchanged in-window |
| E2 | **moves** | `INPLAYCOMMIT` field values move |
| E3 | **moves**, in two opposite directions | one field appended |
### 2. E1 — atomic stop capture, fail-closed
**Anchor:** `EvaluateClosedBar`, inside the `if(g_state >= ST_S2_LTF_ALIGN && g_state <= ST_S5_GATE_CHECK)` block. Unique anchor string: `ComputeSlReference(barShift, g_dir, slRef, slMode, "S2POLL")`.
Replace:
```cpp
      double slRef; ENUM_SRJ_SLMODE slMode;
      if(ComputeSlReference(barShift, g_dir, slRef, slMode, "S2POLL"))
         s1_stopRef = slRef; s1_haveStop = true;
```
with:
```cpp
      //--- [P-FIX-S2POLL E1 / operator Q1+Q3 2026-09-11] The stop pair is ATOMIC:
      //--- both set on success, both absent on failure. The superseded form had the
      //--- if governing ONE statement, so s1_haveStop=true was unconditional and the
      //--- scope block below read slRef on the failure path. #property strict does
      //--- not diagnose that shape. Fail-closed per Q3 ("SL should be present at all
      //--- times"), following the sibling gate in this same block: ABORT_NO_TP_TARGET
      //--- already kills across S2..S5 from here, and this is its stop-side twin.
      //--- SUPERSEDED, retained per P4:
      //---   if(ComputeSlReference(barShift, g_dir, slRef, slMode, "S2POLL"))
      //---      s1_stopRef = slRef; s1_haveStop = true;
      double slRef = 0.0; ENUM_SRJ_SLMODE slMode = SL_MODE_NONE;
      if(!ComputeSlReference(barShift, g_dir, slRef, slMode, "S2POLL"))
        {
         if(InpDebugLog)
            PrintFormat("[SRJ-EA] %s S2POLL_NO_SL_REF state=%s dir=%s",
                        TimeToString(TimeCurrent(), TIME_DATE|TIME_SECONDS),
                        StateName(g_state), DirName(g_dir));
         GoAbort(ABORT_NO_SL_REF, g_state);
         return;
        }
      s1_stopRef  = slRef;
      s1_haveStop = true;
```
The bare scope block that follows is **left verbatim**, braces and indentation included. It is now provably reached only on success, and leaving it untouched keeps `ZONESHADOW` and `S2POLL_RR_SHORTFALL` byte-identical.

### 3. E2 — the stop swing is a witness (operator Q2)
**Anchor:** the Task 133 committed walk, unique anchor string `//--- [STEP 1] the SL-leg terminator: the walk ends at the stop swing`.
Two changes: add a distinctness filter, and move the containment test **above** the terminator.
Add to the t133 local declarations, after `datetime t133_bound   = 0;`:
```cpp
      double   t133_prev     = 0.0;
      bool     t133_havePrev = false;
      bool     t133_haveStop = false;   // hoisted mirror of s3_haveStop for the print
```
and assign `t133_haveStop = s3_haveStop;` immediately after the `s3_haveStop` initialisation.
Replace the walk body from `if(t133_v == EMPTY_VALUE || t133_v <= 0.0)  continue;` through the closing of the hits block:
```cpp
               if(t133_v == EMPTY_VALUE || t133_v <= 0.0)  continue;
               //--- [P-FIX-S2POLL E2] distinctness: one turn of the bigger move is
               //--- one swing. This is the ZoneInPlay / ZoneAdoptable / S3-ladder
               //--- idiom verbatim, so t133_swings becomes comparable to theirs.
               //--- The walk starts at barShift with no seed swing, so the first
               //--- swing is distinct by construction (havePrev false).
               if(t133_havePrev && MathAbs(t133_v - t133_prev) <= _Point) continue;
               t133_prev     = t133_v;
               t133_havePrev = true;
               t133_swings++;
               //--- [P-FIX-S2POLL E2 / operator Q2 2026-09-11: "count the SL leg not
               //--- the latest structure leg"] The STOP SWING ITSELF IS A WITNESS.
               //--- Order is test-containment-then-break, matching all three other
               //--- implementations. The superseded order broke first, so the walk
               //--- could not see the one witness class on record - the swing the
               //--- stop was placed at.
               //--- SUPERSEDED, retained per P4: the terminator stood HERE, above
               //--- t133_swings++ and above the containment test.
               if(t133_v >= s31_zLo && t133_v <= s31_zHi)
                 {
                  t133_hits++;
                  if(t133_first < 0) { t133_first = t133_s; t133_firstV = t133_v; }
                  if(t133_via == "none") t133_via = "SWING";
                 }
               if(s3_haveStop && ((g_dir == DIR_LONG) ? (t133_v <= s3_slRef)
                                                      : (t133_v >= s3_slRef))) break;
```
**Declared consequences.**
- `s31_inPlay` flips 0→1 on S3 bars where the stop swing is the only witness inside the zone. That is the intended admission gain and the direct implementation of Q2.
- **Not strictly monotone.** Moving containment above the terminator can only add a hit, but the distinctness filter can in principle drop one: a swing inside the zone whose distinct predecessor sat within one point *outside* a zone boundary is now skipped. Boundary-only, expected rare, but stated rather than claimed away.
- `t133_swings` changes meaning from raw-slot count to turn count. Any prior reading of that field is not comparable across the baseline move.
- One divergence from `ZoneInPlay` remains and is deliberate: that function seeds `prev` from `FindNearestSwing` and starts at `sh1+1`; t133 starts at `barShift` unseeded. Counts of the first swing therefore differ by construction.


### 4. E3 — close the unbounded cell, per Q3
**Anchor:** unique string `if(t133_bounded || !s3_haveStop)`.
```cpp
         //--- [P-FIX-S2POLL E3 / operator Q3 2026-09-11: "SL should be present at
         //--- all times"] The SL LEG IS THE BOUND. Superseded gate admitted the
         //--- (!bounded && !haveStop) cell, where the time terminator is disabled by
         //--- !s3_haveStop AND the stop terminator is disabled by s3_haveStop, so the
         //--- walk ran the full history and admitted on any swing anywhere - the
         //--- opposite of the fail-closed claim in the Task 133 comment.
         //--- SUPERSEDED, retained per P4:
         //---   if(t133_bounded || !s3_haveStop)
         if(s3_haveStop)
```
The two terminator lines inside the walk are **unchanged**. The `bounded && haveStop` cell keeps its current behaviour exactly: SL-leg terminator live, promotion-time terminator disabled.
Append to the `INPLAYCOMMIT` format string, at the **end** so positional parsers are unaffected: ` haveStop=%d`, argument `(int)t133_haveStop`.
**Cell-by-cell effect. Two cells change, in opposite directions, and both are ruled:**
| bounded | haveStop | today | after E3 |
|---|---|---|---|
| 1 | 1 | walk, SL-leg bound | **unchanged** (dominant population) |
| 0 | 1 | not entered, committed=0 | walk, SL-leg bound — **admission widens** |
| 1 | 0 | walk, promotion-time bound | refused, committed=0 — **admission narrows** |
| 0 | 0 | full-history walk (defect) | refused — **defect closed** |
The third row retires the promotion-time bound from the live path. That is the correct reading of Q3 — no stop, no arming — and it is smaller than it looks: the STEP 1 charter ruling already disabled the promotion bound whenever a stop exists, so this only removes the stop-absent fallback. The bound survives intact in the `XOBINPLAY` and `XOBINPLAY2` shadow censuses, so the Task 133 comparison remains available.

### 5. E4 deferred — and one of its trims is not a trim
Council declines to fold E4 into this packet, for one reason: **E4 changes the instrument used to verify E1–E3.** The `SWINGPICK` / `SL_REF site=S3ARM` lines and the `SWINGDUMP` numbering are exactly the evidence that attributes the new signal set. Moving the ruler and the measurement in the same run destroys attribution, and the operator has one run to spend.
Sequence it as **P-TRIM-S2POLL**, issued after the new baseline is established and tabulated.
One finding from re-checking E4 that must not be lost:
**The duplicate-call removal is not identity-preserving as written.** The relay's E4 says "reuse `s1_stopRef`/`s1_haveStop` instead of the duplicate S3ARM call". Naive substitution changes behaviour on same-bar seed cascades: on a bar entering at `ST_IDLE`, the S2POLL block is skipped (state not yet in range), the IDLE block seeds, and the cascade reaches S3 in the same pass with `s1_haveStop == false`. Today the S3ARM call runs fresh and may succeed. Substitution would hand the arming gate a false `haveStop` — and under E3 that now means **refuse to arm**. Silent admission loss on a population nobody measured.
The identity-preserving form is memoisation, not substitution: a per-bar cache keyed on `(barTime, g_dir)` with a valid flag, computed on first demand. On S2..S5 bars S2POLL populates it and S3ARM reuses; on seed-cascade bars S3ARM is the first demand and gets today's value. Inputs to `ComputeSlReference` are `barShift`, `g_dir` and FlowLogic buffers, none of which move within a bar, so the cached value equals the recomputed one. Signal-identity preserving; journal shape moves, because the second call's prints disappear and the `s_swingDumps` counter renumbers.
The other three trims are clean: the two dead `ReadFlow` calls (overwritten by `FindNearestSwing` on every path, including its false path which writes 0.0), the `Bars()` hoist, and the single-direction `FindNearestSwing`. The last one changes the `SWINGPICK` line's non-direction side from a value to `-`.
**Imbalance criterion — separate packet, not this one.** The "a swing without an imbalance behind it cannot be the one-swing stop" datum is admission-changing inside the 1-swing branch, which this packet does not touch at all. Folding it in would make the stop reference and the in-play bound move in the same run, and the two are the inputs to each other. Sequence as **P-SL-IMBALANCE** after P-FIX-S2POLL is tabulated.

**Out of scope, declared:** the FVG-sourced path. When `haveFvg` is true, `t133_applied` is false and `s31_inPlay` keeps the legacy ladder verdict, which consumes the stop pair under the prior council's Part 1.1 SWING2 fallback. Q3 arguably reaches it. It has zero live instances (EA-120 limb 2, `haveFvg` false on every measured bar), and changing ruled behaviour with no measurable population is not something this packet should do.

**Reason code: reuse `ABORT_NO_SL_REF`, do not mint a new one.** The precedent is exact and sits in the same block — `ABORT_NO_TP_TARGET` is emitted at both the S2POLL site and the S5 site, with the `S2POLL_NO_TP_TARGET` / `S5_NO_TP_TARGET` debug lines carrying the attribution. `S2POLL_NO_SL_REF` above is the stop-side equivalent. No new `#define`, no `ENUM_SRJ_REJECTION` append, no vocabulary growth.
**Declared consequences.**
- In-window: zero instances. Nothing changes.
- Out of window: a bar where `ComputeSlReference` fails at S2POLL now kills the candidate instead of continuing with a zero stop. At S5 this preempts the existing `S5_NO_SL_REF` abort, so that population re-attributes from `NO_SL_REF` at S5 to `NO_SL_REF` at S2POLL — same reason string, different debug line. Not a new death; the S5 call would have failed identically on the same inputs.

### 6. Zero-run probes to run before the packet executes
These need no backtest and answer questions the run cannot separate afterwards.
**Probe A — E3 cell census.** On `RECON3-BUILD3_JOURNAL.log`, over `INPLAYCOMMIT` lines with `applied=1`:
- `bounded=1` **and** a `SL_REF ... site=S3ARM` line on the same `bar=` → cell (1,1), unchanged. Expect this to dominate.
- `bounded=0 scanned=0` → cell (0,1). **E3 opens these.** Not entered today, so `scanned` is 0.
- `bounded=1` and **no** `SL_REF site=S3ARM` on that bar → cell (1,0). **E3 closes these.** This is the admission-narrowing count, and the operator should see the number before the run.
- `bounded=0 scanned>0` → the defect cell (0,0). Expected 0 given DIFF=0 at S2POLL, but S3ARM is a separate call and is not covered by that probe.
**Probe B — E2 blast radius.** For every bar with `INPLAYCOMMIT applied=1 committed=0`, take the stop reference from the same bar's `SL_REF site=S3ARM` (or `SL_STRUCT site=S3ARM`) line and test it against that line's `zoneLo`/`zoneHi`. A stop reference inside the zone is a bar E2 flips to `committed=1`. The count is E2's expected new-arming population, obtainable now.
**Probe C — cross-check.** On bars where Probe B predicts a flip, `XOBINPLAY2`'s `unc_hits` should be non-zero. Two independent walks agreeing raises confidence before a run is spent.
If Probe A's cell (1,0) count is material, bring the number back through relay before executing — that is an admission loss the operator has not seen quantified.
### 7. Gates
Carried from the relay, with additions:
- Compile: 0 errors, 0 warnings. The log line is the instrument, not the exit code.
- Full-window run on unchanged `RECON1_P1.ini`, same terminal.ini `[Tester]` bounds, 563338 ticks / 3168 bars.
- `WS161_CENSUS fields=21 mismatch=0`. **No working-set field is added or removed by this packet** — verify `fields=21` holds and treat any other value as an execution error, not a finding.
- Upstream identities verbatim: CQD 906 = 170/308/263/165, `BIASCENSUS` 1554/1614 ×2 fail=0, `ZONECENSUS` 3168/1056, XOB-PROMO 469. CQD, OBMGR and FlowLogic are untouched, so any movement here means the edit reached further than specified.
- The four-signal set re-measured and **declared, not reconciled**. Additions and losses both reported with the `INPLAYCOMMIT` line that produced them.
- `S2POLL_NO_SL_REF` count reported. Expected 0. Non-zero contradicts the DIFF=0 probe and must be resolved before the run is accepted.
- New EA digest and byte count reported. No git action, no `02_TASK_CHECKPOINTS` write, ALERT-ONLY preserved — this packet sends no order and adds no order path.
### 8. What council did not do
No strategy decision. The day-close flat (C2) stays shaped and unbuilt, with the five questions still open. The performance question is unresolved beyond the static findings already delivered — E4, where most of the measurable cost sits, is deferred by council's own sequencing call, so this packet should not be expected to move wall time.
Awaiting the operator's token.
