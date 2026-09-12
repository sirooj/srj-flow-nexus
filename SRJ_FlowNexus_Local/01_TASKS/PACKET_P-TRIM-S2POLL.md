# PACKET P-TRIM-S2POLL — issued

Council issues this packet. Four edits, one canonical file, one compile, one full-window run. E4 is marked optional and council recommends deferring it.

Two things precede the edit specs: a precondition on the source, and one census that moved without attribution.

---

## 1. Precondition — my anchors are two packets stale

The source I have read is `7BB1E9B6…CB3C` (257,968 B). The baseline of record is `1478ADCF…BA74` (261,040 B) — P-FIX-S2POLL and P-FVGVALIDITY both landed since. Every anchor below is a unique source string rather than a line number, so re-anchoring is mechanical, but three properties I rely on were verified against the stale file and must be re-confirmed on `1478ADCF` before executing:

1. **`ComputeSlReference` reads `g_zoneHi`/`g_zoneLo` for prints only.** The Task 67 in-zone exclusion is marked `[STEP 1 RETIRED]` and the Task 75 walk carries no zone test. If P-FVGVALIDITY reintroduced a zone read on a *return* path, memoisation is no longer identity-preserving, because the zone globals do move within a bar (S3 arming sets them, B3 supersession clears them).
2. **`ComputeSlReference` has exactly three call sites** — `"S2POLL"`, `"S3ARM"`, `"S5"`. A fourth site added by either packet changes the memo's demand accounting.
3. **The `S3ARM` call still sits inside `if(haveXob && !haveFvg && s31_zHi > 0.0 && s31_zLo > 0.0)`.** This is what makes the S3ARM demand count equal the `applied=1` count of 157.

If any of the three fails, stop and relay back rather than adapting the packet.

---

## 2. One census moved and is not attributed

Every per-bar identity in the relay is verbatim against RECON3-BUILD3 except one:

| Census | RECON3-BUILD3 | RECON5 | |
|---|---|---|---|
| BIASCENSUS | 1554/1614 ×2 | 1554/1614 ×2 | unchanged |
| ZONECENSUS | 3168/1056 | 3168/1056 | unchanged |
| XOB-PROMO | 469 | 469 | unchanged |
| WS161 | fields=21 mismatch=0 | fields=21 mismatch=0 | unchanged |
| **CQD** | **906 = 170/308/263/165** | **170/308/266/166 (=910)** | **+3 / +1** |

The relay reports this without flagging it. It matters because of where the number comes from. The EA's per-bar `CQD DIV verdict=` census sits at the very top of `EvaluateClosedBar`, **above** the `UpstreamReady` gate and above every state test, so it runs on all 3168 bars regardless of candidate state. If the 4-tuple is tabulated from those lines it is **path-independent**, and no admission change in P-FIX-S2POLL or P-FVGVALIDITY can move it. A change would then point at the window, the warmup, or CQD's own inputs — and the CQD digest is unchanged at `BE6FD84F`.

One precise question, answerable from files on disk with no run:

> Is the CQD 4-tuple counted from the per-bar `CQD DIV verdict=` lines, from `CQDRECHECK`, or from a path-dependent source such as the S5 firing walk?

- Path-dependent source → attributable to P-FIX-S2POLL's state-path changes. Resolved, carry 170/308/266/166 forward.
- Path-independent source → something moved that neither packet should have touched, and it must be resolved before it is carried as an identity.

**This does not block P-TRIM-S2POLL.** The trim's identity gate is against RECON5, not RECON3. But settle it before RECON5 becomes the reference every later packet is measured against.

---

## 3. Corrections to my prior packet

Two, both material.

**E2's admission gain was zero in-window.** I specified the stop-swing-as-witness change expecting a new-arming population and declared the count unknown. Your Probe B and C resolve it to 0 — the single candidate at 9/3 17:20 is a print-precision artifact, and three independent walks agree. So operator ruling Q2 is now **encoded but unexercised**. The SL-leg-witness reading rests on the one operator datum on record, not on measured EA behaviour. Any future claim that the committed walk sees the ruled witness class should say so.

**"E4 is where most of the measurable cost sits" was wrong.** I wrote that when deferring the trims. Re-counting against the source: the trims in this packet remove at most 157 `ComputeSlReference` calls across 3168 bars. That is not a 27-minute recovery and this packet should not be expected to produce one. Section 8 has the corrected ranking.

