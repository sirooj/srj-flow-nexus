# Launch RECON63-USDJPY-JUNE (2026-09-25; blind robustness RUN on built tree A82F15E7, NO canonical change, on his direction this turn: USDJPY June 1-12, journal kept by him).
$Work = 'c:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\SRJ_FlowNexus_Local\00_CURRENT_WORKING'
$Run = 'RECON63-USDJPY-JUNE'
$Ini = Join-Path $Work 'USDJPY_DEMO_JUNE.ini'
foreach ($suf in @('_STATUS.txt','_DONE.txt')) { $p = Join-Path $Work ($Run + $suf); if (Test-Path -LiteralPath $p) { Remove-Item -LiteralPath $p -Force } }
# Detached launch via Win32_Process.Create (WMI, parent=wmiprvse) per the
# launcher-detach amendment (AGENTS 8, 2026-09-14). WMI prints PID + RC and
# returns instantly; completion is detected via the DONE file only.
# Same built tree as RECON61/62 (EA A82F15E7, 0/0). USDJPY envelope
# (USDJPY_DEMO_JUNE ini, Symbol USDJPY, InpMode 1, 6/1 00:00 to 6/13 00:00
# via terminal.ini [Tester] 1780272000/1781308800, InpDebugLog=true).
# Ceiling 90 min, wrapper-only. Blind protocol: full signal census for HIS
# ruling against HIS kept journal; no goal join from builder. Timeout
# REPORT+HALT. No terminal is ever killed by the wrapper or here.
$cmd = 'powershell -NoProfile -ExecutionPolicy Bypass -File "' + (Join-Path $Work 'run_tester_v2.ps1') + '" -RunName ' + $Run + ' -IniPath "' + $Ini + '" -CeilingMin 90'
$r = ([wmiclass]'Win32_Process').Create($cmd)
'WMI_PID=' + $r.ProcessId + ' RC=' + $r.ReturnValue
'LAUNCHED ' + $Run
