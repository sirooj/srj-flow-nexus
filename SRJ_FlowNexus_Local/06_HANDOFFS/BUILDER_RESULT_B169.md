# BUILDER RESULT B-169 - paper test of two fixes: 5m on the confirmation candle only, and the 7 July Weekly-POC as an entry line (plus your 2 July ruling banked)

Trader summary: your 2 July ruling is banked first — that long should never have fired, and the sheet now treats it as must-never. On the 5m fix (judge the 5m only on the confirmation candle, never kill before it): it changes nothing it should. Every one of your 7 EU takes and your owed 5 June and 11 June takes still enter on the same candle, every ruled-out row stays out, but your owed 5 June 16:15 long still cannot prove its 16:10 confirmation touch on the rows — so this fix does not separate and goes no further. On the Weekly-POC fix (your 14:20 short-side retest makes it an entry line, so its 15:30 break cannot exit): your 7 July short holds past 15:30, your 28 August still exits at the 11:35 open and your 1 September still exits at the 17:50 open, nothing else moves — this one separates and is the B-170 trial. Why the machine picked 2405: it reads the indicator's selected-zone number, and 2405 is that selector's own number (it re-points bar to bar: 2405 becomes 2475 at 16:40, 2432, 2815 and the rest), never a zone-proof number — which is why you will not find it in any zone list. Its 1.32815-1.32832 range is the 06:45 candle's own range, promoted at 07:00; no row prints a formation candle for it. At 18:10 the direct check said not in play (0 hits) and the swing walk passed it off a touch 137 bars back at 06:45 — and the commit then overwrote the direct verdict with the walk's. Nothing was changed on the build; no run.

## Relay order (B-169 BLIND-GBP0706 4 of 6 + addendum, MEASURED paper grading)

- Part 0 on builder/B-168 at 72adf35 (backup ls-remote exact; no remote builder/B-169 before push; builder/B-169 cut here; rev-parse HEAD = 72adf35 before commit, branch builder/B-169). Push via backup, never origin.
- Skills loaded whole in order (srj-relay 97 lines, srj-strategy 253 lines + B4 section after banking; .agents stub never opened).
- Reads in order: pointer (24 lines); RESULT_B168 (138) + SLICE_B168 (65) (authorship stands, diff EMPTY); FULL.md (934, 15 blocks); SETUPS-B168F (16 lines); INDEX-B168F + W1/W2/W3 greps; INDEX_B165R + -B165R greps; REGISTER whole (89); spec v4.2 whole (396, path per HANDOFF §2); FINDING EXIT-BREAK-RETEST whole (28); RESULT_B125 (first line + MEASURED + 5m rows L37-41) + RESULT_B126 (first line + RESTORED + deferred-abort hunk EA:8750-8764) both FOUND; CONTEXT §4 whole. Ledger, AGENTS.md, .clinerules, journal: grep only. July journal never asked, never read.
- Names per 0.4 verified (EA 1617DC1A/ex5 187A7202; ind 7842A02E CRLF norm 338FEF95/ex5 10880847EE593CB7E4D99E2FAE38F7F9DDEB519C23B373145CF7BACFC6292B21; OB 8BBF936B; Bias 3B1D9D3D; HTF D5FD5B06; terminal.ini CF80083C; run ini 9C88E21D; Profiles 4 charts; B-162 segment j1078195-1556926). Register runs per INDEX_B165R (RECON62 + JUNE0525, Tester/logs/20261011.log). Lane BLIND-GBP0706 (first B-166; 4 of 6). Ledger 1315, tag B169-GBP-5M-ENTRYLINE-READ. Kit PK-2. New files: RESULT_B169 + SLICE_B169 only (no re-cut: every needed tag proved present or honestly NOT PRINTED below).
- Start gate: log-1 = 72adf35; status 782 lines; git diff --quiet 72adf35 EMPTY on all 0.5 paths (pointer, RESULT_B168, SLICE_B168, ROWPACK/, REPORT/, register, ledger, CONTEXT, HANDOFF, both skills, spec, journal, FINDING, 99_WORKFLOW/). Counts: ledger "^1314." = 1, B168 tag present, "^1315." = 0, "B169-" = 0; HANDOFF B-168: = 1, B-169: = 0; pointer 3-of-6 = 1; skill grading-words = 1; journal 1075 + row 323; CONTEXT B169- = 0 (B-168- = 1). SHAs per 0.4, LF-normalized classes as B-168. No terminal64. No STOP.
- Scope read-only MEASURED. No edit/compile/run/launch/gate/hunk/tolerance/buffer/number; no July-journal read or ask; 4 June/XOB-0604/KILL-0604/STOP-BASIS unreopened; his 5m never used to age a retest or kill a line. Legal results as listed.

