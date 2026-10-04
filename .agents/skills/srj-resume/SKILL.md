---
name: srj-resume
description: Resume or orient on the SRJ Flow Nexus project from its live disk state. Use at the start of SRJ work or when status is unclear.
---

# Resume SRJ Flow Nexus

1. Read [`BUILDER_SESSION_POINTER.md`](../../../SRJ_FlowNexus_Local/06_HANDOFFS/BUILDER_SESSION_POINTER.md) first. Treat it as the live resume source, not old queue snapshots.
1a. If the inbound message is a planner relay B-<n>, load `$srj-relay` and read BUILDER_RESULT_B<n-1>.md on branch builder/B-<n-1>. That relay is the active task.
2. Follow its resume order. Verify the pointer MECHANICALLY: enumerate every 64-hex token in it and compare each to the live hash of the file it names; a token with no disk match, or a live named file the pointer omits, is a mismatch. Also confirm git state (`git status --short`, `git log --oneline -5`). If a newer artifact conflicts with the pointer, stop and report the measured mismatch; do not pick a state silently.
3. Read the latest result and relay, plus the required verdicts. Read the relevance index before record archaeology. Keep the SRJ ledger closed unless an audit requires it.
4. Resume only the active task and its stated scope. Do not make strategy decisions, create a packet, build, run, commit, or push without the gates required by the live instructions.
5. Do not send external messages. Prepare exact relay instructions for you to carry.

For packet/relay/grade work, also load `$srj-council`; for strategy meaning, `$srj-strategy`; for run goals, `$srj-goal`; for a reported defect, `$srj-defect`; for a session transition, `$srj-handoff`.