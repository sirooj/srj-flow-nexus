---
name: srj-handoff
description: Prepare an SRJ Flow Nexus session handoff or compaction checkpoint from verified disk state.
---

# SRJ handoff

Use the current pointer and read the complete procedure [`srj-flow-nexus-handoff.md`](../../../.opencode/commands/srj-flow-nexus-handoff.md) before preparing a handoff. Treat handoff as read-only for strategy/code, builds, runs, commits, and pushes. Reconcile disk truth, filed verdicts, open owners, and the pointer; never use chat memory to fill a file gap.

Write only the handoff artifacts required by the procedure, collision-check every new path, verify by read-back, and report the exact file and action. Do not send the relay yourself.

**Never file a handoff over an unready artifact.** The procedure's READINESS GATE is binding: the structural battery green on the named files, a content census green on the saved file independently of the battery, a pointer whose every digest resolves to a live file, and a self-table figure census where every byte count, line count and marker line in the handoff's own tables is re-measured the same turn it is written - each measured and pasted, none recalled. A red check parks the round instead; an unready handoff costs the operator a round and two council credits, which is why this is a gate and not a preference.