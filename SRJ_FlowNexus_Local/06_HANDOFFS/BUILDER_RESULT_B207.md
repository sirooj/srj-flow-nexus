# BUILDER RESULT B-207 - MEASURED (EURUSD scope): three would-be fixes, none separates cleanly

Trader summary: the FOMC build stays kept, but your 10 June, 25 June and 22 July trades still fire although your
record marks them never-take. I measured three fixes on the rows, euro only. Refusing at the confirmation candle
when the count is 2 catches your 10 June long - but it also kills your valid 28 August short, which counts 2 on the
same rows. Reading your invalidated blocks as dead refuses nothing at all: no block level is printed anywhere and no
invalidation event fires in 141 days, so all three never-takes walk through. Refusing zones the stop leg never
reached catches 10 June but again kills 28 August, and still lets 25 June and 22 July through. No fix is drafted;
each table names the row that breaks it below. I also found your 98 GB of terminal logs: per-bar indicator prints
from live charts plus tester bursts, with no switch to turn them off. Nothing was edited, compiled or run.

## Relay order (B-207 J2D-DEFECTS 2 -> MEASURED, EURUSD scope)
- Part 0 on builder/B-206 at bb4cdc0 (ls-remote backup exact; builder/B-207 cut here, pushed via backup, never origin).
  Python first (3.13.16 embed). Skills whole in order (relay 130 lines; strategy OB/FVG/2-of-3/XOB/B-91/4-June/B-203
  review words). Reads: pointer, RESULT_B206 (carried note first), SLICE_B206, DEFECTS D1+D3, REVIEW_J2D_B206 (22),
  CLEANUP_INVENTORY_B206, INDEX_B206, register whole, spec 3.4-3.7. Greps only.
- Names: kit PK-2. Lane J2D-DEFECTS 2 of 6 (EURUSD scope); FOMC-MULTI closed KEPT euro; year-start HELD. Tag B207.
  Ledger 1352 -> 1353 (B207-EU-SEPARATORS). Kept build as B-206 (EA 7c392767/B2EF6E4C, POI 5AF5E035/E5CBE1A2, flow
  a8201128/c82f175e, Sessions 16573a5b). Source rows: committed RECON62-B206T packs + EU day packs built for cited
  days + on-disk CUT_EU0525TD-B206T.log (HOLD).
- Start gate: log-1 = bb4cdc0; diff bb4cdc0 EMPTY on all 12 gate files. Disk by SHA prefix (kept build, terminal.ini
  c725e437 ACCOUNTED). Journal row 338 unstaged bytes 166074 ACCOUNTED. Ledger ^1352.=1 ^1353.=0 pre. D: 79.0 GB,
  C: 15.1 GB free. LF-normalize rule applied, no mismatch.
- Scope kept: read-only on packs/CUT/sources; euro only; no edit/compile/run/delete/move; no question; no rule change.

## Part B - banking
- His words 2026-10-14 with the B-206 reply (verbatim, typos his): "i ordered for only EU june till date run to not
  waste another hour for it to run and grade on another pairs". EU-FIRST (paraphrase, marked so): euro alone is run
  and graded until he opens pound and yen. Grep-first: skill count 0->1 (new lines 292-294); journal row 339
  (unstaged); ledger 1353 (this item).

## Part R - readings
- R1 rule words: (a) OB kill = close beyond the invalidation level (skill 231; machine OrderblockMgr 123-133 gated by
  168-180: in-bias + refOk only); OB wick-kill NO RULE WORDS. (b) FVG kill = wicked through range or body-closed
  (skill 41). (c) Opposite-FVG-validated = count term (skill 57/342); validation mechanics NO RULE WORDS. (d) 2-of-3
  pre-confirmation only (spec 3.4 L111-118; skill 116, 57-Q4; EA 2770-2780, callers 8388/7606 false at S5). (e) XOB in
  play = bar-range or confirmed-swing penetration in-leg, no recency (spec 3.5 L131; B-91 skill 201-203; 4 June
  skill 198/217/221); machine B177HZ is presence-only (EA ~10452-10480).
