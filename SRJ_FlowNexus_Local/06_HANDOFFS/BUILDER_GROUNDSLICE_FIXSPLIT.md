# GROUNDED SLICE PACK — FIX-SPLIT REVIEW SURFACE (complete functions, hash-bound)

**File:** `Experts\SRJ_FlowNexus_EA.mq5` — SHA256 `E68E0AE38CB0C968132368C6BDD45E155C55B956A7FE4A06260AE43E55700057` (559189 B, 10550 lines). **Rule for this pack:** all DECISION lines verbatim with line numbers; explicitly-bracketed spans condense outcome-untouched tallies/comments only (marked `[…]` where condensed). Exhaustiveness claims rest on the count table (§5), never on excerpt selection.

## Slice A — gate, EA:2075–2116, complete

bool IsConfirmationCandle(const int barShift, const int anchorLine, const ENUM_SRJ_DIR dir, string &failTerm)
  { failTerm = ""; if(anchorLine < 0 || dir == DIR_NONE) { failTerm = "NO_ANCHOR"; return false; }
    double o1 = iOpen (_Symbol, PERIOD_CURRENT, barShift + 1); double c1 = iClose(_Symbol, PERIOD_CURRENT, barShift + 1);
    double h1 = iHigh (_Symbol, PERIOD_CURRENT, barShift + 1); double l1 = iLow  (_Symbol, PERIOD_CURRENT, barShift + 1);
    double o0 = iOpen (_Symbol, PERIOD_CURRENT, barShift); double c0 = iClose(_Symbol, PERIOD_CURRENT, barShift);
    if(o1 <= 0.0 || c1 <= 0.0 || o0 <= 0.0 || c0 <= 0.0) { failTerm = "NO_DATA"; return false; }
    double L; if(!ReadBuf1(g_hPoi, anchorLine, L, barShift)) { failTerm = "NO_LINE"; return false; }
    if(L == EMPTY_VALUE || L <= 0.0) { failTerm = "NO_LINE"; return false; }
    [N1 equality counters at c1 == L, outcome-untouched]
    bool oppCandle = (dir == DIR_LONG) ? (c1 < o1) : (c1 > o1);
    if(!oppCandle) { failTerm = "A_OPP"; return false; }
    bool closeSideOk = (dir == DIR_LONG) ? (c1 >= L) : (c1 <= L);
    if(!closeSideOk) { failTerm = "A2_CLOSE_BREAK"; return false; }
    double body = MathAbs(c0 - o0); bool isDoji = (body < _Point * 0.0001);
    bool bodyDir = (dir == DIR_LONG) ? (c0 > o0) : (c0 < o0);
    if(isDoji || !bodyDir) { failTerm = "B_BODY"; return false; }
    bool touch = (h1 >= L - _Point && l1 <= L + _Point);
    if(!touch) { failTerm = "C_TOUCH"; return false; }
    [N1 survival counters] return true; }

## Slice B — producer, EA:1889–1943, complete

bool DetectPoiRetest(int barShift, PoiRetestResult &r)
  { r.found = false; r.isLong = false; r.topLine = -1;
    double o/h/l/c = bar OHLC; if(h <= 0.0 || l <= 0.0) return false;
    [P-NEXTOPEN operator directive: body-side test at NEXT candle's OPEN (cNext), retest close as fallback]
    double bodyHi = MathMax(o, cNext); double bodyLo = MathMin(o, cNext);
    read all POI_NLINES into lineVal[] (unreadable → EMPTY_VALUE);
    per line: N1 equality counters (outcome-untouched); LONG test (l <= L-P+EPS && bodyLo >= L-EPS) keep best rank; SHORT mirror (h >= L+P+EPS && bodyHi <= L+EPS);
    none → invalidate N1 tallies, return false;
    bestLong wins ties → { found=true, isLong=true, topLine } else SHORT; survival tallies; return true; }

## Slice C — seed path, EA:7503–7547, complete

if(g_state == ST_IDLE) { if(!inWindow) return; session-used guard (dayKey/sess statics + SESSION_LIMIT print); 
    PoiRetestResult pr; if(!DetectPoiRetest(barShift, pr) || !pr.found) return;
    g_anchorLine = pr.topLine; [single-writer comment] g_dir = S2ResolveLive(pr.isLong ? DIR_LONG : DIR_SHORT);
    SrjSideNote("DetectPoiRetest", g_dir); g_anchorBarTime = barTime; ReadBuf1(g_hPoi, pr.topLine, g_anchorPrice, barShift);
    g_sessionAtEntry = sess; g_divLatch = false; prev-state; g_state = ST_S1_REGIME; LogState; [seed-census comment + ANCHOR_ELECT print] }

## Slice D — the only two gate calls (decision lines + targets)

- EA:8163 (S3 pre-bind): `if(IsConfirmationCandle(barShift, g_anchorLine, g_dir, cfTermPB))` → promote `ST_S5_GATE_CHECK` + `CONFIRM_PREBIND` print; else `CONFIRM_PREBIND_FAIL`. S2 scope excluded by rule.
- EA:8300 (S4→S5 edge): `if(IsConfirmationCandle(barShift, g_anchorLine, g_dir, cfTerm))` → promote + state log; else `CONFIRM_STRUCT_FAIL`. One-bar validity, no carry-forward.

## §5. Count-consistency table (whole-file, case-sensitive; any hidden fifth site breaks these numbers)

- `IsConfirmationCandle`: 4 hits = 1 comment (2029) + 1 def (2075) + 2 calls (8163, 8300). NOTHING else in 10550 lines names it.
- `DetectPoiRetest`: 12 hits = 4 comments + 1 def (1889) + 3 census/shadow reads (7346/7457/7497, locals-only, zero direction/state writes per `06_HANDOFFS\BUILDER_FINDING_SINGLE_VOTE_CONTEXT.md`) + 1 seed vote (7523) + 1 side-note tag (7530) + 1 distant comment + 1 header comment (108). Single voting call: 7523.
- `g_dir` writes: 3 = decl-init (956) + reset (6160) + seed (7529) per `06_HANDOFFS\BUILDER_FINDING_DIR_WRITERS.md`.

## §6. Run lines under this surface (verbatim extracts; archives + hashes per v62 §10)

SRC1: LONG-held/stored-09:15/vote-LONG-by-DetectPoiRetest/chain-98/meters-bearish → site 10:10 LONG. SRC2: NOTHING-held-at-entry/meters-bearish → site 17:00 LONG-stored-16:45 (linkage birth; seed-instant gap disclosed).

(End — pack filed 2026-09-15; rides the next movement relay; no ask, no authority spent)
