$j='c:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\SRJ_FlowNexus_Local\06_HANDOFFS\RECON5-FVGVALIDITY_JOURNAL.log'
$out='c:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\SRJ_FlowNexus_Local\06_HANDOFFS\RECON5-FVGVALIDITY_TABULATION.txt'
function C($pat){ (Select-String -LiteralPath $j -Pattern $pat | Measure-Object).Count }
$r=@()
$r+=('G1 bars/ticks: '+((Select-String -LiteralPath $j -Pattern 'bars generated').Line -join '|'))
$r+=('SIGNAL_COUNT='+(C '\[SRJ-EA\] \d{4}\.\d{2}\.\d{2} \d{2}:\d{2}:\d{2} SIGNAL '))
$r+=('SIGNALS='+((Select-String -LiteralPath $j -Pattern '\[SRJ-EA\] \d{4}\.\d{2}\.\d{2} \d{2}:\d{2}:\d{2} SIGNAL ').Line -join '|'))
$r+=('WS161='+((Select-String -LiteralPath $j -Pattern 'WS161_CENSUS').Line -join '|'))
$r+=('WS161_MISMATCH_ROWS='+((Select-String -LiteralPath $j -Pattern 'WS161_MISMATCH(?!.*mismatch=0)').Count))
$r+=('WS161_FIELD_ROWS='+(C 'WS161_FIELD'))
$r+=('WS161_LOAD='+((Select-String -LiteralPath $j -Pattern 'WS161_LOAD').Line -join '|'))
$r+=('ABORTS: FRESH_OB_DEAD='+(C 'reason=FRESH_OB_DEAD')+' LTF_MISALIGN='+(C 'reason=LTF_MISALIGN')+' SESSION_CLOSED='+(C 'reason=SESSION_CLOSED')+' TP_RR_FAIL='+(C 'reason=TP_RR_FAIL')+' NO_TP_TARGET='+(C 'reason=NO_TP_TARGET')+' NO_SL_REF='+(C 'reason=NO_SL_REF')+' FRESH_OPP_FVG='+(C 'reason=FRESH_OPP_FVG'))
$r+=('BIASCENSUS_FINAL='+((Select-String -LiteralPath $j -Pattern 'BIASCENSUS_FINAL').Line -join '|'))
$r+=('ZONECENSUS_FINAL='+((Select-String -LiteralPath $j -Pattern 'ZONECENSUS_FINAL').Line -join '|'))
$r+=('XOB-PROMOCENSUS='+((Select-String -LiteralPath $j -Pattern 'XOB-PROMOCENSUS').Line -join '|'))
$r+=('CQD census reads: total='+(C 'CQD verdict')+' +1='+(C 'verdict=\+1')+' +2='+(C 'verdict=\+2')+' -1='+(C 'verdict=-1')+' -2='+(C 'verdict=-2'))
$r+=('CONFIRMPOLL='+(C 'CONFIRMPOLL'))
$r+=('SUPPRESSED total='+(C 'SUPPRESSED'))
$r+=('FVGSHRINK='+(C 'SRJ FVGSHRINK'))
$r+=('FVGWICKCOVER_LINES='+((Select-String -LiteralPath $j -Pattern 'SRJ FVGWICKCOVER').Line -join '|'))
$r+=('FVGBODYKILL_LINES='+((Select-String -LiteralPath $j -Pattern 'SRJ FVGBODYKILL').Line -join '|'))
$r+=('MTEXIT='+((Select-String -LiteralPath $j -Pattern 'MTEXIT').Line -join '|'))
$r+=('MTSNAP_COUNT='+(C 'MTSNAP'))
$r | Set-Content -LiteralPath $out
Get-Content -LiteralPath $out
