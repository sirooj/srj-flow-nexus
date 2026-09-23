# PACKET_P-EVICT-1 v3 DRAFT - evict S5-refused S4-ARMED holders, positive test (squatter GC; nothing builds/runs/commits on this file)

Status: v3 DRAFT (amends v2 B66D0F57 per V252 round, 1 YES / 4 discrepancy: positive S4 test per all five seats; S3 kept; unexpected origins fail closed with census; prose/claims corrected; parked items named). Clearance via a clearance relay plus his run word, all owed.
Canonical files: exactly ONE - Experts\SRJ_FlowNexus_EA.mq5 (E1: new ABORT code define, +1 added; E2: S5 fallback becomes three-way positive-S4 abort, +10/-0/+8 modified; E3: disposition comment refresh, +0/-0/+5 modified).
No new indicator buffers. Nothing under 02_TASK_CHECKPOINTS. Commits are builder-called (AGENTS 6.5); no council commit token exists or is asked.
Successor context: RECON58 (built tree B01CBA64, graded G2-FAIL on the 9/1 squatter-veto miss); this packet frees the session slot so the valid seed takes.

## Authority (all on record, no invention)

- His one-take-per-session rule (spec L283/L291 + his 2026-09-23 restatement, strategy skill section 5): one valid setup executed per pair per session; floating London plus valid NY both taken even if they contradict; arrival order governs across time (Q3: first executes, later higher does not).
- His NO new-timing-rules boundary (scope-origin): eviction keys on the gate verdict, never on a bar count. No new constants, no thresholds.
- His E3 detection ruling (robust newest-first divergence walk) is untouched - only the retry disposition changes, which was builder design ("may present later"), never his words.
- Stamp census (code, closes V252 D1/GLM-A1/Astra-A1): g_confirmFromState writes are declaration-init IDLE (1010), resets to IDLE (6289/7559/7610), pre-bind stamp of prev (8607), and armed-edge stamp of prev (8743-8744) UNDER the S4 guard (8629 if g_state == ST_S4_ARMED). Hence every S4-promoted holder carries ST_S4_ARMED at the fallback - the positive test is exact, no stamp edit needed (Kimi-B1 declined with proof; credit for forcing the census).
- GoAbort contract (code EA 6295-6329): LogAbort(reason, atState) unconditional + A6REFUSED gated (InpDebugLog and dir live) + STAND-DOWN gated (armed, unsignaled) + ST_ABORT + ResetSequence() which clears state/dir/regime/anchor/sessionAtEntry/zone/touch/latches AND g_confirmFromState (naming the omitted clear, GLM-A5) while session-use marks persist (marks live outside ResetSequence: 1812-1817, written ONLY at 10147/10240, both ST_SIGNAL paths - an abort frees the slot WITHOUT consuming the session). GoAbort returns void, so the caller keeps its return.
- S1 session gating (code 7711 + 6633, closes Opus-A-18): seeding requires inWindow = sess != SESSION_NONE (London/NYAM windows only) - NONE-session candidates cannot seed, so eviction cannot open unscoped floodgates; one-take-per-session enforced by marks at the take.
- Disk mechanism (58/57 segments): 9/1 Yearly-POC LONG born 16:45 (rank 2 tier 1), armed S4 16:50, S5-fallback 16:55 (EM row), squats S4_ARMED and vetoes the 17:30 winner (px 1.15975 both runs); tier-1 immune to preemption (wouldPreempt=0); session abort bounds it. 57 GC'd the same window via R2 voids (CO/IH rows); 58 fires 0 voids by E1 design.
- Fallback census (machine): 3 S5-to-S4 fallbacks per run, 0 of 4 distinct refusals converted across both runs (08-27/08-31/09-01/09-04 bars; takes flow through S5-pass, never the fallback branch). Retry never converts; kill is low-risk, graded by takes.

## Rule (one disposition change at one site, positive S4 test)

