# BUILDER SLICE B-53 - raw rows behind W, R1, M1-M3 and S1-S2 (payloads only; no EA edit/compile/launch/run)

## 0.4 gate (diff-empty proof + disk SHAs)
- git diff 49b1ee0 -- pointer/RESULT_B52/SLICE_B52/register/ledger/journal/strategy/both-relay-skills/PLANNER_CONTEXT.md: EMPTY.
- Disk: EA 63B18C1F / ex5 B0D4AA9E; FlowLogic 956BF3E3 / ex5 27B5F272; BiasEngine 3B1D9D3D; OrderblockMgr 5D14FCE2; Draw FD2B3716; HTFEngine D5FD5B06; terminal.ini 450ACB4A; j24 AC07557F (52748 lines); j23 75B7321C (79267 lines). All MATCH.

## W1/W2 replacements + W3 SHAs
- W1a count 1, W1b count 1 -> both applied (header date + section-5 history date, both to 2026-10-06).
- W2 two lane-rule lines appended before "## 5. History".
- W3 SHAs: PLANNER_CONTEXT.md 7deac0d6 (4568 B) -> after W1+W2 (computed at filing); PROMPTQL 4bd72366 (8970 B, untouched B-53).

## R1 grep hits (strategy skill; section title + ruling lines)
- §1:24 Normal take-profit: "touch exits on session-liquidity, POC, or VWAP targets (touch of the booked TP target; per-bar nearest touches that are not the booked target do nothing)." (targets: booked only; nearest non-booked touches do nothing.)
- §1:30 9/7 London TP SETTLED: "booked should be AS.H nearest, not the further yearly VWAP" + "nearest valid TP wins, family/category disregarded". (targets: nearest valid.)
- §1:32 MANAGE-NEAREST + REVISION-SOURCE-ONLY: "always exit on the nearest valid target in management" + "The anchored-volume-profile POC lines and their VWAP siblings are NOT revision sources at any level"; "only the current session close that could revise the TP to a nearer target". (targets: nearest; POI lines never revise.)
- §1:33 RETARGET-CLOSED-AM + SYMMETRY-NEAREST: "once a session is closed, a floating trade can retarget that new session high or low as a valid tp target as the nearest". (targets: closed-session extreme, nearest.)
- §2:46 SWEEP-THEN-RETEST: "session liquidity swept earlier, then the W POC retest happened latest" + "the post-sweep retest is the trigger". (entry trigger: latest retest.)
- §2:47 micro-lines "skipped as swept (validity exclusion working)". (skip: swept.)
- §2:48 Retest renewal: "a valid retest hit by session liquidity before 5m retracement + confirmation is void; entry needs a fresh POC/VWAP retest". (skip: liquidity-hit retest.)
- §3:66 TP booking: "the booked take-profit target is the nearest valid target; family/category disregarded". (targets: nearest.)
- §5:77 9/1 VALID: "9/1 17:35 NY LONG Monthly-VWAP R1.17 is VALID". (instance: Monthly line traded.)
- §5:82 FRESH-SWEEP RULE: "previous-day lines count toward TODAY's mean-reversion setups ONLY if freshly swept in the same session of the current day; stale-swept lines are dead map". (skip: stale-swept.)
- §5:89 NEAREST-ONLY-TP: "book the nearest line and refuse ONLY below 1R". (targets: nearest.)
- §5:94 OWN-SOURCE-EXCLUSION: "a trade never books a target at its own origin lines" + "POC outranks VWAP in booking validity". (targets: never own-source; POC over VWAP.)
- §9:121 RETARGET + DAY-CLOSE-FALLBACK: "the trade tp exit should be the current session high when it's closed which is nearest". (targets: nearest closed-session.)
- §10:126 TAKEN-LINE-NOT-A-TARGET: "A target is valid unless (a) already swept as session liquidity, or (b) closed over" + "a session high/low already taken before the decision bar is never a booking target". (skip: swept/closed-over.)
- §11:130 W1 + :136 8/27-NY-INVALID + :137 POC-OVER-VWAP-SCOPE: "POC outranks VWAP ONLY in the gap case" + "outside that case POC rank never removes a VWAP from the target race; a VWAP that is the nearest valid line is the booked target". (targets: nearest; POC-over-VWAP gap-only.)
- §12:144 GAP-DEFINED + :147 8/27-NY-ORDINARY: "it stays in the ordinary target race, and POC rank never removes it". (targets: ordinary race.)
- §15/Ruling:166 ANS0506: "5 June NY Long, the entry line POI was based of the M POC and M VWAP (the highest is Monthly but it also the W) at 16:00." (his entry POI = M POC + M VWAP stack.)
- RULES_LINEPICK = FOUND (§3:66 nearest; §5:87 POC-SUPREMACY + :94 own-source; §11:137 gap-only scope; §2:46 latest-retest trigger; §5:84 ONE-TAKE tier-wins contention; §15:166 his M-stack naming). Honest note: no pin names a single winner for a stacked ENTRY POI - nearest is targets-only, tier-wins is contention-only, latest is trigger-only; his own answer treats the M POC + M VWAP stack as the POI.
- RULES_FRESH = FOUND (§5:82 stale-swept dead; §2:48 liquidity-hit retest void; §10:126 swept/closed-over never targets; §2:47 swept micro-lines skipped).

