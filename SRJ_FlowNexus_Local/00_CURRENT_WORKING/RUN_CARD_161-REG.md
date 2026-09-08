# RUN CARD — 161-REG / STEP 0 (two tester passes)
Operational card for the operator. Prepared by the builder 2026-09-08 from the STEP 0
packet and the frozen Tier-1 configuration (BUILDER_RESULT_155-REG.md STAGE 2).
Source stays untouched. InpDebugLog=true is set AS A TESTER INPUT ONLY (amendment granted).

## CONFIGURATION (replicates Tier 1's eleven items, windows changed per packet)
- Expert Advisor:  SRJ_FlowNexus_EA        Symbol: EURUSD        Period: M5
- Modeling:        Every tick based on real ticks
- Date:            custom period (see the two passes below)
- Deposit:         10 000 JPY              Leverage: 1:100
- Optimisation:    Disabled                Visual mode: OFF
- Inputs:          set InpDebugLog = true. EVERYTHING ELSE STAYS AT DEFAULT.
                   (InpMode=0 MODE_ALERT_ONLY is the default — no orders are sent.)
- If the tester notes inputs changed from the saved set: expected (InpDebugLog only).

## PASS 1 — window 2026.08.17
Strategy Tester (Ctrl+R) → set the configuration above → Date/period: From 2026.08.17
To 2026.08.17 → Start. Let it finish completely.

## PASS 2 — window 2026.08.19 – 2026.08.20
Same configuration, only the dates change: From 2026.08.19 To 2026.08.20 → Start.

## WHILE RUNNING / AFTER
- Do not enable visual mode. Do not touch the terminal mid-run. Let both passes finish.
- If a pass errors or the tester shows no "generating based on real ticks" line, stop
  and tell me the tester journal's last lines — do not retry.

## WHAT THE BUILDER DOES NEXT (no operator action)
1. Locate the tester journals under Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\Tester\
   (agent logs carry the EA's [SRJ-EA] print lines; the core log carries the KL/MG lines).
2. Copy both raw journals into 06_HANDOFFS as gitignored artifacts and verify the
   real-ticks line is present in each.
3. Tabulate the packet's nine diagnostics with absolute counts (LEGACYONLY, capHit,
   the cls 2x2 with reached2, ZONEPICK haveFvg/downgraded, S3INPLAY via distribution,
   ZONEADOPT, ZONEID promoT=unset, SLSRC branch split, SLSIDEGUARD, SLZONEGUARD).
4. Re-hash the EA and require byte-identity with abe5aaaf… .
5. Only after acceptance: create the git snapshot tagged for Task 161.

## ABORT CONDITIONS (from the packet — the builder checks these, not the operator)
Any compile warning; any digest drift; reached2=0 while capHit=1; working-set mismatch.
08:17's presence is RECORDED, never gated.
