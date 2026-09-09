# BUILDER FINDING — EXIT-POCVWAP: the POC/VWAP early-exit rule (operator ruling; not in spec v4.2)
Report: C:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\SRJ_FlowNexus_Local\06_HANDOFFS\BUILDER_FINDING_EXIT-POCVWAP.md
Date: 2026-09-09. ZERO source changes (the §5 exit model is unbuilt — charter STEP 4).
This file records the operator's discretionary rule verbatim for the STEP-4 build.

## 1. THE OPERATOR'S WORDS (verbatim, 2026-09-09)
"another discretionary rule that i think is not stated on the v4.2 specification is that,
AVP or POC is slightly higher than VWAP. please emphasize the word slightly because it only
matter when the early exit scenario, early exit in the sense of upon entry the VWAP is below
the price (bullish bias for long setup) but when price retraced below or cross below with a
candle close that flip the bias of the VWAP, i do not close the trade or exit early because
my entry was based from POC. But this does not apply to POC early exit when it gap jumped and
then flip the bias below the POC, breaking the POC level to flip the bias."

## 2. THE RULE AS RECORDED (structural reading; no numbers added — §0 law respected)
- GEOMETRY: within a family, the AVP/POC line sits SLIGHTLY HIGHER than the VWAP line.
  The offset is insignificant EXCEPT in the early-exit scenario (the operator's own
  emphasis on "slightly").
- THE EARLY-EXIT TEST BINDS TO THE ENTRY-ANCHOR POI: for a LONG entered FROM the POC
  (AVP-POC), a candle close that crosses below / flips the VWAP (which sits slightly
  below the POC, also behind the trade) is NOT an exit — the trade holds.
- THE POC ITSELF still governs its own early exit: if the POC gap-jumps/relocates and
  price then breaks below the POC level with a body close (flipping the bias relative
  to the POC), the early exit APPLIES — the 8/17 shape (see BUILDER_FINDING_EXIT-0817.md
  and spec §5.2: "POC below a LONG relocates upward... THAT IS 8/17").

## 3. WHAT THIS REFINES
Spec §5.1's "POI behind the trade → exit only on a body close through it" is NARROWED by
the operator's practice: the body-close exit triggers on the ENTRY-ANCHOR POI (here the
POC), not on every POI behind the trade — the VWAP sibling slightly below the anchor does
not inherit the exit test. This matters precisely because the offset is "slight": a VWAP
flip can print WITHOUT a POC break, and that VWAP flip alone must not exit a POC-anchored
trade.

## 4. OPEN FOR THE STEP-4 BUILD (operator to confirm when §5 is built — no invention now)
(a) Does the binding generalize — the exit test follows the ENTRY-ANCHOR LINE only — or
    is it specifically a POC-vs-VWAP pairing rule?
(b) The mirror case for SHORTS (the operator stated the long side).
(c) The TP-vs-exit asymmetry: ComputeNearestTpTarget admits the anchor's family-pair
    sibling as a TP CANDIDATE (EA L1640) — a line can be a TP target and still not an
    early-exit trigger. Confirm.
No build is authorized or performed by this record. Build slot: charter STEP 4.