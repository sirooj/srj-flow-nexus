# REPORT README - per-setup planner report (his order O2 2026-10-10, relay B-150)

Rendered offline from the run's committed row packs. No EA print is added for it.
One row per candidate inside the session windows, keyed by window + direction + anchor
line (spec 6), with its last state. Dedup: B60C rows sharing date + confirm_bar +
side + anchor are one candidate (their pack lines merge into source_pack_lines).

## Files
- SETUPS_RECON62-B137.csv - RECON62-B137 (EURUSD, EA 585093BF576B922A241E21779C72C62236B4F57746F778E25A772E493CC3D9C6)
  from ROWPACK_RECON62-B137_W1/W2/W3.csv + DEALS_RECON62-B137.csv. 28 rows, 7 EXECUTED.
- SETUPS_JUNE0525-B137.csv - JUNE0525-B137 (USDJPY, same EA)
  from ROWPACK_JUNE0525-B137.csv + DEALS_JUNE0525-B137.csv. 19 rows, 5 EXECUTED.
- Files over 900 KB split by week. These are ~16/24 KB, no split.

## Column dictionary (tag each column reads)
- run: pack row run field. ea_sha: pack row ea_sha field.
- pair: RECON62 = EURUSD, JUNE0525 = USDJPY (run identity, B-137 T0).
- session: server_time 09:00-12:00 = LDN, 14:00-19:00 = NY (spec 3.0 windows in server time).
- date: pack row server_date. side: B60C dir (LONG/SHORT).
- verdict: EXECUTED = a DEALS entry matches date + time + side (buy = LONG, sell = SHORT);
  else REJECTED. EXECUTED counts equal the DEALS entry deals (7 RECON62, 5 June).
- register_row: EXECUTED rows carry the DEALS register_row verbatim; REJECTED rows carry
  the register row only on an evidence time match (B-142 R1 + register section C:
  B1 6/5 09:15, C-06-02 6/2, C-06-10 6/10 16:05, C-08-27 8/27 17:10,
  C-09-01-1530 9/1 15:25, C-08-28-1625 8/28 16:20, C-09-08-1645 9/8 16:40,
  C-09-04-1040 9/4 manual kill row); else NONE.
- retest_bar: B60C rt. retest_line: B60C poi.
- retest_side_tag: NOT PRINTED (no pack tag carries the retest-row side tag).
- confirm_bar: B60C bar. confirm_src: B60C cSrc (BOTH/PRIOR/RETEST).
- entry_bar: DEALS entry date + time. entry_ref: TP_ELECT entry. fill: DEALS price.
- sl: TP_ELECT sl. sl_swing_bar: NOT PRINTED (no swing print in packs).
- sl_branch_printed: A6FIRED mode (1SWING). tp_name: NOT PRINTED (booking names no line).
- tp_price: TP_ELECT tp. r_at_open: TP_ELECT R.
- htf_4h, htf_1h, htf_15m, ltf_5m: NOT PRINTED (no per-candidate HTF/LTF print in packs).
- zone_src: ZONEPICK haveXob/haveFvg (XOB/FVG/NONE); fallback B60C zxob / INPLAYCOMMIT zoneSrc.
- xob_id: XOBPROMO xobId at the zone pass (same server pass as the joined ZONEPICK).
- xob_range: ZONEPICK xob (fallback B60C zxob). xob_promoT: B60C xpromo (fallback INPLAYCOMMIT promoT).
- xob_inplay_printed: ZONEPICK xobInPlay at the joined pass.
- commit_via: INPLAYCOMMIT commitVia at the joined pass.
- Zone join rule: the zone step prints one pass before confirmation, so the joined
  ZONEPICK/XOBPROMO/INPLAYCOMMIT is the latest row with bar <= confirm_bar, same date
  and direction, preferring the row whose range matches B60C zxob.
- promo_return: NOT PRINTED on B-137 runs (no print carries it; B-150 stage 1 adds B150PR).
- div_kind: A6FIRED div word + direction adjective (e.g. hidden bearish); NOT PRINTED
  where no A6FIRED row exists. div_bar: D130LATCH verdictBar for the confirm bar.
