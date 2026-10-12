# BUILDER SLICE B-183 - R3 raw spots, R1/R2/R3 samples, R4 diff, M-ranks

Base: builder/B-183 cut at d7c964d (relay named d57893b; cleanup follow-up delta = srj-relay SKILL + pointer only, ACCOUNTED). Read-only; no compile; no run. Python 3.13.16 canonical path.

## R3 raw code spots (live sources, located by text, read-only)
- Indicator export Section 8 (:1304-1314): `// [Task 113] Same branch, same pointer as the bounds and the id above, so all four values describe one order block.` + `int t113_pb = (int)xob.promotionBar;` + `datetime t113_pt = SRJ_BarTime(t113_pb);` + `g_bufXobPromoTime[target] = (double)t113_pt;` (buffer 0.0 = unset, :1292).
- EA B60C print (:2704-2713): `PrintFormat("[SRJ-EA] B60C bar=%s dir=%s poi=%s rt=%s rSh=%d rBar=%s cSrc=%s xt=%s zxob=%s-%s xpromo=%s - C satisfied by %s ([B-61 C2][B-129 XT])", ... (uj129_haveZone ? TimeToString((datetime)uj129_promo, ...) : "unset") ...)`; uj129_promo read at :2690 `ReadFlow(FL_BUF_XOB_PROMO_TIME, uj129_promo, barShift)`, used :2695 xt-check, printed :2712.
- EA INPLAYCOMMIT print (:9560-9571): `promoT=%s` from `(t123_promoT > 0.0 && t123_promoT != EMPTY_VALUE) ? TimeToString((datetime)t123_promoT, ...) : "unset"`; t123_promoT read :9064, gates :9282-9283 (t124_bound), :9480/:9510 (t133_bound).
- Indicator B178ZL new-slot (:1871-1913): `int b178pb = (int)b178ob.promotionBar;` (:1871) + `datetime b178ptd = SRJ_BarTime(b178pb);` (:1873) + slot match by side/formT/promoT/range (:1880-1884) + first-sight PROMO print :1912-1913 (`promoT=%s range=%s kill=%s` from b178pt/b178rg/b178kl); KILL print :1920-1924 with kill candle `t=%s` = time[i].
- Convention (B144 writer-first): both writers stamp SRJ_BarTime(promotionBar) (bar-open time). Identical convention -> no CONVENTION class anywhere; all 5 rows DIFFERENT-EVENT.
- Readers impact: every B60C xpromo in B-182 packs equals a same-range B178ZL slot promoT (sweep: 0 mismatches); buffer values at decision passes equal slot values (9/01 08:20 pack 167; 9/08 20:55 pack 412). No verdict reads differently on any register row (measured).

## R1 sample (ZONESTATE_B183.csv, 38 rows; 35 SAME / 3 DIFFERENT)
- 2026-07-06 10:55 LONG 1.33344-1.33425 | B181 standing (BLIND-B181 L14) | B182 NOT STANDING (win=0) | ROWS NOT STANDING (HZB side=B win=0 first=- eval 11:00 pack 777; no pick KILL t<=10:55) | DIFFERENT (B-181 misread)
- 2026-07-06 14:40 LONG 1.33369-1.33408 | B181 standing (L15) | B182 NOT STANDING | ROWS NOT STANDING (win=0 first=- eval 14:45 pack 1545) | DIFFERENT (B-181 misread)
- 2026-07-06 15:00 LONG 1.33369-1.33408 | B181 still standing (L16) | B182 NOT STANDING (win=0 cit.) | ROWS NOT STANDING for pick, strict first-match (win=1 eval 15:05 pack 1753; first=14:00-formed 1.33369-1.33409, 1pt off pick; no pick KILL t<=15:00; B177HZ 1.0/1.0 pack 1765) | DIFFERENT (B-181 misread pick; B-182 stale row citation - the R4 named fix)
- 2026-07-01 11:05 / 07-02 18:10 / 07-07 14:40 / 07-08 15:30 / all 19 RECON + 12 JUNE: SAME (incl. 9/01 17:30 LONG STANDING via eval-pass 17:35 pack 2750 - the bar-vs-pass fix).
- Method notes: HZB read at eval pass = confirm+5min (BAR-MAPPING-CANONICAL); KILL matched side+range+promoT with t<=confirm; first-regex fix (values contain spaces); strict first-range match (win=1 alone never proves the pick).