---

## 4. E1 — per-bar stop-reference memo

**Placement:** immediately after `ComputeSlReference`'s closing brace, before `UpdateDivergenceLatch`.

```cpp
//====================== [P-TRIM-S2POLL E1] the per-bar stop memo =================
//--- ComputeSlReference is called twice on most S3 bars with identical inputs -
//--- once at site=S2POLL, again at site=S3ARM inside the Task 133 committed walk.
//--- Between them nothing moves: barShift is always 1 from OnTick, g_dir is
//--- assigned once per pass at the IDLE seed and never reassigned (the B3
//--- supersession re-binds the anchor line, not the direction), and every other
//--- input is a FlowLogic buffer or a price at barShift.
//---
//--- MEMOISATION, NOT SUBSTITUTION. A naive reuse of s1_stopRef/s1_haveStop would
//--- change behaviour on a SAME-BAR SEED CASCADE: on a bar entering at ST_IDLE or
//--- ST_S1_REGIME the S2POLL block is skipped (state below ST_S2_LTF_ALIGN), so
//--- the pair is absent when the cascade reaches S3 in the same pass. Under
//--- P-FIX-S2POLL E3 an absent stop now REFUSES TO ARM, so substitution would
//--- silently lose those armings. Computing on FIRST DEMAND cannot: S3ARM is the
//--- first demand on a cascade bar and gets exactly today's value.
//---
//--- SCOPE: site=S2POLL and site=S3ARM ONLY. site=S5 is DELIBERATELY EXCLUDED and
//--- keeps computing fresh - it is the firing path, its SL_REF / SWINGDUMP /
//--- SL_STRUCT lines are the four-signal set's evidence, and the S5 population is
//--- small enough that the saving is nil. The S5 call does not consult the memo
//--- and therefore cannot pollute it.
//---
//--- Failure is normalised to (0.0, SL_MODE_NONE), matching P-FIX-S2POLL E1's
//--- atomic-pair discipline. Nothing reads a caller local after a false return.
struct SSlMemo
  {
   datetime        barTime;
   ENUM_SRJ_DIR    dir;
   bool            valid;
   bool            ok;
   double          slRef;
   ENUM_SRJ_SLMODE slMode;
  };
//--- File-scope, so zero-initialised: barTime 0, dir DIR_NONE(0), valid false,
//--- ok false, slRef 0.0, slMode SL_MODE_NONE(0). No explicit initialiser and no
//--- OnInit reset, so the edit surface stays inside this block and OnInit is
//--- byte-untouched. A stale barTime cannot produce a false hit: server time is
//--- monotonic within a run.
SSlMemo g_slMemo;

int g_slMemo_computes = 0;
int g_slMemo_hits     = 0;

bool SlRefMemo(const int barShift, const datetime barTime, const ENUM_SRJ_DIR dir,
               double &slRefOut, ENUM_SRJ_SLMODE &slModeOut, const string site)
  {
   if(g_slMemo.valid && g_slMemo.barTime == barTime && g_slMemo.dir == dir)
     {
      g_slMemo_hits++;
      slRefOut  = g_slMemo.slRef;
      slModeOut = g_slMemo.slMode;
      if(InpDebugLog)
         PrintFormat("[SRJ-EA] SLMEMO bar=%s site=%s result=HIT ok=%d slRef=%s "
                     "mode=%d computes=%d hits=%d",
                     TimeToString(barTime, TIME_DATE|TIME_MINUTES), site,
                     (int)g_slMemo.ok,
                     DoubleToString(g_slMemo.slRef, _Digits),
                     (int)g_slMemo.slMode, g_slMemo_computes, g_slMemo_hits);
      return g_slMemo.ok;
     }

   double          memoV  = 0.0;
   ENUM_SRJ_SLMODE memoM  = SL_MODE_NONE;
   bool            memoOk = ComputeSlReference(barShift, dir, memoV, memoM, site);
   g_slMemo_computes++;

   g_slMemo.barTime = barTime;
   g_slMemo.dir     = dir;
   g_slMemo.valid   = true;
   g_slMemo.ok      = memoOk;
   g_slMemo.slRef   = memoOk ? memoV : 0.0;
   g_slMemo.slMode  = memoOk ? memoM : SL_MODE_NONE;

   slRefOut  = g_slMemo.slRef;
   slModeOut = g_slMemo.slMode;

   if(InpDebugLog)
      PrintFormat("[SRJ-EA] SLMEMO bar=%s site=%s result=COMPUTE ok=%d slRef=%s "
                  "mode=%d computes=%d hits=%d",
                  TimeToString(barTime, TIME_DATE|TIME_MINUTES), site,
                  (int)memoOk, DoubleToString(g_slMemo.slRef, _Digits),
                  (int)g_slMemo.slMode, g_slMemo_computes, g_slMemo_hits);
   return memoOk;
  }
```

