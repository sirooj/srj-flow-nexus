# BUILDER SLICE B-110 - contexts, diff, compile, payload evidence, acceptance, restoration (payload implementation, RESTORED)

Scope: diagnostic payload implementation + one compile each + one June run + offline validation + restore. No gate, no grade, no second window. Live files only.

## START GATE (raw)

- `git ls-remote ... builder/B-109` = `bab734a4bcab825f6867a925eaeba7e4680639af` (verified; cut builder/B-110 here).
- `git log -1` = `bab734a B-109 smallest upstream XOB evidence payload (relay B-109)`.
- `git status --short` line count = 427 (prior artifacts + B106-B109 files/scripts; preserved, untouched).
- `git diff bab734a4bcab825f6867a925eaeba7e4680639af --` EMPTY on every committed file named.
- EA disk `137076d9cf85160ab8cd8379575afd4801e71098ce97c0b10d88a42c7bf59671` LF same (LF-only). EX5 `fa4c924978f6...`. Indicator disk `956bf3e3...` / EX5 `27b5f272...`. terminal64 count 0.
- terminal.ini content preserved (`terminal.ini.preB110` 06f4e269, June-window state) + full `Profiles.preB110` backup. June window read back exact (USDJPY 1779667200/1781308800 M5). No STOP.

## PART B GREPS (before/after)

- Operator message = B-110 relay order only; no new trading-rule words. Record `no new rule words`; appended nothing.
- `B-110-XOB-PAYLOAD-IMPLEMENTATION` in 99_WORKFLOW 0->1 (context X1). `B-110` in 99_WORKFLOW 0->1 (handoff X2).
- `B110-XOB-PAYLOAD-IMPLEMENTATION` in SRJ_FlowNexus_Local 0->1 (ledger 1255). `^1255.` 0->1; `^1254.` = 1 beside.

## K1 CONTRACT (B-109 quoted)

- `g_orderblocks` runtime multi-record collection; selected publish unchanged; snapshot post-mutation + post-publish; no gate reads it; raw evidence only, derived readings offline.

## RAW CONTEXTS (kept sources, by text)

- `COrderblock` (Types:37-88): startBar/endBar/swingBar, high/low/open/midpoint, invalidationLevel, isBullish/isActivated/isValid, validationBar/invalidationBar, isExtreme/isPromoted/hasDrivenRenewal, creationBar (NEW), promotionBar (Task-110), objId (Task-98a, 0=unassigned).
- `CArrayObj g_orderblocks;` (State:269). Lifecycle: Add :260/:365; promotion :817 + :894/:949; pruning :1108-1119; Delete :1122/:1134 (OverCap :1128); reset Clear :486 (ids restart :509-510); selector :1098 `must be an XOB`.
- Bar order head (FlowLogic:1023 Creation / :1031 ActivationInvalidation, per B-95 order ending in pruning).
- Publish (kept 1206-1234): reset EMPTY_VALUE/0.0, selector `SRJ_NearestPromotedOBIndex`, `GetOB` read (1215), writes hi/lo (1218-1219), objId (1220), promoTime (1225-1230); FVG-leg block from 1236. Call inserted at edited 1338-1339 after closers, before FVG block (structure verified intact).
- Precedent in restored history: live sources grep-clean (0 diag ids); `.B96XOBEXPORT` 73186 B + `.B97PROV` 73306 B copies present (additive pattern reapplied, not copied).
- EA census site (kept 11871-11885): `SrjSelEndOfRun` :11873 gated, `SrjUjPoolFinalize` :11876, handle releases :11878+ (census call inserted after :11876).
- Build source: kept indicator :671 concatenation print (untouched); new `B110Build()` TimeToString rendering (B-97 fix pattern).
- Call-site variables from proven code: `target`, `time`, `rates_total`, `barClosed` (local :1119), `prevCalc` (local :974); no shadowing locals for open/high/low/close (grep 0); OnCalculate array params :853-857.

## DIFF (vs `.preB110`, complete; full text in on-disk `.preB110`/`.B110PAYLOAD` pairs)

- EA +154/-0 pure additions (census incl. corrected counter + per-path counts + gated call).
- Indicator +107/-2 raw, +105/-0 under `--ignore-all-space` (helpers + statics + export + 2-line call; 2 whitespace-only brace/comment re-indents at the boundary, B-96/B-101 precedent class, logic verified intact).
- `.B110PAYLOAD` SHAs: EA disk+LF `5eed495962e3f7bd08428ddf93aaab23bb9bea2375d607831befc6a2a855e906`; indicator disk `4c42de0bf665bebe58c5f04d53576fef22d1b5196c9028580ab3514cbc9faef4`, LF `499dc76c0bf2ce05300caa2171a3a809232102585fc63fcad764c663fae6473a`.
- Buffers 48/48 unchanged. Gate sites unchanged (EA additions: file/string/array/time/period/symbol + own census only; no trading-path call). No derived field (call inventory verified; "gate" only in comments). Verbs match (row 2xI64/6xs/3xd/5xs/d/2xs/4xs; header `%s;%d;%d;%s;%I64d;%s;%s`; census families). OHLC from `oo/hh/ll/cc[target]` with `barT=bt[target]` by construction.

## BACKUPS + COMPILE (raw)

