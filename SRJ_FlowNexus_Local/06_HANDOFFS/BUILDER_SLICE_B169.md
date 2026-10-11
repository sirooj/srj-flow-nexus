# BUILDER SLICE B-169 - raw rows behind every table (MEASURED paper; no edit/run)

Base: builder/B-168 head 72adf35 on builder/B-169. Gate per result (diff --quiet EMPTY; counts; SHAs; no terminal64). B-162 segment j1078195-1556926.

## Part B (verify-only; append nothing)

- Skill L116 5M-FLIP-KILL: `... verbatim: "it must kill the trade if the 5m structure bias has flipped"). Amended point: any 5m-structure-bias flip kills the POTENTIAL (seed) pre-confirmation ... his Q4: kills are pre-confirmation only, after entry he still holds ...`
- Skill L139 5M-BIAS-AT-ENTRY: `... the 1 Sep 09:55 London LONG is invalid - the 5m structure bias was still bearish. Amended point: no entry against the 5m structure bias at the entry open; a 5m flip counts only from the close of the breaking candle, which is the next candle open ...`
- Skill L185-187: 0602-NY-NO-SETUP + 0610-NY-INVALID (15:45 body close 160.394→160.351 through D-POC 160.354) + RETEST-DIES-BY-BODY-CLOSE-ONLY (`a POI line retest is never aged, made stale or invalidated by a 5m bias flip; it dies by a candle body close through its POI line(s) before the confirmation entry`).
- Skill L105 TOUCH-OR-BREAK + L112 CONFIRMATION-CANONICAL (`A confirmation is EITHER (a) a valid retest TOUCH ... OR (b) a BREAK with a candle BODY CLOSE ... retest-bar poll is NEVER cited as a confirmation read (BAR-ROLE)`) + L116 above; L36 ANCHOR-RANK (`(a) SAME-LINE-NO-EXIT ... (b) HIGHER-BREAK-EXITS ...`); L250-253 B1/B2/B3 verbatim.
- CONTEXT L43: `Retests and chart calls (his standing instruction 2026-10-07, banked B-65): a POI line retest dies by a candle body close through its line before confirmation, never by a 5m bias flip; never use his 5m read to age a retest or kill a line.`
- Spec: L47 (bias table: Step 2 gate; LTF ignored post-entry); L103-107 (Step 2: agree; live never latched; re-checked zone-wait→gate-check; flip kills; post-entry ignored); L276-277 (§5.6: LTF ignored, HTF exits trend). → 5m timing ruled; no chart call.
- B4 counts 0/0/0 → skill B4 + journal 324 (1076) + ledger 1315 now 1/1/1.

## R1.1 EA sites (raw)

- `EA:424 #define ABORT_SEEDBIAS_REFUSED "SEEDBIAS_REFUSED"`; `EA:399 #define ABORT_LTF_MISALIGN "LTF_MISALIGN"`; `EA:2622-2628 bool CheckLtfAlign(...) { ... alignedOut = ((int)MathRound(ltfBias) == ((dir == DIR_LONG) ? 1 : -1)); ... }`
- S2SEEDBIAS_KILL EA:8781-8805 (`if(g_state == ST_S2_LTF_ALIGN) ... S2SEEDBIAS_KILL ... GoAbort(ABORT_SEEDBIAS_REFUSED...)` / S2WAIT retain / 15m-promotion exempt) — S2, pre-confirmation.
- Post-S2 invariant EA:7731-7790 (`every LTF_MISALIGN abort is a post-S2 invariant failure`; `if(g_state >= ST_S3_ZONE_WAIT && g_state <= ST_S5_GATE_CHECK)` + `CheckLtfAlign` EA:7760) — S3/S4/S5, pre-confirmation through gate-check.
- UJDEFERAPPLY EA:8840-8846 (`GoAbort(ABORT_LTF_MISALIGN, g_state)` + B-61 C1 `5m read is checked at confirmation close per s11, never here`) — deferred S-a site.
- B-18 entry EA:11172-11184 (`ReadFlow(FL_BUF_LTF_BIAS, al5ltf, 1) && CheckLtfAlign(1, g_dir, al5)` ... `UJ5MENTRY_REFUSE ... GoAbort(ABORT_LTF_MISALIGN...)`) — at entry, shift 1 = confirmation candle.
- SIDE1T print EA:8578-8586 (`SIDE1T_SEEDBIAS bar=... biasAligned=... verdict=CONSIDER/REJECT-BIAS-TIMING`) — S1 seed bar.

## R1.2 kills (pack line + UJPROBE ltf + walk; day pls = GBP0629-B168F/<date>.csv)