## Part B - banking (verify-only; append nothing)

- Skill L116 5M-FLIP-KILL ("it must kill the trade if the 5m structure bias has flipped"; kills the POTENTIAL pre-confirmation; Q4 pre-confirmation-only); L139 5M-BIAS-AT-ENTRY (no entry against the 5m at the entry open; flip counts from breaking-candle close = next open); L185-187 RETEST-DIES-BY-BODY-CLOSE-ONLY (retest never aged/killed by 5m; dies by body close through its lines; 5m kills formed setups pre-confirmation only); L105 TOUCH-OR-BREAK; L112-116 CONFIRMATION-CANONICAL (+BAR-ROLE) through GATE-AUTHORIZATION; L36 ANCHOR-RANK (a) SAME-LINE-NO-EXIT (b) HIGHER-BREAK-EXITS; L250-253 B1-B3 verbatim. All FOUND, quoted raw in slice.
- CONTEXT §4 L43 "Retests and chart calls": retest dies by body close through its line before confirmation, never by 5m; never use his 5m to age a retest or kill a line. FOUND.
- Spec 5m/LTF lines with stages: L47 vocab (gates entry at Step 2; LTF ignored post-entry); L103-107 Step 2 (5m must agree; live never latched; re-checked every bar zone-wait through gate-check; flip kills candidate; post-entry ignored) — stages potential through confirmation/entry; L276-277 §5.6 (LTF post-entry ignored; HTF exits trend). When the 5m is read: ruled (Step 2 gate + his confirmation/entry words). No chart call — no carried note.

## Addendum Part B - B4 banked (grep-first; counts 0/0/0 before)

- B4, his words: "I am saying the 2 july trade should not be executed or valid in the first place. wdym by 2405, which exact candle time is that?" Landed: skill grading-words section as B4 + consequence line (2 July 18:10 long entry 1.33710 must-never; his verdict on a machine trade, not a journal read); journal row 324 (1076 lines); inside ledger 1315. Counts now 1/1/1.

## Part R1 - the 5m kills

- R1.1 sites (raw in slice): S2SEEDBIAS_KILL (EA:8781-8805, ST_S2_LTF_ALIGN seed stage, pre-confirmation; SEEDBIAS_REFUSED / S2WAIT retain / 15m-promotion exempt); post-S2 invariant (EA:7731-7790, S3_ZONE_WAIT..S5_GATE_CHECK, pre-confirmation through gate-check; LTF_MISALIGN); deferred UJDEFERAPPLY (EA:8840-8846, S-a site; B-61 C1 note: 5m checked at confirmation close per s11); B-18 entry check (EA:11172-11184, at entry shift 1 = confirmation candle, UJ5MENTRY_REFUSE → LTF_MISALIGN); helper CheckLtfAlign (EA:2622-2628, 1/-1 rounding); SIDE1T print (EA:8578-8586, S1 seed bar). So the machine already reads 5m at the confirmation/entry (B-18); S2/S3/S4/S5-early kills are what S1 would remove.
- R1.2 table (12 kills; anchor value UJBARMAP D/M/W or NOT PRINTED for Quarterly; retest bars from seeds/RETESTBOOK; ltf UJPROBE; walk (a)/(b)/(c); later CONFIRMPOLL):

