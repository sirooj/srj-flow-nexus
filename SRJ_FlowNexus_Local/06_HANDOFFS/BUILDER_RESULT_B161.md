# BUILDER RESULT B-161 - STOP: the formation time is not EA-readable, so the print-only origin tag is not built

Trader summary: your most-recent tag needs the machine to know, for every zone in play at the confirmation, which candle formed it. That formation time lives only inside the machine's own zone list and is never sent to the trading side, so the print cannot name the newest zone without new plumbing - and the relay forbids new plumbing. Nothing in your trades changes: no edit, no compile, no runs, and the kept build stays byte-identical on disk. The one hole your planner flagged (1 Sep zone 2549's missing range) is filled from the run's own row below, and your 1 Sep origin stays 2549. Nothing is asked.

## Relay order (B-161 XOB-DETECT-920 2 of 6: print-only most-recent in-play XOB beside the PROMO-RETURN check, STOP before Part K)

- Part 0 on builder/B-160a at 6488586 (both ls-remote checks returned 6488586bce11c9d7a8e49cd495d777e39bb475ec; builder/B-161 cut here; HEAD builder/B-161 at 6488586 re-checked after cut). Push via backup, never origin.
- Skills loaded whole in order (relay, then strategy; .agents stub never opened; trading rule touched: K0 not reached - STOP in Part R).
- Reads in order: pointer; RESULT_B160a + SLICE_B160a; RESULT_B160; register whole; CONTEXT + HANDOFF whole; both ZONES_*-B161.csv present (EU 76 + UJ 98 B-160 run rows, never overwritten); spec v4.2 whole (3.5 L126-137 + 9.9 L354 re-read on disk, match B-160a K0 quotes); ROWPACK_RECON62-B160_W1..W3 + ROWPACK_JUNE0525-B160_W1..W3 all present.
- Names per 0.4 verified: 9:20 XOB id 3293 (1.16230-1.16256, f09:20, p09:40, k17:25); A1 origin 2109 (1.16505-1.16537, f28-Aug-01:00) vs machine tag 2149 (1.16492-1.16507, f06:25, p06:40, first touched 14:00); committed origins A1 2109, A2 2549, A3 2793, A4 3130, A5 3178, A6 3293, A7 3293, B2 3308, B3 3913, C-06-03 2930, C-05-27 2094, C-06-04 none.
- Start gate: log-1 = 6488586; status 725 lines (dirty tree preserved); git diff 6488586 EMPTY over every 0.3 file + ledger + both skills + journal; disk SHAs EA 1617DC1A / ex5 187A7202 / OB 8BBF936B / ind src 1009A4EF / ex5 0CADACC6 / Bias 3B1D9D3D / HTF D5FD5B06 all match; terminal.ini live 3CB643D6 ACCOUNTED (B-160a "June as-run" line: [Tester] window reads back June 1779667200/1781308800 USDJPY, no run since B-160a MEASURED, no terminal64); no terminal64. Records: CONTEXT B160a-TAG-IS-MOST-RECENT 1 + B-160a session 1; HANDOFF "- B-160a:" 1; ledger "^1306." 1; skill "there can be multiple XOBs" 1. Pre-greps "^1307." 0, "B161ORIGIN" 0, "B161K" 0. No STOP in Part 0.
- Scope: Part B + Part R reads only, then STOP per R3. No EA edit (no .preB161, no .B161K); no compile; no runs (no RECON62-B161, no JUNE0525-B161); no restore needed (nothing changed); no question. Legal results used: FOUND, NOT FOUND, SAME, STOP, ACCOUNTED.

## Part B - banking

- Grep-first: "there can be multiple XOBs" count 1 = ALREADY_BANKED (B-160a commit 6488586); appended nothing.

## Part R - reading (read-only)

- R1 A2 hole FOUND. ZONES_RECON62-B161 row A2/2549 carries in_play 1 + is_most_recent 1 with empty zone_range, promo_bar, pack_lines. Its in-play pack line at the 1 Sep 17:30 confirmation (ROWPACK_RECON62-B160_W2.csv file line 3987, pack_line 3986):
- `3986,RECON62-B160,1617DC1ACCE6B50ED2D1359582A70A8B8503C569623EE90C18C6B33542796207,Tester/logs/20261010.log,5918337,2026-09-01,17:35,B152PR,"EI	0	21:32:18.489	Core 04	2026.09.01 17:35:01   [SRJ-IND] B152PR sym=EURUSD bar=2026.09.01 17:30 z1=2549,B,1.15975,1.16013,2026.09.01 17:25,1,2026.09.01 17:30,1.16031,1.16002"`
- So 2549: range 1.15975-1.16013, promo 2026.09.01 17:25, first post-promo touch 2026.09.01 17:30 (the confirmation bar itself); ZONES formation 2026.09.01 16:45. Latest formation among A2's pack-line rows (others 08-31/08-19/08-14), so committed origin 2549 STANDS. Text only; ZONES CSV never rewritten.
- R2 Buildability. EA site where the B153K check refuses with PROMO_RETURN_NONE (EA:9822-9852; refusal EA:9850; full text in slice): at the confirmation candle (`barShift`) it reads ONLY the trade-direction PROMO-RETURN scalar (FL_BUF 48/49), the selected pick range (FL_BUF 22/23), the selected FVG range (24/25), and g_dir. Per-zone verdicts at runtime there: id NOT FOUND (only the single selected pick id on buf 31, read at other sites EA:6993/7618/8892, never the set; this site reads no id); side FOUND only as g_dir/scalar, NOT FOUND per zone; range NOT FOUND per zone (selected pick only); promoted NOT FOUND per zone (scalar only); alive NOT FOUND per zone; post-promotion touch NOT FOUND per zone (comeback times live only in B152PR log fields g_b153cbT/H/L, no buffer); formation candle time NOT FOUND (no buffer carries it).
- R3 Decision: formation candle time is NOT FOUND EA-side: STOP before Part K. The formation time lives only in the indicator's `COrderblock.startBar` (OrderblockMgr prints `obStart=`/`obStartT=SRJ_BarTimeStr(ob.startBar)`; ranked OrderblockMgr:1101 `ob.startBar > bestStart`; the B152PR z1 segment at indicator:1538-1543 carries id/side/low/high/promoT/valid/comeback but no formation field). Zones never ordered by id instead. No Part K, no Part T, Part W skipped (KEPT-only).

