$Work='c:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\SRJ_FlowNexus_Local\00_CURRENT_WORKING'
$Run='RECON24-BUILD2TN3'
$Ini=Join-Path $Work 'RECON1_P1.ini'
foreach($suf in @('_STATUS.txt','_DONE.txt')){ $p=Join-Path $Work ($Run + $suf); if(Test-Path -LiteralPath $p){ Remove-Item -LiteralPath $p -Force } }
# Detached launch via Win32_Process.Create (WMI, parent=wmiprvse) per the
# launcher-detach amendment (AGENTS 8, 2026-09-14): cmd-start/Start-Process
# inherit the builder shell's pipe through the tool harness and hang the
# launch call to timeout. WMI prints PID + RC and returns instantly;
# completion is detected via the DONE file only. build-2 TN3 single
# build+rerun (dual-key GPT-V29-S2-CLR-001 + OPUS-V29-CLR-001 with C1
# measured satisfied pre-compact, N1 duplicate declared intended;
# operator run word post-compact). EA 703c3b0a, FlowLogic 3606BFB4.
# Same ini/range as RECON20b/21b/22/23. Ceiling 90 min, wrapper-only.
$cmd = 'powershell -NoProfile -ExecutionPolicy Bypass -File "' + (Join-Path $Work 'run_tester_v2.ps1') + '" -RunName ' + $Run + ' -IniPath "' + $Ini + '" -CeilingMin 90'
$r = ([wmiclass]'Win32_Process').Create($cmd)
'WMI_PID=' + $r.ProcessId + ' RC=' + $r.ReturnValue
'LAUNCHED ' + $Run
