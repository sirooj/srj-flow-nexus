# BUILDER SLICE B-184 - raw spots R1.1/R4.1, table samples

Base: builder/B-184 cut at f7db600 (backup exact; no remote B-184 before push). Read-only; no compile; no run. Python 3.13.16 canonical; one script per job.

## R1.1 raw: CONFIRMPOLL print + live gate (EA 67021D84, located by text)
- :2568-2574 `//--- CONFIRMPOLL: the spec section 3.6 confirmation-candle terms, per bar, as data.` + `//--- confirm = A && B && C. This is the calibration surface for build 2's IsConfirmationCandle; nothing here gates anything.`
- :2575-2601 `void ShadowConfirmPoll(const int barShift, const int anchorLine, const ENUM_SRJ_DIR dir)` ... `bool oppCandle = (dir == DIR_LONG) ? (c1 < o1) : (c1 > o1);` (:2589) ... `bool touch = (h1 >= L - _Point && l1 <= L + _Point);` (:2593) ... `bool confirm = (oppCandle && bodyDir && !isDoji && touch);` (:2594) ... print :2595-2601 (`oppCandle bodyDir body doji touchAttr confirm shadow=true`).
- :2604-2619 live-gate header (P-CONFIRM-GATE E1): terms A (prior closed against), A2 RULED (prior close stays setup-side; wick = retracement, close-through = break; LONG close >= line), B (current closes in dir, non-doji), C (prior touched, +/-1pt guard); failTerm first-failed.
- :2620-2700 `IsConfirmationCandle` incl. A_OPP :2650-2651, B38 A2-RECLAIM :2652-2666 (break-then-reclaim: prior through + current opens/holds setup-side), A2_CLOSE_BREAK :2667, B_BODY :2668-2671, touch :2672 + B-61 retest-carried :2673-2698 (retestShift via stamped retest open; `touch = (touch || (uj60_tR && uj129_xt))` :2698; kept prior line untouched :2685-2686), C_TOUCH :2700, B60C print :2704-2713 (cSrc xt zxob xpromo).
- Sample row: GBP 7/06 17:05 pack 2524 `bar=2026.07.06 17:00 anchor=Weekly-POC dir=LONG oppCandle=0 bodyDir=1 body=46pts doji=0 touchAttr=1 confirm=0 shadow=true` (fails A_OPP first).

## R4.1 raw: holder expiry (EA, located by text)
- :8920-8925 `if(g_state == ST_S1_REGIME) { if((barTime - g_anchorBarTime) >= 3600 && g_anchorLine >= 0) { ... PrintFormat("[SRJ-EA] UJHOLDEXPIRE bar=%s poi=%s dir=%s heldMin=%d ...", ...); GoAbort(ABORT_HOLDER_EXPIRED, g_state); return; } }` (60-minute number; NO PIN per spec 0 + spec 6 + SEED-CARRY L81).
- Pound rows: 7/10 10:50 packs 712/713/714 (Daily-POC SHORT, S1 reg=NONE); 7/13 11:35 packs 993/994/995 (Weekly-POC LONG, S1 reg=NONE).
- Pre-expiry confirmations (FOUND): 7/10 packs 468/524/578/711 (10:05/10:15/10:25/10:50 confirm=1); 7/13 pack 670 (10:40 eval bar=10:35 confirm=1); post-expiry 7/13 packs 2159 (17:10) + 2807 (18:55) confirm=1, session closed 19:05 pack 2840.

## R2 sample (CONFIRMTERMS_B184.csv, 308 rows / 37 seeds; 28 NO-PIN A-adjacency, 8 HIS-RULE, 1 never-touched-in-8)
- B158 reconcile: 19 polls = 7/06 Weekly-POC SHORT (pack 1638); 7/06 Quarterly-POC SHORT = 11 polls (pack 2980).
- F1 17:00 seed: A-only 17:05 pack 2524 (B=1 C=1 A=0). F3 15:00-bar: confirm=1 pack 1592 (needs no removal).
- A-only definition: fails==['A_OPP'] exactly (bodyDir=1, doji=0, touchAttr=1).

## R3 sample (CONFIRMCASCADE_B184.csv, 175 rows; STOPPED-LATER 80, NEW 59, BREAKER-NEVER 17, BREAKER-MOVE 0)
- R3.1 takes: confirm=1 CONFIRMPOLL ABSENT at all 10 take bars (live-gate confirmations; zone rows quoted).
- R3.3 roads: A1 BOTH/0-uncommitted (gap); A2 BOTH/0-BAR (preempt); A3/A4/A5 BOTH/1 (retest-carried); A6/A7 PRIOR/0-BAR; B2 RETEST/1 (hunk-C); B3 BOTH/0-SWING; C-06-03 BOTH/0.

## AP sample (PINS_B184.csv, 9 rows)
- F1: A_OPP first (packs 2452/2524) + unpinned 5m-level kills (ltf=-1.0, no flip) -> UNKNOWN. F2: SEEDBIAS 14:25 (ltf=+1.0 against, pinned) + confirm 15:10 pack 1476 + session-held (his rule) -> UNKNOWN. F3: confirm 15:05 pack 1592 + post-confirm FRESH kill 15:55 pack 1899 (NO PIN) -> NO. F4: YVWAP-ABSENT (whole-run zero, 2 patterns) -> UNKNOWN (adoption-vs-selection needs day-log [POI][SEED] read).
- AP4 code: yearly anchor Jan-1 (TickCore :383-384); adoption triple-match (POI_Marker :2306-2307); Q/Y truncated without seed (:2161-2168); GBPUSD seed exists (Oct 6, 2026 slot present) yet EU prints Yearly-POC with no EURUSD seed on disk.

## S sample (SEPARATOR_B184.csv, 107 rows; SEPARATES 0)
- S-A-ADJ / S-NOEXP / S-NOFRESHPOST / S-5MLEVEL / S-A-5M combined / S-YVWAP-PRESENT (ungradeable): all DOES NOT SEPARATE with deciding rows (15 win=1 must-never rows unprinted-later-gates; F1 DIV latch=0 + zero zone rows; F3 zone/div/1R unprinted-or-absent; C-09-01-1530 zone-stopped win=0 packs 1902/1942; 7/02 SHORT zone-stopped packs 1987/2010).
- R5 fallback (AS3 order): (1) F4/YVWAP day-log read ([POI][SEED] + CKPT_SLOT_META SLOT_YEARLY); (2) silent sessions 7/09 LDN + 7/16 NY first stop; (3) must-keep windows UJ Jun 18-25 / EU Aug 12-25.
(End of slice)
