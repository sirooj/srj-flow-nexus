# BUILDER RESULT B-208 - MEASURED (EURUSD scope): the machine's pieces are not his; P4 separates his way

Trader summary: the B-207 fixes failed because the machine counts different pieces than you do. On 28 August it
counts its own block dead (formed 09:25, killed 09:40) while your 06:30-06:40 zone was found on rows and only wicked
at 09:55, never body-killed - and across all 141 euro days the replay kill path never fired once, so your 25 June
10:00 and 22 July blocks were never even formed as objects the machine could kill. The diagnostic printed every
block and zone the machine finds and kills, without changing a trade (both runs deal-identical, always restored).
Re-graded your way, the 2-of-3 count keeps all 7 of your valid euro takes and refuses your 10 June, 25 June and
22 July trades. Today's settings are the clean copy now, proven by identical euro deals. Nothing is asked.

## Relay order (B-208 J2D-DEFECTS 3 -> MEASURED, EURUSD scope)
- Part 0 on builder/B-207 at e828d32 (ls-remote backup exact; builder/B-208 cut here, pushed via backup, never origin).
  Python first (3.13.16 embed). Skills whole (relay Standing-scope/Housekeeping/Run-economy/trial-save; strategy OB
  231/FVG 41/OPP+2-of-3 57-116-342/XOB 198-221/B-175/328-357) + EU_FIX_PLAN. Reads: pointer, RESULT_B207
  (carried+R2+R3+S), SLICE_B207, SEPARATORS, CLEANUP_DONE (STOP/D3/D4/D5), register (A1 B-175/B-183, C), spec 3.4-3.6.
- Names: kit PK-2. Lane J2D-DEFECTS 3 of 6 (EURUSD). Tag B208. Ledger 1354 taken by the B-207 addendum (disclosed at
  gate) -> 1355 B208-EU-OBJECTS (^1352.=1 ^1353.=1 ^1354.=1 ^1355.=0 pre, grep-verified). Kept build as B-206.
- Diagnostic target: OB/FVG form/store/kill points (OrderblockMgr kill 123-133/168-180 + live 505-572; FVG
  ImbalanceMgr form/kill 414-439/494-495 + OPP 234/357; factories Types 252-308). Backups .preB208 (2 mqhs + flow
  ex5, SHAs). Keep .B208D (2 mqhs + flow ex5, verified pre-launch). Markers [B208OBJ] once per file (2).
- Start gate: log-1 = e828d32; diff e828d32 EMPTY on all 12 gate files (+1354-collision ACCOUNTED: addendum item on
  branch, renumbered to 1355 to avoid a duplicate). Disk SHAs match (EA/POI/flow/Sessions, terminal.ini c725e437).
  Journal rows 339-340 unstaged bytes 166767 ACCOUNTED. No terminal64. D: 221.1 / C: 18.4 GB free.
- Scope kept: print-only (no gate/condition/tolerance/buffer/count/number touched); one compile; two runs; one cut;
  always restored. Euro only. Nothing else staged.

## Part B - banking
- No new rule words. B-207 B1 + B2 present once each; cited e828d32.

## Part W - workflow edits (exact before -> after)
- W0 re-bless: today's terminal.ini copied to 00_CURRENT_WORKING/terminal.ini.blessedB208 and
  D:\SRJ Venture\work-archive\terminal.ini.blessedB208 (SHA c725e437 both); restored before the first launch and
  verified. Proof T1 below (deals equal).
- W1 relay-skill Housekeeping bullet appended verbatim (blessed-copy sentence).
- W2 EU_FIX_PLAN: F0 item inserted before F1 verbatim; F1/F2 marked "(after F0)".

## Part R - readings first
- R1 FOUND: A1's obDead=1 comes from the live-loop kill (OrderblockMgr ~553, code=3), last write 09:45 id=2170 - not
  the replay path (zero code=1/2 on both long and short CUTs). refOk tests (168-180 raw in result appendix of the
  working notes): invalidationBar >= currentStructureStartBar + validation set + no same-bar.
- R2: EU long CUT: 11,414 distinct OB ids reached the refOk gate (code=3/4/5/6/7/8 rows; kill FALSE only via code=1/3).

