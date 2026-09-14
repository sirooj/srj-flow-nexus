$T='C:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06'
$log13=Join-Path $T 'Tester\logs\20260913.log'
$log14=Join-Path $T 'Tester\logs\20260914.log'
$W='C:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\SRJ_FlowNexus_Local\06_HANDOFFS'
$out=Join-Path $W 'RECON20-SEL1_JOURNAL_PARTIAL.log'
$tab=Join-Path $W 'RECON20-SEL1_TABULATION_PARTIAL.txt'
$PRE=172665
# Manual completion protocol (wrapper UNDETERMINED, midnight split):
# segment = 13-log (PRE+1..EOF) + 14-log (1..EOF). Lock-tolerant shared read.
$fs13=[System.IO.File]::Open($log13,[System.IO.FileMode]::Open,[System.IO.FileAccess]::Read,[System.IO.FileShare]::ReadWrite)
$sr13=New-Object System.IO.StreamReader($fs13)
$txt13=$sr13.ReadToEnd(); $sr13.Close(); $fs13.Close()
$all13=@($txt13 -split "`r?`n")
if($all13.Count -gt 0 -and $all13[$all13.Count-1] -eq ''){ $all13=$all13[0..($all13.Count-2)] }
$seg13=@($all13[$PRE..($all13.Count-1)])
$fs14=[System.IO.File]::Open($log14,[System.IO.FileMode]::Open,[System.IO.FileAccess]::Read,[System.IO.FileShare]::ReadWrite)
$sr14=New-Object System.IO.StreamReader($fs14)
$txt14=$sr14.ReadToEnd(); $sr14.Close(); $fs14.Close()
$seg14=@($txt14 -split "`r?`n")
if($seg14.Count -gt 0 -and $seg14[$seg14.Count-1] -eq ''){ $seg14=$seg14[0..($seg14.Count-2)] }
$all=$seg13+$seg14
$all | Set-Content -LiteralPath $out -Encoding UTF8
$n13=$seg13.Count; $n14=$seg14.Count; $n=$all.Count
'ARCH13_LINES='+$n13
'ARCH14_LINES='+$n14
'ARCH_TOTAL='+$n
'ARCH_FIRST13='+($seg13[0])
'ARCH_FIRST14='+($seg14[0])
'ARCH_LAST='+($all[$n-1])
$h=(Get-FileHash -LiteralPath $out -Algorithm SHA256).Hash
'ARCH_SHA256='+$h
function C($pat){ (Select-String -LiteralPath $out -Pattern $pat | Measure-Object).Count }
function L($pat){ ((Select-String -LiteralPath $out -Pattern $pat).Line -join '|') }
$r=@()
$r+=('TEST_PASSED='+(C 'Test passed in'))
$r+=('CONN_CLOSED='+(C 'connection closed'))
$r+=('SELHALT='+(L '\[SRJ-EA\] SELHALT'))
$r+=('SEL52CTX_TOTAL='+(C '\[SRJ-EA\] SEL52CTX seq='))
$r+=('SEL52CTX_SITE='+(((Select-String -LiteralPath $out -Pattern '\[SRJ-EA\] SEL52CTX seq=\d+ bar=\S+ site=(\S+)') | ForEach-Object { $_.Matches[0].Groups[1].Value } | Group-Object | ForEach-Object { $_.Name+'='+$_.Count }) -join ' '))
$r+=('SEL52CTX_HALT='+(((Select-String -LiteralPath $out -Pattern '\[SRJ-EA\] SEL52CTX seq=\d+.*halt=(\S+)') | ForEach-Object { $_.Matches[0].Groups[1].Value } | Group-Object | ForEach-Object { $_.Name+'='+$_.Count }) -join ' '))
$r+=('SEL55_TOTAL='+(C '\[SRJ-EA\] SEL55 ex='))
$r+=('SEL55_EX='+(((Select-String -LiteralPath $out -Pattern '\[SRJ-EA\] SEL55 ex=(\S+)') | ForEach-Object { $_.Matches[0].Groups[1].Value } | Group-Object | ForEach-Object { $_.Name+'='+$_.Count }) -join ' '))
$r+=('SEL54BAR_TOTAL='+(C '\[SRJ-EA\] SEL54BAR bar='))
$r+=('SEL54STAGE_TOTAL='+(C '\[SRJ-EA\] SEL54STAGE bar='))
$r+=('SEL52_TOTAL='+(C '\[SRJ-EA\] SEL52 seq='))
$r+=('SEL53_TOTAL='+(C '\[SRJ-EA\] SEL53 ex='))
$r+=('SEL53_FINAL='+(L '\[SRJ-EA\] SEL53_FINAL'))
$r+=('SEL52_FINAL='+(L '\[SRJ-EA\] SEL52_FINAL'))
$r+=('SEL54_FINAL='+(L '\[SRJ-EA\] SEL54_FINAL'))
$r+=('SEL55_FINAL='+(L '\[SRJ-EA\] SEL55_FINAL'))
$r+=('SEL56_FINAL='+(L '\[SRJ-EA\] SEL56_FINAL'))
$r+=('SLIMB_TOTAL='+(C '\[SRJ-EA\] SLIMB fields=19'))
$r+=('WALK_OB_TOTAL='+(C '\[SRJ-EA\] SLIMBWALK fields=27'))
$r+=('WALKF_TOTAL='+(C '\[SRJ-EA\] SLIMBWALKF fields=25'))
$r+=('SLIMBR_TOTAL='+(C '\[SRJ-EA\] SLIMBR bar='))
$r+=('SELFRAC_H_M5='+(L '\[SRJ-EA\] SEL fractal handle M5='))
$r+=('SELFRAC_H_H1='+(L '\[SRJ-EA\] SEL fractal handle H1='))
$r+=('LINEWIDTH_SELCTX='+(L 'LINEWIDTH class="SEL52CTX"'))
$r+=('LINEWIDTH_SEL55='+(L 'LINEWIDTH class="SEL55"'))
$r+=('LINEWIDTH_SEL54='+(L 'LINEWIDTH class="SEL54BAR"'))
$r | Set-Content -LiteralPath $tab -Encoding UTF8
Get-Content -LiteralPath $tab