| kill | anchor/value | retest | stage | ltf at kill | (a) first body-through | (b) first ltf trade-side | (c) | later confirm |
|---|---|---|---|---|---|---|---|---|
| 7/01 NY LONG 14:15 S3 | Q-VWAP NOT PRINTED | 14:05/14:20 seeds | S3 | -1.0 (day pl=1026) | UNKNOWN (no value) | 15:20 +1.0 (day pl=1435) | UNKNOWN | confirm=1 at 14:30 (bar 14:25, day pl=1131); 14:25 ltf=-1.0 (day pl=1114) |
| 7/08 SHORT 15:35 S5 | Q-POC NOT PRINTED | 14:55 | S5 | +1.0 (W2:6087) | UNKNOWN | 15:55 -1.0 (day pl=1492) | UNKNOWN | no SHORT poll later |
| 7/09 LONG 17:20 S4 | D-POC 1.33957 | 17:15 | S4 | -1.0 (day pl=1945) | 17:45 c=1.33907 | 18:10 +1.0 (day pl=2275) | LINE-DEATH-FIRST | confirm=1 at 17:25 (bar 17:20, day pl=1990); 17:20 ltf=-1.0 (day pl=1988) |
| 7/13 SHORT 18:00 S3 | W-POC 1.33793 | 17:50 | S3 | +1.0 (W3:2115) | 18:55 c=1.33799 | NONE to session end | UNKNOWN | SHORT polls confirm=0 (18:25/18:30/18:35) |
| 7/08 LDN LONG 10:05 S4 | W-VWAP 1.33633 | 09:20 | S4 | -1.0 (day pl=426) | 10:05 c=1.33584 (= kill bar) | 10:25 +1.0 (day pl=544) | LINE-DEATH-FIRST | LONG polls confirm=0 |
| 7/10 LDN LONG 09:40 S3 | D-POC 1.34284 | 09:00/09:30 | S3 | -1.0 (day pl=294) | 09:40 c=1.34268 (= kill bar) | 10:15 +1.0 (day pl=498) | LINE-DEATH-FIRST | SHORT polls only later |
| 7/10 NY LONG 14:30 S3 | D-POC 1.34267 | 14:15 | S3 | -1.0 (day pl=1352) | 14:30 c=1.34225 (= kill bar) | 15:55 +1.0 (day pl=1842) | LINE-DEATH-FIRST | SHORT polls only; 15:00 LONG poll confirm=1 (day pl=1531, post-death) |
| 7/13 LDN SHORT 09:20 S3 | W-POC 1.33790 | 09:00 | S3 | +1.0 (day pl=130) | 09:20 c=1.33854 (= kill bar) | 09:50 -1.0 (day pl=310) | LINE-DEATH-FIRST | LONG polls only later |
| 7/15 LDN LONG 10:30 S2 | D-POC 1.34038 | 10:25 | S2 SEEDBIAS | -1.0 (day pl=331) | 10:50 c=1.34033 | 10:30 +1.0 (day pl=359) | LTF-BEFORE-LINE-DEATH | LONG poll confirm=0 (10:45) |
| 7/16 SHORT 09:15 S4 | D-POC 1.35327 | 09:00 | S4 | +1.0 (day pl=102) | 09:15 c=1.35345 (= kill bar) | 10:05 -1.0 (day pl=488) | LINE-DEATH-FIRST | LONG polls only later |
| 7/16 LONG 10:10 S3 | D-POC 1.35327 | 10:15 | S3 | -1.0 (day pl=488) | 10:25 c=1.35325 | NONE to session end | UNKNOWN | LONG polls confirm=0/1 (10:20/10:25 post-death) |
| 7/17 LONG 10:30 S3 | D-POC 1.34638 | 10:20 | S3 | -1.0 (day pl=346) | 10:50 c=1.34636 | NONE to session end | UNKNOWN | LONG polls confirm=0 then confirm=1 at 10:50 (post-death) |

Day pack lines are GBP0629-B168F/<date>.csv. Walk rows walk_b169.txt (2303 UJBARMAP rows, B-162 segment); 7/07 lines lines707_b169.txt (16 rows).