## Part K - print-only diagnostic (restored)
- K0 .preB208: OrderblockMgr 8bbf936b, ImbalanceMgr 568f4ce9, flow ex5 c82f175e (full SHAs in slice).
- K1 six prints at form/kill/skip/validate points (spots pasted raw pre-edit: OB factory Types 252-280,
  OB kill 123-133 + 505-553, OB gate 135-140/168-180/521-572, FVG factory Types 285-308, FVG wick 414-421 + body
  431-439 + flag 494-495, OPP 234/357). Event lines only, all under the 255-char cap.
- K2: brace balance 0/0 both files (= .preB208); markers once per file (1+1); compile 0 errors, 3 warnings, all three
  pre-existing long-to-int notes in unedited SRJ_FlowLogic.mq5 lines 1576/1798/1872 (none in the 12 hunks);
  post-compile SHAs = pre-launch (flow E32C1EF6); .B208D verified (8cc4c502/5f86a20e/e32c1ef6).
- Full diff preB208 -> B208D raw (16 added lines, 0 removed): pasted in the appendix below.

## Part T - runs (blessedB208 restored pre-first-launch; fixed watcher; leftovers by PID; ex5 SHAs every launch+run)
- T1 RECON62-B208D (WMI 16288 10:37:41 / terminal 5536 / EURUSD 26Aug-9Sep / replay 10:38:10 / DONE PASSED 10:42:14;
  PRE=0, bytes [0,312969428)): 16/16 deals identical side/date/time/price vs DEALS_RECON62-B206T; all six B208 tags
  live (OB 2259, FVG 1309, OPPV 387, FVGKILL 2504, OBKILL 925, OBSKIP 1229) + B205FOMC 3. No STOP -> EU ran.
- T2 EU0525TD-B208D (WMI 11988 10:44:01 / terminal 16988 / EURUSD 25May-13Oct / replay 10:44:32 / DONE PASSED 11:08:56
  ~25min; PRE=1059880, bytes [312969428,1486638970)): 44/44 identical vs DEALS_EU0525TD-B206T; tags live (OB 11678,
  FVG 7212, FVGKILL 13889, OBKILL 5097, OBSKIP 6316, OPPV 2222). No STOP.
- T3 restored+verified: OrderblockMgr 8bbf936b, ImbalanceMgr 568f4ce9, flow ex5 c82f175e; EA/POI untouched; .B208D
  keep on disk unstaged. No terminal64 left.

## Part P - grade from the cut (one Python pass per job; full rows in REPORT/OBJECTS_EU_B208.md)
- P1 pieces: A1 FVG FOUND (2150, form 06:30-06:40, wick-dead 09:55 JL927510, no body kill pre-entry) vs machine dead
  OB 2170 (form 09:25, killed 09:40 JL927401) - different pieces; machine dead-FVG identity not printed (flag 0 all
  morning, flips 10:05). 25Jun bearish-10:00 OB NOT FOUND (only bullish 5744/5745 formed; 10:10 close beyond both ->
  SKIPs); FVG 5748 BODY-killed 10:35 (matches his window); OPPV bullish rows. 22Jul nearest OB 9081 (form 14:45,
  alive at confirmation); nearest dead FVG 9077 BODY 14:30. 10Jun dead FVG 3871 BODY 15:50 + OPPV 15:55/16:00 - all
  agree. A6/A7 9:20 zone FOUND exactly (3293, in-bias at form, alive through both entries).
- P2 census (EU-D): 11,678 OBs formed; KILLED 5,097 (all LIVE rule; replay zero); SKIPPED-only 6,316 (all NOT-IN-BIAS;
  refOk never fails); NEVER 265.
- P3 per-take FVG kills vs machine kill candle: table in OBJECTS (wick kills never flip the machine flag - his rule
  counts them; 8 takes print no FRESHCOUNT = 0).
- P4 re-grade his way (OB/FVG per his words+rules on identified pieces, OPP machine-read, no invented kills;
  committed pack lines): 10Jun 2 REFUSE, 25Jun 2 REFUSE, 22Jul 2 REFUSE, A1-A7 0-1 keep, C rows OTHER-GATE.
  Verdict: SEPARATES. Trader line: "with the pieces read your way, this count keeps all 7 of your valid euro takes
  and refuses your 10 June, 25 June and 22 July trades."
- Verdict: MEASURED (always-restored diagnostic; no T STOP).

## Part X - records
- X1 PLANNER_CONTEXT section 4 +1 (planner defect owned: keep list wins over delete patterns) +1 (count-gate lesson);
  section 5 +1 Brain B-208.
