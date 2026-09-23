# PACKET_P-EVICT-1 v2 DRAFT - evict S5-refused ARMED holders (squatter GC; nothing builds/runs/commits on this file)

Status: v2 DRAFT (amends v1 D0749D36 per V251 round: S4-only scope per Sonnet-B/GLM-B1; identifier shown; return pinned; tags dual; after-shape carried). Clearance via a clearance relay plus his run word, all owed.
Canonical files: exactly ONE - Experts\SRJ_FlowNexus_EA.mq5 (E1: new ABORT code define, +1 added; E2: S4-origin fallback becomes abort, +4/-0/+8 modified; E3: disposition comment refresh, +0/-0/+5 modified).
No new indicator buffers. Nothing under 02_TASK_CHECKPOINTS. Commits are builder-called (AGENTS 6.5); no council commit token exists or is asked.
Successor context: RECON58 (built tree B01CBA64, graded G2-FAIL on the 9/1 squatter-veto miss); this packet frees the session slot so the valid seed takes.

## Authority (all on record, no invention)

- His one-take-per-session rule (spec L283/L291 + his 2026-09-23 restatement, strategy skill section 5): one valid setup executed per pair per session; floating London plus valid NY both taken even if they contradict; arrival order governs across time (Q3: first executes, later higher does not).
- His NO new-timing-rules boundary (scope-origin): eviction keys on the gate verdict, never on a bar count. No new constants, no thresholds.
- His E3 detection ruling (robust newest-first divergence walk) is untouched - only the retry disposition changes, which was builder design ("may present later"), never his words.
- GoAbort contract (code EA 6295-6329, whole function pulled): LogAbort(reason, atState) + A6REFUSED ABSENT_DECLINED row with predicate=reason + STAND-DOWN alert (if armed, unsignaled) + ST_ABORT + ResetSequence() which clears state/dir/regime/anchor/zone/touch/latches AND g_confirmFromState (Kimi-A3 answered) while session-use marks persist (marks live outside ResetSequence: 1812-1817 only written at take time - an abort frees the slot WITHOUT consuming the session, exactly his one-take rule). GoAbort returns void, so the caller keeps its return (A3 pinned structurally).
- Disk mechanism this tree (58/57 segments): 9/1 Yearly-POC LONG born 16:45 (rank 2 tier 1), armed S4 16:50, S5-fallback 16:55 (EM row), squats S4_ARMED and vetoes the 17:30 winner (px 1.15975 both runs; 72 SUPPRESSED/PREEMPT rows 9/1); tier-1 immune to preemption (wouldPreempt=0); session abort bounds it (1 SESSION_CLOSED abort 9/1 evening). 57 GC'd the same window via R2 voids (CO/IH rows); 58 fires 0 voids by E1 design.
- Fallback census (machine): 3 S5-to-S4 fallbacks per run (57: 8/27, 8/31, 9/1; 58: 8/31, 9/1, 9/4-09:45) - zero of the refused holders converted in either run (takes flow through S5-pass, never the fallback branch). Retry never converts; kill is low-risk, graded by takes.
- Singleton + session keying (code): one held candidate globally (g_state/g_anchorLine); seeding only in IDLE; session-use marks per session per day (1802-1817: London/NYAM x day - cross-session independence structural). S3/S4 holders veto identically (census gates g_state > IDLE) but only the ARMED edge ever squatted on record (zero S3-origin fallback events in shown rows) - hence S4-only scope (V251 B1 adopted).

## Rule (one disposition change at one site, S4-origin only)

- A candidate refused at S5 divergence whose origin is the ARMED edge (g_confirmFromState != ST_S3_ZONE_WAIT) ABORTS (new code ABORT_DIV_FALLBACK) instead of re-arming. Pre-bind S3 rollback kept (never held a slot). The singleton frees the same bar; the session slot opens for the valid seed. Takes (S5-pass) never touch this path - only refusals die.
- Census duality (V251 A9 decided): DIV_WAIT emit stays as the path marker (3-per-run baseline stays comparable); GoAbort carries the decided outcome (LogAbort + A6REFUSED predicate + STAND-DOWN). Both recoverable, per the E33 comment's intent.
- Untouched: E3 detection walk, R2 scoping (E1 RETEST-2 intact, voids stay 0), Q3 arrival-order (refused holders cannot execute first), cross-dir preempt, B3 same-dir upgrade, session marks, booking, exits, R floor, votes, alerts. Parked (separate packets, never bundled): walk robustness/A6 (V251 A6/B3), S5 readiness guard (Kimi B3), divKind dead-store, no-verdict-vs-opposite collapse (intentional).

## Scope (9/1 restoration only)

- REQUIRED: 9/1 take 17:35 entry 1.16024 lots balance-sized (57 shape: SL 17:50 at 1.15975); other 6 takes identical bars/entries/fills.
- 9/4-invalid still refused; MTCOLLISION 0; SEEDVOID reads re-derived (R2 untouched); DIV_FALLBACK abort rows present (refused holders only).

