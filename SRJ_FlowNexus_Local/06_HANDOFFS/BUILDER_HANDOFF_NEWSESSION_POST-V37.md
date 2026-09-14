# NEW-SESSION HANDOFF post-v37 (2026-09-15, thorough) — read this first

Purpose: a fresh session starts here with zero reconstruction. Specifics
first — labels never stand alone. Every claim names the file that proves
it. This file SUPERSEDES `06_HANDOFFS\BUILDER_HANDOFF_NEWSESSION_POST-V30.md`
(sep-window baselines through RECON24; read it only for the pre-v31 archive).

## 0. Session defects owned (read first — standing rules already filed)

This session added four defect classes, all owned, all with standing rules
in `AGENTS.md` — never repeat them:
- FALSE VOID (large): mid-RECON25-grading the builder reported O1 absent
  and diagnosed a stale binary. The run was innocent — an escaped-bracket
  pattern under `-SimpleMatch` matched nothing. Rule (§6.12): a zero-count
  is itself a measurement — re-prove it with a second differently-formed
  pattern before grading any void. The binary-strings side-theory was also
  invalid (ex5 literals are not plaintext-guaranteed) and is retracted.
- ANCHOR-EATING (twice, same shape): queue-item edits borrowed the next
  entry's opener line to aim, then dropped it; both caught by read-back and
  restored. Rule (item 87): never include another entry's line in an edit's
  aim; verify the neighbor lines on every read-back.
- FLOW-COMPILE SILENT MISS: the flow compile script returned without
  writing its log; direct re-issue worked (0/0). Rule: a missing expected
  artifact is a failed step until re-issued and read — never assumed.
- V34 WASTE (process): the clearance relay described the packet instead of
  pasting it, so the file-blind stream could not rule. Rule (§5
  SELF-CONTAINED RELAYS): operative text rides inline, always.
- V36 PROTOCOL DEFECT (caught pre-relay by operator): the draft asked BOTH
  streams for keys although Opus never signs keys — unfillable ask. Fixed
  via his standing print-only amendment (Astra key + run word for work that
  moves no selection). Lesson: match the ask to each stream's stated
  capability before drafting, not after a refusal.

## 1. Goal (his deployment words, `00_CURRENT_WORKING\GOAL_STATEMENT.md` Amendment 4)

