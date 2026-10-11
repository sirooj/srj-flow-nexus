# BUILDER RESULT B-172 - Read the shortcut: 2 July and your 28 Aug short take the same road, and no direct-based reading separates them

Trader summary: your catch is confirmed on the rows, exactly as you called it. The jump your 2 July long took — skipping the zone check on the way to the final gate — is the same jump your valid 28 August short took, and both zones read "not in play" on the machine's direct check (yours 2149 at 10:00 with 0 hits, 2 July's 2405 at 18:10 with 0 hits). So no rule built on that check can keep your short and refuse the long: demanding a live zone kills them both, and your long's window even holds eight live zones. What does separate them on paper is whose zone it is — your 28 August zone, 2109, sits live in the machine's own zone list at your confirmation candle while the machine picked 2149 — but your words name no jump rule, so nothing is built from that here. The blind lane is parked at its 6-relay limit with your 7 July fix kept; this opens the new lane. Nothing was changed, compiled, or run.

## Relay order (B-172 INPLAY-JUMP-0702 1 of 6, MEASURED read-only)

- Part 0 on builder/B-171 at d5facbe (backup ls-remote exact; no remote builder/B-172 before push; builder/B-172 cut here; rev-parse HEAD = d5facbe before commit). Push via backup, never origin.
- Skills loaded whole in order (srj-relay 104 lines incl. the Python day-log rule; srj-strategy 255 lines prior full reads stand + diff EMPTY; .agents stub never opened).
- Reads in order: pointer (24); RESULT_B171 (67) + SLICE_B171 (23) (authorship stands, diff EMPTY); RESULT_B170 Part R S3 table; RESULT_B169 R4.2-R4.4; RESULT_B161 (FOUND — the EA-readable in-play set; used in R3.2); INDEX_B170 (37) + -B170 packs; XOBINPLAY_REG-B170.csv (:2-:5); README; FULL-B170 (934, 15 blocks); REGISTER whole (89); spec v4.2 whole (396; 3.5 L131, 3.5.1 L143-151, 3.6, 9.7 quoted in B); FINDING EXIT-BREAK-RETEST whole (28); XOBSUIT-1 §6 (L81-106); CONTEXT §4 whole. Ledger, AGENTS.md, .clinerules, journal: grep only. July journal never asked, never read.
- Names per 0.4 verified (kept B-170 EA 794DD4B8/ex5 3A55C566; ind 7842A02E norm 338FEF95/ex5 10880847EE593CB7E4D99E2FAE38F7F9DDEB519C23B373145CF7BACFC6292B21; OB 8BBF936B; Bias 3B1D9D3D; HTF D5FD5B06; terminal.ini CF80083C — restored after an ACCOUNTED timestamp-only rewrite, see gate; run ini 9C88E21D; Profiles 4; .B171NIP AAB8A316 present on disk, never committed). Kept segments per INDEX_B170; trial segments T1 j3593832+ / T2 j4138253+ / T3 j4677071+ (2/07 jump j5046659-5046872, NOINPLAYFINAL j5046694). Lane BLIND-GBP0706 parks at 6 of 6 (WINLINE kept B-170; S3 paper SEPARATES; trial STOP on the jump). New lane INPLAY-JUMP-0702 (first B-172; 1 of 6). Ledger 1318, tag B172-JUMP-PATH-READ. Kit PK-2.
- Start gate: log-1 = d5facbe; status 842 lines; git diff --quiet d0572b4...d5facbe EMPTY on all 0.5 paths except the disclosed +6 Python day-log lines in srj-relay SKILL.md (his direct order between relays, doc-only, build-unaffecting, used by every scan this turn — ACCOUNTED, staged nowhere). Counts: ledger "^1317." = 1, B171 tag present, "^1318." = 0, "B172-" = 0; HANDOFF B-171: = 1, B-172: = 0; pointer 6-of-6 = 1; CONTEXT B171- = 1 (L204), B172- = 0; journal 1076. SHAs per 0.4 (terminal.ini restored to CF80083C after the timestamp rewrite). No terminal64. No STOP.
- Scope read-only MEASURED. No edit/compile/run/launch/gate/hunk/tolerance/buffer/number; 4 June/XOB-0604/KILL-0604/STOP-BASIS/S1 unreopened; July journal untouched. Python for every end-to-end log scan per the new skill rule (census_b172.py, XOBINPLAY re-cut, B152PR sets); PowerShell for pack CSVs, sources, SHAs. Legal results as listed.

## Part B - banking (verify-only; append nothing)

- B4 + consequence skill L254-255; SWEEP-THEN-RETEST skill L46 (8/28 London valid: AS.L sweep + D-VWAP retest + chart proof); SETUP DEFINED skill L51 + POTENTIAL vs SETUP skill L52; CONFIRMATION-CANONICAL skill L112; B-146 kill level skill L230-233; A1 register row 12 (SHORT, D-VWAP anchor, 1.16466) + NOTE L15 (origin 2109 1.16505-1.16537 formed 01:00; machine pick 2149); spec 3.5 L131 (leg-penetration in-play), 3.5.1 L143-151 (relevance→retracement→confirmation), 3.6 XOB-touch-permitted/FVG-touch-required table, 9.7 (only reproduced trade not a structural match). All FOUND, raw in slice.

