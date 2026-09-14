# NEW-SESSION HANDOFF post-v30 (2026-09-14, thorough v2) — read this first

Purpose: a fresh session starts here with zero reconstruction. Specifics
first (names, numbers, barTimes) — labels never stand alone. Every claim
names the file that proves it. This file SUPERSEDES the stale Sep-11
`00_CURRENT_WORKING\NEW_SESSION_PROMPT*.md` (their digests predate three
baselines — do not follow them).

## 0. Correction on top (builder defect owned, read first)

The "S1 first swing" blank was FALSE. His first swing before Sep-8 09:40
is HAND-on-record since 2026-09-13: Addendum 2 of
`06_HANDOFFS\BUILDER_FINDING_SLDEF5_FIVEEXAMPLES.md` (his words): "SL two
swings: first 9:50, second 9:40 at 1.16258". Same addendum for the
afternoon: "first 16:50, second 16:20 at 1.16274". Re-confirmed in
Addendum 4 ("London second 9:40 at 1.16258 after first 9:50; NY second
16:20 at 1.16274 after first 16:50"). The builder carried it as owed
anyway through six relays, the checkpoint, and the goal answer. Second
record-first failure (first: v22 Q1-Q3). Nothing about this is owed from
him — no re-explanation needed, ever, for 9:50.
Consequence (filed, not designed): with HAND first=9:50 and code counting
NOTHING between the 10:05 decision close and 09:40 (E58 trace, RECON21b),
the S1 gap is a limb-list absence at 9:50 — same family as the Sep-7
morning 08:40 absence — not a pure off-by-one. S-A's "origin = 09:40
itself" now sits against HAND 9:50 (consistent only if 9:50 is the S-A
origin limb); reconciliation is council design territory, no invention.

## 1. Goal (his deployment words, `00_CURRENT_WORKING\GOAL_STATEMENT.md` Amendment 4)

The EA must execute his strategy as is. Every valid taken trade
reproduced. No invalid setup signaled. Until then, no deployment. The Sep
window (Aug-28 to Sep-8) is the SAMPLE, not the goal. The goal is his
journal: `00_CURRENT_WORKING\OPERATOR_TRADE_JOURNAL.csv` (300 rows,
75 days, Jun-Sep). Per `06_HANDOFFS\BUILDER_FINDING_FULLJOURNAL-1.md`:
17 valid taken trades (Gain % filled); only the Sep-window rows have EVER
been measured against the EA (2 of 17); the other 15 + ~37
documented-invalid setups + untouched rows are the unmeasured remainder.
Journal↔example crosswalk: R1 = row #257 (8/28 +0.10), R3 = #280 (9/4
+0.84), R4 = #281 (9/7 +2.03), R5 = #283 (9/7 +1.06). Sep-8 rows are
EMPTY-for-timing (journal handed over before he input the date — not
missing, not late); the S1 screenshot + filed levels stand as the Sep-8
record. Count as he counts: 7 in-window (4 fired + 1 recovered + 2 Sep-8).
Mode: ALERT-ONLY. No execution. Ever, until he says so.

## 2. His rules (restated from record only; full text in `06_HANDOFFS\BUILDER_STATEMENT_FUNDAMENTAL_RULES.md`)

- Side: TF reads HTF-bias-only, MR reads most-recent-sweep-only (spec
  §3.2). No cross-requirement either way; alignment adds nothing, never
  double size. Sep-8 shorts: 1H+15m bear → SHORT (4H bull non-blocking).
  Proven by his Sep-8 10:05 screenshot
  (`06_HANDOFFS\BUILDER_FINDING_S1_SIDE_RULE.md`). Resolver ownership:
  TF side belongs to HTF bias — the POI-retest ownership in code is a
  filed defect, never a rule question.
- Setup: named POI tier line + liquidity sweep (journal POI/LQ columns).
- Validity: divergence code required (1/3 bull, 2/4 bear, his taxonomy).
  X = no trade. His read outranks code's wherever they differ (Sep-4
  10:35 stayed declined on his updated CQD read although reward cleared).
- Stop: ONE swing away with imbalance, TWO away without + wick nuance
  (uninvalidated block wicked beyond 1-away → the wick IS the stop).
  Swing = three-candle middle extreme (spec Part A v4.2 §3.7; the 5-bar
  council window is a rendering, never his number). Pure-two-swings
  version scoped single-trade-only.
