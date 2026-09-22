CODE REVIEW REQUEST — v162 — 2026-09-18 (BIRTH authorship: follow-on rule for the ruled-valid 17:00 entry; no code, no run)

Change (one plain sentence): author the narrow follow-on birth rule that births his ruled-valid Sept-8 17:00 SHORT after the session window is spent, or rule the one-per-window suppression correct as-is.

File / function / lines: no code change this relay; tree landed 3a932b9 (EA `6C2E4028` / 602894 B); seed gate EA L7677-7725 (ST_IDLE block: window, session-use, detect, seed print — re-read from disk this turn, carried whole below). Archives: `06_HANDOFFS\FAMILYPASS-V4_JOURNAL.log` (36755 lines / `736C24E8`, pre-veto family tree), `06_HANDOFFS\FRESHVETO-V1_JOURNAL.log` (37303 lines / `8B2ED676`, landed veto tree), plus filed RECON40 extract (`06_HANDOFFS\RECON40_EXTRACT.txt` line 14, pre-rewire tree).

Complete code, verbatim, no elisions (the seed gate, contiguous):
    bool s1f_seedArmed = (g_state == ST_IDLE);   //--- [SIDE1F] (i) seed-bar exactness flag (new local only)

    if(g_state == ST_IDLE)
      {
       if(!inWindow) return;
      if(SessionAlreadyUsed(sess, barTime))
        {
         static datetime s_limitDay  = 0;
         static int      s_limitSess = -1;
         datetime dayKey = TC_DayStart(barTime);
         if(InpDebugLog && (dayKey != s_limitDay || (int)sess != s_limitSess))
           {
            s_limitDay  = dayKey;
            s_limitSess = (int)sess;
            PrintFormat("[SRJ-EA] %s SESSION_LIMIT: %s window already used today - "
                        "all further candidates suppressed until the next window",
                        TimeToString(TimeCurrent(), TIME_DATE|TIME_SECONDS),
                        SessionName(sess));
           }
         return;
        }
        PoiRetestResult pr;
        if(!DetectPoiRetest(barShift, pr) || !pr.found) return;
        s1g_legDir = pr.isLong ? 1 : -1;   //--- [SIDE1G] (0) independent legDir capture (new local only)
        g_s2_seedShift = barShift;   //--- [STAGE-C E-C05] exact-seed bar carriage for the live vote
         g_anchorLine    = pr.topLine;
       //--- [FP-LIMBSEAT-1 S2-3] F3 owns the carried-side write (single
       //--- writer). Live rows carry no declared class -> ABSTAIN
       //--- pass-through of the legacy value (D3 holds by construction);
       //--- legacy output stays the compared label, fire-log identical.
       g_dir           = S2ResolveLive(pr.isLong ? DIR_LONG : DIR_SHORT);
        SrjSideNote("DetectPoiRetest", g_dir);
      g_anchorBarTime = barTime;
      ReadBuf1(g_hPoi, pr.topLine, g_anchorPrice, barShift);
      g_sessionAtEntry = sess;
      g_divLatch = false;
      ENUM_SRJ_STATE prev = g_state;
      g_state = ST_S1_REGIME;
      LogState(prev, g_state);
      //--- [P-BUILD3 E2] seed census: the detector already returns argmin(rank);
      //--- tier-best == rank-best at seed (no held line), so ElectAnchor parity
      //--- holds by construction. Additive print only; assigns nothing.
      if(InpDebugLog)
         PrintFormat("[SRJ-EA] ANCHOR_ELECT bar=%s action=SEED poi=%s rank=%d tier=%d dir=%s",
                     TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift),
                                  TIME_DATE|TIME_MINUTES),
                     AnchorStr(), g_authorityRank[g_anchorLine],
                      B3_AnchorTier(g_anchorLine), DirName(g_dir));
         }

