CODE REVIEW REQUEST — v156 — 2026-09-18 (GRADE relay: run FRESHVETO-V1 on issued packet P-FRESH-S5OPP v5)

Change (one plain sentence, already built and run): the Sept-4 morning opposing-gap abort refuses exactly one latch and is zeroed as it refuses — as built below, run once, graded here.

File / function / lines (as-built, re-read from disk this turn; post-edit numbers — E1a's +1 line shifts everything below L298 by one, disclosed under the slip note): `Experts\SRJ_FlowNexus_EA.mq5` — E1a L297-298 (anchor + new define); E1b L1008-1015 (anchor + 7 new); E1c L7206-7241 (36-line NEW block replacing 7198-7207); E1d L9873-9909 (37-line NEW block above old L9839).
Source digest: as-built + as-run EA SHA256 `6C2E402846DB0BFBCDABD40AC2D08BEE7A59D0F92BBD2E9F9D2B8DAC817BCC07` / 602894 B (pre-run and post-run identical — no drift). Run archive `06_HANDOFFS\FRESHVETO-V1_JOURNAL.log`: 37303 lines / `8B2ED676` / 7226069 B (== wrapper STATUS count exactly). DONE=PASSED 02:07:06 (~49 min), same ini (RECON44_DEMO_P1, InpMode=1) + same window 08-26→09-09, code delta only. Packet v5 FROZEN as issued (`04489E6D`); issuance: 4x yes on v155 (dual-key cleared, ledger item 359).

As-built diff (re-read from disk AFTER the edit, before compile — proves what compiled):
#define ABORT_FRESH_OPP_FVG    "FRESH_OPP_FVG"
#define ABORT_FRESH_VETO       "FRESH_VETO"

ENUM_SRJ_STATE   g_confirmFromState = ST_IDLE;
//--- [P-FRESH-S5OPP E1-K4 2026-09-18] S4 FRESH-OPP-abort veto, consume-on-fire:
//--- stamped on abort, refuses at most one latch, zeroed as it refuses. BOUND/DAY
//--- release (S4) and at the latch (E1d). ResetSequence-EXEMPT +
//--- non-working-set; WS161 stays 21.
datetime         g_freshVetoBar    = 0;
int              g_freshVetoAnchor = -1;
int              g_freshVetoDir    = -1;


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

Compile log (verbatim tail, `06_HANDOFFS\T168_FRESHVETO_EACOMPILE.log`):
 : information: generating code 95%
 : information: generating code 100%
 : information: code generated
Result: 0 errors, 0 warnings, 5573 ms elapsed, cpu='X64 Regular'

Run rows, raw (archive `8B2ED676`, machine-pulled this turn — 7 alerts, 7 latch rows, 2 vetoes, 5 clears, G1/G2 closers):
[SRJ-EA] ALERT SRJ SIGNAL SHORT EURUSD M5 | Daily-VWAP | LONDON | R=3.43 SL 1.16508 TP 1.16322 spr=4
[SRJ-EA] ALERT SRJ SIGNAL SHORT EURUSD M5 | Daily-POC | NYAM | R=1.48 SL 1.16503 TP 1.16322 spr=3
[SRJ-EA] ALERT SRJ SIGNAL LONG EURUSD M5 | Yearly-POC | NYAM | R=1.74 SL 1.15847 TP 1.16315 spr=1
[SRJ-EA] ALERT SRJ SIGNAL LONG EURUSD M5 | Weekly-POC | LONDON | R=4.86 SL 1.16098 TP 1.16315 spr=3
[SRJ-EA] ALERT SRJ SIGNAL LONG EURUSD M5 | Weekly-POC | NYAM | R=2.34 SL 1.16238 TP 1.16315 spr=3
[SRJ-EA] ALERT SRJ SIGNAL SHORT EURUSD M5 | Monthly-POC | LONDON | R=2.52 SL 1.16258 TP 1.16072 spr=1
[SRJ-EA] ALERT SRJ SIGNAL SHORT EURUSD M5 | Monthly-POC | NYAM | R=1.62 SL 1.16274 TP 1.16114 spr=1
[SRJ-EA] TP_ELECT shadow=true entry=1.16466 sl=1.16508 tp=1.16322 R=3.43 bar=2026.08.28 10:00 latchBar=2026.08.28 10:05
[SRJ-EA] TP_ELECT shadow=true entry=1.16018 sl=1.15847 tp=1.16315 R=1.74 bar=2026.09.04 15:55 latchBar=2026.09.04 16:00
[SRJ-EA] TP_ELECT shadow=true entry=1.16135 sl=1.16098 tp=1.16315 R=4.86 bar=2026.09.07 09:15 latchBar=2026.09.07 09:20
[SRJ-EA] TP_ELECT shadow=true entry=1.16261 sl=1.16238 tp=1.16315 R=2.34 bar=2026.09.07 16:40 latchBar=2026.09.07 16:45
[SRJ-EA] TP_ELECT shadow=true entry=1.16205 sl=1.16258 tp=1.16072 R=2.52 bar=2026.09.08 10:05 latchBar=2026.09.08 10:10
[SRJ-EA] TP_ELECT shadow=true entry=1.16430 sl=1.16503 tp=1.16322 R=1.48 bar=2026.08.28 16:20 latchBar=2026.08.28 16:25
[SRJ-EA] TP_ELECT shadow=true entry=1.16213 sl=1.16274 tp=1.16114 R=1.62 bar=2026.09.08 16:40 latchBar=2026.09.08 16:45
[SRJ-EA] FRESHVETO bar=2026.08.26 14:40 dir=LONG anchor=Weekly-POC vetoBar=2026.08.26 11:35
[SRJ-EA] FRESHVETO bar=2026.09.04 10:35 dir=SHORT anchor=Daily-POC vetoBar=2026.09.04 10:30
[SRJ-EA] VETOCLEAR bar=2026.08.27 09:35 dir=LONG why=BOUND
[SRJ-EA] VETOCLEAR bar=2026.08.27 17:00 dir=SHORT why=BOUND
[SRJ-EA] VETOCLEAR bar=2026.09.02 09:20 dir=SHORT why=BOUND
[SRJ-EA] VETOCLEAR bar=2026.09.02 10:30 dir=LONG why=BOUND
[SRJ-EA] VETOCLEAR bar=2026.09.07 09:05 dir=LONG why=BOUND
[SRJ-EA] WS161_CENSUS fields=21 loads=3168 stores=3168 changes=217 mismatch=0
IE	0	02:06:57.018	Core 04	EURUSD,M5: 563338 ticks, 3168 bars generated. Environment synchronized in 0:00:00.035. Test passed in 0:48:26.477 (including ticks preprocessing 0:00:00.203).
A2-ABSENCE (verified zero-counts, two patterns — the veto aborts before the shadow print, so no TP_ELECT exists for the refused setup): `TP_ELECT.*bar=2026.09.04 10:35` → 0 rows; `latchBar=2026.09.04 10:40` → 0 rows.

Strategy basis (labeled priors — his words, operator holds the chat originals): the Sept-4 10:35/10:40 SHORT is his twice-ruled MUST-DECLINE (v14 table + 2026-09-17 kill-all: bias gap filled plus opposing gap confirmed); the Aug-28 16:20 and Sept-8 16:40 SHORTs are his kills with queued stop work (no new adjudication owed); his decline covers the 10:35/10:40 bar, only he extends it.

Builder-caught label slip (cosmetic, disclosed — no behavior effect): packet v5's E1b landing label reads L1008-1014 (decls L1012-1014), computed without E1a's +1 shift; disk shows the block at L1009-1015 (decls L1013-1015). Application was by byte-exact anchors (roundtrip-verified identical outside the four hunks), all gates are digest/row-based, and no future packet can reuse the label without fresh probing — but the label as written is wrong by one and the packet is frozen, so it rides here for the record instead of a post-issuance edit.

Builder grading (on the page + disk above): G1 PASS (Test passed, 3168 bars, 563338 ticks); G2 PASS (WS161 21 fields, 3168/3168, mismatch 0); G3 PASS — five fires byte-same as the pre-patch run (3.43/1.74/4.86/2.34/2.52, same targets), Sept-4 10:40 silent, positive veto row exact (dir SHORT, vetoBar 10:30), zero veto rows on fire bars, 5 clears all BOUND with zero CLEAN, no-refire tripwire silent, silent days silent; generality row (Aug-26 veto keeping a must-silent day silent) reported as designed behavior, not halted — halting a passing run over a silence-preserving row would repeat the RECON25 false-void defect; G4 — the two extra fires are his already-killed setups in byte-identical shape, no novel fires, C5 clean; G5 PASS (digests above, FlowLogic `BEC2CBBD`/69852 untouched, kills alive with 19 rows).

Question (one, specific): grade run FRESHVETO-V1 PASS or FAIL against packet G1-G5 on the code and rows above — ruling explicitly (a) the Aug-26 generality-row pass-with-note call and (b) the E1b label slip?

Answer form: plain PASS / FAIL / discrepancy, with line numbers and gate letters.
Verification split: rule on the page only — genuineness vs disk is proven on disk (digests + counts above) and is not answerable from chat by any model tier. Do not ask for files.
Nothing else is asked. Thank you.
