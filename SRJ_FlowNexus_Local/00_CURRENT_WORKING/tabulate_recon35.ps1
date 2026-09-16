# Tabulate RECON35 vs RECON34 + integrity (mechanical).
$MQL5 = 'c:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5'
$utf8 = [System.Text.Encoding]::UTF8
$A34 = Join-Path $MQL5 'SRJ_FlowNexus_Local\06_HANDOFFS\RECON34-SHADOW_JOURNAL.log'
$A35 = Join-Path $MQL5 'SRJ_FlowNexus_Local\06_HANDOFFS\RECON35-LIVE_JOURNAL.log'
$TAB = Join-Path $MQL5 'SRJ_FlowNexus_Local\06_HANDOFFS\RECON35_TABULATE.txt'
$fams = @('SEL52','SEL53','SLIMB','SLIMBR','SEL55','A6MATCH','A6DECISION','A6SUPP','A6CQD','A6COUNT','A6REFUSED','A6TERM','GEOMMATCH','GEOMDECISION','GEOMCOUNT','SIDE1P2_MATCH','SIDE1P3_SRC','SEL60DISC','SEL61PROBE','SEL61SIDE','ALERT SRJ SIGNAL','N1EQUALS','BIASCENSUS_FINAL','ZONECENSUS_FINAL','CONFIRMPOLL','S2WAIT','S1WAIT','ANCHOR_ELECT','CONFIRM_PREBIND','CONFIRM_STRUCT_FAIL','ZONEADOPT','SIDE1F_VOTE','SIDE1F_WATCH','SIDE1F_SHORT','SIDE1G_PROFILE','SIDE1G_VOTE3','SIDE1G_TALLY','SELHALT','SEL61LIVE','SEL61SUMMARY','WS161_CENSUS','SIDE1C_SUPP','SIDE1C_BOTHDIRS','SIDE1C_CHAIN','SIDE1D_BOTHDIRS','SUPPRESSED bar=','POIREPLACE','SEL61SRC','SIDE1H_WOULDPREEMPT','SIDE1C_PREEMPT')
$out = New-Object System.Collections.Generic.List[string]
$out.Add('FAMILY | R34 | R35 | DELTA')
foreach ($p in $fams) {
  $c34 = (Select-String -LiteralPath $A34 -Pattern $p -SimpleMatch | Measure-Object).Count
  $c35 = (Select-String -LiteralPath $A35 -Pattern $p -SimpleMatch | Measure-Object).Count
  $out.Add(('{0} | {1} | {2} | {3}' -f $p, $c34, $c35, ($c35 - $c34)))
}
[System.IO.File]::WriteAllLines($TAB, $out.ToArray(), $utf8)
'TABULATE_LINES=' + $out.Count
'SELHALT35=' + (Select-String -LiteralPath $A35 -Pattern 'SELHALT' -SimpleMatch | Measure-Object).Count
'PREEMPT1010=' + (Select-String -LiteralPath $A35 -Pattern 'SIDE1C_PREEMPT bar=2026.09.08 10:10' -SimpleMatch | Measure-Object).Count
'S2WAIT1010=' + (Select-String -LiteralPath $A35 -Pattern 'S2WAIT bar=2026.09.08 10:10' -SimpleMatch | Measure-Object).Count
$max = 0
foreach ($ln in [System.IO.File]::ReadLines($A35)) { if ($ln.Length -gt $max) { $max = $ln.Length } }
'MAXLEN35=' + $max
