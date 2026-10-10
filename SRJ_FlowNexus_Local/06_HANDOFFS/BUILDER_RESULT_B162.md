# BUILDER RESULT B-162 - the zone engine now prints your most recent in-play XOB beside every setup; no trade changed

Trader summary: each setup now carries your label. The zone list itself - the only place that knows when every zone formed - prints, at every confirmation, which in-play zone is newest: your 28 Aug take reads your 01:00 zone, your 1 Sep take reads its newest zone, and both 8 Sep shorts read your 9:20 zone. Nothing about entries, stops or exits moved: all fourteen of your RECON takes and all eight June takes fire at your prices, your 16:15 low still books, 4 June still refuses, and nothing ruled out fires. The machine's own pick is untouched - on 28 Aug it still names its 06:40 zone; your label sits beside it. Nothing is asked.

## Relay order (B-162 XOB-DETECT-920 3 of 6: print-only origin tag from the indicator's zone loop, KEPT)

- Part 0 on builder/B-161 at 5dcfa17 (ls-remote returned 5dcfa178b543e7992a3aade8285b7157aa7ec04c, parent 6488586; builder/B-162 cut here; HEAD builder/B-162 at 5dcfa17 re-checked after cut). Push via backup, never origin.
- Skills loaded whole in order (relay, then strategy; .agents stub never opened; trading rule touched: K0 done).
- Reads in order: pointer; RESULT_B161 + SLICE_B161 (R2 site, Part S); RESULT_B160a + SLICE_B160a (census method: z1 promoted + alive + post-promo touch); RESULT_B160 (T discipline, gates); register whole; CONTEXT + HANDOFF whole; both ZONES_*-B161.csv; spec v4.2 whole (3.5 L126-137 + 9.9 L354 as B-160a/B-161 quoted); DEALS_RECON62-B160 + DEALS_JUNE0525-B160 present under ROWPACK.
- Names per 0.4 verified: EA 1617DC1A/ex5 187A7202; indicator src 1009A4EF (Indicators/SRJ_FlowLogic.mq5, holds B152PR z1 indicator:1538-1543) / ex5 0CADACC6; OB 8BBF936B; Bias 3B1D9D3D; HTF D5FD5B06; skill L241-244 count 1. In-play rule = B-160a census rule; most recent = latest COrderblock.startBar; identity target = SLICE_B161 Part S. Trial B162K; backups .preB162; runs RECON62-B162 (1787702400/1788998400 EURUSD) + JUNE0525-B162 (1779667200/1781308800 USDJPY); ledger 1308 tag B162-ORIGIN-TAG-INDPRINT.
- Start gate: log-1 = 5dcfa17; status 725 lines (dirty tree preserved); targeted diff EMPTY; SHAs match; terminal.ini live 3CB643D6 (B-161 ACCOUNTED, June window as-run); no terminal64. Records 1/1/1/1 (CONTEXT B161-ORIGIN-IS-DOCUMENTATION, HANDOFF B-161, ledger 1307, pointer B-161). Pre-greps 1308/B162ORIGIN/B162K all 0. No STOP.
- Scope: one indicator edit (print only), one indicator compile, RECON62 then June; restore on STOP/fail (never needed). No EA edit/compile; no buffer/pick/PROMO/kill/bias/stop/target/exit change; no include edit; no new input/buffer/array/number/tolerance/filter; no id ordering; no question. Legal results used: FOUND, SAME, MET, KEPT, ACCOUNTED.

## Part B - banking

- Grep-first: "there can be multiple XOBs" = 1 = ALREADY_BANKED (6488586); appended nothing.

## Part R - reading (before the edit)

- R1 Loop pasted raw with real line numbers (indicator:1529-1548; segment :1538-1543; full text in slice). It walks all g_orderblocks (b150n, GetOB). Promoted read at :1534 (`!b150ob.isPromoted`), alive at :1534 (`!b150ob.isValid`, B-147 MACH alive), comeback at :1536 via g_b150Touched[id] (set in first loop :1497-1527 on post-promotion range overlap) with time g_b153cbT[id] printed at :1542. COrderblock.startBar reachable in the same loop: FOUND (b150ob is COrderblock*, int startBar per SRJ_Types; ranked the same way at OrderblockMgr:1101). Print gate: unconditional PrintFormat (InpDebugLog appears 0 times in the indicator); cadence: every closed bar (`if(barClosed)`).
- R2 B-152 lesson: the halt came from grown-slot arrays indexed by zone id. The new print reads only fields of the zone already in hand (objId, isBullish, low, high, startBar) plus the comeback arrays at the id this loop already indexes (:1536/:1542). No new array, no new index: proceed (no STOP).

