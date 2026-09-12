$j='c:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\SRJ_FlowNexus_Local\06_HANDOFFS\RECON10-SWINGIMB3_JOURNAL.log'
$out='c:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\SRJ_FlowNexus_Local\06_HANDOFFS\RECON10-SWINGIMB3_TABULATION.txt'
function C($pat){ (Select-String -LiteralPath $j -Pattern $pat | Measure-Object).Count }
$r=@()
$r+=('G1 bars/ticks: '+((Select-String -LiteralPath $j -Pattern 'bars generated').Line -join '|'))
$r+=('SIGNAL_COUNT='+(C '\[SRJ-EA\] \d{4}\.\d{2}\.\d{2} \d{2}:\d{2}:\d{2} SIGNAL '))
$r+=('SIGNALS='+((Select-String -LiteralPath $j -Pattern '\[SRJ-EA\] \d{4}\.\d{2}\.\d{2} \d{2}:\d{2}:\d{2} SIGNAL ').Line -join '|'))
$r+=('WS161='+((Select-String -LiteralPath $j -Pattern 'WS161_CENSUS').Line -join '|'))
$r+=('WS161_MISMATCH_ROWS='+((Select-String -LiteralPath $j -Pattern 'WS161_MISMATCH(?!.*mismatch=0)').Count))
$r+=('WS161_FIELD_ROWS='+(C 'WS161_FIELD'))
$r+=('WS161_LOAD='+((Select-String -LiteralPath $j -Pattern 'WS161_LOAD').Line -join '|'))
$r+=('ABORTS: FRESH_OB_DEAD='+(C 'reason=FRESH_OB_DEAD')+' LTF_MISALIGN='+(C 'reason=LTF_MISALIGN')+' SESSION_CLOSED='+(C 'reason=SESSION_CLOSED')+' TP_RR_FAIL='+(C 'reason=TP_RR_FAIL')+' NO_TP_TARGET='+(C 'reason=NO_TP_TARGET')+' NO_SL_REF='+(C 'reason=NO_SL_REF')+' FRESH_OPP_FVG='+(C 'reason=FRESH_OPP_FVG'))
$r+=('BIASCENSUS_FINAL='+((Select-String -LiteralPath $j -Pattern 'BIASCENSUS_FINAL').Line -join '|'))
$r+=('ZONECENSUS_FINAL='+((Select-String -LiteralPath $j -Pattern 'ZONECENSUS_FINAL').Line -join '|'))
$r+=('XOB-PROMOCENSUS='+((Select-String -LiteralPath $j -Pattern 'XOB-PROMOCENSUS').Line -join '|'))
$r+=('CQD_DIV_FIRST: total='+(C 'CQD DIV verdict=')+' +1='+(C 'CQD DIV verdict=\+1')+' +2='+(C 'CQD DIV verdict=\+2')+' -1='+(C 'CQD DIV verdict=-1')+' -2='+(C 'CQD DIV verdict=-2'))
$r+=('CONFIRMPOLL='+(C 'CONFIRMPOLL'))
$r+=('SUPPRESSED total='+(C 'SUPPRESSED'))
$r+=('SLMEMO_CENSUS='+((Select-String -LiteralPath $j -Pattern 'SLMEMO_CENSUS').Line -join '|'))
$r+=('SLMEMO_HIT='+(C 'SLMEMO bar=.*result=HIT')+' SLMEMO_COMPUTE='+(C 'SLMEMO bar=.*result=COMPUTE'))
$r+=('SL_REF_S2POLL='+(C 'SL_REF.*site=S2POLL')+' SL_REF_S3ARM='+(C 'SL_REF.*site=S3ARM')+' SL_REF_S5='+(C 'SL_REF.*site=S5'))
$r+=('SL_STRUCT_S3ARM='+(C 'SL_STRUCT.*site=S3ARM'))
$r+=('INPLAYCOMMIT_APPLIED1='+(C 'INPLAYCOMMIT.*applied=1')+' COMMITTED1='+(C 'INPLAYCOMMIT.*applied=1.*committed=1'))
$r+=('S2POLL_NO_SL_REF='+(C 'S2POLL_NO_SL_REF'))
$r+=('MTEXIT='+((Select-String -LiteralPath $j -Pattern 'MTEXIT').Line -join '|'))
$r+=('MTSNAP_COUNT='+(C 'MTSNAP'))
$r+=('SLIMB_TOTAL='+(C 'SLIMB fields=16'))
$r+=('SLIMB_BADFMT='+(C 'SLIMB (?!fields=16)'))
$r+=('SLIMB_S2POLL='+(C 'SLIMB fields=16.*site=S2POLL')+' SLIMB_S3ARM='+(C 'SLIMB fields=16.*site=S3ARM')+' SLIMB_S5='+(C 'SLIMB fields=16.*site=S5')+' SLIMB_PRE='+(C 'SLIMB fields=16.*branch=PRE'))
$r+=('SLIMB_AVAIL0='+(C 'SLIMB fields=16.*latestAvail=0')+' SLIMB_CHAVAIL0_EXPOSED='+(C 'SLIMB fields=16.*chosenShift=[0-9].*chosenAvail=0'))
$r+=('SLIMB_APEX0_WITH_AVAIL='+(C 'SLIMB fields=16.*latestAvail=1.*latestApexMatch=0'))
$r+=('SLIMB_CHOSEN_NEG='+(C 'SLIMB fields=16.*chosenShift=-1')+' SLIMB_NOOB='+(C 'SLIMB fields=16.*cands=NOOB'))
$r+=('SLIMB_NUANCE: VALID_NOIMB='+(C 'nuanceClass=OB_VALID_LATEST_NOIMB')+' VALID_IMB='+(C 'nuanceClass=OB_VALID_LATEST_IMB')+' DEAD_IMB='+(C 'nuanceClass=OB_DEAD_LATEST_IMB')+' DEAD_NOIMB='+(C 'nuanceClass=OB_DEAD_LATEST_NOIMB')+' UNEVAL='+(C 'nuanceClass=UNEVAL'))
$r+=('SLIMB_LATESTFLAG: f0='+(C 'SLIMB fields=16.*latestFlag=0 ') +'f1='+(C 'SLIMB fields=16.*latestFlag=1 ') +'f2='+(C 'SLIMB fields=16.*latestFlag=2 ') +'f3='+(C 'SLIMB fields=16.*latestFlag=3 ') +'fm1='+(C 'SLIMB fields=16.*latestFlag=-1 '))
$r+=('SLIMB_BRANCH: 1SWING='+(C 'SLIMB fields=16.*branch=1SWING')+' 2SWING='+(C 'SLIMB fields=16.*branch=2SWING'))
$r+=('S5_NO_SL_REF='+(C 'S5_NO_SL_REF'))
$r+=('SWINGIMB_CENSUS='+((Select-String -LiteralPath $j -Pattern 'SWINGIMB_CENSUS').Line -join '|'))
$r+=('SWINGIMB_PROGRESS_COUNT='+(C 'SWINGIMB_PROGRESS'))
$r+=('SWINGIMB_PROGRESS_LAST='+((Select-String -LiteralPath $j -Pattern 'SWINGIMB_PROGRESS' | Select-Object -Last 1).Line -join '|'))
$r+=('SLIMBWALK_TOTAL='+(C 'SLIMBWALK fields=23'))
$r+=('SLIMBWALK_BADFMT='+(C 'SLIMBWALK (?!fields=23)'))
$r+=('SLIMBWALK_CLASS: ALL3='+(C 'SLIMBWALK fields=23.*class=ALL3_EQ')+' TEQB='+(C 'SLIMBWALK fields=23.*class=TODAY_EQ_BASE')+' TEQN='+(C 'SLIMBWALK fields=23.*class=TODAY_EQ_NUANCE')+' BASEMOVED='+(C 'SLIMBWALK fields=23.*class=BASE_MOVED')+' CARVE='+(C 'SLIMBWALK fields=23.*class=CARVEOUT_FIRED')+' EXH='+(C 'SLIMBWALK fields=23.*class=WALK_EXHAUSTED')+' UNEVAL='+(C 'SLIMBWALK fields=23.*class=WALK_UNEVALUABLE')+' UNRES='+(C 'SLIMBWALK fields=23.*class=UNRESOLVED')+' UNCLASS='+(C 'SLIMBWALK fields=23.*class=UNCLASSIFIED'))
$r+=('SLIMBWALK_S5='+(C 'SLIMBWALK fields=23.*site=S5'))
$r+=('SLIMBWALK_SIDEV_GT0='+(C 'SLIMBWALK fields=23.*sideViolations=[1-9]'))
$r+=('SLIMBWALK_CODE3='+(C 'SLIMBWALK fields=23.*code3Seen=[1-9]'))
$r+=('SLIMBWALK_EXTNQ_TOTAL='+(C 'SLIMBWALK fields=23.*extUpdatedByNonQual=[1-9]'))
$r+=('SLIMBR_TOTAL='+(C 'SLIMBR bar='))
$r+=('SLIMBR_STALE='+(C 'SLIMBR bar=.*class=STALE'))
$r+=('SLIMBR_ROWS='+(((Select-String -LiteralPath $j -Pattern 'SLIMBR bar=').Line) -join '|'))
$slimb=@{}
foreach($m in (Select-String -LiteralPath $j -Pattern 'SLIMB fields=16 bar=(\S+ \S+) site=(\S+).*chosenFlag=(-?\d+)')){ $slimb[$m.Matches[0].Groups[1].Value+'|'+$m.Matches[0].Groups[2].Value]=$m.Matches[0].Groups[3].Value }
$xt=@{}; $fals=0; $unmatched=0
foreach($m in (Select-String -LiteralPath $j -Pattern 'SLIMBWALK fields=23 bar=(\S+ \S+) site=(\S+).*class=(\S+)')){
  $k=$m.Matches[0].Groups[1].Value+'|'+$m.Matches[0].Groups[2].Value
  $cls=$m.Matches[0].Groups[3].Value
  if($slimb.ContainsKey($k)){ $cf=$slimb[$k]; $kk='cf='+$cf+' x '+$cls; if($xt.ContainsKey($kk)){$xt[$kk]++}else{$xt[$kk]=1}; if($cf -eq '1' -and $cls -eq 'BASE_MOVED'){ $fals++ } }
  else { $unmatched++ }
}
$r+=('XTAB_CHOSENFLAG_X_CLASS='+((($xt.GetEnumerator() | Sort-Object Name | ForEach-Object { $_.Key+'='+$_.Value }) -join ' ')))
$r+=('XTAB_FALSIFIER_cf1_BASEMOVED='+$fals)
$r+=('XTAB_UNMATCHED_WALK_ROWS='+$unmatched)
$r | Set-Content -LiteralPath $out
Get-Content -LiteralPath $out