- 7/01 NY LONG Q-VWAP 14:15 S3 (day pl=1046/1047; UJPROBE 14:10 ltf=-1.0 day pl=1026; value NOT PRINTED; later confirm=1 14:30 bar 14:25 day pl=1131 with ltf=-1.0 day pl=1114; ltf-turn 15:20 day pl=1435)
- 7/08 SHORT Q-POC 15:35 S5 (W2:6129; UJPROBE 15:30 ltf=+1.0 W2:6087 j=1478563; value NOT PRINTED; ltf-turn 15:55 day pl=1492; no SHORT poll later)
- 7/09 LONG D-POC=1.33957 17:20 S4 (day pl=1965/1966; ltf=-1.0 day pl=1945; death 17:45 c=1.33907; turn 18:10 day pl=2275; confirm=1 17:25 bar 17:20 day pl=1990 with ltf=-1.0 day pl=1988)
- 7/13 SHORT W-POC=1.33793 18:00 S3 (W3:2097; UJPROBE 18:00 ltf=+1.0 W3:2115 j=1509683; death 18:55 c=1.33799; no turn; SHORT polls confirm=0)
- 7/08 LDN LONG W-VWAP=1.33633 10:05 S4 (day pl=446/447; ltf=-1.0 day pl=426; death 10:05 = kill bar; turn 10:25 day pl=544)
- 7/10 LDN LONG D-POC=1.34284 09:40 S3 (day pl=316/317; ltf=-1.0 day pl=294; death 09:40 = kill bar; turn 10:15 day pl=498)
- 7/10 NY LONG D-POC=1.34267 14:30 S3 (day pl=1372/1373; ltf=-1.0 day pl=1352; death 14:30 = kill bar; turn 15:55 day pl=1842)
- 7/13 LDN SHORT W-POC=1.33790 09:20 S3 (day pl=150/151; ltf=+1.0 day pl=130; death 09:20 = kill bar; turn 09:50 day pl=310)
- 7/15 LDN LONG D-POC=1.34038 10:30 S2 SEEDBIAS (day pl=340/341; ltf=-1.0 day pl=331; turn 10:30 day pl=359 BEFORE death 10:50 c=1.34033)
- 7/16 SHORT D-POC=1.35327 09:15 S4 (day pl=122/123; ltf=+1.0 day pl=102; death 09:15 = kill bar; turn 10:05 day pl=488)
- 7/16 LONG D-POC=1.35327 10:10 S3 (day pl=508/509; ltf=-1.0 day pl=488; death 10:25 c=1.35325; no turn; polls confirm=0/1 post-death)
- 7/17 LONG D-POC=1.34638 10:30 S3 (day pl=368/369; ltf=-1.0 day pl=346; death 10:50 c=1.34636; no turn; polls confirm=0 then confirm=1 10:50 post-death)

## R1.3 register kills (pack line; touch)

- 6/05 SEEDBIAS 09:25/09:30/09:40 (W2:11206-11315, B1 morning, B1 NOT VALID); 6/05 LTF 16:05 Monthly-POC LONG S3 (W2:13022, touches B2); 6/08 SEEDBIAS 15:35 + LTF 16:05 (W3:1751/1952, none); 6/09 LTF ×8 + 18:55 LONG (W3:3366-6315, none); 6/10 LTF 10:25/10:30 + SEEDBIAS 17:05 (W3:6989-9014, C-06-10 date, kept confirm=0); 6/12 SEEDBIAS/LTF (W3:14307-16498, none); 8/26-8/28 LTF/SEEDBIAS (W1:273-7615; 8/28 16:00+ post-A1; 8/27 C-08-27 date kept confirm=0); 8/31 LTF ×4 (W2:355-1388, none); 9/01 09:55 LONG S5 + 15:20-16:00 SHORTs (opp-dir/other-session, A2 untouched); 9/07 15:25 SHORT S4 (opp dir); 9/08 SEEDBIAS LONG 09:20/09:25 S2 + LTF LONG 09:40 S5 (opp dir, A6/A7 SHORT untouched); 9/04: 0.

## S1 (5M-AT-CONFIRMATION; UNKNOWN = 0; overall DOES NOT SEPARATE, B2 must-hold fails)

- A1-A7 same candles (no touching pre-conf 5m kills) / B3 same (0 kills 6/11) / C-06-03 same 09:10 (kills post-entry) / C-05-27 same 15:35 (warm-up) → DOES NOT SEPARATE rows.
- B2 → still refused, OTHER-GATE no confirmation touch (B-125 L37 +1.0 at 16:10 SAME as his; B-126 no touch). B1/C-rows → OTHER-GATEs (his-invalid / confirm=0 / TP_RR_FAIL / PROMO / at-confirm-5m for C-09-01-1530 kill W2:3810 at the 15:25-confirm eval).
- 12 R1.2 kills → still refused all. Buildability: EA:11175 (+EA:11178 print, EA:2622-2628 helper).

## R2.1 7/07 lines (UJBARMAP j=1469427-1470223)

- 14:15 D 1.33899/W 1.33910; 14:20 D 1.33900/W 1.33910; 14:25-14:55 D 1.33890/W 1.33910; 15:00-15:30 D 1.33890/W 1.33890 (coincide from 15:00; 15:30 census prints both 1.33890).

