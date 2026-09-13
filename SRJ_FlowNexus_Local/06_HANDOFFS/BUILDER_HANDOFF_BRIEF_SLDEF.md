# HANDOFF BRIEF — SLDEF ladder, for the operator's mark-up (v3, corrected)

Read this before marking up. Short sentences. Every number below is
measured on the frozen run (RECON15b, full window Aug-26–Sep-10, below).
Each claim names its bar time and price. Frozen token names are used
throughout: rungSlot (entry-relative, gated), rungExt (extremity index),
shift (absolute ReadFlow slot). Your signal time comes first, then the S5
check bar (signal = S5 bar + 5 minutes, stated once here).

## Headline (corrected): the count is over extremity, and it is ext 1

Your stops against the extremity index, one row each:

- Signal 10:05 / S5 10:00 SHORT: your 1.16508 = ext 1, rungSlot 41,
  06:30 bar, R 2.43. (Agreement with the code's stop; no divergent hand
  figure on record — marked inferred, see provenance below.)
- Signal 16:00 / S5 15:55 LONG: your 1.15847 = ext 1, rungSlot 4,
  15:30 bar, R 1.66. (Hand, divergent from the code's 1.15907.)
- Signal 09:20 / S5 09:15 LONG: your 1.16098 = ext 1, rungSlot 6,
  08:40 bar, R 1.76. (Hand, 3/3 exact with the code.)
- Signal 16:45 / S5 16:40 LONG: your 1.16239 = ext-1 cluster, rungSlot 4,
  16:15 bar, R 2.45. (Hand; your label, price and R agree on one rung.)

Two of these rows discriminate (Sep-4 and Sep-7 PM, where the code puts
today elsewhere and ext 1 still lands on your number). Two are consistent
(the code's today is already ext 1 there). Leading candidate, not a
ruling. Position-counting is dead: your levels sit at rungSlots 41 / 4 /
6 / 4 with no common count, and today's ref sits at 407 on one row.

SCOPE NOTE (unchanged): the flip-and-pass counter reads 0 — SCOPE
UNRESOLVED, narrow question only. Do NOT read it as reassurance; the
Sep-4 section shows a pass against an opposed bias.

## What you mark up (scope changed)

Keep the full 113-step table (`BUILDER_MARKUP_TABLE_SLDEF.md`) as the
appendix. But a blanket mark-up is no longer the ask. The ask is:

1. Confirm four levels verbatim (the table above): 1.16508, 1.15847,
   1.16098, 1.16239 — yes/no each, by bar time and price.
2. Rule on ext 1 as the count: does "exactly two swings away, skip
   nearest, more-extreme-wins" describe your rule on all four?
3. Sep-4 is the one row where marking your swings still buys something:
   your structure and ours disagree by a full trading day there (your
   15:30 bar versus our Sep-3 05:55 bar). Mark that row fully.

## The two-away test table (the candidate, both indices)

Schema (declared = emitted): step / rungSlot / rungExt / barTime / px / R.

- Signal 10:05: by position 0/1/2: (0/0/09:55/1.16491/4.08),
  (2/−1/09:45/1.16481/6.80), (4/−1/09:35/1.16482/6.38). By extremity:
  ext0 = step 0; ext1 = step 4 (rungSlot 41, 06:30, 1.16508, 2.43);
  ext2 = step 6 (rungSlot 47, 06:00, 1.16513, 2.17). Ext 0 refuted here
  (1.16491 ≠ your 1.16508); ext 2 refuted here (1.16513).
- Signal 16:00: by position: (1/0/15:45/1.15902/2.45),
  (4/1/15:30/1.15847/1.66), (309/−1/Sep-3 14:05/1.16017/DEGENERATE, see
  rule below). By extremity: ext0 = step 0; ext1 = step 1;
  ext2 = step 23 (rungSlot 442, Sep-3 03:00, 1.15835, 1.55).
- Signal 09:20: by position: (0/0/09:10/1.16102/1.97),
  (2/−1/09:00/1.16103/2.03), (6/1/08:40/1.16098/1.76). By extremity:
  ext0 = step 0; ext1 = step 2; ext2 = step 3 (rungSlot 10, 08:20,
  1.16088, 1.38).
- Signal 16:45: by position: (1/0/16:30/1.16240/2.56),
  (4/−1/16:15/1.16239/2.45), (6/1/16:05/1.16238/2.34). By extremity:
  ext0 = step 0; ext1 = step 2; ext2 = step 4 (rungSlot 16, 15:15,
  1.16209, 1.03).

DEGENERATE_R rule: steps within ~2 points of entry show outsized R —
read those as DEGENERATE_R, never as opportunity. Marked rows: Sep-4
steps 2 (284.00), 5 (47.33), 8 (284.00); Sep-7 AM steps 13/14 (13.00),
20/27 (16.25).

## Provenance (governance fix — read this before the pair question)

Both previously filed "operator levels" were code-derived: 1.15907 is
today's reference (the code's number, R 2.56); 1.16240 is the code's
fractal-nuance rung (your hand figure is 1.16239 at R 2.45, and a rung
prints exactly that at 16:15). Residual-0 matches against our own output
confirm ladder-versus-walk correspondence — worth having — and nothing
about your structure. Going forward every filed level carries HAND or
CODE, and CODE values may not be filed as operator levels.

- 1.15847: HAND (your 15:30 swing low, 60 points wider than the code).
- 1.15907: CODE (today's reference Sep-4).
- 1.16239: HAND (your 16:15 low, status-bar confirmed).
- 1.16240: CODE (anchor / fractal-nuance).
- 1.16508 Aug-28: INFERRED agreement (no divergent hand figure on
  record; entry, stop and target all ticked against the code).

## Your Sep-4 pair, reshaped (two rungs, which is yours)

- 1.15907: step 16, rungSlot 407, ext −1, shift 408, Sep-3 05:55, R 2.56.
- 1.15847: step 1, rungSlot 4, ext 1, shift 5, Sep-4 15:30, R 1.66,
  residual 0 (it prints its own price — it IS a rung).
- Filing still required: the unfiled level is not in the match block and
  carries no gated residual. The pair is not closed until you file.

## Why slot identity is mandatory (one line)

1.15907 prints at rungSlots 407 AND 537; 1.16098 at 6 AND 13; 1.16218 at
20 AND 29. Price matching alone would pick wrong. Slot decides.

## The ghost (settled, kept for the record)

1.16112 = step 19, rungSlot 77, ext 6, shift 78, morning Sep-7 10:10 bar,
imbalance present, body 1.16126, bracketed 1.16141 / 1.16102. Step number
reported, never load-bearing.

## The retraction price (Sep-7 16:45 row, all five stops)

Signal 16:45 / S5 16:40 LONG, entry 1.16261, target 1.16315:

- today 1.16218, R 1.25 — SURVIVES.
- base 1.16112, R 0.36 — dies. nuance 1.16112, R 0.36 — dies.
  fractal 1.16112, R 0.36 — dies.
- fractal-nuance 1.16240, R 2.56 — SURVIVES. Your level lives ONLY here,
  under a fired carve-out.
- Correction stands: today is 1.16218, NOT 1.16112. The signal fires
  today because today survives at 1.25.

Second carve row: signal 09:20 / S5 09:15. Fractal-nuance 1.16102,
R 1.97, distinct from base 1.16074, R 1.07. Carve counts scoped across
all ten rows: order-block side 0 labelled (3 fires hide under relation
labels — counted off-log, mechanism fact), fractal side 3 labelled
(Aug-26 14:40, Sep-7 09:15, Sep-7 16:40).

## Survival table (per firing row, per stop, against 1.00)

- Signal 10:05 (Aug-28 SHORT, entry 1.16466, target 1.16364, reward 102
  pts exact): today 2.43 S; base/nuance/fractal/fractal-nuance 2.17 S.
  All survive. R = 102 / |risk|, printed %.2f.
- Signal 16:00 (Sep-4 LONG, entry 1.16018, target 1.16302, reward 284
  pts): today 2.56 S; base 1.53 S; nuance/fractal/fractal-nuance 2.56 S.
  All survive.
- Signal 09:20 (Sep-7 LONG, entry 1.16135, target 1.16200, reward 65
  pts): today 1.76 S; base 1.07 S — BY SEVEN HUNDREDTHS, thinnest margin
  on the sheet; nuance 1.76 S; fractal 1.07 S; fractal-nuance 1.97 S.
  All survive.
- Signal 16:45 (Sep-7 LONG, entry 1.16261, target 1.16315, reward ≈53.8
  inferred): today 1.25 S; base/nuance/fractal 0.36 die; fractal-nuance
  2.56 S. Dies under conservative, lives under fractal-only.

REWARD PRECISION (read before recomputing by hand): R = |target − entry|
/ |entry − price|, full-precision doubles, printed %.2f. Your 5-decimal
arithmetic diverges at the pip on tight risks: 54/21 = 2.57 by hand
versus 2.45 in the code on the 16:30 rung, because 21 is the ROUNDED
risk — the code divides unrounded doubles (reward brackets to
[53.79, 53.87) across the rung-0/rung-1 pair, hence ≈53.8, not 54).
Trust the code column; this paragraph is why.

## The two zero-step rows (slot first, as ruled)

- Sep-4 10:35 SHORT: extreme refSlot 168, slot time Sep-3 20:35,
  1.16379, walk steps 0. Confirmed Sep-4.
- Sep-8 16:40 SHORT: extreme refSlot 817, slot time Sep-3 20:35,
  1.16379, walk steps 0.
- Same price, same slot-time bar: ONE persisting historical extreme in
  two shift frames (649 bars of test progress between the two checks;
  slot time is the cross-row key). Labelled as such, not a coincidence.
- The refutation stands either way: a zero-step extreme carries no rung
  obligation, so no count reproduces it.
- Corroboration, one line: morning SHORT and 15:55 LONG on Sep-4, with
  the trend-leg flip landing at 15:55 (anti-2 both sides) — two
  instruments agreeing on the reversal from opposite directions.

## Label table (blocking before adoption as selection)

- −15 (16:15 / 16:30): NO discrepancy. Your label, price and R all
  resolve to the 16:15 rung at 1.16239. The earlier 16:30 resolution was
  an artifact of matching a code-derived filed level — struck.
- +20 (14:55 / 15:15): label-versus-price conflict, price governs. The
  15:15 rung is 1.16209; your quoted 1.16218 pins the 14:55 rung. Open.
- −10 (16:05 / 16:15): 1-point absorption cluster (1.16238 / 1.16239 on
  adjacent bars), not a frame error. Open.
- Neither open pair is a constant offset. Both stay blocking.

## N1 equality (measured, your ruling, not a code change)

- POI body break: 28 survived, 0 invalidated. Confirmed.
- POC: 3 survived, 0 invalidated. Confirmed.
- POI wick: 10 survived, 16 invalidated. CONTRADICTED — your ruling owed.
- VWAP: 0 and 0. Unexercised, not verified.
- Exit-body: 0 and 0. Unexercised, not verified.

## The Sep-4 concentration (restated with operands)

- The 15:55 gate passed with the bias already opposed: bias stamp before
  gate stamp, anti-2 legs at the gate, outcome PASS. The record died on
  its own opening bar (held zero bars, flip exit at 16:00).
- Your 23:55 flat sits against a record that never held a bar (the run's
  day-flat count is 0 with operands). Provisional, not frozen.
- Your read opens each item above; the operands close it.

## Your four asks (in order)

1. Confirm four levels verbatim (table at top): yes/no each, by bar
   time and price. Then file 1.15847 or strike it.
2. Rule on ext 1 as the count. Then mark Sep-4 fully (the one row where
   marking still buys something).
3. Rule the wick contradiction (10 lived, 16 died).
4. Read the 23:55 flat against the never-held record.

## For the record (appendix, not needed for mark-up)

- Frozen baseline: EA 1EE6FC62 (383844 B), indicator 3606BFB4 unchanged.
  Run archive 1BB162E5, 17598 lines, bounds [44769..62366].
- Sep-4 afternoon gap closed: window 574, deepest step 571, base slot 524
  matched at residual 0.
- Full evidence: `BUILDER_RESULT_RECON15b-SLDEF4.md`,
  `BUILDER_FINDING_RECON15b-OFFLOG.md` (same folder).

# ADDENDUM (council-ordered — brief v3 above unchanged, read this too)

1. Candidate correction: three exact, one absorbed. Your 16:15 / 1.16239
   is ext −1 (rungSlot 4); the ext-1 rung is 16:05 / 1.16238 — one point
   apart, inside the codebase's own structural-distinctness limit. Price
   reproduced within the limit, bar differs. The −10 label pair dissolves
   into the same cluster and is WITHDRAWN as an open pair. One pair left
   blocking: +20 (14:55 / 15:15, your 1.16218 pins 14:55).
2. Adoption cost, both directions. Under ext 1 your four signals live: R
   2.43 (Aug-28) / 1.66 (Sep-4) / 1.76 (Sep-7 AM) / 2.34 (Sep-7 PM). The
   other direction: exactly ONE new signal appears — Sep-4 10:35 SHORT
   (morning, opposite direction from your afternoon LONG): killed today
   only on "not worth 1R" (RR_FAIL, nothing else), ext-1 rung 1.16299 at
   R 1.21, today's stop 1.16379 at R 0.36 off the ladder. You choose
   between a definition that saves Sep-7 evening AND adds Sep-4 morning —
   not one that only saves.
3. Carve counts corrected. Order-block side: 3 fires (Aug-26, Sep-4
   09:25, Sep-4 15:55 — one on the disputed Sep-4 row). Fractal side: 3
   fires (Aug-26, Sep-7 09:15, Sep-7 16:40). Overlap Aug-26 only. Six
   instances, counted off 481 both directions exact. The earlier "none on
   the order-block side" is retracted visibly here, not just in our log.
4. Flip-pass re-scoped: UNRESOLVED → NARROW. The flag asks "newly opposed
   at this bar" (now≥2 AND previous<2, read at the S5 bar); the exit side
   asks "opposed" (level only). At 15:55 the level was opposed and the
   opposition was not new — both readings correct, no disagreement. The
   Sep-4 entry finding (passed with bias opposed, died opening bar)
   stands on state, unchanged.
Confirmations (unchanged): Aug-28 1.16508; Sep-4 1.15847 vs 1.15907;
Sep-7 AM 1.16098; Sep-7 PM 1.16239 with the 16:05/16:15 absorption named.
