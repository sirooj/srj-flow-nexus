# BUILDER SLICE B-163 - raw pack lines + grep hits behind every row (MEASURED, no edit, no run)

Base: builder/B-162 head b86f518 on builder/B-163. Gate per result (diff EMPTY, SHAs match, counts 1, pre-greps 0, terminal.ini ACCOUNTED). Runs: RECON62-B162 + JUNE0525-B162 (EA 1617DC1A, ind 10880847, Tester/logs/20261011.log).

## R1 raw (INDEX_B162 refs; sample raws byte-for-byte from packs)

- A1 seed W1:5119-5121, conf W1:5154|5157, latch W1:5156, entry W1:5161. ZONEPICK bar=10:00 xob=1.16492-1.16507 (B-162 T2). MTEXIT bar=11:30 exit=1.16464 (B-162 T2). DEAL #2/#3 DEALS_B162 L2-3.
- A2 conf W2:4353|4356, latch W2:4355, entry W2:4360. B60C bar=17:30 zxob=1.15975-1.16013 xpromo=17:25 (SLICE_B162 R1 raw). MTEXIT bar=17:45 exit=1.15987 (day log 17:50:00 pass, B-162 T1). DEAL #4/#5 L4-5.
- A3 conf W2:11058|11061, latch W2:11060, entry W2:11065. MTEXIT bar=23:50 exit=1.16129 DAY_CLOSE (B-162 T1). DEAL #6/#7 L6-7.
- A4 conf W3:154|157, latch W3:156, entry W3:161. MTEXIT bar=10:50 exit=1.16200 TP_TOUCH (SETUPS A4 row). DEAL #8/#9 L8-9.
- A5 conf W3:2337|2340, latch W3:2339, entry W3:2344. A6FIRED sl=1.16239 (B-162 T1). MTEXIT bar=17:10 exit=1.16315 (SETUPS A5 row). DEAL #10/#11 L10-11.
- A6 conf W3:3718|3721, latch W3:3720, entry W3:3725. DEAL #12/#13 L12-13 (10:42 1.16102).
- A7 conf W3:5351+5449|5354+5452, latch W3:5353+5451, entry W3:5456. ORDER sl=1.16274 (B-140 R6). DEAL #14 17:00 1.16220 / #15 17:26:29 1.16275 (DEALS_B162 L14-15). His stop 1.16274: skill L194 (0908-NY-TARGET-YPOC pin).
- B1 conf J-W2:10663+10781+10819+10889, latch J-W2:10739, entry NONE. SETUPS B1 row kill=ABORT/LTF_MISALIGN pack=W2:10743.
- B2 conf J-W2:12658|12661, latch J-W2:12660, entry J-W2:12665. DEAL #6 16:15 160.065 / #7 19:16:32 160.298 (DEALS June L6-7). Exit DEAL packed J-W2:13948 (19:16); MTEXIT bar=19:15 logged server pass 19:20:01 (day log) — no pack line (R3).
- B3 conf J-W3:11372+11373|11376, latch J-W3:11375, entry J-W3:11380. His 160.524: skill L95 (ENTRY-BAR READ-BACK). DEAL #8 14:40:22 160.530 / #9 15:23:06 160.588 (DEALS June L8-9).
- C-06-04 conf J-W2:8027|8030|8031, latch J-W2:8029, entry NONE. ABORT PROMO_RETURN_NONE 09:55 (B-162 T2).
- C-06-02 conf J-W2:3958, latch NONE, entry NONE (CONFIRMPOLL confirm=0).
- C-06-10 conf J-W3:8416|8417, latch NONE, entry NONE (confirm=0).
- C-08-27 conf W1:4170, latch W1:4232, entry NONE (confirm=0).
- C-09-01-1530 conf W2:3680|3683|3686, latch W2:3682, entry NONE (ABORT/LTF_MISALIGN).
- C-08-28-1625 conf W1:6707|6710|6713, latch W1:6709, entry NONE (TP_RR_FAIL).
- C-09-04-1040 conf W2:10053, latch NONE, entry NONE (confirm=0 touchAttr=1).
- C-09-08-1645 conf W3:5357, latch NONE, entry NONE (TP_RR_FAIL).
- C-06-03 conf J-W2:5004|5007, latch J-W2:5006, entry J-W2:5011. DEAL #4 09:10 159.932 / #5 09:59 159.983 (DEALS June L4-5). His 159.929: register section C cell.
- C-05-27 conf J-W1:5465|5468, latch J-W1:5467, entry J-W1:5472 (no register row; see R2).

