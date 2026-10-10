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

- B-102-RECON62-COVERAGE-HASHES (planner lesson 2026-10-08, B-102): recovered RECON62 counted-candle XOB rows and exact diagnostic artifact hashes without enabling a trading gate.

- B-103-EU-XOB-RECORD-REVIEW (planner lesson 2026-10-08, B-103): reviewed the recovered RECON62 EU XOB rows at all 13 counted candles without choosing a gate or grading trades.

- B-104-OFFLINE-XOB-SEPARATOR (planner lesson 2026-10-08, B-104): measured full-population XOB retracement/touch evidence across the recovered EU counted candles without editing or enabling a gate.

- B-105-JUNE-XOB-RULEDOUT-REVIEW (planner lesson 2026-10-08, B-105): reviewed existing June XOB evidence for the 2 June and 4 June ruled-out cases beside the 5 June valid case without editing or enabling a gate.

- B-106-JUNE-XOB-ROWS-RECOVERY (planner lesson 2026-10-08, B-106): recovered the deleted June XOB row populations for the 2 June, 4 June and 5 June cases without enabling a trading gate.

- B-107-JUNE-XOB-SEPARATOR-CLASSIFICATION (planner lesson 2026-10-08, B-107): classified the recovered June XOB rows at the counted retest and kept confirmation/entry context separate without enabling a gate.

- B-108-XOB-TOUCH-AUTHORITY-BUILDABILITY (planner lesson 2026-10-08, B-108): reviewed the offline June touch separator against banked XOB words, specification authority and live runtime inputs without enabling a gate.

- B-109-XOB-EVIDENCE-PAYLOAD (planner lesson 2026-10-08, B-109): defined the raw upstream XOB evidence payload and acceptance checks without choosing a transport or enabling a gate.

- B-110-XOB-PAYLOAD-IMPLEMENTATION (planner lesson 2026-10-08, B-110): implemented and validated the raw upstream XOB payload without enabling a trading gate.

- B-111-XOB-PAYLOAD-OFFLINE-REVIEW (planner lesson 2026-10-08, B-111): reviewed the proven payload against June and EU offline XOB evidence without enabling a trading gate or generalizing the June separator.

- B-112-SCOPED-XOB-DIAGNOSTIC (planner lesson 2026-10-08, B-112): defined the pair/session-scoped XOB touch diagnostic boundary without generalizing the June result or enabling a gate.

- B-113-XOB-RUNTIME-HANDOFF (planner lesson 2026-10-08, B-113): defined the runtime handoff boundary for the scoped XOB diagnostic without enabling a production gate or changing trading behavior.

- B-114-JUNE-SCOPED-COVERAGE (planner lesson 2026-10-08, B-114): reviewed the known audited June cases under the scoped XOB touch lens without generalizing it or enabling a gate.

- B-115-XOB-EVIDENCE-CLOSED (planner lesson 2026-10-08, B-115): closed the XOB touch evidence lane without a new rule or gate because valid June cases disagree and EU remains a separate non-touching population.

- B-116-RETURN-TO-FULL-RANGE-FIDELITY (planner lesson 2026-10-08, B-116): closing an investigation lane never closes the SRJ project; every next relay returns to the unresolved full EU/UJ audited-range objective unless the operator redirects. Operator-stated trade times outrank machine times; machine mismatches are defects to explain.

- B-117-JUNE-KEPT-BUILD-FIDELITY (planner lesson 2026-10-09): graded the unchanged kept build against the June register, including operator 16:15 versus machine timing, without editing the EA or enabling a gate.

- B118-4JUN-SHORT-FALSE-FIRE (planner lesson 2026-10-09): tested one narrow pre-entry suppression of the 4 June false SHORT; 5 June 16:15 timing remains a separate unresolved defect.

- B119-4JUN-THREE-REASONS (planner lesson 2026-10-09): when a narrow block holds its bar but the same candidate fires a bar later, measure each of his separate reasons on the machine's own rows across the whole register before drafting another edit; B-118 blocked one in-play read and the fire re-armed on the next.

- B120-REGIME-AT-RETEST (planner lesson 2026-10-09): grade a bias reason at the retest candle his words name, with both regime branches (trend majority and fresh same-session sweep) beside his journal setup class; B-119 graded the HTF majority at confirmation only and read 1 Sep, a '++' row, as a trend-only breaker.

