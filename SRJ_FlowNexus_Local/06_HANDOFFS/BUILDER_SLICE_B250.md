# BUILDER SLICE B-250 - full evidence tables (result holds the compact version)

## Start gate (re-verified 2026-10-17)
- Branch builder/B-250 cut at e3875d2 (verified by git log -1 before T1).
- Status file: SHA-checks MATCH on all 9 G files set (.B250GK) before the first run.
- terminal.ini [Tester] DateFrom/DateTo = 1787702400/1788998400 (RECON62) read back before T1.
- D free 122.7 GB before first launch of the day. No terminal64 left from B-249.

## T1 RECON62-B250G (shadow-bias-view build)
- Launched 04:25:06 PID=13968, PRE_JOURNAL_LINES=1236287, window verified (replay from 2026.08.26).
- DONE 2026-10-17 04:32:24 (7.3 min). ex5 mid-run binary proof: EA E61518B5567B..., Flow 60610357D696... both == .B250GK.
- Cut: job_cut_b247.py RECON62-B250G 1236287 -> scanned 2529150; deals 12 (6 trades); KILL rows 151; S4/RV/ZG/KS/ZS rows 254230; flip bars 500; renewal bars 0.
- GRADE RECON62-B250G raw:
  KEEP entries exact 6/7; KEEP exits exact 5/7; NEVER fires 0; MACHINE-ONLY ungraded 0; trades 6
  A1 ENTRY EXACT 2026-08-28 sell 10:05 1.16466 / EXIT DIFF machine 11:35 1.16467 vs owed 11:35 1.16464 (+3pt)
  A2 ENTRY EXACT 2026-09-01 buy 17:35 1.16024 / EXIT EXACT
  A3 MISSING (2026-09-04 buy 16:00 1.16019)
  A4 ENTRY EXACT 2026-09-07 buy 09:20 1.16138 / EXIT EXACT
  A5 NEVER SILENT; A6 ENTRY EXACT 2026-09-08 sell 10:10 1.16205 / EXIT EXACT; A7 ENTRY EXACT 2026-09-08 sell 17:00 1.16220 / EXIT EXACT
  K2SEP ENTRY EXACT 2026-09-02 sell 14:45 1.15747 / EXIT EXACT
  NEVER rows all SILENT (A5, N4SEP1040, N1SEP1530, N27AUG, N28AUG1625, N8SEP1645, N7SEPSHORT, N4SEP0930)
- Gate 7/7-6/7-0 FAILED (entries 6/7; exits 5/7) -> EU0525TD-B250G NOT RUN per relay.
- Verdict inputs: no new NEVER fires (all silent); no KEEP row better; ONE worse (A3 MISSING). G = RESTORED.
- A1 exit +3pt class matches the kept baseline row (FILL-EXACT B-211 bid/ask spread); not a new deviation.
- Robot note: 8 Oct 11:25 kept-only row basis for Part S lives in the EU window (not measurable here; EU-G NOT RUN).

## Journals observed in the pre-launch log section (accounted, not this relay's)
- Day log 20261017.log carried 1,236,287 pre-lines from last night's run tail; line 1224425 (wall 00:05:10.074, Core 04) = 'array out of range in SRJ_FlowLogic.mq5 (1800,26)' = the g_b176 bear append site that K0c mapped pre-compaction. NOT inside any B-250 run segment (T1 cut starts line 1236288; cutter skips <= PRE).
- The T1 run's own segment had ZERO out-of-range rows and ZERO [B250G] journal rows (code markers in sources only).

## H build (crash guard + F4a proof print)
- CQD copy: SRJ_CQD_TickBased_MT5_B250H.mq5 from .B249FK (copy SHA 80F9BA95 == documented .B249FK source SHA) + one hunk: SWINGPROOF print per verdict write:
  [B250H] bar=<x2 time> id=SWINGPROOF site=V<verdict> x1=<x1 time> writePass=<forming-bar time> newestClosed=<last-closed time>
