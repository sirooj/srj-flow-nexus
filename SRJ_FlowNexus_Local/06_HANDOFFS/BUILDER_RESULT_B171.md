# BUILDER RESULT B-171 - STOP: the 2 July long still fires; the S3 commit verdict does not gate its fire path

Trader summary: your 2 July long still fired on the trial, so the trial is out and your kept build is back byte-for-byte — nothing of the trial stays. The new print proves the rule itself worked: at 18:10 it says direct 0, walk 1, final 0 — the verdict held at dead. But your trade never passed through that gate at all: it went from waiting straight to the entry check in the same 18:15 pass, never armed through the in-play commit the fix guards. That is the same hole as your 28 August short, which also fires without that commit. So the fix needs a second half that closes the bypass, and that is the next relay. Everything else on all three windows matched the kept run exactly — entries, exits, lots — including your 7 July short holding past 15:30 to its 1.33747 target. I closed the MT5 window with the restore so no dead-trial chart is left open for you; the full deal tables are below for your grading.

## Relay order (B-171 BLIND-GBP0706 6 of 6, NOINPLAY-FINAL trial → STOP/RESTORED)

- Part 0 on builder/B-170 at d0572b4 (backup ls-remote exact; no remote builder/B-171 before push; builder/B-171 cut here; rev-parse HEAD = d0572b4 before commit). Push via backup, never origin.
- Skills loaded whole in order (srj-relay 104 lines incl. the Python day-log rule ordered directly by him between relays — disclosed ACCOUNTED deviation vs d0572b4: doc-only +6 lines, build-unaffecting, unstaged; srj-strategy 255 lines; .agents stub never opened).
- Reads in order: pointer (24); RESULT_B170 (83) + SLICE_B170 (35) (authorship stands, diff EMPTY); RESULT_B169 R4.3/S3; RESULT_B137 lot method; RESULT_B166/B167 settings (GBPUSD M5, 1782691200/1784332800, GBP0629-B162.ini / +Report B167, Profiles 4, B-167 leave-open procedure); INDEX_B170 + -B170 packs; XOBINPLAY_REG-B170.csv (:2-:5); README; FULL-B170 (934, 15 blocks); REGISTER whole (89); spec v4.2 whole (396, 3.5 L131 + 3.5.1 L143-151); FINDING EXIT-BREAK-RETEST whole (28); CONTEXT §4 whole. Ledger, AGENTS.md, .clinerules, journal: grep only. July journal never asked, never read.
- Names per 0.4 verified (kept B-170 EA 794DD4B8/ex5 3A55C566; ind 7842A02E norm 338FEF95/ex5 10880847EE593CB7E4D99E2FAE38F7F9DDEB519C23B373145CF7BACFC6292B21; OB 8BBF936B; Bias 3B1D9D3D; HTF D5FD5B06; terminal.ini CF80083C; run ini 9C88E21D; Profiles 4). Baselines: RECON62-B170 j2035655+, JUNE0525-B170 j2577697+, GBP0629-B170 j3114599+ (end lines = run markers, reported in T). Hunk NOINPLAY-FINAL; backups .preB171 (EA 794DD4B8 / EX5 3A55C566 / terminal.ini CF80083C) + content copies; edited copy .B171NIP (never committed). Trial runs RECON62-B171 (1787702400/1788998400) → JUNE0525-B171 (1779667200/1781308800) → GBP0629-B171 (B-166/B-167 settings; Report=\MQL5\Files\MT5_GBP0629-B171 + ReplaceReport=1, B-167 shape). Lane BLIND-GBP0706 (first B-166; 6 of 6). Ledger 1317, tag B171-NOINPLAY-FINAL-TRIAL. Kit PK-2.
- Start gate: log-1 = d0572b4; status 818 lines; git diff --quiet d0572b4 EMPTY on all 0.5 paths. Counts: ledger "^1316." = 1, B170 tag present, "^1317." = 0, "B171-" = 0; HANDOFF B-170: = 1, B-171: = 0; pointer 5-of-6 = 1; CONTEXT B170- = 1, B171- = 0; skill B4 = 1; journal 1076. SHAs per 0.4. No terminal64. No gate STOP (the skill deviation is his own ordered change).
- Scope per 0.6 (ONE EA edit at the commit site, ONE compile, ONE run per window). Nothing else touched. Legal results as listed.

## Part B - banking (verify-only; append nothing)