## Part R1 - the jump (raw with line numbers)

- Roads into S5_GATE_CHECK: (1) S3→S4 arm, EA:9544 (`if((haveFvg || haveXob) && s31_inPlay)` → ST_S4_ARMED) — reads the zone verdict; (2) S4→S5 edge, EA:9795 (confirmation predicate on the armed anchor — IsConfirmationCandle + S54, no zone read); (3) S3→S5 PREBIND jump, EA:9637 block (else-branch = NO qualifying zone; confirmation predicate + S54; "promote DIRECTLY to ST_S5_GATE_CHECK ... S5 block below runs in this same pass"; CONFIRM_PREBIND print) — reads NO zone verdict. Out of S3: arm (needs zone), jump (needs confirmation, forbids nothing zone-side), kills/aborts.
- 2/07 kept (GBP0629-B170 W1:7028-7073): 18:15 IDLE→S1→S2→S3 (pl=7033) →S4 (pl=7045) →S5 (pl=7047) →SIGNAL — NORMAL road (not the jump on kept; the jump reading in B-171 came from the trial, where S4 was blocked and PREBIND fired instead).
- A1 kept (RECON62-B170 W1:5464-5515): 10:00 IDLE→S1→S2→S3 (pl=5467) → 10:05 S3→S5 direct (pl=5504) →SIGNAL — the JUMP, no S4. Condition that sent it: PREBIND confirmation PASS on the D-VWAP anchor with no qualifying zone.
- Correction to B-171's STOP note filed here: the trial did not reveal a second bypass — it showed the fallback: block S4 (final=0) and the same fire reroutes S3→S5. The jump is the only S3 exit besides arming.

## Part R2 - census of the jump (kept B-170 packs; per-entry roads)

- Jump fires (S3→S5 direct, no S4 at entry): A1 (10:05, day pl=352) + B2 (6/05 16:15, day pl=2129). Every other executed deal goes S3→S4→S5: A2 (17:35 S4 pl=2140), A3 (15:40/15:50 S4s), A4 (09:05 S4), A5 (16:20 S4), A6 (10:05/10:10 S4s), A7 (16:55 S4), C-05-27 (15:30 S4), C-06-03 (09:05 S4), B3 (14:40 S4), T0702 (18:15 S4 pl=1363), T0707 (14:45 S4 pl=1056). Full per-date transition lists in slice (census_b172.py).
- Zones/commits: A1 XOB 2149 1.16492-1.16507, direct hits=0 (10:00 row, all three builds identically), commitVia none (no S3 commit); B2 zone 3308 159.881-159.916, direct hits=0 (16:05/16:10, all builds); T0702 XOB 2405, direct hits=0 + SWING pass (S4 road on kept). A2/A3/A4/A5 BAR commits; A6/A7/B3/C-05-27 direct-alive (1/3/6/2 hits); C-06-03 BAR. Ruled-out C rows that reached S3: none armed (all die at S2/S4-gates or never confirm — OTHER-GATEs per B-169 S1; no C row takes any road to S5).

## Part R3 - zones at the confirmation candles (operator zone first, B-75)

- R3.1 his A1 zone: anchor D-VWAP (register row 12, HIS anchor-rank ruling); origin 2109 (1.16505-1.16537, formed 28 Aug 01:00 — NOTE L15, his most-recent documentation tag); machine pick 2149 (NOTE L15 "unchanged"); sweep-then-retest valid after the AS.L sweep (skill L46 + chart proof); exit 11:35 on the D-POC break (finding §1).
- R3.2 census at A1's 10:00 (RECON62-B170 W1 B152PR set, 21 zones): 12 B + 9 S (1389, 1481, 1484, 1516, 1704, 1728, 1784, 1866, and 2109,S,1.16505-1.16537,2026.08.28 05:05,...,1.16507,1.16497). HIS zone 2109 IS live in the indicator's set at his confirmation candle. Direct verdict per zone: NOT PRINTED (only the pick measured: 2149 hits=0 at 10:00 on kept/B-170/trial identically). Machine zone 2149 (1.16492-1.16507, direct 0) beside them.
- R3.3 census at 2/07 18:10 (-B168F set): 8 B (1582, 1869, 1875, 1899, 1909, 1941, 1943, 2367) + 150 S; direct per zone NOT PRINTED (only 2405 measured: 0); his dead 16:20 zone 2475 (1.33562-1.33684, dropped after the 17:40 through-close, no kill row).

## Part S4 - separator table (readings × every A/B/C row + 2/07 + GBP deals)

