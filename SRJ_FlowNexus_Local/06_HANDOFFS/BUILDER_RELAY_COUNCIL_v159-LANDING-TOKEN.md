CODE REVIEW REQUEST — v159 — 2026-09-18 (LANDING relay: commit the graded veto tree as working ground; no new code, no new run)

Change (one plain sentence): make EA 6C2E4028 (veto consume-on-fire, graded PASS) the landed working tree so the queued stop work builds on settled ground instead of stacking a second behavior change on an uncommitted one.

File / function / lines (re-read from disk this turn, post-edit numbers): `Experts\SRJ_FlowNexus_EA.mq5` — E1a L297-298 (anchor + new define); E1b L1008-1015 (anchor + 7 new); E1c L7206-7241 (36-line block); E1d L9873-9909 (36 new + 1 old latch-context line, labeled in place). Source digest: as-built + as-run SHA256 `6C2E402846DB0BFBCDABD40AC2D08BEE7A59D0F92BBD2E9F9D2B8DAC817BCC07` / 602894 B (pre-run and post-run identical, re-verified this turn). FlowLogic untouched `BEC2CBBD` / 69852 B. Packet P-FRESH-S5OPP v5 (`04489E6D`, frozen). Run archive `06_HANDOFFS\FRESHVETO-V1_JOURNAL.log` (37303 lines / `8B2ED676`); baseline archive `06_HANDOFFS\FAMILYPASS-V4_JOURNAL.log` (36755 lines / `736C24E8`).

Complete code, verbatim, no elisions (four regions, contiguous, in file order):
E1a (L297-298):
#define ABORT_FRESH_OPP_FVG    "FRESH_OPP_FVG"
#define ABORT_FRESH_VETO       "FRESH_VETO"
E1b (L1008-1015):
ENUM_SRJ_STATE   g_confirmFromState = ST_IDLE;
//--- [P-FRESH-S5OPP E1-K4 2026-09-18] S4 FRESH-OPP-abort veto, consume-on-fire:
//--- stamped on abort, refuses at most one latch, zeroed as it refuses. BOUND/DAY
//--- release (S4) and at the latch (E1d). ResetSequence-EXEMPT +
//--- non-working-set; WS161 stays 21.
datetime         g_freshVetoBar    = 0;
int              g_freshVetoAnchor = -1;
int              g_freshVetoDir    = -1;
E1c (L7206-7241):
   if(g_state >= ST_S4_ARMED && g_state <= ST_S5_GATE_CHECK)
     {
      //--- [P-SCOPE34] the 2-of-3 kill is PRE-CONFIRMATION ONLY: at S4_ARMED the
      //--- poll kills as built; at S5_GATE_CHECK (post-confirming-close) it is
      //--- diagnostic-only (scope=post, verdict=HOLD) - the only cancellation
      //--- there is the live bias flip (the three-flag conjunction is the same
      //--- event per spec sections 3.4/5.5).
      string fail = CheckFreshness(barShift, g_state != ST_S5_GATE_CHECK);
      //--- [P-FRESH-S5OPP E1-K4] veto persistence, S4 ONLY, BEFORE any abort
      //--- return (Luna/Astra v152: the clear sees the fresh read even when
      //--- this poll aborts on another predicate). BOUND/DAY only — no CLEAN
      //--- arm (Luna/Opus-D3 v153: a stale-0 fail-open is unfixable in this
      //--- shape, so the arm is dropped, not narrowed). Audited by VETOCLEAR.
      if(g_state == ST_S4_ARMED && g_freshVetoBar != 0)
        {
         bool sameSetup = (g_freshVetoDir == (int)g_dir && g_freshVetoAnchor == g_anchorLine);
         string vday = StringSubstr(TimeToString(g_freshVetoBar, TIME_DATE), 0, 10);
         string cday = StringSubstr(TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE), 0, 10);
         if(!sameSetup || vday != cday)
           {
            if(InpDebugLog)
               PrintFormat("[SRJ-EA] VETOCLEAR bar=%s dir=%s why=%s",
                           TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES),
                           DirName(g_dir), (!sameSetup ? "BOUND" : "DAY"));
            g_freshVetoBar = 0; g_freshVetoAnchor = -1; g_freshVetoDir = -1;
           }
        }
      if(fail == ABORT_FRESH_OPP_FVG)
        {
         g_freshVetoBar = iTime(_Symbol, PERIOD_CURRENT, barShift);
         g_freshVetoAnchor = g_anchorLine;
         g_freshVetoDir = (int)g_dir;
         GoAbort(fail, g_state); return;
        }
      if(fail != "") { GoAbort(fail, g_state); return; }
     }
