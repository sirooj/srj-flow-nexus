$seg='c:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\SRJ_FlowNexus_Local\06_HANDOFFS\RECON1B_JOURNAL.log'
$out='c:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\SRJ_FlowNexus_Local\06_HANDOFFS\RECON1B_TABULATION.txt'
$O = New-Object System.Collections.Generic.List[string]
$O.Add('RECON1B TABULATION - the RECON-PILOT Phase-1 baseline run (source: RECON1B_JOURNAL.log segment; PRE_JOURNAL_LINES=0)')
$O.Add('Window: 2026.08.26 00:00 -> 2026.09.10 00.00 requested; ticks synced 2026.06.01 -> 2026.09.08; bars generated 2880 (through 09.08 23:59:59)')
$L = Get-Content -LiteralPath $seg
$O.Add(''); $O.Add('--- TEST COMPLETION ---')
($L | Where-Object { $_ -match 'Test passed|ticks, \d+ bars|testing of Experts' }) | ForEach-Object { $O.Add($_) }
$O.Add(''); $O.Add('--- SIGNAL LINES (verbatim) ---')
($L | Where-Object { $_ -match 'ALERT SRJ SIGNAL|ALERT SRJ STAND' }) | ForEach-Object { $O.Add($_) }
$O.Add('SIGNAL_COUNT=' + @($L | Where-Object { $_ -match 'ALERT SRJ SIGNAL' }).Count)
$O.Add(''); $O.Add('--- MANAGED TRADE (entries/exits, verbatim) ---')
($L | Where-Object { $_ -match 'MTSNAP |MTEXIT |MT_COLLISION|MTCOLLISION' }) | ForEach-Object { $O.Add($_) }
$O.Add(''); $O.Add('--- WS161 ---')
($L | Where-Object { $_ -match 'WS161_' }) | ForEach-Object { $O.Add($_) }
$O.Add('WS161_LOAD_COUNT=' + @($L | Where-Object { $_ -match 'WS161_LOAD' }).Count)
$O.Add('WS161_MISMATCH_COUNT=' + @($L | Where-Object { $_ -match 'WS161_MISMATCH' }).Count)
$O.Add('WS161_FIELD_COUNT=' + @($L | Where-Object { $_ -match 'WS161_FIELD' }).Count)
$O.Add(''); $O.Add('--- FLOWLOGIC-DRIVEN CENSUSES ---')
($L | Where-Object { $_ -match 'BIASCENSUS_FINAL|ZONECENSUS_FINAL|HTFCENSUS_SUMMARY|HTFCENSUS_19|HTFCENSUS_20|HTFCENSUS_21' }) | ForEach-Object { $O.Add($_) }
$O.Add('XOB-PROMOCENSUS_COUNT=' + @($L | Where-Object { $_ -match 'XOB-PROMOCENSUS' }).Count)
$O.Add('OBPROV_code3=' + @($L | Where-Object { $_ -match 'OBPROV\] code=3' }).Count)
$O.Add('OBPROV_code4=' + @($L | Where-Object { $_ -match 'OBPROV\] code=4' }).Count)
$O.Add(''); $O.Add('--- CQD VERDICT STREAM ---')
$cd=@($L | Where-Object { $_ -match 'CQD DIV verdict=' }); $O.Add('CQD_DIV_TOTAL=' + $cd.Count)
$O.Add('CQD_p1=' + @($cd | Where-Object { $_ -match 'verdict=\+1\b' }).Count)
$O.Add('CQD_p2=' + @($cd | Where-Object { $_ -match 'verdict=\+2\b' }).Count)
$O.Add('CQD_m1=' + @($cd | Where-Object { $_ -match 'verdict=-1\b' }).Count)
$O.Add('CQD_m2=' + @($cd | Where-Object { $_ -match 'verdict=-2\b' }).Count)
$O.Add(''); $O.Add('--- PER-DAY LIFECYCLE SKELETONS (seeds / aborts / signals / exits) ---')
foreach($d in @('2026\.08\.28','2026\.08\.31','2026\.09\.01','2026\.09\.02','2026\.09\.04','2026\.09\.07','2026\.09\.08')){
  $O.Add('===== DAY ' + $d + ' =====')
  @($L | Where-Object { $_ -match ('Core 04\t' + $d + ' .*\[SRJ-EA\]') }) |
    Where-Object { $_ -match 'STATE IDLE->S1|ABORT reason|SUPPRESSED |ALERT SRJ SIGNAL|MTSNAP |MTEXIT |SESSION_LIMIT' } |
    ForEach-Object { $O.Add((($_ -split "`t",5)[4]).TrimStart()) }
}
$O.Add(''); $O.Add('--- ABORT REASON TALLY (whole segment) ---')
$ab=@($L | Where-Object { $_ -match '\[SRJ-EA\] \d{4}\.\d{2}\.\d{2} \d{2}:\d{2}:\d{2}\.?\d* ABORT reason=' })
$O.Add('ABORT_TOTAL=' + $ab.Count)
$ab | ForEach-Object { if($_ -match 'ABORT reason=(\w+)'){ $Matches[1] } } | Group-Object | Sort-Object Count -Descending | ForEach-Object { $O.Add($_.Name + '=' + $_.Count) }
$O.Add('FRESHSKIP=' + @($L | Where-Object { $_ -match '\[SRJ-EA\] .*FRESHSKIP' }).Count)
$O.Add('SUPPRESSED=' + @($L | Where-Object { $_ -match '\[SRJ-EA\] .*SUPPRESSED ' }).Count)
$O.Add(''); $O.Add('--- MISS EVIDENCE #257 (08.28 London Daily-VWAP SHORT, verbatim) ---')
($L | Where-Object { $_ -match '2026\.08\.28 10:(00|05|10|15|20|25|30):\d+ .*\[SRJ-EA\] (STATE|CQDRECHECK|ABORT|ALERT)' }) | ForEach-Object { $O.Add((($_ -split "`t",5)[4]).TrimStart()) }
$O.Add(''); $O.Add('--- MISS EVIDENCE #280 (09.04 Yearly-POC suppressions + the 1R kills, verbatim) ---')
($L | Where-Object { $_ -match '2026\.09\.04 .*\[SRJ-EA\] .*(SUPPRESSED bar=2026\.09\.04 15:(35|40|45|50)|SUPPRESSED bar=2026\.09\.04 16:00|2026\.09\.04 16:00:00 ABORT|2026\.09\.04 15:35:00 STATE|2026\.09\.04 09:35:01 ABORT)' }) | ForEach-Object { $O.Add((($_ -split "`t",5)[4]).TrimStart()) }
$O.Add(''); $O.Add('--- REGIMECENSUS ---')
$O.Add('REGIMECENSUS_COUNT=' + @($L | Where-Object { $_ -match 'REGIMECENSUS' }).Count)
$O | Set-Content -LiteralPath $out -Encoding UTF8
"WROTE $out lines=" + $O.Count