- R1.3 register runs (pack line + register touch): 6/05 09:25-09:40 SEEDBIAS ×3 (W2:11206-11315, B1's morning — B1 NOT VALID, no touch of owed); 6/05 16:05 LTF Monthly-POC LONG S3 (W2:13022, touches B2's path); 6/08 SEEDBIAS 15:35 + LTF 16:05 (W3:1751/1952, no register row — ruled-out-by-him date); 6/09 LTF ×8 (W3:3366-5322, none); 6/09 18:55 LTF LONG S4 (W3:6314, none); 6/10 LTF 10:25/10:30 + SEEDBIAS 17:05 (W3:6989-9014; 10:25/10:30 touch C-06-10's date — C-06-10 kept refused confirm=0, his-invalid); 6/12 SEEDBIAS 11:00/15:05 + LTF 15:40/18:20/18:45 (W3:14307-16498, none); 8/26-8/28 LTF/SEEDBIAS (W1:273-7615; 8/28 16:00+ post-A1-entry/exit; 8/27 touches C-08-27's date — kept refused confirm=0, his-invalid); 8/31 LTF ×4 (W2:355-1388, none); 9/01 09:55 LONG S5 + 15:20-16:00 SHORTs (other session/opp dir — A2 untouched); 9/07 15:25 SHORT S4 (opp dir — A4/A5 untouched); 9/08 SEEDBIAS LONG 09:20/09:25 S2 + LTF LONG 09:40 S5 (opp dir — A6/A7 SHORT untouched); 9/04: 0. Full 172-line list in work file (tool output saved this turn).

## Part S1 - reading 5M-AT-CONFIRMATION (only the confirmation-candle 5m decides)

| row | pack lines | kept outcome | under reading | verdict |
|---|---|---|---|---|
| A1-A7 | INDEX_B165R A-lines; A-date kills above (post-entry/opp-dir/other-session) | TAKEN same candles | TAKEN same candles | DOES NOT SEPARATE |
| B2 6/5 | kill W2:13022; 5m L37 B-125 (+1.0 at 16:10, SAME as his); touch at 16:10 NOT PRINTED (B-126 proved absent) | missed (owed) | still refused — OTHER-GATE: no confirmation touch (B-126) | DOES NOT SEPARATE (must-hold fails) |
| B3 6/11 | 0 kills 6/11 | TAKEN 14:40 | TAKEN 14:40 | DOES NOT SEPARATE |
| B1 6/5 | kill W2:11168 (LTF at confirm eval) | refused | still out — OTHER-GATE: his 0605LDN-SHORT-NOT-VALID | OTHER-GATE |
| C-05-27 | kills 15:20/15:25 S2 | TAKEN 15:35 (warm-up) | TAKEN 15:35 (later seed; never graded) | DOES NOT SEPARATE |
| C-06-02 | kill confirm=0 touchAttr=0 (W2:4161) | refused | still out — OTHER-GATE: no confirmation | OTHER-GATE |
| C-06-03 | kills 17:15+ post-entry | TAKEN 09:10 (his valid-taken) | TAKEN 09:10 | DOES NOT SEPARATE |
| C-06-04 | kill PROMO_RETURN_NONE (W2:8399) | refused | still out — OTHER-GATE: promo gate | OTHER-GATE |
| C-06-10 | kill confirm=0 (W3:8590) + his-invalid | refused | still out — OTHER-GATE ×2 | OTHER-GATE |
| C-08-27 | kill confirm=0 (W1:4504) + his-invalid | refused | still out — OTHER-GATE ×2 | OTHER-GATE |
| C-09-01-1530 | kill W2:3810 AT the 15:25-confirm eval (S5) | refused | still refused (confirmation-candle 5m; kill IS the confirm read) | DOES NOT SEPARATE |
| C-09-04-1040 | kill confirm=0 (W2:10388) | refused | still out — OTHER-GATE | OTHER-GATE |
| C-08-28-1625 | kill TP_RR_FAIL (W1:7059) | refused | still out — OTHER-GATE | OTHER-GATE |
| C-09-08-1645 | kill TP_RR_FAIL (W3:5450) | refused | still out — OTHER-GATE | OTHER-GATE |
| 12 R1.2 kills | table above | refused | still refused all (confirmation-candle-against: 7/01, 7/09, 7/08-LDN, 7/15, 7/16-L, 7/17; line-death-first: 7/09, 7/10 ×2, 7/13-LDN, 7/16-S; no-confirmation: 7/13-NY, 7/08-S, 7/16-L, 7/17) | DOES NOT SEPARATE |

UNKNOWN rows: 0 (every row determined on rows; 7/08 SHORT read at its 15:30 confirmation eval). Overall S1: DOES NOT SEPARATE. Must-holds: A rows same-candle met; B3 met; B2 fails (OTHER-GATE no-touch); no C row newly fires.
Buildability S1: the confirmation-candle 5m is read at runtime at EA:11175 (`ReadFlow(FL_BUF_LTF_BIAS, al5ltf, 1) && CheckLtfAlign(1, g_dir, al5)`, shift 1 = confirmation candle at the entry pass; UJ5MENTRY_REFUSE print EA:11178; helper EA:2622-2628). The read exists; only its timing scope would change.

