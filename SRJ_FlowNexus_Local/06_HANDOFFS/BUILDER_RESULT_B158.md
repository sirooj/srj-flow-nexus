# BUILDER RESULT B-158 - your 9:20 kill line measured beside the machine's middle on every XOB; no trade moves

Trader summary: your 9:20 zone was killed by the machine on the 09:40 candle at the exact middle 1.16243, while your words put the kill line higher - at the 09:20 open 1.16255 on the record's old rule, and at the 09:20 close 1.16256 on your body-close words read literally. On either of your lines your zone lives through your 16:55 confirmation (it dies 17:25) and the machine's own rule would then pick it ahead of its 3 September zone on both your confirmations. But your line is shared everywhere inside the machine: the same kill that ends a zone also feeds the 5-minute bias counts, the flips and the 2xOB state your stops now ride on, so no narrow fix can move your zone without moving those too. Every one of your valid takes still shows a zone under all three lines, the 4 June short shows none under any, and every machine pick stays alive exactly as kept at every arming and confirmation bar. Nothing was changed, nothing was run, and no question is carried.

## Relay order (B-158 XOB-LEVEL-0908 1 of 6: his kill line on every XOB, MEASURED-or-RESTORED)

- Part 0 on builder/B-157 at b2bb142030bc0131b41e11f2d3dfe1e37e2f4c98 (backup ls-remote verified exact; builder/B-158 cut here). Branch fact from disk after cut: HEAD builder/B-158 at b2bb142; re-checked before commit below. Push via backup only.
- Skills loaded whole in order (relay, then strategy; .agents stub never opened).
- Reads: pointer; RESULT_B157 + SLICE_B157 whole; RESULT_B153 + SLICE_B153 whole; RESULT_B147 + SLICE_B147 whole; RESULT_B150 Part B/W (O1-O4); FINDING_XOBSUIT-1 sections 1 + 6; RESULT_B144 + B145 + B146 whole; spec v4.2 whole (396 lines); register whole; PLANNER_CONTEXT + PLANNER_HANDOFF whole; INDEX_B157 + both DEALS + both SETUPS; greps: journal (kill-level 4 hits), ledger (T161N/pure-midline 1, midline-rule line 6909), AGENTS.md 0, .clinerules 0.
- Names per 0.4: kit PK-2; kept EA 1617DC1ACCE6B50ED2D1359582A70A8B8503C569623EE90C18C6B33542796207 + EX5 187A7202BF0B45F294659FA089DF0581063740B4758E3517C5C3DC28893FB12E; indicator src 1009A4EFEA10D96D7AEAFF26E3489ED80F40C891940D783D77EF34331C9FF6BF / ex5 A5EB81B6ED1B347D2EC75E7852F3928159949E61387A9D68B598E1A8227D0033; OrderblockMgr 5D14FCE25D18A1ED6BF5053584071FDAB7090FC7D9D0130011E2C594C7C2B11F (= .preB150 copy, never edited); MARKER 79859EDC/f0890c0b not located by grep in EA/indicator/includes (reported, no STOP: no file claims it); runs RECON62-B157 (20261010.log 2542403-2828855) + JUNE0525-B157 (2828855+); code history 9861414 (parent, old level) + d96fd5f (pure-midline); his 9:20 XOB = 3293 (range + promo match); machine pick A6/A7 = 2898 1.16362-1.16377 promo 3 Sep 21:35 (SETUPS_RECON62-B157); b147_r2.ps1 + b147_r3.ps1 FOUND in Temp/opencode (read whole, quoted in slice); no B158XL anywhere (pre-grep 0); journal 1072 lines.
- Start gate: log-1 = b2bb142; status 674 lines (dirty tree preserved); diff vs b2bb142 EMPTY over every 0.3 file + ledger + both skills + journal + register; disk SHAs match 0.4 (EA + EX5 full; indicator/orderblock ex5 by prefix); no terminal64; result-against-commit CONTEXT B157-LAST-WRITE-WINS 1 + relay B-157 1, HANDOFF - B-157: 1, ledger ^1302. 1 with B157 tag, register B-157 KEPT 1, pointer latest B-157; pre-greps ^1303. 0, B158- 0, XOB-LEVEL-0908 0, B158XL 0. No STOP.
- Scope: reads of kept EA/indicator/includes + history; offline scans of B-157 log blocks + committed packs + on-disk artifacts; text-record edits in Part X/F only. No EA edit, no print, no run (R2a passed, so R2b never opened). No tolerance/buffer/number; no kill line chosen; no question. Legal results used: FOUND, NOT FOUND, SAME, DIFFERENT, MET, NOT MET, SEPARATES, ACCOUNTED, UNKNOWN, SHARED, STOP (none hit).

