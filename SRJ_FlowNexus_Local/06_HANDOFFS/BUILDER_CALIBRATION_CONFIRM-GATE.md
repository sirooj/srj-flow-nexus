# CALIBRATION MEMO — the confirmation-candle gate (build 2): the numbers + ONE question
Memo: c:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\SRJ_FlowNexus_Local\06_HANDOFFS\BUILDER_CALIBRATION_CONFIRM-GATE.md
Date: 2026-09-10. Basis: BUILDER_RESULT_RECON2-SHADOW.md + the authorized T162DUMP OHLC dump
(3,168 candles archived; the temp EA and its .ex5 DELETED after the run per the scope; the
main EA untouched at 12FB2EB0...FD7E). Plain language per the standing rule.

## WHAT THE SHADOW RUN PROVED (recap)
The spec §3.6 test discriminates 4 of 5: FIRES on your 9/7 09:15 candle (the EA's 09:20
entry = your ruled next-open, bar-for-bar), fires one bar before your 9/7 16:40 attribution
(naming convention), SILENT on 8/31, 9/1, 9/8. FAILS on the 9/2 fake (it passes the plain
letter). 8/28 confirmed: confirm=1 at the 10:00 candle -> the 10:05 open entry, R=1.13
latched — your killed trade returns at the correct bar.

## THE MEASURED CANDLES (the authorized dump; pairs = opposing candle -> confirmation candle)
Pair 1 GOOD — 9/7 09:10 -> 09:15, LONG, Weekly-POC (the line sits ~1.16103-1.16113):
  opposing 09:10: O 1.16118 / H 1.16126 / L 1.16105 / C 1.16116 — wick INTO the line,
    CLOSE 1.16116 = ABOVE the line (holds the setup side; body only 2 pts).
  confirmation 09:15: body 21 pts, range 30 -> body/range 0.70; close at 90% of the range
    (at the top).
Pair 2 GOOD — 9/7 16:35 -> 16:40, LONG, Weekly-POC (~1.16248-1.16249):
  opposing 16:35: O 1.16261 / H 1.16263 / L 1.16246 / C 1.16250 — wick into the line,
    CLOSE 1.16250 = 1 pt ABOVE the line (holds, barely).
  confirmation 16:40: body 11 pts, range 17 -> body/range 0.65; close at 65%.
Pair 3 GOOD — 8/28 09:55 -> 10:00, SHORT, Daily-VWAP (~1.1648):
  opposing 09:55: O 1.16473 / H 1.16491 / L 1.16459 / C 1.16482 — wick above the line,
    CLOSE 1.16482 = AT the line (within ~2 pts).
  confirmation 10:00: body 15 pts, range 24 -> body/range 0.63; close at 79% in direction.
Pair 4 FAKE — 9/2 15:45 -> 15:50, SHORT, Daily-VWAP (~1.15786-1.15789):
  opposing 15:45: O 1.15764 / H 1.15827 / L 1.15758 / C 1.15801 — **CLOSE = 12-15 pts
    THROUGH the line to the WRONG side.** Range 69 pts, body 37 pts — a violent candle
    that SLICED the line, not a pullback into it.
  confirmation 15:50: body 9 pts, range 24 -> body/range 0.375; close at 67% in direction.
Pairs 5-6 (8/31, 9/8) were already silent — no touch / no opposing candle.

## THE DISCRIMINATOR (measured, one rule kills the fake, keeps all three good pairs)
Body strength does NOT discriminate (your pairs: 0.63-0.70; the fake: 0.375 — but your 16:40
pair is 0.65 vs the fake 0.375: too close for comfort at the margin). Close-position does
NOT discriminate (0.65-0.90 overlap 0.67). THE CLEAN ONE:
**THE RETRACEMENT CANDLE MUST NOT CLOSE THROUGH THE ANCHOR LINE — it may only WICK into
it. Its CLOSE must stay on the setup side of the line.**
- The 9/2 fake's retracement candle closed 12-15 pts THROUGH the Daily VWAP to the wrong
  side — by your structure that candle BROKE the line; what followed was not a
  confirmation, it was chop after a break.
- All three of your real pairs hold the side (the tightest by 1 pt: the 9/7 16:35 candle).
This is the same body-side idea your EA already applies to the retest candle — applied to
the RETRACEMENT candle. It is spec-consistent (§3.6 governs the direction sequence; the
line-side of the retracement candle is the untouched part your screenshots show: wick in,
close back on your side).

## OPERATOR RULING (2026-09-10, verbatim): "yes, that is for the POI of VWAP and POC. confirmed"
- THE TERM IS RULED: the retracement (opposing) candle must NOT CLOSE through the anchor
  line — it may only WICK into it; its close stays on the setup side. APPLIES TO BOTH VWAP
  AND POC ANCHORS (all twelve lines).
- THE BAR-COUNTING CONVENTION CONFIRMED (the "confirmed" covers the naming): the
  confirmation candle = the candle that closes in the trade direction; the EA evaluates at
  its close; entry = the next open. The 9/7 16:40 attribution aligns (pair's second candle
  = 16:40, entry 16:45).
- BUILD 2 IS UNLOCKED.

## THE DIVERGENCE-TIMING FINDING (measured in the same data; changes build 2's design)
The 8/28 confirmation bar (10:00 close): the latest confirmed CQD verdict visible = **-1
(bearish), read 09:35** (bar 09:25) — DIRECTION-MATCHED for the operator's short. No newer
verdict existed until 10:15 (+1). THE OPERATOR'S cvd=2 EXISTED — on the impulse BEFORE the
retracement (divergences form on the impulse leg, before the pullback — the operator's own
sequence). THE EA MISSED IT BECAUSE its divergence walk is ANCHOR-BOUNDED: it only counts
verdicts AFTER the candidate's seed bar (10:00), so the 09:35 -1 is invisible to it. The
seed-bar bound is an EA implementation choice — the operator's ruled DIVCON standard says
only "the latest is the latest on the indicator" (no seed bound). BUILD 2's divergence term:
the LATEST confirmed verdict visible at the confirmation close must be direction-matched
(no seed-bar bound; an opposing latest = no confirmation that bar). 8/28 then fires at the
10:05 open with R=1.13 latched. The 08.18 false positive still dies (its R < 1.00 at ITS
confirmation bar under the ruled 1R check; its matched verdicts were post-seed anyway).

## THE BAR-COUNTING CONVENTION (confirm in the same answer)
"Your confirmation candle time = the candle that CLOSES in your direction; the EA evaluates
at its close and enters at the next open." With that, the 9/7 16:40 attribution aligns (the
pair's second candle = 16:40, entry 16:45) — no code difference, naming only.