- A candidate refused at S5 divergence whose origin is POSITIVELY S4 (g_confirmFromState == ST_S4_ARMED) ABORTS (new code ABORT_DIV_FALLBACK). Pre-bind S3 rollback kept (never held a slot). Any other origin keeps today's behavior plus a diagnostic print (fail closed, counted - Sonnet-default wish in safe form). The singleton frees the same bar; the session slot opens for the valid seed. Takes (S5-pass) never touch this path - only refusals die.
- Census duality: DIV_WAIT emit stays ABOVE the disposition as the path marker (prose "below" corrected - Opus blocking-1 owned); GoAbort carries the decided outcome (LogAbort unconditional + gated A6REFUSED/STAND-DOWN, gates named). Both recoverable.
- Claim scope (Astra-A5 honored): this removes the refused holder's occupancy; same-bar handoff and signal recovery are graded at acceptance, never promised.
- Untouched: E3 detection walk, R2 scoping, Q3 arrival-order, cross-dir preempt, B3 upgrade, session marks, booking, exits, R floor, votes, alerts. E1-1 POI_REPLACED is after-state context (exists at EA 319, S1 asserts exists-once - Opus blocking-2 resolved by disk fact, not deleted). Name DIV_FALLBACK kept (S1-named; predicate-rename parked). Parked, separate packets: walk robustness/A6, readiness guard (+warmup note: grading runs on covered feed), divKind, collapse (intentional), A6 clock/dedupe, shadow/counter telemetry, enum-ization.

## Scope (9/1 restoration only)

- REQUIRED: 9/1 take 17:35 entry 1.16024 lots balance-sized (57 shape: SL 17:50 at 1.15975); other 6 takes identical bars/entries/fills.
- 9/4-invalid still refused; MTCOLLISION 0; SEEDVOID reads re-derived (R2 untouched); DIV_FALLBACK abort rows present (refused S4 holders only; assert presence, not 1:1 counts - Astra-A8).

## Edit set (exact verbatim; STAGE-1 exact-diff gated; byte-verified anchors)

- E1 new abort code (EA L319 after ABORT_POI_REPLACED line, +1 added, +0/-0):
  old L319-320:
  `#define ABORT_POI_REPLACED     "POI_REPLACED"`
  ``
  new L319-321:
  `#define ABORT_POI_REPLACED     "POI_REPLACED"`
  `#define ABORT_DIV_FALLBACK     "DIV_FALLBACK"`
  ``
  (F1:1 context already present - add ONLY F1:2. Blank L320 preserved.)
- E3 disposition comment refresh (EA L8787-8791, +0/-0/+5 modified):
  old L8787-8791:
  `       //--- [P-CONFIRM-GATE E3] one-bar validity, the divergence miss: the`
  `       //--- confirmation is CONSUMED and the candidate RETURNS TO S4_ARMED`
  `       //--- (CONFIRM_DIV_WAIT, no abort) - a fresh confirmation may present on`
  `       //--- a later bar. The old async wait ("S5 waiting: divLatch=0 tpOk=1")`
  `       //--- RETIRES.`
  new:
  `       //--- [P-EVICT-1] divergence-miss disposition: refused S4-origin holders`
  `       //--- ABORT (DIV_FALLBACK); S3 pre-bind rollback kept; other origins keep`
  `       //--- today's behavior with census. LogAbort unconditional; A6REFUSED and`
  `       //--- STAND-DOWN gated (debug/armed); DIV_WAIT emit above stays the marker.`
  `       //--- Retry converted 0 of 4 distinct refusals across 57/58.`
