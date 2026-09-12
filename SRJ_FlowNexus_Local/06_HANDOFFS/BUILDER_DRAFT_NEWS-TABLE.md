# PINNED news event table — operator-confirmed 2026-09-12

Status: PINNED on the operator's word ("agreed, confirmed", proceed per
builder recommendation = span through 2026-12-31; VWAP anchor confirmed:
POI Marker default already carries the latest FOMC rate date/time, i.e.
the decision-day 21:00 broker release bar). SHA256 below is the lock; any
byte change re-pins with a new hash + operator word.

## The table (11 rows, `{eventTimeET, kind}`, CPI/NFP/FOMC only)

File: `SRJ_FlowNexus_Local\01_TASKS\DRAFT_NEWS-EVENTS-2026.csv`
LEN=251 SHA256=5FFF5C762DABCAB7811C598D8B16942BBCBD5F9D94C91D0BB54CF8C36EF1F134

| # | eventTimeET (America/New_York wall time) | kind | source |
|---|------------------------------------------|------|--------|
| 1 | 2026-09-04 08:30 | NFP | BLS Employment Situation, Aug data (in pilot window) |
| 2 | 2026-09-11 08:30 | CPI | BLS CPI, Aug data |
| 3 | 2026-09-16 14:00 | FOMC | Fed decision (rate-decision-only per ruling) |
| 4 | 2026-10-02 08:30 | NFP | BLS Employment Situation, Sep data |
| 5 | 2026-10-14 08:30 | CPI | BLS CPI, Sep data |
| 6 | 2026-10-28 14:00 | FOMC | Fed decision |
| 7 | 2026-11-06 08:30 | NFP | BLS Employment Situation, Oct data |
| 8 | 2026-11-10 08:30 | CPI | BLS CPI, Oct data |
| 9 | 2026-12-04 08:30 | NFP | BLS Employment Situation, Nov data |
| 10 | 2026-12-09 14:00 | FOMC | Fed decision |
| 11 | 2026-12-10 08:30 | CPI | BLS CPI, Nov data |

Sources checked 2026-09-12: BLS CPI release schedule (full 2026 list),
BLS October-2026 monthly schedule (Oct 2 NFP / Oct 14 CPI), BLS CES news
release schedule (Nov 6 / Dec 4 NFP), Fed FOMC calendar (Sep 16 / Oct 28 /
Dec 9, all 2:00 PM ET). NFP/CPI times are 08:30 ET, FOMC 14:00 ET, as
published. One row (Sep 4 NFP) falls inside the pilot window 8/26-9/10;
the rest is forward cover.

## Span recommendation (operator accepted builder's recommendation)

Through 2026-12-31, rest of year. Reasons: the table is static, so it must
already cover any forward test window picked this year; only 3 FOMC + 4 NFP
+ 4 CPI remain, so the table stays small (11 rows); 2027 BLS/Fed schedules
are still tentative, so year-end is the natural boundary. Re-pin quarterly:
next table (Q1 2027 cover) due December 2026.

## FOMC anchor confirmation

Operator: FOMC release is 21:00 broker time (Dukascopy, EET).
Checked: 14:00 ET = 21:00 broker year-round. Summer: 14:00 EDT (UTC-4) =
18:00 UTC = 21:00 EEST (UTC+3). Winter: 14:00 EST (UTC-5) = 19:00 UTC =
21:00 EET (UTC+2). Both clocks shift together, so the +7h mapping holds on
both sides of Nov 1. The table stores ET wall time as published; the EA
read path (later packet) converts ET wall time to server time with the
Nov-1 DST rule, and 21:00 broker is the cross-check. Same rule gives
08:30 ET = 15:30 broker for every NFP/CPI row.

## Questions for the operator — ANSWERED 2026-09-12

1. Pinned as-is ("agreed, confirmed", per builder recommendation).
2. VWAP anchor confirmed: POI Marker default already carries the latest
   FOMC rate date/time = the decision-day 21:00 broker release bar.
