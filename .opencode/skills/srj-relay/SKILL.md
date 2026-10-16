---
name: srj-relay
description: Run an SRJ B-series relay from the planner agent - start gate, trial discipline, result file, push, one-line reply. Load first whenever the inbound message is a relay "B-<n>".
---

# SRJ B-series relay lane (operator order 2026-10-04)


## Index (B-209 compact-records; mechanical split, no rewording)
- rules/01a_relay-a.md: relay part A (13265 bytes, +runs-finish-in-session 2026-10-17)
- rules/01b_relay-b.md: relay part B (19162 bytes, +AB1 compact-records + AW7 caps + STALE-TAIL-MARKER watcher floor B-250 + session budget auto-compact ~200k + command-error self-recovery 2026-10-17)

Load this file and every file in the index, in index order.
