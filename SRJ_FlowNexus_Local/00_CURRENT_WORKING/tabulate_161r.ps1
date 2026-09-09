$seg='c:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\SRJ_FlowNexus_Local\06_HANDOFFS\T161R_JOURNAL.log'
$out='c:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\SRJ_FlowNexus_Local\06_HANDOFFS\T161R_TABULATION.txt'
$O = New-Object System.Collections.Generic.List[string]
$O.Add('T161R TABULATION - P-CQDRESTORE verification (source: T161R_JOURNAL.log segment; PRE_JOURNAL_LINES=46943)')
$L = Get-Content -LiteralPath $seg
$O.Add(''); $O.Add('--- TEST COMPLETION ---')
($L | Where-Object { $_ -match 'Test passed|ticks, \d+ bars' }) | ForEach-Object { $O.Add($_) }
$O.Add(''); $O.Add('--- SIGNAL LINES (verbatim) ---')
($L | Where-Object { $_ -match '\[SRJ-EA\].*SIGNAL' }) | ForEach-Object { $O.Add($_) }
($L | Where-Object { $_ -match 'ALERT SRJ' }) | ForEach-Object { $O.Add($_) }
$O.Add('SIGNAL_TRANSITIONS=' + @($L | Where-Object { $_ -match 'S5_GATE_CHECK->SIGNAL' }).Count)
$O.Add(''); $O.Add('--- MANAGED TRADE ---')
$ms=@($L | Where-Object { $_ -match 'MTSNAP ' }); $O.Add('MTSNAP_COUNT=' + $ms.Count); $ms | ForEach-Object { $O.Add($_) }
$mx=@($L | Where-Object { $_ -match 'MTEXIT ' }); $O.Add('MTEXIT_COUNT=' + $mx.Count); $mx | ForEach-Object { $O.Add($_) }
$ev=@($L | Where-Object { $_ -match 'EXITVERDICT ' }); $O.Add('EXITVERDICT_ROWS=' + $ev.Count)
$O.Add('EXITVERDICT_WITH_ANTI=' + @($ev | Where-Object { $_ -match 'anti=' }).Count)
$O.Add('EXITVERDICT_ANTI_MINUS1=' + @($ev | Where-Object { $_ -match 'anti=-1' }).Count)
($ev | Where-Object { $_ -match 'bar=2026\.08\.17 16:4[45]|bar=2026\.08\.20 1[34]:' }) | ForEach-Object { $O.Add($_) }
$O.Add('EXITCENSUS_ROWS=' + @($L | Where-Object { $_ -match 'EXITCENSUS ' }).Count)
$O.Add('MTCOLLISION_COUNT=' + @($L | Where-Object { $_ -match 'MTCOLLISION' }).Count)
$O.Add(''); $O.Add('--- CQD VERDICT STREAM ---')
$cd=@($L | Where-Object { $_ -match 'CQD DIV verdict=' }); $O.Add('CQD_DIV_TOTAL=' + $cd.Count)
$O.Add('CQD_p1=' + @($cd | Where-Object { $_ -match 'verdict=\+1\b' }).Count)
$O.Add('CQD_p2=' + @($cd | Where-Object { $_ -match 'verdict=\+2\b' }).Count)
$O.Add('CQD_m1=' + @($cd | Where-Object { $_ -match 'verdict=-1\b' }).Count)
$O.Add('CQD_m2=' + @($cd | Where-Object { $_ -match 'verdict=-2\b' }).Count)
$O.Add('--- 08.18 14:00-15:05 CQD DIV lines (verbatim) ---')
($cd | Where-Object { $_ -match '2026\.08\.18 1[45]:' }) | ForEach-Object { $O.Add($_) }
$O.Add(''); $O.Add('--- WS161 ---')
($L | Where-Object { $_ -match 'WS161_' }) | ForEach-Object { $O.Add($_) }
$O.Add('WS161_LOAD_COUNT=' + @($L | Where-Object { $_ -match 'WS161_LOAD' }).Count)
$O.Add('WS161_MISMATCH_COUNT=' + @($L | Where-Object { $_ -match 'WS161_MISMATCH' }).Count)
$O.Add('WS161_FIELD_COUNT=' + @($L | Where-Object { $_ -match 'WS161_FIELD' }).Count)
$O.Add(''); $O.Add('--- FLOWLOGIC-DRIVEN CENSUSES ---')
($L | Where-Object { $_ -match 'BIASCENSUS_FINAL|ZONECENSUS_FINAL|HTFCENSUS_19|HTFCENSUS_20|HTFCENSUS_21|HTFCENSUS_SUMMARY|SWINGREPAINT' }) | ForEach-Object { $O.Add($_) }
$O.Add('XOB-PROMOCENSUS_COUNT=' + @($L | Where-Object { $_ -match 'XOB-PROMOCENSUS' }).Count)
$O.Add('OBPROV_code3=' + @($L | Where-Object { $_ -match 'OBPROV\] code=3' }).Count)
$O.Add('OBPROV_code4=' + @($L | Where-Object { $_ -match 'OBPROV\] code=4' }).Count)
$O.Add(''); $O.Add('--- FRESHNESS / ABORTS ---')
$fc=@($L | Where-Object { $_ -match 'FRESHCOUNT #' }); $O.Add('FRESHCOUNT_TOTAL=' + $fc.Count)
$O.Add('FC_pre_ABORT=' + @($fc | Where-Object { $_ -match 'verdict=ABORT scope=pre' }).Count)
$O.Add('FC_pre_HOLD=' + @($fc | Where-Object { $_ -match 'verdict=HOLD scope=pre' }).Count)
$O.Add('FC_post_ABORT=' + @($fc | Where-Object { $_ -match 'verdict=ABORT scope=post' }).Count)
$O.Add('FC_post_HOLD=' + @($fc | Where-Object { $_ -match 'verdict=HOLD scope=post' }).Count)
$O.Add('FRESHSKIP=' + @($L | Where-Object { $_ -match 'FRESHSKIP' }).Count)
$O.Add('SUPPRESSED=' + @($L | Where-Object { $_ -match 'SUPPRESSED' }).Count)
$ab=@($L | Where-Object { $_ -match 'ABORT reason=' }); $O.Add('ABORT_TOTAL=' + $ab.Count); $ab | ForEach-Object { $O.Add($_) }
$O.Add(''); $O.Add('--- REGIMECENSUS ---')
$O.Add('REGIMECENSUS_COUNT=' + @($L | Where-Object { $_ -match 'REGIMECENSUS' }).Count)
($L | Where-Object { $_ -match 'REGIMECENSUS #(13|37) ' }) | ForEach-Object { $O.Add($_) }
$O.Add(''); $O.Add('--- XOB 2159 LIFECYCLE ---')
($L | Where-Object { $_ -match 'id=2159' }) | ForEach-Object { $O.Add($_) }
$O | Set-Content -LiteralPath $out -Encoding UTF8
"WROTE $out lines=" + $O.Count
