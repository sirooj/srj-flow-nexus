# Tabulate C0-PROBE vs RECON32 isolation join (counts per family, both archives).
# Null-effect prediction: every legacy family delta-0; only declared deltas are
# SEL61LIVE (agree==calls by pass-through construction) + new SIDE1C_* prints.
$A = 'c:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\SRJ_FlowNexus_Local\06_HANDOFFS\RECON32-RECON_JOURNAL.log'
$B = 'c:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\SRJ_FlowNexus_Local\06_HANDOFFS\C0-PROBE_JOURNAL.log'
$pats = @('SEL52 ','SEL53 ','SLIMB','SLIMBR','SEL55 ','A6MATCH','A6DECISION','A6SUPP','A6CQD','A6COUNT','A6REFUSED','A6TERM','GEOMMATCH','GEOMDECISION','GEOMCOUNT','SIDE1P2_MATCH','SIDE1P3_SRC','SEL60DISC','SEL61PROBE','SEL61SIDE','ALERT SRJ SIGNAL','N1EQUALS','BIASCENSUS_FINAL','ZONECENSUS_FINAL','CONFIRMPOLL','S2WAIT','S1WAIT','ANCHOR_ELECT','CONFIRM_PREBIND','CONFIRM_STRUCT_FAIL','ZONEADOPT','SIDE1F_VOTE','SIDE1F_WATCH','SIDE1F_SHORT','SIDE1G_PROFILE','SIDE1G_VOTE3','SIDE1G_TALLY','SELHALT','SEL61LIVE','SEL61SUMMARY','WS161_CENSUS','SIDE1C_SUPP','SIDE1C_BOTHDIRS','SIDE1C_CHAIN')
'FAMILY | RECON32 | C0 | DELTA'
foreach ($p in $pats) {
  $ca = (Select-String -LiteralPath $A -Pattern $p -SimpleMatch | Measure-Object).Count
  $cb = (Select-String -LiteralPath $B -Pattern $p -SimpleMatch | Measure-Object).Count
  '{0} | {1} | {2} | {3}' -f $p.Trim(), $ca, $cb, ($cb - $ca)
}