## R2 sample (GAPCARRIER_B183.csv, 5 pure gap passes)
- A1 28 Aug SHORT bar=10:00 (B177HZ pack 481, gapTouch=1.0 xobWin=0.0): touch 09:55 pack 422 (remnant 1.16482-1.16486), FORM NOT PRINTED (pre-window; zero 06:30-06:40 GAP_FORM either side) -> DIFFERENT vs his 06:30-06:40 FVG (his prices NOT PRINTED).
- 9/01 09:50 LONG: touch 09:20 EMPTY pack 252, DEAD BODY_THROUGH pack 253, FORM NOT PRINTED.
- 9/02 17:45 LONG: FORM 16:15/16:20/16:25 range 1.15826-1.15900 pack 2566; touch 17:45 pack 3121 remnant held; ALIVE.
- 7/06 10:55 LONG: touch 10:55 pack 816 remnant 1.33082-1.33284; FORM NOT PRINTED (pre-window, proven by full-pack search).
- 7/06 14:40 LONG: touch 14:40 pack 1582 same remnant; FORM NOT PRINTED.
- Spec 3.5 leg: NOT PRINTED all gaps (28 'leg' hits = 'legacy').

## R3 sample (PROMOT_B183.csv, 5 rows, all DIFFERENT-EVENT)
- 9/01 09:10 SHORT 1.16100-1.16129: pick 07:30 (B-181-carried, absent B-182) vs slot 08:20 (PROMO pack 37, MID pack 36, B60C pack 167, XOBPROMO pack 127).
- 9/08 09:35 LONG + 16:40 SHORT 1.16362-1.16377: pick 9/03 21:35 (absent B-182) vs slot 9/03 20:55 (PROMO 9/03 pack 2742; B60C 9/08 pack 412).
- 9/02 16:30 SHORT 1.15781-1.15811: pick 9/01 18:20 (live stamp of range 1.15956-1.15986, B60C 9/02 pack 2627, killed 16:40) vs slot 9/02 16:20 side=B.
- 9/04 15:35 LONG 1.16245-1.16275: pick 9/03 06:10 (live stamp of range 1.15907-1.15933, packs 19/20/86/91/1168) vs slot 9/04 11:00 side=S.
- Fills: none (CONVENTION never proven). Relay named 8 EU rows; measured 5 nearest-slot cells (formT/mid/kill 5/5/5).

## R4 diff summary (render job_r4_b183.py)
- SETUPS_GBP0629-B183.csv: 7/7 rows; +1 column carrier_zone_or_gap (R1/R2-named); 1 named cell fix (15:00 state source text, value NOT STANDING unchanged); zero non-named diffs (script-verified).
- BLIND_GBPUSD_0706-0717-B183.md: 15:00 bullet corrected; all else byte-identical.
- RECON62/JUNE0525 B-183: not rendered (zero named changes).

## M ranks (MISSCENSUS 96 rows: HIS-RULE 75 + TAKE 1, NO-PIN 18, MIS-READ 2)
- Top NO-PIN: CONFIRMPOLL-touched-never-confirmed x18 (12 later killed by pinned gates, 6 silent) -> B-184 touch-confirm trial.
- MIS-READ: HOLDER_EXPIRED x2 (vs SEED-CARRY L81).
- M2: 4/4 TARGET VALID. M3: 24 sessions, takes only 7/07 NY; silent 7/09 LDN + 7/16 NY (NO-PIN first-stop). M4: 7 cover rows (UJ 6/18 #53, 6/19 #59, 6/25 #75; EU 8/12 #210, 8/17 #223, 8/20 #233, 8/25 #247); July 5 excluded unread; direction NOT PRINTED.
- B-184 trial named (not started). Next must-keep window: June 18-25 UJ or Aug 12-25 EU.
(End of slice)
