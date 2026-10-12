# BUILDER SLICE B-187 - raw rows (seed, F3 path, target, sweep)

Base: builder/B-187 cut at b4823d7 (backup exact). No EA/include/indicator edit, no compile. Two tester runs (T0 warm-up 6/09-6/29 passed 0:03:44; T1 GBP0629-B187 passed 0:04:02, 1386092/4320 identical). Verdict KEPT.

## R1 seed rows (day log 20261012.log, quoted raw)
- GBP refused (8874443-8874447): `[POI][SEEDFILE] ... seed=SRJ_SEED_GBPUSD.bin common=YES local=NO` / `PARSED ... seam=2026.06.09 10:00:00 lastArchive=2026.06.09 09:59:57 builtAt=2026.09.07 09:32:06` / `COMPATIBLE result=YES` / `REFUSED reason=SEAM_UNREACHABLE ... "no ticks served at seam 2026.06.09 10:00:00 across 3 trading day(s)"` / `FINAL accepted=NO ... measuredDepth=0 ...` (+ CKPT SKIPPED + FLOOR rows).
- EU accepted (6853390-6853394): seam=2026.06.26, `SEAM_REACHABLE`, `FINAL accepted=YES ... measuredDepth=2026.06.01 10:00:00`, SEED_SLOT rows (Y adopted on EU).
- June refused (7903582-7903586): same 06.09 seam, depth 0, accepted=NO. Reported only.
- T1 accepted (13667830-13667834): `FINAL accepted=YES seam=2026.06.09 10:00:00 measuredDepth=2026.06.09 10:00:00`; SEED_SLOT Y `filePeriodStart=2026.01.01 hostPeriod=2026.01.01 seamPeriod=2026.01.01 adopted=YES foldFrom=2026.06.09 10:00:00`; CKPT Y `active=YES records=229561 ... ACTIVE`; CKPT file PARSED, activeSlots=[M Q Y].

## T0/T1 markers
- T0: window tester line 2026.06.09-2026.06.29 (ini GBP0629-B187T0, Report MT5_GBP0629-B187T0); passed 0:03:44, 1285801 ticks; first replay row 2026.06.09 00:00 (STOP check passes); deals NONE (warm-up, B-166).
- T1: tester line GBPUSD 2026.06.29-2026.07.18 (ini GBP0629-B187, Report MT5_GBP0629-B187); terminal.ini 1782691200/1784332800 read back; passed 0:04:02, 1386092/4320 identical to B-182.
- T1 filed table: 2/2 SAME (7/07 14:45 sell 1.33863 #2 + 16:54 buy 1.33747 #3). S-B/S-C clear, no STOP.

## G1 F3 rows (GBP0629-B187/2026-07-10.csv)
- Y-POC 1.34296 all day (WINLINE, e.g. 14:15 pack 1524 OPEN). 14:15 candle o 1.34293 h 1.34300 l 1.34260 c 1.34286 (B176HZ pack 1305) = VALID RETEST (4pt wick-through, body below; spec 2 row 1 + L105). Earlier NY touch 14:10 (poll pack 168).
- SEED Yearly-POC SHORT 14:15 pack 1525 (rank=2 tier=1). REGIME NONE 14:15-15:45 (packs 1526-2050; TREND only 15:50 pack 2078). Shadow confirms 14:20 pack 171 + 15:20 pack 214. Live NEVER (zero B60C). S1 hold, arm ~15:50, FRESH_OPP_FVG kill 15:55 S4 pack 2110 (pinned L57).
- 07:10 XOB first-carrier every pass 09:10-16:10 (win=1). SL elected 1.34374 S3ARM packs 2082-2083. No SHORT TP_ELECT. DIV hidden dbar=15:30 pack 2112 (D130 verdict NOT PRINTED).
- Sweep: B182SWEEP LD.H 13:55 pack 1407 + pLD.H 14:00 pack 1435 (values + p-meaning unprinted); sweepTag=0/mrOk=0 all NY passes.

## G3 rows (7/07)
- TP_ELECT identical (1.33747 R1.51). Yearly-POC 1.34296 + Y-VWAP 1.34401 behind (EXITCENSUS) - nothing books nearer.
- PM-min proof: 6 July 19:00-19:50 KILL/GAP lows min 1.33649 (20 rows) != 1.33747 -> NOT A SESSION LOW (job_g3b_b187.py); uj_pool NOT PRINTED.
- MTEXIT 16:50 TP_TOUCH + DEAL 16:54:59; 26 W-VWAP rows val 1.33630-1.33648 all ok/trigger=0.
- 1.33747 = XOB-2855 low (B152PR pack 115, formed 7/06 20:30, promoted 7/07 09:10); pool source NOT PRINTED.

## G4 / packs
- SETUPS_GBP0629-B187.csv: 9 rows (7 carried re-verified + 7/10 LDN + 7/10 NY/F3 Yearly-SHORT). LONG Yearly seeds (09:20/09:35/09:40) not graded as his.
- Packs GBP0629-B187: 46426 rows / 15 days (full tag set + RETESTDIAG/UJDTTERMS/CONFIRM_STRUCT_FAIL/UJOPCONF/SIDE1C_SUPP/S1C). DEALS 2 (0 unmapped). INDEX_B187 (F3/F2/T0707/T0702 + INDEX_B182 for the rest).

## Seeds before/after (verdict section)
- Before (S1) / after (post-T1): GBPUSD seed 0f67b6ed / 0f67b6ed; ckpt 5954bc9d / 5954bc9d; EURUSD 617ff927 / 617ff927; USDJPY 9f2d33cc / 9f2d33cc. EU/June runs not repeated (no code change).
(End of slice)