## Edit set (exact verbatim; STAGE-1 exact-diff gated; byte-verified anchors)

- E1 new abort code (EA L319 after ABORT_POI_REPLACED line, +1 added, +0/-0):
  old L319-320:
  `#define ABORT_POI_REPLACED     "POI_REPLACED"`
  ``
  new L319-321:
  `#define ABORT_POI_REPLACED     "POI_REPLACED"`
  `#define ABORT_DIV_FALLBACK     "DIV_FALLBACK"`
  ``
  (blank L320 preserved; codes are diagnostic-only strings, no gate reads them)
- E3 disposition comment refresh (EA L8787-8791, +0/-0/+5 modified):
  old L8787-8791:
  `       //--- [P-CONFIRM-GATE E3] one-bar validity, the divergence miss: the`
  `       //--- confirmation is CONSUMED and the candidate RETURNS TO S4_ARMED`
  `       //--- (CONFIRM_DIV_WAIT, no abort) - a fresh confirmation may present on`
  `       //--- a later bar. The old async wait ("S5 waiting: divLatch=0 tpOk=1")`
  `       //--- RETIRES.`
  new:
  `       //--- [P-EVICT-1] divergence-miss disposition: the refused candidate ABORTS`
  `       //--- (DIV_FALLBACK) - no re-arm. Retry converted 0 of 6 fallbacks across`
  `       //--- 57/58; DIV_WAIT emit below stays as the path marker while GoAbort`
  `       //--- carries the decided outcome (LogAbort + A6REFUSED + STAND-DOWN).`
  `       //--- S4-origin only; S3 pre-bind rollback kept below.`
- E2 S4-origin fallback becomes abort (EA S5 block L8801-8808, +4/-0/+8 modified):
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
  `         //--- [P-EVICT-1] refused armed holders abort (squatter GC): S4-origin only.`
  `         ENUM_SRJ_STATE prevDiv = g_state;`
  `         if(g_confirmFromState == ST_S3_ZONE_WAIT)`
  `           {`
  `            g_state = ST_S3_ZONE_WAIT;`
  `            LogState(prevDiv, g_state);`
  `            return;`
  `           }`
  `         GoAbort(ABORT_DIV_FALLBACK, g_state); return;`
  (DIV_WAIT print + SrjOrderEmit DIV_WAIT census above stay - path marker; retained return structural - GoAbort returns void)

## Stages (T161N discipline; RECON58 precedent)

S1 Pre-hash gate: re-hash EA (must equal B01CBA646A337EE2E95F040782615D531C59423000746F50EAFE653CABE2B14D / 622155 B / 11317 lines or DIAGNOSED successor state, never assumed) plus single-hits (old fallback block + E3 comment block + ABORT_POI_REPLACED line) plus char-code assert every OLD anchor above; assert no new buffers. Miss = DIAGNOSE, never assume, never revert. S2 Apply E1+E2+E3 exact-diff (expected post-build EA 11322 lines, +5/-0/+13 modified: E1 +1/-0, E2 +4/-0/+8, E3 +0/-0/+5). S3 Post-hash plus budget arithmetic from literal counts. S4 Compile both targets 0 errors 0 warnings. S5 Run under RECON50_DEMO_USD (same terminal, InpMode 1, 2026-08-26 to 2026-09-10, InpDebugLog=true), ceiling 90 min - ONLY on clearance relay plus his run word.

## Acceptance (grade segment-vs-RECON58)

G1 Build: 0 errors 0 warnings both targets; post-hashes recorded; budget EA 11322 +5/-0/+13 modified from literals; lines 11322.
G2 Takes: 9/1 take 17:35 entry 1.16024 lots balance-sized (MTSNAP/SIGNAL/OrderSend chain); other 6 takes identical bars/entries/fills; 9/4-invalid still refused at S5; MTCOLLISION 0; DIV_FALLBACK abort rows present (refused holders only); SEEDVOID reads re-derived. Any unpredicted election delta HALTS.
G3 State-identical plus 9/1: all non-exit families count-identical vs RECON58 except downstream of the 9/1 take (CHAIN bars return toward 66 documented against 57/58 set-diff; SUPPRESSED-by-S4 count collapses); alert kinds SIGNAL/EXIT/HEADS-UP/STAND-DOWN only.
G4 Exits: 9/1 exit per 57 shape (SL 17:50 at 1.15975); other 6 exits identical bars/reasons; DAY_CLOSE count re-derived (verdict-only, D2 unchanged by this packet - executor is a separate packet).
L-final Graded set authoritative: G1/G2/G3/G4 above.

## Run cost and novel evidence

One build (define + disposition + comment, STAGE-1 gated) plus one tester run, ceiling 90 minutes, same envelope as RECON58. Novel evidence vs RECON58: (a) first 9/1 take on the evict tree; (b) no S4-squat past fallback (veto census collapses); (c) DIV_FALLBACK aborts present with takes intact. Exit figures are target figures until fills print, never realized before.

(End of file)
