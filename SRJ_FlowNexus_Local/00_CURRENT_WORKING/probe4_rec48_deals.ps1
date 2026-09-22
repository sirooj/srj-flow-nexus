$Seg = 'C:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\SRJ_FlowNexus_Local\06_HANDOFFS\RECON48-EXT1LIVE-V30_JOURNAL.log'
$L = [System.IO.File]::ReadAllLines($Seg)
$d1 = 0; $d2 = 0; $o1 = 0; $o2 = 0
foreach ($x in $L) {
  if ($x.Contains('deal performed')) { $d1++ }
  if ($x.Contains('order performed')) { $o1++ }
}
foreach ($x in $L) {
  if ($x -cmatch 'deal performed') { $d2++ }
  if ($x -cmatch 'order performed') { $o2++ }
}
echo ('deal-p1=' + $d1 + ' deal-p2=' + $d2 + ' order-p1=' + $o1 + ' order-p2=' + $o2)
