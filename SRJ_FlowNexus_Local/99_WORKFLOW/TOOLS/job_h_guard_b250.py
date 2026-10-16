"""job_h_guard_b250.py - B-250 H-trigger edits (re-appliable; committed TOOLS).
Applies the [B250H] diagnostic hunks on top of the .B250GK/G build:
  1. FlowLogic bull append site -> slot guard (GAPPENDGUARD_B)
  2. FlowLogic bear append site -> slot guard (GAPPENDGUARD_S)
  3. CQD copy (SRJ_CQD_TickBased_MT5_B250H.mq5, made from .B249FK) ->
     verdict proof print (SWINGPROOF: bar=x2 pivot, x1 left anchor,
     writePass = forming bar this pass builds, newestClosed = last closed bar).
Each site: uniqueness check on anchors, exact-byte splice, brace tally before/after.
Run:  job_h_guard_b250.py
"""
import os

BASE = os.path.dirname(os.path.abspath(__file__))
MQL5 = os.path.abspath(os.path.join(BASE, '..', '..', '..'))
IND = os.path.join(MQL5, 'Indicators')

CRLF = '\r\n'


def tally(text):
    return text.count('{'), text.count('}')


# ---------------------------------------------------------------- FlowLogic
FL = os.path.join(IND, 'SRJ_FlowLogic.mq5')
txt = open(FL, 'r', encoding='utf-8-sig', newline='').read()
c0 = tally(txt)

INT_LINE = '                int b176m = ArraySize(g_b176Dead);' + CRLF
SITE_CLOSE = '               }' + CRLF

BULL_ANCHOR = '             if(low[i] > high[i-2])' + CRLF
BEAR_ANCHOR = '             if(high[i] < low[i-2])' + CRLF

COMMENTS = (
    '             //--- [B250H] slot guard: append aborts (with a [B250H] row) when the' + CRLF +
    '             //--- 10 arrays diverge or any ArrayResize fails, so the write below' + CRLF +
    '             //--- can never be OOR; sizes are rolled back to b176m on failure. The' + CRLF +
    '             //--- g_b176 store is print-only, so a skipped append only fades later' + CRLF +
    '             //--- GAP_TOUCH/GAP_DEAD diagnostics; no EA logic depends on it.' + CRLF)


def guard_pre(site_tag):
    return (
        INT_LINE +
        '                bool b250gOK = (' + CRLF +
        '                                 ArraySize(g_b176Bull) == b176m && ArraySize(g_b176T1) == b176m &&' + CRLF +
        '                                 ArraySize(g_b176T2) == b176m && ArraySize(g_b176T3) == b176m &&' + CRLF +
        '                                 ArraySize(g_b176Top0) == b176m && ArraySize(g_b176Bot0) == b176m &&' + CRLF +
        '                                 ArraySize(g_b176SpanLo) == b176m && ArraySize(g_b176SpanHi) == b176m &&' + CRLF +
        '                                 ArraySize(g_b176HasSpan) == b176m);' + CRLF +
        '                if(b250gOK)' + CRLF +
        '                  {' + CRLF +
        '                   b250gOK = (ArrayResize(g_b176Bull, b176m+1) == b176m+1 &&' + CRLF +
        '                              ArrayResize(g_b176T1, b176m+1) == b176m+1 &&' + CRLF +
        '                              ArrayResize(g_b176T2, b176m+1) == b176m+1 &&' + CRLF +
        '                              ArrayResize(g_b176T3, b176m+1) == b176m+1 &&' + CRLF +
        '                              ArrayResize(g_b176Top0, b176m+1) == b176m+1 &&' + CRLF +
        '                              ArrayResize(g_b176Bot0, b176m+1) == b176m+1 &&' + CRLF +
        '                              ArrayResize(g_b176SpanLo, b176m+1) == b176m+1 &&' + CRLF +
        '                              ArrayResize(g_b176SpanHi, b176m+1) == b176m+1 &&' + CRLF +
        '                              ArrayResize(g_b176HasSpan, b176m+1) == b176m+1 &&' + CRLF +
        '                              ArrayResize(g_b176Dead, b176m+1) == b176m+1);' + CRLF +
        '                  }' + CRLF +
        '                if(!b250gOK)' + CRLF +
        '                  {' + CRLF +
        '                   ArrayResize(g_b176Bull, b176m);   ArrayResize(g_b176T1, b176m);' + CRLF +
        '                   ArrayResize(g_b176T2, b176m);     ArrayResize(g_b176T3, b176m);' + CRLF +
        '                   ArrayResize(g_b176Top0, b176m);   ArrayResize(g_b176Bot0, b176m);' + CRLF +
        '                   ArrayResize(g_b176SpanLo, b176m); ArrayResize(g_b176SpanHi, b176m);' + CRLF +
        '                   ArrayResize(g_b176HasSpan, b176m); ArrayResize(g_b176Dead, b176m);' + CRLF +
        '                   PrintFormat("[B250H] bar=%s id=%d site=' + site_tag + '",' + CRLF +
        '                               TimeToString(time[i], TIME_DATE|TIME_MINUTES), b176m);' + CRLF +
        '                  }' + CRLF +
        '                else' + CRLF +
        '                  {' + CRLF)


