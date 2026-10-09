# BUILDER SLICE B-141 - raw rows behind R1 to R5 (MEASURED)

Scope: reads + greps + row extraction from committed packs and the named log ranges only. No edit/compile/run/launch. 4JUN/SILENT6/XOB/HTF never reopened.

## START GATE (raw)

- `git ls-remote backup builder/B-140` = `f49b1cbca44dac7d10ec87a97e4d5127e11bda4a` (cut builder/B-141 here; no remote B-141 before push).
- `git log -1` = `f49b1cb B-140 exit basis: every kept exit on his rule, 5 June retarget first; verdict MEASURED`.
- Protected diff vs f49b1cb EMPTY at gate (pointer, RESULT_B140/SLICE_B140, ROWPACK/, register, ledger, CONTEXT, HANDOFF, both skills, spec, journal CSV, 99_WORKFLOW/).
- Ledger `1285.` = 1, `B140-EXIT-BASIS` = 1, `1286.` = 0. CONTEXT `B140-RULE-BASIS-BEFORE-UNKNOWN` = 1, `B141-` = 0. HANDOFF `- B-140:` = 1, `- B-141:` = 0. Register `(B-140, kept EA 585093BF)` = 1.
- Disk SHAs: EA 585093BF / EX5 AB159DE7 / indicator 956BF3E3ADB7 / ind-ex5 27B5F272DCFA / HTFEngine D5FD5B063E75 / terminal.ini 4082A94F. No terminal64 (0).

## PART B (append nothing)

- Spec 3.7 stop text (v4.2 L195-214): swing = three-candle middle extreme; stop is swing high/low never OB extreme; protective side + walk-back; one-swing = valid OB with imbalance; two-swing = strong-signal no-imbalance; branch by 2xOB + imbalance never OB-validity; no minimum distance; in-zone permitted. Spec 8 rows: two-branch selector wrong + one flag; in-zone guard excludes.
- Skill 9/8 16:40 line L47 (section 2): SL 1.16359 two-swing high of declined 16:45; R 0.68 block. R-AT-OPEN L31. R boundary inclusive section 2. NO-OVERFIT L60. NO-TOLERANCE paired zeros.
- His stop words: 0828-SLREF L7-14 (verbatim 2026-09-11: nearest swing high/low left by protective side, not recency; older structure allowed); IMB-MEANING L5 (verbatim 2026-09-16: filled/invalidated imbalance counts); SEP8_1010-LEVELS L7-20 (verbatim 2026-09-16: A6 stop = 09:40 second swing 1.16258; target Sep-7 London 09:10 low 1.16102); SLDEF5 (A3 SL 1.15847 HAND = 15:30 swing low); SLREF-1 L17-21 (branch table + obValid-selector deviation note); SEP7_CHARTREAD L94 (his 15:30 swing low 1.15847).

## R1 TAGS (B137 ranges j1065739+; paired patterns slRef|sl_ref|sl_mode|SLREF|SL_MODE and swing|Swing|SWING)

- SL_REF = value + branch + obValid + distPts + site + zoneLo/zoneHi (A2 S5 J1095911 branch=1-swing obValid=1 slRef=1.15975 zoneLo=1.15975 zoneHi=1.16013; B3 S2POLL J1194981 slRef=160.501).
- SWINGPICK = pick + atShift (B3 J1194979 SH=160.539@1 SL=160.501@2; A1 J1081308 SH=1.16491@1 SL=1.16443@4).
- SLSRC = source + obStruct/obSwing/nearest/chosen (A2 J1095910 OB_SWING 1.15975/1.15975/1.16030/1.15975; A4 J1113613 OB_SWING 1.16098/1.16098/1.16102/1.16098; B3 J1194980 FALLBACK_SIDE nearest=160.501 chosen=160.501 obStruct=160.572).
- SWINGDUMP = series + bar (A1 J1081428 SH without 1.16508; 16:40 J1120565 SH with 1.16274 5th slot). SLSRC/SWINGPICK near June entries: pulls empty. SLEXT481 = ext-1 (A6 J1118662 ext1BarTime=09:40 ext1Imb=0 slExt1=1.16258).
- SIDE1O_ELIGSTATE/RGATE = latched slRef + rLive (all ten match ORDER sl). 2xOB/opposite-OB token: zero prints ("2xOB|2XOB" 0 hits); spec §8 confirms new export needed.

## R2 TABLE (entry | stop: ORDER + final print | branch printed | swing bar + triple J-lines | side | 2xOB+imbalance | R open+booked)

