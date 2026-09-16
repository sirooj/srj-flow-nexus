# COMPANION V114-SOURCE - byte-exact pulls for the v114 finding (answers Sonnet tooling demand)

**Pulled:** EA lines 7587-7607 + full RECON41 log rows behind MTEXIT(7) / SESSION_LIMIT(7) / SUPPRESSED-HELD(1). Read-only pull, no edits. EA at pull: SHA above. A6REFUSED counts: RECON40=59 / RECON41=52 (reproduce: lines containing `A6REFUSED` in each journal; -7 = 3 fired-now + 4 never-born).
NOTE: Sonnet seat has no file access by design and no free usage left; this companion waits on disk for transport when usage returns. Nothing here spends authority.

## CODE EA:7587-7607
7587:     bool s1f_seedArmed = (g_state == ST_IDLE);   //--- [SIDE1F] (i) seed-bar exactness flag (new local only)
7588: 
7589:     if(g_state == ST_IDLE)
7590:       {
7591:        if(!inWindow) return;
7592:       if(SessionAlreadyUsed(sess, barTime))
7593:         {
7594:          static datetime s_limitDay  = 0;
7595:          static int      s_limitSess = -1;
7596:          datetime dayKey = TC_DayStart(barTime);
7597:          if(InpDebugLog && (dayKey != s_limitDay || (int)sess != s_limitSess))
7598:            {
7599:             s_limitDay  = dayKey;
7600:             s_limitSess = (int)sess;
7601:             PrintFormat("[SRJ-EA] %s SESSION_LIMIT: %s window already used today - "
7602:                         "all further candidates suppressed until the next window",
7603:                         TimeToString(TimeCurrent(), TIME_DATE|TIME_SECONDS),
7604:                         SessionName(sess));
7605:            }
7606:          return;
7607:         }

## RAW RECON41 MTEXIT (7)
[SRJ-EA] MTEXIT bar=2026.08.28 11:30 reason=TP_TOUCH line=- lineVal=- entry=1.16466 exit=1.16451
[SRJ-EA] MTEXIT bar=2026.09.04 10:40 reason=TP_TOUCH line=- lineVal=- entry=1.16265 exit=1.16274
[SRJ-EA] MTEXIT bar=2026.09.04 16:00 reason=HTF_FLIP line=- lineVal=- entry=1.16018 exit=1.15990
[SRJ-EA] MTEXIT bar=2026.09.07 10:05 reason=TP_TOUCH line=- lineVal=- entry=1.16135 exit=1.16133
[SRJ-EA] MTEXIT bar=2026.09.07 17:10 reason=TP_TOUCH line=- lineVal=- entry=1.16261 exit=1.16315
[SRJ-EA] MTEXIT bar=2026.09.08 13:25 reason=TP_TOUCH line=- lineVal=- entry=1.16205 exit=1.16114
[SRJ-EA] MTEXIT bar=2026.09.08 17:05 reason=POI_BODY_BREAK line=Monthly-POC lineVal=1.16229 entry=1.16213 exit=1.16214

## RAW RECON41 SESSION_LIMIT (7)
[SRJ-EA] 2026.08.28 10:10:00 SESSION_LIMIT: LONDON window already used today - all further candidates suppressed until the next window
[SRJ-EA] 2026.09.04 10:45:00 SESSION_LIMIT: LONDON window already used today - all further candidates suppressed until the next window
[SRJ-EA] 2026.09.04 16:05:01 SESSION_LIMIT: NYAM window already used today - all further candidates suppressed until the next window
[SRJ-EA] 2026.09.07 09:25:00 SESSION_LIMIT: LONDON window already used today - all further candidates suppressed until the next window
[SRJ-EA] 2026.09.07 16:50:00 SESSION_LIMIT: NYAM window already used today - all further candidates suppressed until the next window
[SRJ-EA] 2026.09.08 10:15:00 SESSION_LIMIT: LONDON window already used today - all further candidates suppressed until the next window
[SRJ-EA] 2026.09.08 16:50:01 SESSION_LIMIT: NYAM window already used today - all further candidates suppressed until the next window

## RAW SUPPRESSED-HELD exemplar (09-08 16:40)
[SRJ-EA] SUPPRESSED bar=2026.09.08 16:40 poi=Weekly-VWAP dir=LONG opp=1 higher=0 heldPoi=Monthly-POC heldDir=SHORT heldState=S4_ARMED cum_n=129 cum_opp=43 cum_hi=6 cum_both=5 action=HELD

