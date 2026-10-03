# BUILDER RESULT B-1 - RECON78 measurement only (no edit, no build, no run)

Step 1 raw (measured 2026-10-04, terminal disk):
- git pull: Already up to date.
- git log -1: 8c81c85 Shared skills/commands: file 12 untracked skill mirrors (SRJ/HORC lanes)
- git status --short line count: 26 (23 modified + 2 deleted, pre-existing dirt + 1 held-out compile log)
- EA SHA-256 Experts/SRJ_FlowNexus_EA.mq5: E80FF0C24149AB0946EB6A4341C0503A79BFE82E9843867CEF0DBA89BF587BBC
- Journal: SRJ_FlowNexus_Local/06_HANDOFFS/RECON78-V26-UJ_JOURNAL.log, 7157013 bytes, 36760 lines
- Result on disk: SRJ_FlowNexus_Local/06_HANDOFFS/BUILDER_RESULT_RECON78-V26-UJ.md (window 2026.06.01 to 2026.06.13, Test passed)
- Filed trades per register BUILDER_REGISTER_VALID_TRADES.md rows 2-3 plus relay B-1 text

## 11 June New York USDJPY - raw rows 14:30 to 14:45 (spliced by journal line number, byte-exact)
R1 ln=22622 :: LR	0	17:08:16.498	Core 04	2026.06.11 14:40:22   Alert: USDJPY M5 - POI RETEST LONG at 160.523  [D-POC +1]
R2 ln=22652 :: PL	0	17:08:16.498	Core 04	2026.06.11 14:40:22   [SRJ-EA] SIDE1H_WOULDPREEMPT bar=2026.06.11 14:35 newPoi=Daily-POC newDir=LONG heldPoi=Daily-POC heldDir=SHORT heldState=S4_ARMED newTier=5 heldTier=5 wouldPreempt=0 wouldTierPassLegacy=0
R3 ln=22654 :: RO	0	17:08:16.498	Core 04	2026.06.11 14:40:22   [SRJ-EA] SUPPRESSED bar=2026.06.11 14:35 poi=Daily-POC dir=LONG opp=1 higher=0 heldPoi=Daily-POC heldDir=SHORT heldState=S4_ARMED cum_n=79 cum_opp=19 cum_hi=7 cum_both=4 action=HELD
R4 ln=22655 :: GL	0	17:08:16.498	Core 04	2026.06.11 14:40:22   [SRJ-EA] RETESTBOOK bar=2026.06.11 14:35 hits=2 Daily-POC:r10:dL Daily-VWAP:r11:dL
R5 ln=22629 :: CS	0	17:08:16.498	Core 04	2026.06.11 14:40:22   [SRJ-EA] LTFFLIP bar=2026.06.11 14:35 dir=SHORT poi=Daily-POC state=S4_ARMED - LTF bias turned against the locked direction
R6 ln=22631 :: QN	0	17:08:16.498	Core 04	2026.06.11 14:40:22   [SRJ-EA] UJDEFERABORT bar=2026.06.11 14:35 dir=SHORT poi=Daily-POC state=S4_ARMED - LTF opposed, abort deferred past evaluation (Fix S-a)
R7 ln=22661 :: CQ	0	17:08:16.498	Core 04	2026.06.11 14:40:22   [SRJ-EA] UJDEFERAPPLY bar=2026.06.11 14:35 dir=SHORT poi=Daily-POC - deferred LTF abort applies, holder unchanged (Fix S-a)
R8 ln=22662 :: OR	0	17:08:16.498	Core 04	2026.06.11 14:40:22   [SRJ-EA] 2026.06.11 14:40:22 ABORT reason=LTF_MISALIGN state=S4_ARMED poi=Daily-POC dir=SHORT
R9 ln=22664 :: JF	0	17:08:16.498	Core 04	2026.06.11 14:40:22   [SRJ-EA] ALERT SRJ STAND-DOWN SHORT USDJPY M5 | Daily-POC | NYAM | reason=LTF_MISALIGN
R10 ln=22671 :: JK	0	17:08:16.498	Core 04	2026.06.11 14:45:05   [SRJ-EA] RETESTBOOK bar=2026.06.11 14:40 hits=0 
R11 ln=24024 :: JG	0	17:10:18.795	Core 04	2026.06.11 22:30:51   deal #7 sell 0.41 USDJPY at 159.725 done (based on order #7)

Entry answer: NO. The EA did not take the 14:40 entry at 160.524. Zero buy deals exist on 11 June anywhere in the 36760-line journal (only deal row on 11 June is the 22:30:51 stop-out sell, R11 above); second pattern: no LONG admission row at the 14:40 pass, and the 14:45 pass shows RETESTBOOK hits=0.

## 5 June New York USDJPY - raw rows: target touch and day-close (spliced, byte-exact)
S1 ln=14059 :: CQ	0	16:43:24.215	Core 04	2026.06.05 16:55:00   deal #6 buy 0.41 USDJPY at 160.120 done (based on order #6)
S2 ln=14331 :: MS	0	16:44:00.911	Core 04	2026.06.05 19:05:01   [SRJ-EA] UJRETARGET bar=2026.06.05 19:00 dir=LONG old=160.723 sess=2 tp=160.298 seq=3 admit=2026.06.05 16:50 - session-close retarget (Fix R)
S3 ln=14354 :: GF	0	16:44:07.028	Core 04	2026.06.05 19:20:01   [SRJ-EA] MTEXIT bar=2026.06.05 19:15 reason=TP_TOUCH line=- lineVal=- entry=160.115 exit=160.298
S4 ln=14355 :: GQ	0	16:44:07.028	Core 04	2026.06.05 19:20:01   [SRJ-EA] MTLIFE fields=11 openBar=2026.06.05 16:55 dir=LONG entry=160.115 sl=159.726 tp=160.298 verdict=TP_TOUCH closeBar=2026.06.05 19:15 closePx=160.298 openAtNewsStart=0 openAtDayClose=0 openAtWeekClose=0

Day-close absence (two patterns on 5 June rows): DAY_CLOSE = 0 rows, day-close = 0 rows. The only DayClose hits (2) are openAtDayClose=0 flags inside model-only MTLIFE rows. The EA never exited this trade at day-close; the model-only record closed 19:15 while the real broker position ran to the 11 June stop (R11 above).

| date | session | operator filed trade | what the EA did | journal code + plain-words gloss |
|---|---|---|---|---|
| 11 June | New York | LONG, entry owed at the 14:40 open at 160.524 | NO entry. LONG held back behind a same-line SHORT holder, then the SHORT itself thrown out; nothing fired; only June-11 deal is a stop-out sell | SUPPRESSED action=HELD means the long was held back and never fired; ABORT reason=LTF_MISALIGN means the short was thrown out because the 5-minute direction disagreed; STAND-DOWN means stood down, no trade |
| 5 June | New York | LONG, entry owed 16:15, target the old high 160.723, exit at day-close | Entered late at 16:55 at 160.120 (real deal #6); model-only target touch 19:15 at 160.298; never exited at day-close; real position stopped 11 June 22:30:51 at 159.725 (real deal #7) | MTEXIT/MTLIFE verdict=TP_TOUCH means the EA model says price touched its target, not a real broker exit; UJRETARGET means the EA moved its model target to 160.298 on the closed session; deal #6 buy and deal #7 sell are the real broker trades |
