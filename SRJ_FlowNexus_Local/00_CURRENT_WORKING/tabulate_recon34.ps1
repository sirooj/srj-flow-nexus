# Tabulate RECON34 vs RECON33 (mechanical family counts).
$MQL5 = 'c:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5'
$utf8 = [System.Text.Encoding]::UTF8
$A33 = Join-Path $MQL5 'SRJ_FlowNexus_Local\06_HANDOFFS\RECON33-PROBE_JOURNAL.log'
$A34 = Join-Path $MQL5 'SRJ_FlowNexus_Local\06_HANDOFFS\RECON34-SHADOW_JOURNAL.log'
$TAB = Join-Path $MQL5 'SRJ_FlowNexus_Local\06_HANDOFFS\RECON34_TABULATE.txt'
$fams = @('SEL52','SEL53','SLIMB','SLIMBR','SEL55','A6MATCH','A6DECISION','A6SUPP','A6CQD','A6COUNT','A6REFUSED','A6TERM','GEOMMATCH','GEOMDECISION','GEOMCOUNT','SIDE1P2_MATCH','SIDE1P3_SRC','SEL60DISC','SEL61PROBE','SEL61SIDE','ALERT SRJ SIGNAL','N1EQUALS','BIASCENSUS_FINAL','ZONECENSUS_FINAL','CONFIRMPOLL','S2WAIT','S1WAIT','ANCHOR_ELECT','CONFIRM_PREBIND','CONFIRM_STRUCT_FAIL','ZONEADOPT','SIDE1F_VOTE','SIDE1F_WATCH','SIDE1F_SHORT','SIDE1G_PROFILE','SIDE1G_VOTE3','SIDE1G_TALLY','SELHALT','SEL61LIVE','SEL61SUMMARY','WS161_CENSUS','SIDE1C_SUPP','SIDE1C_BOTHDIRS','SIDE1C_CHAIN','SIDE1D_BOTHDIRS','SUPPRESSED bar=','POIREPLACE','SEL61SRC','SIDE1H_WOULDPREEMPT')
$out = New-Object System.Collections.Generic.List[string]
$out.Add('FAMILY | R33 | R34 | DELTA')
foreach ($p in $fams) {
  $c33 = (Select-String -LiteralPath $A33 -Pattern $p -SimpleMatch | Measure-Object).Count
  $c34 = (Select-String -LiteralPath $A34 -Pattern $p -SimpleMatch | Measure-Object).Count
  $out.Add(('{0} | {1} | {2} | {3}' -f $p, $c33, $c34, ($c34 - $c33)))
}
[System.IO.File]::WriteAllLines($TAB, $out.ToArray(), $utf8)
'TABULATE_LINES=' + $out.Count
