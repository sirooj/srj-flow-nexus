$j9='c:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\SRJ_FlowNexus_Local\06_HANDOFFS\RECON9-SWINGIMB2_JOURNAL.log'
$j10='c:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\SRJ_FlowNexus_Local\06_HANDOFFS\RECON10-SWINGIMB3_JOURNAL.log'
$out='c:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\SRJ_FlowNexus_Local\06_HANDOFFS\RECON10_GATE6_JOIN.txt'
function GetWalk($j, $fields){
  $h=@{}
  foreach($m in (Select-String -LiteralPath $j -Pattern ("SLIMBWALK fields=" + $fields + " bar=(\S+ \S+) site=(\S+) dir=(\S+) branch=(\S+) slToday=(\S+) slBase=(\S+) slNuance=(\S+) deltaBasePts=(\S+).*class=(\S+)"))){
    $g=$m.Matches[0].Groups
    $h[$g[1].Value+'|'+$g[2].Value]=@($g[3].Value,$g[4].Value,$g[5].Value,$g[6].Value,$g[7].Value,$g[8].Value,$g[9].Value)
  }
  return $h
}
$w9=GetWalk $j9 '17'
$w10=GetWalk $j10 '23'
$r=@()
$r+=('W9_ROWS='+$w9.Count+' W10_ROWS='+$w10.Count)
$trueDist=@{}; $bm_same=0; $bm_tight=0; $bm_wide=0
$acc_abs=0; $acc_re=0; $acc_term=0; $acc_other=@()
$carveDist=@{}
$unmatched=0
foreach($k in $w9.Keys){
  if(-not $w10.ContainsKey($k)){ $unmatched++; continue }
  $a=$w9[$k]; $b=$w10[$k]
  $dir=$a[0]; $t9s=$a[2]; $b9s=$a[3]; $n9s=$a[4]; $db9=[int]$a[5]
  $eqB=($b9s -ceq $t9s); $eqN=($n9s -ceq $t9s)
  if($eqB -and $eqN){ $tc='ALL3' } elseif($eqB){ $tc='TEQB' } elseif($eqN){ $tc='TEQN' } else { $tc='BASEMOVED' }
  if($trueDist.ContainsKey($tc)){$trueDist[$tc]++}else{$trueDist[$tc]=1}
  if($tc -eq 'TEQN'){ $c=$b[6]; if($carveDist.ContainsKey($c)){$carveDist[$c]++}else{$carveDist[$c]=1} }
  if($tc -eq 'BASEMOVED'){
    $ad=[Math]::Abs($db9)
    $protective = if($dir -eq 'LONG'){ $db9 -lt 0 } else { $db9 -gt 0 }
    if($ad -le 1){ $bm_same++ } else { if($protective){ $bm_wide++ } else { $bm_tight++ } }
    $isContra = (($ad -le 1) -or (-not $protective))
    if($isContra){
    if($b[6] -eq 'WALK_UNEVALUABLE'){ $acc_term++ }
    elseif($b[4] -ceq $b[2]){ $acc_abs++ }
    else {
      $t10=[double]$b[2]; $b10=[double]$b[4]
      $out = if($dir -eq 'LONG'){ ($b10 -lt ($t10 - 0.00001)) } else { ($b10 -gt ($t10 + 0.00001)) }
      if($out){ $acc_re++ } else { $acc_other+=($k+' R10class='+$b[6]) }
    }
    }
  }
}
$r+=('R9_TRUECLASS='+((($trueDist.GetEnumerator() | Sort-Object Name | ForEach-Object { $_.Key+'='+$_.Value }) -join ' ')))
$r+=('R9_BASEMOVED_SPLIT: SAMETURN_le1pt='+$bm_same+' TIGHTER='+$bm_tight+' WIDER_PROTECTIVE='+$bm_wide)
$r+=('GATE6_OF_168: ABSORBED='+$acc_abs+' RERESOLVED='+$acc_re+' TERMINATED='+$acc_term)
foreach($o in $acc_other){ $r+=('GATE6_OTHER: '+$o) }
$r+=('CARVE106_TO_R10='+((($carveDist.GetEnumerator() | Sort-Object Name | ForEach-Object { $_.Key+'='+$_.Value }) -join ' ')))
$r+=('UNMATCHED_KEYS='+$unmatched)
$r | Set-Content -LiteralPath $out
Get-Content -LiteralPath $out