- X2 PLANNER_HANDOFF section 3 +1 B-208 arc line.
- X3 ledger 1355 B208-EU-OBJECTS (renumber disclosed; ^1354.=1 addendum kept).
- X4 pointer rewritten (35-cap; lane 3 of 6 euro with P1-P4 verdicts; blessed=blessedB208; Next = F0 fix trial if P4
  separates (detection/kill change on his words), else narrowest P1 NOT FOUND piece; P3 chart call with planner;
  pound/yen held; HELD/F2/O3/UNRECONCILED/queue/offset).

## Part F - file, push, reply
- Timing table: gate+reads+branch ~30m (spec sections + skill lines); B/W0-W2 ~15m; R1-R2 + K spots ~40m; K edits +
  backups ~25m; compile chase ~10m (0 errors + 3 pre-existing warnings); .B208D ~5m; T1 10:37:41-10:42:14 + grade;
  T2 10:44:01-11:08:56 + cut/grade ~15m; P1-P4 jobs ~40m; packs ~10m; T3 restore ~5m; records + Part D + pushes follow.
- F5 stage explicit paths only (result, slice, OBJECTS, 8 EU-D day packs, EU_FIX_PLAN, relay skill, ledger, pointer,
  CONTEXT, HANDOFF, CLEANUP_DONE_B208). Never sources/ex5/journals/logs/inis/profiles/scripts/backups/CUTs.
- Final disk state: kept build as 0.4 (diagnostic restored, verified); .B208D + .preB208 unstaged; blessedB208 copies
  present; terminal.ini = blessedB208 (c725e437); no terminal64; journal 340 unstaged; D/C free in Part D.

## Carried note
- Next = F0 fix trial on P4's separation (detection or kill change on his words, euro RECON62 then EU long), else the
  narrowest P1 NOT FOUND piece as its own reading (25Jun bearish-10:00 OB: no object formed).
- P3 18-June chart call with the planner. Pound/yen held. Year-start HELD. F2/O3 pending. GU gap UNRECONCILED.
- B-202 queue unchanged. 18 March offset UNVERIFIED. EURUSD-first active. Blessed-a5834591 loss stands (addendum STOP);
  blessedB208 is the clean copy now.

## Appendix - full diff .preB208 -> .B208D raw (print-only; +16/-0)
```
--- Include/SRJ/SRJ_OrderblockMgr.mqh ---
@@ form: +// [B208OBJ] print-only diagnostic: OB formation event (no state change).
+PrintFormat("[SRJ-IND] B208OB id=%d side=%s form=%s range=%s-%s lvl=%s inBias=%d promo=%d", ...);
@@ replay refOk: +if(closedBeyondInvalidation && !refOk) PrintFormat("... B208OBSKIP ... why=REF-NOT-OK", ...);
@@ replay kill: +PrintFormat("... B208OBKILL ... rule=REPLAY", ...);
@@ replay else: +PrintFormat("... B208OBSKIP ... why=NOT-IN-BIAS", ...);
@@ live refOk: +if(closedBeyondInvalidation && !refOk) PrintFormat("... B208OBSKIP ... why=REF-NOT-OK", ...);
@@ live kill: +PrintFormat("... B208OBKILL ... rule=LIVE", ...);
@@ live else: +PrintFormat("... B208OBSKIP ... why=NOT-IN-BIAS", ...);
--- Include/SRJ/SRJ_ImbalanceMgr.mqh ---
@@ form: +// [B208OBJ] print-only diagnostic: FVG formation event (no state change).
+PrintFormat("[SRJ-IND] B208FVG id=%d side=%s form=%s-%s range=%s-%s det=%s", ...);
@@ opp-bearish-bias: +PrintFormat("[SRJ-IND] B208OPPV bar=%s side=BULL range=%s-%s", ...);
@@ opp-bullish-bias: +PrintFormat("[SRJ-IND] B208OPPV bar=%s side=BEAR range=%s-%s", ...);
@@ wick cover: +PrintFormat("[SRJ-IND] B208FVGKILL id=%d bar=%s kind=WICK range=%s-%s", ...);
@@ body kill: +PrintFormat("[SRJ-IND] B208FVGKILL id=%d bar=%s kind=BODY range=%s-%s", ...);
(Full PrintFormat texts in the K1 job notes; each under the 255-char journal cap.)
```
