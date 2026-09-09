# tabulate_161o.ps1 - T161O (P-EXITMODEL) tabulation from the archived segment
$j   = 'c:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\SRJ_FlowNexus_Local\06_HANDOFFS\T161O_JOURNAL.log'
$out = 'c:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\SRJ_FlowNexus_Local\06_HANDOFFS\T161O_TABULATION.txt'
$ea = [System.IO.File]::ReadAllLines($j)
$O = New-Object System.Collections.Generic.List[string]
$O.Add('T161O TABULATION - P-EXITMODEL verification (source: T161O_JOURNAL.log segment)')
$O.Add('scope: MT_EXIT_SCOPE=MT_SCOPE_FAMILY_POC (the six family POC lines + the anchor line); MT_HTF_EXIT=true')
$O.Add('')
$O.Add('--- GATE LINES (verbatim) ---')
$ea | Where-Object { $_ -match 'WS161_LOAD|WS161_CENSUS|BIASCENSUS_FINAL|ZONECENSUS_FINAL|final balance|Test passed' } | ForEach-Object { $O.Add($_) }
$O.Add('')
$O.Add('--- SIGNALS (verbatim) ---')
$O.Add(('SIGNAL_COUNT=' + @($ea | Where-Object { $_ -match 'SRJ SIGNAL' }).Count))
$ea | Where-Object { $_ -match 'SRJ SIGNAL' } | ForEach-Object { $O.Add($_) }
$O.Add('')
$O.Add('--- EXIT PHASE (the new P-EXITMODEL lines) ---')
$O.Add(('MTSNAP_COUNT=' + @($ea | Where-Object { $_ -match 'MTSNAP' }).Count))
$ea | Where-Object { $_ -match 'MTSNAP' } | ForEach-Object { $O.Add($_) }
$O.Add(('MTCOLLISION_COUNT=' + @($ea | Where-Object { $_ -match 'MTCOLLISION' }).Count))
$O.Add(('MTEXIT_COUNT=' + @($ea | Where-Object { $_ -match 'MTEXIT' }).Count))
$ea | Where-Object { $_ -match 'MTEXIT' } | ForEach-Object { $O.Add($_) }
$O.Add(('EXIT_ALERT_COUNT=' + @($ea | Where-Object { $_ -match 'Alert: .*SRJ EXIT' }).Count))
$ea | Where-Object { $_ -match 'Alert: .*SRJ EXIT' } | ForEach-Object { $O.Add($_) }
$O.Add(('EXITVERDICT_ROWS=' + @($ea | Where-Object { $_ -match 'EXITVERDICT' }).Count))
$O.Add(('EXITCENSUS_ROWS=' + @($ea | Where-Object { $_ -match 'EXITCENSUS' }).Count))
$O.Add(('EXITCENSUS_BREAK_VERDICTS=' + @($ea | Where-Object { $_ -match 'EXITCENSUS' -and $_ -match 'verdict=BREAK' }).Count))
$O.Add(('EXITCENSUS_BREAK_ON_TRIGGER=' + @($ea | Where-Object { $_ -match 'EXITCENSUS' -and $_ -match 'verdict=BREAK' -and $_ -match 'trigger=1' }).Count))
$O.Add('')
$O.Add('--- IDENTITY COUNTERS (must match T161N) ---')
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
$O.Add('')
$O.Add('--- G4 EXIT EVIDENCE (verbatim: every EXITCENSUS BREAK row + all EXITVERDICT rows) ---')
$ea | Where-Object { $_ -match 'EXITCENSUS' -and $_ -match 'verdict=BREAK' } | ForEach-Object { $O.Add($_) }
$ea | Where-Object { $_ -match 'EXITVERDICT' } | ForEach-Object { $O.Add($_) }
[System.IO.File]::WriteAllLines($out, $O)
Write-Output ('written: ' + $out)
Write-Output ('lines: ' + (Get-Content -LiteralPath $out).Count)