- Skill B4 + consequence L254-255; B-146 L230-233; spec 3.5 L131 ("Its zone, projected rightward from formation, has been penetrated by a bar's range or by a confirmed protective-side swing at any point within the current structural leg, and the XOB has not been invalidated."); 3.5.1 L143-151 (relevance→retracement→confirmation; unpromoted-at-confirmation = invalid); XOBSUIT-1 §6 answer 1 (ONLY lifecycle exit is invalidation by body close beyond the midline); L36 a/b; L34 EXACT-PRICE. All FOUND, raw in slice.

## Part S - separator on file (B-170 Part R final S3, SEPARATES, 0 UNKNOWN)

| row | direct hits | commitVia | kept outcome | under reading |
|---|---|---|---|---|
| 2/07 LONG | 0 (W1:6943) | SWING (W1:6949) | EXECUTED | REFUSED (his B4 must-never) — CHANGES |
| A6 | 1 (j=511215) | BAR (j=511222) | TAKEN 10:10 | same |
| A7 | 3 (j=515549) | BAR-at-16:50 (j=515562) | TAKEN 17:00 | same |
| B3 | 6 (j=1053625) | SWING hits=8 (j=1053632) | TAKEN 14:40 | same |
| C-05-27 | 2 (j=912409) | SWING hits=2 (j=912423) | TAKEN 15:35 (warm-up) | same |
| A1-A5, B2, C-06-03 | n/a (BAR/none paths) | BAR/none | TAKEN same candles | same |
| other C rows | — | — | out (OTHER-GATEs) | out |

Lines: XOBINPLAY_REG-B170.csv :2-:5.

## Part K - hunk NOINPLAY-FINAL (ONE edit)

- K1 rule-conflict: spec 3.5 L131 + B4 beside the hunk; the walk's job is unchanged when direct finds in play (it still confirms live zones: A2/A6/A7/B3 rows). No contradiction — B4 demands exactly this.
- K2 backups: EA.mq5.preB171 794DD4B8 + EX5.preB171 3A55C566 + terminal.ini.preB171 CF80083C + run-ini.preB171 9C88E21D + Profiles.preB171 (4 charts). Located by text (raw in slice): s31 decl EA:9125, XOBINPLAY print EA:9279, t133 walk EA:9426 (+legacy EA:9427), overwrite EA:9518 (`s31_inPlay = t133_inPlay;`), INPLAYCOMMIT print EA:9522, downstream S4-arm condition EA:9544 (`if((haveFvg || haveXob) && s31_inPlay)`) = the existing not-in-play path (no arm without it; no named abort).
- K3 the edit (26+/1− vs .preB171, balance 0, one marker set, .B171NIP AAB8A316 kept uncommitted): keep the direct verdict before the overwrite — direct=0 → s31 stays false whatever the walk returns (print direct=0 walk=<w> final=0); else the walk's verdict stands exactly as kept (print direct=1 ... final=<w>). Refusal rides EA:9544; no new gate/abort. Print NOINPLAYFINAL bar/dir/zone/direct/walk/commitVia/final.
- K4 compile: 0 errors, 0 warnings, binary fresh. EA AAB8A3168FF11C05410F66776E09A75A17E642C017AAB38DD5A2F6E629B9CF21; EX5 6E7488B0A4773057421AC766CAA067C2A61F0F2A3D52836AE5E4F9502F5D3D11 (trial binary, deployed in place).

## Part T - runs (STOP at T3; restores verified)

