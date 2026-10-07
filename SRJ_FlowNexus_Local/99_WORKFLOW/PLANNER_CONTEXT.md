# PLANNER_CONTEXT - SRJ Flow Nexus planner (primary)
Written 2026-10-06 by relay B-52 (relay text said 2026-10-07 in error; operator clock was 2026-10-06). Replaces PROMPTQL_PLANNER_CONTEXT.md (audit-only). Only a planner relay edits this file; the builder never edits it on its own.

## 1. Roles
- Planner: the AI planner session the operator opens (his SuperApp thread, or a PromptQL bot - used again from relay B-57). Read-only GitHub access. No terminal, cannot push.
- Operator: pastes each relay whole into the terminal builder and pastes the builder's one-line reply back. He does not code; never ask him code questions.
- Builder: the coding agent in his terminal; runs relays under .opencode/skills/srj-relay/SKILL.md.

## 2. Session start
Operator kickoff for any new thread:
  Planner session, SRJ Flow Nexus. Repo sirooj/srj-flow-nexus.
  Read SRJ_FlowNexus_Local/99_WORKFLOW/PLANNER_CONTEXT.md on the branch below first, then follow it.
  B-<n> is done, GitHub branch builder/B-<n>, commit <hash>, verdict KEPT|RESTORED|MEASURED
1. Verify builder/B-<n> and <hash> on GitHub. Missing: never fall back to an older branch; give him a one-line paste-in for the builder (push to the GitHub remote, run git ls-remote, repeat the reply line). origin/<branch> in the builder's repo is not proof.
2. On ref builder/B-<n> read in order: 06_HANDOFFS/BUILDER_SESSION_POINTER.md; 06_HANDOFFS/BUILDER_RESULT_B<n>.md (its "## Carried note" first when told); BUILDER_SLICE_B<n>.md for raw rows; .opencode/skills/srj-relay/SKILL.md; .opencode/skills/srj-strategy/SKILL.md (the .agents copy is a stub).
3. Before trusting a result, check which build and which run produced its rows against earlier results (B-52 lesson: B-51 read rows from a pre-B-38 run).
4. Write relay B-<n+1> with a full Part 0 and hand it to him as one text block.

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
- Verdicts: KEPT = change kept; RESTORED = change undone from .preB<n>; MEASURED = read-only (text-record edits allowed).
- No tolerance or wiggle rule, ever. Talk to him in trader words (dates, times, prices).
- Questions: never ask him directly (his DEFECT word 2026-10-04). Each question goes into a relay as a record-first search; only "no ruling found" reaches him, as a chart call in the result's carried note, which the planner passes on. When his answer decides the next edit, wait for it.
- Banking: when he answers, the next relay banks his words verbatim first (strategy skill new section, journal, ledger), grep-first; never re-order banking a prior relay landed.
- Screenshots: the builder cannot open SuperApp uploads; the planner describes them in plain words inside the relay.
- Optional transport: the planner may post a relay as a GitHub issue, with his confirmation per post; the builder reads it with gh issue view. Default is paste.
- Start gate: committed text files are gated by "git diff <cut commit> -- <files>" empty; absolute SHAs only for uncommitted disk files (EA, includes, ex5, journals/logs, terminal.ini), copied from the latest result's final-state lines (B-52 lesson: B-50-era text SHAs went stale).
- Every result names the run (journal file + EA SHA) behind every row it cites.
- Retests and chart calls (his standing instruction 2026-10-07, banked B-65): a POI line retest dies by a candle body close through its line before confirmation, never by a 5m bias flip; never use his 5m read to age a retest or kill a line. Quote his banked words, point at journal rows, never re-decide EA logic.

## 5. History
- Up to relay B-51: planner was a PromptQL bot (wiki mirror kept in PROMPTQL_PLANNER_CONTEXT.md, audit-only).
- 2026-10-06: planner moved to SuperApp (relay B-52).
- 2026-10-07: planner session ran as a PromptQL bot for relay B-57; this file stays the single planner context (PROMPTQL_PLANNER_CONTEXT.md stays audit-only).
- 2026-10-07: planner back on SuperApp for relay B-59; this file stays the single planner context.
- 2026-10-07: planner session ran as a PromptQL bot for relay B-64; this file stays the single planner context (PROMPTQL_PLANNER_CONTEXT.md stays audit-only).
- 2026-10-07: planner session ran as a PromptQL bot for relay B-65; this file stays the single planner context (PROMPTQL_PLANNER_CONTEXT.md stays audit-only).
- 2026-10-07: planner session ran as a PromptQL bot for relay B-66; this file stays the single planner context (PROMPTQL_PLANNER_CONTEXT.md stays audit-only).
