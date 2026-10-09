# PLANNER_HANDOFF - cold start for a new planner session
Written 2026-10-08 by relay B-84, refined by relay B-85 (kit PK-1). Stable page: where things are and the arc. Entry for any new planner agent, profile or workspace is PLANNER_BOOTSTRAP.md. Live state is 06_HANDOFFS/BUILDER_SESSION_POINTER.md on the newest builder/B-<n> branch; lessons are PLANNER_CONTEXT.md section 4.

## 1. Start
1. Operator pastes the kickoff (PLANNER_BOOTSTRAP section 0) ending with the builder's latest reply line.
2. Planner runs PLANNER_BOOTSTRAP sections 1 to 3 (read access, entry check, install when needed).
3. Planner verifies builder/B-<n> head = the reported commit; missing = one-line push/ls-remote paste for the builder, never an older branch.
4. Planner runs the loop in PLANNER_SKILL.md and drafts from PLANNER_RELAY_TEMPLATE.md.

## 2. Where things are (on builder/B-<n>)
- Spec: SRJ_FlowNexus_Local/00_CURRENT_WORKING/SRJ Flow Nexus — Part A Specification v4.2 (em dash in the name).
- His rules: .opencode/skills/srj-strategy/SKILL.md. Builder lane: .opencode/skills/srj-relay/SKILL.md.
- Register: 06_HANDOFFS/BUILDER_REGISTER_VALID_TRADES.md. His journal: 00_CURRENT_WORKING/OPERATOR_TRADE_JOURNAL.csv (grep only).
- Ledger 06_HANDOFFS/SRJ_FLOW_NEXUS_LEDGER.md (over 1 MB), AGENTS.md, .clinerules: grep only.
- His XOB answers: 06_HANDOFFS/BUILDER_FINDING_XOBSUIT-1.md section 6. Findings: 06_HANDOFFS/BUILDER_FINDING_*.md.
- EA: Experts/SRJ_FlowNexus_EA.mq5 on his disk, uncommitted; the GitHub copy lags. Locate code by text.

## 3. The arc B-69 to B-84
- B-69: hunk C (retest-candle touch) fired his 5 June 16:15 long but also 27 Aug 17:05 and 2 June 15:35, both ruled out. Restored.
- B-70 to B-75: 4 June London ruled not his; XOB, zone and CQD readings at the confirmation candle never separated.
- B-76 to B-81: target race keyed off his entry line; hunk RK restored (moved 4 Sep), side-matched hunk RKD KEPT (27 Aug refused at the target step).
- B-82: hunk C on the RKD build, diagnostic: 27 Aug out, 5 June 16:15 in, 2 June 15:35 still in. Restored.
- B-83: his "touch I do not count" words graded at the counted touch candle: machine and from-formation in-play readings separate; 2 June 14:20 has no XOB touch or retracement.
- B-84: kept trial of hunk C + the touch-candle XOB term; workflow moved to ClickUp.
- B-85: workflow refine: profile-neutral planner kit PK-1 in the repo; STOP banked as a verdict. Project work resumes B-86 with the XOB-term redesign.
- B-86: measured the readable selected-XOB path; full live-XOB map remains NOT READABLE; no source edit or run. Next relay depends on the diagnostic result.
- B-87: always-restored selected-XOB in-play diagnostic; full live-XOB map remains NOT READABLE; next relay follows the whole-run grade.
- B-88: measured why B-87 refused four valid takes, and whether his "XOB retracement or touch" words on the selected XOB at the counted candle reproduce the B-83 separation from EA-readable inputs; no edit or run.
- B-89: re-read his "XOB retracement or touch" words on the trade-direction pick with in play by spec §3.5 (from formation and from promotion, neither picked) on all register rows and the 65 counted passes; buildability per window; no edit or run.
- B-90: graded his XOBSUIT-1 answer 3 words (SL swing leg touched from the XOB projection) on the trade-direction pick at the counted candle, on all register rows (4 June London deciding: DIFFERENT from his words) and the 65 passes (11 diffs); checked the indicator pick rule on the four bias-differs candles (all DIFFERENT, A2-17:25 re-grade would flip R5 with same-candle edge); buildability NOT-BUILDABLE; no edit or run.
- B-91: banked his "retrace and in play are the same thing" pin and his no-cascade order; withdrew the B-88 to B-90 retrace/in-play split; re-graded MACH, from-formation, from-promotion and stop-leg readings as one in-play condition on the full register (A, B, C) and the 65 passes; no edit or run.

- B-92: parked the XOB separator as NOT BUILDABLE after B-91 found no separating reading; no source edit or run.

- B-93: inventoried existing upstream XOB evidence without source edits or runs; next step depends on whether a complete readable live-XOB source exists.

- B-94: inspected the indicator's internal XOB records and defined the minimum evidence contract; no source edit or run.

- B-95: traced internal XOB persistence and run provenance without source edits or runs; the separator remains parked pending proof of both.

- B-96: attempted a diagnostic-only upstream XOB export; no trading gate was enabled; next relay reviews the export evidence.

- B-97: repaired the diagnostic provenance formatting defect and repeated the same XOB export run; no trading gate was enabled.

- B-98: reviewed B-97's proven diagnostic export against the XOB specification; no trading gate was enabled.

- B-99: compared existing B-96/B-97 diagnostic artifacts for cross-run XOB identity and provenance; no source edit or run.

- B-100: tested the XOB composite identity across fresh and incremental calculation paths; no trading gate was enabled.