- T0 per launch (no terminal64; .preB171 copies; dates written + read back; script launches; wrapper killed after verify; PID-verified watchers; short polls).
- T1 RECON62-B171: `EURUSD,M5: 563338 ticks, 3168 bars ... Test passed in 0:03:11.170` (PRE=3593832; PID 10364, stopped after). 14 deals SAME vs B-170 in entries, exits, lots (table in slice). NOINPLAYFINAL: final=1 at A2 (17:30), A3 (15:35-45), A4 (09:00), A5 (16:15), A6 (10:00/10:05), A7 (16:50); A1 final=0 (zone 1.16492-1.16507, commitVia-none path — armed elsewhere, behavior identical). No STOP.
- T2 JUNE0525-B171: `USDJPY,M5: 740873 ticks, 4320 bars ... Test passed in 0:03:55.900` (PRE=4138253; PID 12104, stopped after). 8 deals SAME vs B-170 incl lots. NOINPLAYFINAL final=1 at B3 (14:35) + C-05-27 (15:30). No STOP.
- T3 GBP0629-B171: `GBPUSD,M5: 1386092 ticks, 4320 bars ... Test passed in 0:04:18.038` (PRE=4677071; PID 11116). Deals: #2 buy 18:15 1.33716 / #3 sell 19:07:53 1.33564 0.65 (2 July — STILL FIRES); #4 sell 14:45 1.33863 / #5 buy 16:54:59 1.33747 1.28 (7 July entry SAME, TP exit SAME as B-170). NOINPLAYFINAL 18:10: direct=0 walk=1 commitVia=SWING final=0 (j=5046694; XOBINPLAY hits=0 same pass) — the hunk held, yet the trade fired. 7/07 FREEZE/hold behavior SAME as B-170 (no other exit moved; no new fire).
- STOP: "STOP if 2 July 18:10 long still fires" — FIRED → STOP. Mechanism found on kept+ trial rows: the 18:15 pass walks IDLE→S1→S2→S3→S5→SIGNAL (j=5046659-5046872) with NO S3→S4 arming — the fire path skips the S3 commit (s31) entirely, same class as A1's commitVia-none path. The S3 verdict cannot gate a fire that never visits S3. Next: trace/close the S3→S5 jump for 2/07 (same-bar carry candidate, UJCONFIRMCARRY EA:9577 area prints).
- Restores (STOP clause): terminal 11116 stopped first (no dead-trial chart left open for him — full tables filed here instead); EA + EX5 restored byte-for-byte from .preB171 (794DD4B8 / 3A55C566 re-verified); terminal.ini CF80083C + run ini 9C88E21D + Profiles 4 charts restored. Verdict RESTORED (all three runs finished).

## Part X - records (grep-first, 0 before, 1 after each)

- X1 CONTEXT §4 (relay text verbatim). X1b: n/a (no B-169 lesson work this turn — B-169 lessons were landed B-169).
- X2 HANDOFF §3 (relay text with verdict RESTORED).
- X3 ledger 1317, tag B171-NOINPLAY-FINAL-TRIAL (B4 refs; S3 table; K hunk SHAs; T tables + markers + NOINPLAYFINAL rows; STOP + bypass path + restores; SHAs).
- X4 pointer rewritten (24 lines): latest B-171 RESTORED; build line = B-170 kept (EA 794DD4B8/EX5 3A55C566 — trial reverted); Lane BLIND-GBP0706 (first B-166, 6 of 6): lane at its limit, verdict RESTORED, S3 needs the bypass-closing half; Next = the S3→S5-jump trace + second-half hunk, then his grading; O3 pending; goal open. Terminal closed (PID 11116 stopped for restore).

## Part F - file, push, reply

- F1 this result. F2 slice (raw rows; under 600 lines). No F2b (RESTORED — no packs filed; T-segments on the day log: RECON62 j3593832+, June j4138253+, GBP j4677071+).
- F3 ledger 1317. F4 pointer.
- F5 stages result, slice, ledger, pointer, CONTEXT, HANDOFF. Never EA, includes, indicators, ex5, journals, logs, inis or backups. (Strategy skill + journal CSV untouched — verify-only Part B. Relay skill +6 Python lines stay unstaged, disclosed.)
- F6 commit (rev-parse HEAD before commit), push via backup, ls-remote must return the commit.
- Reply line: B-171 is done, GitHub branch builder/B-171, commit <hash>, verdict RESTORED.

## Final disk state (RESTORED; B-170 kept build on disk, verified, terminal closed)

- EA 794DD4B82226CD6BA0C0414DA9DBB182DF3AD75C4026946BB6E3FB1252B8EB61 + ex5 3A55C56685134C80E3D189C2C2EC680C27F5459C51288E35B9D543BFE0CB86D1 (pair matches; trial reverted); indicator 7842A02E + ex5 10880847 (untouched); OB 8BBF936B; Bias 3B1D9D3D; HTF D5FD5B06; terminal.ini CF80083C; run ini 9C88E21D; Profiles 4 charts; no terminal64. CONTEXT +1; HANDOFF +1; ledger +1 (1317); pointer rewritten; result + slice new; helper scripts (xobinplay/cut/index/full/r12/walk/linemap/winA1A2/rows2405/lines707) + work txts + .preB171/.B171NIP unstaged. No source/ex5 committed.

(No carried note — every record-first search found its ruling; the next step is rows, not questions.)
