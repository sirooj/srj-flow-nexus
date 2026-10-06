# BUILDER SLICE B-49 - raw rows behind P1, P2 and P3 (payloads only; read-only, no run)

## 0.4 gate SHAs (raw disk / LF-normalized; B-48 lesson applied)
- pointer 5ED09E74 / 5ed09e74 MATCH (1745 B, LF-only).
- RESULT_B48 FF3A1514 / ff3a1514 MATCH (9878 B, LF-only).
- SLICE_B48 CD4B6CC4 / cd4b6cc4 MATCH (21827 B, LF-only).
- register C1E4AEDE / c1e4aede MATCH (7329 B).
- strategy skill 7762E905 / 7762e905 MATCH (60699 B).
- PROMPTQL_PLANNER_CONTEXT AADEEC80 / aadeec80 MATCH (7952 B).
- EA 63B18C1F raw MATCH (680981 B, LF-only); EA.ex5 B0D4AA9E raw MATCH (456738 B).
- FlowLogic 956BF3E3 raw MATCH (70308 B, 1467 CRLF); FlowLogic.ex5 27B5F272 raw MATCH (236500 B).
- BiasEngine 3B1D9D3D raw MATCH; OrderblockMgr 5D14FCE2 raw MATCH; Draw FD2B3716 raw MATCH; HTFEngine D5FD5B06 raw MATCH.
- TickAudit 7AD6ABEF / 7C8946D8 raw MATCH.
- ledger raw 5d7c1337 (1126756 B, 12 CRLF) / normalized b0479bca (1126744 B) = NEW BASELINE (B-48 item 1190 appended with CRLF).
- journal raw 15e568d4 (148956 B) / normalized 261ebd8f (147897 B, 1060 lines) = UNCHANGED from B-48.
- git diff/status empty for ledger + journal (disk == HEAD 10bf321).
- terminal.ini 450ACB4A raw MATCH (20447 B, report-only, restored + verified post-B48).
- relay skill: GitHub C05AA4AB; disk raw bb467c55 (10180 B, LF-only, 0 CRLF) vs relay-accounted 90AD274E. Diff vs HEAD = 2 insertions (pasted below): (1) YOLO-mode line = the accounted standing-order line; (2) line-ending-gate line = operator-ordered B-48 corrective ("Builder's standing skill now carries the line-ending gate (B-48 lesson, defect owned)"). Recorded as authorized, proceeding read-only; planner to update gate table.

## Relay-skill diff raw (git diff -- .opencode/skills/srj-relay/SKILL.md; only hunks)
```
@@ -23,6 +23,7 @@ Authority
 Start gate (every relay)
 - Run git log -1 and report the git status --short line count.
 - Take the SHA-256 of every file the relay names and compare it to the relay's expected prefix. On a mismatch, STOP and report.
+- Line-ending gate (B-48 lesson, defect owned 2026-10-06): this workstation writes CRLF and git stores LF, so a disk SHA and a GitHub-blob SHA of the same content never match on text files (journal: 1059 CRLF bytes; ledger: 11 CRLF bytes on appended lines). Before declaring a gate mismatch, LF-normalize the disk bytes (strip every CR) and re-hash: if the normalized SHA equals the expected blob SHA, the content is identical - record it as accounted and go on. A mismatch that survives normalization, or any non-empty `git diff <commit> -- <file>`, is a real STOP. Result files must carry both SHAs (disk + normalized) so the next session never stops on this class again.
 - Before any source edit, write a backup <file>.preB<n> and give its SHA-256.
@@ -41,6 +42,7 @@ Trial discipline
 - Content copies before any terminal launch (B-42 lesson, defect owned 2026-10-06): the terminal re-saves chart files and config\terminal.ini on exit, so before any launch copy the CONTENT of every file in that scope to .preB<n> copies; fingerprints alone cannot restore. After the run, restore from the copies and verify the SHAs.
 - Leftover terminal (B-43 lesson, defect owned 2026-10-06): run inis carry no ShutdownTerminal, so a finished tester run can leave terminal64 open and the next launch is refused as busy; before every launch confirm no terminal64 is running, and stop any leftover by its PID.
+- YOLO mode (his standing order 2026-10-06): git commands run automated and every folder this lane touches is pre-allowed - opencode.json sets permission bash/edit/external_directory to allow, so the builder never stops for an approval prompt on commands, edits, or outside-workspace folders. If a prompt still appears, report its exact text instead of working around it.
```