## R2 raw + grep hits (27 May NY LONG, deals #2/#3)

- SETUPS June EXECUTED/NONE row: retest 15:25 Daily-POC, confirm 15:30 BOTH, entry 15:35 ref 159.340 fill 159.344, sl 159.197 swing 07:20 2SWING, tp NOT PRINTED@160.723 R 9.67, div regular bullish@15:20, promo MET, xob 2094 (159.190-159.208 pT 06:40), origin 2094.
- DEAL #2 W1:1269 (day-file JUNE0525-B162/2026-05-27.csv:1269): `deal #2 buy 1.08 USDJPY at 159.344 done (based on order #2)` server 15:35.
- Exit MTEXIT (day log only): `MTEXIT bar=2026.05.27 20:05 reason=TP_TOUCH line=- lineVal=- entry=159.340 exit=159.535 src=-` logged server pass 20:10:09 — no pack line (past pair end 20:08, outside 14:00-19:00).
- Exit DEAL #3 W1:6840 (day-file :2637): `deal #3 sell 1.08 USDJPY at 159.535 done (based on order #3)` server 20:08:14.
- Greps (patterns "27 May|5/27|2026.05.27|05-27|C-05-27" + "5/27|27May|159.344|C-05" + "2094" where scoped): journal CSV 0; register 0; strategy skill 0; FINDING *.md 0; AGENTS.md 0; .clinerules 0; ledger "C-05-27" 7 hits all machine-side (1278/1287/1292/1296/1303/1304/1306-1308 lane tables); ledger date-form hits (6908-7016 class) old-run contexts about other rows only.
- Label first seen: INDEX_B131 (earliest INDEX on disk): `C-05-27 [UJ 27 May LONG]: seed JUNE0525 NONE | conf JUNE0525 74+83+84 | latch JUNE0525 86 | entry JUNE0525 88+89+90` — machine pack label, never his words.
- Placement: 2026-05-27 < graded 06-01 → WARM-UP. Verdict: NO RULING FOUND → carried-note chart call.

## R3 raw (report gaps)

- B2 exit MTEXIT: day log `MTEXIT bar=2026.06.05 19:15 reason=TP_TOUCH ... exit=160.298` logged server pass 19:20:01 — no B162 pack line; exit DEAL J-W2:13948 present. Renderer-miss (outside windows).
- 27 May exit MTEXIT: server pass 20:10:09 (above) — no pack line; exit DEAL J-W1:6840 present. Same class.
- sl_swing_bar (A2/B3/C-06-03): SLSRC/SWINGPICK/SL_REF tags never in the pack tag list (25 tags: B160 24 + B162ORIGIN); README "NOT PRINTED (no swing print in packs)". Pack-scope, renderer-correct.
- All other EXECUTED NOT PRINTED cells: README documents no print carries them (retest_side_tag, tp_name, htf_*, r_result, div_type_his, reject_* NONE). No miss.

## R4 (ranked)

- Class 1: no live defect (all settled per B-138/B-139/B-140: signals = his numbers; fills EXACT/SPREAD/LAG ACCOUNTED; R60 cells QUARANTINED).
- Class 2: none. Class 3: 27 May NY LONG → NEXT LANE. Class 4: B2/27May exit MTEXITs + sl_swing_bar pack-scope gaps. Class 5: listed HIS UNKNOWN + QUARANTINED cells (result R1/R4).

## X records

- CONTEXT X1/X2 (1/1); HANDOFF X3 after B-162; ledger 1309 ("^1309." = 1); pointer B-163 MEASURED, Lane FIDELITY-B162 (first B-163, 1 of 6); register untouched (X5 not applied).

(End of slice)
