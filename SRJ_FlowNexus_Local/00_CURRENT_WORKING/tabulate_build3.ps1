$seg='c:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\SRJ_FlowNexus_Local\06_HANDOFFS\RECON3-BUILD3_JOURNAL.log'
$out='c:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\SRJ_FlowNexus_Local\06_HANDOFFS\RECON3-BUILD3_TABULATION.txt'
$O = New-Object System.Collections.Generic.List[string]
$O.Add('RECON3-BUILD3 TABULATION - P-BUILD3 verification run')
$O.Add('Source: RECON3-BUILD3_JOURNAL.log segment + RECON3-BUILD3_STATUS.txt')
$L = Get-Content -LiteralPath $seg
$O.Add(''); $O.Add('--- TEST COMPLETION ---')
($L | Where-Object { $_ -match 'Test passed|ticks, \d+ bars' }) | ForEach-Object { $O.Add($_) }
$O.Add(''); $O.Add('--- SIGNAL LINES (verbatim) ---')
($L | Where-Object { $_ -match 'ALERT SRJ SIGNAL' }) | ForEach-Object { $O.Add($_) }
$O.Add('SIGNAL_COUNT=' + @($L | Where-Object { $_ -match 'ALERT SRJ SIGNAL' }).Count)
$O.Add(''); $O.Add('--- ANCHOR SUPERSESSION (verbatim) ---')
($L | Where-Object { $_ -match 'ANCHOR_SUPERSEDE' }) | ForEach-Object { $O.Add($_) }
$O.Add('ANCHOR_SUPERSEDE_COUNT=' + @($L | Where-Object { $_ -match 'ANCHOR_SUPERSEDE' }).Count)
$O.Add(''); $O.Add('--- ANCHOR ELECT (verbatim) ---')
($L | Where-Object { $_ -match 'ANCHOR_ELECT' }) | ForEach-Object { $O.Add($_) }
$O.Add('ANCHOR_ELECT_COUNT=' + @($L | Where-Object { $_ -match 'ANCHOR_ELECT' }).Count)
$O.Add(''); $O.Add('--- MANAGED TRADE ---')
($L | Where-Object { $_ -match 'MTSNAP |MTEXIT ' }) | ForEach-Object { $O.Add($_) }
$O.Add(''); $O.Add('--- WS161 ---')
($L | Where-Object { $_ -match 'WS161_' }) | ForEach-Object { $O.Add($_) }
$O.Add('WS161_LOAD_COUNT=' + @($L | Where-Object { $_ -match 'WS161_LOAD' }).Count)
$O.Add('WS161_MISMATCH_COUNT=' + @($L | Where-Object { $_ -match 'WS161_MISMATCH' }).Count)
$O.Add('WS161_FIELD_COUNT=' + @($L | Where-Object { $_ -match 'WS161_FIELD' }).Count)
$O.Add(''); $O.Add('--- FLOWLOGIC IDENTITIES ---')
($L | Where-Object { $_ -match 'BIASCENSUS_FINAL|ZONECENSUS_FINAL' }) | ForEach-Object { $O.Add($_) }
$O.Add('XOB-PROMOCENSUS_COUNT=' + @($L | Where-Object { $_ -match 'XOB-PROMOCENSUS' }).Count)
$O.Add('OBPROV_code3=' + @($L | Where-Object { $_ -match 'OBPROV\] code=3' }).Count)
$O.Add('OBPROV_code4=' + @($L | Where-Object { $_ -match 'OBPROV\] code=4' }).Count)
$O.Add(''); $O.Add('--- CQD STREAM ---')
$cd=@($L | Where-Object { $_ -match 'CQD DIV verdict=' }); $O.Add('CQD_DIV_TOTAL=' + $cd.Count)
$O.Add('CQD_p1=' + @($cd | Where-Object { $_ -match 'verdict=\+1\b' }).Count)
$O.Add('CQD_p2=' + @($cd | Where-Object { $_ -match 'verdict=\+2\b' }).Count)
$O.Add('CQD_m1=' + @($cd | Where-Object { $_ -match 'verdict=-1\b' }).Count)
$O.Add('CQD_m2=' + @($cd | Where-Object { $_ -match 'verdict=-2\b' }).Count)
$O.Add(''); $O.Add('--- SUPPRESSED / ABORT ---')
$ab=@($L | Where-Object { $_ -match 'ABORT reason=' })
$O.Add('ABORT_TOTAL=' + $ab.Count)
$ab | ForEach-Object { if($_ -match 'ABORT reason=(\w+)'){ $Matches[1] } } | Group-Object | Sort-Object Count -Descending | ForEach-Object { $O.Add($_.Name + '=' + $_.Count) }
$O.Add('SUPPRESSED_TOTAL=' + @($L | Where-Object { $_ -match 'SUPPRESSED ' }).Count)
$O.Add('SUPPRESSED_opp0_higher1=' + @($L | Where-Object { $_ -match 'SUPPRESSED .*opp=0 higher=1' }).Count)
$O.Add('SUPPRESSED_opp1=' + @($L | Where-Object { $_ -match 'SUPPRESSED .*opp=1' }).Count)
$O.Add('FRESHSKIP=' + @($L | Where-Object { $_ -match 'FRESHSKIP' }).Count)
$O.Add('CONFIRMPOLL=' + @($L | Where-Object { $_ -match 'CONFIRMPOLL' }).Count)
$O.Add('CONFIRM_PREBIND=' + @($L | Where-Object { $_ -match 'CONFIRM_PREBIND bar' }).Count)
$O.Add('CONFIRM_DIV_WAIT=' + @($L | Where-Object { $_ -match 'CONFIRM_DIV_WAIT' }).Count)
$O.Add('TP_RR_FAIL_LATCH=' + @($L | Where-Object { $_ -match 'TP_RR_FAIL_LATCH' }).Count)
($L | Where-Object { $_ -match 'TP_RR_FAIL_LATCH' }) | ForEach-Object { $O.Add($_) }
$O.Add('SL_REF_2swing=' + @($L | Where-Object { $_ -match 'SL_REF branch=2-swing' }).Count)
$O.Add('SL_STRUCT=' + @($L | Where-Object { $_ -match 'SL_STRUCT' }).Count)
$O.Add('FRESHCOUNT=' + @($L | Where-Object { $_ -match 'FRESHCOUNT #' }).Count)
$O.Add(''); $O.Add('--- 09-04 DAY SKELETON ---')
@($L | Where-Object { $_ -match '2026\.09\.04 .*\[SRJ-EA\]' } | Where-Object { $_ -match 'ANCHOR_SUPERSEDE|ANCHOR_ELECT|STATE IDLE->S1|ABORT reason|SUPPRESSED |ALERT SRJ SIGNAL|CONFIRM_PREBIND|MTSNAP |MTEXIT ' }) | ForEach-Object { $O.Add((($_ -split "`t",5)[4]).TrimStart()) }
$O.Add(''); $O.Add('--- 08-28 LIFETIME (zero supersede check) ---')
@($L | Where-Object { $_ -match '2026\.08\.28 (09:[34]|10:[03])' } | Where-Object { $_ -match 'ANCHOR_SUPERSEDE|CONFIRM_PREBIND|ALERT SRJ SIGNAL' }) | ForEach-Object { $O.Add((($_ -split "`t",5)[4]).TrimStart()) }
$O | Set-Content -LiteralPath $out -Encoding UTF8
'WROTE lines=' + $O.Count
