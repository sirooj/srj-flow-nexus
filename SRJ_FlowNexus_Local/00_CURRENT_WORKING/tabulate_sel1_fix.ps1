$W='C:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\SRJ_FlowNexus_Local\06_HANDOFFS'
$j=Join-Path $W 'RECON20-SEL1_JOURNAL_PARTIAL.log'
function C($pat){ (Select-String -LiteralPath $j -Pattern $pat | Measure-Object).Count }
$r=@()
$r+=('CTX_SAMPLE='+(((Select-String -LiteralPath $j -Pattern '\[SRJ-EA\] SEL52CTX seq=') | Select-Object -First 2 | ForEach-Object { $_.Line }) -join ' || '))
$r+=('SEL52CTX_SITE='+(((Select-String -LiteralPath $j -Pattern '\[SRJ-EA\] SEL52CTX seq=\d+ bar=\S+ \S+ site=(\S+)') | ForEach-Object { $_.Matches[0].Groups[1].Value } | Group-Object | ForEach-Object { $_.Name+'='+$_.Count }) -join ' '))
$r+=('SEL52CTX_HALT='+(((Select-String -LiteralPath $j -Pattern 'halt=(\S+)$') | Where-Object { $_.Line -match 'SEL52CTX' } | ForEach-Object { $_.Matches[0].Groups[1].Value } | Group-Object | ForEach-Object { $_.Name+'='+$_.Count }) -join ' '))
$r+=('SEL52CTX_MAXLEN='+(((Select-String -LiteralPath $j -Pattern '\[SRJ-EA\] SEL52CTX seq=') | ForEach-Object { $_.Line.Length } | Measure-Object -Maximum).Maximum))
$r+=('SEL52CTX_TRUNC='+(C '\[SRJ-EA\] SEL52CTX seq=.{500,}'))
$r+=('SEL55_ROWS='+(((Select-String -LiteralPath $j -Pattern '\[SRJ-EA\] SEL55 ex=') | ForEach-Object { $_.Line }) -join ' || '))
$r+=('SEL55_MAXLEN='+(((Select-String -LiteralPath $j -Pattern '\[SRJ-EA\] SEL55 ex=') | ForEach-Object { $_.Line.Length } | Measure-Object -Maximum).Maximum))
$r+=('SLIMB_BRANCH='+(((Select-String -LiteralPath $j -Pattern '\[SRJ-EA\] SLIMB fields=19.*branch=(\S+)') | ForEach-Object { $_.Matches[0].Groups[1].Value } | Group-Object | ForEach-Object { $_.Name+'='+$_.Count }) -join ' '))
$r+=('SLIMBR_LAST='+(((Select-String -LiteralPath $j -Pattern '\[SRJ-EA\] SLIMBR bar=') | Select-Object -Last 1 | ForEach-Object { $_.Line }) -join ''))
$r+=('S5_CTXR5='+(((Select-String -LiteralPath $j -Pattern '\[SRJ-EA\] SEL52CTX seq=\d+ bar=2026\.09\.07 16:40') | ForEach-Object { $_.Line }) -join ' || '))
$r | Set-Content -LiteralPath (Join-Path $W 'RECON20-SEL1_TABFIX_PARTIAL.txt') -Encoding UTF8
Get-Content -LiteralPath (Join-Path $W 'RECON20-SEL1_TABFIX_PARTIAL.txt')
