# RELAY v118 - EXIT MODEL AUDIT (fresh-safe, SAME-PROMPT both seats)

**Version:** v118 (audits the sole remaining blocker: TP/outcome semantics. Follows Luna `LUNA-V116-GAP-TP-DISPOSITION-001` (GATE-ONLY named) + V117 (suppression closed). Sonnet TP-exit find verified on disk v116-turn; audited to mechanism here. NOT a re-ask of settled items: suppression closed, naming distinct, R-gate arithmetic stands.) **Fresh-profile-safe:** base + code + rows + table ALL INLINE. Tree unchanged (`BFAE4F4B`/591933 uncommitted; RECON17 frozen). **Paste set:** this relay ALONE (both seats IDENTICAL asks). Return whole verdicts/reviews with model + date + Ruling-ID, one source per message. His part: transport only.

## 0. Base (complete)
- Suspended on TP grounds only; R-GATE-ONLY rule stands; shadow stands; 10:10 unrealized; all words SPENT. This relay audits the exit model to mechanism. No build/run/commit here.

## 1. SOURCE E - exit selection core (byte-exact pulls)
### Per-bar CURRENT target (EA:10904-10919, working-set recompute each bar)
  10904:    double curTp = 0.0;
  10905:    bool   haveTp = MtNearestTpTarget(barShift, g_mtrade.dir, nextOpenPx, curTp);
  10906:    double breakLineVal = 0.0;
  10907:    string breakLineName = "";
  10908: 
  10909:    //--- (d) SL: price trades through the latched stop (wick or body; the standard
  10910:    //--- stop semantics; the EXITMODEL-1 Q5 recommendation, unobjected)
  10911:    if(g_mtrade.dir == DIR_LONG  && l <= g_mtrade.slRef) vSL = true;
  10912:    if(g_mtrade.dir == DIR_SHORT && h >= g_mtrade.slRef) vSL = true;
  10913: 
  10914:    //--- (b) TP: the CURRENT nearest valid target (Q6), exit on TOUCH (5.1/2.2)
  10915:    if(haveTp)
  10916:      {
  10917:       if(g_mtrade.dir == DIR_LONG  && h >= curTp) vTP = true;
  10918:       if(g_mtrade.dir == DIR_SHORT && l <= curTp) vTP = true;
  10919:      }
### Exit assignment + SL-first precedence (EA:11011-11016)
  11011:    if(vSL)         { g_mtrade.exitReason = MT_EXIT_SL;             g_mtrade.exitPrice = g_mtrade.slRef; }
  11012:    else if(vTP)    { g_mtrade.exitReason = MT_EXIT_TP_TOUCH;       g_mtrade.exitPrice = curTp; }
  11013:    else if(vBREAK) { g_mtrade.exitReason = MT_EXIT_POI_BODY_BREAK; g_mtrade.exitPrice = nextOpenPx; }
  11014:    else            { g_mtrade.exitReason = MT_EXIT_HTF_FLIP;       g_mtrade.exitPrice = nextOpenPx; }
  11015: 