## Part B - banking

- No new rule words. Grep-first; append nothing. Quotes with strategy-skill line numbers from disk:
- OB-LEVEL-HIS (Ruling 2026-10-10 (B-146), skill L230-233): his kill level is the invalidation level, not always 0.5; extreme body closes move it; 9:20 level above midline; 0.5 may break while the level stands.
- 0908-NY-XOB-0920 (Ruling 2026-10-09 (B-143), skill L225-228): his 8 Sep NY in-play XOB is the 9:20 XOB (thicker red line); machine pick 1.16362-1.16377 is NOT his zone.
- KILL-FIRST + ENFORCED-TIGHTLY (Orders 2026-10-10 (B-150), skill L235-239): 4 June short must go first; EA fires without knowing the XOB behind the setup (4 June + 8 Sep NY named).
- XOB-ABSENCE-FIRST (Ruling 2026-10-09 (B-141 addendum), skill L219-223): 4 June XOB absence ranked the bigger defect; HTF accepted.
- NO-CASCADE (Ruling 2026-10-08 (B-91), skill L201-205): each re-explanation scoped to its own rule; every reading graded on the full register.
- REFINEMENT-PHASE SCOPE (skill section 6, L100) + SETTLED-RULES-RIDE-EVERY-REFINEMENT (section 6, L99): narrow edits only; every refinement audited against settled rules first.
- NO-OVERFIT (skill section 2, L60): rules apply as-is win or lose; no window-fitting.

## Part R - reading (kept 1617DC1A; every row carries run + EA SHA + log file:line or pack line)

### R0 B-147 against itself: ACCOUNTED (candidate filter, named)

- B-147 R2 keeps 3293 alive on the old level through 16:55 (formation 09:20 o=1.16255, level 1.16255, no later close above). B-147 R3 lists OLD sets at A6/A7 without 3293 and calls MACH/OLD identical.
- Cause from the R3 script on disk (b147_r3.ps1:74-75): the EU pool is `XOBDIAG_RECON62_EU_TARGETS.csv` rows with `barT == C-minus-one AND dir AND promoted == 1`. Grep over the 1446-line file: objId 3293 appears 0 times anywhere. 3293's 7 lifecycle rows exist only in XOBDIAG_RECON62_INCREMENTAL.csv (barT 09:25-09:55: valid 1->0, promoT 09:40, invalT 09:40). So 3293 never enters the R3 pool under any kill line: the OLD OldKill test (script :86, from validation wall) and the touch test (:89, from promoT) never execute for it. The "identical sets" claim is true inside the pool and vacuous for 3293.
- The named wrong part: B-147 R3's candidate pool silently drops MID-killed objects before the OLD line is applied (valid=0 rows mostly absent from TARGETS; INCREMENTAL stops printing 3293 after barT 09:55). R2's standalone BARMAP computation stands. Nothing from B-147 R3's OLD column is relied on for MID-dead objects; this relay re-grades every XOB from the full universe instead.

### R1 every reader of the XOB kill line: SHARED (raw lines in slice)