- E2 S5 fallback becomes three-way positive-S4 abort (EA S5 block L8801-8808, +10/-0/+8 modified):
  old L8801-8808:
  `         ENUM_SRJ_STATE prevDiv = g_state;`
  `         //--- [P-CONFIRM-ANYSTATE E3] the rollback returns to the promotion`
  `         //--- origin: S3 for a pre-bind confirmation, S4 for the armed edge`
  `         //--- (identical to the build-2 behavior for the armed path).`
  `         g_state = (g_confirmFromState == ST_S3_ZONE_WAIT) ? ST_S3_ZONE_WAIT`
  `                                                           : ST_S4_ARMED;`
  `         LogState(prevDiv, g_state);`
  `         return;`
  new:
  `         //--- [P-EVICT-1] refused S4 holders abort (squatter GC, positive test).`
  `         ENUM_SRJ_STATE prevDiv = g_state;`
  `         if(g_confirmFromState == ST_S4_ARMED)`
  `           {`
  `            GoAbort(ABORT_DIV_FALLBACK, g_state); return;`
  `           }`
  `         if(g_confirmFromState == ST_S3_ZONE_WAIT)`
  `           {`
  `            g_state = ST_S3_ZONE_WAIT;`
  `            LogState(prevDiv, g_state);`
  `            return;`
  `           }`
  `         if(InpDebugLog)`
  `            PrintFormat("[SRJ-EA] EVICT_UNEXPECTED_ORIGIN bar=%s origin=%s",`
  `                        TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift),`
  `                                     TIME_DATE|TIME_MINUTES),`
  `                        StateName(g_confirmFromState));`
  `         g_state = ST_S4_ARMED;`
  `         LogState(prevDiv, g_state);`
  `         return;`
  (DIV_WAIT print + SrjOrderEmit census above stay - path marker; retained returns structural; one statement per line; prevDiv consumed by rollback/default branches, GoAbort recaptures its own)

## Stages (T161N discipline; RECON58 precedent)

S1 Pre-hash gate: re-hash EA (must equal B01CBA646A337EE2E95F040782615D531c59423000746f50EAFE653CABE2B14D / 622155 B / 11317 lines or DIAGNOSED successor state, never assumed) plus single-hits (old fallback block + E3 comment block + ABORT_POI_REPLACED line) plus char-code assert every OLD anchor above; assert no new buffers. S1 asserts (V252 counsel): ABORT_DIV_FALLBACK count 0 pre-edit; ABORT_POI_REPLACED count exactly 1 (exists, no redefine); every ABORT_* symbol count 1 post-edit; enclosing signature void EvaluateClosedBar line 6628; DIV_FALLBACK absent in baseline logs (census-key clean). Miss = DIAGNOSE, never assume, never revert. S2 Apply E1+E2+E3 exact-diff (expected post-build EA 11328 lines, +11/-0/+13 modified: E1 +1/-0, E2 +10/-0/+8, E3 +0/-0/+5). S3 Post-hash plus budget arithmetic from literal counts. S4 Compile both targets 0 errors 0 warnings. S5 Run under RECON50_DEMO_USD (same terminal, InpMode 1, 2026-08-26 to 2026-09-10, InpDebugLog=true), ceiling 90 min - ONLY on clearance relay plus his run word.

## Acceptance (grade segment-vs-RECON58; GLM-B1 run-gate spec adopted)

G1 Build: 0 errors 0 warnings both targets; post-hashes recorded; budget EA 11328 +11/-0/+13 modified from literals; lines 11328.
G2 Takes: 9/1 take 17:35 entry 1.16024 lots balance-sized (MTSNAP/SIGNAL/OrderSend chain); other 6 takes identical bars/entries/fills; 9/4-invalid still refused at S5; MTCOLLISION 0; DIV_FALLBACK abort rows present at bars where baseline showed re-arms (EM/GQ/LF venues); downstream 17:30 SUPPRESSED/HELD row VANISHES and S1-to-SIGNAL chain appears (57 EL/QI/RM/PD shape); SEEDVOID reads re-derived. Assert invariant presence (zero re-arm rows, zero silent fallbacks), never 1:1 counts. Any unpredicted election delta HALTS.
G3 State-identical plus 9/1: all non-exit families count-identical vs RECON58 except downstream of the 9/1 take; alert kinds SIGNAL/EXIT/HEADS-UP/STAND-DOWN only.
G4 Exits: 9/1 exit per 57 shape (SL 17:50 at 1.15975); other 6 exits identical bars/reasons; DAY_CLOSE count re-derived (verdict-only, D2 unchanged by this packet - executor is a separate packet).
L-final Graded set authoritative: G1/G2/G3/G4 above.

## Run cost and novel evidence

One build (define + disposition + comment, STAGE-1 gated) plus one tester run, ceiling 90 minutes, same envelope as RECON58. Novel evidence vs RECON58: (a) first 9/1 take on the evict tree; (b) no S4-squat past fallback (veto census collapses); (c) DIV_FALLBACK aborts present with takes intact. Exit figures are target figures until fills print, never realized before.

(End of file)
