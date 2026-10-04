# BUILDER RESULT B-17 - his chart calls banked verbatim; 8/27 exit, 1-Sep 5m read, CQD read and 15m read source measured (no EA edit, no compile, no tester run)

## His three 8/27 questions answered first, in trader words

Your 27 Aug New York short (entered 1.16524 at the 17:05 open, stop 1.16598):

1. "Why did it exit on 17:15? The D VWAP has not been retested." The exit was decided on the 17:10 bar, not the 17:15 bar. The 17:10 bar's body closed back above the Weekly POC line at 1.16552 (body 1.16513 to 1.16556), and that break of a higher line exits the trade by your anchor-rank rule. The tester filled the close at 17:15:02 at 1.16513 (deal #3) - 17:15 is the fill time, 17:10 is the bar that caused it. The Daily VWAP sat at 1.16500, untouched.
2. "If this is due to your SL, where did you put it? Is it not at 16:25 high?" No, the stop was never touched (highest high after entry was 1.16578 on the 17:05 bar, 20 points under your stop). And yes - your stop is exactly at the 16:25 high: 1.16598, the 16:25 bar's wick top, zero points of difference.
3. "Is this due to your wiggle room because the candle almost nearly but not yet touched the D VWAP?" No. There is no wiggle room anywhere at the exit: a break needs the body strictly through the line, exact equality never breaks. The lowest low from your entry to the exit was 1.16504 on the 17:10 bar - 4 points above the Daily VWAP at 1.16500. Almost touched, never touched, and the touch-target leg correctly did nothing with it.

And on the entry itself you are right and it is now banked: the nearest valid target was the Daily VWAP at about 1.16499, only 0.34R under your stop, so the setup should have been skipped below your 1R floor - your journal's INVALID stands. The EA took it only because its target list deletes a VWAP whenever the entry sits on the same family's POC (Daily POC entry vs Daily VWAP target) - the exact nuance you ordered separated: that rank applies only when the VWAP jumps or the bias flips on a body-close break. Your words W1-W6 are banked word-for-word in the strategy skill (section 11), your journal (rows 281/285/301-304) and the ledger (items 1159-1164), so you never have to explain them again.

## Part A - start gate

- A1 git log -1: ee8616b865fdbcdb679a309c4ac042fd45522b62 on builder/B-16 (as expected). git status --short line count: 59. Branch builder/B-17 cut from ee8616b (dirty tree carried, nothing reset).
- A2 SHA-256 prefix checks, all pass, no STOP: EA Experts/SRJ_FlowNexus_EA.mq5 F04AF9C3 (685444 B, on disk, uncommitted); Include/SRJ/SRJ_HTFEngine.mqh D5FD5B06; Indicators/SRJ_FlowLogic.ex5 27B5F272; Experts/SRJ_FlowNexus_EA.ex5 D7DEA923. Strategy skill .opencode copy 3DEA0519 (127 lines); the .agents copy is a 12-line stub, never edited.
- A3 backups (never committed): .opencode/skills/srj-strategy/SKILL.md.preB17 = 3DEA0519; .opencode/skills/srj-relay/SKILL.md.preB17 = 1D22F06D; OPERATOR_TRADE_JOURNAL.csv.preB17 = 2E7CC559; SRJ_FLOW_NEXUS_LEDGER.md.preB17 = 72C8B90F.
- A4 his trade journal is SRJ_FlowNexus_Local/00_CURRENT_WORKING/OPERATOR_TRADE_JOURNAL.csv (142955 B before, 145719 B after; last row 301 before, 304 after; row 301 is the 9/1 NY VALID row). Ledger is SRJ_FlowNexus_Local/06_HANDOFFS/SRJ_FLOW_NEXUS_LEDGER.md (1105186 B before, 1108737 B after; last item 1158 before, 1164 after).

## Part B - banked his words (rule-conflict check first: no STOP-C skip)

