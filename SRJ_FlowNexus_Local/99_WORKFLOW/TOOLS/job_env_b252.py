"""job_env_b252.py - B-252 inventories (include walk + run env + diff vs previous).
Modes:
  includes        -> REPORT/INCLUDES_B252.csv
  env <RunName>   -> REPORT/ENV_B252_<RunName>.csv + diff vs previous run's ENV csv (print changed rows)
Read-only outside REPORT/.
"""
import csv, hashlib, os, re, sys

BASE = os.path.dirname(os.path.abspath(__file__))
MQL5 = r"C:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5"
TERM = os.path.dirname(MQL5)
REPORT = os.path.join(MQL5, 'SRJ_FlowNexus_Local', '06_HANDOFFS', 'REPORT')
KEEP_SRC = {
    'srj_flownexus_ea.mq5', 'srj_flowlogic.mq5', 'srj_types.mqh', 'srj_state.mqh',
    'srj_orderblockmgr.mqh', 'srj_imbalancemgr.mqh', 'srj_biasengine.mqh',
}
SLICE_RE_PATH = os.path.join(MQL5, 'SRJ_FlowNexus_Local', '06_HANDOFFS', 'BUILDER_SLICE_B248.md')


def sha8(p):
    h = hashlib.sha256()
    with open(p, 'rb') as f:
        for chunk in iter(lambda: f.read(1 << 20), b''):
            h.update(chunk)
    return h.hexdigest()[:8]


def shafile(p):
    h = hashlib.sha256()
    with open(p, 'rb') as f:
        for chunk in iter(lambda: f.read(1 << 20), b''):
            h.update(chunk)
    return h.hexdigest()[:8]


def walk_includes(src, seen, rows, root):
    if src in seen or not os.path.exists(src):
        return
    seen.add(src)
    t = open(src, 'rb').read().decode('utf-8', 'replace')
    for m in re.finditer(r'#include\s+[<"]([^<">]+)[>"]', t):
        name = m.group(1).strip()
        cand = find_inc(root, name, os.path.dirname(src))
        if cand:
            rows.append(cand)
            walk_includes(cand, seen, rows, root)


def find_inc(mql5root, name, fromdir):
    p = os.path.normpath(os.path.join(fromdir, name))
    if os.path.exists(p):
        return p
    p = os.path.normpath(os.path.join(mql5root, 'Include', name.replace('/', os.sep)))
    return p if os.path.exists(p) else None


def corpus_sha_hunt(sha):
    hits = []
    for fn in ('BUILDER_SLICE_B241.md', 'BUILDER_SLICE_B249.md', 'BUILDER_SLICE_B250.md',
               'BUILDER_SLICE_B251.md', 'BUILDER_RESULT_B248.md', 'BUILDER_RESULT_B250.md',
               'BUILDER_RESULT_B251.md'):
        p = os.path.join(MQL5, 'SRJ_FlowNexus_Local', '06_HANDOFFS', fn)
        if not os.path.exists(p):
            continue
        t = open(p, encoding='utf-8', errors='replace').read()
        if sha in t:
            hits.append(fn)
    return hits


def do_includes():
    ea = os.path.join(MQL5, 'Experts', 'SRJ_FlowNexus_EA.mq5')
    fl = os.path.join(MQL5, 'Indicators', 'SRJ_FlowLogic.mq5')
    rows = []
    seen = set()
    for src, label in ((ea, 'EA'), (fl, 'FLOW')):
        walk_includes(src, seen, rows, MQL5)
    rows.extend([ea, fl])
    out = []
    out.append('path,size,mtime,sha256_8,in_B248DK_keep,corpus_record')
    for p in sorted(set(rows)):
        leaf = os.path.basename(p).lower()
        keep = 'YES' if leaf in KEEP_SRC else 'NO'
        s = shafile(p)
        st = os.stat(p)
        rec = ';'.join(corpus_sha_hunt(s)) if keep == 'NO' else '-'
        out.append('%s,%d,%s,%s,%s,%s' % (p, st.st_size, st.st_mtime, s, keep, rec))
    os.makedirs(REPORT, exist_ok=True)
    dst = os.path.join(REPORT, 'INCLUDES_B252.csv')
    open(dst, 'w', encoding='ascii', newline='').write('\r\n'.join(out) + '\r\n')
    print('INCLUDES rows=%d -> %s' % (len(out) - 1, dst))
    for line in out[1:]:
        if ',NO,' in line:
            print(line)
    include_rows = len(rows)
    print('ASSERT walked include nodes=%d' % include_rows)


def agg_dir(p):
    tf, tot, nmt = 0, 0, 0
    for root, dirs, files in os.walk(p):
        for f in files:
            try:
                st = os.stat(os.path.join(root, f))
            except OSError:
                continue
            tf += 1
            tot += st.st_size
            nmt = max(nmt, int(st.st_mtime))
    return tf, tot, nmt


