# BUILDER SLICE B-172 - raw rows (new lane; no direct-based reading separates)

Base: builder/B-171 head d5facbe on builder/B-172. Gate per result (listed paths EMPTY + disclosed +6 skill lines; counts; SHAs incl terminal.ini ACCOUNTED+restored; no terminal64).

## Part B (verify-only)

- B4 + consequence skill L254-255; L46 SWEEP-THEN-RETEST (8/28: AS.L sweep + D-VWAP retest + chart proof); L51 SETUP DEFINED; L52 POTENTIAL vs SETUP; L112 CONFIRMATION-CANONICAL; L230-233 B-146; register row 12 (A1 D-VWAP 1.16466) + NOTE L15 (origin 2109 1.16505-1.16537 formed 01:00; pick 2149); spec L131 (leg-penetration) + L143-151 (order) + 3.6 table (XOB touch permitted / FVG touch required) + 9.7 (0/12 structural); XOBSUIT-1 §6 ans1 (ONLY exit = invalidation).

## R1.1 roads (raw)

- S3→S4 arm EA:9544 (`if((haveFvg || haveXob) && s31_inPlay)` → ST_S4_ARMED + S3-zone print) — reads zone verdict.
- S4→S5 edge EA:9795 (`IsConfirmationCandle(barShift, g_anchorLine, ...)` → ST_S5_GATE_CHECK; P-CONFIRM-GATE E2) — no zone read.
- S3→S5 PREBIND jump EA:9630-9646 (else-branch = no qualifying zone; confirmation PASS → DIRECTLY S5, same pass; CONFIRM_PREBIND print) — no zone read.
- B-161 (FOUND): EA-readable in-play set paper (used R3.2 framing).

## R1.2/R2 roads per deal (kept packs; day pls)

- A1 8/28: 10:00 IDLE→S1→S2→S3 (day pl=5467) → 10:05 S3→S5 direct (pl=352) →SIGNAL — JUMP (PREBIND on D-VWAP).
- B2 6/05: 16:15 S3→S5 direct (day pl=2129), no S4 — JUMP.
- A2 17:35 S3→S4 (2140) →S5 (2142); A3 15:40/15:50 S4s → 16:00 S5; A4 09:05 S4 → 09:20 S5; A5 16:20 S4 → 16:45 S5; A6 10:05/10:10 S4s → 10:10 S5; A7 16:55 S4 → 17:00 S5; C-05-27 15:30 S4 → 15:35 S5; C-06-03 09:05 S4 → 09:10 S5; B3 14:40 S4 (1787) →S5 (1790); T0702 18:15 S4 (1363) →S5 (1365); T0707 14:45 S4 (1056) →S5 (1058) — NORMAL road.
- B-171 trial 2/07 reroute: 18:15 IDLE→S1→S2→S3→S5 (j5046700, no S4) — jump as fallback when S4 blocked.
- Zones/commits: A1 2149 direct-0 commitVia-none; B2 3308 direct-0 (16:05/16:10, 3 builds); T0702 2405 direct-0 + SWING (S4 road kept); A2/A3/A4/A5 BAR; A6/A7/B3/C-05-27 direct-alive (1/3/6/2) BAR-or-SWING; C-06-03 BAR. C-others never reach S5 (OTHER-GATEs).

## R3 zones (raw)

- A1 record: anchor D-VWAP (reg row 12); origin 2109 (NOTE L15); pick 2149 (NOTE L15); sweep proof (skill L46); exit 11:35 (finding §1).
- A1 10:00 B152PR set (RECON62-B170 W1, 21 zones): 12 B + 9 S (1389/1481/1484/1516/1704/1728/1784/1866/2109; e.g. `z1=2109,S,1.16505-1.16537,2026.08.28 05:05,1,2026.08.28 05:55,1.16507,1.16497`). 2109 live at his candle. Direct per zone NOT PRINTED (pick 2149: `XOBINPLAY bar=2026.08.28 10:00 ... hits=0 ...` j=427538/2463255/4021487, all builds).
- 2/07 18:10 set (-B168F): 8 B (1582/1869/1875/1899/1909/1941/1943/2367) + 150 S; directs NOT PRINTED (2405: 0); 2475 dead (dropped post-17:40, no kill row).

## S4 (overall NONE SEPARATES)

- (i) refuses 2/07 + A1 + B2 → must-holds fail → DOES NOT SEPARATE.
- (ii) refuses nothing (A1 9 S-live, B2 LONG-live, 2/07 8 B-live) → DOES NOT SEPARATE.
- (iii) NOT FOUND in his words (no jump rule banked).
- Buildability: (i) s31_inPlay at jump site EA:9637-pass (printed EA:9279) — READABLE. (ii) live-set count — NOT EA-READABLE (per-zone prints only; no tally variable in text).

## R4 (filed, no edit)

- None separates. Lane continues on R3 census: (a) direct verdicts for HIS zones (2109 at A1 10:00 unmeasured); (b) PREBIND arming inputs at the three jumps (confirmation terms + touch attributes vs TOUCH-OR-BREAK); (c) head-liveness grading (A1 head 2109 alive; B2 head at 16:10; 2/07 head 2367 alive). .B171NIP NOT reused (commit-site gate, off the road).

(End of slice)
