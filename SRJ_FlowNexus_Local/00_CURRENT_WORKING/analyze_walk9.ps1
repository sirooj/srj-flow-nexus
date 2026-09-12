$j='c:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\SRJ_FlowNexus_Local\06_HANDOFFS\RECON9-SWINGIMB2_JOURNAL.log'
$lines=Select-String -LiteralPath $j -Pattern 'SLIMBWALK fields=17' | Select-Object -ExpandProperty Line
$c=@{ALL3=0;TEQB=0;TEQN=0;CARVE=0;EXH=0;UNRES=0;BASEMOVED=0}
$sameTurn=0; $movedWide=0; $carveSkipSeen=0; $maxAbs=0; $n=0
foreach($ln in $lines){
  $n++
  $m=[regex]::Match($ln,'slToday=(\S+) slBase=(\S+) slNuance=(\S+) deltaBasePts=(\S+) deltaNuancePts=(\S+) walkSteps=(\d+) code2Seen=(\d+) exhausted=(-?\d+) skipShift=(-?\d+).*class=(\S+)')
  if(-not $m.Success){ Write-Output ('PARSEFAIL: '+$ln); continue }
  $t=$m.Groups[1].Value; $b=$m.Groups[2].Value; $nu=$m.Groups[3].Value
  $db=[int]$m.Groups[4].Value; $exh=[int]$m.Groups[8].Value; $sk=[int]$m.Groups[9].Value; $cls=$m.Groups[10].Value
  if($sk -ge 0){ $carveSkipSeen++ }
  if($cls -eq 'UNRESOLVED'){ $c.UNRES++; continue }
  if($exh -eq 1){ $c.EXH++; continue }
  $eqB=($b -eq $t); $eqN=($nu -eq $t)
  if($eqB -and $eqN){ $c.ALL3++ }
  elseif($eqB){ $c.TEQB++ }
  elseif($eqN){ $c.TEQN++ }
  else{
    $c.BASEMOVED++
    $ad=[Math]::Abs($db)
    if($ad -gt $maxAbs){ $maxAbs=$ad }
    if($ad -le 1){ $sameTurn++ } else { $movedWide++ }
  }
}
Write-Output ('n='+$n)
Write-Output ('TRUECLASS ALL3='+$c.ALL3+' TEQB='+$c.TEQB+' TEQN='+$c.TEQN+' CARVEprint=see-note BASEMOVED='+$c.BASEMOVED+' EXH='+$c.EXH+' UNRES='+$c.UNRES)
Write-Output ('BASEMOVED: sameTurn_le1pt='+$sameTurn+' wider='+$movedWide+' maxAbsPts='+$maxAbs)
Write-Output ('skipSeen_any='+$carveSkipSeen)
Write-Output 'note: printed class CARVEOUT_FIRED counts carve&&!eqN; TRUE TEQN above = eqN&&!eqB (carve-held); BASEMOVED = walk moved, nuance followed, today equals neither'