## P1.1 flip code=8 rows 12:05-16:10, j32 (Tester/logs/20261006.log UTF-16; JUNE-B44-S5 PRE 986649)
1037220 MD 0 16:46:35.849 Core 04 2026.06.05 12:05:00   [SRJ][T155][OBPROV] code=8 id=0 bar=106476 flag=true
1037236 HR 0 16:46:35.849 Core 04 2026.06.05 12:15:00   [SRJ][T155][OBPROV] code=8 id=0 bar=106478 flag=true
1037282 GK 0 16:46:35.849 Core 04 2026.06.05 12:50:15   [SRJ][T155][OBPROV] code=8 id=0 bar=106485 flag=true
1037356 GL 0 16:46:35.849 Core 04 2026.06.05 14:00:00   [SRJ][T155][OBPROV] code=8 id=0 bar=106499 flag=true
1037553 PM 0 16:46:35.849 Core 04 2026.06.05 15:35:00   [SRJ][T155][OBPROV] code=8 id=0 bar=106518 flag=true
1037620 IE 0 16:46:35.849 Core 04 2026.06.05 16:05:00   [SRJ][T155][OBPROV] code=8 id=0 bar=106524 flag=true
1037658 FH 0 16:46:35.849 Core 04 2026.06.05 16:10:00   [SRJ][T155][OBPROV] code=8 id=0 bar=106525 flag=true
(Same bars on every full run in the file: 06:17 lines 184499-184792, 08:36 lines 330064-330357, 10:22 lines 490295-490598, 15:26 lines 795537-795830, 15:32 lines 802751-803054, 15:35 lines 816124-816428. Deterministic.)

## P1.1 EVT kind rows (same run; kind = strongFlip/weakFlip, bias = new bias)
1037221 QM 0 16:46:35.849 Core 04 2026.06.05 12:05:00   SRJ EVT t=2026.06.05 12:00 bar=106476 kind=weakFlip bias=bullish resetOn=true
1037237 KO 0 16:46:35.849 Core 04 2026.06.05 12:15:00   SRJ EVT t=2026.06.05 12:10 bar=106478 kind=strongFlip bias=bearish resetOn=true
1037283 EH 0 16:46:35.849 Core 04 2026.06.05 12:50:15   SRJ EVT t=2026.06.05 12:45 bar=106485 kind=strongFlip bias=bullish resetOn=true
1037357 DE 0 16:46:35.849 Core 04 2026.06.05 14:00:00   SRJ EVT t=2026.06.05 13:55 bar=106499 kind=strongFlip bias=bearish resetOn=true
1037554 IG 0 16:46:35.849 Core 04 2026.06.05 15:35:00   SRJ EVT t=2026.06.05 15:30 bar=106518 kind=strongFlip bias=bullish resetOn=true
1037621 IN 0 16:46:35.849 Core 04 2026.06.05 16:05:00   SRJ EVT t=2026.06.05 16:00 bar=106524 kind=strongFlip bias=bearish resetOn=true
1037659 HI 0 16:46:35.849 Core 04 2026.06.05 16:10:00   SRJ EVT t=2026.06.05 16:05 bar=106525 kind=strongFlip bias=bullish resetOn=true
(Also in run: 15:50 doRenewal bullish t=15:45 bar=106521 line 1037586; 14:40 doRenewal bearish t=14:35 line 1037438; 08:15 strongFlip bearish t=08:10 bar=106430 line 1036112; 09:00 weakFlip bullish t=08:55 bar=106439 line 1036347; 09:55 strongFlip bearish t=09:50 bar=106450 line 1036932; 11:00 strongFlip bullish t=10:55 bar=106463 line 1037094; 11:25 strongFlip bearish t=11:20 bar=106468 line 1037147.)