- Checked W1-W6 against the skill, CHARTER and findings. POC-OVER-VWAP-SCOPE narrows the second half of OWN-SOURCE-EXCLUSION (section 5) on his own explicit order ("so please separate this nuance rule") - a lawful later-word amendment, not a conflict. The 8-Sep-09:45 CQD finding is a different date from his 1-Sep-09:45 call - no conflict. CHARTER divergence taxonomy (codes 1 and 3 bullish) agrees with his type-1-bullish read - no conflict. All six bullets banked.
- B1 strategy skill .opencode copy: section 11 appended at lines 129-141 (W1-W6 verbatim at 130-135, six bullets at 136-141). New SHA-256 2B76301A6210F55F1770C9CEEF8F62ADA1EE53C3AEACEF6BAF22AF7091A266B2, 141 lines. .agents stub untouched.
- B2 journal: rows 302 (8/27 17:05 INVALID), 303 (1 Sep 09:45 INVALID), 304 (1 Sep 09:55 EA-only INVALID) added with his quotes and section-11 cites (CSV-quoted, machine-validated 32 fields on all 1056 rows); rows 281 (7 Sep 09:20), 285 (8 Sep 10:10) and 301 (1 Sep 17:35) carry his 15m read (15m-structure cell plus quoted W6). No field he did not give was invented (structure cells he gave: 15m only).
- B3 ledger items 1159-1164, one per section-11 bullet, each with the verbatim quote, date 2026-10-04 and skill line (136-141).

## Part C - the 8/27 17:05 SHORT (j3 = RECON62-B15R1_JOURNAL.log)

- C1 D VWAP. RETESTDIAG (nearest-line census off the bar low, EA 2272-2283) prints nearBelow=Daily-VWAP:15.6pts at 17:00 (j3:7333) and 15.7pts at 17:05 (j3:7531); EXITCENSUS prints Daily-VWAP val=1.16500 at 17:10 (j3:7558). So the D VWAP sat about 1.16499 under the 1.16524 entry - 25 points of reward against the 74-point stop (1.16598), R about 0.34, below 1R. TPCENSUS #68 (j3:7367, winner Yearly-VWAP 1.16322, R 2.73) never lists it: the POI loop drops it at the validity gate first, printed twice as `UJPOISKIP bar=2026.08.27 17:00 line=Daily-VWAP anchor=Daily-POC` (j3:7364 booking loop, j3:7366 census mirror). The drop spot, raw (EA 2472-2482):
```
2472: bool UjPoiTargetValid(int k, int anchor)
2473:   {
2474:    if(k == anchor) return false;
2475:    string ak = ((anchor >= 0 && anchor < POI_NLINES) ? g_lineCode[anchor] : "");
2476:    string ck = g_lineCode[k];
2477:    int ap = StringFind(ak, "-"), cp = StringFind(ck, "-");
2478:    if(ap < 0 || cp < 0) return true;
2479:    if(StringSubstr(ak, 0, ap) != StringSubstr(ck, 0, cp)) return true;
2480:    if(StringSubstr(ak, ap + 1) == "POC" && StringSubstr(ck, cp + 1) == "VWAP") return false;
2481:    return true;
2482:   }
```
called at EA 2579-2580 (booking race) and EA 2727-2728 (census mirror). Anchor Daily-POC vs candidate Daily-VWAP trips line 2480 (same "Daily" family, POC-over-VWAP).
- Plain line: the POC-over-VWAP rank removed the D VWAP from the race - not own-source (different line), not a taken test.
- C2 stop. `SEL52CTX seq=108 bar=2026.08.27 17:00 site=S5 dir=SHORT oPx=1.16524 slRef=1.16652` (j3:7378); `SLADDER rung=2 slot=6 barTime=2026.08.27 16:25 px=1.16598 wick=1.16598 body=1.16583 rungR=2.73` (j3:7385); `SLADMARK rung=2 slot=6 barTime=2026.08.27 16:25 px=1.16598` (j3:7386); `SLIMBR slToday=1.16652 rToday=1.58 slFractal=1.16598 rFractal=2.73` (j3:7380); `STOPRESOLVE incomingSlRef=1.16652 liveSel=2 slLive=1.16598` (j3:7490); fired `SIGNAL SHORT Daily-POC NYAM R=2.73 SL 1.16598 TP 1.16322` (j3:7506). The 16:25 M5 high is 1.16598 (SLADDER wick; same 1.16598 sits in the SWINGDUMP swing-high list, j3:7369).
- Plain line: yes, the stop is at the 16:25 high - 1.16598 against 1.16598, zero points apart (fractal rung chosen over the 1.16652 today-stop).
- C3 exit. `EXITVERDICT bar=2026.08.27 17:05 vBREAK=none h=1.16578 l=1.16515 tpB=1.16322` (j3:7548); `EXITCENSUS bar=2026.08.27 17:10 line=Weekly-POC val=1.16552 bodyLo=1.16513 bodyHi=1.16556 verdict=BREAK` (j3:7559; Daily-POC 1.16541 also BREAK-coincident, j3:7557; Daily-VWAP 1.16500 verdict=ok trigger=0, j3:7558); `EXITVERDICT bar=2026.08.27 17:10 vBREAK=Weekly-POC tpB=1.16322 h=1.16557 l=1.16504` (j3:7569); `MTEXIT bar=2026.08.27 17:10 reason=POI_BODY_BREAK line=Weekly-POC lineVal=1.16552 exit=1.16513` (j3:7570); tester `17:15:02 market buy close #2 (1.16513)` deal #3 (j3:7571); `MTCLOSE closeBar=2026.08.27 17:10 deal=3 closePx=1.16513` (j3:7576); `MTLIFE openBar=2026.08.27 17:05 closeBar=2026.08.27 17:10 verdict=POI_BODY_BREAK` (j3:7577). Broken line Weekly-POC at 1.16552; body = 17:10 open to 17:15 open (1.16556 to 1.16513, the T161K open-to-next-open body, EA 11861-11862), closed below the line. Lowest low 17:05 to exit: 1.16504 (17:10) vs D VWAP 1.16500 - 4 points above, never touched. Buffer search at the exit spot, raw (EA 11863, 11953-11963):
```
11863:    double EPS = 0.001 * _Point;   // the T161K float guard, threshold-free semantics
11953:        //--- [P-SLDEF-1 E14] same N1 body counter at the exit site. Grounding:
11954:        //--- break needs bodyLo < L-EPS (LONG) / bodyHi > L+EPS (SHORT), both
11955:        //--- strict: exact equality never breaks.
11962:          if(g_mtrade.dir == DIR_LONG)  through = (bodyLo < L - EPS);
11963:          else                          through = (bodyHi > L + EPS);
```
 The only tolerance-shaped code is a 0.001-point float guard with strict inequality - no points allowance, no wiggle room (his EXACT-PRICE-NO-LENIENCY holds).
