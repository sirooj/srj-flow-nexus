$seg='c:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\SRJ_FlowNexus_Local\06_HANDOFFS\RECON2-SLREF2_JOURNAL.log'
$L = Get-Content -LiteralPath $seg
'--- SLREF2 SIGNAL lines ---'
@($L | Where-Object { $_ -match 'ALERT SRJ SIGNAL' })
'--- SLREF2 SUPPRESSED split ---'
'SUPP_TOTAL=' + @($L | Where-Object { $_ -match 'SUPPRESSED ' }).Count
'SUPP_opp0_higher1=' + @($L | Where-Object { $_ -match 'SUPPRESSED .*opp=0 higher=1' }).Count
'SUPP_opp1=' + @($L | Where-Object { $_ -match 'SUPPRESSED .*opp=1' }).Count
'--- SLREF2 ABORT tally ---'
$ab=@($L | Where-Object { $_ -match 'ABORT reason=' })
'ABORT_TOTAL=' + $ab.Count
$ab | ForEach-Object { if($_ -match 'ABORT reason=(\w+)'){ $Matches[1] } } | Group-Object | Sort-Object Count -Descending | ForEach-Object { $_.Name + '=' + $_.Count }
'--- SLREF2 misc counts ---'
'FRESHSKIP=' + @($L | Where-Object { $_ -match 'FRESHSKIP' }).Count
'CONFIRMPOLL=' + @($L | Where-Object { $_ -match 'CONFIRMPOLL' }).Count
'CONFIRM_PREBIND=' + @($L | Where-Object { $_ -match 'CONFIRM_PREBIND bar' }).Count
'CONFIRM_DIV_WAIT=' + @($L | Where-Object { $_ -match 'CONFIRM_DIV_WAIT' }).Count
'STRUCTFAIL=' + @($L | Where-Object { $_ -match 'CONFIRM_STRUCT_FAIL' }).Count
'TP_RR_FAIL_LATCH=' + @($L | Where-Object { $_ -match 'TP_RR_FAIL_LATCH' }).Count
'FRESHCOUNT_PRE=' + @($L | Where-Object { $_ -match 'FRESHCOUNT #.*scope=pre' }).Count
'FRESHCOUNT_POST=' + @($L | Where-Object { $_ -match 'FRESHCOUNT #.*scope=post' }).Count
'CQD_DIV_TOTAL=' + @($L | Where-Object { $_ -match 'CQD DIV verdict=' }).Count
$cd=@($L | Where-Object { $_ -match 'CQD DIV verdict=' })
'CQD_p1=' + @($cd | Where-Object { $_ -match 'verdict=\+1\b' }).Count
'CQD_p2=' + @($cd | Where-Object { $_ -match 'verdict=\+2\b' }).Count
'CQD_m1=' + @($cd | Where-Object { $_ -match 'verdict=-1\b' }).Count
'CQD_m2=' + @($cd | Where-Object { $_ -match 'verdict=-2\b' }).Count
'MTSNAP_N=' + @($L | Where-Object { $_ -match 'MTSNAP ' }).Count
'MTEXIT_N=' + @($L | Where-Object { $_ -match 'MTEXIT ' }).Count
@($L | Where-Object { $_ -match 'MTEXIT ' })
