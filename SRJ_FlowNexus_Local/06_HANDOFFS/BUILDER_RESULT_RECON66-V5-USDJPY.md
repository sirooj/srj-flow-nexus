# BUILDER RESULT RECON66-V5-USDJPY - guard run graded B1-B8 PASS (2026-09-26)

## 1. Run facts (segment-gated, never day-log)
- Run RECON66-V5-USDJPY, DONE=PASSED 01:03:41 (~45 min). Built tree 89810547 (packet v5, Luna key + v7 word spent).
- Segment 06_HANDOFFS\RECON66-V5-USDJPY_JOURNAL.log 022E464E/3858850/21362.
- Range line (triple-proof closed): "testing of Experts\SRJ_FlowNexus_EA.ex5 from 2026.06.01 00:00 to 2026.06.13 00:00" 2x - correct window, no void.
- Completion marker "Test passed" 1x.

## 2. Grade vs acceptance (rows quoted from the segment)
- B1 PASS (6/04 16:15 SHORT Daily-POC): GUARD opposed=1 anti=2/1 flip=1 + pobreak=1 with bbar 16:10 bpx 159.884/159.875/159.888 (SHORT cross recomputed TRUE: 159.875<=159.884 and 159.888>159.884 - genuine break evidence, E6a-primary dual-cause as ruled); ABORT LTF_MISALIGN state=S2_LTF_ALIGN at 16:20; NO PREBIND (0), NO ORDER (0 vs 15 elsewhere), LE signal gone (6 signals vs RECON64 8, missing exactly LE+PS); no post-kill revival.
- B2 PASS (6/08 09:30 SHORT Weekly-POC): GUARD opposed=1 anti=3/1 flip=1 pobreak=0 adjudicated; ABORT S2 row 09:35; NO PREBIND (0); NO ORDER (0); PS gone; silence after.
- B3 PASS (A1 09:40 SHORT Daily-POC): SIGNAL 09:45 + EXECUTED 159.948 (deal #6) + MTEXIT CL bar 12:15 entry=159.948 exit=159.899 (deal #7) identical; GUARD opposed=0 pobreak=0 anti=1/1 (prev realized 1) walked=1 skipped=0; epoch bbar.
- B4 PASS (A4 6/03 09:05 LONG Daily-VWAP): EXECUTED fill=159.932 (deal #2) + ALERT SL/TP (KK) + MTEXIT entry=159.929 exit=159.983 (deal #3 sell 159.983); 0.3-pip gap as ruled sourced-differently.
- B5 PASS: TP_RR_FAIL_LATCH 6/05 16:50 R=0.38 identical. B6 PASS: 6/03 18:35 R=0.28 identical. Observed extra: 6/04 17:05 R=0.21 latch (untouched S3 path, outside battery scope, RECON64 segment absent for parity - recorded, not graded).
- B7: 3 E4b-guard kills, all attributed (2 ruled + 6/10 17:15 LONG opposed=1 anti=3/2 genuine-opposition kill, no baseline signal removed); 0 unattributable; 0 S54_POIBREAK fires (second pattern reason=S54 0x; B1 dual-cause correctly single-emitted per precedence); SKIP 0x (second patterns reason=HTF/SEEDORDER 0x; lone reason=SEED is a POI-checkpoint row, not a guard SKIP); baseline takes bit-identical (deals #2-#11 match fills/exits); rejects diagnostic.
- B8 PASS: post-kill silence on both killed instances (4 PREBIND rows all on live instances; 6 signals none on killed anchors; silence binds seed instance per v5 P183).
- S1 segment-consistent: 7 GUARD rows (4 promote + 2 kills + 1 ruled-silent equal-shift 6/09 15:20 walked=0 with no SKIP, exactly as ruled); E4b state field separates all 3 guard kills (S2_LTF_ALIGN) from 7 invariant kills (S3/S4) - two-emitter census live-proven.
- L-final: B1-B8 + dynamic-anchor + epoch/seedbar + walked/readable clauses all hold. GRADE: PASS.

## 3. Goal-join (June USDJPY window)
- A1 take intact entry+exit exact; A4 take intact; A2 + 6/03 refuses intact; 2 ruled kills delivered with no takes and no revival; 1 extra attributed kill, no baseline parity broken; 0 falses; 0 battery misses. Deployment bar unchanged (full-journal open; EU run pending).

## 4. Owed next
- Run 2: EURUSD 8/26-9/10 (window change June->Aug-Sep with close-first-then-edit + triple-proof; InpDebugLog=true, M5 pinned).

(End of file)