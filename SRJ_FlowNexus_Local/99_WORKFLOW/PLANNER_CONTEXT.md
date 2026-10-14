# PLANNER_CONTEXT - SRJ Flow Nexus planner (primary)
Written 2026-10-06 by relay B-52 (relay text said 2026-10-07 in error; operator clock was 2026-10-06). Replaces PROMPTQL_PLANNER_CONTEXT.md (audit-only). Only a planner relay edits this file; the builder never edits it on its own.

## 1. Roles
- Planner: any planner agent the operator opens (ClickUp Brain since relay B-81; earlier SuperApp AI and PromptQL bot, section 5). It starts from 99_WORKFLOW/PLANNER_BOOTSTRAP.md and may keep a local copy of the kit as a cache; the repo wins. Read-only GitHub access. No terminal, cannot push.
- Operator: pastes each relay whole into the terminal builder and pastes the builder's one-line reply back. He does not code; never ask him code questions.
- Builder: the coding agent in his terminal; runs relays under .opencode/skills/srj-relay/SKILL.md.

## 2. Session start
Operator kickoff for any new thread:
  Planner session, SRJ Flow Nexus. Repo sirooj/srj-flow-nexus.
  Read SRJ_FlowNexus_Local/99_WORKFLOW/PLANNER_BOOTSTRAP.md on the branch below and follow it.
  B-<n> is done, GitHub branch builder/B-<n>, commit <hash>, verdict KEPT|RESTORED|MEASURED|STOP
1. Verify builder/B-<n> and <hash> on GitHub. Missing: never fall back to an older branch; give him a one-line paste-in for the builder (push to the GitHub remote, run git ls-remote, repeat the reply line). origin/<branch> in the builder's repo is not proof.
2. On ref builder/B-<n> read in order: 06_HANDOFFS/BUILDER_SESSION_POINTER.md; 06_HANDOFFS/BUILDER_RESULT_B<n>.md (its "## Carried note" first when told); BUILDER_SLICE_B<n>.md for raw rows; .opencode/skills/srj-relay/SKILL.md; .opencode/skills/srj-strategy/SKILL.md (the .agents copy is a stub).
3. Before trusting a result, check which build and which run produced its rows against earlier results (B-52 lesson: B-51 read rows from a pre-B-38 run).
4. Write relay B-<n+1> with a full Part 0 and hand it to him as one text block. Repo-side state lands through the relay's Part X and Part F; any local Handoff State page is a cache the planner refreshes itself.

## 3. Project facts
- SRJ Flow Nexus = his MQL5 trading EA. Repo sirooj/srj-flow-nexus (public). EA source Experts/SRJ_FlowNexus_EA.mq5; includes under Include/SRJ/.
- Records in SRJ_FlowNexus_Local/: handoffs 06_HANDOFFS/, workflow 99_WORKFLOW/. The live resume source is the pointer. Older queue/state/council files are audit-only.
- main is stale since 2026-10-03; all B-series work is on chained builder/B-<n> branches. Always pass the branch ref. GitHub code search covers main only.
- EA edits stay uncommitted, so GitHub's EA lags the disk EA. Locate code by text, never by line number.
- Large files: ledger (over 1 MB, not readable whole through the API), AGENTS.md (~72 KB), .clinerules (~148 KB). Never read whole; have the builder grep.
- His trading rules: "his rules, never the code's", banked in .opencode/skills/srj-strategy/SKILL.md. Check every change against them first.
- REFINE-ONLY (2026-09-25): every build first re-proves the EURUSD 26 Aug - 9 Sep window (RECON62); nothing else is graded until it passes.
- Register 06_HANDOFFS/BUILDER_REGISTER_VALID_TRADES.md = audited valid/false trades, every cell sourced.
- CQD divergence: on his EURUSD M5 chart the CQD Tick pane (D1 reset) shows divergence lines; blue solid = type 1 bullish. An invalid CQD divergence is one of his reject reasons.
- RAW charts (USDJPY_RAW, EURUSD_RAW) can miss candles or hours his live charts have; measured with SRJ_TickAudit (Files/SRJ_TickAudit_*). EURUSD_RAW lacks 7-10 September ticks.