## M1 j24 15:30-16:20 rows (JUNE-B38_JOURNAL.log;zone family: S3INPLAY H/L/C, XOBINPLAY zone, INPLAYCOMMIT, SL_REF, UJPOISKIP, FRESHSKIP)
20457 QN 0 10:22:46.635 Core 04 2026.06.05 16:05:00   Alert: USDJPY M5 - POI RETEST LONG at 159.945  [D-POC +1]
20491 JS 0 10:22:46.635 Core 04 2026.06.05 16:05:00   [SRJ-EA] S3INPLAY bar=2026.06.05 16:00 dir=LONG inPlay=0 via=none zoneLo=0.000 zoneHi=0.000 barLo=159.726 barHi=160.262 close=160.034 sw1=-@-1 sw2=-@-1
20472/20482/20485 (16:05 pass): STATE IDLE->S1->S2->S3 LONG Daily-POC (seed promotes; S2PROMOTE_M15 via reseedBar=2026.06.04 17:00 reseedDir=1 exempt=1, j24:20483-20484; ltf=-1.0 j24:20462).
20495 (16:05:00): S3 waiting: no qualifying zone. 20507 (16:10): FRESHSKIP LONG S3 Daily-POC PRE_BINDING. 20614/20617 (16:10): UJPOISKIP line=Daily-POC anchor=Daily-POC (x2, target-walk skips).
20633-20636 (16:10): RETESTBOOK 16:05 hits=0; UJDTTERMS Daily-only no-penetration; RETESTDIAG inside=- nearBelow Daily-VWAP:25.8pts; CONFIRMPOLL 16:05 anchor Daily-POC LONG confirm=0.
20641 (16:10): S3INPLAY 16:05 barLo=159.992 barHi=160.086 close=160.008. 20650 (16:10): S3 waiting: no qualifying zone.
20781-20784 (16:15): RETESTBOOK 16:10 hits=0; UJDTTERMS Daily-only; RETESTDIAG nearBelow Daily-VWAP:13.1pts; CONFIRMPOLL 16:10 LONG confirm=0.
20789 (16:15): S3INPLAY 16:10 barLo=159.981 barHi=160.062 close=160.058. 20798 (16:15): S3 waiting: no qualifying zone.
20928-20931 (16:20): RETESTBOOK 16:15 hits=0; UJDTTERMS Daily-only; RETESTDIAG nearBelow Daily-VWAP:51.4pts; CONFIRMPOLL 16:15 LONG confirm=0.
20936 (16:20): S3INPLAY 16:15 barLo=160.022 barHi=160.082 close=160.073. 20945 (16:20): S3 waiting: no qualifying zone.
15:30-15:55 RETESTBOOK bars 15:25/15:30/15:35/15:45/15:50 all hits=0 (j24:20398/20417/20423/20439/20446); 15:55-bar hits=0 (j24:20454).
21987/22317 (16:55:00): STATE S3_ZONE_WAIT->S5_GATE_CHECK then S5_GATE_CHECK->SIGNAL LONG Daily-POC (same 16:00-seeded candidate fires, entry 16:50 bar). 22300 A6FIRED bar=16:50 tp=160.723 r=1.56 sl=159.726; 22311 deal #6 buy at 160.120; 22316 ENTRY_TICKET bar=16:50.
- BLOCK_0506: no row ends the 16:00-seeded LONG candidate on j24 (no ABORT/YIELD/close rows 16:05-16:55 for it); it fires at 16:55 (S5->SIGNAL j24:22317, deal #6). The reason his 16:15 never formed: RETESTBOOK hits=0 + confirm=0 at 16:10/16:15 bars while the live candidate sat in S3 zone-wait (FRESHSKIP PRE_BINDING, S3 waiting rows above).
(Zero Monthly/Weekly POC/VWAP rows anywhere 15:30-16:55 in j24.)

## M2 code spans (located by text; line numbers this report only)
a) Retest scan loops all 12 (EA:2105 `for(int k = 0; k < POI_NLINES; k++)`, best-rank single winner EA:2122-2125). SCAN_LINES = all 12 (FOMC/Y/Q/M/W/D x POC/VWAP).
b) Alert names best rank + count (POI_Marker:1373-1394 insertion sort by RankOf, topLine=hits[0]; :1461-1469 `[%s%s]` + `+%d` for n-1). "[D-POC +1]" = D-POC best + 1 more (D-VWAP r11 vs r10). Marker scan loops all NLINES=12 (:181-182, :1522) with the same wick+body test (:1529/:1536). NAMED_LINE_RULE = best-rank line + hit count.
c) FRESHSKIP PRE_BINDING (EA:7582-7587: prints when S2<=state<S4). Plain: freshness observed but not yet binding before arming.
d) UJPOISKIP (EA:2620-2628: booking-walk skip when !UjPoiTargetValid or worse tier than anchor tier). Plain: booking skips invalid or worse-tier lines.
e) CANDIDATE_UNIT = one per bar (DetectPoiRetest returns single bestLong/bestShort winner; machine holds single g_dir+g_anchorLine; IDLE-gated seed).
f) UJDTTERMS loops all 12 too (EA:2225-2243, appends every available line; j24 rows show Daily-only => other 10 EMPTY at 16:00-16:20).
- EA:86 POI_NLINES 12; EA:99-100 Monthly 6/7; EA:101-102 Weekly 8/9; EA:103-104 Daily 10/11; TickCore:47 ANCHOR_MONTHLY. EA_POI_LINES = D + W + M.

