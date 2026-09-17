# Launch RECON43-PROMO (filed 2026-09-17; RUN on his token + word, both spent here).
$Work = 'c:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\SRJ_FlowNexus_Local\00_CURRENT_WORKING'
$Run = 'RECON43-PROMO'
$Ini = Join-Path $Work 'RECON1_P1.ini'
foreach ($suf in @('_STATUS.txt','_DONE.txt')) { $p = Join-Path $Work ($Run + $suf); if (Test-Path -LiteralPath $p) { Remove-Item -LiteralPath $p -Force } }
# Detached launch via Win32_Process.Create (WMI, parent=wmiprvse) per the
# launcher-detach amendment (AGENTS 8, 2026-09-14). WMI prints PID + RC and
# returns instantly; completion is detected via the DONE file only.
# V122 CLEAR BY NAME, dual-key (token + word SPENT here). Build EA 9D123133/596222
# (live promotion per authored design; 0/0 fresh log); FlowLogic BEC2CBBD/69852
# unchanged. Same ini/range (Model=4 real-ticks, InpDebugLog=true, 08-26 to 09-09
# fidelity window, same terminal+machine, spread live-floating). Ceiling 90 min,
# wrapper-only. ONE promotion build (done, do NOT rebuild) + ONE proving run.
# Timeout REPORT+HALT. His demo terminal is NEVER touched - if TERMINAL_BUSY
# refuses, STOP and ask him (his word or his close), never close it yourself.
$cmd = 'powershell -NoProfile -ExecutionPolicy Bypass -File "' + (Join-Path $Work 'run_tester_v2.ps1') + '" -RunName ' + $Run + ' -IniPath "' + $Ini + '" -CeilingMin 90'
$r = ([wmiclass]'Win32_Process').Create($cmd)
'WMI_PID=' + $r.ProcessId + ' RC=' + $r.ReturnValue
'LAUNCHED ' + $Run
