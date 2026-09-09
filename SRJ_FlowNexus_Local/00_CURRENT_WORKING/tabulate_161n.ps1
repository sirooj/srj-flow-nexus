# tabulate_161n.ps1 - T161N (P-XOBMID AMENDMENT 2) tabulation from the archived segment
$j   = 'c:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\SRJ_FlowNexus_Local\06_HANDOFFS\T161N_JOURNAL.log'
$out = 'c:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\SRJ_FlowNexus_Local\06_HANDOFFS\T161N_TABULATION.txt'
$ea = [System.IO.File]::ReadAllLines($j)
$O = New-Object System.Collections.Generic.List[string]
$O.Add('T161N TABULATION - P-XOBMID AMENDMENT 2 verification (source: T161N_JOURNAL.log segment)')
$O.Add('run: Test passed in 0:29:51.573 | 321404 ticks | 1728 bars | RESULT=PASSED | DONE=2026-09-09 10:17:20')
$O.Add('')
$O.Add('--- GATE LINES (verbatim) ---')
$ea | Where-Object { $_ -match 'WS161_LOAD|WS161_CENSUS|BIASCENSUS_FINAL|ZONECENSUS_FINAL|final balance|Test passed' } | ForEach-Object { $O.Add($_) }
$O.Add('')
$O.Add('--- DERIVED COUNTS ---')
$O.Add(('SIGNAL_COUNT=' + @($ea | Where-Object { $_ -match 'SRJ SIGNAL' }).Count))
$sig = @($ea | Where-Object { $_ -match 'SRJ SIGNAL' }); $sig | ForEach-Object { $O.Add('SIGNAL: ' + $_) }
$O.Add(('WS161_LOAD_COUNT=' + @($ea | Where-Object { $_ -match 'WS161_LOAD' }).Count))
$O.Add(('WS161_MISMATCH_ROWS=' + @($ea | Where-Object { $_ -match 'WS161_MISMATCH' }).Count))
$O.Add(('WS161_FIELD_ROWS=' + @($ea | Where-Object { $_ -match 'WS161_FIELD' }).Count))
$O.Add(('XOB_PROMOCENSUS_COUNT=' + @($ea | Where-Object { $_ -match 'XOB-PROMOCENSUS' }).Count))
$O.Add(('CQD_DIV_VERDICT_TOTAL=' + @($ea | Where-Object { $_ -match 'CQD DIV verdict=' }).Count))
$O.Add(('CQD_p1=' + @($ea | Where-Object { $_ -match 'CQD DIV verdict=\+1' }).Count))
$O.Add(('CQD_p2=' + @($ea | Where-Object { $_ -match 'CQD DIV verdict=\+2' }).Count))
$O.Add(('CQD_m1=' + @($ea | Where-Object { $_ -match 'CQD DIV verdict=-1' }).Count))
$O.Add(('CQD_m2=' + @($ea | Where-Object { $_ -match 'CQD DIV verdict=-2' }).Count))
$O.Add(('OBPROV_code3=' + @($ea | Where-Object { $_ -match 'OBPROV\] code=3 ' }).Count))
$O.Add(('OBPROV_code4=' + @($ea | Where-Object { $_ -match 'OBPROV\] code=4 ' }).Count))
$O.Add(('FRESHCOUNT=' + @($ea | Where-Object { $_ -match 'FRESHCOUNT' }).Count))
$O.Add(('S5_WAIT=' + @($ea | Where-Object { $_ -match 'S5_WAIT' }).Count))
$O.Add(('FRESHSKIP=' + @($ea | Where-Object { $_ -match 'FRESHSKIP' }).Count))
$O.Add(('SUPPRESSED=' + @($ea | Where-Object { $_ -match 'SUPPRESSED' }).Count))
$O.Add(('ABORT=' + @($ea | Where-Object { $_ -match 'ABORT reason' }).Count))
$O.Add(('OBJID_2159_CENSUS_LINES=' + @($ea | Where-Object { $_ -match 'objId=2159' }).Count))
$O.Add(('ID2159_OBPROV_LINES=' + @($ea | Where-Object { $_ -match 'id=2159' -and $_ -match 'OBPROV' }).Count))
$O.Add('')
$O.Add('--- G4 EVIDENCE (verbatim: objId=2159 census + its OBPROV kill + the 14:xx zone landscape) ---')
$ea | Where-Object { $_ -match 'objId=2159' } | ForEach-Object { $O.Add($_) }
$ea | Where-Object { $_ -match 'id=2159' -and $_ -match 'OBPROV' } | ForEach-Object { $O.Add($_) }
$ea | Where-Object { $_ -match 'S3INPLAY' -and $_ -match '2026\.08\.18 14:' } | ForEach-Object { $O.Add($_) }
[System.IO.File]::WriteAllLines($out, $O)
Write-Output ('written: ' + $out)
Write-Output ('lines: ' + (Get-Content -LiteralPath $out).Count)