## Part S - identity table

- On record: SLICE_B161 Part S (origins A1 2109, A2 2549, A3 2793, A4 3130, A5 3178, A6 3293, A7 3293, B2 3308, B3 3913, C-06-03 2930, C-05-27 2094, C-06-04 none). No new grade; graded by identity (CONTEXT B161-ORIGIN-IS-DOCUMENTATION).

## Part K - kept-build edit (print only, indicator)

- K0 Rule-conflict (skill L241-244: several XOBs/FVGs can each qualify, no precedence; origin tag is documentation, never a trade gate; spec 3.5 L126-137 + 9.9 L354 re-read). A print changing no buffer contradicts none: proceed.
- K1 Backups .preB162 = live verified: indicator src 1009A4EF + ex5 0CADACC6; EA src 1617DC1A + ex5 187A7202 as control; terminal.ini.preB162 3CB643D6 + Profiles.preB162 (4 charts) content copies.
- K2 One edit (+41/-0, zero-minus verified): declare per-side locals before the R1 second loop; inside the loop track the in-play zone with the latest startBar per side (count + id set + origin fields); after the B152PR summary print two B162ORIGIN rows (side B then S; origin=NONE n=0 range=- formT=- set=- when empty). Full diff raw in slice; .B162K src+ex5 kept uncommitted.
- K3 One indicator compile: 0 errors + same pre-existing code-43 warning as B-160 (line 1494 `(int)b150id` cast, untouched line). Src 7842A02E84DF0314BF621CA323111E850E9A75EFC4B45FC7A76CFC56CD2650C6; new ex5 10880847EE593CB7E4D99E2FAE38F7F9DDEB519C23B373145CF7BACFC6292B21, binary fresh. EA ex5 unchanged 187A7202.

## Part T - runs (script-file launch; window written + read back before each run; watcher PID-verified; wrapper killed)

- T1 RECON62-B162 (ini EURUSD read back; WMI PID 21240; window verified 8/26 replay 00:00:28; wrapper killed, terminal 22632 alive; watcher PID 20732 verified; DONE 00:01:47 was false-early - journal still at 8/28 - owned tooling note below; genuine marker verified by direct tail read: EURUSD 563338 ticks/3168 bars Test passed in 0:02:44 at Tester/logs/20261011.log:541696; PRE=541700 for June).
- T2 Gates, filed table vs DEALS_RECON62-B160 (EA 1617DC1A, ind 10880847, Tester/logs/20261011.log): G1 14/14 SAME side/date/time/price, deals #2-15 (volumes per sizer rule). G2 trade-side B162ORIGIN = Part S on all 7: A1 10:00 S 2109 (1.16505-1.16537 f01:00); A2 17:30 B 2549 (1.15975-1.16013 f16:45); A3 15:55 B 2793; A4 09:15 B 3130; A5 16:40 B 3178; A6 10:05 S 3293 (1.16230-1.16256 f09:20); A7 16:55 S 3293. G3 set= = Part S id lists on all 7 (order ignored). G4 C rows silent (7 A6FIRED only, no deals past #15, no halt rows); ZONEPICK A1 still 1.16492-1.16507 (pick untouched). All MET: June gated on.
- T3 JUNE0525-B162 (leftover terminal 22632 stopped by PID, 0 remaining; June window written + read back; WMI PID 19252; window verified USDJPY 5/25 replay 00:07:01; wrapper already exited, terminal 21516 alive; watcher PID 7200 verified; DONE 00:18:53 genuine - marker USDJPY 740873 ticks/4320 bars Test passed in 0:03:22 at Tester/logs/20261011.log): G1 8/8 SAME, deals #2-9. G2 B2 16:10 B 3308 (159.881-159.916 f14:35); B3 14:35 B 3913 (160.489-160.504 f05:20); C-06-03 09:05 B 2930; C-05-27 15:30 B 2094; 4 June 09:50 S origin=NONE n=0 + 09:55 refused PROMO_RETURN_NONE (ABORT + A6REFUSED quoted) + 11:00 same pair. G3 sets SAME as Part S. G4 B1, 2 June, 10 June silent. Same STOP rules, none hit.
- T4 KEPT (every gate both runs). B162K indicator src 7842A02E + ex5 10880847 stay on disk (EA 1617DC1A/187A7202 untouched). Terminal 21516 stopped by PID; terminal.ini + Profiles restored from .preB162 (3CB643D6 + 4 charts verified); no terminal64. Final SHAs reported.