- (i) JUMP-NEEDS-DIRECT (jump requires the direct verdict on the setup's own zone): 2/07 refused (2405 direct=0, trial row) — but A1 refused (2149 direct=0, three builds) and B2 refused (3308 direct=0, three builds) → must-holds FAIL → DOES NOT SEPARATE. All other rows unaffected (S4-road; C rows out).
- (ii) JUMP-NEEDS-A-LIVE-ZONE (jump requires ≥1 live trade-direction zone at confirmation): A1 keeps firing (9 live SHORT zones) + B2 keeps firing (26-zone set, LONG live) + 2/07 keeps firing (8 live LONG zones) → nothing refused → DOES NOT SEPARATE.
- (iii) his-words reading for A1: NOT FOUND — his banked words name no jump condition (anchor/retest/confirmation/sweep words all govern other steps; sweep-then-retest admits the entry, never the road). Nothing invented.
- Per-row verdicts (pack lines in slice; kept outcome → under reading): A1-A7 TAKEN→same (except (i) refuses A1); B2/B3 TAKEN→same (except (i) refuses B2); C-05-27/C-06-03 TAKEN→same; other C rows out→out (OTHER-GATEs); T0702 → refused only under (i)-with-A1/B2-casualties; T0707 → same under all (S4 road).
- Overall: NONE SEPARATES. Must-holds decide it: (i) breaks A1+B2, (ii) changes nothing, (iii) absent.
- Buildability: (i) needs the pick's direct verdict at the jump site — EA-readable today (s31_inPlay at EA:9125+, printed EA:9279; the jump site EA:9637 runs later in the same pass). (ii) needs the live-set count — NOT EA-READABLE as a count (B152PR rows print per zone; no tally variable in text; NOT FOUND by text search).

## Part R4 - decision for B-173 (filed, no edit)

- No reading separates with few or many parts: (i) costs A1+B2, (ii) is vacuous on these rows, (iii) does not exist in his words. The lane continues on the R3 census, not on a trial. Concrete next measurements (no hunk): (a) direct verdicts for HIS zones at their candles — 2109 at A1 10:00 (the machine measured only its pick 2149); the B152PR z1 rows prove 2109 live, the XOBINPLAY-per-zone print does not exist per zone; (b) what arms the three jumps — PREBIND fired on anchor retest+confirm for A1 (D-VWAP), B2 (Monthly-POC 16:10), 2/07-trial (D-POC): census the confirmation terms + touch attributes at those three bars against his TOUCH-OR-BREAK words; (c) whether his-zone-liveness (B162ORIGIN head alive at confirmation) grades the three jumps differently from machine-pick-liveness — A1 head 2109 alive, B2 head at 16:10, 2/07 head 2367 alive. If (c) separates on rows, it becomes the B-173 reading; until then no hunk. .B171NIP is NOT reused (its gate sits at the commit, off the jump road).

## Part X - records (grep-first, 0 before, 1 after each)

- X1 CONTEXT §4 (relay text verbatim). X2 HANDOFF §3 (relay text verbatim). X3 ledger 1318, tag B172-JUMP-PATH-READ (R1 sites EA:9544/9795/9637; R2 per-entry roads with A1+B2 jumps; R3 2109-live + directs; S4 verdicts incl (iii) NOT FOUND; R4 no-separator + next measurements; SHAs).
- X4 pointer rewritten (24 lines): Lane BLIND-GBP0706 PARKED at 6 of 6 (WINLINE kept B-170); Lane INPLAY-JUMP-0702 (first B-172, 1 of 6); Next = B-173 per R4 (R3-census measurements, no hunk yet), then his grading of a fresh GBPUSD run; O3 pending; goal open.

## Part F - file, push, reply

- F1 this result. F2 slice (raw rows; under 600 lines). No F2b (MEASURED read-only; no new packs — re-cut scans were targeted, filed as j-lines).
- F3 ledger 1318. F4 pointer.
- F5 stages result, slice, ledger, pointer, CONTEXT, HANDOFF. Never EA, includes, indicators, ex5, journals, logs, inis or backups. (Skills + journal CSV untouched — verify-only Part B; the +6 Python lines stay unstaged, disclosed.)
- F6 commit (rev-parse HEAD before commit), push via backup, ls-remote must return the commit.
- Reply line: B-172 is done, GitHub branch builder/B-172, commit <hash>, verdict MEASURED.

## Final disk state (MEASURED read-only; B-170 kept build on disk, verified, terminal closed)

- EA 794DD4B82226CD6BA0C0414DA9DBB182DF3AD75C4026946BB6E3FB1252B8EB61 + ex5 3A55C56685134C80E3D189C2C2EC680C27F5459C51288E35B9D543BFE0CB86D1 (pair matches); indicator 7842A02E + ex5 10880847 (untouched); OB 8BBF936B; Bias 3B1D9D3D; HTF D5FD5B06; terminal.ini CF80083C; run ini 9C88E21D; Profiles 4 charts; no terminal64. CONTEXT +1; HANDOFF +1; ledger +1 (1318); pointer rewritten; result + slice new; helpers (census_b172.py + work txts) unstaged. No source/ex5 committed.

(No carried note — the A1 zone is fully on his record: anchor, origin, pick, sweep proof and exit.)