- `.preB110` SHAs: EA `137076d9...` / indicator `956bf3e3...` (= kept). No pre-compile EX5 backup (owned gap, B102/B106 class; kept binaries via identical `.preB96` copies, SHA-verified).
- Indicator compile: ok=true, 0 errors, 0 warnings, binary fresh (242804 B). EA compile: ok=true, 0 errors, 0 warnings, binary fresh, 6791 ms (`Result: 0 errors, 0 warnings`). One attempt each, no retries.
- B110 diag EX5 SHAs: EA `63b2a23c794c31800a70493e79747124fe44efa9401884a65dab28366bba4fe4` (475264 B); indicator `b7010b619b5b100b5d286033515ba98bcf6deb0df3d4506bdde5bb84af6f9fd7` (242804 B).

## JUNE0525-B110 RUN (USDJPY M5 1779667200/1781308800, PASSED)

- ini byte-identical; wrapper WMI_PID=13644 RC=0; STATUS PID 19336 same window (testing 2026.05.25->2026.06.13). Wrapper killed immediately post-verify (PID gone; terminal survived - B102 tighten applied). Watcher PID 17148 verified powershell. DONE polled 3x60 s (genuine watcher DONE RUN=JUNE0525-B110 RESULT=PASSED DONE=2026-10-08 22:30:14).
- Stale XOBPAYLOAD files: none anywhere (nothing removed).

## PAYLOAD EVIDENCE (frozen before any second run; no RECON62/second window)

- `XOBPAYLOAD_JUNE.csv`: 150503937 B, SHA `63d5ddc4c197925f635bdc8f8d3f857fef06431c1dc9df518c662259ac73c7c7`.
- Header `HEADER;USDJPY;300;103740;2026.10.08 22:20:47;1735776000;MIXED;12` (documented single-file convention). First row: 24 fields with OHLC.
- EA census (22:30:09 Core 04): bars=7319 (=2999+4320), recs=716060 (=181464+534596), maxPerBar=162 @06-11 06:45, freshRows=181464, incRows=534596, promo 196358 (=50134+146224) atBar 587 (=248+339), inval 157694 (=46954+110740), PROV 1/1 USDJPY/300; builds 22:20:47/22:22:11. Reproduces proven June numbers exactly in one stream.
- Recount: 716061 lines (1 header + 716060 recs), 7319 distinct bars, FRESH 181464 + INC 534596, max 162 @06-11, first multi 05-08 n=3, states 0/1/0:31856 0/1/1:8770 0/0/0:117068 1/1/1:187588 1/1/0:370778 (=716060), builds single, USDJPY/300, OHLC_EMPTY=0, OHLC_RANGE_BAD=0.
- Targets: 2JUN1420 123 / 4JUN0910 139 / 4JUN0955 130 / 5JUN1600 122 / 5JUN1610 123 / 5JUN1615 123 (= B106 exactly; FRESH 0 all six). Sample id=10 row at 14:20 + touch rows 3150/3308/3099 present as filed.
- Target OHLC numeric check: 760/760 exact vs UJBARMAP (first string-compare pass flagged 760 false mismatches over 8-vs-3-decimal rendering - owned check defect, corrected numerically, values identical).

## ACCEPTANCE RESULTS (R1 + T5/T6)

- Implementation FOUND. Multi-record FOUND (162). Adjacent FOUND (census id=2; B106 id=10 corroborates). Promotion FOUND (196358). Invalidation FOUND (157694). State distinctions FOUND (NA/valid splits). OHLC beside rows FOUND (760/760 numeric-exact). Six candles FOUND (123/139/130/122/123/123). Symbol/period FOUND. Provenance FOUND (headers/rows/EA/journal/run). No gate/derived field FOUND absent (verified). Restoration FOUND (byte-verified below).
- R2: `PAYLOAD-IMPLEMENTED-AND-PROVEN`.

## RESTORATION (T8, byte-verified)

- EA src `137076d9...` / EA EX5 `fa4c924978f6...` (via `.preB96`) / indicator src `956bf3e3...` / indicator EX5 `27b5f272...` (via `.preB96`) / terminal.ini `06f4e269` (pre-run SHA) / Profiles content restored.
- Restored sources grep 0 B110 identifiers. Leftover terminal64 PID 19336 reported (B-43). Nothing diagnostic staged.

## RECORD LINES (exact)

- X1 context §4 appended once: `- B-110-XOB-PAYLOAD-IMPLEMENTATION (planner lesson 2026-10-08, B-110): implemented and validated the raw upstream XOB payload without enabling a trading gate.`
- X2 handoff §3 appended once: `- B-110: implemented and validated the raw upstream XOB payload; no gate or trade grade was performed.`
- X3 ledger `1255.` appended once (tag `B110-XOB-PAYLOAD-IMPLEMENTATION`; SHAs, schema, compile+artifacts, validation, acceptance, R2, restoration, no-gate/no-grade).
- X4 pointer 20->20 lines (cap 35): latest B-110 RESTORED; PROVEN; kept EA/EX5 restored; no gate/grade; next reviews the payload.
- Pre-commit re-check: X1/X2/X3 counts 1; `^1254.` = 1; staged set = 6 relay files only; no source diff; no run tables.

(End of slice)
