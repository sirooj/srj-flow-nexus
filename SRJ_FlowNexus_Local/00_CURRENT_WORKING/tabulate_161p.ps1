# tabulate_161p.ps1 - T161P (P-SCOPE34: the 2-of-3 kill window scoped to pre-confirmation) tabulation
$j   = 'c:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\SRJ_FlowNexus_Local\06_HANDOFFS\T161P_JOURNAL.log'
$out = 'c:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\SRJ_FlowNexus_Local\06_HANDOFFS\T161P_TABULATION.txt'
$ea = [System.IO.File]::ReadAllLines($j)
$O = New-Object System.Collections.Generic.List[string]
$O.Add('T161P TABULATION - P-SCOPE34 verification (source: T161P_JOURNAL.log segment)')
$O.Add('rule: the 2-of-3 adverse kill runs PRE-CONFIRMATION ONLY; at the gate-check (post-confirming close) only the three-flag conjunction (= the bias flip) cancels')
$O.Add('')
$O.Add('--- GATE LINES (verbatim) ---')
$ea | Where-Object { $_ -match 'WS161_LOAD|WS161_CENSUS|BIASCENSUS_FINAL|ZONECENSUS_FINAL|final balance|Test passed' } | ForEach-Object { $O.Add($_) }
$O.Add('')
$O.Add('--- SIGNALS (verbatim; the identity base = T161O) ---')
$O.Add(('SIGNAL_COUNT=' + @($ea | Where-Object { $_ -match 'SRJ SIGNAL' }).Count))
$ea | Where-Object { $_ -match 'SRJ SIGNAL' } | ForEach-Object { $O.Add($_) }
$O.Add('')
$O.Add('--- EXIT PHASE (must reproduce T161O verbatim) ---')
$O.Add(('MTSNAP_COUNT=' + @($ea | Where-Object { $_ -match 'MTSNAP' }).Count))
$ea | Where-Object { $_ -match 'MTSNAP' } | ForEach-Object { $O.Add($_) }
$O.Add(('MTEXIT_COUNT=' + @($ea | Where-Object { $_ -match 'MTEXIT' }).Count))
$ea | Where-Object { $_ -match 'MTEXIT' } | ForEach-Object { $O.Add($_) }
$O.Add(('EXIT_ALERT_COUNT=' + @($ea | Where-Object { $_ -match 'Alert: .*SRJ EXIT' }).Count))
$O.Add(('EXITCENSUS_ROWS=' + @($ea | Where-Object { $_ -match 'EXITCENSUS' }).Count))
$O.Add(('EXITCENSUS_BREAK_ON_TRIGGER=' + @($ea | Where-Object { $_ -match 'EXITCENSUS' -and $_ -match 'verdict=BREAK' -and $_ -match 'trigger=1' }).Count))
$O.Add('')
$O.Add('--- THE SCOPING FIX EVIDENCE ---')
$O.Add(('FRESHCOUNT_TOTAL=' + @($ea | Where-Object { $_ -match 'FRESHCOUNT' }).Count))
$O.Add(('FRESHCOUNT_pre=' + @($ea | Where-Object { $_ -match 'FRESHCOUNT' -and $_ -match 'scope=pre' }).Count))
$O.Add(('FRESHCOUNT_post=' + @($ea | Where-Object { $_ -match 'FRESHCOUNT' -and $_ -match 'scope=post' }).Count))
$O.Add(('FRESHCOUNT_post_ABORT=' + @($ea | Where-Object { $_ -match 'FRESHCOUNT' -and $_ -match 'scope=post' -and $_ -match 'verdict=ABORT' }).Count))
$O.Add(('FRESHCOUNT_post_CONJUNCTION=' + @($ea | Where-Object { $_ -match 'FRESHCOUNT' -and $_ -match 'scope=post' -and $_ -match 'obDead=1 fvgDead=1 oppFvg=1' }).Count))
$ea | Where-Object { $_ -match 'FRESHCOUNT' -and $_ -match 'scope=post' } | Select-Object -First 40 | ForEach-Object { $O.Add($_) }
$O.Add('')
$O.Add('--- IDENTITY COUNTERS (base = T161O) ---')
$O.Add(('WS161_LOAD_COUNT=' + @($ea | Where-Object { $_ -match 'WS161_LOAD' }).Count))
$O.Add(('WS161_MISMATCH_ROWS=' + @($ea | Where-Object { $_ -match 'WS161_MISMATCH' }).Count))
$O.Add(('WS161_FIELD_ROWS=' + @($ea | Where-Object { $_ -match 'WS161_FIELD' }).Count))
$O.Add(('XOB_PROMOCENSUS_COUNT=' + @($ea | Where-Object { $_ -match 'XOB-PROMOCENSUS' }).Count))
$O.Add(('CQD_DIV_VERDICT_TOTAL=' + @($ea | Where-Object { $_ -match 'CQD DIV verdict=' }).Count))
$O.Add(('CQD_p1=' + @($ea | Where-Object { $_ -match 'CQD DIV verdict=\+1' }).Count))
$O.Add(('CQD_p2=' + @($ea | Where-Object { $_ -match 'CQD DIV verdict=\+2' }).Count))
$O.Add(('CQD_m1=' + @($ea | Where-Object { $_ -match 'CQD DIV verdict=-1' }).Count))
$O.Add(('CQD_m2=' + @($ea | Where-Object { $_ -match 'CQD DIV verdict=-2' }).Count))
$O.Add(('FRESHSKIP=' + @($ea | Where-Object { $_ -match 'FRESHSKIP' }).Count))
$O.Add(('SUPPRESSED=' + @($ea | Where-Object { $_ -match 'SUPPRESSED' }).Count))
$O.Add(('ABORT=' + @($ea | Where-Object { $_ -match 'ABORT reason' }).Count))
[System.IO.File]::WriteAllLines($out, $O)
Write-Output ('written: ' + $out)
Write-Output ('lines: ' + (Get-Content -LiteralPath $out).Count)