## P1.1 UJPROBE ltf strip, j32 (bar_key + ltf; full strip 09:55-19:55 verified; adjacent pairs per flip pasted)
11:55 -1.0 (1037213); 12:00 +1.0 (1037224); 12:05 +1.0 (1037229); 12:10 -1.0 (1037241); 12:15 -1.0 (1037252); 12:40 -1.0 (1037286); 12:45 +1.0 (1037286/1037291: 12:45 +1.0 line 1037291); 12:50 +1.0 (1037291/1037297); 13:50 +1.0 (1037352); 13:55 -1.0 (1037363: 13:55 -1.0 line 1037363); 15:25 -1.0 (1037535); 15:30 +1.0 (1037557); 15:55 +1.0 (1037609); 16:00 -1.0 (1037625); 16:05 +1.0 (1037663); 16:10 +1.0 (1037674); 16:15 +1.0 (1037683); 16:20 +1.0 (1037690).
Raw 16:00-16:10 UJPROBE rows:
1037625 ED 0 16:46:35.849 Core 04 2026.06.05 16:05:00   [SRJ-EA] UJPROBE bar_key=2026.06.05 16:00 h4=1.0 h1=1.0 m15=1.0 confirmedFeed=1 ltf=-1.0 div=OPPOSING kind=regular readFail=0 empty=106191 zero=0 complete=1 latestNZ=-1 covReq=2026.04.29 covAch=2026.04.29 dayCount=28 ticktime=2026.06.05 16:05:00 lag=chartTime-1bar
1037663 JO 0 16:46:35.849 Core 04 2026.06.05 16:10:00   [SRJ-EA] UJPROBE bar_key=2026.06.05 16:05 h4=1.0 h1=1.0 m15=1.0 confirmedFeed=1 ltf=1.0 div=OPPOSING kind=regular readFail=0 empty=106191 zero=0 complete=1 latestNZ=1 covReq=2026.04.29 covAch=2026.04.29 dayCount=28 ticktime=2026.06.05 16:10:00 lag=chartTime-1bar
1037674 IM 0 16:46:35.849 Core 04 2026.06.05 16:10:00   [SRJ-EA] UJPROBE bar_key=2026.06.05 16:10 h4=1.0 h1=1.0 m15=1.0 confirmedFeed=1 ltf=1.0 div=OPPOSING kind=regular readFail=0 empty=106192 zero=0 complete=1 latestNZ=1 covReq=2026.04.29 covAch=2026.04.29 dayCount=28 ticktime=2026.06.05 16:15:00 lag=chartTime-1bar