E1d (L9873-9909; last line is the pre-existing latch context, not new):
      //--- [P-FRESH-S5OPP E1-K4] veto (consume-on-fire): an S4 FRESH-OPP abort
      //--- for this anchor+direction refuses ONE latch (his ruled decline
      //--- rides the abort) and is zeroed as it refuses. K3's spent flag and
      //--- K2's CLEAN arm WITHDRAWN v4 (Sonnet/Opus-D1 + Luna/Opus-D3 v153).
      if(g_freshVetoBar != 0
         && (g_freshVetoDir != (int)g_dir || g_freshVetoAnchor != g_anchorLine))
        {
         if(InpDebugLog)
            PrintFormat("[SRJ-EA] VETOCLEAR bar=%s dir=%s why=BOUND",
                        TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES),
                        DirName(g_dir));
         g_freshVetoBar = 0; g_freshVetoAnchor = -1; g_freshVetoDir = -1;
        }
      if(g_freshVetoBar != 0
         && StringSubstr(TimeToString(g_freshVetoBar, TIME_DATE), 0, 10)
            != StringSubstr(TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE), 0, 10))
        {
         if(InpDebugLog)
            PrintFormat("[SRJ-EA] VETOCLEAR bar=%s dir=%s why=DAY",
                        TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES),
                        DirName(g_dir));
         g_freshVetoBar = 0; g_freshVetoAnchor = -1; g_freshVetoDir = -1;
        }
      if(g_freshVetoBar != 0
         && g_freshVetoDir == (int)g_dir
         && g_freshVetoAnchor == g_anchorLine)
        {
         if(InpDebugLog)
            PrintFormat("[SRJ-EA] FRESHVETO bar=%s dir=%s anchor=%s vetoBar=%s",
                        TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES),
                        DirName(g_dir), AnchorStr(),
                        TimeToString(g_freshVetoBar, TIME_DATE|TIME_MINUTES));
         SrjOrderEmit(barShift, "FRESH_VETO");
         g_freshVetoBar = 0; g_freshVetoAnchor = -1; g_freshVetoDir = -1;
         GoAbort(ABORT_FRESH_VETO, g_state); return;
        }
      g_latchedEntry = currentPrice;

Behavior (plain — checkable in the pasted blocks): on a Sept-4 morning opposing-gap abort the tree stamps bar, anchor, and direction, then refuses exactly one latch for that same setup and zeroes all three globals as it refuses; the same mechanism refused one Aug-26 midday latch the same way. The regions emit prints, abort, and zero globals only. Refused latches this window, exactly two: the ruled Sept-4 morning short and the observed-once Aug-26 midday long, both silent either way.

Grade (labeled priors, same track): run FRESHVETO-V1 graded in `06_HANDOFFS\BUILDER_RESULT_FRESHVETO-V1.md` (31 lines, `D8333645`) — G1 PASS (Test passed, 3168 bars, 563338 ticks), G2 PASS (WS161 21 fields, 3168/3168, mismatch 0), G3 PASS (five fires byte-identical, ruled decline silent with exact veto row, clears all BOUND, silent days silent), G5 PASS (digests identical, FlowLogic untouched, kills alive); G4 closed PASS in `06_HANDOFFS\BUILDER_RELAY_COUNCIL_v158-G4-CLOSURE-FIX.md` (121 lines, `5FB1E4D4`, four yes answers filed, ledger items 364-365). Nothing in the grade is re-asked here.

Counts (machine-counted this turn, two patterns each): baseline 8 signals and 13 shadows with 0 veto prints (8/8, 13/13, 0/0); current 7 signals and 11 shadows with 2 veto prints (7/7, 11/11, 2/2). The 2 veto prints are exactly the ruled bar and the observed-once bar.

Run rows, raw (machine-pulled this turn):
[SRJ-EA] FRESHVETO bar=2026.08.26 14:40 dir=LONG anchor=Weekly-POC vetoBar=2026.08.26 11:35
[SRJ-EA] FRESHVETO bar=2026.09.04 10:35 dir=SHORT anchor=Daily-POC vetoBar=2026.09.04 10:30
JQ	0	21:27:43.856	Core 04	2026.09.04 10:40:00   [SRJ-EA] ALERT SRJ SIGNAL SHORT EURUSD M5 | Daily-POC | LONDON | R=10.35 SL 1.16289 TP 1.16017 spr=4
[SRJ-EA] TP_ELECT shadow=true entry=1.16265 sl=1.16289 tp=1.16017 R=10.35 bar=2026.09.04 10:35 latchBar=2026.09.04 10:40

Risk (plain): the wider reach beyond the ruled bar is observed fact, once, bounded (the two veto prints above and no others). Standing rule unchanged: only he extends a decline; any future refusal routes via the G4 adjudication pattern, never auto-approved. Landing this tree changes live alerts by exactly the two stated silences; his twice-ruled Sept-4 decline is one of them.

Why land first (one line): stacking the queued stop work on an uncommitted behavior change would mix two deltas in every future isolation join; land-then-build keeps each gate attributable to exactly one change.

Question (one, specific): commit EA 6C2E4028 as the landed working tree on this evidence — yes, or discrepancy with line numbers?

Answer form: plain yes / no / discrepancy, with line numbers.
Verification split: rule on the page only — genuineness vs disk is proven on disk (digests + counts above) and is not answerable from chat by any model tier. Do not ask for files. Same text goes to every model; file-access proof is builder-disk plus his-eyes only.
Nothing else is asked. Thank you.
