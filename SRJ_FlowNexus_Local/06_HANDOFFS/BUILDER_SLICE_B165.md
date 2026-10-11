# BUILDER SLICE B-165 - cutter diff, census, added rows, report cell diff (MEASURED, text records only)

Base: builder/B-164 head bfcc451 on builder/B-165. Gate per result (diff EMPTY, SHAs match, counts 1, pre-greps 0, terminal.ini ACCOUNTED, log markers verified). Log Tester/logs/20261011.log (333510990 bytes, SHA 8D2AB35F..., 1078201 lines).

## R1 raw (cutter + census)

- Skill L69: "Rows of an open trade are kept from entry to exit even outside the session windows (MTEXIT, exit, day-close and deal rows), so every exit is in the pack."
- B-162 cutter (build_rowpack_b162.ps1): L23 `function InWin($t) ... 09:00-12:00 / 14:00-19:00`; L49-52 server datetime from the row's own `Core 04` stamp; L53-56 keep = InWin OR DEAL-always OR datetime inside an entry→exit pair span; L36 pair ends = exit DEAL minutes (27May '2026-05-27 20:08', B2 '2026-06-05 19:16').
- Drop mechanism: exit rows logged on a later server pass than the exit deal fail both gates — B2 MTEXIT pass 19:20:01 (19:20 out of windows, past pair end), 27May MTEXIT pass 20:10:09 (20:10 likewise). First fixed cut reproduced the class broadly (owned: flat span list kept window/DEAL rows only, 2759 missing) — fixed, superset 0 missing.
- Census (script r1_census_b165.ps1, unstaged; spans entry DEAL → MTEXIT/UJRETARGET/day-close + next pass; tags 25 + MTEXIT/UJRETARGET/MTLIFE/ORDER/BROKER): A1-A7/C-06-03/B3 MTEXIT packed, MTLIFE missing each (log lines 428512/456990/493665/498952/503680/511798/516351/968509/1054435 — tag never listed); A3 + UJRETARGET 491064-65 missing (tag); B2 MTEXIT 999956 + MTLIFE 999957 missing (span) + UJRETARGET 999816-17 missing (tag); 27May MTEXIT 914593 + MTLIFE 914594 missing (span) + UJRETARGET 914191-92 missing (tag). ORDER 44 log rows (gate rows, mostly non-trade) unpacked — tag never listed, not added (relay authorizes stop-swing tags only). BROKER 0 rows NOT FOUND. Stop-swing tags: SLSRC 526 / SWINGPICK 562 / SL_REF 573 rows FOUND → added.
- SLSRC raw: `SLSRC site=S2POLL dir=SHORT src=OB_SWING obStruct=... obSwing=... nearest=... chosen=...` (values, no bar time). SWINGPICK: `SH=... atShift=N` (relative shift). SL_REF: `branch=.. obValid=.. slRef=.. distPts=.. site=.. zoneLo/Hi` (no bar time).

## R2 (fixed cutter diff raw — build_rowpack_b162.ps1 vs build_rowpack_b165r.ps1)

- Header comment (+3/-1: span rule + tag note). Tags (+3): SLSRC, SL_REF, SWINGPICK into alpha order (25 → 28).
- New SrvDT($raw) (regex `Core 0\d YYYY.MM.DD HH:MM` → `YYYY-MM-DD HH:MM`) + $tradespec (11 trades: entry#/exit#/MTEXIT-entry=) + span loop (find entry DEAL, exit DEAL, trade MTEXIT by `entry=<ref>`; end = max(exitDT, mtexitDT); unary-comma append) + SPAN echo per trade.
- Run/week/main-loop renames B162→B165R (same cutoffs). Appended superset check (B-162 raw rows byte-for-byte in -B165R; MISSING/CHANGED echo; counts).
- SPAN table: A1 end 11:35 (exit 11:35 = mtexit 11:35:00 pass); A2 end 17:50/17:50; A3 end 23:55/23:55; A4 end 10:55 (mtexit 10:55 pass); A5 end 17:15 (mtexit 17:15); A6 end 10:45 (mtexit 10:45); A7 end 17:35 (mtexit 17:35 pass, was 17:26); 27May end 20:10 (mtexit 20:10:09, was 20:08); C-06-03 end 10:00 (mtexit 10:00); B2 end 19:20 (mtexit 19:20:01, was 19:16); B3 end 15:25 (mtexit 15:25). Full j-numbers in result.
- Packs: RECON62-B165R 31943 rows (W1 7981/W2 15092/W3 8870, 11 days); JUNE0525-B165R 42968 (W1 11941/W2 14433/W3 16594, 15 days). Superset: OLD 73195, MISSING-OR-CHANGED 0, NEW 74911. ADDED 1716: MTEXIT 27May j=914593 (J-W1) + B2 j=999956 (J-W2); span-widened exit-pass rows (A4/A5/A6/A7/C-06-03/B3 MTEXITs were already packed — no new MTEXIT beyond the two); stop-swing rows in-window everywhere else.
- DEALS confirmed: 14 RECON + 8 June DEAL rows in -B165R (same deals, no new file).
- INDEX_B165R.md: UNMAPPED=0; exit MTEXIT refs added all 11 trades (A1 W1:6089 … C-05-27 W1:6876; B2 W2:14433).

## R3 (renderer build_setups_b165r.ps1: template SETUPS_B162, refs B162→B165R, exits recomputed from B165R MTEXIT by entry_ref, dash-normalized, origins carried verbatim)

- SETUPS_RECON62-B165R 28 rows: UNMAPPED=0, EXIT-FILLED=0, EXIT-DIFF=0. SETUPS_JUNE0525-B165R 20 rows: UNMAPPED=0, EXIT-FILLED=2, EXIT-DIFF=0.
- Changed cells: B2 exit_bar 2026-06-05 19:15 / exit_price 160.298 / exit_src TP_TOUCH (+ MTEXIT J-W2:14433 ref); 27May exit_bar 2026-05-27 20:05 / exit_price 159.535 / exit_src TP_TOUCH (+ MTEXIT J-W1:6876 ref). All other value cells SAME (origins carried; two script artifacts caught and removed: dot-format rewrites, duplicate MTEXIT refs).
- sl_swing_bar unchanged everywhere (FOUND tags carry no swing-bar-time field — filling = inference, forbidden).
- EXECUTED exit completeness scan: zero EXECUTED rows left NOT PRINTED on exit_bar/price/src.
- README B165R addendum appended (span fix + new tags + sl_swing_bar reason).

## X records

- CONTEXT X1 / HANDOFF X2 (1/1); ledger 1311 ("^1311." = 1); pointer B-165 MEASURED, Lane FIDELITY-B162 (first B-163, 3 of 6), packs of record -B165R; register untouched.

(End of slice)
