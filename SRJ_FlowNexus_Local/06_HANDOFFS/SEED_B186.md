# SEED_B186.md - O3 seeder location, seam logic, ckpt dependency, and why S2 stops here

## Seeder location (by text)
- Script: `Scripts/SRJ_POI_Seeder.mq5` (v2.00 header: "Pre-folds a deep archive symbol into the six POI accumulators and writes them to a seed file, so SRJ_POI_Marker can show a Yearly POC that is REAL"; compiled `.ex5` present beside it).
- Inputs (existing, no new numbers): `InpArchiveSymbol` (default `"EURUSD_RAW"` :96; for GBPUSD the archive is `GBPUSD_RAW`), `InpNativeSymbol` (default `"EURUSD"` :97; `GBPUSD` for this rebuild), `InpSeamServer = ""` (:129: empty = AUTO seam), `InpNativeDepthDays = 150` (:131: probe window), `InpSeamMarginDays = 60` (:136: AUTO clearance above measured depth), `InpBinPips = 0.1` (:104), `InpWeightMode = WEIGHT_TICKCOUNT` (:105, must match EA's `InpPoi_BinPips = 0.1` / `InpPoi_WeightMode = 0`, EA :42-43).
- Output names derived (`SEED_FileName`/`SEED_CkptName`, SeedFormat :122-123): `SRJ_SEED_GBPUSD.bin` + `SRJ_CKPT_GBPUSD.bin`, written to `Terminal\Common\Files` (`FILE_COMMON`, SeedFormat :331).

## Seam selection (seeder's own logic, no hand-picked date)
- AUTO (empty `InpSeamServer`): depth probe walks candidate weekdays oldest-to-newest for first served ticks (v1.21, header :68-76), seam = measured depth + 60-day margin, validated against BOTH ends of the legal window: measured native depth <= seam <= newest archive tick (v1.10, header :83-85).
- Manual override exists (`InpSeamServer`, existing input) but naming a date offline would be a hand-picked seam (forbidden by relay scope); the seam must come from the runtime probe.

## EA seam probe (the refusal)
- `SRJ_POI_Marker.mq5` seed block (:2043-2168): `[POI][SEEDFILE]` print, PARSED / COMPATIBLE / REFUSED / FINAL prints; `InpRefuseSeamHole = true` (:125, default) refuses on seam holes.
- Adoption triple-match (:2306-2307): `seedPeriod == hostPeriod && seedPeriod == seamPeriod`, else named reasons (`FILE_PERIOD_DIFFERS_FROM_HOST_AND_SEAM`, etc.).
- Without seed: `PC_SEED_OFF` "Seed disabled - Q/Y truncated" (:2161-2168).
- GBPUSD on 12 Oct: PARSED + COMPATIBLE YES, then REFUSED SEAM_UNREACHABLE (seam 2026.06.09, no ticks 3 trading days), FINAL accepted=NO (day log 8874443-8874447; identical on B185D 9813388-9813392). June seed: same refusal. EU seed: ACCEPTED (seam 2026.06.26).
- Reachability probe `POI_SeamReachable` (TickCore): 3 trading days with served ticks at the seam, evaluated inside the tester at pass 1.

## Ckpt dependency
- Written by the seeder (v1.20 header :78-81: developing POC/VWAP trajectories beside the seed). Host skips it when the seed is refused (`[POI][CKPT] stage=SKIPPED reason=SEED_NOT_ACCEPTED`, :2438). Rebuild writes both together (same seeder run).

## Why S2 stops (measured, not inferred)
1. The seeder is a chart Script (`.ex5` present, never compiled here). Scripts do not run in the Strategy Tester (EA-only) and terminal64 has no headless script-execution path; attaching it needs the GUI. Relay scope forbids a new EA file and any compile, so no runner can be built for it.
2. The AUTO seam requires the runtime depth probe inside the tester (measured depth + 60d, validated both ends). Any offline seam value is a hand-picked date, forbidden. The probe cannot run outside MQL in-tester.
3. The tick containers resist offline reads (measured): zero timestamp-like int64/int32 values in the first 8KB of `202606.tkc` (LE/BE, seconds/ms); M1 `.hcc` yields 0/200 plausible records at every standard header/stride guess. Fold input for Jan-Jun is therefore unavailable offline.
- Current SHAs (S1): GBPUSD seed `0f67b6ed` + ckpt `5954bc9d` (`.preB186` copies written, verified); EURUSD seed `617ff927`; USDJPY seed `9f2d33cc`. Nothing modified; nothing to restore.