- A1 SHORT 10:05 @1.16466: 1.16508 (ORDER + J1081477/J1081479 rLive=2.43). Branch 2-swing obValid=0 (J1081310; firstSwing=1.16491). Triple: 09:55 h=1.16491 (J1081175; neighbors J1081167/J1081221) + stop 1.16508 unprinted (absent J1081428 series). Side above ✓. SIDE1Q 10:00 0.0/0.0 (J1081478); 2xOB NOT FOUND. R 102/42 = 2.43.
- A2 LONG 17:35 @1.16022: 1.15975 (ORDER + J1095937/J1095939 rLive=1.17). Branch 1-swing obValid=1 (J1095911 S5). Triple: 16:45 l=1.15975 (J1095283; J1095273/J1095307) + SLSRC tie. Side below ✓. SIDE1Q 17:30 1.0/1.0 (J1095938); 2xOB NOT FOUND. R 55/47 = 1.17.
- A3 LONG 16:00 @1.16018: 1.15847 (ORDER + J1110784/J1110786 rLive=1.66). Branch print superseded (S2POLL 1.15907 ≠ final). Triple: 15:30 l=1.15847 (J1109510; J1109489/J1109572) + HIS swing. Side ✓. SIDE1Q 15:55 1.0/0.0 (J1110785); 2xOB NOT FOUND. R 284/171 = 1.66.
- A4 LONG 09:20 @1.16135: 1.16098 (ORDER + J1113868/J1113870 rLive=1.76). Branch 1-swing obValid=1 (J1113614). Triple: 08:40 l=1.16098 (J1113059; J1113055/J1113064) + SLSRC tie (J1113613). Side ✓. SIDE1Q 09:15 1.0/0.0 (J1113869); 2xOB NOT FOUND. R 65/37 = 1.76.
- A5 LONG 16:45 @1.16261: 1.16238 (ORDER + J1116710/J1116712 rLive=2.34). Branch print superseded (S2POLL 1.16218 ≠ final). Triple: 16:05 l=1.16238 (J1115582; J1115575/J1115603). Side ✓. SIDE1Q 16:40 1.0/0.0 (J1116711); 2xOB NOT FOUND. R 54/23 = 2.35.
- A6 SHORT 10:10 @1.16205: 1.16258 (ORDER + J1118695/J1118697 rLive=1.94). Branch print superseded (S2POLL 1.16379 ≠ final); final via SLEXT481 ext-1 (J1118662 09:40 ext1Imb=0). Triple: 09:40 h=1.16258 (J1118217; J1117933/J1118240) + HIS swing. Side above ✓. SIDE1Q 10:05 1.0/0.0 (J1118696); 2xOB NOT FOUND. R 103/53 = 1.94.
- A7 SHORT 17:00 @1.16220: 1.16274 (ORDER + J1121146/J1121148 rLive=1.96). Branch print superseded (S2POLL 1.16379 ≠ final). Triple: 16:20 h=1.16274 (J1119811; J1119607/J1119995); tie-print NOT FOUND. Side ✓. SIDE1Q 16:55 1.0/0.0 (J1121147); 2xOB NOT FOUND. R 106/54 = 1.96.
- C-06-03 LONG 09:10 @159.929: 159.889 (ORDER + J1167787/J1167789 rLive=1.35). Branch print superseded (S2POLL 159.905 ≠ final). Triple: 08:35 l=159.889 (J1167373; J1167370/J1167378). Side ✓. SIDE1Q 09:05 1.0/0.0 (J1167788); 2xOB NOT FOUND. R 54/40 = 1.35.
- B2 LONG 16:15 @160.059: 159.598 (ORDER + J1177850/J1177852 rLive=1.44). Branch print superseded (S2POLL 159.881 ≠ final). Triple: 07:30 (6/4) l=159.598 (J1172902; J1172887/J1172910). Side ✓. SIDE1Q 16:10 1.0/0.0 (J1177851); 2xOB NOT FOUND. R 664/461 = 1.44.
- B3 LONG 14:40 @160.524: 160.501 (ORDER + J1197579/J1197581 rLive=2.74). Branch 1-swing obValid=1 (J1194981, value matches). Triple: 10:30 l=160.501 (J1194773; J1194764/J1194783) + SWINGPICK/SLSRC ties. Side ✓. SIDE1Q 14:35 1.0/1.0 (J1197580); 2xOB NOT FOUND. R 63/23 = 2.74.

## R3/R4/R5 (verdicts)

- (a) triples pass 9/10 (A1 missing 1.16508 print). (b) 2xOB never printed → graded-against line all ten. (c) OB/zone equality on A2/A4 noted with swing proof standing (B3 obStruct ≠ stop, clean). (d) zero in-zone-skip prints; all stops present. Line verdicts: 10× NOT FOUND.
- R4: A7 swing = 16:20 high; tie-print NOT FOUND. 1.16359: 09:05 bar high (J1117823), 09:40 SWINGDUMP SH (J1118123), taken-wicks + SEL52 votes — never a two-swing-high print on 16:40/16:45 rows. Refusal carries his stop: TP_RR_FAIL_LATCH J1120701 (16:40, sl=1.16359, R=0.68) + SLNONFIRE J1120703 (RR_FAIL, 146/99pts) + UJ1R J1120398 (own sl=1.16379 R=0.60 FAIL).
- R5: recomputed Rs (above) all ≥1.0; A1 alt-stop 1.16491 → 4.08, no other distinct alternatives; zero flips, all R-NEUTRAL in effect.
- R6: 0/0/10/0, flips 0. Lane stays open on the 2xOB print (A1 needs its swing print too).

## RECORD LINES (exact)

- X1 §4, X2 §5, X3 §3, X4 ledger `1286.` tag `B141-STOP-BASIS`, X5 pointer STOP-BASIS 1 of 6 (counts 1). Register untouched.
- Pre-commit: staged = result, slice, ledger, pointer, CONTEXT, HANDOFF; no source/EX5/journal/log/settings diff beyond staged.

(End of slice)