## P1.2 code=3 (in-bias OB invalidation) ids per flip bar, j32
1037219 ID 0 16:46:35.849 Core 04 2026.06.05 12:05:00   [SRJ][T155][OBPROV] code=3 id=1742 bar=106476 flag=false (one; weakFlip)
1037233 DG 0 16:46:35.849 Core 04 2026.06.05 12:15:00   [SRJ][T155][OBPROV] code=3 id=1753 bar=106478 flag=false
1037234 OE 0 16:46:35.849 Core 04 2026.06.05 12:15:00   [SRJ][T155][OBPROV] code=3 id=1752 bar=106478 flag=false
1037235 FJ 0 16:46:35.849 Core 04 2026.06.05 12:15:00   [SRJ][T155][OBPROV] code=3 id=1748 bar=106478 flag=false (three; strongFlip)
1037281 NQ 0 16:46:35.849 Core 04 2026.06.05 12:50:15   [SRJ][T155][OBPROV] code=3 id=1749 bar=106485 flag=false (one on bar + accumulated in-bias count; strongFlip)
1037354 GN 0 16:46:35.849 Core 04 2026.06.05 14:00:00   [SRJ][T155][OBPROV] code=3 id=1768 bar=106499 flag=false
1037355 IL 0 16:46:35.849 Core 04 2026.06.05 14:00:00   [SRJ][T155][OBPROV] code=3 id=1766 bar=106499 flag=false (two; strongFlip)
1037541-1037552 (15:35:00, bar=106518): code=3 ids 1774, 1772, 1769, 1761, 1759, 1740, 1733, 1725, 1723, 1701, 1699, 1697 (twelve; strongFlip)
1037618 QE 0 16:46:35.849 Core 04 2026.06.05 16:05:00   [SRJ][T155][OBPROV] code=3 id=1515 bar=106524 flag=false
1037619 DK 0 16:46:35.849 Core 04 2026.06.05 16:05:00   [SRJ][T155][OBPROV] code=3 id=1507 bar=106524 flag=false (two; strongFlip bearish)
1037652 DH 0 16:46:35.849 Core 04 2026.06.05 16:10:00   [SRJ][T155][OBPROV] code=3 id=1784 bar=106525 flag=false
1037653 KN 0 16:46:35.849 Core 04 2026.06.05 16:10:00   [SRJ][T155][OBPROV] code=3 id=1781 bar=106525 flag=false
1037654 PS 0 16:46:35.849 Core 04 2026.06.05 16:10:00   [SRJ][T155][OBPROV] code=3 id=1780 bar=106525 flag=false (three; strongFlip bullish)
(No code=8 and no code=3 at the 16:00 pass for the 15:55 bar: 15:55:01 rows are code=4 id=1505 + code=5 only (lines 1037594/1037596). The 16:00-bar down-read comes from the strongFlip bearish executed at the 16:05 pass.)
OB candle times: NOT_FOUND for every id above. Searched: all code=1/code=2 birth rows in j32 window for 15:00-16:05 (0 rows); all PROMOCENSUS rows in j32 window for objIds 1507/1515/1780/1781/1784 on 2026.06.05 (0 rows); all code=1/code=2 rows file-wide for those ids (0 rows; ids are per-run objects - id=1515/1784 recur on 08-26 runs as different objects). OBCAND suppressed in this PRINT_NEUTRAL build (B-44). Hence P2 reach = UNKNOWN per flip row.

