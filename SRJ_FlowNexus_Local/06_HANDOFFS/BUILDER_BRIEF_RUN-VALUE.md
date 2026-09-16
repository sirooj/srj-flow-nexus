# BRIEF — run value: batch more per run, spend runs heavily (2026-09-16, his question)

## Direct answer

No, the workflow is not yet at max per-run value — by council design, not by accident. Each run currently carries one cleared packet because keys quote exact scopes: one run = one grade = unambiguous blame if anything drifts. That discipline caught real defects (RECON23 void build, 10:05 table correction, seed-sampling correction). Keep it for BEHAVIOR changes, always.

But for print-only diagnostics the one-packet-per-run habit UNDERSPENDS the hour. The run is already paid (~50 min machine time, unattended); extra read-only recorders cost nothing extra. RECON37 (3 families) and RECON38 (2 components) already batch — push it further, every run.

## What cannot change (honest constraints)

- Run duration is FIXED. The frozen range (Aug-26 → Sep-09, same ini) is the identity basis of every comparison ever filed. Shortening the range voids the whole evidence chain. ~50 min is the price, permanently.
- The scarce resource is YOUR paste labor + council latency, not machine hours. A run costs you nothing while it ticks; each relay costs you a paste plus two council turns. Relay count dominates wall-clock, not run count.
- Wasted runs are already rare: one environmental timeout (RECON21, his host load), one builder wiring void (RECON23, owned). The rest delivered.

## Standing RIDER RULE (adopted this turn)

Every clearance relay henceforth carries (i) the primary diagnostic + (ii) ALL other open print-only questions fitting the same envelope (same ini/range, null-effect, zero deciding-line touch) as riders, each with its own pre-registered grade lines — unless council objects to a rider by name. One run, many answers. Behavior changes are NEVER riders: one run, one scope, no exceptions.

## What this changes concretely

- Packet-authorship asks now include "list every open print-only question this run could also settle" as a matter of routine.
- Pre-registered multi-outcome grades stay mandatory, so each rider settles rather than explores.
- Pre-run gates (STAGE-1, build gates, adherence, parity) stay — they are what keep every expensive hour gradeable.
