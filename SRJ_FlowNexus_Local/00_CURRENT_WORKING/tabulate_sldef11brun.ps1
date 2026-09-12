$j='c:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\SRJ_FlowNexus_Local\06_HANDOFFS\RECON11b-SLDEF_JOURNAL.log'
$out='c:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\SRJ_FlowNexus_Local\06_HANDOFFS\RECON11b-SLDEF_TABULATION.txt'
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
$r+=('CQD_DIV_FIRST: total='+(C 'CQD DIV verdict=')+' +1='+(C 'CQD DIV verdict=\+1')+' +2='+(C 'CQD DIV verdict=\+2')+' -1='+(C 'CQD DIV verdict=-1')+' -2='+(C 'CQD DIV verdict=-2'))
$r+=('CONFIRMPOLL='+(C 'CONFIRMPOLL'))
$r+=('SUPPRESSED total='+(C 'SUPPRESSED'))
$r+=('PROMO_LINES='+(C 'PROMO'))
$r+=('PROMO_SAMPLE='+(((Select-String -LiteralPath $j -Pattern 'PROMO' | Select-Object -First 2).Line) -join '|'))
$r+=('SLMEMO_CENSUS='+((Select-String -LiteralPath $j -Pattern 'SLMEMO_CENSUS').Line -join '|'))
$r+=('SLMEMO_HIT='+(C 'SLMEMO bar=.*result=HIT')+' SLMEMO_COMPUTE='+(C 'SLMEMO bar=.*result=COMPUTE'))
$r+=('SL_REF_S2POLL='+(C 'SL_REF.*site=S2POLL')+' SL_REF_S3ARM='+(C 'SL_REF.*site=S3ARM')+' SL_REF_S5='+(C 'SL_REF.*site=S5'))
$r+=('INPLAYCOMMIT_APPLIED1='+(C 'INPLAYCOMMIT.*applied=1')+' COMMITTED1='+(C 'INPLAYCOMMIT.*applied=1.*committed=1'))
$r+=('MTEXIT='+((Select-String -LiteralPath $j -Pattern 'MTEXIT').Line -join '|'))
$r+=('MTSNAP_COUNT='+(C 'MTSNAP'))
$r+=('SLIMB_TOTAL='+(C 'SLIMB fields=19'))
$r+=('SLIMB_BADFMT='+(C 'SLIMB (?!fields=19)'))
$r+=('SLIMB_S2POLL='+(C 'SLIMB fields=19.*site=S2POLL')+' SLIMB_S3ARM='+(C 'SLIMB fields=19.*site=S3ARM')+' SLIMB_S5='+(C 'SLIMB fields=19.*site=S5')+' SLIMB_PRE='+(C 'SLIMB fields=19.*branch=PRE'))
$r+=('SLIMB_AVAIL0='+(C 'SLIMB fields=19.*latestAvail=0')+' SLIMB_CHAVAIL0_EXPOSED='+(C 'SLIMB fields=19.*chosenShift=[0-9].*chosenAvail=0'))
$r+=('SLIMB_APEX0_WITH_AVAIL='+(C 'SLIMB fields=19.*latestAvail=1.*latestApexMatch=0'))
$r+=('SLIMB_CHOSEN_NEG='+(C 'SLIMB fields=19.*chosenShift=-1')+' SLIMB_NOOB='+(C 'SLIMB fields=19.*cands=NOOB'))
$r+=('SLIMB_LATESTFLAG: f0='+(C 'SLIMB fields=19.*latestFlag=0 ') +'f1='+(C 'SLIMB fields=19.*latestFlag=1 ') +'f2='+(C 'SLIMB fields=19.*latestFlag=2 ') +'f3='+(C 'SLIMB fields=19.*latestFlag=3 ') +'fm1='+(C 'SLIMB fields=19.*latestFlag=-1 '))
$r+=('SLIMB_BRANCH: 1SWING='+(C 'SLIMB fields=19.*branch=1SWING')+' 2SWING='+(C 'SLIMB fields=19.*branch=2SWING'))
$r+=('S5_NO_SL_REF='+(C 'S5_NO_SL_REF'))
$r+=('SWINGIMB_PROGRESS_COUNT='+(C 'SWINGIMB_PROGRESS'))
$r+=('SWINGIMB_PROGRESS_LAST='+((Select-String -LiteralPath $j -Pattern 'SWINGIMB_PROGRESS' | Select-Object -Last 1).Line -join '|'))
$r+=('WALK_OB_TOTAL='+(C 'SLIMBWALK fields=27'))
$r+=('WALK_OB_BADFMT='+(C 'SLIMBWALK (?!fields=27)'))
$r+=('WALK_OB_CLASS: ALL3='+(C 'SLIMBWALK fields=27.* class=ALL3_EQ')+' TEQB='+(C 'SLIMBWALK fields=27.* class=TODAY_EQ_BASE')+' TEQN='+(C 'SLIMBWALK fields=27.* class=TODAY_EQ_NUANCE')+' BASEMOVED='+(C 'SLIMBWALK fields=27.* class=BASE_MOVED')+' CARVE='+(C 'SLIMBWALK fields=27.* class=CARVEOUT_FIRED')+' EXH='+(C 'SLIMBWALK fields=27.* class=WALK_EXHAUSTED')+' UNEVAL='+(C 'SLIMBWALK fields=27.* class=WALK_UNEVALUABLE')+' UNRES='+(C 'SLIMBWALK fields=27.* class=UNRESOLVED')+' UNCLASS='+(C 'SLIMBWALK fields=27.* class=UNCLASSIFIED'))
$r+=('WALK_OB_SIDEV_GT0='+(C 'SLIMBWALK fields=27.*sideViolations=[1-9]'))
$r+=('WALK_OB_SIDEV0='+(C 'SLIMBWALK fields=27.*sideViolations=0'))
$r+=('WALK_OB_CODE3='+(C 'SLIMBWALK fields=27.*code3Seen=[1-9]'))
$r+=('WALKF_TOTAL='+(C 'SLIMBWALKF fields=25'))
$r+=('WALKF_BADFMT='+(C 'SLIMBWALKF (?!fields=25)'))
$r+=('WALKF_CLASS: ALL3='+(C 'SLIMBWALKF fields=25.*fracClass=ALL3_EQ')+' TEQB='+(C 'SLIMBWALKF fields=25.*fracClass=TODAY_EQ_BASE')+' TEQN='+(C 'SLIMBWALKF fields=25.*fracClass=TODAY_EQ_NUANCE')+' BASEMOVED='+(C 'SLIMBWALKF fields=25.*fracClass=BASE_MOVED')+' CARVE='+(C 'SLIMBWALKF fields=25.*fracClass=CARVEOUT_FIRED')+' EXH='+(C 'SLIMBWALKF fields=25.*fracClass=WALK_EXHAUSTED')+' UNEVAL='+(C 'SLIMBWALKF fields=25.*fracClass=WALK_UNEVALUABLE')+' UNRES='+(C 'SLIMBWALKF fields=25.*fracClass=UNRESOLVED')+' UNCLASS='+(C 'SLIMBWALKF fields=25.*fracClass=UNCLASSIFIED'))
$r+=('WALKF_SIDEV_GT0='+(C 'SLIMBWALKF fields=25.*sideFracViolations=[1-9]'))
$r+=('WALKF_SIDEV0='+(C 'SLIMBWALKF fields=25.*sideFracViolations=0'))
$r+=('WALKF_GUARD_APPLIED='+(C 'fracAnchorGuardApplied=1')+' WALKF_GUARD0='+(C 'fracAnchorGuardApplied=0'))
$r+=('WALKF_RAW_WRONG='+(C 'fracAnchorRawSide=WRONG')+' WALKF_RAW_PROT='+(C 'fracAnchorRawSide=PROTECTIVE')+' WALKF_RAW_NONE='+(C 'SLIMBWALKF fields=25.*fracAnchorRawSide=-'))
$r+=('WALKF_GUARD_ROWS='+(((Select-String -LiteralPath $j -Pattern 'SLIMBWALKF fields=25 bar=(\S+ \S+) site=(\S+).*fracAnchorGuardApplied=1') | ForEach-Object { $_.Matches[0].Groups[1].Value+'|'+$_.Matches[0].Groups[2].Value }) -join ' '))
$r+=('DIR_HIST_OB: LONG='+(C 'SLIMBWALK fields=27.*dir=LONG')+' SHORT='+(C 'SLIMBWALK fields=27.*dir=SHORT'))
$r+=('G6_OUTWARD_NEG_OB: BASE='+(C 'SLIMBWALK fields=27.*outwardBasePts=-')+' NUANCE='+(C 'SLIMBWALK fields=27.*outwardNuancePts=-'))
$r+=('G6_OUTWARD_PRESENT_OB: BASE='+(C 'SLIMBWALK fields=27.*outwardBasePts=')+' NUANCE='+(C 'SLIMBWALK fields=27.*outwardNuancePts='))
$r+=('G6_OUTWARD_FR: NEG='+(C 'SLIMBWALKF fields=25.*outwardFracPts=-')+' ZERO='+(C 'SLIMBWALKF fields=25.*outwardFracPts=0[ ,]')+' POS_ROWS='+(((Select-String -LiteralPath $j -Pattern 'SLIMBWALKF fields=25.*outwardFracPts=(\d+)').Count))+' NEG_NU='+(C 'SLIMBWALKF fields=25.*outwardFracNuancePts=-'))
$r+=('FRAC_RESIDUAL='+(C 'SLIMBWALKF fields=25.*slFractal=-'))
$r+=('FRAC_ANCHORFLAG: f0='+(C 'SLIMBWALKF fields=25.*fracAnchorFlag=0 ') +'f1='+(C 'SLIMBWALKF fields=25.*fracAnchorFlag=1 ') +'f2='+(C 'SLIMBWALKF fields=25.*fracAnchorFlag=2 ') +'f3='+(C 'SLIMBWALKF fields=25.*fracAnchorFlag=3 ') +'fm1='+(C 'SLIMBWALKF fields=25.*fracAnchorFlag=-1'))
$r+=('S5_CARVE_OB='+(C 'SLIMBWALK fields=27.*site=S5.* class=CARVEOUT_FIRED')+' S5_CARVE_FRAC='+(C 'SLIMBWALKF fields=25.*site=S5.*fracClass=CARVEOUT_FIRED'))
$r+=('SLIMBR_TOTAL='+(C 'SLIMBR bar='))
$r+=('SLIMBR_STALE='+(C 'SLIMBR bar=.*STALE'))
$r+=('SLIMBR_ROWS='+(((Select-String -LiteralPath $j -Pattern 'SLIMBR bar=').Line) -join '|'))
$r+=('SLIMBRCARVE_ROWS='+(((Select-String -LiteralPath $j -Pattern 'SLIMBRCARVE').Line) -join '|'))
$r+=('SLIMBCARVE_FINAL='+((Select-String -LiteralPath $j -Pattern 'SLIMBCARVE_FINAL').Line -join '|'))
$r+=('FRAME_NOTE='+((Select-String -LiteralPath $j -Pattern 'FRAME_NOTE').Line -join '|'))
$r+=('N1EQUALS='+((Select-String -LiteralPath $j -Pattern 'N1EQUALS').Line -join '|'))
$r+=('N1PAIR='+((Select-String -LiteralPath $j -Pattern 'N1PAIR').Line -join '|'))
$r+=('LINEWIDTH_ROWS='+(((Select-String -LiteralPath $j -Pattern 'LINEWIDTH class=').Line) -join '|'))
$r+=('DECISION_BLOCK='+((Select-String -LiteralPath $j -Pattern 'SLIMBR_DECISION').Line -join '|'))
$r+=('SEP7_SLIMBR='+(((Select-String -LiteralPath $j -Pattern 'SLIMBR bar=2026\.09\.07').Line) -join '|'))
$r+=('SEP7_CARVE='+(((Select-String -LiteralPath $j -Pattern 'SLIMBRCARVE bar=2026\.09\.07').Line) -join '|'))
$slimb=@{}
foreach($m in (Select-String -LiteralPath $j -Pattern 'SLIMB fields=19 bar=(\S+ \S+) site=(\S+).*chosenFlag=(-?\d+)')){ $slimb[$m.Matches[0].Groups[1].Value+'|'+$m.Matches[0].Groups[2].Value]=$m.Matches[0].Groups[3].Value }
$xt=@{}; $fals=0; $unmatched=0
foreach($m in (Select-String -LiteralPath $j -Pattern 'SLIMBWALK fields=27 bar=(\S+ \S+) site=(\S+).* class=(\S+)')){
  $k=$m.Matches[0].Groups[1].Value+'|'+$m.Matches[0].Groups[2].Value
  $cls=$m.Matches[0].Groups[3].Value
  if($slimb.ContainsKey($k)){ $cf=$slimb[$k]; $kk='cf='+$cf+' x '+$cls; if($xt.ContainsKey($kk)){$xt[$kk]++}else{$xt[$kk]=1}; if($cf -eq '1' -and $cls -eq 'BASE_MOVED'){ $fals++ } }
  else { $unmatched++ }
}
$r+=('XTAB_CHOSENFLAG_X_CLASS='+((($xt.GetEnumerator() | Sort-Object Name | ForEach-Object { $_.Key+'='+$_.Value }) -join ' ')))
$r+=('XTAB_FALSIFIER_cf1_BASEMOVED='+$fals)
$r+=('XTAB_UNMATCHED_WALK_ROWS='+$unmatched)
$fxt=@{}; $ffals=0
foreach($m in (Select-String -LiteralPath $j -Pattern 'SLIMBWALKF fields=25 bar=(\S+ \S+) site=(\S+) .*fracAnchorFlag=(-?\d+) .*fracClass=(\S+)')){
  $kk='ff='+$m.Matches[0].Groups[3].Value+' x '+$m.Matches[0].Groups[4].Value
  if($fxt.ContainsKey($kk)){$fxt[$kk]++}else{$fxt[$kk]=1}
  if($m.Matches[0].Groups[3].Value -eq '1' -and $m.Matches[0].Groups[4].Value -eq 'BASE_MOVED'){ $ffals++ }
}
$r+=('XTAB_FRACFLAG_X_FRACCLASS='+((($fxt.GetEnumerator() | Sort-Object Name | ForEach-Object { $_.Key+'='+$_.Value }) -join ' ')))
$r+=('XTAB_FALSIFIER_ff1_BASEMOVED='+$ffals)
$r | Set-Content -LiteralPath $out
Get-Content -LiteralPath $out