- Kept level: OrderblockMgr.mqh:37-40 (`mid=(obHigh+obLow)/2`, charter-9 comment, `invLevel=mid`); NewOrderblock :62-70 (mid + invLevel=mid passed together).
- Kept kill test, strict both sides: replay :124-133 (`barClose<level` bull / `barClose>level` bear), gated on prior-bar activation (:122 `!didActivate`); live :500-515 (same strict pair :504-506; skips validation-same bar :509 and creation bar :510-512). Testing starts at activation (validationBar); the validation wall B-147 names is :509/:122 + boundary :744-746.
- Classes: (a) ZONEPICK EA:8982-9004 (selected-zone buffers 22/23, FVG-first tiebreak 9003-9004); (b) in-play commit EA S3INPLAY/XOBINPLAY/INPLAYCOMMIT (9082-9093, 9160, 9239, 9403); (c) B129 retest-candle XOB touch EA:2551-2569 (uj60_tR AND uj129_xt from buffers 22/23/33); (d) B153 PROMO store (indicator buffers 48/49 + EA:9833-9836 trade-direction read, zoneSrc idiom 9827); (e) 5m bias engine: kill event BOTH invalidates AND counts (OrderblockMgr :575-588 ThisBar increments inside the kill block; :616-646 aggregation into bullish/bearishOBInvalidationCount) read by BiasEngine.mqh:157-165 driving renewal/flip/isDoubleOB (:214-250, :264-299), exported as buffer 50 (indicator:1553) and read by the EA stop override (EA:10790); spec 1.1 L47 confirms the LTF bias is driven by these counts; (f) HTF SRJ_HTFEngine.mqh:191-192 (same strict test on separate HTF OB records); (g) other: draw recolor/extend, prune cap, panels display (no kill decision).
- Deciding question: SHARED. The 5m bias engine counts the SAME COrderblock objects on the SAME ob.invalidationLevel: one kill event sets isValid=false and increments the same bar's invalidation counters; no separate copy of the line exists on the bias path. A kill-line change cascades to zone pick, in-play, retest touch, PROMO store AND bias counts/flips/2xOB (the B-157 stop branch).

### R2 per-XOB lifecycle: R2a FOUND, R2b never opened

- R2a passes on XOBDIAG_RECON62_INCREMENTAL.csv (346247 rows) + XOBDIAG_JUNE_INCREMENTAL.csv produced by the B101FULLWINDOW binary (indicator .B101FULLWINDOW SHA 45682CAB1666773D8C02D315D8ED0FA5B0DC8E985B502B862AE2640BFC332E55): full normalized diff vs kept 1009A4EF = 124+/104- hunks confined to header/decl/OnInit/OnDeinit/export regions, zero added/removed lines matching any lifecycle keyword; pass-call blocks byte-identical (B101FULLWINDOW:1121-1153 vs kept:1047-1079); SRJ_OrderblockMgr.mqh byte-identical (live = .preB150 = 5D14FCE2). XOBDIAG/B97PROV/B-110 payloads located (00_CURRENT_WORKING/XOBDIAG_*.csv + Indicators .B97PROV/.B110PAYLOAD).
- Self-proof (B152-PRINT-PROVES-ITSELF): 3293 INCREMENTAL rows give promotion bar 09:40 (1788860400) + kill bar 09:40 (1788860400), first shown on barT-09:35 row = B-144's 09:40/09:40 with the B-144 stamp rule; B-157 B152PR trade-direction verdicts at the 12 close-state bars reproduce B-153 R1 12/12 (A1 bear=1; A2-A5 bull=1; A6/A7 bear=1; B2/B3/C-06-03 bull=1; C-06-04 bear=0; C-05-27 bull=1 beside; 20261010.log B152PR rows); kept z1 zone sets = the R3 MID sets below plus pre-window-touched extras (1389/1481/1484/1516 at A6/A7), matched by range+promoT; 2217 absent from kept z1 (promo-candle-only touch, exclusive bound as specified). No miss: R3 graded from both windows. R2b (print run) never opened: R2a passed and R2b runs only if R2a fails.

