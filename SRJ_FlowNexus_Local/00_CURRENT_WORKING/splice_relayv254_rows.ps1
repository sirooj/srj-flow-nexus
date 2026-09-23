# Splice relay v254 rows-fence (last pair) from segments. TARGET VERIFIED: v254-EVICT-4.
$S58 = 'c:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\SRJ_FlowNexus_Local\06_HANDOFFS\RECON58-RETEST-V1_JOURNAL.log'
$S57 = 'c:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\SRJ_FlowNexus_Local\06_HANDOFFS\RECON57-DEMOGUARD-V1_JOURNAL.log'
$RL = 'c:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\SRJ_FlowNexus_Local\06_HANDOFFS\BUILDER_RELAY_COUNCIL_v254-EVICT-4.md'
'TARGET=v254-EVICT-4'
$jobs = @(
  @($S58, 'ANCHOR_ELECT bar=2026\.09\.01 16:45'),
  @($S58, 'CONFIRMPOLL bar=2026\.09\.01 16:45 anchor=Yearly-POC'),
  @($S58, '2026\.09\.01 16:50:00\s+\[SRJ-EA\] 2026\.09\.01 16:50:00 STATE S3_ZONE_WAIT->S4_ARMED'),
  @($S58, '2026\.09\.01 16:55:00\s+\[SRJ-EA\] 2026\.09\.01 16:55:00 STATE S5_GATE_CHECK->S4_ARMED'),
  @($S58, 'SIDE1H_WOULDPREEMPT bar=2026\.09\.01 16:50'),
  @($S58, 'SUPPRESSED bar=2026\.09\.01 17:30 poi=Monthly-VWAP'),
  @($S58, 'A6TERM class=SELECTED bar=2026\.09\.01 17:30 shift=1 site=S2POLL'),
  @($S57, '2026\.09\.01 17:35:01\s+\[SRJ-EA\] 2026\.09\.01 17:35:01 STATE S1_REGIME->S2_LTF_ALIGN'),
  @($S57, '2026\.09\.01 17:35:01\s+\[SRJ-EA\] 2026\.09\.01 17:35:01 SIGNAL dir=LONG poi=Monthly-VWAP'),
  @($S57, '2026\.09\.01 17:35:01.*PRE-SEND lots=2\.04'),
  @($S57, '2026\.09\.01 17:35:01.*order performed buy 2\.04'),
  @($S57, 'SEEDVOID bar=2026\.09\.01 16:55'),
  @($S57, 'SEEDVOID bar=2026\.09\.01 17:00'),
  @($S58, '2026\.08\.31 16:40:01\s+\[SRJ-EA\] 2026\.08\.31 16:40:01 STATE S5_GATE_CHECK->S4_ARMED'),
  @($S58, '2026\.09\.04 09:45:02\s+\[SRJ-EA\] 2026\.09\.04 09:45:02 STATE S5_GATE_CHECK->S4_ARMED'),
  @($S57, '2026\.08\.27 10:15:00\s+\[SRJ-EA\] 2026\.08\.27 10:15:00 STATE S5_GATE_CHECK->S4_ARMED'),
  @($S57, '2026\.08\.31 16:40:01\s+\[SRJ-EA\] 2026\.08\.31 16:40:01 STATE S5_GATE_CHECK->S4_ARMED'),
  @($S57, '2026\.09\.01 16:55:00\s+\[SRJ-EA\] 2026\.09\.01 16:55:00 STATE S5_GATE_CHECK->S4_ARMED')
)
$rows = @()
$bad = 0
foreach ($j in $jobs) {
  $h = @(Select-String -Path $j[0] -Pattern $j[1])
  if ($h.Count -ne 1) { $bad++; 'BADHITS=' + $h.Count + ' :: ' + $j[1] }
  else { $rows += $h[0].Line }
}
'BAD=' + $bad + ' ROWS=' + $rows.Count
$r = @(Get-Content -LiteralPath $RL)
'RL-CHECK=' + $r[0]
$fi = @()
for ($k = 0; $k -lt $r.Count; $k++) { if ($r[$k] -eq '```') { $fi += $k } }
'FENCES=' + ($fi -join ',')
$out = @($r[0..$fi[20]] + $rows + $r[$fi[21]..($r.Count - 1)])
'OUT-N=' + $out.Count
$out | Set-Content -LiteralPath $RL
'WROTE=1'
