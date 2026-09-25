# Launch RECON66-V5-USDJPY (2026-09-25; first guard run on built tree 89810547, Luna key + v7 word SPENT, packet v5 CLEAR 3-0).
$Work = 'c:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\SRJ_FlowNexus_Local\00_CURRENT_WORKING'
$Run = 'RECON66-V5-USDJPY'
$Ini = Join-Path $Work 'USDJPY_DEMO_JUNE.ini'
foreach ($suf in @('_STATUS.txt','_DONE.txt')) { $p = Join-Path $Work ($Run + $suf); if (Test-Path -LiteralPath $p) { Remove-Item -LiteralPath $p -Force } }
# Detached launch via Win32_Process.Create (WMI, parent=wmiprvse) per the
# launcher-detach amendment (AGENTS 8, 2026-09-14). WMI prints PID + RC and
# returns instantly; completion is detected via the DONE file only.
# Built tree 89810547/642681/11614 (packet v5, compile 0/0). USDJPY envelope
# (USDJPY_DEMO_JUNE ini, Symbol USDJPY, InpMode 1, 6/1 00:00 to 6/13 00:00
# via terminal.ini [Tester] 1780272000/1781308800 verified post-close this
# block, no edit needed, InpDebugLog=true). Ceiling 90 min, wrapper-only.
# No terminal is ever killed by the wrapper or here.
$cmd = 'powershell -NoProfile -ExecutionPolicy Bypass -File "' + (Join-Path $Work 'run_tester_v2.ps1') + '" -RunName ' + $Run + ' -IniPath "' + $Ini + '" -CeilingMin 90'
$r = ([wmiclass]'Win32_Process').Create($cmd)
'WMI_PID=' + $r.ProcessId + ' RC=' + $r.ReturnValue
'LAUNCHED ' + $Run