His figures (filed record, carried as authorship targets, never as code literals): Sept-8 17:00 SHORT, his entry 1.16220, stop 1.16274, TP 1.16114 (`06_HANDOFFS\BUILDER_CHECKPOINT_POST-V30.md` line 89; `06_HANDOFFS\BUILDER_FINDING_SEP8_MANUAL_REVIEW.md` line 19 rules 17:00 SHORT valid; RECON40 row below shows rule R 106/54 = 1.96 per AGREEMENT-02). His 16:45 SHORT stands declined (kill-all 2026-09-17, true stop two swings out) and his 16:25 LONG stands invalid — neither may be resurrected by any rule authored here.

Mechanism (disk, not prose — machine-pulled this turn): on current trees the 16:30 seed fires 16:45 (his declined A3), the fire marks the NYAM window used (SESSION_LIMIT 16:50:01), and the 16:55 confirmed SHORT poll dies at the seed gate L7682 SessionAlreadyUsed with no print — no ANCHOR_ELECT, no S1 seed, no S5 eval at 17:00 (IDLE both archives). Marks are made by fires, not seeds: five post-fire SESSION_LIMIT prints stand, and Sept-4 carries a 10:35 seed with no fire and no limit print. Veto-independent: the full chain is byte-identical on both archives (veto touches none of it). RECON40 evaluated the 16:55 seed (no 16:40-17:00 fire there, 0 rows two patterns, window unspent) and killed it on the stale stop (R 0.67) — so the current miss is born of the family-pass fix itself: the machine now spends the window on a declined fire and starves the valid entry.
CUR-A3-SIGNAL: HP	0	02:00:44.015	Core 04	2026.09.08 16:45:01   [SRJ-EA] ALERT SRJ SIGNAL SHORT EURUSD M5 | Monthly-POC | NYAM | R=1.62 SL 1.16274 TP 1.16114 spr=1
BASE-SESS: [SRJ-EA] 2026.09.08 16:50:01 SESSION_LIMIT: NYAM window already used today - all further candidates suppressed until the next window
CUR-SESS: [SRJ-EA] 2026.09.08 16:50:01 SESSION_LIMIT: NYAM window already used today - all further candidates suppressed until the next window
CUR: [SRJ-EA] RETESTBOOK bar=2026.09.08 16:55 hits=1 Monthly-POC:r6:dS
CUR: [SRJ-EA] SIDE1D_BOTHDIRS bar=2026.09.08 16:55 bl=-1 br=2147483647 sl=4 sr=6 sel=SHORT sline=4 scode=Monthly-POC lcode=-
CUR: [SRJ-EA] CONFIRMPOLL bar=2026.09.08 16:55 anchor=Monthly-POC dir=SHORT oppCandle=1 bodyDir=1 body=6pts doji=0 touchAttr=1 confirm=1 shadow=true
BASE-IDLE17: [SRJ-EA] SEL54STAGE bar=2026.09.08 17:00 stage=S2POLL dir=NONE state=IDLE
CUR-IDLE17: [SRJ-EA] SEL54STAGE bar=2026.09.08 17:00 stage=S2POLL dir=NONE state=IDLE
R40-IE: [SRJ-EA] SIDE1X_STOPREF bar=2026.09.08 16:55 dir=SHORT entry=1.16220 liveStop=1.16379 ruleStop=1.16274 ruleSlot=7 ruleImb=1 liveTp=1.16114 liveR=0.67 livePass=0

Bounds (from record, no invention): SESSION_LIMIT stays for everything else (no blanket removal — blast-radius cap); A3/16:25 declines preserved exactly; no-band-aid standing rule; authorship states predicate, site, hold, predicted entry/SL/TP/R for 17:00, non-regression (7 signals, A2 silent, silent days silent), and print-only-shadow-first with live only via later dual-key plus tokens. Novel evidence for the run: first measurement of a post-fire follow-on birth rule — the 17:00 SHORT born with stated operands, or proven unbirthable under the bounds.

Question (one, specific): author the 17:00 follow-on birth rule within the bounds above, or rule the one-per-window suppression correct as-is — with line numbers?

Answer form: plain authored-rule / suppression-correct / discrepancy, with line numbers.
Verification split: rule on the page only — genuineness vs disk is proven on disk (digests + counts above) and is not answerable from chat by any model tier. Do not ask for files. Same text goes to every model; file-access proof is builder-disk plus his-eyes only.
Nothing else is asked. Thank you.