**Call site 1** — anchor `ComputeSlReference(barShift, g_dir, slRef, slMode, "S2POLL")`. This is the P-FIX-S2POLL E1 form:

```cpp
      if(!SlRefMemo(barShift, barTime, g_dir, slRef, slMode, "S2POLL"))
```

**Call site 2** — anchor `bool  s3_haveStop = ComputeSlReference(barShift, g_dir, s3_slRef, s3_slMode, "S3ARM");`:

```cpp
         bool  s3_haveStop = SlRefMemo(barShift, barTime, g_dir, s3_slRef, s3_slMode, "S3ARM");
```

`barTime` is `EvaluateClosedBar`'s own parameter and is in scope at both sites. Do not substitute `iTime(...,barShift)` — it is the same value, but `barTime` is the argument the working-set store already keys on.

**Add to `OnDeinit`**, beside the other censuses:

```cpp
   if(InpDebugLog)
      PrintFormat("[SRJ-EA] SLMEMO_CENSUS computes=%d hits=%d demands=%d",
                  g_slMemo_computes, g_slMemo_hits,
                  g_slMemo_computes + g_slMemo_hits);
```

**Declared journal movement.** Signal-identity preserving; journal shape moves in four ways:

1. On every memo hit, the second call's prints vanish: `SWINGPICK site=S3ARM`, `SLSRC site=S3ARM`, `SL_REF … site=S3ARM`, `SL_STRUCT site=S3ARM`, and `SLSIDEGUARD site=S3ARM` where it fired.
2. `SWINGDUMP` renumbers. Its gate is `s_swingDumps < 20 || site == "S5"`, so removing S3ARM demands inside the first 20 shifts the `#N` sequence for everything after.
3. New `SLMEMO` lines, one per demand at the two memoised sites.
4. New `SLMEMO_CENSUS` line at deinit.

**Everything else in the journal must be byte-identical to RECON5.** That is the acceptance test in section 7.

---

## 5. E2 — the two dead `ReadFlow` calls

**Anchor:** inside `ComputeSlReference`, the block beginning `double swingHigh, swingLow;`.

```cpp
   double swingHigh, swingLow;
   bool haveHigh = ReadFlow(FL_BUF_SWING_HIGH, swingHigh, barShift)
                   && swingHigh != EMPTY_VALUE && swingHigh > 0.0;
   bool haveLow  = ReadFlow(FL_BUF_SWING_LOW,  swingLow,  barShift)
                   && swingLow  != EMPTY_VALUE && swingLow  > 0.0;
```

becomes:

```cpp
   //--- [P-TRIM-S2POLL E2] The direct point reads are DEAD. Task 21's
   //--- FindNearestSwing pair below overwrites haveHigh, haveLow, swingHigh and
   //--- swingLow on EVERY path, including its false path, which writes 0.0 and
   //--- -1. Nothing reads any of the four between the two assignments. The
   //--- retention comment credits SWINGDUMP, but SWINGDUMP performs its own reads
   //--- and runs earlier in the function.
   //--- SUPERSEDED, retained per P4:
   //---   bool haveHigh = ReadFlow(FL_BUF_SWING_HIGH, swingHigh, barShift)
   //---                   && swingHigh != EMPTY_VALUE && swingHigh > 0.0;
   //---   bool haveLow  = ReadFlow(FL_BUF_SWING_LOW,  swingLow,  barShift)
   //---                   && swingLow  != EMPTY_VALUE && swingLow  > 0.0;
   double swingHigh = 0.0, swingLow = 0.0;
   bool   haveHigh  = false, haveLow = false;
```

