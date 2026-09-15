# FINDING — direction-writer inventory (on-disk, read-only, current digest)

** digest:** EA `E68E0AE3…` (10550 lines). Method: two differently-formed whole-file patterns (equality-vs-assignment disambiguation per the zero-count rule) + body reads. Second pattern corroborates the first; the one apparent miss (ResetSequence) resolved to a stale line number — the write sits at EA:6160 inside `ResetSequence` (EA:6157–6184), confirmed by direct read.

## Writers of `g_dir` — complete set (3)

1. EA:956 — declaration init (`= DIR_NONE`, once, load-time).
2. EA:6160 — `ResetSequence` (`= DIR_NONE`; runs on aborts + post-signal; also clears anchor/barTime/latch).
3. EA:7529 — seed vote (`= S2ResolveLive(pr.isLong ? DIR_LONG : DIR_SHORT)`; `ST_IDLE` block EA:7503+, producer `DetectPoiRetest` EA:1889). THE ONLY direction-setting write in the tree.

## Consequences (measurements only)

- **chain-98 (London vote):** single direction-setting path (7529) + reset path (6160). Single-owner assertion PROVABLE at build time by re-running this inventory.
- **chain-105 (NY AM vote):** same single write point — every LONG seed in any run passes through EA:7529. What stays unobserved is the PRODUCER INPUT (`pr.isLong`) at the ~16:45 seed instant, not the write path. The gap is scoped exactly there.
- Readers (comparisons, args, prints, struct copies at 90+ sites) never vote — verified by the assignment-vs-equality disambiguation, not by inspection sampling.
- Recorder blocks (SIDE1P2_/SIDE1P3_) contain zero `g_dir` writes (own-array stores only) — re-verified in this inventory's pass.

(End — measured 2026-09-15; feeds Track-1/Track-2 build gates + the single-owner assertions)