## R2.2 code (raw)

- ShadowRetestBook EA:2342-2374 (replicates DetectPoiRetest inequalities for ALL 12 lines; print has no merge/dedup/rank-out). 14:40 shortHit test text EA:2314-2317 (`h >= L + P - EPS && bodyHi <= L + EPS`; bodyHi = max(o, next-open)).
- DetectPoiRetest EA:2096-2160 (bestLongRank/bestShortRank from INT_MAX down; returns only r.topLine; SIDE1D_BOTHDIRS print bl/br/sl/sr). Rank rule: lower = higher authority (P-EXITRANK-6 EA:~12594).

## R2.3/S2 (WINDOW-ENTRY-LINE; overall SEPARATES)

- 7/07 window [14:20, 14:40]: `RETESTBOOK bar=2026.07.07 14:20 hits=2 Daily-POC:r10:dS Weekly-POC:r8:dS` (W2:3591 j=1469451); W-POC closes 14:20-14:40 = 1.33888/85/78/86/65, all < 1.33910, SHORT needs close above → no through-close → W-POC entry line → 15:30 break would not exit → DIFFERENT.
- A1 window [09:55, 10:00]: only D-VWAP on committed rows (B60C poi; D-POC dS NOT PRINTED) → SAME (11:35 holds). A2 window [16:45, 17:30]: only M-VWAP (Y-POC dL NOT PRINTED) → SAME (17:50 holds). Non-break kept exits → SAME. Per-bar census gap for register segments stated (no RETESTBOOK/UJBARMAP rows in log for 8/28 09:5x-10:00 / 9/1 16:4x-17:3x: winA1A2 scan 0 hits).
- Hunk site EA:12593-12602 (anchor-rank gate) + EA:12603-12610 (own-body); EXITCENSUS EA:12580-12591; MTEXIT EA:12676-12687; priority EA:12407/12660-12670. Held multi-bar set NOT readable (g_rkLines current-bar only EA:2288-2289/2319-2325, cleared EA:8862).

## R4.1 2405 rows (two patterns, j1078195-1556926, 52 hits, rows2405_b169.txt)

- First: `IDCHANGE bar=2026.07.02 08:30 inWin=0 state=IDLE dir=NONE xobId=2405->2396 ...` (j=1445393). origin=2405: 0 hits. Re-points: 2405→2432 10:45, →2475 16:40 (xobLo=1.33562 xobHi=1.33684), →2815, →2646, →3029 ... S3PICK reads: 7/02 18:10 (j=1447675/1447676), 7/06 17:15/18:25, 7/08 14:55/15:00/15:05 (+S4RQZ).
- 06:45 candle: `UJBARMAP bar=2026.07.02 06:45 o=1.32830 h=1.32832 l=1.32815 c=1.32823 ...` (j=1445011; range == 2405's 1.32815-1.32832). Formation print: NOT PRINTED.

## R4.2/R4.3 code (raw)

- S3PICK EA:8882-8925 (`ReadFlow(FL_BUF_XOB_OBJ_ID, t105b_xobId...)` EA:8888 → ZONEID EA:8895, XOBPROMO EA:8909, range EA:8918-8921). No EA-side zone selection in text (indicator-internal; spec §9.7 class). z1=2405: 0/0/0 (namespaces differ: selector slot vs live-set proof).
- Direct s31 EA:9006-9074 (BAR EA:9016 / SWING1 / SWINGLEG-to-stop EA:9049-9073; STEP-1 SL-LEG comment). Commit t133 EA:9307-9396 (promoT bound only `if(!s3_haveStop...)` EA:9362-9364; SL-leg terminator EA:9393); EA:9399 `s31_inPlay = t133_inPlay;` (overwrite); XOBINPLAY print EA:9160; INPLAYCOMMIT print EA:9403-9405.
- Spec L131 (3.5 leg penetration), L143-151 (3.5.1 order), skill L230-233 (B-146). Stated, undecided.

## R4.4 commitVia (SETUPS-B165R): SWING A6/A7/B3/C-05-27; BAR A2/A3/A4/A5/C-06-03; none A1/B2. XOBINPLAY hits: NOT PRINTED (tag absent, no re-cut).

## S3 (NO-SWING-ONLY-INPLAY; paper DOES NOT SEPARATE, 4 UNKNOWN → diagnostic)

- 2/07 → refused (his B4 must-never). A1/A2/A3/A4/A5/B2/C-06-03 same. A6/A7/B3/C-05-27 UNKNOWN (SWING path, direct NOT PRINTED). Buildability: s31_inPlay EA:9006 (printed EA:9160 pre-overwrite).

## R3 decision

- S1 DOES NOT SEPARATE (parked). S2 SEPARATES → B-170 kept trial (A1/A2 + 7/07 + deals battery; A1/A2 windows re-proved diagnostically first). S3 diagnostic-only (UNKNOWNs; settles B4 on rows). No predicted ruled-out fire in S2 (exit-only).

(End of slice)