Verify before executing that the Task 21 override pair still sits below and unconditionally assigns all four. **Zero journal change**, zero behaviour change, 2 `CopyBuffer` per call removed.

---

## 6. E3 — hoist `Bars()` out of four loop conditions

`Bars(_Symbol, PERIOD_CURRENT)` is re-evaluated on every iteration at four sites. It cannot change within one `EvaluateClosedBar` pass: `OnTick` returns early unless `iTime(_Symbol, PERIOD_CURRENT, 1)` has advanced, and no new bar forms mid-function in the tester. The t127 and t133 walks already hoist it into `t127_limit2` and `t133_limit`, so this matches the file's own style.

| Function | Anchor loop | Hoisted name |
|---|---|---|
| `ZoneInPlay` | `for(int s = sh1 + 1; s <= barShift + Bars(...)` | `zip_limit` |
| `ZoneAdoptable` | `for(int s = sh1 + 1; s <= barShift + Bars(...)` | `za_limit` |
| S3 inline SWINGLEG walk | `for(int s = s31_sw1Shift + 1; s <= barShift + Bars(...)` | `s31_legLimit` |
| `UpdateDivergenceLatch` | `for(int s = barShift; s <= barShift + Bars(...)` | `udl_limit` |

Form at each site:

```cpp
   //--- [P-TRIM-S2POLL E3] loop-invariant hoist. Bars() cannot change within one
   //--- EvaluateClosedBar pass. Matches the existing t127_limit2 / t133_limit idiom.
   const int <name> = barShift + Bars(_Symbol, PERIOD_CURRENT);
```

Names must not collide in scope. `ZoneAdoptable` contains two walks — hoist once above both. **Zero journal change**, zero behaviour change.

---

## 7. E4 — single-direction `FindNearestSwing` (OPTIONAL, council recommends defer)

The non-direction side of the `FindNearestSwing` pair is consumed by nothing but the `SWINGPICK` print. The 1-swing branch, the Task 75 walk's `t75_from`, and `SLSRC`'s `nearest=` field all read the direction-matching side only. So the second walk is print-only.

Council recommends **deferring** it. With ~18% swing-slot occupancy the expected saving is ~5 `CopyBuffer` per call against ~625 calls — roughly 3,000 reads per run, against 300,000+ elsewhere. The cost is real: `SWINGPICK` loses one side to `-`, which is diagnostic information you may want when P-SL-IMBALANCE lands and the stop-swing selection becomes the subject.

If the operator elects to include it: guard the non-matching walk behind `if(InpDebugLog)` rather than deleting it, so the print survives a debug-on run and the debug-off path skips it. That is a different edit from the one the relay described, and it changes nothing in the measured (debug-on) configuration — so it would produce zero saving on the runs you actually take. **That is the argument for dropping it entirely rather than including it.**

---

## 8. Gates and expected values

Notation: **P** = `SL_REF … site=S2POLL` count on RECON5. **A** = `INPLAYCOMMIT applied=1` count = **157**. **M** = the seed-cascade subset of A — bars where the S3 handler is reached in a pass that skipped the S2POLL block.

**Probe D — obtain M before the run, read-only on the RECON5 journal.** An `applied=1` bar is a cascade bar if the pass entered below `ST_S2_LTF_ALIGN`. Two markers, joined on market time as your Probe A did:

- `ANCHOR_ELECT … action=SEED` on that bar — the IDLE-seed cascade, and this line carries `bar=` directly.
- `STATE S1_REGIME->S2_LTF_ALIGN` on that bar — the S1-entry cascade.

M is the count of `applied=1` bars carrying either. Expect M small — a same-pass cascade to S3 requires regime and LTF alignment both to pass on the seed bar.

**Expected values, post-run:**

| Quantity | Expected |
|---|---|
| `SLMEMO_CENSUS demands=` | P + 157 |
| `SLMEMO_CENSUS computes=` | P + M |
| `SLMEMO_CENSUS hits=` | 157 − M |
| `SLMEMO … result=HIT` lines | 157 − M |
| `SL_REF … site=S2POLL` | P, unchanged |
| `SL_REF … site=S3ARM` | M |
| `SL_REF … site=S5` | unchanged |
| `ComputeSlReference` calls removed | 157 − M |

Identity that must hold: `computes + hits = P + 157`. A mismatch means a fourth call site exists or the demand accounting is wrong.

