$log='c:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\Tester\logs\20260911.log'
$pre=64592
$total=(Get-Content -LiteralPath $log | Measure-Object -Line).Lines
$seg=$total-$pre
Write-Output ("TOTAL="+$total+" PRE="+$pre+" SEG="+$seg)
$out='c:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\SRJ_FlowNexus_Local\06_HANDOFFS\RECON4-FIXS2POLL_JOURNAL.log'
Get-Content -LiteralPath $log | Select-Object -Skip $pre | Set-Content -LiteralPath $out
Get-ChildItem -LiteralPath $out | Select-Object Name,Length
$hits=Select-String -LiteralPath $out -Pattern 'SIGNAL|WS161_CENSUS|WS161_MISMATCH|WS161_FIELD|WS161_LOAD|S2POLL_NO_SL_REF|Test passed|bars generated'
$hits | Measure-Object | Select-Object Count
$hits | Select-Object -First 60 | ForEach-Object { $_.Line }