def do_env(runname):
    rows = []

    def row(kind, path, count, size, mtime, sha):
        rows.append((kind, path, count, size, mtime, sha))

    ea5 = os.path.join(MQL5, 'Experts', 'SRJ_FlowNexus_EA.ex5')
    if os.path.exists(ea5):
        st = os.stat(ea5)
        row('EA_EX5', ea5, 1, st.st_size, int(st.st_mtime), sha8(ea5))
    else:
        row('EA_EX5', ea5, 0, 0, 0, 'MISSING')
    kinds = {}
    indn = 0
    for root, dirs, files in os.walk(os.path.join(MQL5, 'Indicators')):
        for f in files:
            if f.lower().endswith('.ex5'):
                fp = os.path.join(root, f)
                st = os.stat(fp)
                row('IND_EX5', fp, 1, st.st_size, int(st.st_mtime), sha8(fp))
                indn += 1
    fln = 0
    froot = os.path.join(MQL5, 'Files')
    if os.path.isdir(froot):
        for root, dirs, files in os.walk(froot):
            for f in files:
                fp = os.path.join(root, f)
                st = os.stat(fp)
                row('FILES', fp, 1, st.st_size, int(st.st_mtime), sha8(fp))
                fln += 1
    cfn = 0
    cfdir = os.path.join(TERM, 'config')
    if os.path.isdir(cfdir):
        for f in sorted(os.listdir(cfdir)):
            if f.lower().endswith('.ini'):
                fp = os.path.join(cfdir, f)
                st = os.stat(fp)
                row('CONFIG', fp, 1, st.st_size, int(st.st_mtime), shafile(fp))
                cfn += 1
    agn = agcn = 0
    for ars in (r"C:\Users\winar\AppData\Roaming\MetaQuotes\Tester\3CA1B4AB7DFED5C81B1C7F1007926D06",
                os.path.join(TERM, 'Tester')):
        if not os.path.isdir(ars):
            continue
        for d in sorted(os.listdir(ars)):
            dp = os.path.join(ars, d)
            if not os.path.isdir(dp):
                continue
            a = agg_dir(dp)
            row('AGENT_DIR', dp, a[0], a[1], a[2], '-')
            agn += 1
            if d.lower().startswith('agent-'):
                for root, dirs, files in os.walk(dp):
                    for f in files:
                        if f.lower().endswith(('.ini', '.cfg')):
                            fp = os.path.join(root, f)
                            st = os.stat(fp)
                            row('AGENT_INI', fp, 1, st.st_size, int(st.st_mtime), shafile(fp))
                            agcn += 1
    for hlab, hd in (('HISTORY', os.path.join(TERM, 'bases', 'Custom', 'history', 'EURUSD_RAW')),
                     ('TICKS', os.path.join(TERM, 'bases', 'Custom', 'ticks', 'EURUSD_RAW'))):
        if os.path.isdir(hd):
            a = agg_dir(hd)
            row(hlab, hd, a[0], a[1], a[2], '-')
            for f in os.listdir(hd):
                if f.lower().endswith('.hcc'):
                    fp = os.path.join(hd, f)
                    st = os.stat(fp)
                    row('HCC', fp, 1, st.st_size, int(st.st_mtime), sha8(fp))
    kinds['IND_EX5'] = indn
    kinds['FILES'] = fln
    kinds['CONFIG'] = cfn
    kinds['AGENT_DIR'] = agn
    kinds['AGENT_INI'] = agcn
    buf = ['kind,path,count,size,mtime,sha8']
    for k, p, c, s, m, sh in rows:
        buf.append('%s,%s,%d,%d,%d,%s' % (k, p, c, s, m, sh))
    os.makedirs(REPORT, exist_ok=True)
    dst = os.path.join(REPORT, 'ENV_B252_%s.csv' % runname)
    prev = None
    for f in sorted(os.listdir(REPORT)):
        if f.startswith('ENV_B252_') and f.endswith('.csv'):
            pf = os.path.join(REPORT, f)
            if prev is None or os.path.getmtime(pf) > os.path.getmtime(prev):
                prev = pf
    open(dst, 'w', encoding='ascii', newline='').write('\r\n'.join(buf) + '\r\n')
    print('ENV rows=%d -> %s' % (len(rows), dst))
    print('COUNTS %s' % ' '.join('%s=%d' % i for i in sorted(kinds.items()) if i[1]))
    if prev and os.path.basename(prev) != os.path.basename(dst):
        pd = {}
        for line in open(prev, encoding='ascii').read().splitlines()[1:]:
            if line.strip():
                pd[line.split(',', 2)[:2][0] + '|' + line.split(',', 2)[:2][1]] = line
        cd = {}
        for line in buf[1:]:
            cd[line.split(',', 2)[:2][0] + '|' + line.split(',', 2)[:2][1]] = line
        chg = [cd[k] for k in cd if k in pd and cd[k] != pd[k]]
        add = [cd[k] for k in cd if k not in pd]
        gone = [pd[k] for k in pd if k not in cd]
        print('DIFF vs %s changed=%d added=%d missing=%d' % (os.path.basename(prev), len(chg), len(add), len(gone)))
        for line in chg[:60] + add[:60]:
            print('ROW ' + line)
    else:
        print('DIFF first snapshot (no previous ENV)')


if __name__ == '__main__':
    if len(sys.argv) >= 2 and sys.argv[1] == 'includes':
        do_includes()
    elif len(sys.argv) >= 3 and sys.argv[1] == 'env':
        do_env(sys.argv[2])
    else:
        print('usage: includes | env <RunName>')
        sys.exit(2)
