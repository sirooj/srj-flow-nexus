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
| F1-CONFIRM-KILL | B-212-B-217 | PARKED 6 of 6 (B-217 K0 R-OTHER-25JUN-S4-REVIVE-FIRSTPAINT, no edit, MEASURED; negative evidence: H1+H2+H3 kill 10Jun/22Jul, A kept, 25Jun S4/revival/first-paint blocks; F1 parks, next P3) | BUILDER_SLICE_B217.md |
| P3-0618 | B-218-B-223 | closed KEPT B-223 (V1 close-kill build b4db21c5/61829f05; 18Jun added, 28Jul flip-removed) | REPORT/SEPARATOR_B223.csv |
| F3-INPLAY | B-224-B-226 | open 3 of 6 MEASURED | REPORT/SEPARATOR_B226.csv |
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
- B-217: F1-CONFIRM-KILL 6 euro MEASURED park (K0 R-OTHER S4/revival/first-paint, no H4, no trial; F1 PARKED 6 of 6).
- B-218: P3-0618 1 euro MEASURED (kept identity RECON62 16/16 + EU0525TD 44/44; R3 KILL-HIS-RULE; R4 SUPPRESSION-ENDS-AT-KILL; R8 D3 HIS-EYES chart call; verdict MEASURED).
- B-219: P3-0618 2 euro MEASURED (R1 HOLDER-DEAD re-grades B-218; R4 487+41 kept-alive-after-kill pairs; R5 484+44 dead-holder suppressions; S E2 (A5/C27/C28 touched); E2 diagnostic next; verdict MEASURED).
- B-220: P3-0618 3 euro RESTORED (R1 RECON 23 DEAD2/21 REVIVED EU 282/202; R2 0 zombies; T4 RECON 16/16 SAME EU 42vs44; 18Jun FIRES 09:45 1.15256 exit 10:00 1.15195; A2 1Sep GONE EU; C silent; verdict G2 NARROW-NEXT).
- B-221: P3-0618 4 euro MEASURED (R1 104 CLOSE/407 ABSENT; S V1 fails 6 kept, V2 fails 13; no trial).
- B-222: P3-0618 5 euro RESTORED (V1 trial 18Jun NEW A5 kept short silent 28Jul GONE).
- B-223: P3-0618 6 euro KEPT (28Jul flip-death proved on trial rows; 18Jun added; A1-A7 identical; build b4db21c5/61829f05).
- B-224: F3-INPLAY 1 euro MEASURED (T-REACH on kept rows; HIS-KEEP 10/13; F3 6/6 beyond-stop; next trials gate).
- B-225: F3-INPLAY 2 euro MEASURED (one zone per take; A2 split pick-missing EU; his 28Aug gap printed+picked-never; stop-side NO RULING chart call; exits censused; DOES NOT SEPARATE reach+standing).
- B-226: F3-INPLAY 3 euro MEASURED (current-leg test; A7 conflicts his words; A2-EU pick defect XOBPROMO; A3 EU absent F5; DOES NOT SEPARATE T-LEG).

## 4. Never
- Ask him code or mechanism questions, or any question his record answers.
- Use his 5m read to age a retest or kill a line.
- Add a tolerance, buffer or number to any rule.
- Fall back to an older branch when a reply's branch is missing.
- Write a local workspace ID, URL, profile name or email into any repo file.
