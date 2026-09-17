# CODE REVIEW REQUEST — v137 — 2026-09-17 (refreshed stopfix set: V112 stale, recompute inline; same text to EVERY model)

Change (one plain sentence): the V112 prediction set went stale across the TP change, so the stopfix proving basis is recomputed below from current-tree rows — rule-stop selection flips no outcome on the register window.

File / function / lines: no code change — `Experts\SRJ_FlowNexus_EA.mq5` rewire L9556-9604 carried whole byte-exact in v136 (`B11F53F9`), tree unmodified since landing (canonical paths clean, HEAD `ca66fcd`).
Source digest: SHA256 `E5B97B36` / 597425 B (landed, committed, both remotes verified).

Complete code, verbatim, no elisions: none carried — no code claim is made here; the only code fact (rewire present L9556-9604) was read from disk this turn and is unchanged since the byte-exact v136 fence.

Run rows, raw (recompute from `RECON45_EXTRACT.txt`, archive `70CE840F`; method: R=|tp-entry|/|entry-stop| per row, both stops; sanity: recomputed-live matches filed liveR on all 14):
```
bar | dir | filedR/pass | ruleR/rulePass
2026.08.26 14:40 LONG 0.53/0 -> 0.53/0
2026.08.27 17:00 SHORT 0.32/0 -> 0.32/0
2026.08.27 18:50 LONG 0.07/0 -> 0.07/0
2026.08.28 10:00 SHORT 0.17/0 -> 0.17/0
2026.08.28 16:20 SHORT 0.19/0 -> 0.18/0
2026.08.31 15:05 SHORT 0.23/0 -> 0.23/0
2026.09.04 09:25 LONG 0.27/0 -> 0.27/0
2026.09.04 10:35 SHORT 0.54/0 -> 0.38/0
2026.09.04 15:55 LONG 0.99/0 -> 0.99/0
2026.09.07 09:15 LONG 0.62/0 -> 0.62/0
2026.09.07 16:40 LONG 0.39/0 -> 0.39/0
2026.09.08 10:05 SHORT 1.94/1 -> 1.94/1
2026.09.08 16:40 SHORT 0.05/0 -> 0.02/0
2026.09.08 16:55 SHORT 0.19/0 -> 0.19/0
DH 10:35 seed: ABSENT two ways (no LATCH, no SIDE1X at 09-08 10:35)
IE 16:55 seed: present, R=0.19 FAIL under both stops (V112 said 1.96 PASS on pre-promotion tp=1.16114; current tp=1.16210)
```
Finding: 14/14 outcomes identical under rule stops (3 rows change value, none cross 1.0). The V112 flips do not materialize on the current tree — TP-regime change, not a code defect. The rewire is live but outcome-latent on this window.

Question (one, specific): confirm the refreshed basis — does outcome-neutrality on the register window satisfy the stopfix proving, or is a flip-observing window required — and grant the token for the single proving run under the confirmed basis?

Answer form: plain yes / no / discrepancy, with line numbers.
Verification split: rule on the page only — genuineness vs disk is proven on disk (digests + counts above) and is not answerable from chat by any model tier. Do not ask for files.
Nothing else is asked. Thank you.