### R3 his kill line beside the machine's: all three lines SEPARATE (OLD/HIS with one named boundary)

- Lines per XOB from the formation candle: MID = kept pure midline; OLD = bearish max(mid, formation open) / bullish min(mid, formation open) (parent 9861414 :39); HIS = bearish max(mid, formation close) / bullish min(mid, formation close) (his B-146 words literally). Kill candle = first close strictly beyond by the kept test, scanning strictly after validationBar. Candles = B-157 UJBARMAP (20261010.log blocks above): EU 2880 bars 8/26-9/08, UJ 4032 bars 5/25-6/11.
- 3293: S 1.16256-1.16230, form 09:20, promo 09:40, MID 1.16243 kill 09:40; OLD 1.16255 kill 17:25; HIS 1.16256 kill 17:25. Alive at A6 + A7 under OLD/HIS (first post-promo touch 09:45).
- Cascade census: EU 1236 XOBs (1008 graded, 24 never-validated, 204 formation before B-157 bars); kill differs MID-vs-OLD on 35, MID-vs-HIS on 384. UJ 1672 (1461 graded, 23/188); differs 44 / 484. Named alive-where-MID-dead at register candles (range, formation, promotion, kills in slice): OLD-only: A1 {1866}, A6/A7 {1866, 3293}; HIS-only: A1 {1866, 2054}, A3/A4/A5 {2693, 2740}, A6/A7 {1866, 2054, 3293}, C-06-03 {2798}, C-05-27 {2120}; B2/B3/C-06-04 none.
- Register table (pack lines INDEX_B157; sets = promoted + alive at C + post-promo touch in (promo, C]; full id sets in census): A1-A5 MET all lines; A6/A7 MET all lines with 3293 in OLD+HIS sets (MID sets: 1704,1728,1784,2109,2149,2896); B2/B3 MET all lines (2566 MET at B2/B3, correctly absent at C-06-03); C-06-03 MET all lines; C-06-04 NOT MET all lines (empty); C-05-27 MET beside. Machine picks (SETUPS B-157 ZONEPICK rows) alive at C under every line on every row.
- OTHER-GATE with B-157 killing pack lines: B1 (JUNE0525-B157_W2:9305+9411+9445+9507, SEEDBIAS_REFUSED), C-06-02 (W2:3492, confirm=0), C-06-10 (W3:7376|7377, S54KILL), C-08-27 (RECON62-B157_W1:3704, confirm=0), C-09-01-1530 (W2:3217|3220|3223, LTF_MISALIGN), C-09-04-1040 (W2:8778, confirm=0), C-08-28-1625 (W1:5971|5974|5977, TP_RR_FAIL), C-09-08-1645 (W3:4593, TP_RR_FAIL).
- Column verdicts: MID SEPARATES (unconditional, kept full-history rows). OLD SEPARATES on the graded universe with 3293 in A7's set; boundary: 6 pre-map S touchers at C-06-04 (1720,1629,1748,1733,1558,1616, all MID-dead) whose OLD kills are UNGRADED from B-157 bars (formations pre-5/25). HIS SEPARATES with the same boundary and 3293 in A7's set. (Graded-universe C-06-04 sets are empty under both lines: OLD-only 0, HIS-only 0.)
- Pick census: machine pick alive-state SAME under OLD and under HIS vs MID at arming + confirmation on every kept deal and every zone-step ruled-out row (17/17 SAME: A1-A7, B2, B3, C-06-03, C-05-27 beside, B1, C-06-10, C-08-27, C-09-01-1530, C-09-08-1645). The kill line moves no pick anywhere.

### R4 selector: FOUND (code picks 3293 over 2898 under OLD/HIS)