- FlowLogic: slot guard at both g_b176 append sites (GAPPENDGUARD_B / GAPPENDGUARD_S): pre-check all 10 store sizes equal b176m, then all 10 ArrayResize results must equal b176m+1 or the append aborts with a [B250H] row (bar + slot) and sizes roll back to b176m. Store is print-only, so a skipped append fades GAP_TOUCH/GAP_DEAD rows only; no EA logic depends on it.
- Script: TOOLS/job_h_guard_b250.py (committed); braces before (150,150) after (156,156) = +3/+3 per site; [B250H] markers 6 in FlowLogic (2 per comment line x 2 sites + 2 guard prints), 1 in CQD copy.
- Compiles: FlowLogic 0 errors / 3 pre-existing type-conversion warnings (1598/1884/2067; same class as G compile's 1598/1820/2003, shifted by the +26-line hunks); CQD copy 0 errors / 0 warnings (1506 ms).
- .B250HK 11 files saved + verified before any restore: EA 0A6AFFAF/E61518B5, Flow 31F2DB31/268464B1, CQD 526033D3/236F104E, includes = G ones (Types 34A5DC1B, State DEBABF36, OrderblockMgr 12D375A7, BiasEngine D7772636, ImbalanceMgr 6F063C3C).
- Run inis: RECON62-B250H.ini + EU0525TD-B250H.ini = G inis + InpCqdName=SRJ_CQD_TickBased_MT5_B250H (Report renamed for EU). Rest of inputs identical to the G inis.

## STALE-TAIL-MARKER defect (owned 2026-10-17, B-250)
- What: at T3 launch (04:59:51) the un-patched shared watcher matched 'Test passed' in the 64 KB tail that still held T1's completion marker -> wrote RESULT=PASSED DONE=05:00:18 with the terminal alive (27 s after launch, run not finished).
- Handled: false DONE row kept in the status file (NOTE=FALSEDONE lines appended, 05:01:07 wall); false RECON62-B250H_DONE.txt deleted; new watcher re-attached with the byte floor (PreBytes=1047086610, PID 19004), verified by PID.
- Tighten: watch_run.ps1 gained -PreBytes (binary floor; marker must land beyond the log length at launch; 0 = old behavior); launch_b250.ps1 records PRE_JOURNAL_BYTES at launch and passes it. Same-turn fix per the defect-owning order; both scripts committed in Part F.
- Same defect would have hit T4 (stale T3 marker); launcher floor covered it (PreBytes=1092860466 at 05:10:36 launch).

## T3 RECON62-B250H (guard + proof-print build on the G base)
- Launched 04:59:51 PID=17816; PRE_JOURNAL_LINES=2529150; real DONE 05:07:48 (8.0 min); ex5 proof after run: Flow 268464B1, CQD 236F104E (both == .B250HK).
- Cut: job_cut_b247.py RECON62-B250H 2529150 -> scanned 3833268; deals 12 (6 trades); KILL rows 152; S4/RV/ZG/KS/ZS rows 258709.
- Row counts in cut: GAPPENDGUARD rows 0 (no guarded append attempted), out-of-range rows 0 (crash-free), SWINGPROOF rows 4482 (per-verdict proof rows through the RECON window), [B250G] rows 0 (as in T1; tag is source-marker only).
- GRADE RECON62-B250H raw:
  KEEP entries exact 6/7; KEEP exits exact 5/7; NEVER fires 0; MACHINE-ONLY ungraded 0; trades 6 (rows identical to the G grade byte-for-byte except the run tag)
- DEALS G vs DEALS H: Compare-Object count 0 = identical deal lists.
- Read: the A3 loss stands WITHOUT any crash (guard zero-fires, zero OOR) -> the 4 Sep non-entry is the G shadow build's own decision path, not the g_b176 OOR.

## T4 EU0525TD-B250H (long window, F4a measurement)
- terminal.ini [Tester] patched: DateFrom=1779667200 (2026.05.25) / DateTo=1791936000 (2026.10.14 excl. = walk through 10.13) with read-back; the other date pair (1777420800/1780358400, non-Tester section) untouched; Symbol EURUSD kept; [TickLoad] untouched.
- Launched 05:10:36 PID=9148; PRE_JOURNAL_LINES=3833268; PRE_JOURNAL_BYTES=1092860466; window verified on the journal tail: 'testing of Experts\SRJ_FlowNexus_EA.ex5 from 2026.05.25 00:00 to 2026.10.14 00:00', replay rows stamped 2026.05.25 with the deep-history scan rows (2025.12.10 zone rows) before the window.
- Expected pass wall ~41-45 min (EU0525TD-B249E was 0:41:28). Result rows appended below after DONE.

## T4 completion (DONE verified 2026-10-17 05:47 wall, marker 05:43:34)
- DONE file (written by the floor-fixed watcher, PID 19988 suspended/ended after DONE): RUN=EU0525TD-B250H RESULT=PASSED DONE=2026-10-17 05:43:34. Watcher self-exit verified by PID list (no watch_run.ps1 process).
- Journal completion line raw: 'Core 04	EURUSD,M5: 6171443 ticks, 29373 bars generated. Environment synchronized in 0:00:10.997. Test passed in 0:31:50.728 (including ticks preprocessing 0:00:00.891).' stamped 05:43:09.758.
- Real-DONE class check: day log byte length at marker time = 2,280,065,630 >> launch floor 1,092,860,466; STALE-TAIL-MARKER cannot fire here (fix verified live).
- PID 9148 killed immediately on DONE; terminal64 gone; leftover watcher PID clean-up verified none.
- ex5 proof post-run (STOP class absent): EA e61518b5, Flow 268464b1, CQD 236f104e — all == .B250HK keeps.

## T4 cut + grade (Python, one pass)
- Cut: job_cut_b247.py EU0525TD-B250H 3833268 -> scanned 7309989; deals 34; KILL rows 852; S4/RV/ZG/KS/ZS rows 295562; flip bars 2551; renewal bars 0. CUT_EU0525TD-B250H.log = 590,125,861 bytes / 3,476,721 lines.
- GRADE EU0525TD-B250H raw: KEEP entries exact 10/15; KEEP exits exact 9/15; NEVER fires 1; MACHINE-ONLY ungraded 6; trades 17
- GRADE EU0525TD-B241D re-run on the same truth file (kept baseline re-grade): KEEP entries exact 13/15; KEEP exits exact 12/15; NEVER fires 4; MACHINE-ONLY ungraded 0; trades 17

## T4 vs kept EU-B241D (per-row delta; REGISTER_TRUTH unchanged, no new row)
- Better (NEVER fires that stay only in the baseline): N25JUN 25 Jun 10:45 1.13540 silent in H; N4JUN1005 4 Jun 10:05 1.16117 silent in H; N15JUL1035 15 Jul 10:35 1.14227 silent in H. N26MAY 26 May 15:50 1.16336 fires in BOTH (baseline-carried, not new).
- Worse (KEEP rows lost in H): K28MAY 28 May 11:50 1.16134 day-close taken-> missing (new loss vs baseline); A3 4 Sep 16:00 1.16019 missing (known B-218k4 carry, F5 owns); K8OCT 8 Oct 11:35 1.11884 missing (baseline took it; E-era carry per pointer "K8OCT still missing" - measured again here). Exit 12/15 -> 9/15 = the same three exits (K28MAY/A3/K8OCT) plus the A1 +3pt FILL-EXACT row in both.
- Unchanged missing: K19JUN (owed 15:45 open 1.14644), K10JUN (18:55 1.15490; exit 01:01 1.15331 note) - his banked rows, machine silent in both builds.
- New machine-only ungraded (6, all NONE register): M4 4 Jun 09:55 1.16121/out 10:26 1.16048; M8 19 Jun 15:50 1.14654/out 15:51 1.14716; M12 30 Jun 10:45 1.14061/out 11:00 1.13951; M16 16 Jul 10:15 1.14683/out 10:48 1.14745; M18 22 Jul 18:15 1.14098/out 04:00 1.14182; M22 18 Aug 14:45 1.15741/out 14:57 1.15766.
- Plan prediction check: the planner's 19 June 15:45 1.14644 K19JUN forecast did NOT arrive - the machine's signal bar is 15:45 but the fill is 15:50 (one candle late; see F4a rows).

## H journal proof (whole cut, one pass)
- [B250H] rows 18,187 - SWINGPROOF rows 18,187 (every [B250H] row is a verdict-write row; site=V<verdict>); GAPPENDGUARD_B rows 0; GAPPENDGUARD_S rows 0; out-of-range rows 0; [B250G] rows 0 (source-marker only, as in T1/T3).
- Guard never fired: the 10-store divergence/ArrayResize failure never happened during any B-250 segment; the g_b176 crash class is absent from T1/T3/T4.
- Row format sample: '2026.05.25 00:30:00   [B250H] bar=2026.05.25 00:25 id=SWINGPROOF site=V1 x1=2026.05.25 00:10 writePass=2026.05.25 00:30 newestClosed=2026.05.25 00:25'.

## F4a 19 June window (raw rows, CUT_EU0525TD-B250H.log)
- 15:40:02 Alert raw: 'Alert: EURUSD M5 - POI RETEST LONG at 1.14630  [F-POC]'.
- Pair rows for x2=15:35 (two sets): '[B249F] x1=2026.06.19 15:05 x2=2026.06.19 15:35 verdict=2' + mirror '[B250H] bar=2026.06.19 15:35 id=SWINGPROOF site=V2 x1=2026.06.19 15:05 writePass=2026.06.19 15:40 newestClosed=2026.06.19 15:35' (also x1=15:00 set).
- Seed gate at 15:35: '[B234EQ] bar=2026.06.19 15:35 dir=LONG line=FOMC-POC val=1.14630 o=1.14655 out=PASS'; '[B237TD] bar=2026.06.19 15:35 ... o=1.14655 touch=1'.
- His candle 15:45 (machine rows): '[B237TD] bar=2026.06.19 15:45 dir=1 raw=1.14630 val=1.14630 hi=1.14655 lo=1.14643 o=1.14644 touch=0' (the machine's own print of the 15:45 OPEN = 1.14644, exactly the owed open in rules/54); '2026.06.19 15:45:01 CQD DIV verdict=+2 shift=2 bar=2026.06.19 15:35'; 'FRESHCOUNT #1791 bar=2026.06.19 15:40 state=S4_ARMED obDead=0 fvgDead=1 oppFvg=0 adverse=1 verdict=HOLD scope=pre'; 'ROWKEY ... row=2026.06.19 15:35 dir=LONG lines=FOMC-POC:0:dL'.
- NO pair-verdict row for x2=2026.06.19 15:45 anywhere in the cut: the pass filtered every row containing 'x2=2026.06.19 15:45' or 'bar=2026.06.19 15:45 id=' - only B201FROM/B201TO matched; no [B249F]/[B250H] pair row exists for 15:45. The pair chain prints x2=15:35 sets (15:40:02) then x2=15:50 sets at 15:55:00 ('x1=15:25 x2=15:50 verdict=-1', mirror x1=15:20/15:15).
- Gate window at 15:50:00: 'SIDE1W_CQDWINDOW evalBar=2026.06.19 15:45 dir=LONG w=U,U,2,2,2,U,U,U,-1,U,1,U,U' (the two most recent closed bars carry no verdict in the machine's own window print); 'SIDE1O_ELIGSTATE ... confirm=S4_ARMED'.
- Fire: '2026.06.19 15:50:00 SIGNAL dir=LONG poi=FOMC-POC regime=TREND div=hidden sess=NYAM tp_target=1.14715 tp_R=1.10 sl_ref=1.14589 ... bid=1.14649 ask=1.14654'; 'ORDER ... barTime=2026.06.19 15:45 gateOutcome=PASS'; 'EXECUTED fill=1.14654 ... R_executed=0.94 R_logged_at_signal=1.10 delta=-0.16'; 'ENTRY_TICKET bar=2026.06.19 15:45 ticket=8 deal=8'; 'STATE S5_GATE_CHECK->SIGNAL'.
- Line block at 15:50:00: 'B201FROM bar=2026.06.19 15:45 id=0 sd=2026.06.19 15:35 sw=NOTREACHED zn=1.14583-1.14611|2026.06.19 14:05|NR|ST el=FOMC-POC|LONG|1.14630|2026.06.19 14:35 ht=-1/1/1|1.0'; 'B201TO ... ev=ORDER to=1.14649|1.14589|1.14715|1.10 rl=SETUP-DEFINED|53 dv=hidden-bull|2026.06.19 15:35 tc=C_TOUCH fr= lt=ALIGN'.
- Post-fire reads: 15:55:00 'CQD DIV verdict=-1 shift=1 bar=2026.06.19 15:50' + CQDRECHECK diff=0 mism=0; 16:00:00 verdict=-1 shift=2. End-of-run SIGMAP: 'map=2026.05.26 15:50->2026.05.26 15:45|2026.06.04 09:55->2026.06.04 09:50|2026.06.18 09:45->2026.06.18 09:40|2026.06.19 15:50->2026.06.19 15:45|...'.

## K8OCT window 8 October (raw rows)
- 11:20:00 'Alert: EURUSD M5 - POI RETEST LONG at 1.11960  [D-POC]'; "[B249F] x1=2026.10.08 09:50 x2=2026.10.08 11:15 verdict=-1" + mirror site=V-1; 'UJPROBE ... h4=-1.0 h1=-1.0 m15=-1.0 div=OPPOSING kind=regular'.
- 11:30:02 'Alert: EURUSD M5 - POI RETEST SHORT at 1.11975  [D-VWAP]'; 'LTFFLIP bar=2026.10.08 11:25 dir=SHORT poi=Daily-VWAP state=S3_ZONE_WAIT - LTF bias turned against the locked direction'; 'UJDEFERABORT ... - LTF opposed, abort deferred past evaluation (Fix S-a)'; 'FRESHSKIP ... reason=PRE_BINDING'; no deal. The kept baseline's 8 Oct entry (11:35 1.11884) stays refused on this build - the E-era carry stands, not a B-250-row behavior.

## T5 restore (post-run, verified)
- Sources + ex5s from .preB250 (9 files) and config\terminal.ini from terminal.ini.preB250: all MATCH on SHA-256: EA mq5 18a1d49b / ex5 d85cf7d2, FlowLogic mq5 a8201128 / ex5 61177aa5, Types d542b458, State 2e4f8a95, OrderblockMgr 915b4fc3, ImbalanceMgr d9a38776, BiasEngine 0b334063, terminal.ini 2862b31f.
- CQD base pair untouched (the relay created the separate SRJ_CQD_TickBased_MT5_B250H.mq5/.ex5 named files; the pre-relay SRJ_CQD_TickBased_MT5.* files never overlapped). H-named files remain on disk as trial sources beside keeps (.B250HK).
- terminal.ini read-back: [Tester] DateFrom=1787702400/DateTo=1788998400 (= RECON62), Symbol=EURUSD (+ the other-section Symbol=USDJPY_RAW untouched), [TickLoad] DateFrom=1777420800/DateTo=1780358400 intact.
- Charts restored from Profiles\Charts.preB250 -> Profiles\Charts: 34/34 files byte-equal (British Pound 5, Default 19, Euro 5, Market Overview 5). No terminal64 running.

## Timing table (per step, wall)
- T1 launch->DONE 7.3 min; T3 false-DONE 27 s (defect), real launch->DONE 8.0 min; T4 launch 05:10:36 -> DONE 05:43:34 = 33.0 min (B-249 EU-E was 41.5 min; watcher delta to journal pass = 25 s).
- DONE->kill+proof ~3 min; cut ~2 min; grades ~1 min; F4a passes ~4 min; restore ~2 min; records from 06:0x wall; commit+push+cleanup in the result's tail.

## Own defects (same-turn, ledger)
- STALE-TAIL-MARKER (watched run completed on the PREVIOUS run's marker): fixed in watch_run.ps1 + launch_b250.ps1 (see above), ledger row filed in Part X (1400).
- Splice-script first-pass bytecode defect (site closing brace consumed + side=true/false literal): caught by the brace tally + literal check before any run; file restored from .B250GK (387F2822) and re-applied by the fixed script; no run used a bad build.

## Size gate (Part F, PASS before commit; folds noted)
- final Part-F gate (post-folds): result 6,078 B PASS (cap 12,000); slice 16,176 B/116 PASS (20,000/600); pointer 5,717 B/35 lines PASS (6,000/35); review batch 1,669 B PASS; EU_FIX_PLAN 19,996 B PASS (fold: this relay's F4a State compacted to slice refs; stale B-245 carrier numbers + B-249 F-state grade numbers folded to their own slices and ledger items 1392/1398); rules/01a 13,265 B + rules/01b 19,162 B PASS (cap 20,000 each) - his three workflow orders banked verbatim (AGENTS.md sections + 01a/01b bullets + index bytes + pointer line); SKILL index PASS; READ/REGISTER A-F regenerated from current sources (A/C/D/E from BUILDER_REGISTER_VALID_TRADES.md sha a82d2144, B/F from BUILDER_REGISTER_VALID_TRADES_HELD.md sha cab9cf30; spec f2f4cdde unchanged - no regen); READ_MAP rewritten (B-250 rows); REGISTER_TRUTH.csv untouched (git clean).

(End of slice)
