---
name: srj-goal
description: Track SRJ goals, deployment readiness, tester outcomes, or take-by-take reconciliation.
---

# SRJ goal and deployment gate

Before grading a run or making a deployment claim, read the complete current [`srj-goal/SKILL.md`](../../../.opencode/skills/srj-goal/SKILL.md), then use the active goal, frozen baseline, journal, run artifacts, and packet for this strategy. Keep observed behavior separate from expected behavior; account for every take, reject, false signal, and miss. Do not declare deployment readiness from partial metrics.

Run only when the active task and required operator authorization allow it. If run-specific procedure is needed, follow the project tester instructions in the archived operator contract and the active task packet.

Run evidence is measured, not composed: every figure in a run record (segment row counts, DONE/STATUS markers, window dates, bar/tick totals, durations, digests) is copied from an unfiltered same-turn read of the segment or marker file. Every fix packet names, per venue, the exact refusing row it flips before designing - a grade where all new telemetry fires but the takes do not move proves the packet scoped the wrong gate, never a regrade.