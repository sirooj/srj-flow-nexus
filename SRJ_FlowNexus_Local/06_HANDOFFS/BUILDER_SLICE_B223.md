# BUILDER SLICE B-223 - raw rows (28Jul death proof, re-grade, install; KEPT)
Base: builder/B-223 cut at d86de91 (= B-222 head). Verdict KEPT (P3-0618 6 of 6; install .B222K byte-copy, no compile).
## Start gate
```
log-1 d86de91a3eff64e6e03cc1d90eea3538d16282aa (backup exact; B-223 cut here; rev-parse HEAD at cut + before commit).
diff d86de91 EMPTY on pointer + RESULT_B222 + SLICE_B222 + SEPARATOR_B222 + both skills + CONTEXT + HANDOFF + LESSONS + FIXPLAN + READ_MAP. Status 817 (dirty tree as B-222 = ACCOUNTED).
Disk SHAs: kept EA 7c392767/83ac8bde; .B222K b4db21c5/61829f05; tini c725e437; 6 cuts present (B218 163599578/727546836 + B222B 163659540/606802512 + B222K 163994231/602470995). Ledger ^1369=1 ^1370=0 pre. No terminal64 (operator MT5 not open). Python 3.13.16. No re-check of ticks (grade trial vs own B222B baselines per 0.5).
Pins: rules/47 count 1 ALREADY_BANKED (cite d86de91). Spec 3.3 L22-26 ("a flip against the locked direction kills the candidate"); rules/17 L3 (formed-setup words) + L6 (B-61 narrows 5M-FLIP-KILL); rules/18 L6 ("Dead is dead") + L12 (flip invalidates formed setup before confirmation only); rules/43 L12 (28Jul words); rules/47 (7Sep words). F3 L49-52. B222K DEALS + day packs located (ROWPACK/DEALS_*-B222K.csv 721/1937 B; EU0525TD-B222K/06-18 990508 B, 07-28 1217512 B, 09-07 1529409 B; RECON62-B222K/09-07 1095607 B).
```
## Part R (job_r_b223.py, offline, no runs)
```
R1 trial 28Jul SHORT (CUT_EU0525TD-B222K): BORN seed 09:30 Daily-VWAP px1.13710 (JL 11324838, ht=-1/-1/1); ALIVE S2 10:00 + S4 10:05 ltf=MISALIGN (JL 11326716/11327286); 10:10 A6REFUSED LTF_MISALIGN (11327293) + B182DEC ABORT (11327294, latch0 div1 regular dbar09:45) + END 5M-FLIP-KILL (11327295, st=S4_ARMED); B201FROM sd09:30 (11327296). Seed-bar CONFIRMPOLL confirm=1 at 09:30 (JL 11324832, formation/admission); NO entry-confirmation and NO S5 before death -> PRE-CONFIRMATION FOUND (pre-entry).
Later shorts: 10:25 Weekly-POC BORN; 10:40 Daily-VWAP BORN (V1 release JL 11329212: LONG holder close 1.13691 < 1.13702) -> 10:45 ABORT HISZONE_NONE (11329272-73); 11:05 Daily-POC BORN -> 11:15 ABORT FRESH_OPP_FVG (11329610-11); 11:15/11:30 Weekly-POC BORNs -> 11:25/11:40 ABORT LTF_MISALIGN (11330266-67/11330984-85); 11:45 release (JL 11331626). NO FIRE anywhere on 28Jul trial rows.
5m panel: 10:05 B196BAR ltf=1.0 holder SHORT (JL 11327285, ALIVE ltf=ALIGN) -> 10:10 B182DEC ltf=MISALIGN + END 5M-FLIP-KILL (JL 11327294-95). Panel against the short at 10:10 FOUND.
R2 kept 28Jul (CUT_EU0525TD-B222B): LONG Weekly-POC holder 09:35 SUPPRESSED (JL 6949019, S2) through 10:40 SUPPRESSED (JL 6952822, S4, opp=1); SHORT Daily-VWAP BORN seed 10:40 (JL 6952833, px1.13709); ORDER entry 1.13689 (JL 6953437); FIRE 10:45 div-1 regular dbar10:10 (JL 6953426); A6FIRED (6953427); B177HZ rt=10:10 gapTouch=1.0 PASS (JL 6952847). (Also kept LONG BORN 09:35 JL 6949015 + SHORT ALIVE 09:45 JL 6949674 + END 10:10 5M-FLIP-KILL JL 6950905 on the parallel track.)
R3 rules verbatim (lines): spec 3.3 L26 "a flip against the locked direction kills the candidate"; rules/17 L3 "invalidating a setup is already forming setup" + L6 B-61 narrows 5M-FLIP-KILL; rules/18 L12 "The 5m flip invalidates a formed setup before confirmation only"; rules/43 L12 "i do not see valid XOB or FVG to be in play". PASS (PRE-CONFIRMATION FOUND + panel against short at 10:10).
R4 build proof: trial segments carry [B222DH] (RECON-K 8, EU-K 102, B-222 cut); trial ex5 before/after both runs 61829f05 = .B222K ex5 (B-222 K4/T3); baselines B222B 16/16 + 44/44 SAME on same ticks (B-222 T1-T3).
```
## Part S (SEPARATOR_B223.csv 37 rows; corrected GONE rule)
```
Same classes as B-222. 28Jul MACHINE verdict PASS (trial ends setup by his flip rule on JL 11327293-95, listed EU_FIX_PLAN sec2). KEEP holds: A1-A7 identical both trials (B-222 T4/T6), only NEW 18Jun at opens (09:45 1.15256 +2 spread / 10:00 1.15195 exact), no moved, short silent (B-222 T3), R4 holds.
```
## Part K install (no compile)
```
K1 .preB223 src 7c392767 + ex5 83ac8bde (SHAs verified). K2 .B222K byte-copied into Experts: src b4db21c5 + ex5 61829f05 verified (match 0.4). No compile (rows came from this exact ex5). K3 kept-of-record: b4db21c5/61829f05, evidence RECON62-B222K 16/16 + EU0525TD-B222K 44 kept + 18Jun - 28Jul; CUT_*-B222K kept baseline.
```
## Part X records
```
CONTEXT sec5 +1 B-223, sec4 P3-0618 B-223 KEPT. HANDOFF 3a closed KEPT + 3b drop B-213 add B-223 keep10 (124 chars). FIXPLAN F8 State B-223 DONE KEPT + F3 28Jul marked removed (no other KEPT marks). Ledger 1370 B223-EU-P3-KEEP-B222K (^1370=1). Pointer latest B-223, kept build b4db21c5/61829f05, P3 closed KEPT, Next euro review (verify 35 lines). LESSONS +1 B-223-ANY-HIS-KILL (139 chars), B-70 folded (19888 B). X7 register NOTE + READ/REGISTER copies regen (source 1440933b; A/B/D/E/F headers updated, C.md rewritten).
```
## Size gate (caps pointer 6000/35, result 12000, slice 20000/600)
```
pointer 4457/35 PASS; result 5166/16 PASS; slice 6161/41 PASS (this file); CONTEXT 7959 PASS; HANDOFF 4886 PASS; LESSONS 19888 PASS; FIXPLAN 12183 PASS; SEPARATOR_B223 (verify) PASS; SETUPS pair + ROWPACK weeks/days + DEALS + INDEX_B223 (F2b KEPT) PASS; READ_MAP rewritten. Strategy max + relay + READ max per READ_MAP.
```
## Timing + final disk + housekeeping
```
Wall: gate+reads ~15m est; R script ~10m; S re-grade ~5m; K install ~3m; X records ~15m est; F2b packs ~30m (full CUT scans + 4 script fixes); final commit/push follow.
Final disk: KEPT build installed, no edit, no compile (EA src b4db21c5 / ex5 61829f05; Panels 4335f703; flow a8201128/c82f175e; OB 8bbf936b; Imbalance 568f4ce9; Bias 3b1d9d3d; State 80a466ac; POI 5AF5E035/E5CBE1A2; SESS 16573a5b). CUT_*-B222K kept baseline. tini c725e437 blessed. No terminal64. One .preB rollback kept (.preB223: 7c392767/83ac8bde).
Housekeeping: CUT_*-B222K = kept baseline; keep one .preB rollback (.preB223); old CUT_B218 + B222B cuts follow the rule with manifest: superseded CUT_B218 pair (163599578 + 727546836 B) + B222B pair (163659540 + 606802512 B) DELETED here (their REPORTs/DEALS/packs stay committed); day logs + MQL5 logs stay.
```
(End of slice)