## Code rule pastes (located by text)
Include/SRJ/SRJ_BiasEngine.mqh:157-165 (strong-flip rule):
157:    int currentOpposingCount = (g_s.currentBias=="bullish")
158:                               ? g_s.bearishOBInvalidationCount
159:                               : g_s.bullishOBInvalidationCount;
160:    bool doRenewal = (currentOpposingCount >= 2) && !g_s.drawStructureRenewalLineNow;
162:    int currentInBiasCount = (g_s.currentBias=="bullish")
163:                             ? g_s.bullishOBInvalidationCount
164:                             : g_s.bearishOBInvalidationCount;
165:    bool doStrongFlip = (currentInBiasCount >= 2) && !g_s.drawBiasLineNow;
264:    else if(doStrongFlip || doWeakSignalFlip)
266:       string nextBias = (g_s.currentBias=="bullish") ? "bearish" : "bullish";
267:       g_s.currentBias = nextBias;
271:       g_s.wasBiasFlip = true;
288:       // [Task 155] Buffer 34 provenance capture. Site code 8. No object is
290:       Print("[SRJ][T155][OBPROV] code=8 id=0 bar=", i, " flag=true");
296:       g_s.bullishOBInvalidationCount = 0;
297:       g_s.bearishOBInvalidationCount = 0;
301:       if(nextBias == "bullish")
302:          g_s.bullishBiasFlipAlert = true;
303:       else
304:          g_s.bearishBiasFlipAlert = true;
306:       string flipKind = doStrongFlip ? "strongFlip" : "weakFlip";
237:       // Selective reset: zero the OPPOSING counter only, preserve in-bias counter.
238:       // In-bias invalidations continue to accumulate toward the next strong flip.
Include/SRJ/SRJ_OrderblockMgr.mqh:550-573 (code=3 in-bias / code=4 opposing):
550:                   bool isInBias = (g_s.currentBias=="bullish" && ob.isBullish) ||
551:                                   (g_s.currentBias=="bearish" && !ob.isBullish);
552:                   if(isInBias)
553:                   {
554:                      g_s.tickOBIsValid = false;
555:                      // [Task 155] Buffer 34 provenance capture. Site code 3. This pass
556:                      // invalidates orderblocks inside a descending loop, so several may
557:                      // write the flag in one bar. The LAST write survives to the export;
558:                      // the unconditional Print below carries every event.
559:                      Print("[SRJ][T155][OBPROV] code=3 id=", ob.objId, " bar=", i, " flag=false");
565:                   else
566:                   {
567:                      g_s.tickOBIsValid = true;
569:                      Print("[SRJ][T155][OBPROV] code=4 id=", ob.objId, " bar=", i, " flag=true");
Include/SRJ/SRJ_OrderblockMgr.mqh:126-128 (OB invalidation definition):
126:          closedBeyondInvalidation = (barClose < ob.invalidationLevel);
128:          closedBeyondInvalidation = (barClose > ob.invalidationLevel);
(Bullish OB invalidated by close below its invalidationLevel (OB mid); bearish by close above. Types:267 sets invalidationLevel = OB mid per B-39 P3d.)
Indicators/SRJ_FlowLogic.mq5:248 input inHtfLookbackBars = 3000; :337 input inMaxLookbackBars = 5000; :577-585 Balanced M5 autoLimit = 3000 (Aggressive M5 = 1500, Conservative M5 = 5000); :597 effectiveLookback = min(effectiveLookback, autoLimit); :600-605 g_finalLookback; :1019 withinLookbackWindow = (i >= 2) && (i >= last_bar_index - finalLookback). Pointer live memory: lookback 3000.
Window math (no run): 3000 M5 bars x 5 min = 15000 min = 10.42 days back from 16:00 bar 106524 ~= 26 May. The 07:55-09:00 5 June jump sits inside under Balanced (3000) and even under Aggressive (1500 ~= 31 May). Effect on reads NOT tested (no run).

## P3 record grep (ruling on a 5m bearish bias flip at 16:00 on 5 June)
- strategy section 5: no 16:00 flip ruling (6/5-TIMING is the 16:50 bullish flip + seedBiasAl=0-at-16:00 gate-correctness note, skill:116).
- strategy section 8: same 6/5-TIMING only (skill:116).
- strategy section 11: 5M-BIAS-AT-ENTRY is the 1 Sep 09:55 case (skill:139); 15M-READS are 1 Sep/7 Sep/8 Sep (skill:141). No 16:00.
- strategy section 13: JUN05NY-ENTRY-1615 is entry 16:15 only (skill:151). No flip ruling.
- strategy section 15: 0605LDN-FLIPS are the London 8:10 + 9:50 flips (skill:160); RAW-GAP-0605 is the 07:55-09:00 hole (skill:158). No 16:00.
- journal row 306 raw: 306,6/5/26,NY,,,,,,,,,,,,,,,"VALID LONG off the old high 160.723 (30 April day high); entry 16:15 candle open; his words 2026-10-06 (B-34 carried question): ""5 June New York long entry is the 16:15 candle open.""; skill section 13 JUN05NY-ENTRY-1615",,,,0.00 x9 (no flip ruling; entry only).
- findings: one off-log hit only - BUILDER_FINDING_RECON15b-OFFLOG.md:39 "bar - ORDER at the S5 bar (15:55), MTFLIP at the exit bar (16:00)" (exit-bar label, not his flip ruling).
- Verdict: NO_RULING_FOUND. P1+P2 answered from code+rows, so no question to him (no carried-note question).

(End of slice)
