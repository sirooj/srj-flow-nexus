# RESULT — RECON36-STOPSHADOW (`S1-CONDSTOP-SHADOW-001` diagnostic run)

**Build:** EA `7F01804EC5EFD89B25B115D778E2245103F688E765A31DE4CCD724E4F374A206` (576968 B, +3839 shadow-only). FlowLogic `3606BFB4` unchanged. Both compile 0/0 fresh logs (EA 13:25:48, Flow direct).
**Run:** RECON36-STOPSHADOW, DONE=PASSED 2026-09-16 14:15:54. Test passed 0:48:41.675; 3168 bars / 563338 ticks; same ini/range (Model=4, InpDebugLog=true, 08-26→09-09).
**Archive:** `06_HANDOFFS\RECON36-STOPSHADOW_JOURNAL.log` — 37231 lines / 7213977 B / SHA `0297A72E19B1C2EAA0CB7D562E188E62762CA18BA1EB39868B93CC855F327030` / bounds [114836..152066] contiguous past RECON35 (PRE=114835). Purity: farm-off + cloud-off + Core-04 + Test-passed. MAXLEN=537 (cap, zero exceedance). SELHALT=0. Signals 4/4 byte-identical. Null-effect: 51-family table, ONLY SIDE1E differs (+14 new rows); WS161 218/mismatch-0 identical; N1EQUALS identical. Leftover 17340 closed graceful, declared.

## Grade vs Luna §5 (all rows measured, builder reconciles nothing)

| Check | Required | Measured | Status |
|---|---|---|---|
| S1 S0-noimb → S1 selected | PASS | `s0=1.16251 imb0 → sel=1 → s1=1.16258` | PASS |
| S1 price = wick 1.16258 | PASS | s1px=1.16258 (SLADDER wick=px corroborates) | PASS |
| S1 R ≈ 2.52 | PASS | r1=2.52 | PASS |
| S1 RR pass | PASS | 2.52 ≥ 1.0 | PASS (would-be; live stays FAIL by design) |
| S2 fallback case | Observed | NOT fallback — S0-case: `s0=1.16274 imb1 → sel=0` | FAIL (prediction refuted) |
| S2 R ≈ 0.68 | PASS | r1=0.68 present, but selected gives r0=1.62 | MIXED (see F1) |
| S2 outcome remains RR_FAIL | PASS | adopted R 1.62 → would PASS → FIRE | FAIL (see F1) |
| R-fire zero delta | Zero delta | shadow null (fires 4/4 by construction); adoption-consequence table below | MIXED (see F2/F3) |
| R2 declined | Declined | shadow null; adoption routes R2 S0 (imb2) → R 1.71 → would FIRE | FAIL under adoption (see F2) |
| 10:10 no manufacture | No manufacture | SIDE1E at 10:10 = 0 rows | PASS |
| purity/MAXLEN/SELHALT/STATUS/DONE | PASS/PASS/PASS/complete | pass/537-0/0/complete/complete | PASS |

## Adoption-consequence table (what live adoption WOULD do, read off SIDE1E rows)

| Row | sel | adopted stop | adopted R | live today | Consequence |
|---|---|---|---|---|---|
| S1 10:05 | 1 | 1.16258 | 2.52 PASS | STAND-DOWN | creates his-direction trade (WANTED) |
| S2 16:40 | 0 | 1.16274 | 1.62 PASS | STAND-DOWN | creates non-journal trade (F1) |
| R1 10:00 | 1 | 1.16508 | 2.43 | fires identical | IDENTICAL ✓ |
| R4 09:15 | 1 | 1.16098 | 1.76 | fires identical | IDENTICAL ✓ |
| R3 15:55 | 1 | 1.15847 | 1.66 | fires 1.15907/2.56 | stop moves, R changes (F3) |
| R5 16:40 | 1 | 1.16238 | 2.34 | fires 1.16218 | stop moves 2pts (F3) |
| R2 10:35 | 0 | 1.16289 | 1.71 | declined | WOULD FIRE (F2) |

## Findings (halt live adoption; re-authorship owed)

- **F1 — Luna's S2 prediction refuted:** S2's nearest swing HAS imbalance (s0imb=1 = alive-at-apex), so the authored rule selects S0, not the fallback. Adopted R 1.62 → S2 fires. The negative control inverts into a created trade. (Plus 16:55 post-transfer row sel=1 → R 1.96 → second created trade, session-use permitting.)
- **F2 — R2 would manufacture:** R2 routes S0 (s0imb=2) → R 1.71 → would fire the MUST-DECLINE trade. Hard halt under Luna §10 ("any newly generated R2 trade").
- **F3 — R3/R5 fires move:** adoption changes their stops (R3 1.15907→1.15847/R 2.56→1.66; R5 1.16218→1.16238). Fires persist but outcomes change → "changed fire outcome" halt trigger. R1/R4 byte-safe by identity.

## Disposition

SHADOW DELIVERED (it caught all three before any live build — its purpose). LIVE ADOPTION: REPORT + HALT — `STAGE-D-CONDSTOP-001` as authored overfires (S2-create, R2-manufacture, R3/R5-move). No tuning, no rescue. Next: re-authorship (narrowing? S1-only? R2/S2-exclusion?) — v90 relay. Run word SPENT. RECON17 frozen; `7F01804E` uncommitted. NO build/run/commit.
