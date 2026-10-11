# BUILDER SLICE B-171 - raw rows (STOP/RESTORED: 2/07 fires past final=0)

Base: builder/B-170 head d0572b4 on builder/B-171. Gate per result (diff --quiet EMPTY + disclosed +6 skill lines; counts; SHAs; no terminal64). Markers j3593832 (T1) / j4138253 (T2) / j4677071 (T3) on Tester/logs/20261011.log.

## Part B (verify-only)

- B4 + consequence skill L254-255; B-146 L230-233; spec L131 (leg-penetration in-play) + L143-151 (relevance→retracement→confirmation); XOBSUIT-1 §6 ans1 (ONLY exit = invalidation); L36 a/b; L34 EXACT-PRICE.

## Part K (hunk + compile)

- Backups: EA.preB171 794DD4B8, EX5.preB171 3A55C566, terminal.ini.preB171 CF80083C, run-ini.preB171 9C88E21D, Profiles.preB171 4 charts.
- Spots: s31 decl EA:9125; XOBINPLAY print EA:9279; t133 walk EA:9426 (+legacy EA:9427); overwrite EA:9518 (`s31_inPlay = t133_inPlay;`); INPLAYCOMMIT print EA:9522; S4-arm EA:9544 (`if((haveFvg || haveXob) && s31_inPlay)`).
- Hunk (26+/1− vs .preB171, balance 0, one marker set, .B171NIP AAB8A316): direct=0 → s31 stays false + print direct=0 walk=<w> final=0; else walk stands + print direct=1 ... final=<w>. No new gate/abort.
- Compile: 0 errors, 0 warnings, binary fresh. EA AAB8A316; EX5 6E7488B0.

## Part T (STOP at T3)

- T1 `EURUSD 563338 ticks, 3168 bars ... 0:03:11.170` (PRE=3593832, PID 10364). 14 deals SAME vs B-170. NOINPLAYFINAL final=1: A2 17:30, A3 15:35/15:40/15:45, A4 09:00, A5 16:15, A6 10:00+10:05, A7 16:50. A1 final=0 (zone 1.16492-1.16507, commitVia-none; armed elsewhere, SAME).
- T2 `USDJPY 740873 ticks, 4320 bars ... 0:03:55.900` (PRE=4138253, PID 12104). 8 deals SAME incl lots. final=1: B3 14:35, C-05-27 15:30.
- T3 `GBPUSD 1386092 ticks, 4320 bars ... 0:04:18.038` (PRE=4677071, PID 11116). Deals #2 18:15 1.33716 / #3 19:07:53 1.33564 (2/07 FIRES → STOP); #4 14:45 1.33863 / #5 16:54:59 1.33747 (7/07 SAME as B-170). NOINPLAYFINAL 18:10: `... zone=1.32815-1.32832 direct=0 walk=1 commitVia=SWING final=0` (j=5046694); XOBINPLAY hits=0 same pass. Bypass: `18:15:00 STATE IDLE->S1_REGIME->S2_LTF_ALIGN->S3_ZONE_WAIT->S5_GATE_CHECK->SIGNAL dir=LONG poi=Daily-POC` (j=5046659/72/73/700/872) — no S3→S4 arm; S3 verdict never visited (A1 class).
- Restores: PID 11116 stopped; EA 794DD4B8 + EX5 3A55C566 + terminal.ini CF80083C + run ini + Profiles re-verified.

(End of slice)