**Behavioural gates:**

- Compile 0 errors / 0 warnings. The log line is the instrument, not the exit code.
- Full-window run on unchanged `RECON1_P1.ini`, same `[Tester]` bounds, 3168 bars / 563338 ticks.
- **Four-signal set verbatim vs RECON5**: 8/28 10:05 SHORT Daily-VWAP LONDON R=2.43 SL 1.16508 entry 1.16466; 9/4 16:00 LONG Yearly-POC R=2.56; 9/7 09:20 LONG R=1.76; 9/7 16:45 LONG R=1.25.
- `WS161_CENSUS fields=21 changes=205 mismatch=0`. **No working-set field is added or removed.** Any other value is an execution error, not a finding.
- `INPLAYCOMMIT applied=1` = 157, and **every `committed=` value identical to RECON5**. This is the strong gate: the memo must not move one in-play verdict.
- Per-bar censuses verbatim: BIASCENSUS 1554/1614 ×2, ZONECENSUS 3168/1056 fvgOnly=0, XOB-PROMO 469, CONFIRMPOLL 555, SUPPRESSED 156, MTEXIT 4, aborts 18/37/13/11/2/0/12. CQD per section 2 once its source is settled.
- `S2POLL_NO_SL_REF` count 0, consistent with DIFF=0.
- New EA digest and byte count reported. No git action, no `02_TASK_CHECKPOINTS` write, ALERT-ONLY preserved — this packet adds no order path.

**Acceptance test.** Diff the new journal against `RECON5-FVGVALIDITY_JOURNAL.log`, excluding: `SLMEMO*` lines (new), `*site=S3ARM` stop lines (removed on hits), `SWINGDUMP #N` numbering, and any field carrying a wall-clock timestamp. Everything else identical. A residual outside those four classes is a defect in the edit.

**Wall time.** Report it, do not gate on it. Removing 157−M calls from a 3168-bar run will not move 1:05 materially. Section 9 says where the time is.

**One method change you must carry forward.** Your Probe A determined `haveStop` from the presence of a `SL_REF … site=S3ARM` line. After this trim those lines exist only on the M cascade bars. Post-trim, `haveStop` must be read from the **`haveStop=` field on `INPLAYCOMMIT`**, which P-FIX-S2POLL E3 appended for exactly this reason. The line-presence method will report `haveStop=0` on 157−M bars where it is 1.

---

## 9. Where the 27 minutes actually is

Static counts, corrected. Your measured runs have `InpDebugLog=true` — every census in the relay printed — so the debug-gated blocks are inside the measured wall time. That reframes the problem.

**Rank 1 — the twelve POI buffers, re-read 100+ times per bar at one shift.** `DetectPoiRetest` ×4 call sites (POIREPLACE, SUPPRESSED, IDLE shadow, IDLE seed) at 12 each, `B3_ElectAnchor`, `ShadowRetestBook`, `ComputeNearestTpTarget` ×2, the `TPCENSUS` POI re-walk ×2, `MtNearestTpTarget`, and `EvaluateManagedTrade`'s twelve-line body-close loop. Union on the order of 100–140 `CopyBuffer` per bar to retrieve twelve values: **300,000–440,000 reads per run**. One `double g_poiVal[12]` plus a validity array, filled once per bar, serves every consumer. Same handle, same buffer, same shift, same values — identity-preserving by construction.

This is the dominant item and it deserves its own packet, **P-TRIM-POICACHE**, because it touches ~10 call sites and a mistake there moves signals.

**Rank 2 — instruments whose findings are already delivered.** All debug-gated, all in your measured time:

- t124 / t127 shadow in-play walks, every S3 bar. Task 133 was built from their finding and `INPLAYCOMMIT` now carries the committed verdict with an independent oracle in `XOBINPLAY2`.
- `TPCENSUS` re-walks both candidate groups to name a winner `best` already holds — and its `s_tpDumps < 2000` cap is reached across 2 call sites × 3168 bars, so any count derived from it is truncated rather than full-window.
- `CQDRECHECK` reads the same buffer twice per shift, 4 `CopyBuffer` per bar, to test a value-instability hypothesis. If `mismatch=0` on RECON5 it has answered.
- `SWINGREPAINT_2V3`, `BIASCENSUS`, the HTF census, `IDCHANGE` — 12+ `CopyBuffer` per bar between them, all with settled findings.