## 4. Lane rules
- Every relay opens with Part 0: branch and commit to cut from, files to read in order, every name used. A builder with no memory runs it from Part 0 alone.
- Verdicts: KEPT = change kept; RESTORED = change undone from .preB<n>; MEASURED = read-only (text-record edits allowed); STOP = a STOP rule hit before the trial ran or finished, no source edit stands, text records allowed, reason in the result's first line (first used B-84, banked B-85).
- No tolerance or wiggle rule, ever. Talk to him in trader words (dates, times, prices).
- Questions: never ask him directly (his DEFECT word 2026-10-04). Each question goes into a relay as a record-first search; only "no ruling found" reaches him, as a chart call in the result's carried note, which the planner passes on. When his answer decides the next edit, wait for it.
- Banking: when he answers, the next relay banks his words verbatim first (strategy skill new section, journal, ledger), grep-first; never re-order banking a prior relay landed.
- Screenshots: the builder cannot open uploads he makes in the ClickUp chat; the planner describes them in plain words inside the relay.
- Optional transport: the planner may post a relay as a GitHub issue, with his confirmation per post; the builder reads it with gh issue view. Default is paste.
- Start gate: committed text files are gated by "git diff <cut commit> -- <files>" empty; absolute SHAs only for uncommitted disk files (EA, includes, ex5, journals/logs, terminal.ini), copied from the latest result's final-state lines (B-52 lesson: B-50-era text SHAs went stale).
- Every result names the run (journal file + EA SHA) behind every row it cites.

J2D-DEFECTS parked B-211 at 6 of 6: S1-S8 no separator; S8 counted from session start with a print fallback FVG; panel colour count untested until B-212.
- F1 negative evidence B-217 (parked 6 of 6, R-OTHER): H1+H2+H3 kill 10 June (B215F1 15:05/15:20/15:55) and 22 July (B215F1 14:50, H1 persist code4 kept-dead ren0) and keep A1-A7 (T1 16/16, T2 A identical, C silent); 25 June blocked by R-OTHER-25JUN-S4-REVIVE-FIRSTPAINT (S4 passes H3 S3-only misses; code6 renewal revival despite export ren0 H1c KeepDead false at write; S3 10:30 first-paint fvg alive; no B215F1 25Jun; B216H1 10:05 id5747 fires).
- P3-0618 B-219: B-218 chart call WITHHELD by planner (09:35 candle is also a Daily POC retest suppressed under a killed holder); E2 DIAG-NEXT (A5 + C 27Aug/28Aug TOUCHED, R6 NO).
## 5. History
- 2026-10-14: planner session ran as ClickUp Brain for relay B-208 (kit PK-2).
- 2026-10-14: planner session ran as ClickUp Brain for relay B-209 (kit PK-3).
- 2026-10-14: planner session ran as ClickUp Brain for relay B-210 (kit PK-3).
- 2026-10-14: planner session ran as ClickUp Brain for relay B-211 (kit PK-3).
- 2026-10-14: planner session ran as ClickUp Brain for relay B-212 (kit PK-3).
- 2026-10-14: planner session ran as ClickUp Brain for relay B-213 (kit PK-3).
- 2026-10-14: planner session ran as ClickUp Brain for relay B-214 (kit PK-3).
- 2026-10-14: planner session ran as ClickUp Brain for relay B-215 (kit PK-3).
- 2026-10-14: planner session ran as ClickUp Brain for relay B-216 (kit PK-3).
- 2026-10-14: planner session ran as ClickUp Brain for relay B-217 (kit PK-3).
- 2026-10-14: planner session ran as ClickUp Brain for relay B-218 (kit PK-3).
- 2026-10-14: planner session ran as ClickUp Brain for relay B-219 (kit PK-3).
