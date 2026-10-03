# V398 seat-finding crosswalk to V399

Date: 2026-10-03. This matrix atomizes the V398 seat-specific objections and conditions; V399 packet section 15 is the saved destination. Q1 and Q3 are graded independently. ALREADY-CORRECT means the operative V399 text retains the pin/contract; ADOPT means the next relay makes the disposition explicit; AUTHORITY-BOUND means code/strategy action remains bounded by existing operator ruling or future authorization.

## Sonnet Q1 (A1-A9; B)

| Finding | Disposition | Saved destination |
| --- | --- | --- |
| A1 helper/day mark/priority/vSL/vBREAK/vHTF/nextOpenPx/full close/fill source absent | ADOPT: exact source excerpts inserted; RECON57 deal and source limits made explicit | V399 packet §15.2-15.3 |
| A2 RECON57 row identity, openAtDayClose field, deal/event distinction | ADOPT: raw hashed journal rows + EA strict-join excerpt; 0 explained by `< exitBarTime`; no broker close inferred | §15.3 |
| A3 both Fridays, daily vs Friday flags, 23:55 bar versus execution | ADOPT: daily/week marks separated; 23:55 opening-price pin controls; following-bar source price flagged for correction; Mon-Thu isolated fixture | §15.3-15.4 |
| A4 HTF/CANCEL_BIAS/MT_EXIT_REPLACED execution unresolved | AUTHORITY-BOUND: HTF experiment stays open; live PID remains managed; no invented market close or false retirement | §15.4 |
| A5 O6 after record replacement; phantom active failed entry | ADOPT: O6 before record mutation and all side effects; failed entry cannot leave phantom PID | §15.4-15.5 |
| A6 TARGET_PASSED and stop/freeze proximity | ADOPT: internal no-modify fail state, retain broker protection/management; no fill or market-close inference | §15.4 |
| A7 supersession race / prior synchronized TP can fill | ADOPT: last synchronized TP operative at deal time; new revision cancels pending old budget; prior confirmed fill remains valid | §15.4 |
| A8 market-closed/timeout/connection retry exhaustion | ADOPT: MARKET_CLOSED visible deferral; eligible-bar bound and max three actual calls; other transient codes spend call budget | §15.4 |
| A9 MODE_ALERT_ONLY, demo guard, active orphan after failed order | ADOPT: paper-only path retained; broker calls guarded; no phantom active record | §15.4 |
| Transition table and same-bar precedence | ADOPT: PID state, touch/model/broker distinction, unsynced TP cannot mask another winning exit; bounded close failures | §15.4 |
| Q1-B TP acceptance for both targets, all later revisions/diff, separate close branch | ALREADY-CORRECT + ADOPT: exact target/volume/PID/deal predicates retained; all revisions; distinct fixture; London SHORT target price geometry explained | §15.4 |
| Q1-B NY prior target ranking and London 159.908 is numerically higher | ADOPT: compare directional distance from 159.948 SHORT entry; classify as nearer, not strategy loosening | §15.4 |
| Q1-B deal #7 reason not present | AUTHORITY-BOUND: unknown unless raw history proves; no inferred reason | §15.3 |
| Q1 classification/operator-choice boundaries | ALREADY-CORRECT: no new operator choice; open HTF experiment stays open; V398 condition remains conditional until review | §15.4, §15.6 |

## GLM Q1 (C1-C10)

