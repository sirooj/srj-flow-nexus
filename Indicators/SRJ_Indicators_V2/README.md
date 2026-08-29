# SRJ Flow Logic Auto — MT5 Port (Batch H + H.1, complete)

All files are now present, including `SRJ_Types.mqh`, which you supplied.
Every field, method, and constructor signature in it was cross-checked
against every call site in the other 11 files — no mismatches found.

## Included

```
MQL5/
  Include/SRJ/
    SRJ_Types.mqh          — classes, NA sentinels, typed getters (supplied by user)
    SRJ_State.mqh          — H1: extern removed from all input mirrors
    SRJ_Sessions.mqh       — H2 + H.1: full session/sweep logic restored,
                              P8 day-of-week fix applied, duplicate mirrors removed
    SRJ_Text.mqh           — H4: byte-escape literals purged, glyph fallback normalized
    SRJ_Fractals.mqh       — P5: no illegal pointers (unchanged since Batch G)
    SRJ_Draw.mqh           — unchanged since Batch G
    SRJ_Alerts.mqh         — H5: SRJ_FireExtremePromote restored
    SRJ_OrderblockMgr.mqh  — H5: calls SRJ_FireExtremePromote (no inlined alert logic)
    SRJ_ImbalanceMgr.mqh   — unchanged since Batch G
    SRJ_BiasEngine.mqh     — unchanged since Batch G
    SRJ_HTFEngine.mqh      — P6: CHTFEngineState class (unchanged since Batch G)
    SRJ_Panels.mqh         — unchanged since Batch G
  Indicators/
    SRJ_FlowLogic.mq5      — H3: snapshot/rollback state at global scope;
                              H6: <SRJ/...> angle-bracket includes
```

## One known, deliberately-deferred item (not a bug)

`SRJ_Types.mqh` defines `SRJ_NA_STR` as `"\x01NA"` — a single control byte (0x01)
prepended to "NA", used as an internal sentinel so it can never collide with a
real string value a user might see. This was flagged in the original
Remediation Blueprint's "Known Deferred Items" list (item 1) as fragile but
intentionally left alone for a later cleanup pass (recommended replacement:
`"__SRJ_NA__"`). It is unrelated to the H4 fix, which addressed multi-byte
UTF-8 glyph sequences elsewhere — this is a single low ASCII control
character, not a mis-decoded emoji.

## Before compiling

1. Copy the `MQL5/Include/SRJ/` folder into your terminal's `MQL5/Include/SRJ/`.
2. Copy `MQL5/Indicators/SRJ_FlowLogic.mq5` into your terminal's `MQL5/Indicators/`.
3. Compile in MetaEditor.
4. If anything doesn't compile clean, paste the error list back — it'll be
   traced against the specific file/line rather than guessed at.
