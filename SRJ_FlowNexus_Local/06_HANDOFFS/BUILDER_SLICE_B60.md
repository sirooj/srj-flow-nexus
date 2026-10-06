# BUILDER SLICE B-60 - raws behind S1/S2, C hunks, T2/T4 (EA 23244BEC attempt, restored D00F93BB; j30 ED024B24; j31 AD254E6D)

## S1 banked text (skill end, after Ruling 2026-10-06)
New section "Ruling 2026-10-07 - 5m bearish bias flip invalidates formed setups, not a POI retest" with his two verbatim sentences (typos kept) + PARAPHRASE line + scope note carrying his clarification verbatim ("i do not want my ruling to alter the behaviour of the EA."). Grep-before count 0.

## S2 conflict raws
- s8:116 5M-FLIP-KILL: "any 5m-structure-bias flip kills the POTENTIAL (seed) pre-confirmation - event semantics, no tolerance."
- S1: "A POI line retest on the flip candle itself is not invalidated; it stays a potential and can go on once the 5m bias is back with the trade."
- s8:117 FLIP-KILLED-NEVER-VETOES agrees with S1 (no veto) - no conflict. Older text untouched. Verdict: CONFLICT (5M-FLIP-KILL only).

## C full diff vs .preB60 (EA, +47/-5; indicator untouched)
Hunks: (1) global `int g_b60RetestShift = -1;` after g_confirmFromState; (2) IsConfirmationCandle trailing param `const int retestShift = -1`; (3) C term retest-OR-prior exact touch + uj60_cSrc; (4) B60C print on true when retestShift>=0; (5) seed stamp `g_b60RetestShift = barShift;`; (6) reseed block at UJDEFERAPPLY (DetectPoiRetest + B60POT + S1 seed writes, replaces bare return); (7) three call sites pass `false, g_b60RetestShift` (CARRY, PREBIND, S4->S5). Contender/census/carve sites unchanged.
Compile: `Result: 0 errors, 0 warnings` (attempt ex5 4CD7CB49). Restore compile: `Result: 0 errors, 0 warnings` (ex5 B2D368C6 from D00F93BB).

## C-site raws (disk, pre-edit numbering)
- S2 gate EA:8487-8511 (CheckLtfAlign; S2SEEDBIAS_KILL EA:8503-8504; S2WAIT EA:8505-8506) - byte-identical (B1 path kept).
- F11 block EA:7467-7540 (B-57 OFF hunk intact); UJDEFERAPPLY EA:8546-8559 (reseed inserted).
- IsConfirmationCandle EA:2337-2391 (C term EA:2388-2389 replaced).
- GoAbort EA:6660-6694 (ResetSequence at :6693 - reseed writes come after, safe).
- DetectPoiRetest EA:2076-2145 (read-only + N1 census counters).

## T2 deal tables raw
j30 RECON62-B60 (71169 lines, ED024B24, DONE PASSED 06:45:14, 563338/3168, bal 10474.64): deals #2 sell 8/28 10:05 1.16466 / #3 buy 11:45:02 1.16440 / #4 buy 9/1 17:35:01 1.16024 / #5 sell 17:51:04 1.15975 / #6 buy 9/4 16:00 1.16019 / #7 sell 23:55 1.16129 / #8 buy 9/7 09:20 1.16138 / #9 sell 10:53:07 1.16201 / #10 buy 9/7 16:45 1.16264 / #11 sell 17:13:30 1.16315 / #12 sell 9/8 10:10 1.16205 / #13 buy 10:42:46 1.16102 / #14 sell 9/8 17:00 1.16220 / #15 buy 17:26:29 1.16275. FIRED 7, HOLD 0. Identical to j28 C1 table ticket/price/time.
j31 JUNE0525-B60 (76755 lines, AD254E6D, DONE PASSED 06:51:28, 740873/4320, bal 10348.31): deals #2 buy 5/27 15:35 159.344 / #3 sell 20:08:14 159.535 / #4 buy 6/03 09:10 159.932 / #5 sell 09:59:40 159.983 / #6 sell 6/04 09:55 159.868 / #7 buy 10:40:20 159.920 / #8 buy 6/11 14:40:22 160.530 / #9 sell 15:23:06 160.588. FIRED 4. MTEXIT 4 rows incl. B3 15:20 entry=160.524 exit=160.587. No 16:15 fire/deal. No 16:55 fire/deal. No B1 fire. No C-row fire.
UJBARMAP counts: j30/j31 rows present (j31: 4320-scale; 16:00 row j31 values identical to j29).

## T4 + B60 rows raw (j31)
- j31:39088 ABORT LTF_MISALIGN 16:05; j31:39090 STATE S3->ABORT; j31:39092 B60POT 16:00 Monthly-POC LONG ltf=-1.0; j31:39093 STATE ABORT->S1; j31:39111/39112 S1->S2->S3 16:10 pass; j31:39134 PREBIND_FAIL 16:05 B_BODY; j31:39315 PREBIND_FAIL 16:10 C_TOUCH; j31:39495 PREBIND_FAIL 16:15 A_OPP.
- B60C rows (sample): j31:63591/63597 B3 14:35 cSrc=BOTH; j31:6627 5/27 cSrc Daily-POC; j31:29485 C-3June 09:05 cSrc Daily-VWAP. Zero B60C on 6/05 16:10/16:15 (no confirm).
- B60POT rows: j31 6/01 x2, 6/02, 6/05 16:00, 6/09 x4, 6/10 (no fires followed except none) - reseed plants, gates decide.

## Build-recall search (his "already executed this trade")
- All *JOURNAL.log: zero 16:15 fills, zero 16:15 entries, zero 16:15 A6FIRED.
- Nearest: v26/RECON74 B2 "taken late" (16:55 T3 machine trade); B-38 j24 UJ1R R=3.73 PASS on entry 160.059 tp=160.723 (no seed, no fire).

(End of slice)
