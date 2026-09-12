$seg='c:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\SRJ_FlowNexus_Local\06_HANDOFFS\RECON3-BUILD3_JOURNAL.log'
$L = Get-Content -LiteralPath $seg
'--- ComputeSlReference entry/exit pairing at S2POLL ---'
'SWINGPICK_S2POLL=' + @($L | Where-Object { $_ -match 'SWINGPICK site=S2POLL' }).Count
'SLREF_1SWING_S2POLL=' + @($L | Where-Object { $_ -match 'SL_REF branch=1-swing.*site=S2POLL' }).Count
'SLREF_2SWING_S2POLL=' + @($L | Where-Object { $_ -match 'SL_REF branch=2-swing.*site=S2POLL' }).Count
'SLSTRUCT_S2=' + @($L | Where-Object { $_ -match 'SL_STRUCT.*site=S2POLL|SLSIDEGUARD site=S2POLL.*result=noProtectiveSideSwing' }).Count
'ABORT_NO_SL=' + @($L | Where-Object { $_ -match 'ABORT.*NO.*SL|NO_SL_REF' }).Count
'--- 2-swing S2POLL sample ---'
@($L | Where-Object { $_ -match 'SL_REF branch=2-swing.*site=S2POLL' } | Select-Object -First 3)
'--- all SL_REF lines NOT 1-swing/2-swing at S2POLL ---'
@($L | Where-Object { $_ -match 'SL_REF.*site=S2POLL' } | Where-Object { $_ -notmatch 'branch=1-swing|branch=2-swing' } | Select-Object -First 5)
