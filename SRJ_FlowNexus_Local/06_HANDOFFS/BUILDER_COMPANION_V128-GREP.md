# COMPANION V128-GREP - verbatim whole-tree tool outputs (answers Sonnet run-search demand)

**Method:** ripgrep-equivalent full scans run at companion build; outputs pasted whole, untruncated. A concurrent builder session already filed the Sonnet v128 review text itself - adopted as-is, never re-filed (single-copy rule).

## EA order-call scan (whole file)
```
LineNumber Line                                                                                                   
---------- ----                                                                                                   
      1648 bool IsSessionPositionOpen(long magic)                                                                 
      4020    string idp = "[SRJ-EA] SEL61INDEP adopt=0 ordersend=0/0 sizefields=0 h4branches=0";                 
      7696           //--- latch/order/stop/N1 write (N1 restored), OrderSend, AdoptOff touch, fresh Detect calls,
      9691            //--- sessbufs/filter/census touch, AdoptOff untouched, OrderSend 0.                        
      9983       if(IsSessionPositionOpen(magic))                                                                 
     10025             tradeResult = g_trade.Buy(lots, _Symbol, entryPrice, slRef, tpTarget, comment);            
     10027             tradeResult = g_trade.Sell(lots, _Symbol, entryPrice, slRef, tpTarget, comment);
```

## Include/SRJ scan (all *.mqh, same patterns + CTrade/g_trade)
```
(zero matches across all Include/SRJ/*.mqh)
```

## Config decls (whole-file match lines)
```
LineNumber Line                                                                          
---------- ----                                                                          
        28 input double InpRiskPercent     = 1.0;                                        
        29 input long   InpMagicBase       = 773000;                                     
        32 input ENUM_SRJ_MODE InpMode = MODE_ALERT_ONLY;   // ALERT_ONLY sends no orders
```

## Demo login record (measured, never invented)
- common.ini line 4: Login=1500183638; live terminal window title showed the same digits on Dukascopy-demo-mt5-1. Connected demo login = 1500183638 (two independent on-disk/window sources).

