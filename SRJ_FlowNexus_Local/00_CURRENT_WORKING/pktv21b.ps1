$ErrorActionPreference = 'Stop'
$Packet = 'PACKET_EXT1LIVE-001.md'
$h = (Get-FileHash -Algorithm SHA256 -LiteralPath $Packet).Hash
if ($h -ne '0588CDE872E68A41A7774E2443083C2843B95F1B5B74F03DB49AADD47596B7A5') { throw 'not phase-A state, halt' }
$t = [System.IO.File]::ReadAllText($Packet)
function CountOf([string]$x, [string]$a) {
  if ($a.Length -eq 0) { return -1 }
  return (($x.Length - $x.Replace($a, '').Length) / $a.Length)
}
$must = @(
  @('if(probe_shadowOk && MathIsValidNumber(_Point) && _Point > 0.0) { if(g_dir == DIR_LONG) probe_extSideI = ((g_sl41_px < currentPrice) ? 1 : 0); else probe_extSideI = ((g_sl41_px > currentPrice) ? 1 : 0); probe_extDistD = (((g_dir == DIR_LONG) ? (currentPrice - g_sl41_px) : (g_sl41_px - currentPrice)) / _Point); probe_vals[25] = IntegerToString(probe_extSideI); if(!MathIsValidNumber(probe_extDistD) || MathAbs(probe_extDistD) > 99999.0) probe_vals[26] = "INVALID"; else probe_vals[26] = DoubleToString(MathRound(probe_extDistD), 0); } else { probe_vals[25] = "-"; probe_vals[26] = "-"; }',
    'if(probe_shadowOk) { if(g_dir == DIR_LONG) probe_extSideI = ((g_sl41_px < currentPrice) ? 1 : 0); else if(g_dir == DIR_SHORT) probe_extSideI = ((g_sl41_px > currentPrice) ? 1 : 0); else probe_extSideI = -1; if(probe_extSideI < 0) probe_vals[25] = "-"; else probe_vals[25] = IntegerToString(probe_extSideI); if(probe_extSideI < 0) probe_vals[26] = "-"; else if(!MathIsValidNumber(_Point) || !(_Point > 0.0)) probe_vals[26] = "-"; else { if(g_dir == DIR_LONG) probe_extDistD = ((currentPrice - g_sl41_px) / _Point); else probe_extDistD = ((g_sl41_px - currentPrice) / _Point); probe_extRnd = MathRound(probe_extDistD); if(!MathIsValidNumber(probe_extRnd) || MathAbs(probe_extRnd) > 99999.0) probe_vals[26] = "INVALID"; else probe_vals[26] = DoubleToString(probe_extRnd, 0); } } else { probe_vals[25] = "-"; probe_vals[26] = "-"; }'),
  @('int probe_extSideI (strict side comparison result);',
    'int probe_extSideI (strict side comparison result); double probe_rLiveV (live quotient result, validated before formatting); double probe_extRnd (rounded displacement, range-tested after rounding);'),
  @('exact-diff = insertions A+B+C literal source text with diff-shape (the frozen C statement list below is the audited artifact; what is cleared is what compiles; two RHS identifiers bound at build per B-6)',
    'exact-diff = insertions A+B+C literal source text, except the two explicitly named STAGE-1-bound RHS expressions, with diff-shape (the frozen C statement list below plus the named two-statement addendum hunk is the audited artifact; what is cleared is what compiles)'),
  @('except shadow-distance construction and the literal wouldGate predicate, which are the stated exceptions using actual numeric operands, never display tokens.',
    'except shadow-distance construction and the literal wouldGate predicate, which are the stated exceptions using actual numeric operands, never display tokens; invalid-input rows are outside mirror-result equivalence (when probe_shadowOk is false the defined-branch predicate evaluates over the poison distance and its printed 0 is unavailable, never a faithful mirror - offline undecided class).'),
  @('(A, B, and C ALL cleared as literal source text pasted in P032; the STAGE-1 exact-diff gate checks the build tree against that text)',
    '(A, B, and C ALL cleared as literal source text pasted in P032, except the two explicitly named STAGE-1-bound RHS expressions covered by the addendum hunk; the STAGE-1 exact-diff gate checks the build tree against that text plus the hunk)'),
  @('(insertions A, B, and C as literal source text pasted below (C restructured per B-1/B-2/B-3/B-4/B-5/B-6), checked by the STAGE-1 exact-diff gate)',
    '(insertions A, B, and C as literal source text pasted below, except the two explicitly named STAGE-1-bound RHS expressions covered by the addendum hunk (restructured per the v21 fold list in the title), checked by the STAGE-1 exact-diff gate against that text plus the hunk)'),
  @('cleared solely against received review material (Luna-v182, Astra-v182, Opus-v182); no known-requested sliver stays unfolded',
    'cleared solely against received review material (Luna-v183, Astra-v183, Opus-v183); no known-requested sliver stays unfolded'),
  @('stays unfolded. Supersedes v19 (withdrawn:',
    'stays unfolded. Supersedes v20 (withdrawn: premature-brace NORMAL escape (brace relocated); missing stamp store (probe_vals[37] added); census-vs-literal mismatch (recounted); uncompilable bound placeholders (bound-"-" base plus addendum hunk); quotient/result validity gaps (result checks added); pre-round range test (round-temp added); _Point-gated side flag (gates split); SHORT-shaped DIR_NONE (three-way arms)) + v19 (withdrawn:'),
  @('the single InpDebugLog hit in L9532-L9780 is the L9683 shadow-splice gate, post-C)',
    'the single InpDebugLog hit in L9532-L9780 is the L9683 shadow-splice gate, post-C; L9532-L9606 rides as a STAGE-1 disk item, never page-proven)'),
  @('no truthy value is ever silently collapsed);',
    'no truthy value is ever silently collapsed); a stale/corrupt 2 prints ext1Defined=2 on a FALLBACK-CLASS row before the domain halt (record-class assignment precedes the check - stated here).'),
  @('38 value positions each written exactly once per emitted NORMAL record, via 50 store statements across the branch structure (26 common including 2 STAGE-1-bound + 12 defined + 12 fallback)',
    '38 value positions each with exactly one final population per emitted NORMAL record path after prefill, via 50 position-populations across the branch structure (26 common including 2 STAGE-1-bound + 12 defined + 12 fallback) plus the prefill loop; syntactic store-statement count filed at STAGE-1 by mechanical count of the frozen literal')
)
foreach ($pair in $must) {
  $c = CountOf $t $pair[0]
  if ($c -ne 1) { throw ('anchor count ' + $c + ' expected 1: ' + $pair[0].Substring(0, [Math]::Min(80, $pair[0].Length))) }
  $t = $t.Replace($pair[0], $pair[1])
}
$nl = $t.IndexOf("`n")
$first = $t.Substring(0, $nl).TrimEnd("`r")
if (-not $first.StartsWith('# PACKET_EXT1LIVE-001 v20')) { throw 'title line unexpected, halt' }
$newTitle = '# PACKET_EXT1LIVE-001 v21 - live the ext1 stop (print-only probe; v21 folds Luna-v183 stamp+wording + Astra-v183-A1-A10/B1-B3 + Opus-v183-F-1-F-12/B-1-B-8 (all blocking adopted: brace relocated, stamp stored, census recounted, bound-"-" base with addendum hunk, quotient/result checks, round-temp, gates split, dir arms): dir domain {1,-1}; 38-row 1024/1056 ledger; complete templates; corroboration join; strategy-pure census; 38-field payload + fixed envelope; code untouched)'
$t = $newTitle + $t.Substring($nl)
[System.IO.File]::WriteAllText($Packet, $t)
'WROTE bytes=' + ([System.IO.File]::ReadAllBytes($Packet).Length)
'stores_probe_vals=' + (CountOf $t 'probe_vals[')
'vals37=' + (CountOf $t 'probe_vals[37]')
'dirlong_tern=' + (CountOf $t '(g_dir == DIR_LONG) ?')
'v20left=' + (CountOf $t 'v20')
'v21now=' + (CountOf $t 'v21')
