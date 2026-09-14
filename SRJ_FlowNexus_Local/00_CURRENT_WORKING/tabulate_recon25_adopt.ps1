$a='c:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\SRJ_FlowNexus_Local\06_HANDOFFS\RECON25-ADOPT_JOURNAL.log'
$o='c:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\SRJ_FlowNexus_Local\06_HANDOFFS\RECON25_COUNTS.txt'
function C($p){ (Select-String -LiteralPath $a -Pattern $p -SimpleMatch | Measure-Object).Count }
$r = @()
$r += "LINES=" + (Get-Content -LiteralPath $a | Measure-Object -Line).Lines
$r += "O1BARS=" + (C "[SRJ-EA] O1BARS") + " O1PAT=" + (C "[SRJ-EA] O1PAT") + " O1ELIG=" + (C "[SRJ-EA] O1ELIG")
$r += "O1BUF=" + (C "[SRJ-EA] O1BUF") + " O1WALK=" + (C "[SRJ-EA] O1WALK") + " O1DISC=" + (C "[SRJ-EA] O1DISC")
$r += "SIGNALS=" + (C "ALERT SRJ SIGNAL") + " SEL60END=" + (C "SEL60END") + " SEL55_FINAL=" + (C "SEL55_FINAL")
$r += "SLIMB=" + (C "[SRJ-EA] SLIMB fields=") + " SLIMBWALK=" + (C "[SRJ-EA] SLIMBWALK fields=") + " SLIMBR_ROWS=" + (C "SLIMBR")
$r += "SEL52CTX=" + (C "SEL52CTX seq=") + " SEL61SRC=" + (C "SEL61SRC") + " SUPPRESSED=" + (C "[SRJ-EA] SUPPRESSED bar=")
$r += "SLEXT47=" + (C "SLEXT47 fields=") + " SLMEMO=" + (C "[SRJ-EA] SLMEMO bar=") + " ORDERSEND_SEG=" + (C "SrjOrderEmit")
$r += "TESTPASSED=" + (C "Test passed in") + " SELHALT=" + (C "SELHALT")
$max = 0; foreach($ln in [System.IO.File]::ReadLines($a)){ if($ln.Length -gt $max){ $max = $ln.Length } }
$r += "MAXLEN=" + $max
$r | Set-Content -LiteralPath $o -Encoding UTF8
$r -join "`n"