- Take iff unrounded R >= 1.0 on Dukascopy feed. Always. (Takes flat
  1.0R; 0.92 OANDA misread was his measurement error, corrected.)
- Replace-not-sidecar: where his rules and the old pipeline disagree, his
  REPLACE the old (his deployment order — "think my strategy as is").
- Exit, on record (exit packet still owed): TP = journaled liquidity
  line (S LQ / AVP / VWAP per row); day flat at the 23:55 bar OPEN =
  00:00 broker = 17:00 New York (typo-corrected, Data-Window-proved).
  OPEN: code's HTF_FLIP-instant vs his hold-to-flat (Sep-4: code out
  1.15990 at 16:05, his flat 1.16129 at 23:55); Aug-28 exit mechanism
  (his POC-break vs code near-target touch, same 11:30 bar, scratch).
- Conventions: decision instant = signal-bar close; signal maps to S5
  eval row one period back (16:45 signal / 16:40 eval; SIGMAP 4/4).
  Filed authoritative: his numbers rule wherever code differs; exact
  barTime+price, no tolerance, no absorption ("four exact one absorbed"
  must never become "five exact"). Feed tags ride beside HAND tags.

## 3. His trades vs code (stops; HAND unless noted)

- R1 Aug-28 SHORT: entry 10:05 1.16466; first 09:55 (NOT 09:45 — his
  correction), second 06:30; SL 1.16508@06:30; TP 1.16364; exit scratch
  1.16464. Code prints the stop on monotone settings; live EA does not
  take it.
- R2 Sep-4 10:35 SHORT: considered, NOT taken (OANDA-feed mis-reject);
  recovery-YES on Dukascopy; hypothetical SL 1.16299 HAND. Live EA must
  keep DECLINING it (chart-side CQD-invalid) — report only.
- R3 Sep-4 LONG: entry 16:00 1.16018; SL 1.15847@15:30; TP 1.16302;
  flat 1.16129@23:55. Code prints it on M5 settings; live EA does not
  take it.
- R4 Sep-7 AM LONG: entry 09:20 1.16135; SL 1.16098@08:40; TP 1.16200.
  Code misses everywhere (nearest 1.16088@08:20); 08:40 lives in the
  swing buffer (recognized ×5) but no walk event reaches it. OPEN blank:
  what makes 08:40 a finished countable swing at 09:15 (his to fill).
- R5 Sep-7 PM LONG: entry 16:45 1.16261; first 16:30, second 16:15;
  FILED SL 1.16239@16:15 authoritative; TP 1.16318 (Yearly VWAP, +3
  drift read later = same line). Code keeps 16:05 (tie-break prefers
  retained); filed level exists as ladder rung 1 (R 2.45) but loses the
  tie-break. C5 divergence OPEN.
- S1 Sep-8 London SHORT: entry 10:10 1.16205; FIRST 9:50 HAND (§0),
  second 09:40; SL 1.16258@09:40; TP 1.16102. No EA row at that bar
  (never-born); EA carries LONG (opposed, disclosed).
- S2 Sep-8 NYAM SHORT: entry 17:00 1.16220; first 16:50, second 16:20;
  SL 1.16274@16:20; TP Y-POC price GAP (stays a gap); result LOSS. Same
  never-born status; EA LONG.

## 4. Why the EA will not take them (the consistent-rules/different-machine finding)

- Two failure levels (filed `BUILDER_RESULT_RECON21b-SEL2_PLAIN.md`):
  (a) never-born rows — no candidate exists at S1/S2 bars, the stop rule
  is never asked there; (b) mis-stopped rows — R4/R5/S1 counts land
  elsewhere. His rules are consistent; the machine is different.
- Old pipeline (still live): trend readings + confirmation votes +
  suppression holds + LONG-carry. Memo paths 471/118/589 with provenance
  CLOSED (computes 432/39, hits 0/118; S5 never reads memo); verdict #8
  BLOCKS memo-path use until provenance tagged (10 unreconciled).
  SUPPRESSED flat 152 back to RECON10. Opposed-side PASS concentration:
  15:55 only.
