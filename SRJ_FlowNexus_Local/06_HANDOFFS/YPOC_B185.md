# YPOC_B185.md - Yearly POC on the pound (O4): seed refusal decides it

## Method
One Python pass (job_o4_b185.py, UTF-16 streamed, compiled patterns) over Tester/logs/20261012.log spans 6853283..9850000 (B-182 RECON62/June/GBP segments; first ~37k lines of the B185D GBP segment included, startup only). Patterns: `[POI][SEED]`, `[POI][SEEDFILE]`, `CKPT_SLOT_META` yearly, `Yearly-(POC|VWAP)`, refusal texts. CKPT_SLOT_META pattern hit 0 (print exists in code :861-862 but never matched in span; format unconfirmed - disclosed, not needed).

## Deciding lines (quoted)
- GBP seed parsed + compatible, then REFUSED (day log 8874443-8874447, B-182 GBP run 11:55):
  `[POI][SEEDFILE] pass=1 seed=SRJ_SEED_GBPUSD.bin common=YES local=NO ckpt=SRJ_CKPT_GBPUSD.bin common=YES local=NO`
  `[POI][SEED] pass=1 stage=PARSED file=SRJ_SEED_GBPUSD.bin seam=2026.06.09 10:00:00 lastArchive=2026.06.09 09:59:57 builtAt=2026.09.07 09:32:06`
  `[POI][SEED] pass=1 stage=COMPATIBLE result=YES`
  `[POI][SEED] pass=1 stage=REFUSED reason=SEAM_UNREACHABLE seam=2026.06.09 10:00:00 tradingDaysProbed=3 detail="no ticks served at seam 2026.06.09 10:00:00 across 3 trading day(s)"`
  `[POI][SEED] pass=1 stage=FINAL accepted=NO ... refusal="no ticks served at seam ..."`
- Same refusal on the B185D GBP launch (day log 9813388-9813392, 14:30): identical SEAM_UNREACHABLE refusal. Diagnostic runs under identical POI conditions.
- June USDJPY seed: same SEAM_UNREACHABLE refusal (day log 7903582-7903586, seam 2026.06.09).
- EU seed contrast (day log 6853390-6853394): `seed=SRJ_SEED_EURUSD.bin common=YES`, COMPATIBLE YES, SEAM_REACHABLE, FINAL accepted=YES (seam 2026.06.26). EU prints Yearly-POC anchors (e.g. 9/08 expiry row, R4.3 census); MQL5/Files today holds only GBPUSD+USDJPY seeds (no EURUSD file) - at run time the EU seed loaded from common.

## Class (10 July Yearly POC): SEED-REJECTED
File present, parsed, compatible - refused on seam reachability. Quarterly/Yearly beyond native tick depth therefore never adopt on GBP; native fold covers shorter anchors only. The 60 YEARLY_VAL hits in span are all RETESTDIAG `nearBelow=Yearly-VWAP:NNNpts` distance notes (e.g. day log 7748703 `nearBelow=Yearly-VWAP:304.5pts`), never a value, anchor, seed or target row. Zero Yearly rows in all GBP0629-B182 packs (proven by `Yearly` + `Y[_-]?VWAP` patterns).

## 13 July Yearly-VWAP: ACCOUNTED
He says no Yearly VWAP exists there on the live chart (B1 quote); machine rows agree (zero rows). No defect hunted.

## Fix (plain words, no edit)
Re-run the seeder so the GBPUSD seam is reachable (the 2026.06.09 seam serves no ticks on this terminal; rebuild with a reachable seam and re-verify the [POI][SEED] FINAL accepted=YES line), then Yearly POC/VWAP compute natively from the adopted slot. June precedent B-56 START_DATE is the same class (lines empty on short history). No EA edit orders this; spec 2.4 (Yearly-never-retested is data-coverage fact) stands.
