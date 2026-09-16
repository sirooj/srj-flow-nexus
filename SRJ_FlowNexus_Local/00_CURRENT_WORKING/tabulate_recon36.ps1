# Tabulate RECON36 vs RECON35 + integrity (mechanical).
$MQL5 = 'c:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5'
$utf8 = [System.Text.Encoding]::UTF8
$A35 = Join-Path $MQL5 'SRJ_FlowNexus_Local\06_HANDOFFS\RECON35-LIVE_JOURNAL.log'
$A36 = Join-Path $MQL5 'SRJ_FlowNexus_Local\06_HANDOFFS\RECON36-STOPSHADOW_JOURNAL.log'
$TAB = Join-Path $MQL5 'SRJ_FlowNexus_Local\06_HANDOFFS\RECON36_TABULATE.txt'
$fams = @('SEL52','SEL53','SLIMB','SLIMBR','SEL55','A6MATCH','A6DECISION','A6SUPP','A6CQD','A6COUNT','A6REFUSED','A6TERM','GEOMMATCH','GEOMDECISION','GEOMCOUNT','SIDE1P2_MATCH','SIDE1P3_SRC','SEL60DISC','SEL61PROBE','SEL61SIDE','ALERT SRJ SIGNAL','N1EQUALS','BIASCENSUS_FINAL','ZONECENSUS_FINAL','CONFIRMPOLL','S2WAIT','S1WAIT','ANCHOR_ELECT','CONFIRM_PREBIND','CONFIRM_STRUCT_FAIL','ZONEADOPT','SIDE1F_VOTE','SIDE1F_WATCH','SIDE1F_SHORT','SIDE1G_PROFILE','SIDE1G_VOTE3','SIDE1G_TALLY','SELHALT','SEL61LIVE','SEL61SUMMARY','WS161_CENSUS','SIDE1C_SUPP','SIDE1C_BOTHDIRS','SIDE1C_CHAIN','SIDE1D_BOTHDIRS','SUPPRESSED bar=','POIREPLACE','SEL61SRC','SIDE1H_WOULDPREEMPT','SIDE1C_PREEMPT','SIDE1E_STOPSHADOW')
$out = New-Object System.Collections.Generic.List[string]
$out.Add('FAMILY | R35 | R36 | DELTA')
$bad = 0
foreach ($p in $fams) {
  $c35 = (Select-String -LiteralPath $A35 -Pattern $p -SimpleMatch | Measure-Object).Count
  $c36 = (Select-String -LiteralPath $A36 -Pattern $p -SimpleMatch | Measure-Object).Count
  $d = $c36 - $c35
  $out.Add(('{0} | {1} | {2} | {3}' -f $p, $c35, $c36, $d))
  if ($d -ne 0 -and $p -ne 'SIDE1E_STOPSHADOW') { $bad++ }
}
[System.IO.File]::WriteAllLines($TAB, $out.ToArray(), $utf8)
'TABLINES=' + $out.Count + ' NONNEW_DIFFS=' + $bad
'WS161=' + (Select-String -LiteralPath $A36 -Pattern 'WS161_CENSUS fields=21 loads=3168 stores=3168 changes=218 mismatch=0' -SimpleMatch | Measure-Object).Count
$max = 0
foreach ($ln in [System.IO.File]::ReadLines($A36)) { if ($ln.Length -gt $max) { $max = $ln.Length } }
'MAXLEN=' + $max
