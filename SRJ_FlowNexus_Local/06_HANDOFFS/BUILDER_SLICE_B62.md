# BUILDER SLICE B-62 - raws behind R1-R5 (j32 AA728CC7 EA 5BFBF504; j28 29BC5DBA EA D00F93BB; j29 FDD4D79A EA 958D5AA1)

## R1 record-first hits raw (file:line)
- Ledger:789 (2026-09-26, paraphrase): "8/27 entry WRONG (last valid retest 18:05, dead by 18:10+18:15 closes)".
- Ledger:1159 (2026-10-04): his W1 VERBATIM in full ("27 aug NY: Skip cause the nearest target is the D VWAP which is less than 1R. ... is it not at 16:25 high? i journaled this trade as invalid.").
- Ledger:1160 (POC-OVER-VWAP-SCOPE, his "so please separate this nuance rule."), :1166 (B-26 8/27-NY-ORDINARY, his A-Q1), :1204 (B61 item).
- Journal row 302 (8/27 NY): "INVALID 17:05 SHORT off Daily POC; nearest valid target D VWAP below 1R so skipped ... EA j3 fired this as deal #2 at 1.16524" + W1 verbatim. Row 305 (R2 gap answer, target-race topic).
- Findings RETEST-INVALIDATION-V1:37: his Ruling 3 VERBATIM (8/27 venue): "8/27 that is the correct exit, but the entry is WRONG! the last valid retest is at 18:05 and the bearish retest is invalidated by breaking it with a candle body close at 18:10 and 18:15." RECON14-OFFLOG:28 (old diagnostic, no his-words).
- Register section C: "27 Aug take (tester-only): ruled INVALID entry by him (last valid retest 18:05, dead by 18:10/18:15 closes)". Skill: no 8/27-fill hits (W1 at s11:130-135).
- C27_MATCH = SAME_TRADE (17:05 + SHORT + 1.16524 named in journal 302 + his 16:25-high pointer = X27 retest candle; anchor naming differs: his "Daily POC" vs machine "Weekly-VWAP", same fill).

## R2 27 Aug rows raw
j32 UJBARMAP (EA 5BFBF504): 16:20 o=1.16502 h=1.16583 l=1.16502 c=1.16575; 16:25 o=1.16577 h=1.16598 l=1.16561 c=1.16583; 16:30 o=1.16582 h=1.16594 l=1.16564 c=1.16565; 16:35 o=1.16564 h=1.16568 l=1.16534 c=1.16534; 16:40 o=1.16534 h=1.16540 l=1.16516 c=1.16525; 16:45 o=1.16524 h=1.16549 l=1.16503 c=1.16528; 16:50 o=1.16526 h=1.16548 l=1.16517 c=1.16539; 16:55 o=1.16539 h=1.16552 l=1.16528 c=1.16540; 17:00 o=1.16538 h=1.16542 l=1.16514 c=1.16526; 17:05 o=1.16524 h=1.16572 l=1.16498 c=1.16556; 17:10 o=1.16556 h=1.16561 l=1.16513 c=1.16513. W-VWAP 1.16566 (to 16:40) / 1.16565 (from 16:45). ltf +1.0 to 16:55, -1.0 from 17:00 (UJPROBE).
j28 UJBARMAP (EA D00F93BB) 16:25-17:00 rows byte-identical (same feed).
j32 lifecycle: ANCHOR_ELECT 16:25 Weekly-VWAP rank=9 LONG (j32:11118); S1->S2 16:40 dir=SHORT (j32:11155); S2WAIT x5 16:35-16:55 (j32:11157/11260/11362/11466/11573); S2->S3 + S3->S5 + PREBIND + A6FIRED 17:00->17:05 (j32:11681/11697/11699/11700/11916; UJ1R FIRE R=2.73); B60C RETEST rt=16:25 rSh=8 (j32:11697).
j28 twin: same seed + S2WAIT x5 (j28:12189/12292/12394/12498/12605); S2->S3 17:05 (j28:12713); PREBIND_FAIL C_TOUCH 17:00 (j28:12730), A_OPP 17:05 (j28:12856); S4->ABORT LTF_MISALIGN 17:40 (j28:13566).
RETESTBOOK (j32): hits=1 on 16:25 + 16:35 (Weekly-VWAP), 16:55/17:00 (Daily-POC), 17:05 (Weekly-VWAP); 0 else 16:20-17:10.
CONFIRMPOLL anchor Weekly-VWAP (j32): 16:25 LONG (touchAttr=1, confirm=0); 16:30 LONG touchAttr=1 confirm=0; 16:35-16:55 SHORT touchAttr 1,1,0,0 confirm=0; 16:55 SHORT oppCandle=1 bodyDir=0.
Code raws (disk D00F93BB): UJHOLDEXPIRE EA:8471-8474 (60-min); S2WAIT EA:8505-8506 (RETAINED, no timeout); design note EA:7424-7430 (S2WAIT retention built, Stage 3a).

## R3 staleness grep raws
- Skill title-hits (no lifetime content): s2:54/81/82, s5:84/85/88/90, s10:126; "dead" hits = FVG/venue topics; "rejected or gone stale": 0 hits skill + journal.
- Substance: Ruling 3 verbatim (findings RETEST-INVALIDATION-V1:37, 2026-09-26, quoted in R1); SEED-CARRY s2:81 ("how did the 5th build take it", 09:55-to-10:00 + 14:55-to-16:40 carries, no expiry); SESSION-BOUNDARY (ledger 835 paraphrase: stale claims die by line break or 5m flip).
- RETEST_LIFE_HIS = FOUND (Ruling 3: death-by-break instance; no general candle-count rule).

## R4/R5 numbers
- B2 gap: retest 16:00 -> confirm 16:10 (1 between: 16:05, no touch, no break; 16:05 A+A2 pass B fails). 5m +1.0 aligned. Seed: reseed-after-abort (B-60 C1).
- X27 gap: retest 16:25 -> confirm 17:00 (6 between: re-touch 16:35, break 16:30, A/A2/B never all-pass). 5m +1.0 against SHORT, -1.0 at confirm. Seed: normal (IDLE slot).
- GAP_TABLE cells: A1 10:00/10:00/0; A2 17:30/17:30/0; A3 UNKNOWN/15:55/UNKNOWN; A4 UNKNOWN(pinned latest)/09:15/UNKNOWN; A5 16:40/16:40/0; A6 UNKNOWN/10:05/UNKNOWN; A7 16:55/16:55/0; B3 14:35/14:35/0; C-3June 09:00/09:05/0; C-rows: 8/27 16:25/17:00/6 (j32); 6/5LDN 09:35/09:40/0 (RECON74-V11-UJ 8C6468F4); 6/8 09:25/09:30/0 (same run); 8/28 16:25 + 9/8 16:45 fired FAMILYPASS-V4 et al (EA UNKNOWN, cells UNKNOWN); 9/4 10:40 + 9/1 15:30 never fired on disk (cells UNKNOWN).

(End of slice)