Retiring these moves the journal, which is the identity instrument, so it is an operator decision on which instruments have paid out — not a trim council can issue. Sequence as **P-RETIRE-INSTRUMENTS**, and note that flipping the `SHADOW_*` constants to false is already the file's own declared mechanism for byte-identical silence.

**Honest read on 33 → 60.** Not one defect. The accumulated instrumentation across T162, all correctly gated, all running because you measure with debug on. That is consistent with the non-monotonic timing table from the first relay — GATE faster than SHADOW, the ANYSTATE outlier — which tracks instrument load rather than feature cost.

---

## 10. P-SL-IMBALANCE — sequencing confirmed, with one prerequisite

**Confirmed: after P-TRIM-S2POLL, and alone in its own run.** It has the highest blast radius of anything queued. It changes `ComputeSlReference`'s 1-swing branch → moves `slRef` → moves the SL-leg bound that P-FIX-S2POLL E3 made the sole in-play bound → moves arming → moves the four-signal set. The stop reference and the in-play bound are inputs to each other; moving both in one run leaves nothing to attribute against.

**Prerequisite that is not yet met.** The datum is "a swing with no imbalance behind it cannot be the one-swing stop." That predicate needs the EA to know which imbalance sits behind a candidate swing. Today it cannot:

- Buffers 24/25, the FVG-leg zone, read empty on every measured bar — RECON5 reports `fvgOnly=0` and `haveFvg` false throughout.
- Buffer 32 carries an FVG objId, diagnostic only, and describes the FVG-leg zone rather than an imbalance behind an arbitrary swing.
- Buffer 27, the OB swing extreme, names the swing but says nothing about an imbalance behind it.

So the input is either not exported or exports empty. **P-SL-IMBALANCE cannot be built until FlowLogic exports it, and it must be a buffer, not a print** — your declared gap this relay is precisely that FlowLogic's `inHtfDebugLog=false` forces prints off in test runs. A predicate that depends on a print is unavailable in the tester by construction.

**Recommended first step, identity-safe:** an `SLIMB` shadow census in the EA, emitted at every 1-swing selection in `ComputeSlReference`, recording the chosen swing, whether an imbalance is present behind it, and what the selection would have been under the imbalance rule. `InpDebugLog` governs it, so the FlowLogic debug gap does not reach it. That measures the population before any selection changes — the POIREPLACE counterfactual pattern, and the same shadow-first discipline that got Task 133 built from measured data rather than inference.

Two questions for the operator, which council will not answer:

1. "Imbalance behind it" — the imbalance between the swing and the entry, or the displacement imbalance that created the swing? Different code, different population.
2. When a swing is rejected for having no imbalance behind it, does selection walk to the next qualifying swing, or does the 1-swing branch fall through to the 2-swing structure walk? Q3 rules a stop must always exist, so falling through to abort is excluded — but which of the two survivors applies is a strategy call.

---

## 11. What council did not do

No strategy decision. The day-close flat stays shaped and unbuilt with its five questions open. No packet issued for the POI cache or the instrument retirement — both are named and ranked, neither is specified, and the second is an operator judgement on which instruments have paid out. The CQD attribution question in section 2 is raised, not resolved.

Awaiting the operator's token.

STATUS: ISSUED + EXECUTED AND VERIFIED (operator relay of council packet taken
as token, declared). S0 all three preconditions PASS on 1478ADCF. CQD §2
settled: +3/+1 is a tabulation artifact, pure DIV 170/308/263/165 both runs.
Probe D M=39 (demands 589 / computes 471 / hits 118). S1 pre-hash PASS. S2
E1+E2+E3 applied first attempt (E4 deferred per council). S3 EA
57B2F9D3…9B61E (266664 B). S4 compile 0/0. S5 RECON6-TRIM-S2POLL PASSED
("Test passed in 1:03:23.693", 563338 ticks, 3168 bars; attempt 1 timeout
superseded; midnight-rollover two-file manual archive SEG=15555). S6/S7 ALL
GATES PASS — see 06_HANDOFFS\BUILDER_RESULT_RECON6-TRIM-S2POLL.md (157/157
committed= identical; acceptance residual 26 harness-only lines, zero EA).