- B121-FIX-NOT-REPLACE-READS (planner lesson 2026-10-09): a machine-vs-chart HTF read split at a bar is a read error under FIX-NOT-REPLACE (strategy line 93) and 15M-READS (line 141), never a breaker or a strategy fact; measure it per timeframe at the candle his words name, rule out feed divergence (spec 9.1) first, and refine inside the indicator only, proven by the unchanged 7 EU takes (line 92). B-119 R1 called the 1 Sep long a breaker on a known read split.

- B122-LIVE-HANDLE-FIRST (planner lesson 2026-10-09): before drafting any indicator switch or input edit, read the EA's live iCustom call and the run rows' own flags (confirmedFeed); an indicator default is dead when the EA passes the value. B-121 R6 read the default as live and B-122 stopped before a no-op edit.

- B123-HTF-STALENESS (planner lesson 2026-10-09): settle which flavor his chart panel shows before calling a machine HTF read inaccurate, and class each split as a one-candle lag or a persisting read on the rows; FIX-NOT-REPLACE defines accurate against his chart read at the bar.

- B123-HTF-LANE-PARKED (planner lesson 2026-10-09): B-121 to B-123 found the EA already reads the confirmed HTF candle; of nine machine-vs-chart splits one is a one-candle lag that moves no trade and eight persist past the close, mostly against session-level journal cells and inside the spec 9.1 feed bound; equalizing to his chart threatens B3 and C3. The HTF read lane is parked with no edit; reopen only on new bar-named reads of his.

- B124-NO-LATE-LATCH (planner lesson 2026-10-09): grade a necessary-condition reading by whether every valid take passes and the ruled-out fire fails, not by whether ruled-out rows that other gates already silence also fail; B-120 RA was read as DOES NOT SEPARATE on 2 June, 10 June and 5 June London, which stay silent by other gates.

- B125-PATH-PER-TAKE (planner lesson 2026-10-09): before any edit to a seed hold, release or kill, name the path each valid take fires through (same-pass, retained, update, preempt, yield, prebind) on both kept runs; B-124 released no-regime seeds and lost the 1 Sep long, whose kept fire rides a 17:30 preempt transfer off the held short candidate and never passes a regime check, and B-124 K2(b) predicted it held.

- B126-NAME-THE-DEAD-CANDIDATE (planner lesson 2026-10-09): before drafting a fix for a missed take, name the candidate that died by seed time, line and kill row on the kept rows, not by an earlier result's shorthand; B-117 named the 5 June 16:05 death a seed-bias refusal of his 16:00 retest, but B-125 rows show the 15:20 Monthly POC long's deferred 5m abort, with his 16:00 retest held behind it and never seeded.

- B127-WHOLE-PATH-BEFORE-HUNK (planner lesson 2026-10-09): when an earlier hunk reached a missed take through more than one change, measure every step of that path on the rows before trialing one part; B-126 built hunk C's reseed half alone, and the reseeded 5 June 16:00 long died at the 16:10 confirmation on touchAttr=0, the step hunk C's retest-candle touch carried (B-125 R2 f).

- B128-ADDED-ROWS-ONLY (planner lesson 2026-10-09): a term that only adds confirmations is graded on the rows it adds (kept confirm=0 turned 1) and the fires those rows produce, never on kept fires; B-127 counted the 4 June 09:50 kept same-bar confirmation as a CF-C breaker and graded 2 June 15:30 CF-A PASS though the kept prior-candle test refused it (C_TOUCH), which left 2 June as the only real breaker of the retest-carried touch.

- B129-KEEP-THE-KEPT-TERM (planner lesson 2026-10-09): an added confirmation term is OR'd onto the kept test, never written over it; .B82C replaced the kept guarded prior-candle touch (EA:2532) with an exact one inside "touch = (uj60_tR || uj60_tP)", so B-128's "kept path byte-for-byte unchanged" held for the new branch only, and the trial gate reads the same ZONEPICK zone at the confirmation candle that the B-128 reading graded.

- B130-NAME-THE-LATCHED-VERDICT (planner lesson 2026-10-09): before any CQD claim or gate, quote the kept build's own firing-path row naming the latched divergence (value, bar, kind); eligibility-census rows are not the firing path, a row from another build is never graded, and one date's chart words never describe another date. The 4 June CQD claim rode j38-era SIDE1O_ELIGSTATE / SIDE1Q_CQDKILL UNREAD rows (register section C), and the B-129 builder brief set 1 Sep's blue-solid words beside 4 June.