- B-101: extended the proven XOB diagnostic across RECON62 and June windows; no trade grade or gate was performed.

- B-102: recovered RECON62 counted-candle XOB rows and exact diagnostic hashes; no gate or trade grade was performed.

- B-103: reviewed all recovered RECON62 EU XOB counted-candle rows; no gate or trade grade was performed.

- B-104: measured one offline full-population XOB separator across the recovered EU counted candles; no gate or trade grade was performed.

- B-105: reviewed existing June XOB rows for the 2 June and 4 June ruled-out cases beside 5 June valid; no gate or trade grade was performed.

- B-106: recovered the June XOB row populations for the ruled-out and valid cases; no gate or trade grade was performed.

- B-107: classified the recovered June XOB rows; no gate or trade grade was performed.

- B-108: reviewed the June touch separator for rule authority and runtime buildability; no source edit or gate was performed.

- B-109: defined the raw upstream XOB evidence payload and acceptance checks; no source edit or gate was performed.

- B-110: implemented and validated the raw upstream XOB payload; no gate or trade grade was performed.

- B-111: reviewed the proven XOB payload against June and EU offline evidence; no gate or trade grade was performed.

- B-112: defined a pair/session-scoped XOB diagnostic boundary; no source edit, gate or trade grade was performed.

- B-113: defined the runtime handoff boundary for the scoped XOB diagnostic; no source edit or gate was performed.

- B-114: reviewed scoped XOB touch coverage across known audited June cases; no source edit, gate or trade grade was performed.

- B-115: closed the XOB touch evidence lane with no new rule, source edit or gate; project goal remains incomplete.

- B-116: XOB lane closed without a rule; project remains active. Next relay returns to full-range EA fidelity, including 2 June/4 June invalid UJ fires and the 5 June 16:15-versus-16:55 entry mismatch.

- B-117: graded the unchanged kept build against the June register; no source edit or gate was performed.

- B-118: targeted the 4 June false SHORT; 5 June 16:15-versus-16:55 remains a separate unresolved fidelity defect.

- B-119: measured his three 4 June reasons (bias, CQD, XOB in play) on the machine's rows across the full register; no source edit or run.

- B-120: measured the regime at the retest candle and the unclassified-retain path against spec 3.2 on the full register; no source edit or run.

- B-121: measured the machine's 4H/1H/15m reads against his chart reads at the named candles on the full register, and the history of his FIX-NOT-REPLACE order; no source edit or run.

- B-122: STOP before edit; the confirmed HTF switch is already live at the EA handle, so the indicator default flip was a no-op; no edit or run.

- B-123: measured which HTF read his chart panel shows and whether each machine-vs-chart split is a one-candle lag of the confirmed read; no source edit or run.

- B-124: trial removing the late regime latch (a seed with no regime at its retest candle is released, not held for a later bar), graded on RECON62 and June.

- B-125: measured which candidate the 5 June New York 16:05 abort killed and graded his flip-candle retest words on every register row and every kept 5m kill on both whole runs; one unchanged kept RECON62 run, no source edit.

- B-126: kept-build trial letting the flip-candle retest live on as its own potential after the 5m flip kills the formed setup (5 June 16:00 retest, 16:10 confirmation, 16:15 entry), graded on RECON62 then June.

- B-127: measured the 5 June 16:10 confirmation candle line by line against his entry lines and the 16:00 retest-candle touch, graded on every register row and every kept confirmation refusal; no source edit or run.

- B-128: measured his 2 June words ("no valid XOB retracement or touch there") on the retest-carried confirmation path only: retest-candle XOB touch and in play on every hunk-C cSrc=RETEST row, deciding rows 5 June 16:10 and 2 June 15:30; no source edit or run.

- B-129: kept-build trial of hunk C with the retest-carried touch counted only when the retest candle reaches its promoted XOB (his 2 June words), kept prior-candle touch untouched; graded RECON62 then June (5 June 16:15 owed, 2 June 15:35 must stay out).

- B-130: banked his divergence words (never stale, only renewed; the latest is the valid one) and named, on the kept build's rows, the divergence each kept fire latched, 4 June 09:55 first; no gate or source edit kept.

- B-131: workflow kit PK-2 (row packs, separator gate, lane limit 6, quote discipline); divergence latch print kept if deals identical; first row packs; 4 June CQD separator table.

- B-132: banked his 4 June CQD answer (CQD withdrawn, XOB + HTF reasons stand); parked the 4 June lane at 6 of 6 as a known open fire; per-day row packs with exits; exit census on every kept trade; no source edit or run.

- B-133: cut entry-to-exit packs for every kept trade; named the cause of the 1 Sep 17:45 non-exit; graded his higher-line break-exit words on every kept exit (Part S); no source edit or run.

- B-134: kept-build trial of the break exit judged on the candle's own body (1 Sep 17:45 Yearly POC) stopped at the S0 separator (A1 11:30 also qualifies, kept 11:40 exit would move); no source edit, compile or run; verdict STOP.

- B-135: pinned his 28 Aug London exit from the record (11:35 against the machine's 11:40) and re-graded the own-body break on his exits; no source edit or run.

## 4. Never
- Ask him code or mechanism questions, or any question his record answers.
- Use his 5m read to age a retest or kill a line.
- Add a tolerance, buffer or number to any rule.
- Fall back to an older branch when a reply's branch is missing.
- Write a local workspace ID, URL, profile name or email into any repo file.