## Part W - workflow edit (KEPT; his documentation order, skill L241-244)

- srj-relay "Setup report" columns before -> after (exact): `...,xob_id,xob_range,xob_promoT,xob_inplay_printed,commit_via,...` -> `...,xob_id,xob_range,xob_promoT,xob_inplay_printed,xob_origin_id,xob_origin_range,xob_origin_formT,commit_via,...` Plus line under it: "xob_id stays the machine's pick; xob_origin_* is his documentation tag (most recent in-play XOB, his words 2026-10-10, B-160a), read from the trade-side B162ORIGIN row at the confirmation candle; never a trade gate."
- srj-relay "Row pack" tag-list text before -> after (exact): "Rows: every row whose tag is in the relay's tag list, inside the session windows (server 09:00-12:00 and 14:00-19:00), plus every deal row." -> "Rows: every row whose tag is in the relay's tag list (from B-162 the tag list includes B162ORIGIN, the most-recent in-play XOB per side), inside the session windows (server 09:00-12:00 and 14:00-19:00), plus every deal row."

## Part X - records (grep-first, append once, verify count 1 each)

- X1 CONTEXT section 4 appended (verbatim). Count 1.
- X2 CONTEXT section 5 appended (verbatim). Count 1.
- X3 HANDOFF section 3 appended after the B-161 line, verdict KEPT filled. Count 1.
- X4 ledger 1308, tag B162-ORIGIN-TAG-INDPRINT (R1/R2 raw, diff, compile, tables, verdict, SHAs). "^1308." = 1.
- X5 pointer rewritten (35-line cap): latest B-162 KEPT; Lane XOB-DETECT-920 CLOSED KEPT B-162; O3 pending kept; Next next fidelity item; goal open.
- X6 register (KEPT): section A row-1 NOTE (origin 2109, pick 2149 unchanged) + rows 6/7 NOTEs (origin 3293, documentation).

## Part F - file, push, reply

- F1 this result. F2 slice (R1/R2 raw, diff, G rows with run + EA SHA + ind ex5 SHA + log file:line; under 600 lines).
- F2b packs: 6 week ROWPACK_RECON62/JUNE0525-B162_W1..W3 (tag list + B162ORIGIN; 31037 + 42158 rows) + DEALS x2 (G1-verified) + 26 day files + INDEX_B162 (translated, UNMAPPED=0); REPORT/SETUPS x2 with Part W columns (28 + 20 rows, origins per trade-side B162ORIGIN; 2 NOT-PRINTED confirms have no confirm bar).
- F3 ledger 1308. F4 pointer.
- F5 stages result, slice, ledger, pointer, CONTEXT, HANDOFF, register, srj-relay skill, packs + reports. Never EA, includes, indicator, ex5, .preB162, .B162K, journals, logs, inis, profiles, charts, TEMP.
- F6 branch re-check from disk, commit, push via backup to builder/B-162; ls-remote check must return the commit.
- Reply line: B-162 is done, GitHub branch builder/B-162, commit <short hash>, verdict KEPT.

## Final disk state (KEPT turn; B162K indicator pair is the new kept build on disk, verified, terminal idle)

- Indicator src 7842A02E84DF0314BF621CA323111E850E9A75EFC4B45FC7A76CFC56CD2650C6 + ex5 10880847EE593CB7E4D99E2FAE38F7F9DDEB519C23B373145CF7BACFC6292B21 (B162K on disk = live); EA src 1617DC1A + ex5 187A7202; OrderblockMgr 8BBF936B; BiasEngine 3B1D9D3D; HTFEngine D5FD5B06; terminal.ini 3CB643D6 June as-run; Charts as-run (4); no terminal64. .preB162 + .B162K kept uncommitted. CONTEXT +2; HANDOFF +1; ledger +1 (1308); pointer rewritten; register +3 NOTEs; skill +2 (Setup-report, Row-pack); REPORT 2 new SETUPS; ROWPACK 6 week + 2 DEALS + 26 day + INDEX new. No source/ex5 committed.

## Owned tooling note (B-162 defect class, no skill owns the watcher)

- T1's wrapper wrote DONE 00:01:47 while the journal was still at 8/28; the genuine EURUSD marker landed 00:03:20. A DONE file is trusted only with its journal marker read directly (marker line + ticks/bars). Filed in ledger 1308.

(No carried note - no question goes to him.)