def writes_block(side, side_lit, top_expr, bot_expr, last_expr):
    return (
        '                   g_b176Bull[b176m] = %s;' % side + CRLF +
        '                   g_b176T1[b176m] = time[i-2]; g_b176T2[b176m] = time[i-1]; g_b176T3[b176m] = time[i];' + CRLF +
        '                   g_b176Top0[b176m] = %s; g_b176Bot0[b176m] = %s;' % (top_expr, bot_expr) + CRLF +
        '                   g_b176SpanLo[b176m] = 0.0; g_b176SpanHi[b176m] = 0.0;' + CRLF +
        '                   g_b176HasSpan[b176m] = false; g_b176Dead[b176m] = false;' + CRLF +
        '                   PrintFormat("[SRJ-IND] B176HZ GAP_FORM side={SIDE} t1=%s t2=%s t3=%s range=%s-%s",'.replace('{SIDE}', side_lit) + CRLF +
        '                               TimeToString(time[i-2], TIME_DATE|TIME_MINUTES),' + CRLF +
        '                               TimeToString(time[i-1], TIME_DATE|TIME_MINUTES),' + CRLF +
        '                               TimeToString(time[i], TIME_DATE|TIME_MINUTES),' + CRLF +
        '                               DoubleToString(%s), DoubleToString(%s));' % last_expr + CRLF)


SITES = (
    (BULL_ANCHOR, ('GAPPENDGUARD_B',), 'B',
     'true', ('low[i]', 'high[i-2]'), ('high[i-2]', '_Digits'), ('low[i]', '_Digits')),
    (BEAR_ANCHOR, ('GAPPENDGUARD_S',), 'S',
     'false', ('low[i-2]', 'high[i]'), ('high[i]', '_Digits'), ('low[i-2]', '_Digits')),
)

for anchor, site_tag, side_lit, side, tops, lasthi, lastlo in SITES:
    i = txt.find(anchor)
    assert i >= 0, 'site anchor not found: ' + site_tag[0]
    assert txt.find(anchor, i + 1) < 0, 'site anchor not unique: ' + site_tag[0]
    txt = txt[:i] + COMMENTS + txt[i:]
    i += len(COMMENTS)
    a1 = i + len(anchor)
    assert txt.startswith('               {' + CRLF, a1), 'open brace not right after anchor: ' + site_tag[0]
    a1 += len('               {' + CRLF)
    assert txt.startswith(INT_LINE, a1), 'int line not right after anchor: ' + site_tag[0]
    k = txt.find(SITE_CLOSE, a1)
    assert k > a1, 'site close not found: ' + site_tag[0]
    assert txt.count(SITE_CLOSE, a1, k) == 0, 'stray close inside site: ' + site_tag[0]
    body = (guard_pre(site_tag[0])
            + writes_block(side, side_lit, tops[0], tops[1], (lasthi[0] + ', ' + lasthi[1], lastlo[0] + ', ' + lastlo[1]))
            + '                  }' + CRLF
            + SITE_CLOSE)
    txt = txt[:a1] + body + txt[k + len(SITE_CLOSE):]

open(FL, 'w', encoding='utf-8', newline='').write(txt)
c1 = tally(txt)
print('FlowLogic braces before', c0, 'after', c1, 'markers', txt.count('[B250H]'))


# ---------------------------------------------------------------- CQD copy
CQD = os.path.join(IND, 'SRJ_CQD_TickBased_MT5_B250H.mq5')
txt2 = open(CQD, 'r', encoding='utf-8-sig', newline='').read()
d0 = tally(txt2)

CQD_ANCHOR = ('      PrintFormat("[SRJ-IND] [B249F] x1=%s x2=%s verdict=%d", '
              'TimeToString(time[x1], TIME_DATE|TIME_MINUTES), '
              'TimeToString(time[x2], TIME_DATE|TIME_MINUTES), verdict);') + CRLF
assert txt2.count(CQD_ANCHOR) == 1, 'CQD anchor missing or not unique'

CQD_INSERT = ('      PrintFormat("[B250H] bar=%s id=SWINGPROOF site=V%d x1=%s writePass=%s newestClosed=%s", '
              'TimeToString(time[x2], TIME_DATE|TIME_MINUTES), verdict, '
              'TimeToString(time[x1], TIME_DATE|TIME_MINUTES), '
              'TimeToString(time[ArraySize(time)-1], TIME_DATE|TIME_MINUTES), '
              'TimeToString(time[ArraySize(time)-2], TIME_DATE|TIME_MINUTES));') + CRLF
if txt2.count(CQD_INSERT) == 1:
    print('CQD already carries the [B250H] proof print; skipped')
    d1 = tally(txt2)
    print('CQD braces (unchanged)', d1, 'markers', txt2.count('[B250H]'))
else:
    assert txt2.count(CQD_INSERT) == 0, 'CQD proof print duplicated already'
    p = txt2.find(CQD_ANCHOR) + len(CQD_ANCHOR)
    txt2 = txt2[:p] + CQD_INSERT + txt2[p:]

    open(CQD, 'w', encoding='utf-8', newline='').write(txt2)
    d1 = tally(txt2)
    print('CQD braces before', d0, 'after', d1, 'markers', txt2.count('[B250H]'))
print('E2E done')
