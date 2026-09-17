# FINDING AGREEMENT-02 — miss mechanisms + cross-run selection proof (read-only; current window only)

**Follows:** AGREEMENT-01 (EA is a strict subset: 1 fire vs his 4 booked). This file diagnoses WHY, seed by seed, from RECON40 (pre-rewire, `RECON40-STOPSHADOW_JOURNAL.log`) vs RECON45 (post-rewire, archive `70CE840F`) on the same 08-26→09-09 window.

## 1. DH = 09-04 10:35 SHORT (not 08-28 — candidacy withdrawn)

- His 8/28 note "1.21R" vs DH 1.21 is date-mismatched (DH is a 9/4 seed). The R equality is coincidence. WITHDRAWN as DH identity; his 8/28 setup stays unmatched (EA 8/28 max R 0.19 vs his booked +0.10 on a 1.21R-marked setup — deep level mismatch, mechanism open).
- DH rows: RECON40 entry=1.16265 liveStop=1.16379 ruleStop=1.16299 liveTp=1.16224 liveR=0.36; RECON45 entry=1.16265 liveStop=1.16289 ruleStop=1.16299 liveTp=1.16252 liveR=0.54.
- V112's 1.21 used RECON40's TP (41/34). Current TP gives 13/34 = 0.38. The prediction went stale by TP move, not by stop logic.

## 2. IE = 09-08 16:55 SHORT

- RECON40: liveStop=1.16379 ruleStop=1.16274 liveTp=1.16114 liveR=0.67 (V112 rule R 106/54 = 1.96 PASS).
- RECON45: liveStop=1.16274 ruleStop=1.16274 liveTp=1.16210 liveR=0.19 (rule R 10/54 = 0.19 FAIL).
- Same story: TP moved 106→10 pts of reward against the SHORT; stop improved 159→54.

## 3. The rewire demonstrably changes live selections (cross-run proof)

- DH liveStop: 1.16379 (RECON40, pre-rewire) → 1.16289 (RECON45, rule-side). IE liveStop: 1.16379 → 1.16274 (= rule stop exactly).
- The "always-s1 vs live" question is settled by movement, not just traces: the live take-path select MOVED onto rule-side values between the two binaries on both seeds, per the cleared design. Correctness + consequence both observed — as CHANGED SELECTIONS, though both still fail (TP-starved).
- Net register outcomes 14/14 identical; FL still sole fire. The promotion TP move (his levels, council-cleared separately) and the stopfix interact destructively on DH/IE: stops improved ~3x, TPs shrank ~3-10x.

## 4. The four misses, mechanized

- 8/28 (+0.10 booked): no EA row near his numbers (EA max R 0.19 that day). OPEN — level-set mismatch, needs his setup detail (no entry time in journal).
- 9/4 (+0.84 NY): nearest miss on record — EA 15:55 LONG R 0.99, exactly ONE point short of the gate (170/171). R-calibration question.
- 9/7 (+2.03 LDN / +1.06 NY, both LONG W AVP): EA saw direction (09:15 R 0.62, 16:40 R 0.39) but his R readings are 3-5x higher — stop/target level-set mismatch vs his W AVP reads. POI-source question.
- 9/8 FL: matches stated numbers; booking unconfirmed (journal blank).

## 5. Disposition

- Nothing here moves code or selection. The stopfix correctness question is answered twice over (trace 3/3 + cross-run selection moves); what remains is calibration (R-gate nearness, POI reads, his 8/28 levels) — strategy-adjacent, council/her territory.
- Next: relay carrying the cross-run proof + interaction, asking whether selection-change evidence closes the stopfix proving and ruling the calibration questions.