- Plain line: the 17:15 exit was neither the stop (1.16598, never neared) nor a D VWAP touch (4 points short) - it was a body break of the Weekly-POC at 1.16552 on the 17:10 bar, filled next open 17:15:02; no wiggle room took part.

## Part D - 1 Sep London

- D1 EA 5m bias per pass (UJPROBE reads the last closed M5 bar at each new-bar pass, EA 12288). j2 and j3 identical, all passes: 09:25/09:30/09:35/09:40/09:45/09:50 ltf=-1.0; first +1.0 at bar_key 09:55 (j3:14016, j2:14319), staying +1.0 at 10:00/10:05. j1 has no UJPROBE rows (older tree); its bias record is SHORT polls plus the 10:00 LTF_MISALIGN abort of the SHORT (j1:10133-10135). His chart: bearish through the 09:55 candle, bullish from the 10:00 open - the EA's closed-bar record matches his chart exactly; the first bullish closed bar is the 09:55 bar itself, readable only at the 10:00 open.
- Plain line: the EA first read bullish on the 09:55 bar (10:00 pass) - zero bars early on closed bars; but it FIRED the LONG at the 09:55 pass off the 09:50 bar (deal #6 at 1.16031, SIGMAP 09:55->09:50), a full bar before his flip could count.
- D2 the check, raw. Helper (EA 2414-2420):
```
2414: bool CheckLtfAlign(int barShift, ENUM_SRJ_DIR dir, bool &alignedOut)
2415:   {
2416:    double ltfBias;
2417:    if(!ReadFlow(FL_BUF_LTF_BIAS, ltfBias, barShift)) return false;
2418:    alignedOut = ((int)MathRound(ltfBias) == ((dir == DIR_LONG) ? 1 : -1));
2419:    return true;
2420:   }
```
S2 gate (EA 8404-8428): unaligned LONGs die (S2SEEDBIAS_KILL), wait (S2WAIT), or bypass on m15 (S2PROMOTE_M15); post-S2 invariant (EA 7387-7398, 7450-7456): opposed LTF holds on m15/carve (UJLTFHOLD) or defers the abort (UJDEFERABORT, applied by UJDEFERAPPLY only if anchor+dir+barTime still match, EA 8462-8476). In-window fact: zero UJPROV/S2PROMOTE/S2WAIT/S2SEEDBIAS_KILL/LTFFLIP/UJLTFHOLD/UJDEFER rows for this LONG, and no ANCHOR_ELECT or SIDE1T_SEEDBIAS seeded a LONG that morning (last seed-bias capture: 09:15 SHORT biasAligned=1, j3:13672). The LONG arrived via `SIDE1C_YIELD bar=2026.09.01 09:50 from=Yearly-POC/SHORT to=Weekly-VWAP/LONG` (j3:13942) - the yield path (EA 8443-8460) switches anchor and direction on contender confirmation with no bias read and no bias capture, so RGATE's seedBiasAl=1 (j3:13989) is stale carriage from the 09:15 SHORT seed, misread as LONG-aligned.
- Plain line: the 09:55 LONG got through because it never met the 5m gate - it entered through the yield with no bias check, and the only bias number on its papers is the SHORT's stale aligned stamp.
- D3 the 09:45 SHORT. CQD rows: `CQD DIV verdict=+1 shift=2 bar=2026.09.01 09:20` at the 09:30 pass in j1 (j1:9988), j2 (14051) and j3 (13747) alike, nothing newer printed 09:35-10:00 anywhere; `CQDRECHECK passA=1.0 passB=1.0 divLatch=0` (j3:13767); `SIDE1Q_CQDKILL obValid=1.0 fvgValid=1.0 cqdDiv=UNREAD` (j3:13988); `ELIGSTATE cqd=UNREAD` (j3:13987). Decision rows 09:35-09:50: j1 TPCENSUS #146-149 SHORT winners YNYL with CONFIRMPOLL SHORT confirm=0 every bar (j1:10039-10124); j2 UJ1R POLL FAIL sub-1R every bar (09:45: R=0.32 on taken 1.15997, j2:14207) with confirm=0 (j2:14108-14255); j3 UJ1R POLL PASS (09:45 R=1.36 j3:13895; 09:50 R=1.56 j3:13930) with confirm=0 every bar (j3:13807-13939), LONG challenger HELD (j3:13900/13935), LONG fired 09:50 instead (j3:13994-13998).
- Plain lines: the EA read +1 (type-1-bullish, CHARTER taxonomy) at 09:45 in j1 and in j3 - same reading, and it agrees with his blue-solid chart read; no CQD kill kept anything silent (UNREAD/latch 0 everywhere). What kept the SHORT silent: j1 never confirmed (confirm=0, then the 10:00 LTF_MISALIGN abort); j2 refused sub-1R (R 0.32 at 09:45) and never confirmed; j3 passed R (1.36/1.56) but never confirmed, and the unconfirmed LONG took the session instead.

## Part E - where the 15m read comes from

- E1 EA side, raw (EA 9068-9082): the guard reads `ReadFlow(FL_BUF_HTF_LOW, uj_m15, barShift)` at barShift=1 (last closed M5) on the M5 new-bar pass (EA 12279-12289); NOMATCH kills the unconfirmed bar, PASS lets it stand, BYPASS skips the guard on a confirmed bar. Indicator side, raw: `input bool inUseConfirmedHTFOnly = false;` (FlowLogic 252); `g_bufHtfLo[target] = (h3_b == "Bull") ? 1.0 : ...` with `h3_b = inUseConfirmedHTFOnly ? g_htfLo.outCBias : g_htfLo.outBias` (FlowLogic 1195-1200), exported per closed M5 slot (`int target = i - 1`, FlowLogic 1072). Engine (HTFEngine 114, 176-185, 512-516, 542-561): CopyRates pulls the forming 15m bar too, activation keys off the forming bar's prices, live outBias includes it, confirmed outCBias only on closed bars.
- Plain line: with the default input the guard reads the FORMING 15m candle (live bias as known at that M5 bar), sampled at each M5 new-bar first tick for the just-closed M5 slot. Proven on record: UJM15ROW prints m15time = the forming candle (bar_key 16:40 -> m15time 16:45, j3:15233; bar_key 16:55 -> m15time 17:00, j3:15333).
- E2 forming-candle map (j3 UJALIGN rows): 9/1 LONG - bull 16:45 (j3:15289), bear 16:50 (j3:15327) and 16:55 (j3:15366), bull 17:00/17:05/17:10 (j3:15405/15440/15473); 9/7 LONG - bull 09:00 (j3:25901), bear 09:05/09:10/09:15 (j3:25932/25968/26006); 9/8 SHORT - bear 10:00 (j3:28673), bull 10:05 (j3:28729) and 10:10 (j3:28776, past his entry, still against).
- Plain lines: 9/1 - yes, both bears (16:50, 16:55 slots, read at the 16:55 and 17:00 passes) fall inside the forming 16:45-17:00 candle's life. 9/7 - yes, all three bears fall inside forming candles (09:05/09:10 in the 09:00-09:15 candle, 09:15 in the just-born 09:15-09:30 candle). 9/8 - yes, both bulls fall inside the forming 10:00-10:15 candle. Every against-trade read in B-16 D1 was taken while that 15m candle was still forming.
- E3 last-closed 15m read at those passes: unmeasurable without a run. No print in j1/j2/j3 carries the confirmed-only 15m value (zero SRJ-HTF-UJDBG rows in all three journals - the only printer of the outBias/outCBias pair, HTFEngine 591; UJPROBE/UJM15ROW/UJALIGN all carry the live vote). Against his chart (9/1 bull, 9/7 bull, 9/8 bear): the live reads agree with him on most passes and oppose him exactly on the E2 bars above.

## Part F - lane text, files, push

- F1 srj-relay skill: Fresh-sessions bullet + Result-file bullet appended. New SHA-256 E5713CDB13341749B223A84A130B7934BB2F278113E7467E4EC24D4550149DA1, 50 lines.
- F2 PROMPTQL_PLANNER_CONTEXT.md: section-2 trading-rules-copy bullet + section-3 operator-questions bullet appended. New SHA-256 85D6F901FD84AFBA2924C4FECDD40FFE13ED28D677AA639F9D40AF7EF58F39FE.
- F3 this file. F4 pointer (35-line cap) updated: B-17 MEASURED, disk SHAs unchanged, section 11 banked, Next = relay B-18.
- F5 final disk state: EA F04AF9C3 on disk (685444 B, uncommitted), EA.ex5 D7DEA923 matches it, HTFEngine D5FD5B06, FlowLogic.ex5 27B5F272, terminal.ini [Tester] still June USDJPY (1780272000/1781308800). STOP-B check at close: re-verified unchanged, nothing to restore. No compile, no tester run, terminal untouched.
- F6 commit + push to builder/B-17 ONLY: BUILDER_RESULT_B17.md, BUILDER_SESSION_POINTER.md, .opencode/skills/srj-strategy/SKILL.md, .opencode/skills/srj-relay/SKILL.md, PROMPTQL_PLANNER_CONTEXT.md, OPERATOR_TRADE_JOURNAL.csv, SRJ_FLOW_NEXUS_LEDGER.md. Backups (.preB17) and j1/j2/j3 stay unpushed.

### Journal-code glossary (codes cited above, few words each)
- STATE S1-S5: seed, align, zone, armed, gate-check lifecycle. ANCHOR_ELECT/SEED: election/seed. SIDE1T_SEEDBIAS (CONSIDER/REJECT-BIAS-TIMING): seed bias verdict. CONFIRMPOLL: confirmation terms. TPCENSUS (winner/best/distPts/admitted): target census. TP_ELECT (shadow/entry/sl/tp/R): election. SIDE1O_ELIGSTATE (slRef/rLive/livePass): eligibility. UJ1R (POLL/FIRELOCAL/FIRE/PASS/FAIL): R check. SLNONFIRE (RR_FAIL): no-fire. SUPPRESSED (HELD): holder kept. SIDE1H_WOULDPREEMPT/SIDE1D_BOTHDIRS: contention. SIDE1C_YIELD/PREEMPT: holder switch. SIDE1R_RGATE (seedBiasAl): seed-eval link. SIDE1Q_CQDKILL/SIDE1W_CQDWINDOW/CQDRECHECK (divLatch): CQD gates. CQD DIV verdict: indicator divergence code. SEL52CTX/SEL52/SLADDER/SLADMARK/SLEXT481/SLIMBWALKF/SLIMBR/SLEXT43/SLEXT1/STOPRESOLVE/SWINGDUMP: stop ladder and resolution. UJPOISKIP: POI target skipped. UJDTTERMS/RETESTDIAG/RETESTBOOK: retest diagnostics. UJPROBE (ltf/m15/div): per-bar bias/div probe. UJM15ROW (m15time/m15vote): 15m vote at 15m ticks. UJALIGN_PASS/NOMATCH/BYPASS (m15/rf): 15m guard. UJCONFIRMCARRY/CONFIRM_PREBIND: same-bar confirm fire. ORDER (biasAtGate/gateOutcome): S5 census. UJ1R/SIGNAL/ENTRY_TICKET/MTSNAP/UJMEMO_PASS/UJADMIT: fire trail. EXITCENSUS (side/trigger/verdict): per-line exit census. EXITVERDICT (vSL/vTP/vBREAK/tpB): exit verdict. MTEXIT/MTCLOSE/MTLIFE/ALERT EXIT: managed exit and fill. LTFFLIP/LTFDIAG/UJLTFHOLD/UJDEFERABORT/UJDEFERAPPLY/UJDEFERDROP: post-S2 LTF machinery. UJRESEED (al/ok): op-retest reseed. SEL54BAR/SRjSideProvEmit (cqd/bias1/bias2): probe-bar snapshot. BIASCENSUS_HIT: bias encoding census. A6SUPP/A6TERM/A6FIRED/A6REFUSED/ABORT/STAND-DOWN/SHADOW_CONVERT: admission terminal states. UJPOOLCOV/UJPOOLSTATE/UJPOOLSVC/SIGMAP: pool service and bar map. XOB-PROMOCENSUS: indicator OB promotion print. LOTDIAG/REF_OB_DEEP/IDCHANGE/LEGTOUCH/SEL61SRC/SLADDER/SLIMB/A6SUPP: stop/zone census rows. EXITCENSUS curTp/tpB: current vs booked TP.

## Carried note (for the planner; B-18 per its plan)
- E3 is unmeasurable from prints: no journal row carries the last-closed (confirmed-only) 15m read, so B-18's 15m candidate (make the read his chart's read) cannot be proven from j1/j2/j3 alone - it needs a run with the HTF debug printer on, or new prints. The live-vote evidence for it is complete in E2.
- D2 pinpoints the B-18 edit for the 09:55 LONG: the SIDE1C_YIELD path (EA 8443-8460) switches anchor and direction with no bias read, and RGATE's seedBiasAl is stale carriage (last capture: the 09:15 SHORT seed). Refusing entry against the 5m bias read at the entry open closes exactly this hole; the closed-bar record (UJPROBE) already agrees with his chart.
- C1 pinpoints the B-18 edit for 8/27: UjPoiTargetValid (EA 2480) deletes a VWAP for a same-family POC anchor with no gap test. Letting the VWAP back into the race outside the gap case kills 8/27 17:05 below 1R (R about 0.34) per his W1 order.

(End of file)
