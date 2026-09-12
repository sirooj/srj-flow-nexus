# BUILDER_RELAY_COUNCIL — P-SWINGIMB-3 verdict (REFINED 2026-09-12, supersedes the paused draft)

## Status change — read first

The paused draft is withdrawn. The operator has resolved both open items
by owning the error: his manual Sep-7 NYAM journal (R 1.25 on a 15:15-low
SL) was a MIS-INPUT. The structure leg truly carries no imbalance, so the
code's conservative OB+Swing answer — walk to 1.16112, R 0.36, signal dies
at the 1.0 latch gate — is CORRECT under that definition. P-SWINGIMB-3's
measurements stand as correct-under-conservative. Verdict UNPAUSED.

## The binary decision (operator's, council scopes implementation)

- Conservative OB+Swing (current code): Sep-7 NYAM dies (1.25 -> 0.36).
  Code stands as-is; imbalance line closes with an export.
- Fractal-only (operator's journal definition: triangle-marker swings,
  no OB in the stop): Sep-7 NYAM stop ~= 16:15 low 1.16239, R ~= 2.45,
  signal lives large. Requires a definition packet (reference
  redefinition). Builder notes the E8/E9/E10 walk machinery is
  definition-agnostic (exceeds filter, total mapping, SLIMBR bridge all
  operate on whatever reference they are handed); only the reference
  selection changes. The R table is recomputed on a fresh run, never
  carried over.
- Price agreed between operator and code (1.16218). Residual footnote,
  non-blocking: operator's bar label 15:15 vs builder's settled-slot math
  (ReadFlow shift 21 = 14:55 bar). Unresolved, does not move the decision.

## RECON10 measurements (unchanged, condensed)

EA 4B2FA10E (290162 B), FlowLogic 3606BFB4 unchanged, both 0/0 strict.
Test passed 1:08:58, 563338/3168. G2 all verbatim (CQD 906; WS161
fields=21 205/0; SLMEMO 471/118/589; SL_REF 432/39/10; INPLAY 157/46;
MTEXIT 4; aborts 18/37/13/11/2/0/12; PROMO 469; CONFIRMPOLL 555;
SUPPRESSED 156; four signals verbatim). G3 SLIMB 481, chosen 481/481.
G4 walk 481, UNRES/UNCLASS/sideV all 0. G5 cross-tab full, falsifier
cf1xBASEMOVED=0 (51 anchor-1 rows all ALL3_EQ). G6: 168 = 91 absorbed +
77 re-resolved + 0 terminated; pre-filter recount reproduced (375/106,
16/152/207). G7 SLIMBR 10/10 fresh; firing R: 2.43->2.17 / 2.56->1.53 /
1.76->1.07 / 1.25->0.36. G8 signatures identical. Committed local +
backup tag; origin pending as before.

## N1 (operator rule candidate)

A candle equal to the VWAP/POI value does not invalidate the trade.
Builder check: LONG retest = wick >=1pt through AND body (open..next-open)
at/above line minus EPS — equality passes, only a break kills (P-NEXTOPEN
design); Sep-7 fired and exited TP_TOUCH. Council: confirm no path
contradicts N1, or packetize.

## Requested

(1) ACCEPT P-SWINGIMB-3 as correct-under-conservative (or redirect with
operands). (2) Definition ruling: conservative-close vs fractal-only
packet (scope: reference selection only, or walk pool + chosen + R-cost
alike?). (3) N1 confirm-or-packetize. No canonical file touched since EA
4B2FA10E.
