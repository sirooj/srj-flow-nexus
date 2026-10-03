# Launch RECON70-D74-UJDIAG (2026-09-26; UJ diagnostic on D74FE972 under his proceed: which of his 3 blind rows take).
$Work = 'c:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\SRJ_FlowNexus_Local\00_CURRENT_WORKING'
$Run = 'RECON70-D74-UJDIAG'
$Ini = Join-Path $Work 'USDJPY_DEMO_JUNE.ini'
foreach ($suf in @('_STATUS.txt','_DONE.txt')) { $p = Join-Path $Work ($Run + $suf); if (Test-Path -LiteralPath $p) { Remove-Item -LiteralPath $p -Force } }
# Detached launch via Win32_Process.Create (WMI, parent=wmiprvse) per the
# launcher-detach amendment (AGENTS 8, 2026-09-14). WMI prints PID + RC and
# returns instantly; completion is detected via the DONE file only.
# Tree D74FE972/633552/11502 (revert afe220a, compile 0/0). FULL June window
# 6/1 00:00 to 6/13 00:00 (fidelity over slice savings: miss mechanisms may
# depend on pre-window state; 45 min stated cost, RECON64 precedent) via
# terminal.ini [Tester] 1780272000/1781308800 (close-first verified gone,
# backup pre-recon70, read-back once, TickLoad untouched, InpDebugLog=true).
# Ceiling 90. Grade criteria: his 3 rows (6/5 09:45 + 6/5 16:15 + 6/11 14:40)
# take/miss per row + 6/03 take parity + rejects silent.
# No terminal is ever killed by the wrapper or here.
$cmd = 'powershell -NoProfile -ExecutionPolicy Bypass -File "' + (Join-Path $Work 'run_tester_v2.ps1') + '" -RunName ' + $Run + ' -IniPath "' + $Ini + '" -CeilingMin 90'
$r = ([wmiclass]'Win32_Process').Create($cmd)
'WMI_PID=' + $r.ProcessId + ' RC=' + $r.ReturnValue
'LAUNCHED ' + $Run