- B131-ROWS-BEFORE-RELAYS (operator order 2026-10-09, carried core: "Refine the workflow pipeline so it provides more context and does not waste another hundred releases"): kit PK-2. Kept builds commit row packs; trials need a committed separator table; a lane parks at 6 relays with no separator; quotes carry line numbers and rows carry run + SHA. Cost case: thirty XOB relays (B-86 to B-115) closed with no rule; B-129 is the positive case (XT-TOUCH separated on rows, the trial reproduced it).

- B132-4JUN-PARKED (planner lesson 2026-10-09): a lane whose remaining reasons all sit in already-parked lanes is parked at its limit, never re-run; 4 June 09:55 parked at 6 of 6 after his word withdrew CQD; it stays a known open fire on the kept build and reopens only on a new bar-named HTF read of his or a readable live-XOB source. Row packs are cut per day with exits included, because a 670 KB window pack is too large for the planner to read.

- B133-EXIT-ROWS-FIRST (planner lesson 2026-10-09): an exit lane grades from every row between entry and exit, never from the MTEXIT row alone; the B-132 day packs carry the 1 Sep 17:35 deal, 17:51 stop and MTEXIT but no per-candle exit rows, so the 17:45 Yearly POC break could not be read from the pack; B-133 cut whole entry-to-exit packs for every kept trade.

- B135-OWED-EXIT-NOT-MACHINE-EXIT (planner lesson 2026-10-09): a must-keep exit is his exit, never the machine's; B-134 pinned A1 at the machine's 11:40 while his 28 Aug words say 'hence the exit at 11:35' and his 2026-09-22 ruling calls that exit mechanism flawed, so the S0 stop guarded a machine time. Every 'must keep' exit is checked HIS vs MACHINE against the register proof key before a trial is drafted.

- B137-VOLUME-IS-NOT-A-TAKE (planner lesson 2026-10-09): a must-keep deal is its side, date, time and price (register section E: 'all section-A takes reproduce (entry/bar)'); lot size follows the account value, and spec section 7 puts sizing out of scope. A moved exit re-sizes later entries by balance, so volume drift is accounted from the sizer on each run's own account value and is never a STOP by itself. B-136 R-a restored a trial whose entries and his two owed exits all hit; the planner's relay owned that over-specification.

- B138-SIGNAL-BEFORE-FILL (planner lesson 2026-10-09): with every register take and his two owed exits reproduced (B-137 KEPT), the next fidelity gap is price. Each kept deal is graded first on the machine's own signal price (entry ref, MTEXIT exit) against his price and the candle open or booked target. The fill is graded second, and its spread and lag gaps are classed from rows (his EXACT-PRICE-NO-LENIENCY L34), never tolerated and never mixed with a signal defect.

- B139-HIS-FILL-FIRST (planner lesson 2026-10-09): a fill is graded against his own fill basis before any spread or lag gap is called a defect. B-138 classed four EURUSD entries SPREAD against the bid open (1 Sep 1.16024, 4 Sep 1.16019, 7 Sep 1.16138, 7 Sep 1.16264), while the register A rows 2-5 cells marked HIS report equal the machine's ask fill to the point. Entry timing is graded to the second, because his L34 concern is the automation matching the open.

- B140-RULE-BASIS-BEFORE-UNKNOWN (planner lesson 2026-10-09): before any row's basis is typed UNKNOWN or MACHINE, his banked words for that scenario class are grepped and quoted; B-139 typed the 5 June NY exit UNKNOWN though RETARGET-CLOSED-AM and the section 9 restatement name his closed-session-high exit for that trade, and typed the 7 Sep London exit MACHINE though his AS.H rule-choice names it.

- B141-STOP-SETS-R (planner note 2026-10-09): with entries, prices and exits reproduced on his rules (B-137 to B-140), the stop reference is the untested part of every deal; it sets R at admission (8 Sep 16:40 refused at R 0.68 off his 1.16359 two-swing high) and spec 8 names the branch selector wrong on a named instance, so each kept stop is graded against spec 3.7 on printed rows before any R claim is relied on; B-140 R6 could not name the swing behind the 8 Sep NY 1.16274 stop.

