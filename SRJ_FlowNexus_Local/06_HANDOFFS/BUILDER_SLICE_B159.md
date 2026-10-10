# BUILDER SLICE B-159 - K0/K1, three diffs, filed tables, G1-G7 rows (all sets restored)

Runs (EA 1617DC1A, Tester/logs/20261010.log): E0 EU PRE3140722 PASSED 20:07:01 / UJ PRE3553387 PASSED 20:16:27; E1 EU PRE3973311 PASSED 20:23:57 / UJ PRE4388795 PASSED 20:33:52; E2 EU PRE4817237 PASSED 20:50:54 / UJ PRE5260754 PASSED 20:58:57. Compiles (indicator only): E0/E1/E2 0 errors + 1 pre-existing code-43 warning. Src SHAs: E0 DBB0F656 / E1-OB 8BBF936B / E2-OB BE46A4DB.

## K0 quotes (disk lines)

- OB-LEVEL-HIS skill L230-233 (2026-10-10, governs): level not always 0.5; extreme closes move it. Amends XOBSUIT-1 s6a1 ("beyond the midline").
- d96fd5f authorization: ledger only B-147 record (line 7040); MIDLINE-1 L22-26: operator's pure-midline rule, charter-9 divergence noted (his words then ordered midline). Charter never overrules him.
- Spec 1.1 L47 (LTF bias from OB invalidation counts); 5M-FLIP-KILL s8 L116 ("it must kill the trade if the 5m structure bias has flipped"); TRIGGER s14 L154 (double invalidations 07:35+09:00); 0605LDN-FLIPS s15 L160 (one flip 8:10, next valid 9:50); ENGINE-REFINE s5 L92-93; FIX-NOT-REPLACE s5 L93; scope note L173 ("i do not want my ruling to alter the behaviour of the EA.") scopes that ruling only. No word forbids non-midline lines: proceed.

## K1 spots (located by text)

- Level OrderblockMgr:33-40 (`mid=(obHigh+obLow)/2`, charter-9 comment, `invLevel=mid`); NewOrderblock :62-70; bearish call :256-259 (obOpen param, `close[]`+srjC in scope :253); bullish call :361-364 (srjC :358); BiasEngine :157-165/:214-250/:264-299; export block :1486 (`if(barClosed)`) :1549-1557 (target writes + B152PR print). EA has no OrderblockMgr in closure (includes TickCore/Trade/HandFixture only): indicator-only compiles.

## Diffs vs .preB159 (raw)

- E0 (+9/-0): B159FLIP PrintFormat block after the B152PR print (bar, bias, is2x, bullThis/bearThis, bullCnt/bearCnt; read-only).
- E1 (+2/-3): `-Operator rule (charter 9)... / -double invLevel = mid;` → `+// [B159E1] record old line (parent 9861414 :39)... / +double invLevel = isBull ? MathMin(mid,obOpen) : MathMax(mid,obOpen);`
- E2 (+5/-5): signature `+double obClose` param; level `isBull ? MathMin(mid,obClose) : MathMax(mid,obClose)`; both calls `+srjC(close,i,i - bestBar)` (mirrors kept srjO idiom).

## Filed tables (FIRE bar/dir + MTEXIT entry->exit; E0/E1 vs DEALS-B157; E2 diffs)

- E0 EU 14 rows SAME (7 fires 8/28 10:00S, 9/1 17:30L, 9/4 15:55L, 9/7 09:15L, 9/7 16:40L, 9/8 10:05S, 9/8 16:55S + 7 exits incl. 11:35 1.16464, 17:50 1.15987, DAY_CLOSE 1.16129). E0 UJ 8 rows SAME (fires 5/27, 6/03, 6/05, 6/11 + TP exits; 4 June absent).
- E1 EU 14 + UJ 8 SAME (multiset 0-diffs on FIRE/MTEXIT/B157SL/B152PR rows; REF timestamp-class only).
- E2 EU 12 rows: A1 FIRE+EXIT ABSENT; A5 FIRE sl 1.16238 1SWING r2.34 (kept 1.16239/2SWING/2.45), exit SAME 17:10 TP 1.16315; other 6+6 SAME. E2 June 8 rows: fires 6/02 15:30L 159.771->159.900, 6/03 09:05L (C-06-03 SAME), 6/09 09:45S 160.137->160.152, 6/11 16:00L 160.545->160.507; B2/B3/5-27 ABSENT.
- Volumes: no journal print; identical deposit/stops/balance path → identical by sizer determinism (B137 rule).

## G1-G7 rows