## M3 levels (run tree j24 CURRENT)
- 16:00 H/L/C 159.726/160.262/160.034; 16:05 159.992/160.086/160.008; 16:10 159.981/160.062/160.058; 16:15 160.022/160.082/160.073 (S3INPLAY rows above).
- MPOC NOT_LOGGED, MVWAP NOT_LOGGED, WPOC NOT_LOGGED, WVWAP NOT_LOGGED (no M/W POI rows 15:30-16:55; scan covers them per M2 but 16:00 alert proves only D lines hit).
- D POC TOUCHED_1600 (alert 159.945 + hits=2 + LHIT; absolute line value not printed), D VWAP TOUCHED_1600 (same).
- MW_VALUES_0506 = NOT_LOGGED_ANYWHERE (j24 15:30-16:55 + B-51 DAYLOG 5 June rows searched; values never printed).
- MW_VALUE_ROUTE = NEEDS_PRINT (no input-gated fuller dump exists: UJDTTERMS already prints every available line each bar and showed Daily-only; TPCENSUS prints pool levels not indicator POC/VWAP; SHADOW switches gate shadow polls not values; planner decides B-54).

## S1 SILENT6 trails (j23; ARM row + same-key rows to next STATE/session end, cap 15)
20243 8/28 17:00 SHORT Daily-POC ARM (j23:20243). After: NOTHING (no S4->S5/ABORT/YIELD/SEED same-key rows through file end; next same-key rows are new-candidate seeds days later).
20381 8/28 17:05 SHORT Weekly-POC ARM (j23:20381). After: CONFIRMPOLL 17:05-bar confirm=0 (j23:20497), 17:10-bar confirm=0 (:20608), 17:15-bar confirm=0 (:20719). Then nothing.
28679 8/31 16:25:02 LONG Weekly-POC ARM (j23:28679). After: CONFIRMPOLL 16:25-bar confirm=0 (j23:28807). Then nothing.
37334 9/02 15:45:01 SHORT Daily-VWAP ARM (j23:37334). After: CONFIRMPOLL confirm=0 on bars 15:45 (:37476), 15:50 (:37623), 15:55 (:37766), 16:00 (:37905), 16:05 (:38046), 16:10 (:38191), 16:15 (:38337), 16:20 (:38491). All confirm=0. Then nothing.
49360 9/04 15:45 LONG Monthly-POC ARM (j23:49360). After: NOTHING same-key.
57444 9/08 10:05 SHORT Weekly-POC ARM (j23:57444). After: nothing until 16:10 re-seed (new candidate S1->S2 :58468-58480, CONFIRMPOLL 16:05 confirm=0 :58466, 16:10-bar confirm=1 :58651 but no S4 row after - that seed never armed).
(30270 9/01 09:20 SHORT Yearly-POC is NOT SILENT6: SIDE1C_YIELD 09:55 to LONG Weekly-VWAP which fired same pass - transfer, counted in B-52 P3.)