### Nearest-side filter (EA:2204-2209, TpTargetUpdateBest head)
  2204: void TpTargetUpdateBest(double v, ENUM_SRJ_DIR dir, double currentPrice,
  2205:                          double &best, bool &haveBest)
  2206:   {
  2207:    if(v == EMPTY_VALUE || v <= 0.0) return;
  2208:    bool inDir = (dir == DIR_LONG) ? (v > currentPrice) : (v < currentPrice);
  2209:    if(!inDir) return;
### Read: TP_TOUCH exits at per-bar curTp (nearest favorable-vs-CURRENT line), NOT entry liveTp; SL wins ties; non-TP reasons exit at nextOpen by construction. Side test is vs CURRENT price, never vs entry (EA:2208) - adverse-vs-entry touches exit by construction.

## 2. SOURCE F - EXITVERDICT trajectory rows (curTp per bar; vSL=0 throughout)
[SRJ-EA] EXITVERDICT bar=2026.08.28 11:25 dir=SHORT entry=1.16466 curTp=1.16364 vSL=0 vTP=0 vBREAK=none vHTF=0 scope=1 htfH=-1 htfM=-1 htfL=1 want=-1 anti=1
[SRJ-EA] EXITVERDICT bar=2026.08.28 11:30 dir=SHORT entry=1.16466 curTp=1.16451 vSL=0 vTP=1 vBREAK=none vHTF=0 scope=1 htfH=0 htfM=0 htfL=0 want=0 anti=-1
[SRJ-EA] EXITVERDICT bar=2026.09.04 10:40 dir=SHORT entry=1.16265 curTp=1.16274 vSL=0 vTP=1 vBREAK=none vHTF=0 scope=1 htfH=0 htfM=0 htfL=0 want=0 anti=-1
[SRJ-EA] EXITVERDICT bar=2026.09.04 16:00 dir=LONG entry=1.16018 curTp=1.16302 vSL=0 vTP=0 vBREAK=none vHTF=1 scope=1 htfH=-1 htfM=1 htfL=-1 want=1 anti=2
[SRJ-EA] EXITVERDICT bar=2026.09.07 10:00 dir=LONG entry=1.16135 curTp=1.16200 vSL=0 vTP=0 vBREAK=none vHTF=0 scope=1 htfH=1 htfM=1 htfL=-1 want=1 anti=1
[SRJ-EA] EXITVERDICT bar=2026.09.07 10:05 dir=LONG entry=1.16135 curTp=1.16133 vSL=0 vTP=1 vBREAK=none vHTF=0 scope=1 htfH=0 htfM=0 htfL=0 want=0 anti=-1
[SRJ-EA] EXITVERDICT bar=2026.09.07 17:05 dir=LONG entry=1.16261 curTp=1.16315 vSL=0 vTP=0 vBREAK=none vHTF=0 scope=1 htfH=1 htfM=1 htfL=1 want=1 anti=0
[SRJ-EA] EXITVERDICT bar=2026.09.07 17:10 dir=LONG entry=1.16261 curTp=1.16315 vSL=0 vTP=1 vBREAK=none vHTF=0 scope=1 htfH=0 htfM=0 htfL=0 want=0 anti=-1
[SRJ-EA] EXITVERDICT bar=2026.09.08 13:20 dir=SHORT entry=1.16205 curTp=1.16083 vSL=0 vTP=0 vBREAK=none vHTF=0 scope=1 htfH=-1 htfM=-1 htfL=-1 want=-1 anti=0
[SRJ-EA] EXITVERDICT bar=2026.09.08 13:25 dir=SHORT entry=1.16205 curTp=1.16114 vSL=0 vTP=1 vBREAK=none vHTF=0 scope=1 htfH=0 htfM=0 htfL=0 want=0 anti=-1
[SRJ-EA] EXITVERDICT bar=2026.09.08 17:00 dir=SHORT entry=1.16213 curTp=1.16114 vSL=0 vTP=0 vBREAK=none vHTF=0 scope=1 htfH=-1 htfM=1 htfL=-1 want=-1 anti=1
[SRJ-EA] EXITVERDICT bar=2026.09.08 17:05 dir=SHORT entry=1.16213 curTp=1.16114 vSL=0 vTP=0 vBREAK=Monthly-POC vHTF=0 scope=1 htfH=0 htfM=0 htfL=0 want=0 anti=-1
### Read: PR 1.16364->1.16451 / KO 1.16200->1.16133 / FL 1.16083->1.16114 change across bars then touch; JJ static. LIMIT STATED: verdict rows do not name the TP line - nearest-reselection vs same-line-move unresolved at row level.

## 3. SOURCE G - exit-vs-entry table, all 7 fires
2026.08.28 SHORT e=1.16466 tp=1.16364 x=1.16451 TP_TOUCH dTP=87pt PROFIT
2026.09.04 SHORT e=1.16265 tp=1.16224 x=1.16274 TP_TOUCH dTP=50pt LOSS
2026.09.04 LONG e=1.16018 tp=1.16302 x=1.15990 HTF_FLIP dTP=312pt LOSS
2026.09.07 LONG e=1.16135 tp=1.16200 x=1.16133 TP_TOUCH dTP=67pt LOSS
2026.09.07 LONG e=1.16261 tp=1.16315 x=1.16315 TP_TOUCH dTP=0pt PROFIT
2026.09.08 SHORT e=1.16205 tp=1.16072 x=1.16114 TP_TOUCH dTP=42pt PROFIT
2026.09.08 SHORT e=1.16213 tp=1.16114 x=1.16214 POI_BODY_BREAK dTP=100pt LOSS

## 4. Asks (IDENTICAL both seats)
- **Ask-1 MECHANISM?** Per-bar curTp + exit=curTp + SL-first + nextOpen-nonTP as coded (correct-or-correct per line)?
- **Ask-2 ADVERSE-LAWFUL?** KO/DH loss-close TP_TOUCH: lawful per Q6 CURRENT-nearest-target (side-vs-current by design) or defect? And R: stays GATE-ONLY, or does this audited model restore outcome-meaning (in what bounded form)? Rule BY NAME.
- **Ask-3 DISPOSITION:** (a) LIFT (re-clear effective, corrected set) / (b) SUSPEND stands (name the remaining defect) / (c) HALT (live fix dead). No band-aid, no smoothing.
- Threshold: filed-authoritative, R>=1.0, A+ strict, alert-only. Locks: RECON17 frozen; build uncommitted; all words SPENT (fresh token + word + run spec owed only after a lift).

## 5. Branches
- Lift -> token + word + spec -> 0/0 -> run -> grade -> relay. Suspend-stands -> QUIESCENT (exit question carried). Halt -> QUIESCENT (shadow stands; live dead). Amend -> one closed-set re-ask. Split -> ONE closed-set re-ask.

(End - v118 awaits verdicts + Ruling-IDs; nothing builds/runs/commits/spends here.)