- G1: E0 14+8 SAME; E1 14+8 SAME; E2 12 EU + 8-position June DIFFERENT (above).
- G2: E1 register SAME; 4 June refused PROMO_RETURN_NONE (E1 June 4722534 ABORT + 4722535 A6REFUSED + 4722536 STAND-DOWN; kept same); silents silent; no new fire. E2: A1/B2/B3/C-05-27 absent; C-06-03/A2-A7 SAME; 4 June still refused (E2 June 5607199-201 same triple); new fires 6/02 (ruled-out 0602 date), 6/09 (none), 6/11-16:00 (not B3).
- A1 death (E2 EU 5130032 SIDE1T_SEEDBIAS 09:55 biasAligned=0 REJECT-BIAS-TIMING; 5130101 UJDEFERABORT LTF-opposed; 5130206 ABORT LTF_MISALIGN 10:05 + 5130207 A6REFUSED).
- G3 (range 1.16230-1.16256 + promo 09:40, never number): E1 z1 3293 cb09:45 @10:00 + @16:50, ZONEPICK 1.16230-1.16256 inPlay=1 @10:00/10:05/16:30/16:50: MET. E2 same four rows: MET. E0: absent (kept).
- G4 verdicts (E0/E1/E2 = B-153 R1 12/12): EU A1-A7 bear/bull 1; June C-05-27/C-06-03/B2/B3 bull 1, C-06-04 bear 0. C-06-04 S z1: E1 EMPTY + E2 EMPTY (boundary ids none alive+touched on run rows).
- G5: E0/E1 B157SL 18+11 SAME (A5 1.16239 R2.45; H3 1.16359 R0.68 refused). E2 EU 14 (A5 KEPT_PATH 1.16238 R2.34 2x=0; A1 + 3 rows absent); E2 June 10 (B2/B3/C-05-27 TWO absent).
- G6 cascade (full tables census): E1 EU 341/126215 (26 bias: latest 9/04 10:40/10:45; 62 2x; 253 counts); E1 UJ 269/108057 (49 bias, all ≤6/11 12:20, listed: 5/11×3, 5/12×3, 5/13, 5/14×15, 5/20×3, 5/22×4, 5/26×4, 5/29×3, 6/01, 6/04×2, 6/05×2, 6/10×5, 6/11×2); register + his-words bars ALL SAME both windows (8:10 bearish 2x=1; 9:50 bearish; 16:00 bearish; 16:05 bullish; 1-Sep 10:00 bullish). E2 EU 3298/126215 (644 bias; A1 09:55/10:00 bearish->bullish; 9/01 10:00 bullish->bearish DIFFERENT from his words; A5 16:40 2x 1->0; A6/A7 bias SAME). E2 UJ 3518/108057 (713 bias; 8:10 + 9:50 + 16:00 bearish->bullish DIFFERENT; B2/B3/C-05-27 bullish->bearish; C-06-03/C-06-04 bias SAME).
- E1 EU bias flips (26, all): 8/21 06:20 R->B? no: 06:20 bearish->bullish, 21:55 bullish->bearish, 23:45+23:50 bearish->bullish; 8/24 11:35 bullish->bearish; 8/25 19:00 bearish->bullish; 8/27 15:30 bearish->bullish; 9/01 07:25-07:55 bearish->bullish (×7), 20:20 bullish->bearish; 9/03 03:40+03:45 bearish->bullish, 20:45 bearish->bullish; 9/04 04:30-04:50 bearish->bullish (×5), 05:15 + 10:40 + 10:45 bullish->bearish.
- G7 kills: E1 3293 present 16:50 / absent 17:25+ (17:25 reproduced); 1866 present A6/A7; 2054 absent A1 bar; 2693/2740 absent A3 bar; 2798 absent C-06-03 bar. E2 3293 same 17:25 rows; 1866/2054/2693/2740 present (HIS-alive); 2798 absent C-06-03 bar: DIFFERENT from B-158 offline touch (promo/touch cascade), C-06-03 still MET via 2930.

## K5 restore (verified SHAs)

- OrderblockMgr 5D14FCE2; BiasEngine 3B1D9D3D; HTFEngine D5FD5B06; indicator src 1009A4EF + ex5 A5EB81B6; EA 1617DC1A + ex5 187A7202; terminal.ini 95A00C40 (June as-run); Charts 0 diffs (6 files restored + 6 created removed); no terminal64.

## Decisions

- OLD MET on G1+G2+G3+G4+G5 (moves no trade; fires nothing new; cascade never touches a register or his-words bar). Next relay keeps OLD only.
- HIS NOT MET (loses A1/A5-branch/B2/B3/C-05-27; fires ruled-out 6/02 + 2 more; breaks his 8:10/9:50/16:00/1-Sep reads). Dropped.

(End of slice)
