# ROWPACK INDEX B-188 - print-row packs per cited cell (diagnostic EA d8d43f84, always restored)
# Runs: GBP0629-B188P + RECON62-B188P + JUNE0525-B188P (every deal SAME vs baselines; no source edit stands).
# All other register rows unchanged from INDEX_B187 (pound) and INDEX_B182 (EU/June).
F3 [GU 10 Jul NY SHORT Yearly-POC, his 14:55] | sweep ROWPACK/GBP0629-B188P/2026-07-10.csv:1623 (B188SWP 14:15 side=S prior=LDN day=2026.07.10 ph=1.34358 pl=1.34082 cur=NYAM first=2026.07.10 13:55@1.34363 tag=0 fail=TAG_NONE) | seed/conf/latch/entry per INDEX_B187 (SEED 1525, shadow 171/214, kill 2110, entry NONE)
F2 [GU 7 Jul NY SHORT] | target ROWPACK/GBP0629-B188P/2026-07-07.csv:1581 (B188TPSRC bar=2026.07.07 14:40 dir=SHORT w=1.33747 wsrc=YLOL wday=2026.07.07 n2=1.33630/Weekly-VWAP/2026.07.07 n3=1.33542/Monthly-POC/2026.07.07) | entry/exit per INDEX_B187 (deals #2/#3 SAME on B188P)
T0707 [GU 7 Jul SHORT change detector] | entry identical on B188P (deals #2/#3 same side/date/time/price) | exit same
T0702 [GU 2 Jul LONG (must-never, refused HISZONE_NONE)] | no LONG fire on B188P (no 7/02 LONG deal; B187 ABORT packs 9056/9057 stand)
RECON62-B188P | 14/14 deals SAME vs DEALS_RECON62-B182.csv (#2-#15 side/date/time/price/volume identical); Part S A/C machine cells read from committed ROWPACK_RECON62-B182_W1/W2/W3 (packs listed in BUILDER_RESULT_B188.md Part S)
JUNE0525-B188P | 8/8 deals SAME vs DEALS_JUNE0525-B182.csv (#2-#9 identical); Part S B/C machine cells read from committed ROWPACK_JUNE0525-B182_W1/W2/W3
