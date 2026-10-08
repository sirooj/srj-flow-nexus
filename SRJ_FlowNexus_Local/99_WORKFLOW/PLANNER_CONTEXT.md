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
- Chart calls, record first (planner defect owned 2026-10-07, B-67): before passing on any carried chart call, the planner checks the register, the strategy skill hierarchy/target/retest sections and the kept-build rows itself; the B-65 4 Sep and 8 Sep target calls were answerable from his record.
- Retest-death relays (planner lesson 2026-10-07, B-68): read strategy lines 53-55 and 86-88 (his 11 June 14:35 retest + confirmation and 14:30 not-accounted words) before measuring any body-close death; B-67 R6 missed them and re-carried 11 June.
- Retests and chart calls (his standing instruction 2026-10-07, banked B-65): a POI line retest dies by a candle body close through its line before confirmation, never by a 5m bias flip; never use his 5m read to age a retest or kill a line. Quote his banked words, point at journal rows, never re-decide EA logic.
- His journal check (planner lesson 2026-10-07, B-69): before calling any fire 'not in his journal', grep 00_CURRENT_WORKING/OPERATOR_TRADE_JOURNAL.csv by date and session and quote the row; B-67 and B-68 missed his 4 June London row 13.
- Same-class words (planner lesson 2026-10-07, B-70): before carrying a chart call, apply his standing words for the same scenario class (s182); a journal 'invalid XOB' note = no setup (s178), as on 4 June London.
- Spec first for XOB (planner lesson 2026-10-07, B-71): before carrying any XOB or zone chart call, read spec v4.2 §1.2, §3.5, §3.5.1, §3.6, §10 and XOBSUIT-1 §6; his 2026-09-09 preface says these answers are journaled in the specification file. The B-70 carried XOB call was withheld for this.
- Spec and skill whole (planner lesson 2026-10-07, B-73): read spec v4.2 and the strategy skill whole before drafting every relay. B-70 to B-72 were drafted on partial reads: B-70 carried an XOB chart call the spec answers, and B-72 framed his settled 9 Sep divergence ruling as open.
- Cite only what the planner has seen (planner lesson 2026-10-07, B-73): every file, section or code name in a relay is one the planner read on the branch, or is marked 'locate on disk, report NOT FOUND'. B-70 cited .clinerules AVP-POC, XOB-SUITABILITY, XOB-VALIDITY and FindLegTouch entries that do not exist (both .clinerules copies and AGENTS.md grep 0).
- Status from the packet (planner lesson 2026-10-07, B-73): a finding's DRAFT or NOT ISSUED line can be superseded. Read the packet's own status line and the later results before calling anything unissued. DIVCON-1 calls P-DIVCON-B and P-CQD-FLAGGATE drafts; both were issued and executed 2026-09-09.
- Code-only needs the spec (planner lesson 2026-10-07, B-73): before anything is filed as code-only, check the spec v4.2 tables (§3.6, §8, §10). The B-70 XOB touch-optional verdict missed spec §3.6.
- Later word governs on CQD (planner lesson 2026-10-07, B-74): his P-CQDRESTORE directive 2026-09-09 (01_TASKS/PACKET_P-CQDRESTORE.md §1, verbatim "this is a regression and i want you to refer the git version previously before change but only change the swing detection validity") restored the pre-change divergence gates; P-CQD-FLAGGATE E7/E8 (the per-anchor flag-gate) are superseded by it (161-R). No relay judges "flag-gate MET/NOT MET" as his live rule; B-73 R1.5/R3 carried it as open.
- Operator zone first (planner lesson 2026-10-07, B-75): before filing or carrying any 'spec vs his valid take' record on the zone step, census every live trade-direction XOB at the confirmation candle, not only the machine's pick (spec §9.7: the machine's zone and his zone can differ), and report both in-play windows (from formation, spec §3.5 words; from promotion, the B-74 grading); never pick a window as his rule. B-74 R3.3 graded the machine's pick only, from promotion only.
- Entry line beside anchor (planner lesson 2026-10-07, B-76): before any target-step record, set his entry line (his banked words, then the confirmation candle's own retest row) beside the machine's entry line; the tier filter keys to the entry line, and B-75 R3 showed the 27 Aug short anchored on a 16:25 Weekly VWAP retest while his words put it off the Daily POC.
- Caveat as reading (planner lesson 2026-10-07, B-77): a result caveat that flips a verdict (B-76 tier-key sensitivity turned 4 Sep back to his London high) is measured as its own reading, built only from his banked words, before any edit is drafted.
- Whole-run grade (planner lesson 2026-10-07, B-78): a reading that separates on register rows goes to one kept-build trial graded on whole runs before it is called kept; B-77 graded the fourteen register passes only, and the kept June run also fires 27 May, 4 June London and the 5 June 16:55 long.
- Refusals beside passes (planner lesson 2026-10-08, B-79): before any target-step trial, census every kept-build target-step refusal on both whole runs under the new reading, not only the fires and the register rows; B-78's own-source refusal turned the kept 4 Sep 15:35 refusal (Yearly POC 1.15987, R 0.18, a line of its own retest row) into a 15:40 fire ahead of his 16:00 entry.
- Line side in the row (planner lesson 2026-10-08, B-80): before any own-source, row-key or chart-call record, read each retest-row line's side tag (RETESTBOOK r<rank>:dL / dS) beside the trade direction; a line retested against the trade is never its source (spec §2 row 1, s94, spec "same-direction higher-tier POI touch"). B-78 hunk RK took the 4 Sep 15:35 Yearly POC (r2:dS, retested from below) as the long's own source, and the B-79 chart call on 15:35 was answerable from that tag: the Yearly POC was the nearest higher target, R 0.18, refused.
- Prediction is not a grade (planner note 2026-10-08, B-81): a census-predicted race outcome is graded on the trial's own rows; the B-80 census admitted list has no zone guard while booking keeps the Task-31 containment guard (B-80 R2).
- Diagnostic before trial (planner note 2026-10-08, B-82): a hunk with a predicted must-never-take fire on record (hunk C: 2 June 15:35, B-77 R2 F1b) runs as an always-restored diagnostic on the kept build, never as a kept trial; its rows feed the separator relay.
- Counted touch candle (planner lesson 2026-10-08, B-83): when his words name a candle ("a touch I do not count", 2 June 14:20), grade them at the candle the machine counts for the touch (B60C cSrc), not only at the confirmation candle; B-74/B-75 graded XOBs at confirmation only.
- Result against commit (planner lesson 2026-10-08, B-85): every record a result claims landed is checked in the committed file before it is relied on; B-84 claimed X1/X2 in PLANNER_CONTEXT but the commit c1ef12b carried neither.
- B-86-XOB-READABLE-DIAG (planner lesson 2026-10-08, B-86): B-86 measured only the selected-XOB readable path. The full live-XOB map remains not readable by the EA. XOB opposing-candle touch is permitted and never disqualifying, so the diagnostic must not reject touching rows.
- B-87-PICK-XOB-INPLAY-DIAG (planner lesson 2026-10-08, B-87): B-87 tested selected-XOB in-play at the counted touch candle as an always-restored diagnostic. The diagnostic never used the full live-XOB map. XOB opposing-candle touch remained optional and never disqualifying.
- B-88-GATE-MATCHES-READING (planner lesson 2026-10-08, B-88): a diagnostic gate reproduces the separating reading's own test, candle and build before it runs. B-87 gated "selected XOB in play" at the kept seed candle without hunk C, while B-83 separated on his "XOB retracement or touch" words at the B60C counted candle on the hunk C build; the gate refused 4 of his 7 EURUSD takes. B-86 graded that reading on two June rows only; every reading is graded on all register rows (sections A, B, C) before a gate is drafted from it.
- B-90-SL-LEG-INPLAY (planner lesson 2026-10-08, B-90): a separating in-play window is checked against his same-class words on every register row, including rows set beside, before it goes forward. B-89 W-F met 4 June London 09:10 on a 29 May short XOB (159.304-159.330) more than 50 pips under the 159.868 entry, against his "no retest of XOB in play" (0604-LDN-NOT-HIS); PXS on the trade-direction pick inside the setup SL leg misses his valid 1 Sep long (stop at the counted candle low, nothing in the short leg touches the pick) while meeting his ruled-out 4 June long (F3 DIFFERENT from his words).
- B-91-RETRACE-IS-IN-PLAY (planner lesson 2026-10-08, B-91): his words "what i meant by retrace and in play are the same thing." B-88 to B-90 graded retracement (against close + in play) and touch as separate conditions; that split is withdrawn, regression class. Every XOB reading is one in-play condition with relevance first. His standing order "when i reexplain a rule, i do not want the other rule to cascade to be also wrong." means each re-explanation changes only its own term, and every reading is graded on every register row in sections A, B and C before anything is called done.
- B-89-TRADE-DIRECTION-PICK (planner lesson 2026-10-08, B-89): a pick read at a counted candle is checked against the trade direction before it is graded, and in play is read in the spec's words before the machine's verdict is used. B-88 R3 took the latest print at or before the candle, so the 1 Sep long and the 7 Sep 16:05 candle were graded on short-side XOBs (1.16081-1.16100, 1.16362-1.16377), and the machine's in-play check tests the current candle's range plus the swing leg to the stop, while spec §3.5 reads a penetration at any point in the leg.

- B-92-XOB-PARKED-NONSEPARATOR (planner lesson 2026-10-08, B-92): B-91 found no separator across the four one-condition in-play readings on the full register and 65 passes; the XOB gate is parked as NOT BUILDABLE from current EA-readable inputs, with no source edit or run.

- B-93-XOB-EVIDENCE-INVENTORY (planner lesson 2026-10-08, B-93): inventoried existing upstream XOB evidence without reopening prior readings or editing the EA; the XOB path remains parked unless a complete readable live-XOB source is found.

- B-94-XOB-EVIDENCE-CONTRACT (planner lesson 2026-10-08, B-94): inspected the indicator's internal XOB records without editing or reopening prior readings; the minimum upstream evidence contract is recorded, and the XOB path remains parked until its fields are proven available.

- B-95-XOB-PERSISTENCE-PROVENANCE (planner lesson 2026-10-08, B-95): traced the internal XOB lifecycle and provenance without editing or reopening prior readings; the XOB path remains parked until historical multi-XOB persistence and record-level provenance are proven.

- B-96-XOB-DIAGNOSTIC-EXPORT (planner lesson 2026-10-08, B-96): the first upstream diagnostic export attempt records whether internal multi-XOB history and run provenance can be exposed without enabling the trading gate.

- B-97-XOB-PROVENANCE-FIX (planner lesson 2026-10-08, B-97): repaired the B-96 diagnostic build-stamp formatting defect and repeated the same diagnostic without enabling a trading gate.

- B-98-XOB-SPEC-EVIDENCE-REVIEW (planner lesson 2026-10-08, B-98): reviewed the proven diagnostic export against the XOB specification without enabling a trading gate; the next step depends on the contract classification.

- B-99-XOB-CROSSRUN-PROVENANCE (planner lesson 2026-10-08, B-99): compared existing diagnostic artifacts for cross-run XOB identity and provenance without reopening readings or enabling a gate.

- B-100-XOB-RECALC-ID (planner lesson 2026-10-08, B-100): tested XOB composite identity across genuine fresh and incremental calculation paths without enabling a trading gate.

- B-101-XOB-FULLWINDOW-CENSUS (planner lesson 2026-10-08, B-101): extended the proven diagnostic export across RECON62 and June windows with corrected row-derived counts; no trading gate was enabled.

## 5. History
- Up to relay B-51: planner was a PromptQL bot (wiki mirror kept in PROMPTQL_PLANNER_CONTEXT.md, audit-only).
- 2026-10-06: planner moved to SuperApp (relay B-52).
- 2026-10-07: planner session ran as a PromptQL bot for relay B-57; this file stays the single planner context (PROMPTQL_PLANNER_CONTEXT.md stays audit-only).
- 2026-10-07: planner back on SuperApp for relay B-59; this file stays the single planner context.
- 2026-10-07: planner session ran as a PromptQL bot for relay B-64; this file stays the single planner context (PROMPTQL_PLANNER_CONTEXT.md stays audit-only).
- 2026-10-07: planner session ran as a PromptQL bot for relay B-65; this file stays the single planner context (PROMPTQL_PLANNER_CONTEXT.md stays audit-only).
- 2026-10-07: planner session ran as a PromptQL bot for relay B-66; this file stays the single planner context (PROMPTQL_PLANNER_CONTEXT.md stays audit-only).
- 2026-10-07: planner session ran as a PromptQL bot for relay B-67; this file stays the single planner context (PROMPTQL_PLANNER_CONTEXT.md stays audit-only).
- 2026-10-07: planner session ran as a PromptQL bot for relay B-68; this file stays the single planner context (PROMPTQL_PLANNER_CONTEXT.md stays audit-only).
- 2026-10-07: planner session ran as a PromptQL bot for relay B-69; this file stays the single planner context (PROMPTQL_PLANNER_CONTEXT.md stays audit-only).
- 2026-10-07: planner session ran as a PromptQL bot for relay B-70; this file stays the single planner context (PROMPTQL_PLANNER_CONTEXT.md stays audit-only).
- 2026-10-07: planner session ran as a PromptQL bot for relay B-71; this file stays the single planner context (PROMPTQL_PLANNER_CONTEXT.md stays audit-only).
- 2026-10-07: planner session ran as a PromptQL bot for relay B-72; this file stays the single planner context (PROMPTQL_PLANNER_CONTEXT.md stays audit-only).
- 2026-10-07: planner session ran as a PromptQL bot for relay B-73; this file stays the single planner context (PROMPTQL_PLANNER_CONTEXT.md stays audit-only).
- 2026-10-07: planner session ran as a PromptQL bot for relay B-74; this file stays the single planner context (PROMPTQL_PLANNER_CONTEXT.md stays audit-only).
- 2026-10-07: planner session ran as a PromptQL bot for relay B-75; this file stays the single planner context (PROMPTQL_PLANNER_CONTEXT.md stays audit-only).
- 2026-10-07: planner session ran as a PromptQL bot for relay B-76; this file stays the single planner context (PROMPTQL_PLANNER_CONTEXT.md stays audit-only).
- 2026-10-07: planner session ran as a PromptQL bot for relay B-77; this file stays the single planner context (PROMPTQL_PLANNER_CONTEXT.md stays audit-only).
- 2026-10-07: planner session ran as a PromptQL bot for relay B-78; this file stays the single planner context (PROMPTQL_PLANNER_CONTEXT.md stays audit-only).
- 2026-10-08: planner session ran as a PromptQL bot for relay B-79; this file stays the single planner context (PROMPTQL_PLANNER_CONTEXT.md stays audit-only).
- 2026-10-08: planner session ran as a PromptQL bot for relay B-80; this file stays the single planner context (PROMPTQL_PLANNER_CONTEXT.md stays audit-only).
- 2026-10-08: planner session ran as ClickUp Brain for relay B-81; this file stays the single planner context (PROMPTQL_PLANNER_CONTEXT.md stays audit-only).
- 2026-10-08: planner session ran as ClickUp Brain for relay B-82; this file stays the single planner context (PROMPTQL_PLANNER_CONTEXT.md stays audit-only).
- 2026-10-08: planner session ran as ClickUp Brain for relay B-83; this file stays the single planner context (PROMPTQL_PLANNER_CONTEXT.md stays audit-only).
- 2026-10-08: relay B-85 moved the planner workflow into a profile-neutral kit (PK-1, PLANNER_BOOTSTRAP.md); any planner agent starts there; this file stays the single planner context.
- 2026-10-08: planner session ran as ClickUp Brain for relay B-88; this file stays the single planner context (PROMPTQL_PLANNER_CONTEXT.md stays audit-only).
- 2026-10-08: planner session ran as ClickUp Brain for relay B-89; this file stays the single planner context (PROMPTQL_PLANNER_CONTEXT.md stays audit-only).
- 2026-10-08: planner session ran as ClickUp Brain for relay B-90; this file stays the single planner context (PROMPTQL_PLANNER_CONTEXT.md stays audit-only).
- 2026-10-08: planner session ran as ClickUp Brain for relay B-91; this file stays the single planner context (PROMPTQL_PLANNER_CONTEXT.md stays audit-only).
