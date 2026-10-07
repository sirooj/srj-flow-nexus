# BUILDER SLICE B-61 - raws behind S1, C hunks, T tables (EA 5BFBF504 attempt, restored D00F93BB; RECON62-B61 AA728CC7)

## S1 raws
- Ledger 1066 (2026-10-01): "1066. HIS 5M-FLIP WORD + V26/V376 FOLD 2026-10-01 (his answer: any 5m-structure-bias flip kills the potential pre-confirmation; ...)" (paraphrase record).
- Skill s8:116 verbatim: "it must kill the trade if the 5m structure bias has flipped" (his words 2026-10-01).
- Findings/journal/register 5M-FLIP-KILL: 0 hits each.
- ORIGIN = HIS_VERBATIM (skill s8:116).
- S2 append (under Ruling 2026-10-07, s8:116 untouched): the exact PLANNER RULING B-61 sentence as relayed. Grep-before count 0. Same line into ledger item 1204.

## C full diff vs .preB61 (EA only, +59/-7; includes/indicator byte-identical)
Hunks: (1) global `datetime g_b61RetestTime = 0;` after g_confirmFromState; (2) ResetSequence clear `g_b61RetestTime = 0;`; (3) IsConfirmationCandle trailing param `const int retestShift = -1`; (4) C term retest-OR-prior exact touch + uj60_cSrc; (5) B60C print with rt/rSh/rBar/cSrc; (6) seed stamp `g_b61RetestTime = barTime;`; (7) reseed block at UJDEFERAPPLY (DetectPoiRetest + B60POT + S1 seed writes incl. time stamp); (8-10) three call sites compute `iBarShift(_Symbol, PERIOD_CURRENT, g_b61RetestTime, true)` and pass (CARRY, PREBIND, S4->S5). Contender/census/carve unchanged.
Compile: `Result: 0 errors, 0 warnings` (attempt ex5 B40FE1FF). Restore compile: `Result: 0 errors, 0 warnings` (ex5 9A522F05 from D00F93BB).

## C-site raws (disk D00F93BB numbering)
- ResetSequence EA:6614-6641 (clear inserted at :6637 area).
- IsConfirmationCandle EA:2337-2391 (C term EA:2388-2389).
- Seed stamp EA:8219 area (`g_anchorBarTime = barTime;`).
- UJDEFERAPPLY EA:8546-8559. S2 gate EA:8487-8511 (identical). GoAbort EA:6660-6694 (ResetSequence :6693). DetectPoiRetest EA:2076-2145.

## T tables raw (RECON62-B61, 67094 lines, AA728CC7, DONE PASSED 10:20:50, bal 10484.57)
Extra: deal #2 sell 8/27 17:05:00 1.16524 / #3 buy 17:15:02 1.16517 (register C 8/27-NY INVALID).
j61:11563 UJ1R 17:00 POLL entry=1.16524 sl=1.16652 tp=1.16322 R=1.58 PASS; j61:11672 UJ1R 17:00 (17:05 pass) same-shape; j61:11681 S1->S2->S3; j61:11697 B60C bar=17:00 Weekly-VWAP rt=16:25 rSh=8 rBar=16:25 cSrc=RETEST; j61:11700 CONFIRM_PREBIND 17:00 Weekly-VWAP; j61:11916 A6FIRED 17:00 SHORT tp=1.16322 r=2.73 sl=1.16598; j61:11919 UJ1R FIRE R=2.73 PASS; j61:11933 S5->SIGNAL.
Kept takes: deals #4-#17 = j28 deals #2-#15 identical time/side/entry/exit (tickets +2; 9/8 vol 1.96 vs 1.95 sizing drift). FIRED 8, HOLD 0.
Caused by: C2 (retest-candle touch confirmed where prior-candle C refused). Not C1 (normal-path seed) nor C3 (touch was exact).

(End of slice)