| Finding | Disposition | Saved destination |
| --- | --- | --- |
| C1 source exhibits including helper, priority, marks, close helper | ADOPT | §15.2-15.3 |
| C2 fresh budget and operative target on supersession | ADOPT | §15.4 |
| C3 same-bar precedence | ADOPT | §15.4 |
| C4 retcode sets, current MQL5 verification; TARGET_PASSED is internal | ADOPT: no numeric memory table treated as binding; verify before later implementation | §15.4 |
| C5 HTF stays non-executing unless operator settles otherwise | AUTHORITY-BOUND: preserve open experiment; never retire live PID | §15.4 |
| C6 alert-only dispositions | ADOPT | §15.4 |
| C7 close retry bound/failure rows | ADOPT: three actual close attempts, one eligible bar each, terminal visible managed state | §15.4 |
| C8 exact day-close fixture | ADOPT: separate no-target live-position fixture required; Monday-Thursday isolation; exact 23:55 reference; must be filled in final implementation acceptance plan | §15.3-15.4 |
| C9 g_mtrade migration/records/account/sync mode | ADOPT: PID registry, no unsupported netting, async disabled, full census retained | §15.4 |
| C10 V396 conditions and provenance | ADOPT: all V396 (a)-(i) carried; source/EX5/run linkage unproven unless evidenced | §15.4 |

## Sonnet Q3 (A1-A7; B1-B2)

| Finding | Disposition | Saved destination |
| --- | --- | --- |
| A1 contender telemetry, A2 close branch, OHLC gaps | ADOPT + AUTHORITY-BOUND: `confC=0` is current A2 branch only; governing touch-or-break and irrelevant-prior-close pin controls; missing OHLC stays gap, settled trade validity is not reopened | §15.1 |
| A2 skipped memo/poll, freshness/divergence pipeline, S3-S5 source absent | ADOPT | §15.5 |
| A3 stale holder locals | ADOPT: reset listed local/memo/latch state before fresh candidate | §15.5 |
| A4 resolver early returns/S1WAIT/S2WAIT and pending aborts | ADOPT: full function return census and deterministic consume/drop/retain | §15.5 |
| A5 eviction bit writers and keys | ADOPT | §15.5 |
| A6 counter keys and provenance state | ADOPT: one accounting path per bar/phase/candidate, census fields | §15.5 |
| A7 O6 and MarkSessionUsed/mode | ADOPT: O6 before seed/mutation/side effects; no blocked candidate consumption | §15.4-15.5 |
| B1 exact open versus deal fill | ALREADY-CORRECT: 160.524 open reference fixed; deal separately recorded but exact no-leniency applies; no operator choice question | §15.1, §15.5 |
| B2 conditions/prior Q1 close/preservation/downstream diff | ADOPT | §15.5 |

## GLM Q3 (D1-D10)

| Finding | Disposition | Saved destination |
| --- | --- | --- |
| D1 A2 divergence and hidden arming gate | ADOPT: no operator re-ask; source current predicate mismatch and settled rule explicitly carried; exhibit S3-S5 gate | §15.1-15.2, §15.5 |
| D2 EA 8477-10617 and complete return census | ADOPT | §15.5 |
| D3 same-pass memo/poll for fresh identity | ADOPT | §15.5 |
| D4 every eviction writer and direction key | ADOPT | §15.5 |
| D5 counters keyed by bar/phase/identity | ADOPT | §15.5 |
| D6 neutral pre-decision label | ADOPT | §15.5 |
| D7 missing 14:30/14:35 OHLC and actual entry row | ADOPT: exact missing values stated; no inference; operator validity remains fixed | §15.1 |
| D8 O6 gates/no side effects | ADOPT | §15.5 |
| D9 disjoint branch taxonomy | ADOPT | §15.5 |
| D10 June 11 conditional on Q1 PID closure | ALREADY-CORRECT | §15.5 |

## Saved-text closure and final disposition

Every V398 condition maps to packet section 15. Section 15.1 applies the current complete strategy pin; section 15.2 cites the current source excerpt and section 15.3 includes current journal/source rows. Section 15.4 and 15.5 carry all remaining conditions. The unresolved Mon-Thu no-target fixture and exact implementation census remain future acceptance requirements; V399 is a council design relay, not an implementation brief or code permission. Q1 V398 grade is CONDITIONAL-CONFIRM; Q3 V398 grade is AMEND; Q2 remains closed.