## Part S - identity table (committed ZONES rows; documentation target, never a trade gate)

- A1 conf 2026.08.28 10:00 S [9]: 1389,1481,1484,1516,1704,1728,1784,1866,2109; origin 2109; tag 2149 (1.16492-1.16507 @W1:4733).
- A2 conf 2026.09.01 17:30 B [9]: 2275,2286,2289,2549,305,405,435,484,975; origin 2549 (R1: 1.15975-1.16013, f16:45, p17:25); tag 2549 (1.15975-1.16013 @W2:3993).
- A3 conf 2026.09.04 15:55 B [8]: 2722,2787,2792,2793,305,405,435,484; origin 2793; tag NOT PRINTED (pack ZONEPICK row absent at bar).
- A4 conf 2026.09.07 09:15 B [10]: 2722,2787,2792,2793,305,3126,3130,405,435,484; origin 3130; tag NOT PRINTED.
- A5 conf 2026.09.07 16:40 B [14]: 2722,2787,2792,2793,3022,305,3126,3130,3132,3139,3178,405,435,484; origin 3178; tag NOT PRINTED.
- A6 conf 2026.09.08 10:05 S [13]: 1389,1481,1484,1516,1704,1728,1784,1866,2109,2149,2896,2898,3293; origin 3293; tag 3293 (1.16230-1.16256 @W3:3490).
- A7 conf 2026.09.08 16:55 S [13]: same 13 ids; origin 3293; tag per SETUPS (3293) + 16:30/16:50 ZONEPICK rows.
- B2 conf 2026.06.05 16:10 B [25]: origin 3308; tag 159.881-159.916 @J-W2:11743.
- B3 conf 2026.06.11 14:35 B [33]: origin 3913; tag 160.489-160.504 @J-W3:10690.
- C-06-03 conf 2026.06.03 09:05 B [21]: origin 2930; tag NOT PRINTED.
- C-05-27 conf 2026.05.27 15:30 B [19]: origin 2094; tag NOT PRINTED.
- C-06-04: no rows (REJECTED, empty set), origin none.

## Part X - records (grep-first, append once, verify count 1 each)

- X0: no 0.5 record ABSENT; nothing to land.
- X1 CONTEXT section 4 appended (verbatim relay text). Count 1.
- X2 CONTEXT section 5 appended (verbatim). Count 1.
- X3 HANDOFF section 3 appended after the B-160a line, verdict STOP filled. Count 1.
- X4 ledger 1307, tag B161-ORIGIN-TAG-PRINT (R1/R2 raw, Part S, no diff/compile/runs, verdict STOP, SHAs). "^1307." = 1.
- X5 pointer rewritten (35-line cap): latest B-161 STOP; Lane XOB-DETECT-920 (first relay B-160a, 2 of 6); O3 pending kept; Next: formation-time export then the print-only tag re-proposed; goal open.

## Part F - file, push, reply

- F1 this result. F2 slice (R1/R2 raw, Part S; under 600 lines). No F2b (STOP: no packs, no SETUPS). F3 ledger 1307. F4 pointer.
- F5 stages result, slice, ledger, pointer, CONTEXT, HANDOFF. Never EA, includes, indicator, ex5, backups, journals, logs, inis, profiles, charts, TEMP.
- F6 branch re-check from disk, commit, push via backup to builder/B-161; ls-remote check must return the commit.
- Reply line: B-161 is done, GitHub branch builder/B-161, commit <short hash>, verdict STOP.

## Final disk state (STOP turn; B160K kept build untouched on disk, terminal idle)

- EA src 1617DC1ACCE6B50ED2D1359582A70A8B8503C569623EE90C18C6B33542796207 + ex5 187A7202BF0B45F294659FA089DF0581063740B4758E3517C5C3DC28893FB12E; OrderblockMgr 8BBF936B; indicator src 1009A4EF + ex5 0CADACC6; BiasEngine 3B1D9D3D; HTFEngine D5FD5B06. No .preB161, no .B161K, no B161ORIGIN in source ("B161ORIGIN" 0). Terminal idle, no terminal64. CONTEXT +2; HANDOFF +1; ledger +1 (1307); pointer rewritten; result + slice new. No source/ex5 committed.

(No carried note - no question goes to him.)
