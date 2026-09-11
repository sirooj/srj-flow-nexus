# PLAN — RECON-PILOT: the two-week reconciliation window first, then scale out
File: c:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\SRJ_FlowNexus_Local\01_TASKS\PLAN_RECON-PILOT.md
Date: 2026-09-09. Basis: the operator's directive, verbatim: "i reccommend that the first
step is not to rerun the strategy tester because it takes a lot of time, besides we can
work on the smaller windows such as the current two weeks of time. match that first, make
it right within that time than scale out test longer duration of time. PLAN THIS FIRST"
— this plan implements it under GOAL_STATEMENT Amendment 4's deployment bar. This is a
PLAN, not a packet: it authorizes nothing by itself; canonical edits still need the
operator's issued packets; runs still need the operator's GO + completion signal.

## 0. THE PRINCIPLE (why pilot-first)
A full-journal run costs ~5-6 h per iteration. A two-week window costs ~30-60 min per
iteration. All fixing happens INSIDE the cheap window (run -> reconcile -> root-cause ->
fix -> re-run the SAME window) until it is clean; only then does the window grow. The
expensive full span is run once at the END, to CONFIRM, never to debug.

## 1. THE PILOT WINDOW: 2026.08.26 .. 2026.09.09 (the current two weeks)
Journal inventory (parsed verbatim from OPERATOR_TRADE_JOURNAL.csv; 44 rows):
- MUST-MATCH (the operator's executed trades, Gain % set) — 4 trades:
  #257 8/28 LDN TF  D VWAP  cvd=2 (+0.10, "or 1.21R")
  #280 9/4  NY  MR  Y AVP   cvd=3  LQ=LD.L (+0.84)
  #281 9/7  LDN TF  W AVP   cvd=3 (+2.03)
  #283 9/7  NY  TF  W AVP   cvd=3 (+1.06)
- DOCUMENTED-INVALID / REJECTED (must produce NO EA signal) — 10 rows:
  #249 (❌), #250 (cvd=1, "one swing SL not OB, invalid XOB"), #251 (cvd=4, <1R),
  #259 (cvd=2, <1R), #262 (cvd=2, invalid XOB), #263 (❌), #264 (cvd=2, invalid XOB),
  #265 (❌, <1R), #267 (❌ "++"), #268 (❌), #271 (❌)
- CLASSIFICATION TO CONFIRM with the operator during Phase 2 (not blocking the run):
  #277 9/4 LDN TF D VWAP cvd=2 "0.92R" (no invalid note, no Gain %),
  #278 9/4 LDN MR D AVP cvd=3 (no gain, no note), #279 9/4 NY TF Y AVP cvd=3 "++",
  #266/#272-276/#282/#284 the LQ-only rows — is a valid-but-untaken setup an EA-signal
  agreement or a false positive? (The Amendment-4 bar covers TAKEN trades and REJECTED
  setups; valid-untaken needs one ruling.)
- EMPTY days (no setups journaled): 8/27, 9/2, 9/3, 9/8, 9/9 — an EA signal on an empty
  day is listed for the operator's judgment (their journal may simply not note no-setup
  days).

## 2. PHASES
- PHASE 0 STAGING (builder, mechanical, no run): RECON1_P1.ini = the T161R_P1.ini shape
  verbatim with FromDate=2026.08.26 ToDate=2026.09.09 (Tester: EURUSD M5 Model=4
  Deposit=10000 Currency=JPY Leverage=100 ExecutionMode=0 Visual=0; TesterInputs:
  InpDebugLog=true). Pre-run digest gate: EA A0701893299B...3FD57E, CQD
  BE6FD84FB970...A421F, OrderblockMgr D286621CD8E2...20B7B, FlowLogic
  1EA7858F9B1A...73B08 — all four byte-identical; ZERO source edits for the first run.
- PHASE 1 BASELINE RUN (the operator's GO + terminal closed; builder launches detached
  via harness v2.3 and STOPS; the completion signal is the operator's): expected
  ~30-60 min + a one-time history download for the new dates. Gates: "Test passed";
  WS161_CENSUS mismatch=0 loads=stores=N (N = the window's bars) with LOAD NOSTORE
  present and zero FIELD rows; post-run digests byte-identical (no source change).
- PHASE 2 RECONCILIATION (builder, mechanical): the row-by-row table — each MUST-MATCH
  trade vs the EA's signals (day + session + direction + POI family + CVD code, plus
  the entry-time delta and the SL/TP/exit facts); each rejected row vs EA silence; every
  EA-only signal listed and adjudicated. Deliverable: BUILDER_RESULT_RECON1.md +
  RECON1_TABULATION.txt. THE BATCHED QUESTIONS (one memo, never drip-fed): the §1
  classification items + any entry-time datum the deltas need.
- PHASE 3 THE FIX LOOP (only on misses): root-cause each miss — MECHANICAL gap = packet
  draft, the operator issues, builder applies (S1-S7), compile, RE-RUN ONLY THIS WINDOW,
  reconcile again; SEMANTIC gap = operator ruling first, then the packet. LOOP until the
  window gate: 4/4 MUST-MATCH signaled + 0 signals on rejected setups + every EA-only
  signal explained or ruled.
- PHASE 4 SCALE-OUT (only after the pilot is clean): extend backward in two-week slices
  (8/12-8/25, 7/29-8/11, 7/15-7/28, ... back to 6/1), each slice = one run + the same
  reconciliation; after ANY fix, the prior slices are re-verified (per-slice re-run —
  affordable at this size). END STATE: 75/75 days covered, 17/17 valid taken trades
  signaled, 0 false positives — the Amendment-4 bar MET for the record. Deployment
  itself stays OFF THE TABLE; ALERT-ONLY stands.

## 3. WHO DOES WHAT
Builder autonomously: staging, digests, the reconciliation tables, findings, packet
drafts, compiles, re-runs (once launched). Operator: the GO, the completion signal,
packet issuances, strategy rulings (the Phase-2 batch), and any window re-pointing
("the current two weeks" = 8/26-9/09 as staged; one word moves it).
Run name reserved: RECON1 (T161S stays reserved for PARKED P-HTFEXIT-BT).
Cost note: each Phase-3 iteration = one ~30-60 min window run; the full-span run happens
once, at Phase 4's end, as confirmation.