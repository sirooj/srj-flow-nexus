# BUILDER SLICE B-164 - raw rows, every grep command line and count (MEASURED, no edit, no run)

Base: builder/B-163 head 728ba5e on builder/B-164. Gate per result (diff EMPTY, SHAs match, counts 1, pre-greps 0, terminal.ini ACCOUNTED). All pack lines: ROWPACK_JUNE0525-B162 day/2026-05-27.csv unless noted; W1 = ROWPACK_JUNE0525-B162_W1.csv. Log = Tester/logs/20261011.log.

## R1 re-proof (script 00_CURRENT_WORKING/r1_reprove_b164.ps1, unstaged)

- Pin: skill L58 ZERO-COUNT RELAPSE ("Every zero is re-proved with a second differently-formed pattern before filing").
- B-163 form: `Select-String -LiteralPath <file> -Pattern "a|b|..."` (regex mode, no -SimpleMatch) — alternation live, zeros not void; re-proved below one fixed string per call.
- Command form used: `Select-String -LiteralPath <file> -Pattern <one of 17> -SimpleMatch` (case-insensitive) × 17 patterns × 84 files = 1428 calls; plus regex `(27[ ./-]?(may|05)\b)|(\b0?5[./-]27\b)` × 84 files.
- Counts: spec 0/0; journal 0/0; register 0/0; strategy skill 0/0; AGENTS.md 0/0; .clinerules 0/0; all 76 FINDINGs 0/0. Ledger fixed: "27 May" 1 (L7057 = item 1309, own B-163 line); "27/5" 2 (L6695 V350, L6747 V366, workflow items); "5/27" 8 (L6399 V265; L6908 B-65 bank; L6909/L6911/L6917/L6921/L6928 B-68..B-73; L7002 B-128 — old-run contexts: 27 Aug EU / 5 June / 2 June); "27-May" 1 (L7053 = item 1305, B-160 run table "B2/B3/C-06-03/27-May SAME"); "27May" 7 (L6992 B-120; L7002 B-128; L7004 B-129; L7006 B-130; L7010 B-132; L7012 B-133; L7016 B-134 — old-run contexts); "159.197" 1 (L7035 = item 1287, B-142 census "C-05-27 07:20 lo 159.197 (97 back)"); "159.535" 1 (L7057 = item 1309); "2094" 6 (L6909/L6914 zone censuses as live id; L7054/L7055/L7056 = items 1306/1307/1308 origin tables; L7057 = item 1309). All other 9 fixed patterns 0 on ledger. Ledger regex: 26, same lines. Verdict: every non-zero is machine-side or another row — no ruling of his on 27 May.
- Journal coverage: header L1 (`#,Date,Session,Setup,4H Stuct.,...`); first data L2 (#1, 6/1/26 LDN); last L1072 (#320, B-150 banking note); 1071 data rows; UJ dates 6/1/26 (L2) .. 6/12/26 (L38 #37); no May row.
- Audited range: register L35 header "blind window 1-13 June 2026" (builder prose); HIS range = his 4-valid word (ledger L6574 item 882: 6/3 LONG, 6/5 09:45 SHORT, 6/5 16:15 LONG, 6/11 14:40 LONG — all June). 27 May NOT FOUND in any range he audited.

## R2 raw (27 May long)

- B162ORIGIN day:1227 (jline 912376): `B162ORIGIN sym=USDJPY bar=2026.05.27 15:25 side=B n=19 origin=2094 range=159.190-159.208 formT=2026.05.27 06:20 set=65,78,212,256,261,313,414,447,449,460,696,714,724,1405,1779,1780,1949,2088,2094` (server 15:30:00 pass).
- XOBPROMO day:1235: `XOBPROMO bar=2026.05.27 15:25 site=S3PICK xobId=2094 raw=1779864000.0 promoT=2026.05.27 06:40`.
- ZONEPICK day:1236: `ZONEPICK bar=2026.05.27 15:25 dir=LONG haveFvg=0 fvgInPlay=0 haveXob=1 xobInPlay=0 downgraded=0 fvg=--- xob=159.190-159.208` (inp 0).
- INPLAYCOMMIT day:1237: `... zoneSrc=XOB zoneLo=159.190 zoneHi=159.208 promoT=2026.05.27 06:40 applied=1 bounded=1 scanned=108 swings=19 hits=2 firstShift=97 firstVal=159.197 commitVia=SWING legacy=0 ... committed=1 changed=1 haveStop=1`.
- B60C day:1262 (jline 912584): `B60C bar=2026.05.27 15:30 dir=LONG poi=Daily-POC rt=2026.05.27 15:25 rSh=2 rBar=2026.05.27 15:25 cSrc=BOTH xt=0 zxob=159.190-159.208 xpromo=2026.05.27 06:40`.
- D130LATCH day:1264: `D130LATCH pass=2026.05.27 15:35:00 confBar=2026.05.27 15:30 dir=LONG verdict=1 verdictBar=2026.05.27 15:20 walkShift=3 oppPassed=-2 oppBar=2026.05.27 14:45`.
- B150GATE day:1265: `B150GATE bar=2026.05.27 15:30 dir=LONG value=1.0 src=XOB forbar=2026.05.27 15:30` (promo MET).
- B157SL day:1266: `B157SL bar=2026.05.27 15:30 side=LONG flag2xOB=1.0 fvgValid=0.0 branch=TWO first_bar=2026.05.27 15:20 first_px=159.245 wo_stop_px=159.197 kept_stop_px=159.197 booked_stop_px=159.197 R_at_open=9.67 reason=TWO_WO`.
- TP_ELECT day:1267: `TP_ELECT shadow=true entry=159.340 sl=159.197 tp=160.723 R=9.67 bar=2026.05.27 15:30 latchBar=2026.05.27 15:35`.
- A6FIRED day:1268: `A6FIRED class=SELECTED state=FIRED bar=2026.05.27 15:30 dir=LONG tp=160.723 r=9.67 sl=159.197 mode=2SWING div=regular`.
- DEAL #2 day:1269 = W1:5472 (jline 912768): `deal #2 buy 1.08 USDJPY at 159.344 done (based on order #2)` server 15:35. (SLICE_B163 "W1:1269" corrected: that is a 5/25 B152PR row.)
- TPCENSUS log (15:35 pass, no pack line): `TPCENSUS #1 bar=2026.05.27 15:30 dir=LONG ref=159.340 winner=NONE best=160.723 distPts=1383 empties=10 admitted= PDH:39 LOH:104 NYH:108 PMH:39 YLOH:104 YNYH:38 YPMH:39 LIVE:10` (#2 identical).
- UJADMIT log (same pass, no pack line): `UJADMIT bar_key=2026.05.27 15:30 trade_seq=1 admit_bar=2026.05.27 15:30 entry=159.340 sl=159.197 tp=160.723 R=9.67 poolGen=-1 wsrc=DH20260430 wday=2026.04.30 wage=27`.
- Bias log (no pack lines): UJPROBE log 912378 `h4=1.0 h1=1.0 m15=1.0 confirmedFeed=1 ltf=1.0 div=OPPOSING kind=regular`; SIDE1T_SEEDBIAS log 912392 `dir=LONG biasAligned=1 verdict=CONSIDER`; REGIMECENSUS log 912400 `votes=3 trendOk=1`.
- UJBARMAP log 912380: `bar=2026.05.27 15:25 o=159.339 h=159.343 l=159.272 c=159.328 ... dpoc=159.290 ... ltf=1.0`.
- Exit UJRETARGET log 914191-914192: `UJRETARGET bar=2026.05.27 19:00 dir=LONG old=160.723 sess=2 tp=159.535 seq=1 admit=2026.05.27 15:30 - session-close retarget (Fix R)` + BROKER row (ok=1 newTp=159.535).
- Exit MTEXIT log 914593: `MTEXIT bar=2026.05.27 20:05 reason=TP_TOUCH line=- lineVal=- entry=159.340 exit=159.535 src=-` (server pass 20:10:09; no pack line).
- Exit DEAL #3 day:2637 = W1:6840 (jline 914558): `deal #3 sell 1.08 USDJPY at 159.535 done (based on order #3)` server 20:08:14.
- Same-class pins quoted: B-70 (skill L197-199); B-142 NOTE (register L67); 0602-NY-NO-SETUP (skill L185); B-91 (skill L201-205); B-160a (skill L242); MANAGE-NEAREST (skill L32); 9/7 choice (skill L30); R-AT-OPEN (skill L31); A2 160.723 words (FINDING USDJPY-MISSES L52); NEAREST-ANY-AGE (skill L70); P-CQDRESTORE (PACKET_P-CQDRESTORE.md L9-13); DIVERGENCE-RENEWED-ONLY (skill L207-211); RETARGET-CLOSED-AM + SYMMETRY-NEAREST (skill L33); outward stop (CONTEXT L187).
- (a) verdict: inp 0 on 27 May, A1, B2 → print DOES NOT SEPARATE. (b) SAME (nearest valid on printed rows). (c) reported only. (d) as printed. (e) shape consistent, number HIS UNKNOWN. (f) SAME (closed NY AM high, closed 19:00, retarget 19:05, first touch out).

## R3

- NO RULING FOUND. No R2 cell breaks his rules from printed rows. Chart call carried (result). Proposed register line: none (withheld for his answer; next relay lands it).

## X records

- CONTEXT X1 / HANDOFF X2 (1/1); ledger 1310 ("^1310." = 1); pointer B-164 MEASURED, Lane FIDELITY-B162 (first B-163, 2 of 6); register untouched.

(End of slice)
