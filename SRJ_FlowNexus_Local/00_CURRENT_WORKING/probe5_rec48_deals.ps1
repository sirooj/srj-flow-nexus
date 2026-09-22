$Seg = 'C:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\SRJ_FlowNexus_Local\06_HANDOFFS\RECON48-EXT1LIVE-V30_JOURNAL.log'
$L = [System.IO.File]::ReadAllLines($Seg)
foreach ($x in $L) {
  if ($x.Contains('deal performed') -or $x.Contains('order performed')) { echo $x }
}
