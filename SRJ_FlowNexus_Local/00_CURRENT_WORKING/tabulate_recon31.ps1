# Tabulate RECON31 vs RECON30 isolation join (counts per family, both archives).
# Any nonzero delta outside SIDE1F_* (declared new: 56+12+4=72) is a real finding.
$A = 'c:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\SRJ_FlowNexus_Local\06_HANDOFFS\RECON30-STAGEC_JOURNAL.log'
$B = 'c:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\SRJ_FlowNexus_Local\06_HANDOFFS\RECON31-FIXSPLIT_JOURNAL.log'
$pats = @('SEL52 ','SEL53 ','SLIMB','SLIMBR','SEL55 ','A6MATCH','A6DECISION','A6SUPP','A6CQD','A6COUNT','A6REFUSED','A6TERM','GEOMMATCH','GEOMDECISION','GEOMCOUNT','SIDE1P2_MATCH','SIDE1P3_SRC','SEL60DISC','SEL61PROBE','SEL61SIDE','ALERT SRJ SIGNAL','N1EQUALS','BIASCENSUS_FINAL','ZONECENSUS_FINAL','CONFIRMPOLL','S2WAIT','S1WAIT','ANCHOR_ELECT','CONFIRM_PREBIND','CONFIRM_STRUCT_FAIL','ZONEADOPT','SIDE1F_VOTE','SIDE1F_WATCH','SIDE1F_SHORT','SELHALT')
'FAMILY | RECON30 | RECON31 | DELTA'
foreach ($p in $pats) {
  $ca = (Select-String -LiteralPath $A -Pattern $p -SimpleMatch | Measure-Object).Count
  $cb = (Select-String -LiteralPath $B -Pattern $p -SimpleMatch | Measure-Object).Count
  '{0} | {1} | {2} | {3}' -f $p.Trim(), $ca, $cb, ($cb - $ca)
}
