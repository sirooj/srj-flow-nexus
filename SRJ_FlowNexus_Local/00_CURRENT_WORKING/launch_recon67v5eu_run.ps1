# Launch RECON67-V5-EU (2026-09-26; guard EU join on built tree 89810547, Luna key + v7 word SPENT, packet v5 CLEAR 3-0, June run graded PASS).
$Work = 'c:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\SRJ_FlowNexus_Local\00_CURRENT_WORKING'
$Run = 'RECON67-V5-EU'
$Ini = Join-Path $Work 'EU_DEMO_FULL.ini'
foreach ($suf in @('_STATUS.txt','_DONE.txt')) { $p = Join-Path $Work ($Run + $suf); if (Test-Path -LiteralPath $p) { Remove-Item -LiteralPath $p -Force } }
# Detached launch via Win32_Process.Create (WMI, parent=wmiprvse) per the
# launcher-detach amendment (AGENTS 8, 2026-09-14). WMI prints PID + RC and
# returns instantly; completion is detected via the DONE file only.
# Built tree 89810547/642681/11614 (packet v5, compile 0/0). EURUSD envelope
# (EU_DEMO_FULL ini, Symbol EURUSD, InpMode 1, 8/26 00:00 to 9/10 00:00
# via terminal.ini [Tester] 1787702400/1788998400: close-first (no terminal
# running, verified gone), convention-calibrated +25200 offset reproducing the
# proven June pair exactly, span 15 days, read-back verified once, TickLoad
# untouched, InpDebugLog=true). Ceiling 90 min, wrapper-only.
# No terminal is ever killed by the wrapper or here.
$cmd = 'powershell -NoProfile -ExecutionPolicy Bypass -File "' + (Join-Path $Work 'run_tester_v2.ps1') + '" -RunName ' + $Run + ' -IniPath "' + $Ini + '" -CeilingMin 90'
$r = ([wmiclass]'Win32_Process').Create($cmd)
'WMI_PID=' + $r.ProcessId + ' RC=' + $r.ReturnValue
'LAUNCHED ' + $Run
