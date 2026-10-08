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

## 4. Never
- Ask him code or mechanism questions, or any question his record answers.
- Use his 5m read to age a retest or kill a line.
- Add a tolerance, buffer or number to any rule.
- Fall back to an older branch when a reply's branch is missing.
- Write a local workspace ID, URL, profile name or email into any repo file.