The EA must execute his strategy as is. Every valid taken trade
reproduced. No invalid setup signaled. Until then, no deployment. The Sep
window (Aug-28 to Sep-8) is the SAMPLE, not the goal. The goal is his
journal: `00_CURRENT_WORKING\OPERATOR_TRADE_JOURNAL.csv` (300 rows,
75 days, Jun-Sep; 17 valid taken incl. R1 #257 / R3 #280 / R4 #281 /
R5 #283; Sep-8 rows EMPTY-for-timing, screenshot + filed levels stand).
Mode: ALERT-ONLY. No execution. Ever, until he says so.

## 2. His rules (`06_HANDOFFS\BUILDER_STATEMENT_FUNDAMENTAL_RULES.md`; spec Part A v4.2)

Side: TF reads HTF-bias-only, MR reads most-recent-sweep-only, no
cross-requirement either way (spec §3.2). Setup: named POI tier line +
liquidity sweep. Validity: his divergence codes (1/3 bull, 2/4 bear; X =
no trade; his read outranks code's). Stop: ONE swing away with imbalance,
TWO away without + wick nuance; swing = three-candle middle extreme
(spec §3.7). Take iff unrounded R >= 1.0 on Dukascopy. Replace-not-sidecar
(sidecar era over by his order). Exit on record (TP = journaled liquidity
line; flat 23:55-bar open). Conventions: signal-bar-close decision;
filed-authoritative; exact barTime+price, no tolerance. OPEN (new,
council/operator): was the expected Sep-8 10:05 decision a VALID trigger
under his rules (Astra GPT-V37-A6-001 §2: factual prerequisite, not
delegated to builder)?

## 3. His trades vs code (stops; HAND unless noted; O1 updates marked NEW)

- R1 Aug-28 SHORT: entry 10:05 1.16466; first 09:55, second 06:30; SL
  1.16508@06:30; TP 1.16364; exit scratch 1.16464. Code prints it on
  monotone settings; live EA does not take it.
- R2 Sep-4 10:35 SHORT: MUST-DECLINE (chart-side CQD-invalid); hypothetical
  SL 1.16299 HAND. Live EA must keep declining it — report only.
- R3 Sep-4 LONG: entry 16:00 1.16018; SL 1.15847@15:30; TP 1.16302; flat
  1.16129@23:55. Code prints it on M5; live EA does not take it.
- R4 Sep-7 AM LONG: entry 09:20 1.16135; SL 1.16098@08:40; TP 1.16200.
  NEW (RECON25 O1): the LIVE 1SWING leg reproduces filed EXACTLY
  (09:15 row chose 1SWING 1.16098 ok=1; SIGNAL SL 1.16098). The absence
  lives in FRACTAL space only (no 08:40 event, walk to 08:20) — per-path
  verdicts, dual-ruled. Blank that remains: his 08:40 formation detail.
- R5 Sep-7 PM LONG: entry 16:45 1.16261; FILED SL 1.16239@16:15
  authoritative; TP 1.16318. Code keeps 16:05 (tie-break prefers retained);
  filed level = ladder rung 1 (R 2.45). C5 divergence OPEN.
- S1 Sep-8 London SHORT: entry 10:10 1.16205; FIRST 9:50 HAND, second
  09:40; SL 1.16258@09:40; TP 1.16102. NEW (RECON25 O1): 09:50 high IS a
  strict middle extreme (1.16251, first time on record — 46pt risk vs his
  53pt stop), protective-side, buffer-held — yet NO decision row exists at
  the bar (never-born, row-level proof). Ordinal shift stands (code #1 =
  09:40 = his #2). EA carries LONG (opposed, disclosed).
- S2 Sep-8 NYAM SHORT: entry 17:00 1.16220; first 16:50, second 16:20; SL
  1.16274@16:20; TP Y-POC price GAP (stays a gap); result LOSS. Same
  never-born status; EA LONG.

## 4. Why the EA will not take them (audit + measurement)

Pre-run audit `06_HANDOFFS\BUILDER_FINDING_ADOPT-READINESS.md` (EA
703c3b0a code-read; line numbers below re-verified on the current O1 tree,
which changed no selection): 4 adherences — R gate (EA:57/8506), setup
independence (EA:2144/6819), divergence latest-governs (EA:5400),
alert-only (OrderSend 0) — DO NOT TOUCH; 4 violations — side owner
(EA:6793 sets g_dir from the POI-retest detector, never HTF bias), stop
branch (EA:4820 branches on obValid alone, imbalance never consulted;
wick nuance absent live), adoption OFF (EA:71), filed-not-authoritative
live.
Measured: G1 0/12; Sep-8 never-born + LONG-carry; R5 tie-break prefers
retained. The adherences are filters; the violations ARE the trade.

## 5. Code state (digests are the instrument)

- EA `51DF542D…7A4927` (521720 B) UNCOMMITTED (no token): TN3
  (703c3b0a) + O1 recorders only (isolated block + 6 tagged hooks, all
  pure additions; pre-hash verified; 0/0 EA+Flow first attempt modulo the
  owned flow-script miss). Parity-bound, adoption OFF, zero selection
  change (RECON25 isolation read).
- `Include\SRJ\SRJ_HandFixture.mqh` UNTRACKED (no token): +SrjO1Target
  (R4/S1 HAND times+entries; S1 price UNSTATED by record). Six-literal
  grep gate re-verified (EA = 0).
- `Indicators\SRJ_FlowLogic.mq5` `3606BFB4…25911` UNCHANGED (frozen since
  RECON9). CQD `BE6FD84F…A421F` (50555 B). OrderblockMgr `D286621C…20B7B`.
- Frozen baseline of record: RECON17 (`6ACDF3B8`). HEAD `fad5c2f`
  (records checkpoint; working set = AGENTS queue 84-87 + rules + this
  session's relays/results/verdicts/packet/O1 build, all UNCOMMITTED).
- Locks: v36 allowance SPENT (one build + one run). NO build/run without a
  fresh relay + run word. NO commit/push/tag without explicit token. No
  third run. Timeout REPORT+HALT. Debris (`EA_STATE_REG.md`,
  `recovery_compile.ps1`) still awaits his deletion word.

## 6. Run ledger (this session; pre-v31 ledger in the superseded handoff §6)

- RECON25-ADOPT (`06_HANDOFFS\BUILDER_RESULT_RECON25-ADOPT.md`):
  DONE=PASSED 23:53:15 (Test passed 0:50:13.442; 3168/563338; archive
  `06_HANDOFFS\RECON25-ADOPT_JOURNAL.log` 36973 lines / 7248974 B / SHA
  A812DDAC… / bounds [293110..330082] contiguous; Core-04/Test-passed;
  MAXLEN=537=cap; leftover 9468 closed graceful). O1 12/12 (extracts
  `06_HANDOFFS\RECON25_O1.txt` + `RECON25_COUNTS.txt`): R4 live-exact
  split + S1 never-born split (see §3); NO A6 halt. Isolation read clean
  (signals 4/4 identical; 481/481/10/599/24/5/14/152/589/118/10). S1 loop
  bound VOID per Opus (see §7) — the filed result stands, one field
  restated. Build scripts: `00_CURRENT_WORKING\compile_o1_*.ps1`,
  `launch_recon25_run.ps1`, `tabulate_recon25_adopt.ps1`.

## 7. Council record (verbatim: Astra `06_HANDOFFS\BUILDER_VERDICTS_ASTRA.md`, Opus `06_HANDOFFS\BUILDER_VERDICTS_SLDEF4-5.md`)

- v31: Astra `GPT-V31-RUL-001` (ISSUE `ADOPTION-FIX-P4C5-FIRST-001` + six
  authored items) + Opus `OPUS-V31-RULING-001` (undecorated issuance) →
  non-match on name, nothing built. v32: naming convention + re-put name →
  DUAL ISSUANCE (`GPT-V32-RUL-001` + `OPUS-V32-RULING-001`). v33: ten-
  content text → DUAL APPROVAL (`GPT-V33-RUL-001` + `OPUS-V33-RULING-001`,
  zero corrections) → packet filed
  (`01_TASKS\PACKET_ADOPTION-FIX-P4C5-FIRST-001.md`, ED72CCAF…/6032 B).
- v34: Astra CLEAR (`GPT-V34-RUL-001`) + Opus deliberate NON-CLEARANCE
  (`OPUS-V34-REVIEW-001`: packet not inline, A6 live blocker, no
  acceptance) → NO key; his pre-run audit ordered + filed (see §4).
- v35: packet-inline + exploratory restatement → Astra NON-CLEARANCE
  (`GPT-V35-RUL-001`: A6-sequencing ambiguity, narrow correction named) +
  Opus no-token review (builder tag `OPUS-V35-NO-ID-REVIEW`: digest
  unattestable, tokens are ceremony, bench sound, three-site plan).
- v36 (revised to his print-only amendment after his correction — never
  ask him to adjudicate technique): clarification + clearance → Astra
  `GPT-V36-RUL-001` (APPROVE sentence + CLEAR one print-only build+run) +
  Opus `OPUS-V36-REV-001` (APPROVE sentence; review-not-key, scope
  endorsed). Build+run executed on Astra key + his run word. Allowance
  spent.
- v37: Astra `GPT-V37-A6-001` (record accepted; A6 design: live-path
  governs R4; S1 decision-record independent of discovery, 3-step trigger
  test; trigger-validity NOT delegated to builder) + Opus
  `OPUS-V37-DSN-001` (record accepted with S1 bound VOID — caveat is the
  wrong instrument, printed-and-wrong never travels; A6 design D1-D6:
  absence taxonomy, live-first short-circuit + terminal-selection record +
  FRACTAL_SUPPRESSED, ABSENT_UNBORN + negative record, ordinals banned,
  date-match banned for windowed EMPTY, precedence; acceptance criteria
  1-4). NO CONFLICT (convergent, complementary — assessed claim-by-claim
  before filing this handoff). Pending: implementation packet issuance
  (v38, next session).

## 8. Outstanding (owners — nothing builder-side)

- Him, at leisure, blocks nothing: 08:40 formation detail; N1 wick ruling
  (CONFIRMED body+POC, CONTRADICTED wick 10/16, UNEXERCISED vwap+exit);
  flats read. (S1 first swing CLOSED — HAND 9:50, never ask.)
- Council + him (v38 business): S1 10:05 trigger-validity (factual
  prerequisite — his rules/journals decide, council designs around the
  answer); ISSUE the implementation packet BY NAME (D1-D6 + Astra R4/S1
  rules; print-only class again unless selection moves).
- Council owes nothing (v37 fully answered, no conflict). Builder owes
  nothing until v38 is relayed and answered.

## 9. Required reads (YES — this handoff does not replace them)

- MUST: spec Part A v4.2; `00_CURRENT_WORKING\GOAL_STATEMENT.md`;
  `00_CURRENT_WORKING\CHARTER.md`; journal CSV +
  `06_HANDOFFS\BUILDER_FINDING_FULLJOURNAL-1.md`;
  `06_HANDOFFS\BUILDER_STATEMENT_FUNDAMENTAL_RULES.md`;
  `06_HANDOFFS\BUILDER_FINDING_ADOPT-READINESS.md` (adherence map);
  `01_TASKS\PACKET_ADOPTION-FIX-P4C5-FIRST-001.md` (the packet);
  `06_HANDOFFS\BUILDER_RESULT_RECON25-ADOPT.md` +
  `06_HANDOFFS\RECON25_O1.txt` (the evidence); v37 verdicts (both files,
  newest first); v31-v36 relays for the arc.
- SHOULD: post-v30 handoff (pre-v31 archive); `.clinerules` archive. Never
  read the day log whole (tail 5 only).
- SHOULD (language second-source, per-task only): skill index
  `03_SPECIFICATIONS\MQLReference\rules\SKILL.md`, single references only.

## 10. Resume order for the new session

1. This file (§9 MUST reads next). 2. Session-open checklist
   (`AGENTS.md` §10 — NOTE the new item 6 ADHERENCE GATE: confirm a filed
   audit covers the current digest before any build/run; the §4 audit
   covers 51DF542D). 3. Draft v38 (implementation-packet issuance ask:
   D1-D6 + Astra R4/S1 rules + Opus acceptance criteria 1-4 as build
   scope; print-only class — terminal-selection record, negative-record
   emitter, windowed matcher, taxonomy — unless council moves selection,
   which needs dual-key; carry the S1 trigger-validity question with his
   journal evidence attached). 4. Relay → keys → his run word (~1h).
   Standing discipline from the first turn: PRE-SEND RITUAL + RE-ASK
   counter (zero is the pass mark) + WHY-NOT-LAST-TIME on any run relay
   (v38's novelty: first implementation evidence — SELECTED rows and
   refusal rows where RECON25 had bounds and caveats).