- B136-OWNBODY-ON-HIS-EXITS (planner lesson 2026-10-09): an exit term goes to trial only after its separator is graded on his owed exits (B-135 R5); it is OR'd onto the kept break test, with the fill left at the next open. B-134 S0 alone would have guarded the machine's 28 Aug 11:40 time. B-136 trialed the own-body break (side by the candle's own open, through by its own close) on the kept build: 28 Aug owed out at the 11:35 open, 1 Sep owed out at the 17:50 open, every other deal a change detector.

- B142-PICK-SHAPE-SHARED (planner note 2026-10-09): before drafting any XOB veto for the 4 June 09:55 short, set its kept-build zone rows beside his valid 8 Sep NY short; both arm on a machine pick printed out of play at the arming bar (ZONEPICK xobInPlay=0, INPLAYCOMMIT legacy=0) and committed only by an old swing (changed=1; 4 June firstShift=95 on XOB 3052 promoted 04:50, JUNE0525-B137 pack 1390/1391; 8 Sep firstShift=809 on XOB 2898 promoted 3 Sep 21:35, RECON62-B137 pack 3391/3392), so a veto on that shape costs A7; B-142 grades every spec and his-word reading on the live pick and censuses the full XOB map at both confirmation candles.

- B143-HIS-ZONE-NOT-PICK (planner note 2026-10-09): his in-play XOB for 8 Sep New York is the 9:20 XOB, not the machine's 3 Sep pick; any XOB rule is graded on his zone and on the pick side by side, on every register row, before a veto is drafted.
- B144-STAMP-BEFORE-CANDLE (planner lesson 2026-10-10): read an export stamp in its writer's own time convention before naming a candle, and grade a his-zone reading on each register row's own zone. B-143 R1 explained XOB 3293's invalT 09:40 with the 09:40 candle while the record already carried it at barT 09:35, and B-143 R4 graded A7's 8 Sep zone on rows from 26 Aug to 11 June (cross-symbol for June), so its DOES NOT SEPARATE verdicts carry no separator weight.
- B145-STAMP-CORRECTED (planner correction 2026-10-10): an XOBDIAG row stamped barT holds the state after the next candle's passes (B97PROV:890 and 1153, target = i - 1), so B-143's 09:40 kill candle for XOB 3293 stood and the first half of B144-STAMP-BEFORE-CANDLE was a planner false alarm; its second half (grade each register row on its own zone) stands. When his word that a zone is in play meets a kill on the tester's candles and his own candles are absent, the gap is a feed question first (spec 9.1): read the colour and draw state and his record before any chart call.
- B146-NEW-WORD-BEFORE-CALL (planner lesson 2026-10-10): a carried chart call is checked against every word of his given with the relay before it is passed. The B-145 call presumed the exact-middle kill while his same-session words say the kill level is not always the middle, so it was withheld (B-79 class) and his words are banked and graded first.
- B147-HIS-RULES-MEANS-RECORD (planner lesson 2026-10-10): when his words point at his rules ("Just look at my rules"), the missing number is searched in code history and the record before any call reaches him; XOBSUIT-1 section 1 already named an "old level" set off the order-block candle before the pure-midline rule, and the B-146 call asked him for it. The lane's last relay grades the spec's own reading (3.5.1 relevance before retracement) on every register row, not one row.
- B148-SEPARATES-NOT-BUILDABLE (planner note 2026-10-10): a lane that reaches its limit with a SEPARATES table whose inputs the EA cannot read live is parked, not extended. XOB-0604 parked at 6 of 6 on B-147 R3 (PROMO-RETURN, spec 3.5.1 relevance then retracement then confirmation: every valid take MET, 4 June 09:55 NOT MET, on the machine alive flag and on his old level) with R4 NOT BUILDABLE (full live XOB list, per-XOB promotion candle and alive state not EA-readable). Reopen key: those inputs EA-readable at runtime (B-109 contract, B-113 boundary), then the R3 table re-proven on kept-build rows before any trial, because the R3 rows came from diagnostic-export artifacts.
- B148-STOP-BRANCH-INPUT (planner note 2026-10-10): STOP-BASIS resumes at 2 of 6 by locating the spec 3.7 branch input (the 2xOB state on his bias panel) in code before any print or grade; a print-only diagnostic runs only on a state the indicator already exports, is always restored, and stops on any moved deal.
- B149-BRANCH-FROM-DISK (planner lesson 2026-10-10): every relay checks the builder's current branch from disk, never from the checkout's printed message: git rev-parse --abbrev-ref HEAD and git rev-parse HEAD right after the cut and again right before the commit; B-148's checkout printed success, did not take effect, and its commit landed on local builder/B-147 (repaired B-148 without history rewrite; local builder/B-147 re-made from backup in B-149 Part 0).
- B149-PANEL-STATE-PRINT (planner note 2026-10-10): a rule input that lives only on his panel (B-148 R2: 2xOB drawn, never exported) is first read by a print-only indicator line on an always-restored run with every deal required identical, never by a new buffer or an EA edit; a buffer is drafted only after the printed rows separate.
- B150-KILL-BY-HIS-RULE (planner note 2026-10-10): his KILL-FIRST order removes the 4 June 09:55 short only through a rule that already SEPARATES on committed rows (B-147 R3 PROMO-RETURN), made EA-readable by an additive indicator export that must first reproduce the offline table verdict for verdict and id for id; a date, price or pick-shape block is never used (NO-OVERFIT; B142-PICK-SHAPE-SHARED).
- B150-STOPBASIS-HIS-SWINGS-FIRST (planner lesson 2026-10-10): before any Part S on the stop branch, the builder's two-swing count is checked against his own named stops; B-149 R3 graded A3 (his 15:30 swing low 1.15847, SEP7/SLDEF5) and A6 (his "two swings away at 09:40 high 1.16258", SEP8_1010-LEVELS) DIFFERENT, so its walk does not count swings the way he does. STOP-BASIS resumes by calibrating the count on his instances, never by drafting an edit from the 7 DIFFERENT rows.
- B151-VERDICT-NOT-IDS (planner lesson 2026-10-10, defect owned): a re-proof gate grades the separator's verdicts on every register row; differences in the zones behind a verdict are accounted as their own reading (history window, lifecycle row), never a STOP by themselves. B-150 K4 demanded id-set equality while the kept build's full-history replay sees older live zones the offline scan never had (spec 9.9: age never disqualifies), and stopped a trial whose verdicts were 12 for 12 (B-136 over-specification class).
- B152-PRINT-PROVES-ITSELF (planner lesson 2026-10-10): an export that feeds a gate prints, for every object behind a verdict, each field the check needs (zone, promotion candle, the comeback candle that met the rule) so the run's own rows prove it; B-151 could check B150PR only by matching zone numbers to the 8 Oct diagnostic run, and six named zones (2510: 29 May 19:10, 159.141-159.180, 64 overlaps before promotion, none after) showed no comeback there. Zones are matched across runs by range and promotion time, never by number.
- B153-NEW-SLOTS-START-CLEAN (planner note 2026-10-10): a per-object store that grows inside the indicator sets every new slot to its empty value and saves each event's own time and prices when it happens, never a bar index read later; B-152's proof print crashed on a stored bar index and showed zones flagged with no comeback recorded, the pattern behind B-151's six no-comeback zones, so every verdict built on the B-150 store is re-graded from scratch on the cleaned store.

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
- 2026-10-09: planner session ran as ClickUp Brain for relay B-119; this file stays the single planner context (PROMPTQL_PLANNER_CONTEXT.md stays audit-only).
- 2026-10-09: planner session ran as ClickUp Brain for relay B-120; this file stays the single planner context (PROMPTQL_PLANNER_CONTEXT.md stays audit-only).
- 2026-10-09: planner session ran as ClickUp Brain for relay B-121; this file stays the single planner context (PROMPTQL_PLANNER_CONTEXT.md stays audit-only).
- 2026-10-09: planner session ran as ClickUp Brain for relay B-122; this file stays the single planner context (PROMPTQL_PLANNER_CONTEXT.md stays audit-only).
- 2026-10-09: planner session ran as ClickUp Brain for relay B-123; this file stays the single planner context (PROMPTQL_PLANNER_CONTEXT.md stays audit-only).
- 2026-10-09: planner session ran as ClickUp Brain for relay B-124; this file stays the single planner context (PROMPTQL_PLANNER_CONTEXT.md stays audit-only).
- 2026-10-09: planner session ran as ClickUp Brain for relay B-125; this file stays the single planner context (PROMPTQL_PLANNER_CONTEXT.md stays audit-only).
- 2026-10-09: planner session ran as ClickUp Brain for relay B-126; this file stays the single planner context (PROMPTQL_PLANNER_CONTEXT.md stays audit-only).
- 2026-10-09: planner session ran as ClickUp Brain for relay B-127; this file stays the single planner context (PROMPTQL_PLANNER_CONTEXT.md stays audit-only).
- 2026-10-09: planner session ran as ClickUp Brain for relay B-128; this file stays the single planner context (PROMPTQL_PLANNER_CONTEXT.md stays audit-only).
- 2026-10-09: planner session ran as ClickUp Brain for relay B-129; this file stays the single planner context (PROMPTQL_PLANNER_CONTEXT.md stays audit-only).
- 2026-10-09: planner session ran as ClickUp Brain for relay B-130; this file stays the single planner context (PROMPTQL_PLANNER_CONTEXT.md stays audit-only).
- 2026-10-09: planner session ran as ClickUp Brain for relay B-131 (kit PK-2); this file stays the single planner context (PROMPTQL_PLANNER_CONTEXT.md stays audit-only).
- 2026-10-09: planner session ran as ClickUp Brain for relay B-132 (kit PK-2); this file stays the single planner context (PROMPTQL_PLANNER_CONTEXT.md stays audit-only).
- 2026-10-09: planner session ran as ClickUp Brain for relay B-133 (kit PK-2); this file stays the single planner context (PROMPTQL_PLANNER_CONTEXT.md stays audit-only).

- 2026-10-09: planner session ran as ClickUp Brain for relays B-133 to B-135 (kit PK-2); this file stays the single planner context (PROMPTQL_PLANNER_CONTEXT.md stays audit-only).

- 2026-10-09: planner session ran as ClickUp Brain for relay B-136 (kit PK-2); this file stays the single planner context (PROMPTQL_PLANNER_CONTEXT.md stays audit-only).

- 2026-10-09: planner session ran as ClickUp Brain for relay B-137 (kit PK-2); this file stays the single planner context (PROMPTQL_PLANNER_CONTEXT.md stays audit-only).

- 2026-10-09: planner session ran as ClickUp Brain for relay B-138 (kit PK-2); this file stays the single planner context (PROMPTQL_PLANNER_CONTEXT.md stays audit-only).

- 2026-10-09: planner session ran as ClickUp Brain for relay B-139 (kit PK-2); this file stays the single planner context (PROMPTQL_PLANNER_CONTEXT.md stays audit-only).

- 2026-10-09: planner session ran as ClickUp Brain for relay B-140 (kit PK-2); this file stays the single planner context (PROMPTQL_PLANNER_CONTEXT.md stays audit-only).

- 2026-10-09: planner session ran as ClickUp Brain for relay B-141 (kit PK-2); this file stays the single planner context (PROMPTQL_PLANNER_CONTEXT.md stays audit-only).

- 2026-10-09: planner session ran as ClickUp Brain for relay B-142 (kit PK-2); this file stays the single planner context (PROMPTQL_PLANNER_CONTEXT.md stays audit-only).

- 2026-10-09: planner session ran as ClickUp Brain for relay B-143 (kit PK-2); this file stays the single planner context (PROMPTQL_PLANNER_CONTEXT.md stays audit-only).

- 2026-10-10: planner session ran as ClickUp Brain for relay B-144 (kit PK-2); this file stays the single planner context (PROMPTQL_PLANNER_CONTEXT.md stays audit-only).

- 2026-10-10: planner session ran as ClickUp Brain for relay B-145 (kit PK-2); this file stays the single planner context (PROMPTQL_PLANNER_CONTEXT.md stays audit-only).

- 2026-10-10: planner session ran as ClickUp Brain for relay B-146 (kit PK-2); this file stays the single planner context (PROMPTQL_PLANNER_CONTEXT.md stays audit-only).

- 2026-10-10: planner session ran as ClickUp Brain for relay B-147 (kit PK-2); this file stays the single planner context (PROMPTQL_PLANNER_CONTEXT.md stays audit-only).

- 2026-10-10: planner session ran as ClickUp Brain for relay B-148 (kit PK-2); this file stays the single planner context (PROMPTQL_PLANNER_CONTEXT.md stays audit-only).

- 2026-10-10: planner session ran as ClickUp Brain for relay B-149 (kit PK-2); this file stays the single planner context (PROMPTQL_PLANNER_CONTEXT.md stays audit-only).
- 2026-10-10: planner session ran as ClickUp Brain for relay B-150 (kit PK-2); this file stays the single planner context (PROMPTQL_PLANNER_CONTEXT.md stays audit-only).
- 2026-10-10: planner session ran as ClickUp Brain for relay B-151 (kit PK-2); this file stays the single planner context (PROMPTQL_PLANNER_CONTEXT.md stays audit-only).
- 2026-10-10: planner session ran as ClickUp Brain for relay B-152 (kit PK-2); this file stays the single planner context (PROMPTQL_PLANNER_CONTEXT.md stays audit-only).
- 2026-10-10: planner session ran as ClickUp Brain for relay B-153 (kit PK-2); this file stays the single planner context (PROMPTQL_PLANNER_CONTEXT.md stays audit-only).
