# PACKET_P-EVICT-1 v1 DRAFT - evict S5-refused holders (squatter GC; nothing builds/runs/commits on this file)

Status: v1 DRAFT. Clearance via a clearance relay plus his run word, all owed.
Canonical files: exactly ONE - Experts\SRJ_FlowNexus_EA.mq5 (E1: new ABORT code
define, +1 added; E2: DIV_WAIT fallback re-arm becomes abort, +0/-0/+1 modified).
No new indicator buffers. Nothing under 02_TASK_CHECKPOINTS. Commits are
builder-called (AGENTS 6.5); no council commit token exists or is asked.
Successor context: RECON58 (built tree B01CBA64, graded G2-FAIL on the 9/1
squatter-veto miss); this packet frees the session slot so the valid seed takes.

## Authority (all on record, no invention)

- His one-take-per-session rule (spec L283/L291 + his 2026-09-23 restatement,
  strategy skill section 5): one valid setup executed per pair per session;
  floating London plus valid NY both taken even if they contradict; arrival
  order governs across time (Q3: first executes, later higher does not).
- His NO new-timing-rules boundary (scope-origin): eviction keys on the gate
  verdict, never on a bar count. No new constants, no thresholds.
- His E3 detection ruling (robust newest-first divergence walk) is untouched -
  only the retry disposition changes, which was builder design ("may present
  later"), never his words.
- Disk mechanism this tree (58/57 segments): 9/1 Yearly-POC LONG born 16:45
  (rank 2 tier 1), armed S4 16:50, S5-fallback 16:55 (EM row), squats S4_ARMED
  and vetoes the 17:30 winner (px 1.15975 both runs; 72 SUPPRESSED/PREEMPT rows
  9/1); tier-1 immune to preemption (wouldPreempt=0); session abort bounds it
  (1 SESSION_CLOSED abort 9/1 evening). 57 GC'd the same window via R2 voids
  (CO/IH rows); 58 fires 0 voids by E1 design.
- Fallback census (machine): 3 S5-to-S4 fallbacks per run (57: 8/27, 8/31,
  9/1; 58: 8/31, 9/1, 9/4-09:45) - ZERO later took in either run. Retry never
  converts; kill is low-risk, graded by takes.
- Singleton + session keying (code): one held candidate globally (g_state/
  g_anchorLine); seeding only in IDLE; session-use marks per session per day
  (1802-1817: London/NYAM x day - cross-session independence structural).
  S3/S4 holders veto identically (census gates g_state > IDLE).

## Rule (one disposition change at one site)

- A candidate refused at S5 divergence (DIV_WAIT) ABORTS (new code
  ABORT_DIV_FALLBACK) instead of re-arming to S3/S4. The singleton frees the
  same bar (Task-78 fall-through discipline); the session slot opens for the
  valid seed. Takes (S5-pass) never touch this path - only refusals die.
- Untouched: E3 detection walk, R2 scoping (E1 RETEST-2 intact, voids stay 0),
  Q3 arrival-order (refused holders cannot execute first), cross-dir preempt,
  B3 same-dir upgrade, session marks, booking, exits, R floor, votes, alerts.

## Scope (9/1 restoration only)

- REQUIRED: 9/1 take 17:35 entry 1.16024 lots balance-sized (57 shape: SL 17:50
  at 1.15975); other 6 takes identical bars/entries/fills.
- 9/4-invalid still refused; MTCOLLISION 0; SEEDVOID reads re-derived (R2
  untouched); fallback-to-ABORT rows present (DIV_FALLBACK census).

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
- E2 DIV_WAIT fallback becomes abort (EA S5 block L8801-8808, +0/-0/+1 modified):
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
  `         //--- [P-EVICT-1] refused holders abort (squatter GC): retry converted`
  `         //--- 0 of 6 fallbacks across 57/58; a re-armed refusenik vetoes the`
  `         //--- session slot permanently (tier-1 immune to preemption). E3 walk`
  `         //--- untouched; S3-branch included (S3 holders veto identically).`
  `         GoAbort(ABORT_DIV_FALLBACK, g_state); return;`
  (DIV_WAIT print + SrjOrderEmit DIV_WAIT census above stay - diagnostic continuity)

## Stages (T161N discipline; RECON58 precedent)

S1 Pre-hash gate: re-hash EA (must equal
B01CBA646A337EE2E95F040782615D531C59423000746F50EAFE653CABE2B14D / 622155 B /
11317 lines or DIAGNOSED successor state, never assumed) plus single-hits (old
fallback block + ABORT_POI_REPLACED line) plus char-code assert every OLD anchor
above; assert no new buffers. Miss = DIAGNOSE, never assume, never revert. S2 Apply E1+E2
exact-diff (expected post-build EA 11318 lines, +1/-0/+1 modified). S3 Post-hash
plus budget arithmetic from literal counts. S4 Compile both targets 0 errors
0 warnings. S5 Run under RECON50_DEMO_USD (same terminal, InpMode 1, 2026-08-26
to 2026-09-10, InpDebugLog=true), ceiling 90 min - ONLY on clearance relay plus
his run word.

## Acceptance (grade segment-vs-RECON58)

G1 Build: 0 errors 0 warnings both targets; post-hashes recorded; budget EA
11318 +1/-0/+1 modified from literals; lines 11318.
G2 Takes: 9/1 take 17:35 entry 1.16024 lots balance-sized (MTSNAP/SIGNAL/
OrderSend chain); other 6 takes identical bars/entries/fills; 9/4-invalid
still refused at S5; MTCOLLISION 0; DIV_FALLBACK abort rows present (3 expected
venues: S5-refusals); SEEDVOID reads re-derived. Any unpredicted election
delta HALTS.
G3 State-identical plus 9/1: all non-exit families count-identical vs RECON58
except downstream of the 9/1 take (CHAIN bars return toward 66 documented
against 57/58 set-diff; SUPPRESSED-by-S4 count collapses); alert kinds
SIGNAL/EXIT/HEADS-UP/STAND-DOWN only.
G4 Exits: 9/1 exit per 57 shape (SL 17:50 at 1.15975); other 6 exits identical
bars/reasons; DAY_CLOSE count re-derived (verdict-only, D2 unchanged by this
packet - executor is a separate packet).
L-final Graded set authoritative: G1/G2/G3/G4 above.

## Run cost and novel evidence

One build (define + disposition, STAGE-1 gated) plus one tester run, ceiling
90 minutes, same envelope as RECON58. Novel evidence vs RECON58: (a) first 9/1
take on the evict tree; (b) no S4-squat past fallback (veto census collapses);
(c) DIV_FALLBACK aborts present with takes intact. Exit figures are target
figures until fills print, never realized before.

(End of file)