- Origin is dead: origin = undeclared free parameter (verdict #8);
  P-ORIGIN-1 candidate killed (rows=5, fail=3); walk/origin stays dead;
  per-trade ban; run-B adoption delta SUSPENDED (never re-derive
  undeclared); Sep-8 NOT REACHED as a gate.
- Adoption never built: ADOPT_EXT1 flip never ran; prints cleared,
  behavior never cleared; live selection legacy throughout (all legacy
  identities diff 0 on RECON24).
- Fix-design inputs, all measured: E58 counts NOTHING 10:05→09:40;
  swing buffer holds 08:40 ×5 (recognition, no walk event); ladder rung
  1 IS filed R5 (tie-break the battlefield); three-candle probe:
  16:15-lower limb PRESENT (mechanism alive), walk retains 16:05;
  code meters −1.0/−1.0 agree with his bear read while carried side is
  LONG (contradiction for the fix design); funnel 599/0 with 4 S2POLL
  off-example scope violations (protective); CQD EMPTY at all five
  fired rows (R2 divergence now DATA); news table PINNED (11 rows,
  DST demonstrated, 21:00 anchor); flats PROVISIONAL (MTLIFE).
- CQD divergence: repo CQD UNCHANGED (`BE6FD84F...A421F`); his update is
  chart-side; CQD-side TFs (M15/H4/D1) vs SEL (M5/H1) verified; CQD fix
  packet sequenced AFTER selection (separate auth). CQD-EMPTY semantics
  is a design item for that packet — never read EMPTY as FAIL meanwhile.

## 5. Code state (digests are the instrument)

- EA `703c3b0a8ecef5fbe9c9aa14471a225e1e0d817439aab78d4985e878e3a05bb1`
  (514584 B) UNCOMMITTED (no token). Six HAND literals live ONLY in
  `Include\SRJ\SRJ_HandFixture.mqh` (grep gate). `OrderSend(` count 0.
- `Indicators\SRJ_FlowLogic.mq5` `3606BFB4...25911` UNCHANGED (frozen
  since RECON9). CQD `BE6FD84F...A421F` (50555 B). OrderblockMgr
  `D286621C...20B7B` (48050 B). Stage lineage: e5a5cc24 → 703c3b0a
  (14 insertions, quoted in v29 relay).
- Frozen baseline of record: RECON17 (`6ACDF3B8`). HEAD `551a5b2`
  (records checkpoints, no canonical, no push/tag).
- Locks: NO canonical edit without dual-cleared packet; NO build/run
  without BOTH streams naming it + his run word; NO commit/push without
  explicit token; no third run; timeout = REPORT+HALT. Debris
  (`SRJ_FlowNexus_Local\EA_STATE_REG.md`, `..._Local\recovery_compile.ps1`)
  awaits his deletion word.

## 6. Run ledger (load-bearing only; full grades in the result files)

- RECON17-SLDEF6 (`BUILDER_RESULT_RECON17-SLDEF6.md`): 14/15 + gate-8
  report; FROZEN baseline (probe 10/10, memo 471/118/589, tenth join).
- RECON19-ORIGIN1 (`BUILDER_RESULT_RECON19-ORIGIN1.md`): candidate DEAD
  (R1 −27 lands 09:45; R4 +5 lands 09:00; R5 +1 lands his FILED price —
  retain-vs-filed owed, then closed); provenance closed; inertness held.
- RECON20b-SEL1 (`BUILDER_RESULT_RECON20b-SEL1.md`): 24-setting stop
  matrix matched 0/12 → P-SEL-1 DEAD (machinery verdict, isolation held).
- RECON21b-SEL2 (`BUILDER_RESULT_RECON21b-SEL2.md` + `_PLAIN.md`):
  three-way — R4 ABSENT (recognition-level, no walk fix recovers it);
  R5 ABSENT candidate-side (filed kept authoritative); S1 reframed by
  §0 (absence at 9:50, same family as R4).
- RECON22 (`BUILDER_RESULT_RECON22-LIMBSEAT1.md`): S-A-LIVE both TFs;
  R5 limb-mechanism retired; provenance delivered; no halt.
- RECON23 (`BUILDER_RESULT_RECON23-STAGE2.md`): VOID — builder wiring
  defect, owned, closed by the next run.
- RECON24 (`BUILDER_RESULT_RECON24-BUILD2TN3.md`, archive
  `RECON24-BUILD2TN3_JOURNAL.log` 36961 lines `87226cb4...d71c9f`):
  no voids; P1-P5/P6-origin/P8 PASS; P6-reseat FAIL = FINDING (9 flipped
  rows all ineligible/take-0, zero selection consequence); P7 FAIL-gap
  (S2 TP gap, pre-registered); C5 open.

## 7. Council record (verbatim: Opus `BUILDER_VERDICTS_SLDEF4-5.md`, Astra `06_HANDOFFS\BUILDER_VERDICTS_ASTRA.md`)

- v30 answered by BOTH (Astra-20 `GPT-V30-S2-RUL-001` review-only; Opus
  `OPUS-V30-RULING-001` review-grade): record ACCEPTED; P6-reseat =
  FINDING, no code moves, no packet; locks confirmed. No conflict.
- Registered per Opus doc-only condition: latent defect
  H1-WALK-DEFINEDNESS-STAGE-DEPENDENT + 4 auto-promotion tripwires
  (elig-1 hit; seat/side/take/decl coincidence; non-H1/other-level
  flip; l3via nonzero — any one promotes to a fix packet, no fresh
  ruling needed). Opus priority (not a packet): P4/C5 geometry next.
- Standing process (persists in `AGENTS.md` §§1-10 — not repeated here):
  SAME relay to both, both rule on all, dual-key to build (either
  halts); Astra-sufficient for print-only; verdicts filed verbatim with
  Ruling-IDs before acting; hand record motivates, never adjudicates
  (two-source standard); filed relays read-only; digests are the
  instrument (mtimes inadmissible). Packets live in `01_TASKS\PACKET_*.md`
  (DRAFT ≠ ISSUED ≠ EXECUTED). `.clinerules` is the full history archive.

## 8. Outstanding (nothing builder-side; nothing council-side)

- Him, at leisure, blocks nothing: 08:40 formation detail; N1 wick
  ruling (CONFIRMED body+POC, CONTRADICTED wick 10/16, UNEXERCISED
  vwap+exit); flats read. (S1 first swing CLOSED per §0 — never ask.)
- Next lawful move: a fresh dual-cleared fix packet (adoption/replace,
  P4/C5 geometry first per Opus flag) + his run word (~1h). NOT YET
  DESIGNED. No relay owed.

## 9. Required reads (YES — this handoff does not replace them)

- MUST: spec `00_CURRENT_WORKING\SRJ Flow Nexus — Part A Specification v4.2`
  (strategy of record; read before framing ANY operator question —
  record-first gate); `00_CURRENT_WORKING\GOAL_STATEMENT.md`;
  `00_CURRENT_WORKING\CHARTER.md`; journal
  `00_CURRENT_WORKING\OPERATOR_TRADE_JOURNAL.csv` with
  `06_HANDOFFS\BUILDER_FINDING_FULLJOURNAL-1.md` (goal scope);
  `06_HANDOFFS\BUILDER_STATEMENT_FUNDAMENTAL_RULES.md` (his rules);
  `06_HANDOFFS\BUILDER_FINDING_S1_SIDE_RULE.md` (side proof);
  `06_HANDOFFS\BUILDER_FINDING_SLDEF5_FIVEEXAMPLES.md` (addenda 2/4/5 =
  his words on fifth/Sep-8/recovery); `06_HANDOFFS\BUILDER_FINDING_SEP7_CHARTREAD.md`
  (four-signal evidence + exit appendix).
- SHOULD (before designing any packet): `01_TASKS\PACKET_FP-LIMBSEAT-1.md`;
  relays v20-v30; both verdict files (latest verdicts first).
- AS NEEDED: run journals/archives (audit, never re-derive without
  cause); `AGENTS.md` full (process §§1-10, queue §§11/74-78);
  `.clinerules` archive. Never read the day log whole (tail 5 only).

## 10. Resume order for the new session

1. This file (§9 MUST reads next). 2. Session-open checklist
   (`AGENTS.md` §10): re-hash four baselines, git log/status read-only.
3. Then await directive (automation rule authorizes continuous packet
   execution once a cleared packet + run word exist — until then,
   NOTHING builds/runs/commits).
