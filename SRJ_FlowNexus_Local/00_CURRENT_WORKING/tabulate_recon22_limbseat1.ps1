# tabulate_recon22_limbseat1.ps1 - one streaming pass over the RECON22 archive:
# SEL60* extract + legacy FINALS extract + family counts + width max.
$Hand='C:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\SRJ_FlowNexus_Local\06_HANDOFFS'
$arc=Join-Path $Hand 'RECON22-LIMBSEAT1_JOURNAL.log'
$sel60=Join-Path $Hand 'RECON22_SEL60.txt'
$fin=Join-Path $Hand 'RECON22_FINALS.txt'
$fs=[System.IO.File]::Open($arc,'Open','Read','ReadWrite')
$sr=New-Object System.IO.StreamReader($fs)
$o60=New-Object System.Collections.Generic.List[string]
$of=New-Object System.Collections.Generic.List[string]
$keys=@('SLIMB fields=19','SLIMBWALK fields=27','SLIMBWALKF fields=25','SLIMBR bar=','SEL52CTX seq=','[SRJ-EA] SEL52 seq=','SEL57ROW ex=','SEL58T ex=','SEL60LIMB ex=','SEL60DISC ex=','SUPPRESSED bar=','SEL54BAR bar=','SEL55 ','SLEXT1 fields=29','SLEXT45 fields=10','SLSEP846 ','SLEXT47 fields=12','SLADDER ','ORIGINREG fields=23','ALERT SRJ SIGNAL','OrderSend')
$counts=@{}; foreach($k in $keys){ $counts[$k]=0 }
$maxLen=0; [long]$n=0
while($null -ne ($L=$sr.ReadLine())){
  $n++; $llen=$L.Length; if($llen -gt $maxLen){ $maxLen=$llen }
  if($L -match '\[SRJ-EA\] SEL60'){ $o60.Add($L) }
  if($L -match '\[SRJ-EA\] (SEL53 |SEL53_FINAL|SEL52_FINAL|SEL54_FINAL|SEL55_FINAL|SEL56_FINAL|SEL57END|SEL58END|SEL60DISCEND|SLIMBR_DECISION|SLADDER_DECISION|SLMEMO_CENSUS|BLACKOUT_CENSUS|SIGMAP |FRAME_NOTE|BIASCENSUS_FINAL|ZONECENSUS_FINAL|WS161_CENSUS|CQDRECHECK)'){ $of.Add($L) }
  foreach($k in $keys){ if($L.Contains($k)){ $counts[$k]++ } }
}
$sr.Close(); $fs.Close()
[System.IO.File]::WriteAllLines($sel60,$o60,(New-Object System.Text.UTF8Encoding($true)))
[System.IO.File]::WriteAllLines($fin,$of,(New-Object System.Text.UTF8Encoding($true)))
'ARCH_LINES=' + $n
'SEL60_LINES=' + $o60.Count
'FINALS_LINES=' + $of.Count
'MAXLEN=' + $maxLen
foreach($k in $keys){ 'COUNT[' + $k + ']=' + $counts[$k] }
