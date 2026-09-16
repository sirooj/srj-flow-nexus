# RELAY v117 - CORRECTED WINDOWS (fresh-safe, SAME-PROMPT both seats)

**Version:** v117 (corrects v114/v116 window error on Sonnet catch; follows Luna `LUNA-V116-GAP-TP-DISPOSITION-001` + review-seat check, whose TP/suspend rulings stand untouched). **Fresh-profile-safe:** base + correction + source ALL INLINE. Tree unchanged (`BFAE4F4B`/591933 uncommitted; RECON17 frozen). **Paste set:** this relay ALONE (both seats IDENTICAL asks). Return whole verdicts/reviews with model + date + Ruling-ID, one source per message. His part: transport only.

## 0. Base (complete)
- Standing: suspension on TP/outcome grounds (V116 dual-key); R-GATE-ONLY rule named; shadow stands; 10:10 unrealized; all words SPENT. This relay does NOT re-ask TP and does NOT ask any lift.
- Sonnet v116 catch (keyless review, checkable, UPHELD by builder on disk): the v115 code gates SESSION_LIMIT behind IDLE (EA:7589), yet the finding claimed occupancy spanning fire-to-exit alongside the 16:50:01 print - inconsistent. Verbatim core: "if OD is still occupying the machine at 16:50:01 (exit not until 17:05), then per line 7589 the machine is NOT idle at 16:50:01, and the code as shown couldn't have printed SESSION_LIMIT at all... One of the two closed gaps is still open." Full text filed `06_HANDOFFS\BUILDER_VERDICTS_SLDEF4-5.md`.
- Builder OWNERSHIP: v114/v116 stated occupancy as fire-to-MTEXIT. WITHDRAWN. Tracker lifetime (fire->MTEXIT) is NOT occupancy. Corrected windows below; prior conclusion (IE lawfully absent) stands, mechanism description corrected.

## 1. CORRECTED mechanism (source inline, byte-exact pulls)
### Fire path frees + marks same tick (EA:9913-9922, alert-only branch - this run's mode)
  9913:       if(InpMode == MODE_ALERT_ONLY)
  9914:         {
  9915:          PrintFormat("[SRJ-EA] ALERT_ONLY mode - no order sent. Session %s marked used.",
  9916:                      SessionName(g_sessionAtEntry));
  9917:          MarkSessionUsed(g_sessionAtEntry, g_anchorBarTime);
  9918:          ENUM_SRJ_STATE prevA = g_state;
  9919:          g_state = ST_SIGNAL;
  9920:          LogState(prevA, g_state);
  9921:          ResetSequence();
  9922:          return;
### ResetSequence frees (EA:6181-6184)
  6181: void ResetSequence()
  6182:   {
  6183:    g_state          = ST_IDLE;
  6184:    g_dir            = DIR_NONE;
### Read: at fire, session marked used (EA:9917) AND machine freed same tick (EA:9919 via EA:6183). MT monitor/tracker runs INDEPENDENTLY to MTEXIT. Occupancy = seed-bar -> fire-tick. Next-open evaluation: bar N seeds are evaluated at N+5 open (BIRTH bar=16:30 stamped 16:35:00; BIRTH bar=10:35 stamped 10:40:00).

## 2. State-timeline proof (full journal rows, R41 order)
[SRJ-EA] 2026.09.08 16:35:00 STATE IDLE->S1_REGIME dir=SHORT poi=Monthly-POC
[SRJ-EA] 2026.09.08 16:45:01 STATE S4_ARMED->S5_GATE_CHECK dir=SHORT poi=Monthly-POC
[SRJ-EA] 2026.09.08 16:45:01 STATE S5_GATE_CHECK->SIGNAL dir=SHORT poi=Monthly-POC
[SRJ-EA] 2026.09.08 16:50:01 SESSION_LIMIT: NYAM window already used today - all further candidates suppressed until the next window
[SRJ-EA] 2026.09.04 10:40:00 STATE S5_GATE_CHECK->SIGNAL dir=SHORT poi=Daily-POC
[SRJ-EA] 2026.09.04 10:45:00 SESSION_LIMIT: LONDON window already used today - all further candidates suppressed until the next window
### Read: OD held 16:30(seed)->16:45:01(fire), freed+marked at fire; 16:45-bar seed evaluated 16:50:01 = IDLE + NYAM-used -> SESSION_LIMIT (the print Sonnet proved impossible under the old window - REQUIRED under this one). DH mirror: freed+marked 10:40:00; 10:40-bar seed evaluated 10:45:00 -> SESSION_LIMIT. 17:05/17:25: session-silent. R1 evidenced by mid-flight HELD rows (16:35 S1, 16:40 S4 - before council in v115).

## 3. Asks (IDENTICAL both seats)
- **Ask-1 CORRECTED-WINDOWS?** Occupancy = seed->fire (free+mark same tick EA:9917-9921/6183); tracker independent; session evaluated next-open. Correct-or-correct per line.
- **Ask-2 GAP-AND-BLOCKER?** (a) per-seed gap closed on corrected windows AND suppression removed as suspension basis (TP sole remaining blocker); or (b) gap/blocker stands with named defect. No band-aid, no smoothing; naming stays distinct.
- Threshold: filed-authoritative, R>=1.0, A+ strict, alert-only. Locks: RECON17 frozen; build uncommitted; all words SPENT.

## 4. Branches
- Confirm (a) -> suspension rests on TP alone; exit-audit packet next. Confirm (b) -> QUIESCENT as-is. Amend -> one closed-set re-ask. Split -> ONE closed-set re-ask.

(End - v117 awaits verdicts + Ruling-IDs; nothing builds/runs/commits/spends here.)