## Part R2 - 7 July Weekly-POC as an entry line

- R2.1 D-POC/W-POC per bar 14:15-15:30 (UJBARMAP j=1469427-1470223): 14:15 D 1.33899 / W 1.33910; 14:20 D 1.33900 / W 1.33910; 14:25-14:40 D 1.33890 / W 1.33910; 14:45-14:55 D 1.33890 / W 1.33910; 15:00 on D 1.33890 / W 1.33890 (coincide — as the 15:30 census prints both at 1.33890); 15:30 same. ltf flips ±1.0 across the window (rows quoted).
- R2.2 why 14:40 lists only D-POC: no merge/dedup/rank-out in the print — ShadowRetestBook (EA:2345-2374) replicates DetectPoiRetest's identical inequalities for ALL 12 lines; W-POC simply failed the 14:40 shortHit test (h=1.33892 < L+P and/or bodyHi= max(1.33886, 14:45-open 1.33863)=1.33886 above L−EPS against W=1.33910... rows beside the test text in slice). DetectPoiRetest itself (EA:2096+) returns ONLY r.topLine (lowest authority rank wins: bestLongRank/bestShortRank from INT_MAX down). Rank note: lower number = higher authority (P-EXITRANK-6: "lower number = higher authority"); 14:20 both hit → topLine W-POC (r8 < r10); 14:40 only D-POC hit → topLine D-POC.
- R2.3 WINDOW-ENTRY-LINE (trade-side retest between the potential's first counted retest and its confirmation candle, no body close through in between → entry line; break never exits): 7/07 window [14:20, 14:40] — first counted NY SHORT retest 14:20 (D-POC dS + W-POC dS, W2:3591 j=1469451); W-POC closes 14:20-14:40: 1.33888/85/78/86/65, all below 1.33910, SHORT needs close above → NO through-close → W-POC IS an entry line → 15:30 W-POC break would not exit → 7/07 CHANGES (holds; later exit NOT PRINTED on kept rows).

## Part S2 - WINDOW-ENTRY-LINE table

| row | entry lines under reading | kept exit | verdict |
|---|---|---|---|
| A1 8/28 SHORT, window [09:55, 10:00] | Daily-VWAP (B60C poi; D-POC trade-side retest NOT PRINTED on committed rows) | 11:30 D-POC break (his 11:35 open) | SAME (must-hold met) |
| A2 9/1 LONG, window [16:45, 17:30] | Monthly-VWAP (B60C poi; Y-POC trade-side retest NOT PRINTED) | 17:45 Y-POC break (his 17:50 open) | SAME (must-hold met) |
| A3/B2/B3/C-06-03/A4-A7/2/07 | anchors per B-168 S | DAY_CLOSE / TP_TOUCH ×6 / SL ×2 (non-break exits) | SAME (reading governs body-break exits only) |
| 7/07 SHORT, window [14:20, 14:40] | Daily-POC + Weekly-POC (dS 14:20, no through-close) | 15:30 W-POC break | DIFFERENT (exit moved; must-hold "except 7/07" met) |

"Every kept POI_BODY_BREAK exit on both register runs": A1, A2 (RECON62) — June has none (all June MTEXITs are TP_TOUCH). Overall S2: SEPARATES (7/07 changes; A1/A2 must-holds met; no other kept exit moves).
Evidence gap stated: RETESTBOOK/UJBARMAP per-bar rows are absent for the register-run segments in committed packs (A1/A2 windows graded on committed B60C/CONFIRMPOLL rows only); B-170 re-proves the windows on a diagnostic run before any kept trial.
Buildability S2: g_rkLines/g_rkSide keep ONLY the current bar (EA:2288-2289 decl; EA:2319-2325 per-bar store overwrite + g_rkRowTime; SrjRowkeyClear at reseed EA:8862) — no earlier-bar retention. A WINDOW reading needs a new held set: input NOT EA-readable today in held form (RETESTBOOK prints it, nothing holds it). Hunk site: P-EXITRANK-6 anchor-rank gate (EA:12593-12602, `authorityRank[k] < authorityRank[anchorLine]` → vBREAK) + B-136 own-body gate (EA:12603-12610); the entry-line exemption would sit with these gates. EXITCENSUS print EA:12580-12591; MTEXIT print EA:12676-12687; priority SL→TP→BREAK→HTF→DAY (EA:12407, 12660-12670).

## Part R4 - 2 July: XOB 2405 and its in-play pass (his B4)

- R4.1 first row naming 2405: `IDCHANGE bar=2026.07.02 08:30 inWin=0 state=IDLE dir=NONE xobId=2405->2396 ...` (j=1445393; two patterns xobId=2405/origin=2405 scanned j1078195-1556926, 52 hits: IDCHANGE re-points + S3PICK/S4RQZ reads, rows2405_b169.txt). origin=2405: 0 hits anywhere — 2405 is the indicator selector's own running id (re-pointed bar to bar: 2405→2396 08:30, →2432 10:45, →2475 16:40 with xobLo=1.33562 xobHi=1.33684, →2815, →2646, →3029 ...), never a zone-proof id. Candle whose range equals 1.32815-1.32832: FOUND — `UJBARMAP bar=2026.07.02 06:45 o=1.32830 h=1.32832 l=1.32815 c=1.32823 ...` (j=1445011, B-162 segment; B-167 segment prints it identically j=1923736). Formation print for 2405: NOT PRINTED (no row names a formation candle; promotion 07:00 only: XOBPROMO raw=1782975600.0 = 07:00).
- R4.2 S3PICK (EA:8882-8925): the EA reads the indicator's selected id (`ReadFlow(FL_BUF_XOB_OBJ_ID, t105b_xobId, barShift)` EA:8888 → ZONEID EA:8895 + XOBPROMO EA:8909 prints; range from FL_BUF_XOB_ZONE_* EA:8918-8921). No EA-side selection among zones exists in the text — the pick is indicator-internal (spec §9.7 selector class). 2405 won because the selector buffer held it at 18:10; it is never a B152PR z1 row because z1 rows are the live-set proof namespace and 2405 lives only in the selector/ZONEID namespace (z1=2405 hits 0/0/0 all packs; ZONEID 18:10 xobId=2405 j=1447675).
- R4.3 INPLAYCOMMIT SWING vs XOBINPLAY 0: direct check s31 (EA:9006-9074: BAR overlap / SWING1 nearest / SWINGLEG walk to s1_stopRef; prints XOBINPLAY EA:9160 — 2 July row hits=0). Commit walk t133 (EA:9307-9396): scans barShift backward; `if(t133_bounded) t133_bound = promoT` but the promoT break runs ONLY `if(!s3_haveStop ...)` (EA:9362-9364) — with a stop present the promotion does NOT bound; terminator is the SL leg (`(LONG ? swing <= slRef : ...)` EA:9393, "THE SL LEG IS THE BOUND"). 2 July: scanned=137 swings=25 firstShift=137 firstVal=1.32815 (06:45) — 137 bars back to the stop leg, past the 07:00 promotion. Then EA:9399 `s31_inPlay = t133_inPlay;` overwrites the direct verdict with the walk's. Spec beside: 3.5 in-play = penetration "at any point within the current structural leg" (spec L131); 3.5.1 relevance→retracement→confirmation (L143-151); skill L230-233 (B-146: kill level = invalidation level, not always the middle). Stated without deciding.
- R4.4 census (commitVia from SETUPS-B165R; XOBINPLAY hits NOT PRINTED — tag absent from committed register packs, no re-cut spent): SWING — A6 (3293), A7 (3293), B3 (3913), C-05-27 (2094); BAR — A2 (2549), A3 (2793), A4 (3130), A5 (3178), C-06-03 (2930); none — A1 (2149), B2 (3308).

## Part S additions - 2/07 must-never + S3 NO-SWING-ONLY-INPLAY

- S1/S2 gain row "2/07 LONG 18:10 (his B4): must-never" (kept EXECUTED; pool rows W1:6916-6975).
- S3 reading: a zone the direct check finds not in play is never passed by the swing path alone. Rows: 2/07 → refused (CHANGES to his must-never). A1/A2/A3/A4/A5/B2/C-06-03 (BAR/none paths) → same candle. A6/A7/B3/C-05-27 (SWING paths, direct verdict NOT PRINTED) → UNKNOWN. Must-holds fail on the 4 UNKNOWNs → S3 DOES NOT SEPARATE as paper; the 4 UNKNOWNs are the case for an always-restored diagnostic, never a kept trial. Buildability S3: s31_inPlay (EA:9006) holds the XOBINPLAY direct verdict at the commit site (printed EA:9160 before the EA:9399 overwrite); the gate would read it there.

## Part R3 - decision for B-170 (filed, no edit)

- S1 5M-AT-CONFIRMATION: DOES NOT SEPARATE (B2 must-hold fails — OTHER-GATE no confirmation touch, B-126; all rows determined, 0 UNKNOWN). Parked; no trial.
- S2 WINDOW-ENTRY-LINE: SEPARATES (7/07 exit moves; A1 11:35 + A2 17:50 must-holds met; no other kept exit moves). Hunk site: exit anchor-rank gate EA:12593-12602 (+ own-body EA:12603-12610); needs a held multi-bar entry-line set — input NOT EA-readable today (g_rkLines current-bar only). No predicted ruled-out fire (exit-only change; no new entries) → B-170 kept trial eligible after diagnostic re-proof of the A1/A2 windows.
- S3 NO-SWING-ONLY-INPLAY: DOES NOT SEPARATE as paper (4 UNKNOWN: A6/A7/B3/C-05-27 direct verdicts NOT PRINTED) → always-restored diagnostic first (never kept trial); the diagnostic also settles his B4 must-never on rows.
- B-170: trial S2 on the kept build (whole RECON62 + June + GBPUSD battery: A1/A2 exits + 7/07 hold + deals identical elsewhere); S1 parked; S3 diagnostic only.

## Part X - records (grep-first, 0 before, 1 after each)

- X1 CONTEXT §4 (relay text verbatim). X1b CONTEXT §4 (addendum text verbatim).
- X2 HANDOFF §3 (relay text verbatim).
- X3 ledger 1315, tag B169-GBP-5M-ENTRYLINE-READ (B4 verbatim + consequence; R1 sites; S1/S2/S3 tables + verdicts; R4 2405 namespace + 06:45 candle + EA:8888/9399 lines; R3 decision; SHAs).
- X4 pointer rewritten (24 lines): latest B-168→B-169 MEASURED; Lane BLIND-GBP0706 (first B-166, 4 of 6); terminal closed; S1 DOES NOT SEPARATE / S2 SEPARATES / S3 diagnostic; Next = B-170 S2 trial (or park at 6 if none separates — S2 does); O3 pending; goal open. Next adds: 2 July GBPUSD long must-never (his B4).

## Part F - file, push, reply

- F1 this result. F2 slice (raw rows; under 600 lines). F3 ledger 1315. F4 pointer.
- F5 stages result, slice, ledger, pointer, CONTEXT, HANDOFF, strategy skill, journal CSV (srj-relay untouched — no relay-skill edit this turn). Never EA, includes, indicators, ex5, journals(?), logs, inis or backups. (Journal CSV IS staged — it is the operator trade journal with row 324, explicitly a banking target; "journals" in F5 means tester journals/logs.)
- F6 commit (rev-parse HEAD before commit), push via backup, ls-remote must return the commit.
- Reply line: B-169 is done, GitHub branch builder/B-169, commit <hash>, verdict MEASURED.

## Final disk state (MEASURED paper turn; B-162 kept build on disk, verified, terminal closed)

- EA 1617DC1ACCE6B50ED2D1359582A70A8B8503C569623EE90C18C6B33542796207 + ex5 187A7202 (pair matches); indicator 7842A02E + ex5 10880847 (pair matches); OB 8BBF936B; Bias 3B1D9D3D; HTF D5FD5B06; terminal.ini CF80083C; run ini 9C88E21D; Profiles 4 charts; no terminal64. Skill +B4 section (257 lines); journal +row 324 (1076 lines); CONTEXT +2 (X1+X1b); HANDOFF +1; ledger +1 (1315); pointer rewritten; result + slice new; helper scripts (walk/linemap/r12/winA1A2/rows2405/lines707) + work txts unstaged. No source/ex5 committed.

(No carried note — Part B found rulings on when the 5m is read: spec Step 2 + his confirmation/entry words.)