- R2 block state: 25Jun 10:00 OB (10:00 o/h/l/c 1.13529/1.13587/1.13524/1.13582) and 22Jul 5m OB: no range/level printed
  (unpromoted), zero SRJ INV / OBPROV code=1 rows in-window (zero code=1/2 in the whole EU CUT), obDead=0 every pass
  (25Jun #1176-1206 fvgDead-only adv1; 22Jul #2482-2506 same). FOUND cause: the close-beyond-level trigger never fired
  on rows. Kill candle: NOT DETERMINABLE (no printed level). Full o/h/l/c series in SEPARATORS.
- R3 confirmation counts (22 EU takes + A1-A7): 10Jun adv2 (fvg+opp, #3126 pre + #3149/#3151 S5-HOLD post); A1 adv2
  (ob+fvg, #797 pre + #816/#818 post); all other takes adv0/1 (8 takes print no FRESHCOUNT = count 0, EA 2777 prints
  only when adverse>0). S5-HOLD rows prove the confirmation-pass skip on every take.
- R4 stop-leg vs zone (22 takes + A3; entry/sl TP_ELECT, zone B201FROM, leg B196BAR, HZ beside): FAR-SIDE on 26May,
  4Jun, 29Jun, 15Jul, 22Jul, 28Jul, 17Aug, 22Sep, 8Oct (D3's 8 euro confirmed + 26May extra, disclosed); A-rows never
  far-side; HZ PASS on all 22+A3. Reach flags in SEPARATORS (A1 NOT-REACHED with INPLAYCOMMIT hits=0, W1:7601).
- R5 log writer (REPORT/LOGWRITER_B207.md): MQL5/logs = indicator Prints (FlowLogic/POI/CQD) from live charts +
  tester bursts; 113.9M/184.9M/106.2M lines (~129-228k/min); top heads B176HZ/B162ORIGIN/B152PR/B179HZB; growth engine
  = unconditional per-bar prints (FlowLogic 1633/1657/1661); print toggle NOT FOUND.

## Part S - separator tables (pack lines; full tables in SEPARATORS_EU_B207.md)
- S1 (refuse count 2+ at confirmation): REFUSEs 10Jun + A1; keeps rest; misses 25Jun/22Jul. DOES NOT SEPARATE (A1).
  Trader line: "this fix refuses your 10 June long but also kills your valid 28 August short."
- S2 (his OB-kill on rows): refuses nothing (no printed level, zero code=1 events). DOES NOT SEPARATE (all three
  never-takes walk through). Trader line: "this fix refuses nothing on rows."
- S3 (refuse NOT-REACHED, literal): REFUSEs 10Jun + A1 (+4Jun/15Jul/28Jul/17Aug/8Oct UNRULED-side); keeps rest incl.
  25Jun/22Jul. DOES NOT SEPARATE (A1). D3-class note: far-side-only keeps all 7 but refuses no never-take.
- S4 (union): REFUSEs 10Jun + A1. DOES NOT SEPARATE (A1).
- OTHER-GATE (5): 4S1040 + 27Aug zero rows; 1S1530/28A1625/8S1645 dead-seed refusal pack lines. UNRULED 13, counted.

## Part X - records
- X1 PLANNER_CONTEXT section 4 +1 (relay text); section 5 +1 Brain B-207.
- X2 PLANNER_HANDOFF section 3 +1 B-207 arc line.
- X3 ledger 1353 B207-EU-SEPARATORS (^1352.=1 kept; ^1353. 0->1).
- X4 pointer rewritten (35-cap; lane 2 of 6 euro with table verdicts; Next: no separating reading - trials wait for
  re-drafted readings; P3 chart call carried by planner; cleanup addendum after push; pound/yen held; HELD/F2/O3/
  UNRECONCILED/B-202 queue/offset carries).

## Part F - file, push, reply
- Timing table: gate+reads+branch ~25m (spec + skill sections); B1 banking ~10m; EU day packs (101 days, +FRESHCOUNT/
  OBPROV rebuild) ~10m; R2-R4 jobs ~20m; R5 sample (405M lines, 3 passes) ~35m; S-table lookups ~25m; SEPARATORS/
  LOGWRITER/result/slice ~30m; records + push follow. Zero runs (read-only relay).
- F5 stage explicit paths only (result, slice, 8 cited EU day packs, SEPARATORS, LOGWRITER, skill, ledger, pointer,
  CONTEXT, HANDOFF). Never sources/ex5/journals/logs/inis/profiles/scripts/backups/CUTs.
- Final disk state: unchanged from B-206 (kept build per 0.4; terminal.ini c725e437; no terminal64; journal 339
  unstaged; ledger +1 pending).

## Carried note
- Next = re-drafted separator readings (none of S1-S4 separates; closest: S1/S3 refuse 10Jun but break A1; S2 refuses
  nothing), then P3 18-June chart call (planner carries it), then his euro review, then held pound/yen on his word.
- Cleanup addendum runs after the push verifies (his pick stands: D-classes from CLEANUP_INVENTORY_B206).
- Year-start HELD. F2 grade pending. O3 pending. GU 28 Aug gap UNRECONCILED. B-202 queue unchanged. 18 March offset
  UNVERIFIED. EURUSD-first active.
