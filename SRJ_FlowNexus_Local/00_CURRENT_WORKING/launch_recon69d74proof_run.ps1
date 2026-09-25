# Launch RECON69-D74-PROOF (2026-09-26; proof on corrected tree D74FE972, his 7-trade evidence target; WMI_PID below).
$Work = 'c:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\SRJ_FlowNexus_Local\00_CURRENT_WORKING'
$Run = 'RECON69-D74-PROOF'
$Ini = Join-Path $Work 'EU_DEMO_FULL.ini'
foreach ($suf in @('_STATUS.txt','_DONE.txt')) { $p = Join-Path $Work ($Run + $suf); if (Test-Path -LiteralPath $p) { Remove-Item -LiteralPath $p -Force } }
# Detached launch via Win32_Process.Create (WMI, parent=wmiprvse) per the
# launcher-detach amendment (AGENTS 8, 2026-09-14). WMI prints PID + RC and
# returns instantly; completion is detected via the DONE file only.
# Corrected tree D74FE972/633552/11502 (worktree extract of bef2156,
# compile 0/0 REVERT-D74 log). EU slice 9/4 00:00 to 9/8 00:00 (Fri + full
# Monday, his exclusive-end rationale) via terminal.ini [Tester]
# 1788480000/1788825600 (already set + verified for RECON68; prior terminal
# closed before this launch, verified gone; InpDebugLog=true). Ceiling 90.
# Grade criteria: 9/4 NY + 9/7 London + 9/7 NY takes present (his 7-trade
# behavior), 9/4 10:40 dead, no 8/27 take.
# No terminal is ever killed by the wrapper or here.
$cmd = 'powershell -NoProfile -ExecutionPolicy Bypass -File "' + (Join-Path $Work 'run_tester_v2.ps1') + '" -RunName ' + $Run + ' -IniPath "' + $Ini + '" -CeilingMin 90'
$r = ([wmiclass]'Win32_Process').Create($cmd)
'WMI_PID=' + $r.ProcessId + ' RC=' + $r.ReturnValue
'LAUNCHED ' + $Run