## S2 drop-paths (EA text; PRINTS = row it prints, SILENT = no row)
- S4->S5 promotion (EA:9294-9300): PRINTS STATE S4->S5.
- S4 confirm-fail (EA:9301-9305): PRINTS CONFIRM_STRUCT_FAIL, stays S4.
- Freshness 2-of-3 kill at S4 (EA:7589-7596 + GoAbort EA:6643-6676): PRINTS ABORT + STATE S4->ABORT.
- LTF_MISALIGN abort (EA:10674 + GoAbort): PRINTS ABORT + STATE.
- DIV_FALLBACK + evict ARM (EA:9364 + 9371-9373): PRINTS ABORT + EVICTSUPPRESS + STATE.
- SESSION_CLOSED / CONCURRENCY / SUB_1R / memo / TP_RR_FAIL aborts: PRINTS ABORT + STATE.
- R2 renewal to IDLE (EA:8222-8230): PRINTS STATE (LogState :8228) + SEEDVOID (:8229, InpDebugLog).
- S1-reseed supersede (EA:8116 IDLE block + ANCHOR_ELECT): PRINTS SEED rows (old candidate must be IDLE first).
- SIDE1C_YIELD S4 transfer (yield site): PRINTS SIDE1C_YIELD.
- Post-SIGNAL resets (EA:10808-10811, 10912-10916): PRINTS STATE S5/SIGNAL + ALERT_ONLY/SIGNAL rows (after firing, not S4 drops).
- SILENT_PATHS: none found in code - every drop path prints at least a STATE row (ResetSequence never runs bare except via GoAbort/LogState paths above; OnInit reset :11246 is run-start only).
- S3 per-candidate: SILENT_END = UNKNOWN x6 (rows searched same-day + any-date; code searched: no silent drop path exists, yet no close row either).

(End of slice)
