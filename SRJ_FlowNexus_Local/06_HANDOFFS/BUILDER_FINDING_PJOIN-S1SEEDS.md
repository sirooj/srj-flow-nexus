# FINDING — S1-seed P-term join (zero-run, RECON38 archive) + necessity case (2026-09-16)

Method: P-for-SHORT composed per term from archived rows at the two S1-window seeds (09:15, 09:45 LONG seeds). No build/run/word spent.

## 1. Term tables (verbatim payloads)

09:15: VOTE3 h4=+1 h1=+1 m15=+1 · REGIMECENSUS votes=3 trendOk=1 sweepTag=1 mrOk=0 (dir=LONG) · SIDE1T LONG al=0 REJECT · CONFIRMPOLL LONG oppCandle=1 bodyDir=0 body=48pts touchAttr=0 confirm=0 · SIDE1F LONG t1term=B_BODY t1reject=1 conf=0.
09:45: VOTE3 h4=+1 h1=+1 m15=-1 · REGIMECENSUS votes=2 trendOk=1 sweepTag=1 mrOk=0 (dir=LONG) · SIDE1T LONG al=0 REJECT · CONFIRMPOLL LONG oppCandle=0 bodyDir=0 body=7pts touchAttr=1 confirm=0 · SIDE1F LONG t1term=A_OPP t1reject=1 conf=0.

## 2. P-for-SHORT reading per term

- HTF-bias (SHORT): 09:15 FAIL (all legs bull) · 09:45 FAIL on 4H+1H legs (both bull; 15m bears) — under a TF-reading, SHORT unsupported at both bars.
- Sweep (SHORT): SUPPORTED both bars — tag=1 (Asia-high swept = SHORT-favoring) + most-recent-unexpired by buffer construction.
- LTF-bias (SHORT): SUPPORTED both bars — al=0-for-LONG ⇒ SHORT-aligned.
- Confirm (SHORT): UNEVALUABLE from rows — CONFIRMPOLL prints LONG-mirrored terms only (oppCandle/bodyDir relative LONG); raw OHLC absent. His filed words ("pre-bar bullish could not confirm" the LONG) do not mirror to SHORT without his rule application — never invented.
- ROW-TYPE (TF vs MR): OPEN — nothing archived says which rule governs the S1 site. If MR-type, the HTF FAIL above is inapplicable (sweep-only governs); if TF-type, bias governs. The code's seeds carry no row-type.

## 3. Necessity case (builder's call, evidenced)

The join SPLITS birth (2 support / 1 oppose / 2 open) — it does NOT settle it. What only execution resolves: (a) confirm-for-SHORT computed properly (`IsConfirmationCandle` takes dir; N1 save/restore viable); (b) the composed predicate + propagation as an instrument; (c) null-effect + isolation proof for anything landing-grade. The desk join was the triage; the triage names its own gap. RUN NECESSARY — with one spec amendment (Sec.4): DUAL-READING (print TF-verdict AND MR-verdict separately at each seed; row-type left to council grade) because no cleared text picks a row type and inventing one violates §6.1. v105 carries the amendment + clear-on-sight.
