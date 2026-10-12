# ROWPACK INDEX B-193 - DIAGNOSTIC (always-restored B189PMAP+B193TAG build, EA 3B5EE8D1)

Build proof (cut journal lines, Tester/logs/20261013.log): B193TAG x1 per segment -
GBP0629-B193D j2964670, RECON62-B193D j3906599, JUNE0525-B193D j4957151
(`[SRJ-FL] B193TAG build=B193D pmap=1`; day-date 06-29/08-26/05-25, outside the
F2b day files by date, cited here). EX5-D EEC70101...FBE4370D55 all runs;
EA 75B12D19 untouched. Restored + verified after the session.
F2b day packs (ROWPACK columns): ROWPACK/GBP0629-B193D/2026-07-10.csv (7423),
ROWPACK/RECON62-B193D/2026-09-02.csv (10044),
ROWPACK/JUNE0525-B193D/2026-06-05.csv (11019),
ROWPACK/JUNE0525-B193D/2026-06-09.csv (11398).

G1 [10 July NY SHORT - DIES]: seed ANCHOR 14:10 Y-POC SHORT (0710 pack 29417 /
cut 3841688); CONFIRMPOLL 14:15 confirm=1 (pack 29448 / cut 3841904);
SIDE1V_BIRTH tf=0 mr=1 confShort=A_OPP (cut 3841949); FRESHSKIP S2_LTF_ALIGN
(cut 3841731); SUPPRESSED HELD S2_LTF_ALIGN (cut 3841900); no B182DEC/TP_ELECT
for the seed (died at S2 LTF-align, LTF opposed). Later SHORT ABORTs 15:05
DIV_FALLBACK (cut 3842838) + 15:20 FRESH_OPP_FVG (cut 3842989), both
reg=MEANREV (fix visible, outcome unchanged). Pound deals #2/#3 = B192 F2
identical; no 2 July long; no 6/13 July fire.
G2 [2 Sep London long - NEW, UNDECIDED]: ANCHOR 10:20 FOMC-VWAP LONG (B189 pack
665); REGIMECENSUS 10:20 mrOk=1 (666; B193D cut 4868794 same); CONFIRMPOLL
10:25 confirm=1 (708 / cut 4868974); ZONEPICK/B60C/D130LATCH/B157SL
(710-714); TP_ELECT 10:30 R=1.57 (0902 pack 4021); B182DEC FIRE MEANREV (723);
deal #6 10:30:02 @1.15736; MTEXIT 15:20 TP_TOUCH 1.15849 (6781); deal #7 15:21
@1.15850. R1 SILENT + R2 ALL-MET (OPEN cells listed in result) -> chart call
carried. A1-A7 identical (#2-#5, #8-#17).
G3a [5 June 16:55 long - moved B2, NOT his entry]: CONFIRMPOLL 16:50 confirm=1
(cut 5842433); TP_ELECT 16:50 entry=160.115 R=1.56 (cut 5842797); B182DEC FIRE
TREND (cut 5842800); deal #6 16:55 @160.120; exit 19:16:32 @160.298 (retarget).
His B2 entry is the 16:15 open (banked verbatim); 16:55 is not it. Kept-path
Monthly seed died identically (16:05 LTF_MISALIGN ABORT, both builds).
G3b [9 June 11:20 long - NEW, UNDECIDED]: CONFIRMPOLL 11:15 confirm=1 (cut
5866370); REGIMECENSUS 11:10 mrOk=1 sweepTag=2 (cut 5866111); pAS.L@09:00
carrier (cut 5863572); TP_ELECT 11:15 R=1.78 (cut 5866651); B182DEC FIRE
MEANREV (cut 5866654); deal #8 11:20:07 @160.203; SL exit 12:20:24 @160.152.
No register row, no words -> UNDECIDED, named. B3/C-06-03/27May identical.
G4 [2 Sep re-grade on B193D rows]: REGIMECENSUS mrOk=1 (cut 4868794);
CONFIRMPOLL confirm=1 (4868974); zone applied=1 (4868980/4868993-98);
D130LATCH verdict=1 (4869000); B157SL KEPT_PATH 1.15614 (4869256); B182DEC
FIRE MEANREV (4869270); entry/exit as G2. Beside R1 SILENT: UNDECIDED.
G5 [separator draft, no trial]: fires 2 Sep (pAS.L 09:35, UNDECIDED), 6/05
16:55 (no sweep carrier, TREND, UNDECIDED - not his 16:15), 6/09 11:20 (pAS.L
09:00, UNDECIDED); 10 July rows changed to MEANREV with outcome DIES at S2
LTF-align (UNDECIDED take - his F3 words stand, machine path dies); all other
mrOk flips died at named later gates (B-189 T2 list, same hunk, B193D
spot-verified 8/28 14:30, 9/02 10:20, 9/04 15:30/15:40, 9/08 09:35/14:00).
