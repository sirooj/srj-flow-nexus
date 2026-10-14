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

## 3. Arc (lane table + last 10; full arc in ARCHIVE/PLANNER_HANDOFF_FULL_B208.md)

### (a) Lane table
| lane | relays | state | evidence |
|---|---|---|---|
| JOURNAL-REASON | B-200-B-202 | closed KEPT B-202 | BUILDER_RESULT_B202.md |
| ONE-EXEC | B-199A-B-201 | open (robustness) | BUILDER_RESULT_B201.md |
| FOMC-MULTI | B-205-B-206 | closed KEPT euro B-206 | BUILDER_RESULT_B206.md |
| J2D-DEFECTS | B-204-B-211 | PARKED 6 of 6 (S8 panel-leg DOES NOT SEPARATE: A1,A2,A3,A5,A6,A7 break; must-nevers refuse; exit-fill measured) | SEPARATOR_B211.csv |
| F1-CONFIRM-KILL | B-212-B-213 | open 2 of 6 (S10a DOES NOT SEPARATE breaking 22Jul second paint; S10b SEPARATES, B-214 trial H1+H2) | SEPARATOR_B213.csv |
| BACKTEST-J2D | B-202-B-203 | open 2 of 6 MEASURED | BUILDER_RESULT_B203.md |
| FIDELITY-B179 | B-199 paused | 5 of 6 paused | BUILDER_RESULT_B199.md |
| MR-SWEEP-0710 | B-193-B-198 | PARKED 6 of 6 | BUILDER_RESULT_B198.md |
| TAKEN-TARGET | B-193 | closed KEPT | BUILDER_RESULT_B193.md |
| MISSED-GBP0706 | B-183 | closed? (progress-is-takes) | BUILDER_RESULT_B183.md |
| INPLAY-JUMP-0702 | B-171-B-174? | CLOSED KEPT | BUILDER_RESULT_B174.md |
| BLIND-GBP0706 | B-166-B-184 | closed (blind ended, trades banked) | REPORT/BLIND_GBPUSD_0706-0717.md |
| XOB-0604 | B-86-B-153 | parked/closed KEPT (PROMO-RETURN, KILL-0604 KEPT B-153) | BUILDER_RESULT_B153.md |
| STOP-BASIS | B-148-B-157 | closed KEPT (outward stop B-157) | BUILDER_RESULT_B157.md |
| XOB-LEVEL-0908 | B-158-B-160 | closed KEPT (old line B-160) | BUILDER_RESULT_B160.md |
| XOB-DETECT-920 | B-160a-B-162 | closed KEPT (origin tag B-162) | BUILDER_RESULT_B162.md |

### (b) Last 10 arc lines (verbatim)
- B-204: J2D-DEFECTS 1: banked his 9-trade review (3 invalid rulings filed must-never, FOMC multi-anchor ordered); rebuilt the review sheet per his cause-not-labels order (38 takes, every field from its print or NOT PRINTED); measured 6 defect classes on rows (D1 10 June confirmed adverse=2 passed at S5-diagnostic, D2 latched=latest on rows with an 8 July read split, D3 11 far-side zones no register row hit, D4 8 unreached lines marking A2/A7, D5 all trend with one MR verdict on 25 Aug pound, D6 single 29 July anchor with zero FOMC prints before 30 July); verdict MEASURED.
- B-205: FOMC-MULTI 1: indicator-only trial (6-date input list + per-bar newest-decision anchor + B205FOMC print, 0 errors 0 warnings); 3 runs PASSED (RECON62/JUNE0525/GBP0629); T2 STOP on A5 exit moved (TP 1.16315 to 1.16319) with a new 9-2 euro short and a new 1-July pound long, P2 FROM/TO/DEC multisets differ; tick-base drift measured underneath (POI walk start 06-01 to 05-25, FLOW sessions identical); restored from .preB205, EU long NOT RUN; verdict RESTORED.
- B-206: FOMC-MULTI 2 KEPT EURUSD scope per his order (same-day baseline: A5 1.16315 to 1.16319 + new 9-2 short; trial RECON 16/16 + 96/96 same; EU long 44/46 shared same, 18-Jun NOT FIRED next; anchors 29Apr/17Jun/29Jul/16Sep; new kept .B205K; T1 is identity reference; pound/yen measured, held unpublished).
- B-207: J2D-DEFECTS 2 euro MEASURED (S1 refuses 10Jun+A1, S2 refuses nothing, S3 refuses 10Jun+A1, S4 refuses 10Jun+A1; no reading separates; 25Jun/22Jul pass all; log writer = live+tester indicator prints, no toggle; EU-FIRST banked; verdict MEASURED).
- B-208: J2D-DEFECTS 3 euro MEASURED (print-only OB/FVG diagnostic, always restored; 16/16 + 44/44 deals identical; P1 pieces: A1-FVG found wick-dead vs machine OB 2170, 25Jun OB not found, 22Jul/A6-A7 found; P2 5097 killed/6316 skipped/265 never; P4 separates his way; blessedB208 re-blessed+T1-proven; verdict MEASURED).
- B-209: J2D-DEFECTS 4 euro MEASURED (machine pieces, S1/S2/S3 DOES NOT SEPARATE break A1+22Jul, 22Jul gap filed, PK-3; verdict MEASURED).
- B-210: J2D-DEFECTS 5 euro MEASURED (zone flags, R2 3238 reg kills, R3 several, R4/R5 NOT FOUND, S4-S7 DOES NOT SEPARATE, charts; verdict MEASURED).
- B-211: J2D-DEFECTS 6 euro MEASURED (panel-leg print-only, S8 DOES NOT SEPARATE A-breaks, exit-fill spread+3, lane PARKED; verdict MEASURED).
- B-212: F1-CONFIRM-KILL 1 euro MEASURED (kept identity 16/16, colour print-only S9a/b break 25Jun only, lane open; verdict MEASURED).
- B-213: F1-CONFIRM-KILL 2 euro MEASURED (OB-dead print-only, S10a DOES NOT SEPARATE 22Jul repaint, S10b SEPARATES, B-214 trial H1+H2; verdict MEASURED).

## 4. Never
- Ask him code or mechanism questions, or any question his record answers.
- Use his 5m read to age a retest or kill a line.
- Add a tolerance, buffer or number to any rule.
- Fall back to an older branch when a reply's branch is missing.
- Write a local workspace ID, URL, profile name or email into any repo file.
