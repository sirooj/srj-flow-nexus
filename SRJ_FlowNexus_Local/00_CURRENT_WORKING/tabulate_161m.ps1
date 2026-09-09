# tabulate_161m.ps1 - T161M (P-XOBMID) tabulation from the archived journal segment
$j   = 'c:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\SRJ_FlowNexus_Local\06_HANDOFFS\T161M_JOURNAL.log'
$out = 'c:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\SRJ_FlowNexus_Local\06_HANDOFFS\T161M_TABULATION.txt'
$ea = [System.IO.File]::ReadAllLines($j)
$O = New-Object System.Collections.Generic.List[string]
$O.Add('T161M TABULATION - P-XOBMID verification (source: T161M_JOURNAL.log segment)')
$O.Add('run: Test passed in 0:28:55.776 | 321404 ticks | 1728 bars | RESULT=PASSED | DONE=2026-09-09 09:14:36')
$O.Add('')
$O.Add('--- GATE LINES (verbatim) ---')
$ea | Where-Object { $_ -match 'WS161_LOAD|WS161_CENSUS|BIASCENSUS_FINAL|ZONECENSUS_FINAL|final balance|Test passed' } | ForEach-Object { $O.Add($_) }
$O.Add('')
$O.Add('--- DERIVED COUNTS ---')
$O.Add(('SIGNAL_COUNT=' + @($ea | Where-Object { $_ -match 'SRJ SIGNAL' }).Count))
$sig = @($ea | Where-Object { $_ -match 'SRJ SIGNAL' }); $sig | ForEach-Object { $O.Add('SIGNAL: ' + $_) }
$O.Add(('WS161_LOAD_COUNT=' + @($ea | Where-Object { $_ -match 'WS161_LOAD' }).Count))
$O.Add(('WS161_MISMATCH_ROWS=' + @($ea | Where-Object { $_ -match 'WS161_MISMATCH' }).Count))
$O.Add(('WS161_CENSUS_LINES=' + @($ea | Where-Object { $_ -match 'WS161_CENSUS' }).Count))
$O.Add(('WS161_FIELD_ROWS=' + @($ea | Where-Object { $_ -match 'WS161_FIELD' }).Count))
$O.Add(('BIASCENSUS_LINES=' + @($ea | Where-Object { $_ -match 'BIASCENSUS_FINAL' }).Count))
$O.Add(('ZONECENSUS_LINES=' + @($ea | Where-Object { $_ -match 'ZONECENSUS_FINAL' }).Count))
$O.Add(('XOB_PROMOCENSUS_COUNT=' + @($ea | Where-Object { $_ -match 'XOB-PROMOCENSUS' }).Count))
$O.Add(('CQD_DIV_VERDICT_TOTAL=' + @($ea | Where-Object { $_ -match 'CQD DIV verdict=' }).Count))
$O.Add(('CQD_p1=' + @($ea | Where-Object { $_ -match 'CQD DIV verdict=\+1' }).Count))
$O.Add(('CQD_p2=' + @($ea | Where-Object { $_ -match 'CQD DIV verdict=\+2' }).Count))
$O.Add(('CQD_m1=' + @($ea | Where-Object { $_ -match 'CQD DIV verdict=-1' }).Count))
$O.Add(('CQD_m2=' + @($ea | Where-Object { $_ -match 'CQD DIV verdict=-2' }).Count))
$O.Add(('FRESHCOUNT=' + @($ea | Where-Object { $_ -match 'FRESHCOUNT' }).Count))
$O.Add(('FRESHSKIP=' + @($ea | Where-Object { $_ -match 'FRESHSKIP' }).Count))
$O.Add(('SUPPRESSED=' + @($ea | Where-Object { $_ -match 'SUPPRESSED' }).Count))
$O.Add(('S5_WAIT=' + @($ea | Where-Object { $_ -match 'S5_WAIT' }).Count))
$O.Add(('ABORT=' + @($ea | Where-Object { $_ -match 'ABORT reason' }).Count))
$O.Add(('OBJID_2159_OCCURRENCES=' + @($ea | Where-Object { $_ -match 'objId=2159' }).Count))
$O.Add('')
$O.Add('--- G4 EVIDENCE (verbatim: every id=2159 line in the segment) ---')
$ea | Where-Object { $_ -match 'id=2159' } | ForEach-Object { $O.Add($_) }
[System.IO.File]::WriteAllLines($out, $O)
Write-Output ('written: ' + $out)
Write-Output ('lines: ' + (Get-Content -LiteralPath $out).Count)