- div_type_his: UNMAPPED everywhere on B-137 (filled only where his record maps a
  machine divergence number, e.g. his W2 "blue solid which is type 1 bullish").
- exit_bar: MTEXIT bar matched on entry price. exit_price: MTEXIT exit.
- exit_src: MTEXIT reason (TP_TOUCH/SL/...). r_result: NOT PRINTED (no print carries it).
- reject_tag, reject_reason, reject_pack_line: the killing row for REJECTED rows
  (ABORT reason, A6REFUSED predicate, CONFIRMPOLL confirm=0 with touchAttr, S54KILL,
  TP_RR_FAIL with R in reason where printed); NONE where EXECUTED.
- source_pack_lines: every pack line a cell came from, as file:pack_line (RECON62 week
  file + line; JUNE0525 single file + line).

## Rules
- Every cell comes from a named pack line. A value no print carries is NOT PRINTED,
  never inferred. Manual register rows (no B60C) carry their kill row only.

## B153 addendum (relay B-153, KEPT trial)
- SETUPS_RECON62-B153.csv (28 rows, 7 EXECUTED) + SETUPS_JUNE0525-B153.csv (20 rows,
  4 EXECUTED) render from the B153 row packs (EA 5A5BD1F0) per the same rules.
- promo_return now printed: MET (B150GATE value 1.0), NOT MET (0.0, refused with
  PROMO_RETURN_NONE), NOT PRINTED (no gate row). C-06-04 reads REJECTED / NOT MET /
  ABORT PROMO_RETURN_NONE; the 4 June 11:00 SHORT reads the same (register NONE).
- New tags read: B152PR (verdict + per-zone proof segments), B150GATE (gate value,
  bar, side, zone src), PROMO_RETURN_NONE (ABORT reason + A6REFUSED predicate).

## B165R addendum (relay B-165, MEASURED re-cut)
- SETUPS_RECON62-B165R.csv (28 rows, 7 EXECUTED) + SETUPS_JUNE0525-B165R.csv (20 rows, 4 EXECUTED) render from the re-cut -B165R packs: trade spans run entry DEAL to the first server pass after both the exit DEAL and the trade's MTEXIT row, so the 5 June (19:15 bar) and 27 May (20:05 bar) MTEXITs are packed and their exit cells filled; new tags SLSRC/SWINGPICK/SL_REF (stop values/branch, no swing-bar-time field — sl_swing_bar stays NOT PRINTED).

## B168F addendum (relay B-168, MEASURED full report, his never-simplify order)
- SETUPS_GBP0629-B168F.csv (15 rows, 2 EXECUTED) renders from ROWPACK_GBP0629-B168F_W1/W2/W3.csv (superset of the B-162 GBP packs: every old row byte-for-byte present) + day files + INDEX_GBP0629-B168F.md; GBPUSD_0629-0717_FULL.md carries every column as "column: value (pack line)".
- New columns: setup_class (REGIMECENSUS trendOk/mrOk at confirm bar), sweep_src_level/sweep_src_bar (NOT PRINTED: no row names a swept level/candle for these setups), poi_zone_kind (ZONEPICK haveXob/haveFvg), poi_zone_id (XOBPROMO xobId), poi_zone_range (ZONEPICK xob), poi_zone_formT (B162ORIGIN formT where the used zone is headed, else NOT PRINTED), poi_zone_promoT (XOBPROMO promoT), poi_zone_midline (NOT PRINTED: no row prints it), poi_zone_kill_state_at_confirm (XOBINPLAY hits + INPLAYCOMMIT applied/commitVia), retest_lines_all (RETESTBOOK hits at retest bar), anchor_elected (ANCHOR_ELECT action/poi/rank/tier), htf_4h/htf_1h/htf_15m/ltf_5m (UJPROBE h4/h1/m15/ltf, filled now).
- div_type_his stays UNMAPPED on GBPUSD (his only mapped number is W2 "blue solid = type 1 bullish" on 1 Sep London).
