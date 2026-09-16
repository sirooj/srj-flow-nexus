# FINDING - birth suppression mechanism (READ-ONLY audit; answers Luna V113 Ask-3 open condition)

**Method:** code read (EA:7587, EA:7589-7607, EA:7673-7698) + journal forensics RECON41 vs RECON40 (counts double-proved). No canonical edit, no build, no run. No clearance spent or asked. Sonnet's source-read request satisfied on record here to the extent logs + filed code allow.

## 1. Filed rules (code idiom, read-only)
- R1 occupancy (EA:7587): `s1f_seedArmed = (g_state == ST_IDLE)` - seeds, hence SIDE1V_BIRTH (EA:7694, gated EA:7673 on the same armed flag), exist ONLY while the single-candidate machine is IDLE. A held/fired candidate occupies the machine until its exit.
- R2 session (EA:7592-7607): `SessionAlreadyUsed(sess, barTime)` -> SESSION_LIMIT print + return - a fired window consumes its session; all further candidates in that window suppressed until the next window.

## 2. Exhibits (journal)
- MTEXIT 7 rows (4 old + 3 new): DH 10:35-fire exits 10:40 TP_TOUCH (entry 1.16265); FL 10:05-fire exits 13:25 TP_TOUCH (entry 1.16205); OD 16:40-fire exits 17:05 POI_BODY_BREAK (entry 1.16213); 4 originals unchanged.
- SESSION_LIMIT 4->7 (+3, all post-new-firing: 09-04 10:45 LONDON, 09-08 10:15 LONDON, 09-08 16:50:01 NYAM; the 4 originals identical).
- SUPPRESSED-HELD rows (e.g. 09-08 16:40 heldDir=SHORT heldState=S4_ARMED action=HELD): the detector still fires while busy - seeds gated, detector not dead.
- A6REFUSED 59->52 (-7 = 3 fired-now + 4 never-born). Arithmetic closes.

## 3. Per-seed attribution (the four missing births)
| seed | R40 fate | R41 cause | signal effect |
| 09-04 10:40 | born, A_OPP (no eval) | occupancy: DH held to 10:40 exit | NIL either way |
| 09-08 16:45 | born -> 16:55 eval -> would fire | occupancy: OD held 16:40->17:05 | IE cannot fire (load-bearing) |
| 09-08 17:05 | born, C_TOUCH (no eval) | session: NYAM consumed 16:50:01 | NIL either way |
| 09-08 17:25 | born, A2_CLOSE_BREAK (no eval) | session: NYAM consumed | NIL either way |

## 4. Uniformity control (pre-existing, not new)
R40 shows the same rules on original firings (08-28 10:10 / 09-04 16:05 / 09-07 09:25+16:50 LIMITs; post-10:00-fire birth gap until 14:10). The desk model never propagated firing->occupancy/session; the code always did. Mechanism uniform old-vs-new.

## 5. Conclusion + correction
Suppression is a filed-rule consequence (R1+R2), not a second defect and not a new firing-dependent rule. IE absence is lawful under filed rules. CORRECTION of ledger 269: its "LAND-ADOPT DEAD" overstates - LAND-ADOPT's mechanism claim (consumed seeds, no halt on that ground) is now evidenced as substantially correct; its naming (16:45:01 signal = IE) and its LAND ask remain council business, still unauthorised. Desk-prediction practice stands criticised (Sonnet pattern holds): propagate occupancy+session on every future register or drop row-independence claims.

## 6. Files/locks
This finding (no new run; journals already archived). RECON17 frozen; BFAE4F4B uncommitted. NO build/run/commit.
