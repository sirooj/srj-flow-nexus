# tabulate_recon23_stage2.ps1 - one streaming pass over the RECON23 archive:
# SEL61* + SEL53 extracts, finals, family counts, width max (same method as RECON22).
$Hand='C:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\SRJ_FlowNexus_Local\06_HANDOFFS'
$arc=Join-Path $Hand 'RECON23-STAGE2_JOURNAL.log'
$s61=Join-Path $Hand 'RECON23_SEL61.txt'
$s53=Join-Path $Hand 'RECON23_SEL53.txt'
$fin=Join-Path $Hand 'RECON23_FINALS.txt'
$fs=[System.IO.File]::Open($arc,'Open','Read','ReadWrite')
$sr=New-Object System.IO.StreamReader($fs)
$o61=New-Object System.Collections.Generic.List[string]
$o53=New-Object System.Collections.Generic.List[string]
$of=New-Object System.Collections.Generic.List[string]
$keys=@('SLIMB fields=19','SLIMBWALK fields=27','SLIMBWALKF fields=25','SLIMBR bar=','SEL52CTX seq=','[SRJ-EA] SEL52 seq=','SEL57ROW ex=','SEL58T ex=','SEL60LIMB ex=','SEL60DISC ex=','SUPPRESSED bar=','SEL54BAR bar=','SEL55 ','SLEXT1 fields=29','SLEXT45 fields=10','SLSEP846 ','SLEXT47 fields=12','SLADDER ','ORIGINREG fields=23','ALERT SRJ SIGNAL','OrderSend','SEL61SRC ','SEL61SEAT ','SEL61SIDE ','SEL61PROBE ','SEL60END ','SEL58END ','SEL53_FINAL ','SEL52_FINAL ')
$counts=@{}; foreach($k in $keys){ $counts[$k]=0 }
$maxLen=0; $maxContent=0; [long]$n=0
while($null -ne ($L=$sr.ReadLine())){
  $n++; $llen=$L.Length; if($llen -gt $maxLen){ $maxLen=$llen }
  $ix=$L.IndexOf('[SRJ-EA]'); if($ix -ge 0){ $cl=$L.Length-$ix; if($cl -gt $maxContent){ $maxContent=$cl } }
  if($L -match '\[SRJ-EA\] SEL61'){ $o61.Add($L) }
  if($L -match '\[SRJ-EA\] SEL53( |_FINAL)'){ $o53.Add($L) }
  if($L -match '\[SRJ-EA\] (SEL53_FINAL|SEL52_FINAL|SEL54_FINAL|SEL55_FINAL|SEL56_FINAL|SEL57END|SEL58END|SEL60DISCEND|SEL61PROBEEND|SEL61INV|SEL61OVR|SEL61INDEP|SEL61SCOPE|SEL61SRCEND|SEL61LIVE|SEL61SUMMARY|SLIMBR_DECISION|SLADDER_DECISION|SLMEMO_CENSUS|BLACKOUT_CENSUS|SIGMAP |FRAME_NOTE|BIASCENSUS_FINAL|ZONECENSUS_FINAL|WS161_CENSUS|CQDRECHECK)'){ $of.Add($L) }
  foreach($k in $keys){ if($L.Contains($k)){ $counts[$k]++ } }
}
$sr.Close(); $fs.Close()
[System.IO.File]::WriteAllLines($s61,$o61,(New-Object System.Text.UTF8Encoding($true)))
[System.IO.File]::WriteAllLines($s53,$o53,(New-Object System.Text.UTF8Encoding($true)))
[System.IO.File]::WriteAllLines($fin,$of,(New-Object System.Text.UTF8Encoding($true)))
'ARCH_LINES=' + $n
'SEL61_LINES=' + $o61.Count
'SEL53_LINES=' + $o53.Count
'FINALS_LINES=' + $of.Count
'MAXLEN=' + $maxLen
'MAXCONTENT=' + $maxContent
foreach($k in $keys){ 'COUNT[' + $k + ']=' + $counts[$k] }
