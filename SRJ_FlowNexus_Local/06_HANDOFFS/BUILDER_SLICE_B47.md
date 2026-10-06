# BUILDER SLICE B-47 - raw rows behind P1, P2 and R (payloads only; audit STOP-T, no CSV)

Disk EA = 63B18C1F (untouched; no edit, no compile). Audit script Scripts/SRJ_TickAudit.mq5 (SHA 7AD6ABEFCF37621E1AA438B618DF986C161263F42AAAF866229E834A8527032F) + ex5 (SHA 7C8946D8, 62488 B, 2026-08-03) reused unchanged.

## R1 script inputs (Scripts\SRJ_TickAudit.mq5:16-24) + outputs (:509-510)
- InpSymbols = "EURUSD_RAW,GBPUSD_RAW,USDJPY_RAW,XAUUSD_RAW"; InpFrom = D'2026.01.01 00:00'; InpTo = 0 (= now); InpGapAlertMin = 60; InpFullDayMinutes = 600; InpHealBackHours = 6; InpCheckSource = true (counts broker M1; source symbol = name minus "_RAW", :241-248); InpWriteCsv = true; InpLogEveryDay = false.
- Outputs: SRJ_TickAudit_<stamp>_days.csv + SRJ_TickAudit_<stamp>_gaps.csv to MQL5\Files (stamp = run date).

## P1 journal link columns (raw heads; TV = tradingview.com, TG = t.me; links unopenable)
- row 17 (6/5 LDN TF): TV/TV links (4H/1H/15m cols). rows 19-20 same links. row 25 (6/9 LDN TF): TV/TV. rows 33-36 (6/11 LDN/NY): TV/TV/TV. row 257 (8/28 LDN TF): TV TV links. rows 277/279 (9/4 LDN/NY): TV TV links. rows 281/283 (9/7 LDN/NY): TV TV links. row 285 (9/8 LDN): 15m-read words, link cols blank. row 301 (9/1 NY banked): comment only, no links. row 306 (6/5 NY banked): no links.
- No 9/8 NY TF journal row exists.

## P2 NY0605 rows (j32 S5; j26 dead post-10:00 by B-41 defect, EMPTY there)
- UJPROBE ltf 15:00-15:25 -1.0; 15:30-15:55 +1.0; 16:00 -1.0; 16:05/16:10/16:15 +1.0 (j32 S5 rows).
- code=8 flips 12:00-16:20 (j32): 12:05/106476, 12:15/106478, 12:50:15/106485, 16:05/106524, 16:10/106525.
- 16:00 S2SEEDBIAS_KILL (seedBiasAl=0) + 16:05 SEEDBIAS_REFUSED ABORT + A6REFUSED (j32:50988-51000, same shape as j18/j22).

## R audit attempt rows
- Launch: WMI_PID=13356 then WMI_PID=3004 (first ini path doubled Scripts\; fixed to Script=SRJ_TickAudit.ex5). Terminal journal: `script 'Scripts\Scripts\SRJ_TickAudit.ex5' not found from start config`, then `script SRJ_TickAudit (USDJPY,M5) loaded successfully` (log 20:56:47).
- Experts log: `[Audit] READ-ONLY audit. Nothing will be written to any symbol.` / `[Audit] server UTC+3:00 | archive now 2026.10.06 16:56 | range 2026.01.01 -> 2026.10.06`.
- B47_AUDIT.ini: `[StartUp] / Symbol=USDJPY / Period=M5 / Script=SRJ_TickAudit.ex5` (no Expert/Script lines beyond that one; kept untracked).
- STOP-T evidence: days CSV 0 bytes after ~10 min wall; zero further [Audit] lines; terminal alive whole time. Terminal stopped by PID; run marked NOT_REACHED.
- R3 restore verify: terminal.ini 450ACB4A (== copy); Profiles 137/137 byte-identical, 2 extras deleted (chart57/58.chr), 17 files restored from preB47 copies; [Tester] June window read back intact.

(End of slice)
