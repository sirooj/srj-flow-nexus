# RELAY v115 - SOURCE-BACKED SETTLEMENT (fresh-safe, SAME-PROMPT both seats)

**Version:** v115 (puts SOURCE before council; answers Sonnet v114 dissent on the record; follows Luna `LUNA-V114-SUPPRESSION-SETTLEMENT-001` + review-seat check, which stand unrevoked). **Fresh-profile-safe:** base + source + dissent ALL INLINE; no memory, no companion needed. Tree unchanged (`BFAE4F4B`/591933 uncommitted; RECON17 frozen). **Paste set:** this relay ALONE (both seats IDENTICAL asks). Return whole verdicts/reviews with model + date + Ruling-ID, one source per message. His part: transport only.

## 0. Base (complete)
- Goal (his words): EA takes his trades exact. Standing halt: `S1-LIVE-STOPFIX-001` was HALTED (V113), then RE-CLEARED BY NAME (V114 dual-key) on the corrected set (DH-s0 1.71, OD-16:40 fires 1.62, IE lawfully absent, births 59). All tokens + words SPENT.
- The re-clear rests on a mechanism the review seat could not check: v114 carried description only (no source pasted). Sonnet dissent filed (no ID, keyless): Ask-1 unconfirmable-as-written, Ask-2 premature-not-wrong, post-hoc-rationalization risk, source demand. Full dissent quoted in section 2 (ASCII-folded: ~= for approx, - for dash; verbatim filed `06_HANDOFFS\BUILDER_VERDICTS_SLDEF4-5.md`).
- This relay repairs the package defect: the filed code + raw rows ride INLINE below (sections 3-4), byte-exact pulls at relay build (EA `BFAE4F4B`/591933). Judge the mechanism on THESE, not on any summary.

## 1. Filed rules under judgment
- R1 occupancy (EA:7587): seeds exist ONLY while the single-candidate machine is IDLE.
- R2 session (EA:7592-7607): a fired window consumes its session; later candidates in that window suppressed.

## 2. Sonnet dissent, complete (folded ASCII; verbatim on disk)
> I can't confirm this round's mechanism: there's no source in it to check. This round gives a description ("R1 occupancy EA:7587," "R2 session EA:7592-7607") with no actual code and no raw log lines behind "MTEXIT 7," "SESSION_LIMIT 4-7," "SUPPRESSED-HELD," or "A6REFUSED."
> Two rounds of desk predictions were wrong twice running, worse the second time. Round 5 arrives with a named mechanism that - if true - accounts for exactly the discrepancy: the shape of a correct explanation, but also of a plausible-sounding rationalization; from the outside I can't tell which without the actual lines and rows.
> Ask-1 unconfirmable as written; Ask-2 premature - not because the mechanism is wrong, but because "settle by name" asks a live-code decision on a summary rather than the evidence. Don't authorize another live change on a third round of desk predictions; read the birth-stage source the way W/X were read.

## 3. SOURCE A - code EA:7587-7607 (byte-exact pull)
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

## 4. SOURCE B - raw RECON41 rows (full lines, untruncated)
### MTEXIT x7 (candidate exits; machine frees)
[SRJ-EA] MTEXIT bar=2026.08.28 11:30 reason=TP_TOUCH line=- lineVal=- entry=1.16466 exit=1.16451
[SRJ-EA] MTEXIT bar=2026.09.04 10:40 reason=TP_TOUCH line=- lineVal=- entry=1.16265 exit=1.16274
[SRJ-EA] MTEXIT bar=2026.09.04 16:00 reason=HTF_FLIP line=- lineVal=- entry=1.16018 exit=1.15990
[SRJ-EA] MTEXIT bar=2026.09.07 10:05 reason=TP_TOUCH line=- lineVal=- entry=1.16135 exit=1.16133
[SRJ-EA] MTEXIT bar=2026.09.07 17:10 reason=TP_TOUCH line=- lineVal=- entry=1.16261 exit=1.16315
[SRJ-EA] MTEXIT bar=2026.09.08 13:25 reason=TP_TOUCH line=- lineVal=- entry=1.16205 exit=1.16114
[SRJ-EA] MTEXIT bar=2026.09.08 17:05 reason=POI_BODY_BREAK line=Monthly-POC lineVal=1.16229 entry=1.16213 exit=1.16214
### SESSION_LIMIT x7 (R40 had 4; +3 post-new-firing: 09-04 10:45, 09-08 10:15, 09-08 16:50:01)
[SRJ-EA] 2026.08.28 10:10:00 SESSION_LIMIT: LONDON window already used today - all further candidates suppressed until the next window
[SRJ-EA] 2026.09.04 10:45:00 SESSION_LIMIT: LONDON window already used today - all further candidates suppressed until the next window
[SRJ-EA] 2026.09.04 16:05:01 SESSION_LIMIT: NYAM window already used today - all further candidates suppressed until the next window
[SRJ-EA] 2026.09.07 09:25:00 SESSION_LIMIT: LONDON window already used today - all further candidates suppressed until the next window
[SRJ-EA] 2026.09.07 16:50:00 SESSION_LIMIT: NYAM window already used today - all further candidates suppressed until the next window
[SRJ-EA] 2026.09.08 10:15:00 SESSION_LIMIT: LONDON window already used today - all further candidates suppressed until the next window
[SRJ-EA] 2026.09.08 16:50:01 SESSION_LIMIT: NYAM window already used today - all further candidates suppressed until the next window
### SUPPRESSED-HELD exemplar (detector fires while busy; seeds gated, detector alive)
[SRJ-EA] SUPPRESSED bar=2026.09.08 16:40 poi=Weekly-VWAP dir=LONG opp=1 higher=0 heldPoi=Monthly-POC heldDir=SHORT heldState=S4_ARMED cum_n=129 cum_opp=43 cum_hi=6 cum_both=5 action=HELD
### A6REFUSED method (counts, checkable without pasting 111 rows)
RECON40 lines containing `A6REFUSED` = 59; RECON41 = 52; delta -7 = 3 fired-now + 4 never-born.

## 5. Asks (IDENTICAL both seats)
- **Ask-1:** CONFIRM-ON-SOURCE: do sections 3-4 establish R1+R2 and the per-seed accounting (10:40 occupancy / 16:45 occupancy / 17:05+17:25 session; uniformity on originals)? Correct-or-correct per line.
- **Ask-2:** RULE-ON-DISSENT: does the V114 RE-CLEAR STAND on this source, or SUSPEND until source-backed concurrence (including a binding Sonnet-with-source re-vote when usage returns)? No band-aid, no smoothing; naming stays distinct (OD fires vs IE absent).
- Threshold: filed-authoritative, R>=1.0, A+ strict, alert-only. Locks: RECON17 frozen; build uncommitted; all words SPENT (fresh token + word + run spec owed only after a standing re-clear).

## 6. Branches
- Confirm + stand -> token + word + spec -> 0/0 -> run -> grade -> relay. Suspend -> QUIESCENT (re-clear parked; shadow stands). Amend -> one closed-set re-ask. Split -> ONE closed-set re-ask.

(End - v115 awaits verdicts + Ruling-IDs; nothing builds/runs/commits/spends here.)
