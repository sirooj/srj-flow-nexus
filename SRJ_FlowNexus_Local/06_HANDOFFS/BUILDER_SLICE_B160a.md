# BUILDER SLICE B-160a - banking, selector lines, census method, R tables, R5 (no edit, no runs)

Base: B-160 head 6a2b00f on builder/B-160 (KEPT). Ledger deviation: 1305 taken by B-160 → addendum filed as 1306 (stated in-result).

## Part B banking (skill grep 0 → appended, count 1)

- New section "## Ruling 2026-10-10 (B-160a) - multiple in-play zones; most recent XOB for documentation" with his two sentences verbatim ("there can be multiple XOBs... most recent XOB." / "trade responsible from the 920 XOB... which is 920.") + MOST-RECENT-XOB-TAG paraphrase (marked so).

## K0 quotes

- Spec 3.5 L126-137 (XOB/FVG no precedence; any leg FVG qualifies; entry need not be inside zone); spec 9.9 L354 (age never disqualifies); 0908 skill L225-228; OB-LEVEL-HIS skill L230-233. Tag is documentation; selector gated by R5.

## R4 selector + in-play test (raw)

- OrderblockMgr:1084 `int SRJ_NearestPromotedOBIndex(const string bias)` :1095-1097 side match; :1098 `if(!ob.isPromoted) continue;` :1099 `if(!ob.isValid) continue;` :1100 `if(!ob.isActivated) continue;` :1102 `better = (bestIdx < 0) || (ob.startBar > bestStart)`; called at indicator:1236 with comment :1227 (nearest valid+activated+promoted in-bias OB, ANY age). No in-play consult: NOT FOUND.
- EA ZoneInPlay:7207 `(barShift, zHi, zLo, stopRef, haveStop)`: :7214 bar overlap; :7216-7220 nearest swing; :7222+ SL-leg walk to stop ref.

## Census method (scripts uncommitted, TEMP)

- In-play XOBs = B160 committed packs B152PR z1 MET rows (promoted + alive + post-promo range touch) at confirmation bars; FVGs = ZONEPICK haveFvg (0 rows with haveFvg=1 in all B160 week packs → none); formation bars joined by id from CENSUS_B158 (same numbering, proven); leg membership NOT PRINTED (no leg export). R6 CSVs carry verdict/register/confirm/kind/id/range/formation/promo/in_play/most-recent/machine-tag/origin/pack-lines; C-06-04 contributes none.

## R1/R2/R3 tables

- Per-row in-play sets + most-recent (*) + tag: A1 [9] 2109* vs tag 2149 DIFFER; A2 [9] 2549* = tag SAME; A3 [8] 2793* SAME; A4 [10] 3130* SAME; A5 [14] 3178* SAME; A6 [13] 3293* = B160-tag SAME; A7 [13] 3293* SAME; B2 [25] 3308* SAME; B3 [33] 3913* SAME; C-06-03 [21] 2930* SAME; C-06-04 [0] none; C-05-27 [19] 2094* SAME. (Full id lists in-result; rows in ZONES CSVs.)
- A1 detail: 2149 (f06:25, p06:40) first touched 14:00, after A1 10:00 → correctly absent from A1's in-play set; 2109 (f01:00) latest among in-play.
- Origins: A1 2109; A2 2549; A3 2793; A4 3130; A5 3178; A6/A7 3293; B2 3308; B3 3913; C-06-03 2930; C-05-27 2094; C-06-04 none.
- A7 tag note: no ZONEPICK row exactly at the 16:55 bar in packs; tag per SETUPS_B160 A7 row (id 3293) + 16:30/16:50 ZONEPICK rows (1.16230-1.16256 inPlay=1).

## R5 reasoning (DOES NOT SEPARATE)

- Differ condition MET (A1 only); C-06-04 empty MET. Fire-keep: 10/11 rows trivially SAME-pick; A1-on-2109 UNPROVEN offline (kept rows evaluate selected 2149 only; 09:55 retest 1.16473-1.16491 reaches neither 2109 1.16505-1.16537 nor 2149 1.16492-1.16507, so XT neutral; S3INPLAY swing-leg verdict on 2109 unmeasured). One unproven row fails every-row gate. No edit, no compile, no runs.

## X records

- CONTEXT X1/X2 (verbatim, counts 1/1); HANDOFF X3 (B-160a line, MEASURED); ledger 1306 (NOT 1305: taken; "^1306." = 1); pointer B-160a MEASURED, Lane XOB-DETECT-920; register unchanged (KEPT-only gate unmet).

(End of slice)
