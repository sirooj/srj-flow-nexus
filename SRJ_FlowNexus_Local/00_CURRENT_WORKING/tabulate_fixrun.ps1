$j='c:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\SRJ_FlowNexus_Local\06_HANDOFFS\RECON4-FIXS2POLL_JOURNAL.log'
$out='c:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\SRJ_FlowNexus_Local\06_HANDOFFS\RECON4-FIXS2POLL_TABULATION.txt'
function C($pat){ (Select-String -LiteralPath $j -Pattern $pat | Measure-Object).Count }
$r=@()
$r+=('G1 bars/ticks: '+((Select-String -LiteralPath $j -Pattern 'bars generated').Line -join '|'))
$r+=('SIGNAL_COUNT='+(C '\[SRJ-EA\] \d{4}\.\d{2}\.\d{2} \d{2}:\d{2}:\d{2} SIGNAL '))
$r+=('WS161='+((Select-String -LiteralPath $j -Pattern 'WS161_CENSUS').Line -join '|'))
$r+=('WS161_MISMATCH_ROWS='+((Select-String -LiteralPath $j -Pattern 'WS161_MISMATCH(?!.*mismatch=0)').Count))
$r+=('WS161_FIELD_ROWS='+(C 'WS161_FIELD'))
$r+=('WS161_LOAD='+((Select-String -LiteralPath $j -Pattern 'WS161_LOAD').Line -join '|'))
$r+=('S2POLL_NO_SL_REF='+(C 'S2POLL_NO_SL_REF'))
$r+=('ABORT_NO_SL_REF='+(C 'ABORT_NO_SL_REF'))
$r+=('ABORTS: FRESH_OB_DEAD='+(C 'reason=FRESH_OB_DEAD')+' LTF_MISALIGN='+(C 'reason=LTF_MISALIGN')+' SESSION_CLOSED='+(C 'reason=SESSION_CLOSED')+' TP_RR_FAIL='+(C 'reason=TP_RR_FAIL')+' NO_TP_TARGET='+(C 'reason=NO_TP_TARGET')+' NO_SL_REF='+(C 'reason=NO_SL_REF')+' FRESH_OPP_FVG='+(C 'reason=FRESH_OPP_FVG'))
$r+=('BIASCENSUS_FINAL='+((Select-String -LiteralPath $j -Pattern 'BIASCENSUS_FINAL').Line -join '|'))
$r+=('ZONECENSUS_FINAL='+((Select-String -LiteralPath $j -Pattern 'ZONECENSUS_FINAL').Line -join '|'))
$r+=('XOB-PROMOCENSUS='+((Select-String -LiteralPath $j -Pattern 'XOB-PROMOCENSUS').Line -join '|'))
$r+=('CQD census reads: total='+(C 'CQD verdict')+' +1='+(C 'verdict=\+1')+' +2='+(C 'verdict=\+2')+' -1='+(C 'verdict=-1')+' -2='+(C 'verdict=-2'))
$r+=('INPLAYCOMMIT applied=1 total='+(C 'INPLAYCOMMIT.*applied=1')+' committed=1 of those='+(Select-String -LiteralPath $j -Pattern 'INPLAYCOMMIT.*applied=1' | Where-Object { $_.Line -match 'committed=1' } | Measure-Object).Count)
$r+=('INPLAYCOMMIT haveStop field present='+(C 'haveStop='))
$r+=('SUPPRESSED total='+(C 'SUPPRESSED')+' opp=0 higher=1='+(Select-String -LiteralPath $j -Pattern 'SUPPRESSED' | Where-Object { $_.Line -match 'opp=0' -and $_.Line -match 'higher=1' } | Measure-Object).Count)
$r+=('ANCHOR_SUPERSEDE='+(C 'ANCHOR_SUPERSEDE'))
$r+=('MTEXIT='+((Select-String -LiteralPath $j -Pattern 'MTEXIT').Line -join '|'))
$r+=('MTSNAP_COUNT='+(C 'MTSNAP'))
$r | Set-Content -LiteralPath $out
Get-Content -LiteralPath $out