- Rule: indicator:1236 `SRJ_NearestPromotedOBIndex(g_s.currentBias)` ("nearest valid+activated+promoted in-bias OB, ANY age" :1227); definition OrderblockMgr:1084-1106: side match (:1095-1097) + must be XOB (:1098) + still valid (:1099) + still activated (:1100), winner = max startBar (:1102).
- At A6 (10:05) and A7 (16:55), direction SHORT: 3293 (startBar 9/08 09:20, promoted 09:40 machine event, activated 09:30, OLD/HIS-alive) vs 2898 (startBar 9/03 20:30, alive all lines): 3293 newer on every filter, so the code's own rule picks 3293 over 2898 under OLD and under HIS at both candles. Simulation on the measured universe confirms (and reproduces the machine's 2898 pick under MID, validating the method). No newer qualifying XOB exists at either candle under either line (3296/3334 unpromoted; 3298 OLD-dead 16:00 at A7, unpromoted at A6; 3324 OLD-dead 15:30).

### R5 next relay (one line each, from R1-R4 only)

- OLD: R0 MET (ACCOUNTED); R1 NOT MET (SHARED, no separate bias-engine copy); R3 MET-bounded (SEPARATES on graded universe with 3293 in A7's set; 6 UNGRADED pre-map S at C-06-04 named); picks MET (SAME every kept deal). Not a trial candidate (R1 fails). No edit drafted.
- HIS: R0 MET; R1 NOT MET (SHARED); R3 MET-bounded (same boundary); picks MET. Not a trial candidate. No edit drafted.

## Part X - records (grep-first, append once, verify count 1 each)

- X1 CONTEXT section 4 after B157-LAST-WRITE-WINS (verbatim). Count 1.
- X2 CONTEXT section 5 (verbatim). Count 1.
- X3 HANDOFF section 3 after - B-157: (verbatim, MEASURED filled). Count 1.
- X4 ledger 1303, tag B158-XOB-LEVEL-0908-READING (R0-R5 tables, R2a diff proof, self-proof rows, verdicts). "^1303." = 1.
- X5 pointer (35-line cap): latest B-158; kept SHAs unchanged; Lane XOB-LEVEL-0908 first B-158 1 of 6; STOP-BASIS CLOSED KEPT B-157; KILL-0604 + XOB-0604 CLOSED kept; SILENT6 parked kept; O3 pending kept; Next: per R5 (no trial candidate); goal open.
- No register change (no trade moves in this relay).

## Part F - file, push, reply

- F1 this result. F2 slice (R0 script lines, R1 raw lines, R2 self-proof rows, R3 tables with pack lines, R4 selector lines; under 600 lines). Census (per-XOB kill tables, 2960 lines, 460928 B) committed.
- F2b none (not KEPT).
- F3 ledger 1303. F4 pointer.
- F5 stages result, slice, census, ledger, pointer, PLANNER_CONTEXT.md, PLANNER_HANDOFF.md. Never EA/indicator/includes/ex5/TEMP scripts/logs/inis/profiles/charts/artifacts.
- F6 branch re-check from disk, commit, push via backup, ls-remote check. Reply MEASURED, no carried note.

## Final disk state (MEASURED turn; B-157 kept build on disk, verified, terminal idle)

- EA src 1617DC1ACCE6B50ED2D1359582A70A8B8503C569623EE90C18C6B33542796207 + EX5 187A7202BF0B45F294659FA089DF0581063740B4758E3517C5C3DC28893FB12E; indicator src 1009A4EF + ex5 A5EB81B6; OrderblockMgr 5D14FCE2 (never edited); no terminal64; no .preB158/.B158XL (no R2b: R2a passed, zero source diffs). CONTEXT +2; HANDOFF +1; ledger +1 (1303); pointer rewritten; census + result + slice new. No source/ex5 committed.

(No carried note - no question goes to him.)
