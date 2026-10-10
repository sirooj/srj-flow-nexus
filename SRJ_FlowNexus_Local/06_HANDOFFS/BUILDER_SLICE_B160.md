# BUILDER SLICE B-160 - K0/K1, K2 diff, filed tables, G rows (B160K kept)

Trial tag B160K (= B-159 E1 hunk). Runs: RECON62-B160 (EA 1617DC1A, 20261010.log PRE5710641 PASSED 21:34:42) + JUNE0525-B160 (PRE5999910 PASSED 21:44:08). Indicator compile 0 errors + 1 pre-existing code-43 warning; src 1009A4EF unchanged; ex5 0CADACC66CD6EEF47B78CDDE245447AAB7172BBF8EAC9480B56791EDA1AEC050 fresh.

## K0 quotes (disk lines)

- OB-LEVEL-HIS skill L230-233 (2026-10-10, governs): level not always 0.5; extreme closes move it. Earlier: MIDLINE-1 L22-26 (operator pure-midline rule, charter-9 divergence) + XOBSUIT-1 s6a1 ("beyond the midline"). Charter-9 comment OrderblockMgr:38: council text, never overrules.
- Spec 1.1 L47 (bias from OB invalidation counts); CONTEXT L190 B159-SHARED-IS-HIS-OBJECT; B-159 G6 register+his-words SAME (SLICE_B159 L36). No forbidding word: proceed.

## K1 spots (located by text, live file = .preB160)

- OrderblockMgr:33-35 signature (`double obOpen` param, no close); :37 `double mid = (obHigh + obLow) / 2.0;`; :38-39 charter-9 comment; :40 `double invLevel = mid;`; NewOrderblock :62-70.

## K2 raw diff (.preB160 -> live = .B159E1, -3/+2)

- `-   // Operator rule (charter 9): the invalidation level IS the pure midline; the kill`
- `-   // is a body close beyond it (bullish OB: close below; bearish OB: close above).`
- `-   double invLevel = mid;`
- `+   // [B159E1] record old line (parent 9861414 :39; always restored): bearish = higher of mid and formation open.`
- `+   double invLevel = isBull ? MathMin(mid,obOpen) : MathMax(mid,obOpen);`
- Live SHA 8BBF936B = .B159E1 SHA. Minus-check: only the two comment lines + level line removed.

## Filed tables (FIRE bar/dir + MTEXIT entry->exit; multiset 0-diffs vs DEALS-B157 packs)

- RECON62 14 rows SAME: fires 8/28 10:00S, 9/1 17:30L, 9/4 15:55L, 9/7 09:15L, 9/7 16:40L, 9/8 10:05S, 9/8 16:55S; exits 11:30 1.16464, 17:50 1.15987, DAY_CLOSE 1.16129, 10:50 1.16200, 17:10 1.16315, 10:40 1.16102, 17:30 SL 1.16274.
- JUNE 8 rows SAME: fires 5/27 15:35L, 6/03 09:10L, 6/05 16:15L, 6/11 14:40L; exits 20:08 159.535, 09:59 159.983, 19:16 160.298, 15:23 160.588; 4 June absent.
- Volumes: no journal print; identical deposit/stops/balance path → identical by sizer determinism (B137 rule).

## G rows (log file:line)

- G2 EU: B157SL 18/18 SAME (A1 1.16508 R2.43; A5 booked 1.16239 R2.45; A6 1.16258 R1.94; A7 1.16274 R1.96; H3 1.16359 R0.68 refused). C-09-04-1040 silent (5946242 10:40 touchAttr=1 evaluated; 5946277 10:45 CONFIRMPOLL confirm=0). No new fire.
- G2 June: B157SL 11/11 SAME (B2 159.598 R1.44; B3 160.501 R2.74). 4 June 09:55 ABORT + A6REFUSED PROMO_RETURN_NONE; 11:00 same pair. B1/2-June/10-June silent. No new fire.
- G3: ZONEPICK 10:00/10:05/16:30/16:50 SHORT xob=1.16230-1.16256 inPlay=1. z1 3293 promo 09:40 cb 09:45 @10:00 + @16:50 and every bar through 17:20; first absence 17:25.
- G4: EU 7× bull/bear 1 SAME. June C-05-27/C-06-03/B2/B3 bull 1, C-06-04 bear 0, S z1 EMPTY.
- T4 KEPT: B160K OB 8BBF936B + ex5 0CADACC6 on disk (EA untouched). No STOP.

(End of slice)
