#!/usr/bin/env python3
# srjcensus - SRJ Flow Nexus mechanical census toolchain.
# Implements the SRJ census rule set and amendments 1-23 as executable code.
# No third-party dependencies. Read-only over the source tree.
TOOL_VERSION = "1.0.0"

import sys, os, json, hashlib, codecs, string, argparse
import time, traceback

IDCH = set(string.ascii_letters + string.digits + "_")
KEYWORDS = ("for", "while", "switch", "do", "if", "else", "return",
            "break", "continue", "goto", "case")
NON_DECL_FIRST = ("if", "for", "while", "return", "switch", "case", "else", "do")
LOOPSW = ("for", "while", "switch", "do")

WRITES = []
INV = {}


def inv(name, ok):
    if name not in INV:
        INV[name] = True
    if not ok:
        INV[name] = False


# ---------------------------------------------------------------- text model

def decode_bytes(b):
    for bom, enc in ((codecs.BOM_UTF32_LE, "utf-32"), (codecs.BOM_UTF32_BE, "utf-32"),
                     (codecs.BOM_UTF8, "utf-8-sig"),
                     (codecs.BOM_UTF16_LE, "utf-16"), (codecs.BOM_UTF16_BE, "utf-16")):
        if b.startswith(bom):
            return b.decode(enc, "replace"), enc
    try:
        return b.decode("utf-8"), "utf-8"
    except UnicodeDecodeError:
        return b.decode("cp1252", "replace"), "cp1252"


def build_mask(lines):
    """Blank comments and string/char literals, preserving column positions."""
    out_all = []
    in_block = False
    for line in lines:
        out = []
        i, n = 0, len(line)
        while i < n:
            c = line[i]
            if in_block:
                if c == "*" and i + 1 < n and line[i + 1] == "/":
                    out.append("  "); i += 2; in_block = False
                else:
                    out.append(" "); i += 1
                continue
            if c == "/" and i + 1 < n and line[i + 1] == "*":
                out.append("  "); i += 2; in_block = True; continue
            if c == "/" and i + 1 < n and line[i + 1] == "/":
                out.append(" " * (n - i)); i = n; continue
            if c in ('"', "'"):
                j, closed = i + 1, -1
                while j < n:
                    if line[j] == "\\":
                        j += 2; continue
                    if line[j] == c:
                        closed = j; break
                    j += 1
                if closed >= 0:
                    out.append(" " * (closed - i + 1)); i = closed + 1; continue
                out.append(c); i += 1; continue
            out.append(c); i += 1
        m = "".join(out)
        assert len(m) == len(line)
        out_all.append(m)
    return out_all


class Src(object):
    def __init__(self, path, text, enc="utf-8", nbytes=0, sha=""):
        self.path = path
        self.name = os.path.basename(path)
        self.enc = enc
        self.nbytes = nbytes
        self.sha = sha
        lines = text.replace("\r\n", "\n").replace("\r", "\n").split("\n")
        if lines and lines[-1] == "":
            lines.pop()
        self.raw = [""] + lines
        self.mask = [""] + build_mask(lines)
        self.nlines = len(lines)
        self._defs = None

    @classmethod
    def from_file(cls, path):
        with open(path, "rb") as f:
            b = f.read()
        text, enc = decode_bytes(b)
        return cls(path, text, enc, len(b), hashlib.sha256(b).hexdigest().upper())

    @classmethod
    def from_text(cls, name, text):
        return cls(name, text, "utf-8", len(text.encode("utf-8")), "")


def sha256_file(path):
    h = hashlib.sha256()
    with open(path, "rb") as f:
        for chunk in iter(lambda: f.read(1 << 16), b""):
            h.update(chunk)
    return h.hexdigest().upper()


# ---------------------------------------------------------------- primitives

def first_token(m):
    s = m.lstrip()
    if not s:
        return ""
    if s[0] not in IDCH and s[0] != "#":
        return s[0]
    i = 0
    while i < len(s) and (s[i] in IDCH or s[i] == "#"):
        i += 1
    return s[:i]


def ends_semi(m):
    return m.rstrip().endswith(";")


def is_comment_line(src, ln):
    return src.mask[ln].strip() == "" and src.raw[ln].strip() != ""


def occ(line, pat):
    r, s = [], 0
    while True:
        k = line.find(pat, s)
        if k < 0:
            return r
        r.append(k); s = k + 1


def pat_hits(line, pat):
    """[(col, incidental_bool)] applying the substring rule per pattern edges."""
    res = []
    for k in occ(line, pat):
        okl = (pat[0] not in IDCH) or (k == 0 or line[k - 1] not in IDCH)
        e = k + len(pat)
        okr = (pat[-1] not in IDCH) or (e >= len(line) or line[e] not in IDCH)
        res.append((k, not (okl and okr)))
    return res


def containing_ident(line, k, pat):
    s = k
    while s > 0 and line[s - 1] in IDCH:
        s -= 1
    e = k + len(pat)
    while e < len(line) and line[e] in IDCH:
        e += 1
    return line[s:e]


def code_hits(src, ln, pat):
    """Non-incidental hits outside strings and comments."""
    return [c for c, incid in pat_hits(src.mask[ln], pat) if not incid]


def match_delim(src, ln, col, op, cl):
    d = 0
    i, j = ln, col
    while i <= src.nlines:
        m = src.mask[i]
        st = j if i == ln else 0
        for c in range(st, len(m)):
            ch = m[c]
            if ch == op:
                d += 1
            elif ch == cl:
                d -= 1
                if d == 0:
                    return (i, c)
        i += 1; j = 0
    return None


def match_brace(src, ln, col):
    return match_delim(src, ln, col, "{", "}")


def match_paren(src, ln, col):
    return match_delim(src, ln, col, "(", ")")


def span_text(src, a, b):
    """Verbatim text of [a..b] inclusive, plus parallel masked text."""
    (l1, c1), (l2, c2) = a, b
    if l1 == l2:
        return src.raw[l1][c1:c2 + 1], src.mask[l1][c1:c2 + 1]
    r = [src.raw[l1][c1:]]
    m = [src.mask[l1][c1:]]
    for i in range(l1 + 1, l2):
        r.append(src.raw[i]); m.append(src.mask[i])
    r.append(src.raw[l2][:c2 + 1]); m.append(src.mask[l2][:c2 + 1])
    return " ".join(r), " ".join(m)


def split_depth0(text, mtext):
    """Amendment 22. Split at commas at depth 0 of (), [], {}."""
    parts, d, start = [], 0, 0
    for i, ch in enumerate(mtext):
        if ch in "([{":
            d += 1
        elif ch in ")]}":
            d -= 1
        elif ch == "," and d == 0:
            parts.append(text[start:i]); start = i + 1
    parts.append(text[start:])
    if len("".join(parts).strip()) == 0:
        return []
    return [p.strip() for p in parts]


def rhs_of(src, ln, eq_col):
    """Amendment 11. Returns (rhs_text, terminator_on_line_bool)."""
    m, r = src.mask[ln], src.raw[ln]
    d = 0
    for c in range(eq_col + 1, len(m)):
        ch = m[c]
        if ch in "([":
            d += 1
        elif ch in ")]":
            d -= 1
        elif ch == ";" and d == 0:
            return r[eq_col + 1:c], True
    return r[eq_col + 1:], False


def assigns_to(src, ln, name):
    """Assignment-target rule. Returns (col_of_eq, rhs, term_on_line) or None."""
    m = src.mask[ln]
    if first_token(m) == "}":
        return None
    for c in code_hits(src, ln, name):
        j = c + len(name)
        while j < len(m) and m[j] in " \t":
            j += 1
        if j < len(m) and m[j] == "=" and not (j + 1 < len(m) and m[j + 1] == "="):
            rhs, term = rhs_of(src, ln, j)
            return (j, rhs, term)
    return None


def contains_equals_not_target(src, ln, name):
    return bool(code_hits(src, ln, name)) and "=" in src.mask[ln] \
        and assigns_to(src, ln, name) is None


def compares(src, ln, name):
    if not code_hits(src, ln, name):
        return False
    m = src.mask[ln]
    return ("==" in m) or ("!=" in m) or first_token(m) == "case"


def string_literal_only(src, ln, name):
    return bool(pat_hits(src.raw[ln], name)) and not code_hits(src, ln, name) \
        and not is_comment_line(src, ln)


def return_stmts(src, ln):
    """Amendment 4. [(bare_bool, expr_text)] plus raw substring hit count."""
    out = []
    for c in code_hits(src, ln, "return"):
        m, r = src.mask[ln], src.raw[ln]
        j = c + 6
        d = 0
        end = None
        for k in range(j, len(m)):
            ch = m[k]
            if ch in "([":
                d += 1
            elif ch in ")]":
                d -= 1
            elif ch == ";" and d == 0:
                end = k; break
        expr = r[j:end] if end is not None else r[j:]
        out.append((expr.strip() == "", expr.strip()))
    return out, len(occ(src.raw[ln], "return"))


def loop_headers(src, lo, hi):
    """Whole-token loop/switch headers. Returns (results, raw_diag_counts)."""
    res, diag = [], {}
    for kw in LOOPSW:
        diag[kw] = 0
    for ln in range(lo, hi + 1):
        for kw in LOOPSW:
            diag[kw] += len(occ(src.raw[ln], kw))
        ft = first_token(src.mask[ln])
        if ft in LOOPSW:
            res.append((ln, ft))
    return res, diag


def for_clauses(src, ln, col):
    """Clauses of a for header, split at unquoted ';' at paren depth 1."""
    p = src.mask[ln].find("(", col)
    if p < 0:
        return None
    close = match_paren(src, ln, p)
    if close is None:
        return None
    txt, mtxt = span_text(src, (ln, p + 1), (close[0], close[1] - 1))
    parts, d, start = [], 0, 0
    for i, ch in enumerate(mtxt):
        if ch in "([":
            d += 1
        elif ch in ")]":
            d -= 1
        elif ch == ";" and d == 0:
            parts.append(txt[start:i]); start = i + 1
    parts.append(txt[start:])
    return [p2.strip() for p2 in parts]


# ---------------------------------------------------------------- structure

def resolve_header(src, brace_ln, floor_ln):
    """Amendment 6. Returns (header_ln, gap) or (None, None)."""
    if first_token(src.mask[brace_ln]) != "{":
        ft = first_token(src.mask[brace_ln])
        if ft in ("if", "else", "for", "while", "switch", "do"):
            return brace_ln, 0
        return None, None
    ln = brace_ln - 1
    while ln >= floor_ln:
        ft = first_token(src.mask[ln])
        if ft in ("if", "else", "for", "while", "switch", "do") \
                and not ends_semi(src.mask[ln]):
            return ln, brace_ln - ln
        ln -= 1
    return None, None


def brace_map(src, open_ln, open_col, close_ln, close_col, floor_ln):
    """Amendment 19. Entries ascending by open position; every close counted."""
    entries, excluded = [], []
    stack = []
    for ln in range(open_ln, close_ln + 1):
        raw, m = src.raw[ln], src.mask[ln]
        for c, ch in enumerate(raw):
            if ch not in "{}":
                continue
            if ln == open_ln and c < open_col:
                continue
            if ln == close_ln and c > close_col:
                continue
            if m[c] != ch:
                if ch == "{":
                    excluded.append((ln, c))
                continue
            if ch == "{":
                mb = match_brace(src, ln, c)
                inv("every_brace_map_close_derived_by_counting", mb is not None)
                depth = len(stack) + 1
                hln, gap = resolve_header(src, ln, floor_ln)
                e = {"open": (ln, c), "close": mb, "depth": depth,
                     "header": hln, "gap": gap}
                entries.append(e); stack.append(e)
            else:
                if stack:
                    stack.pop()
    entries.sort(key=lambda e: e["open"])
    for i, e in enumerate(entries):
        e["index"] = i + 1
    return entries, excluded


def stmt_pos(src, ln):
    m = src.mask[ln]
    c = 0
    while c < len(m) and m[c] in " \t":
        c += 1
    return (ln, c)


def brace_stack(src, entries, ln):
    """Entries containing the statement, outermost first."""
    p = stmt_pos(src, ln)
    out = []
    for e in entries:
        if e["close"] is None:
            continue
        if e["open"] < p <= e["close"]:
            out.append(e)
    out.sort(key=lambda e: e["open"])
    for e in out:
        inv("every_stack_entry_has_open_and_close",
            e["open"] is not None and e["close"] is not None)
    return out


def nearest_if(src, stack, ln):
    for e in reversed(stack):
        h = e["header"]
        if h is None:
            continue
        if first_token(src.mask[h]) in ("if", "else"):
            return h, (h == ln)
    return None, False


def braceless_preceding_conditional(src, ln, floor_ln):
    k = ln - 1
    while k >= floor_ln and src.mask[k].strip() == "":
        k -= 1
    if k < floor_ln:
        return None
    m = src.mask[k]
    if first_token(m) in ("if", "else") and not ends_semi(m) and "{" not in m:
        return k
    return None


# ---------------------------------------------------------------- definitions

def def_candidates(src, name):
    out = []
    for ln in range(1, src.nlines + 1):
        raw = src.raw[ln]
        if not raw or raw[0] in " \t":
            continue
        if raw.lstrip().startswith("//"):
            continue
        for c in code_hits(src, ln, name):
            e = c + len(name)
            j = e
            while j < len(src.mask[ln]) and src.mask[ln][j] in " \t":
                j += 1
            if j < len(src.mask[ln]) and src.mask[ln][j] == "(":
                out.append((ln, c, j))
                break
    return out


def classify_candidate(src, ln, paren_col):
    pc = match_paren(src, ln, paren_col)
    if pc is None:
        return {"pclose": None, "kind": "DECLARATION", "reason": "PARAM LIST UNTERMINATED"}
    for k in range(ln, pc[0] + 1):
        if ends_semi(src.mask[k]):
            return {"pclose": pc, "kind": "DECLARATION", "reason": "line %d ends in ;" % k}
    ob = None
    i, j = pc[0], pc[1] + 1
    while i <= min(src.nlines, pc[0] + 12):
        m = src.mask[i]
        st = j if i == pc[0] else 0
        f = m.find("{", st)
        if f >= 0:
            ob = (i, f); break
        if m.strip() and ends_semi(m):
            break
        i += 1; j = 0
    if ob is None:
        return {"pclose": pc, "kind": "DECLARATION", "reason": "no opening brace found"}
    cb = match_brace(src, ob[0], ob[1])
    inv("brace_balance_zero_at_every_region_close", cb is not None)
    if cb is None:
        return {"pclose": pc, "kind": "DECLARATION", "reason": "brace never balanced"}
    return {"pclose": pc, "kind": "DEFINITION", "open": ob, "close": cb, "reason": ""}


class Region(object):
    def __init__(self, src, name, hdr, pclose, ob, cb):
        self.src, self.name = src, name
        self.hdr, self.pclose, self.ob, self.cb = hdr, pclose, ob, cb
        self.open_ln, self.close_ln = ob[0], cb[0]
        self.count_hdr = cb[0] - hdr + 1
        self.count_open = cb[0] - ob[0] + 1
        self._map = None

    def bmap(self):
        if self._map is None:
            self._map = brace_map(self.src, self.ob[0], self.ob[1],
                                  self.cb[0], self.cb[1], self.hdr)
        return self._map

    def entries(self):
        return self.bmap()[0]


def locate(files, name):
    """Definition-header rule with its binding fallback."""
    res = {"name": name, "candidates": [], "region": None,
           "fallback_reached": False, "fallback_lines": [], "status": ""}
    for src in files:
        for (ln, c, pcol) in def_candidates(src, name):
            info = classify_candidate(src, ln, pcol)
            res["candidates"].append({"file": src.name, "src": src, "line": ln,
                                      "pcol": pcol, "info": info})
    defs = [c for c in res["candidates"] if c["info"]["kind"] == "DEFINITION"]
    if defs:
        c = defs[0]
        res["region"] = Region(c["src"], name, c["line"], c["info"]["pclose"],
                               c["info"]["open"], c["info"]["close"])
        res["status"] = "DEFINITION AT COLUMN 0"
        return res
    res["fallback_reached"] = True
    res["status"] = ("NO CANDIDATES AT COLUMN 0" if not res["candidates"]
                     else "NO DEFINITION AT COLUMN 0")
    for src in files:
        for ln in range(1, src.nlines + 1):
            for c in code_hits(src, ln, name):
                m = src.mask[ln]
                j = c + len(name)
                while j < len(m) and m[j] in " \t":
                    j += 1
                if j < len(m) and m[j] == "(" and not ends_semi(m):
                    lead = src.raw[ln][:len(src.raw[ln]) - len(src.raw[ln].lstrip())]
                    res["fallback_lines"].append({"file": src.name, "src": src,
                                                  "line": ln, "pcol": j, "lead": lead})
                    break
    for fl in res["fallback_lines"]:
        info = classify_candidate(fl["src"], fl["line"], fl["pcol"])
        if info["kind"] == "DEFINITION":
            res["region"] = Region(fl["src"], name, fl["line"], info["pclose"],
                                   info["open"], info["close"])
            res["status"] += " / DEFINITION FOUND BY FALLBACK"
            return res
    res["status"] += " / NO DEFINITION FOUND"
    return res


def enumerate_defs(src):
    """All function definitions in a file, for enclosing-function lookup."""
    if src._defs is not None:
        return src._defs
    out = []
    for ln in range(1, src.nlines + 1):
        raw, m = src.raw[ln], src.mask[ln]
        if not raw or raw[0] in " \t":
            continue
        if raw.lstrip().startswith("//") or raw.lstrip().startswith("#"):
            continue
        ft = first_token(m)
        if ft in NON_DECL_FIRST or ft == "}" or ft == "":
            continue
        if ends_semi(m):
            continue
        p = m.find("(")
        if p <= 0:
            continue
        e = p
        while e > 0 and m[e - 1] in " \t":
            e -= 1
        s = e
        while s > 0 and m[s - 1] in IDCH:
            s -= 1
        nm = m[s:e]
        if not nm or nm[0] in string.digits or nm in NON_DECL_FIRST:
            continue
        info = classify_candidate(src, ln, p)
        if info["kind"] != "DEFINITION":
            continue
        out.append(Region(src, nm, ln, info["pclose"], info["open"], info["close"]))
    src._defs = out
    return out


def enclosing_def(src, ln):
    best = None
    for r in enumerate_defs(src):
        if r.open_ln <= ln <= r.close_ln:
            if best is None or (r.close_ln - r.open_ln) < (best.close_ln - best.open_ln):
                best = r
    return best


def parameters(region):
    """Parameter table. Returns (params, (first_line, last_line))."""
    src, hdr, pc = region.src, region.hdr, region.pclose
    p = None
    for c in code_hits(src, hdr, region.name):
        j = c + len(region.name)
        while j < len(src.mask[hdr]) and src.mask[hdr][j] in " \t":
            j += 1
        if j < len(src.mask[hdr]) and src.mask[hdr][j] == "(":
            p = j
            break
    if p is None:
        p = src.mask[hdr].find("(")
    if p < 0:
        return [], (hdr, hdr)
    txt, mtxt = span_text(src, (hdr, p + 1), (pc[0], pc[1] - 1))
    parts = split_depth0(txt, mtxt)
    out = []
    for i, ptxt in enumerate(parts):
        core = ptxt
        eq = core.find("=")
        if eq >= 0:
            core = core[:eq]
        core = core.strip()
        base = core.replace("[", " ").replace("]", " ")
        toks = [t for t in base.replace("*", " ").replace("&", " ").split() if t]
        nm = toks[-1] if toks else "UNNAMED"
        if not nm or nm[0] not in IDCH or nm[0] in string.digits:
            nm = "UNNAMED"
        out.append({"pos": i + 1, "text": ptxt.strip(), "byref": "&" in ptxt,
                    "star": "*" in ptxt, "var": nm})
    return out, (hdr, pc[0])


def call_arg_text(src, ln, name_col, name):
    p = src.mask[ln].find("(", name_col + len(name))
    if p < 0:
        return None
    pc = match_paren(src, ln, p)
    if pc is None:
        inv("no_argument_list_unterminated", False)
        return {"unterminated": True}
    txt, mtxt = span_text(src, (ln, p + 1), (pc[0], pc[1] - 1))
    inv("no_argument_list_unterminated", True)
    return {"unterminated": False, "open": (ln, p), "close": pc,
            "text": txt, "mtext": mtxt,
            "args": split_depth0(txt, mtxt), "multiline": pc[0] != ln}


# ---------------------------------------------------------------- reporting

class Rep(object):
    def __init__(self, item_id, title):
        self.id, self.title = item_id, title
        self.body, self.anchors = [], []
        self.pastes = 0

    def a(self, nm):
        self.anchors.append((nm, len(self.body) + 1))
        self.body.append("## " + nm)

    def w(self, s=""):
        self.body.append(s)

    def src_line(self, src, ln, prefix=""):
        self.pastes += 1
        self.body.append("%s%s %d: %s" % (prefix, src.name, ln, src.raw[ln]))

    def plain_line(self, src, ln):
        self.pastes += 1
        self.body.append("%d: %s" % (ln, src.raw[ln]))

    def render(self):
        head = ["SRJ CENSUS REPORT",
                "ITEM: %s   %s" % (self.id, self.title),
                "TOOL: srjcensus %s" % TOOL_VERSION,
                "RULE: no abbreviation, no cross-reference, one source line per output line",
                ""]
        idx = ["ANCHOR INDEX (%d)" % len(self.anchors)]
        for nm, rel in self.anchors:
            idx.append("  ## %s" % nm)
        idx.append("")
        off = len(head) + len(idx)
        idx2 = ["ANCHOR INDEX (%d)" % len(self.anchors)]
        for nm, rel in self.anchors:
            idx2.append("  line %d   ## %s" % (off + rel, nm))
        idx2.append("")
        return "\n".join(head + idx2 + self.body) + "\n"


def emit(outdir, rep):
    path = os.path.join(outdir, rep.id + ".txt")
    txt = rep.render()
    with open(path, "w", encoding="utf-8", newline="\n") as f:
        f.write(txt)
    WRITES.append(path)
    return path, txt.count("\n"), len(txt.encode("utf-8"))


def region_numbers(rep, region):
    rep.w("DEFINITION HEADER LINE:        %d" % region.hdr)
    rep.w("PARAMETER-LIST CLOSING LINE:   %d" % region.pclose[0])
    rep.w("OPENING BRACE LINE:            %d" % region.ob[0])
    rep.w("BRACE-COUNTED CLOSING LINE:    %d" % region.cb[0])
    rep.w("LINE COUNT (header..close):    %d   SPAN: header line through closing brace line"
          % region.count_hdr)
    rep.w("LINE COUNT (open..close):      %d   SPAN: opening brace line through closing brace line"
          % region.count_open)
    rep.w("BRACE COUNTING USED:           YES")
    inv("span_labelled_for_every_region_line_count", True)


# ---------------------------------------------------------------- declaration helpers

def depth_at(m, col):
    d = 0
    for i in range(0, col):
        if m[i] in "([":
            d += 1
        elif m[i] in ")]":
            d -= 1
    return d


def rhs_span(src, ln, eq_col):
    m = src.mask[ln]
    d = 0
    for c in range(eq_col + 1, len(m)):
        ch = m[c]
        if ch in "([":
            d += 1
        elif ch in ")]":
            d -= 1
        elif ch == ";" and d == 0:
            return eq_col + 1, c, True
    return eq_col + 1, len(m), False


def identifiers_in(ms):
    """Maximal IDCH runs not beginning with a digit. (name, col, followed_by_paren)."""
    out, i, n = [], 0, len(ms)
    while i < n:
        ch = ms[i]
        if ch in IDCH and ch not in string.digits:
            j = i
            while j < n and ms[j] in IDCH:
                j += 1
            k = j
            while k < n and ms[k] in " \t":
                k += 1
            out.append((ms[i:j], i, k < n and ms[k] == "("))
            i = j
        elif ch in IDCH:
            j = i
            while j < n and (ms[j] in IDCH or ms[j] == "."):
                j += 1
            i = j
        else:
            i += 1
    return out


def contains_g_state(src, ln):
    return bool(code_hits(src, ln, "g_state"))


def assign_sites(src, ln):
    """Generic assignment-target detection. [(target_text, eq_col, rhs, term)]."""
    m, raw = src.mask[ln], src.raw[ln]
    if first_token(m) == "}":
        return []
    out = []
    for c, ch in enumerate(m):
        if ch != "=":
            continue
        if c + 1 < len(m) and m[c + 1] == "=":
            continue
        if c > 0 and m[c - 1] in "=!<>+-*/%&|^":
            continue
        b = c - 1
        while b >= 0 and m[b] in " \t":
            b -= 1
        e = b + 1
        s = b
        while s >= 0 and (m[s] in IDCH or m[s] in ".[]>-"):
            s -= 1
        tgt = raw[s + 1:e].strip()
        if not tgt:
            continue
        a, z, term = rhs_span(src, ln, c)
        out.append((tgt, c, raw[a:z], term))
    return out


def file_scope_decl(src, ln, name):
    m, raw = src.mask[ln], src.raw[ln]
    if first_token(m) == "}":
        return False, "CLOSING BRACE"
    if not raw or raw[0] in " \t":
        return False, "NOT AT COLUMN 0"
    if raw.lstrip().startswith("//"):
        return False, "COMMENT"
    if is_comment_line(src, ln):
        return False, "COMMENT"
    if not ends_semi(m):
        return False, "DOES NOT END IN ;"
    ft = first_token(m)
    if ft in NON_DECL_FIRST:
        return False, "FIRST TOKEN IS %s" % ft
    if assigns_to(src, ln, name) is not None:
        return True, ft
    body = m.rstrip()
    if body.endswith(";"):
        body = body[:-1]
    br = body.find("[")
    if br >= 0:
        body = body[:br]
    body = body.rstrip()
    e = len(body)
    s = e
    while s > 0 and body[s - 1] in IDCH:
        s -= 1
    if body[s:e] == name:
        return True, ft
    return False, "IDENTIFIER NEITHER ASSIGNMENT TARGET NOR LAST TOKEN"


def decl_records(src, lo, hi, name):
    """Amendment 16. One record per declaration text, ascending D."""
    recs = []
    for ln in range(lo, hi + 1):
        m = src.mask[ln]
        if first_token(m) == "}":
            continue
        if is_comment_line(src, ln):
            continue
        for c in code_hits(src, ln, name):
            b = c - 1
            while b >= 0 and m[b] in " \t":
                b -= 1
            if b < 0:
                continue
            if m[b] == ".":
                continue
            if b >= 1 and m[b] == ">" and m[b - 1] == "-":
                continue
            j = c + len(name)
            while j < len(m) and m[j] in " \t":
                j += 1
            if j >= len(m) or m[j] not in "=;[":
                continue
            if m[j] == ",":
                continue
            if m[j] == "=" and j + 1 < len(m) and m[j + 1] == "=":
                continue
            is_for = first_token(m) == "for"
            if not (ends_semi(m) or is_for):
                continue
            ok, ptok = False, m[b]
            if m[b] in IDCH:
                s = b
                while s >= 0 and m[s] in IDCH:
                    s -= 1
                ptok = m[s + 1:b + 1]
                ok = ptok not in ("return", "case", "else", "if", "while",
                                  "switch", "do", "new", "delete")
            elif m[b] in "*&":
                ok = True
            elif m[b] == ",":
                ft = first_token(m)
                ok = (depth_at(m, b) == 0 and ends_semi(m)
                      and ft not in NON_DECL_FIRST and ft != "")
                ptok = ","
            if not ok:
                continue
            rhs, term = "", True
            at = assigns_to(src, ln, name)
            if at is not None:
                rhs, term = at[1], at[2]
            recs.append({"D": ln, "rhs": rhs, "term": term, "prev": ptok,
                         "has_rhs": at is not None})
            break
    recs.sort(key=lambda r: r["D"])
    return recs


# ---------------------------------------------------------------- emitters

def conv_note(rep):
    rep.w("RENDERING CONVENTION: each stack entry and each brace-map entry is")
    rep.w("emitted as several output lines, because the rule of one pasted source")
    rep.w("line per output line outranks the single-line entry shape. No entry is")
    rep.w("abbreviated, cross-referenced or rendered as prose.")
    rep.w("")


def emit_entry(rep, src, e, want_state):
    o, c = e["open"], e["close"]
    rep.w("  ENTRY %d | OPEN %d | CLOSE %s | DEPTH %d"
          % (e["index"], o[0], ("%d" % c[0]) if c else "UNBALANCED", e["depth"]))
    rep.pastes += 1
    rep.w("  BRACE LINE %d: %s" % (o[0], src.raw[o[0]]))
    h = e["header"]
    if h is None:
        rep.w("  HEADER UNRESOLVED")
        rep.w("  HEADER IS for/while/switch/do: NO (UNRESOLVED)")
        if want_state:
            rep.w("  CONTAINS-g_state: NO (HEADER UNRESOLVED)")
        return
    rep.pastes += 1
    rep.w("  HEADER %d: %s" % (h, src.raw[h]))
    if e.get("gap"):
        rep.w("  HEADER-TO-BRACE GAP: %d line(s)" % e["gap"])
    ft = first_token(src.mask[h])
    rep.w("  HEADER IS for/while/switch/do: %s"
          % ("YES - %s" % ft if ft in LOOPSW else "NO"))
    if want_state:
        rep.w("  CONTAINS-g_state: %s" % ("YES" if contains_g_state(src, h) else "NO"))


def emit_stack(rep, src, stack, want_state=True):
    if not stack:
        rep.w("FULL OPEN-BRACE STACK: NOT ENCLOSED - no brace entry contains this line")
        rep.w("STACK ENTRY COUNT: 0")
        return
    rep.w("FULL OPEN-BRACE STACK, outermost first, every entry in full:")
    if len(stack) == 1:
        rep.w("THIS STACK HAS EXACTLY ONE ENTRY, reported in full below.")
    for e in stack:
        emit_entry(rep, src, e, want_state)
    rep.w("STACK ENTRY COUNT: %d" % len(stack))
    inv("every_stack_entry_has_open_and_close",
        all(e["close"] is not None for e in stack))


def emit_nearest_if(rep, src, stack, ln, floor_ln):
    h, same = nearest_if(src, stack, ln)
    if h is not None:
        rep.pastes += 1
        rep.w("NEAREST ENCLOSING \"if\" BY BRACE SCOPE %d: %s%s"
              % (h, src.raw[h], "   [SAME-LINE]" if same else ""))
        return
    rep.w("NEAREST ENCLOSING \"if\" BY BRACE SCOPE: NOT ENCLOSED")
    b = braceless_preceding_conditional(src, ln, floor_ln)
    if b is not None:
        rep.pastes += 1
        rep.w("BRACELESS PRECEDING CONDITIONAL %d: %s" % (b, src.raw[b]))
        rep.w("  This line opens no brace and therefore does not appear in the stack.")


def emit_region_block(rep, region, label):
    rep.w("%s: %s   FILE %s" % (label, region.name, region.src.name))
    region_numbers(rep, region)


def emit_stack_for(rep, region, ln, want_state=True):
    st = brace_stack(region.src, region.entries(), ln)
    emit_stack(rep, region.src, st, want_state)
    return st


def emit_brace_map(rep, region):
    entries, excluded = region.bmap()
    rep.w("BRACE MAP, every \"{\" from the region's opening brace through its closing brace:")
    for e in entries:
        emit_entry(rep, region.src, e, True)
    rep.w("BRACE MAP ENTRY COUNT: %d" % len(entries))
    rep.w("MAXIMUM DEPTH: %d" % (max([e["depth"] for e in entries]) if entries else 0))
    if excluded:
        for (ln, col) in excluded:
            rep.pastes += 1
            rep.w("EXCLUDED BRACE, inside a string or a comment, line %d: %s"
                  % (ln, region.src.raw[ln]))
    rep.w("EXCLUDED BRACE COUNT: %d" % len(excluded))
    rep.w("EVERY CLOSE DERIVED BY BRACE COUNTING FROM ITS OWN \"{\": YES")
    return entries, excluded


def emit_call_block(rep, ctx, src, ln, name, want_state=True):
    """Argument list, positional split, enclosing function, full stack."""
    col = code_hits(src, ln, name)
    if not col:
        rep.w("CALL SITE PATTERN NOT PRESENT OUTSIDE STRING OR COMMENT")
        return None
    a = call_arg_text(src, ln, col[0], name)
    if a is None:
        rep.w("ARGUMENT LIST: NO OPENING PAREN FOUND")
        return None
    if a.get("unterminated"):
        rep.w("ARGUMENT LIST: MATCHING \")\" NOT FOUND IN FILE")
        return None
    if a["multiline"]:
        rep.w("ARGUMENT LIST CONTINUES ON NEXT LINE")
        for k in range(ln, a["close"][0] + 1):
            rep.pastes += 1
            rep.w("%d: %s" % (k, src.raw[k]))
        rep.w("JOINED ARGUMENT TEXT: %s" % a["text"].strip())
    else:
        rep.w("ARGUMENT LIST TEXT: %s" % a["text"].strip())
    args = a["args"]
    if not args:
        rep.w("ARGUMENT COUNT 0")
    else:
        for i, t in enumerate(args):
            rep.w("POSITIONAL ARGUMENT %d | %s" % (i + 1, t))
        rep.w("ARGUMENT COUNT: %d" % len(args))
    reg = enclosing_def(src, ln)
    if reg is None:
        rep.w("ENCLOSING FUNCTION: NO ENCLOSING FUNCTION - FILE SCOPE")
        rep.w("FULL OPEN-BRACE STACK: NO ENCLOSING FUNCTION - FILE SCOPE")
        rep.w("STACK ENTRY COUNT: 0")
        return {"args": args, "region": None}
    rep.w("ENCLOSING FUNCTION: %s" % reg.name)
    region_numbers(rep, reg)
    emit_stack_for(rep, reg, ln, want_state)
    return {"args": args, "region": reg}


# ---------------------------------------------------------------- items

def item_census_assign(ctx, it):
    pats = it["patterns"]
    rep = Rep(it["id"], "Assignment-target census: " + ", ".join(pats))
    conv_note(rep)
    recs, sum_nlines, pasted = [], 0, 0
    for src in ctx.files:
        rep.a("FILE %s" % src.name)
        for p in pats:
            n, incs = 0, []
            for ln in range(1, src.nlines + 1):
                for k, incid in pat_hits(src.raw[ln], p):
                    n += 1
                    if incid:
                        incs.append((ln, containing_ident(src.raw[ln], k, p)))
            rep.w("N_OCC %s: %d" % (p, n))
            rep.w("  INCIDENTAL OCCURRENCES OF %s: %d" % (p, len(incs)))
            for (ln, ci) in incs:
                rep.pastes += 1
                rep.w("  INCIDENTAL %d: %s" % (ln, src.raw[ln]))
                rep.w("    CONTAINING IDENTIFIER: %s" % ci)
        hits = {}
        for ln in range(1, src.nlines + 1):
            if is_comment_line(src, ln):
                continue
            for p in pats:
                at = assigns_to(src, ln, p)
                if at is not None:
                    hits.setdefault(ln, []).append((p, at[1], at[2]))
        rep.w("N_LINES, single per-file count of distinct assignment-target lines: %d"
              % len(hits))
        sum_nlines += len(hits)
        for p in pats:
            if not any(q == p for v in hits.values() for q, _, _ in v):
                rep.w("ASSIGNMENT-TARGET LINES FOR %s: ABSENT" % p)
        for ln in sorted(hits):
            rep.src_line(src, ln)
            pasted += 1
            for (p, rhs, term) in hits[ln]:
                if term:
                    rep.w("  ASSIGNS-TO %s | RHS %s" % (p, rhs))
                else:
                    rep.w("  ASSIGNS-TO %s | RHS TERMINATOR NOT ON LINE" % p)
                    rep.w("  REMAINDER VERBATIM: %s" % rhs)
            recs.append({"src": src, "line": ln, "assigns": hits[ln]})
        rep.w("")
    rep.a("TOTALS")
    rep.w("DISTINCT ASSIGNMENT-TARGET LINES PASTED: %d" % pasted)
    rep.w("SUM OF PER-FILE N_LINES: %d" % sum_nlines)
    rep.w("N_LINES WAS NEVER SUMMED ACROSS PATTERNS: confirmed by construction")
    inv("n_lines_equals_distinct_paste_count", pasted == sum_nlines)
    ctx.results[it["id"]] = recs
    ctx.counts["W_assign_lines"] = len(recs)
    return rep


def item_classify_scope(ctx, it):
    src_recs = ctx.results[it["source_item"]]
    rep = Rep(it["id"], "Scope classification and enclosing functions")
    conv_note(rep)
    out, nfs, nif = [], 0, 0
    for r in src_recs:
        src, ln = r["src"], r["line"]
        rep.a("%s LINE %d" % (src.name, ln))
        rep.src_line(src, ln)
        names = [p for p, _, _ in r["assigns"]]
        ok, why = False, ""
        for nm in names:
            ok, why = file_scope_decl(src, ln, nm)
            if ok:
                break
        if ok:
            rep.w("CLASSIFICATION: FILE-SCOPE DECLARATION")
            rep.w("DECLARED TYPE VERBATIM, first token of the line: %s" % why)
            rep.w("ENCLOSING FUNCTION: NO ENCLOSING FUNCTION - FILE SCOPE")
            nfs += 1
            out.append({"src": src, "line": ln, "kind": "FILE-SCOPE",
                        "type": why, "region": None, "assigns": r["assigns"]})
        else:
            if why == "CLOSING BRACE":
                rep.w("CLASSIFICATION: CLOSING BRACE - NEVER A DECLARATION")
            rep.w("CLASSIFICATION: IN-FUNCTION")
            rep.w("FILE-SCOPE DECLARATION TEST FAILED ON: %s" % why)
            reg = enclosing_def(src, ln)
            if reg is None:
                rep.w("ENCLOSING FUNCTION: NO ENCLOSING FUNCTION - FILE SCOPE")
                out.append({"src": src, "line": ln, "kind": "IN-FUNCTION",
                            "type": None, "region": None, "assigns": r["assigns"]})
            else:
                rep.w("ENCLOSING FUNCTION: %s" % reg.name)
                region_numbers(rep, reg)
                out.append({"src": src, "line": ln, "kind": "IN-FUNCTION",
                            "type": None, "region": reg, "assigns": r["assigns"]})
            nif += 1
        rep.w("NO ENCLOSING FUNCTION WAS PASTED IN THIS ITEM.")
        rep.w("")
    rep.a("TOTALS")
    rep.w("FILE-SCOPE DECLARATION LINES: %d" % nfs)
    rep.w("IN-FUNCTION LINES: %d" % nif)
    ctx.results[it["id"]] = out
    ctx.counts["W_file_scope"] = nfs
    ctx.counts["W_in_function"] = nif
    return rep


def item_stacks_per_line(ctx, it):
    recs = [r for r in ctx.results[it["source_item"]] if r["kind"] == "IN-FUNCTION"]
    recs.sort(key=lambda r: (r["src"].name, r["line"]))
    rep = Rep(it["id"], "Full open-brace stack per in-function zone write")
    conv_note(rep)
    with_state, without_state, with_loop, nstacks = [], [], [], 0
    for r in recs:
        src, ln, reg = r["src"], r["line"], r["region"]
        rep.a("%s LINE %d" % (src.name, ln))
        rep.pastes += 1
        rep.w("LINE %d: %s" % (ln, src.raw[ln]))
        if reg is None:
            rep.w("FULL OPEN-BRACE STACK: NO ENCLOSING FUNCTION - FILE SCOPE")
            rep.w("STACK ENTRY COUNT: 0")
            rep.w("")
            without_state.append(ln)
            continue
        st = emit_stack_for(rep, reg, ln, True)
        nstacks += 1
        hs = any(e["header"] is not None and contains_g_state(src, e["header"])
                 for e in st)
        hl = any(e["header"] is not None
                 and first_token(src.mask[e["header"]]) in LOOPSW for e in st)
        (with_state if hs else without_state).append(ln)
        if hl:
            with_loop.append(ln)
        emit_nearest_if(rep, src, st, ln, reg.hdr)
        rep.w("")
    rep.a("AGGREGATES")
    rep.w("IN-FUNCTION LINE COUNT: %d" % len(recs))
    rep.w("LINES WHOSE STACK CONTAINS AT LEAST ONE ENTRY WITH CONTAINS-g_state YES: %d"
          % len(with_state))
    rep.w("  LINE NUMBERS: %s" % (", ".join(str(x) for x in with_state) or "NONE"))
    rep.w("LINES WHOSE STACK CONTAINS NO ENTRY WITH CONTAINS-g_state YES: %d"
          % len(without_state))
    rep.w("  LINE NUMBERS: %s" % (", ".join(str(x) for x in without_state) or "NONE"))
    rep.w("LINES WHOSE STACK CONTAINS AN ENTRY WHOSE HEADER IS for/while/switch/do: %d"
          % len(with_loop))
    rep.w("  LINE NUMBERS: %s" % (", ".join(str(x) for x in with_loop) or "NONE"))
    ctx.counts["W_stacks"] = nstacks
    ctx.counts["W_stacks_g_state"] = len(with_state)
    ctx.counts["W_stacks_loop"] = len(with_loop)
    return rep


def item_rhs_identifier_records(ctx, it):
    recs = [r for r in ctx.results[it["source_item"]] if r["kind"] == "IN-FUNCTION"]
    rep = Rep(it["id"], "RHS identifier set and declaration records")
    conv_note(rep)
    idents, owner = [], {}
    for r in recs:
        src, ln = r["src"], r["line"]
        for (p, rhs, term) in r["assigns"]:
            at = assigns_to(src, ln, p)
            if at is None:
                continue
            a, z, _ = rhs_span(src, ln, at[0])
            for (nm, _c, called) in identifiers_in(src.mask[ln][a:z]):
                if called:
                    continue
                if nm not in idents:
                    idents.append(nm)
                owner.setdefault(nm, []).append(r)
    rep.a("IDENTIFIER SET")
    rep.w("SOURCE: right-hand-side text of every in-function assignment-target line")
    for nm in idents:
        rep.w("IDENTIFIER: %s" % nm)
    rep.w("DISTINCT IDENTIFIER COUNT: %d" % len(idents))
    rep.w("")
    for nm in idents:
        for r in owner[nm]:
            reg = r["region"]
            rep.a("IDENTIFIER %s IN %s" % (nm, reg.name if reg else "FILE SCOPE"))
            rep.w("IDENTIFIER: %s" % nm)
            if reg is None:
                rep.w("PASTE SEARCHED: NO ENCLOSING FUNCTION - FILE SCOPE")
                rep.w("DECLARATION RECORD COUNT: 0")
                rep.w("ASSIGNMENT-TARGET COUNT: 0")
                rep.w("")
                continue
            rep.w("PASTE SEARCHED: %s brace-counted range of %s, lines %d through %d"
                  % (reg.src.name, reg.name, reg.hdr, reg.close_ln))
            dr = decl_records(reg.src, reg.hdr, reg.close_ln, nm)
            if not dr:
                rep.w("NO DECLARATION RECORD IN THIS RANGE")
            for d in dr:
                rep.pastes += 1
                rep.w("RECORD %s@%d" % (nm, d["D"]))
                rep.w("  %d: %s" % (d["D"], reg.src.raw[d["D"]]))
                rep.w("  D %d" % d["D"])
                rep.w("  PRECEDING TOKEN: %s" % d["prev"])
                if not d["has_rhs"]:
                    rep.w("  RHS ABSENT - DECLARATION CARRIES NO \"=\"")
                elif d["term"]:
                    rep.w("  RHS %s" % d["rhs"])
                else:
                    rep.w("  RHS TERMINATOR NOT ON LINE")
                    rep.w("  REMAINDER VERBATIM: %s" % d["rhs"])
            rep.w("DECLARATION RECORD COUNT: %d" % len(dr))
            ats = []
            for ln2 in range(reg.hdr, reg.close_ln + 1):
                if is_comment_line(reg.src, ln2):
                    continue
                at = assigns_to(reg.src, ln2, nm)
                if at is not None:
                    ats.append((ln2, at[1], at[2]))
            if not ats:
                rep.w("ASSIGNMENT-TARGET LINES: ABSENT")
            for (ln2, rhs, term) in ats:
                rep.pastes += 1
                rep.w("%d: %s" % (ln2, reg.src.raw[ln2]))
                if term:
                    rep.w("  RHS %s" % rhs)
                else:
                    rep.w("  RHS TERMINATOR NOT ON LINE")
                    rep.w("  REMAINDER VERBATIM: %s" % rhs)
            rep.w("ASSIGNMENT-TARGET COUNT: %d" % len(ats))
            rep.w("NO SCOPE TEST IS REPORTED IN THIS ITEM.")
            rep.w("")
    ctx.counts["W_rhs_identifiers"] = len(idents)
    return rep


def item_locate_region(ctx, it):
    name = it["name"]
    res = locate(ctx.files, name)
    rep = Rep(it["id"], "Definition-header classification for " + name)
    conv_note(rep)
    rep.a("CANDIDATES")
    rep.w("PATTERN SUPPLIED AS A FULL IDENTIFIER: %s" % name)
    if not res["candidates"]:
        rep.w("CANDIDATE COUNT: 0")
    for c in res["candidates"]:
        rep.pastes += 1
        rep.w("CANDIDATE %s %d: %s" % (c["file"], c["line"],
                                       c["src"].raw[c["line"]]))
        pc = c["info"]["pclose"]
        rep.w("  PARAMETER-LIST CLOSING LINE: %s"
              % ("%d" % pc[0] if pc else "NOT FOUND"))
        rep.w("  CLASSIFICATION: %s" % c["info"]["kind"])
        if c["info"]["reason"]:
            rep.w("  BASIS: %s" % c["info"]["reason"])
    rep.w("CANDIDATE COUNT: %d" % len(res["candidates"]))
    rep.w("STATUS: %s" % res["status"])
    rep.a("FALLBACK")
    rep.w("FALLBACK REACHED: %s" % ("YES" if res["fallback_reached"] else "NO"))
    for fl in res["fallback_lines"]:
        rep.pastes += 1
        rep.w("%s %d: %s" % (fl["file"], fl["line"], fl["src"].raw[fl["line"]]))
        rep.w("  EXACT LEADING WHITESPACE: %d character(s), verbatim between pipes: |%s|"
              % (len(fl["lead"]), fl["lead"]))
    if res["fallback_reached"]:
        rep.w("FALLBACK LINE COUNT: %d" % len(res["fallback_lines"]))
    rep.a("DEFINITION")
    if res["region"] is None:
        rep.w("NO DEFINITION FOUND")
        ctx.results[it["id"]] = None
        return rep
    emit_region_block(rep, res["region"], "DEFINITION")
    ctx.results[it["id"]] = res["region"]
    return rep


def item_paste_region(ctx, it):
    reg = ctx.results[it["source_item"]]
    rep = Rep(it["id"], "Region paste")
    conv_note(rep)
    if reg is None:
        rep.a("PASTE")
        rep.w("NO DEFINITION FOUND - NOTHING TO PASTE")
        ctx.results[it["id"]] = None
        return rep
    bound = int(it["whole_if_at_most"])
    rep.a("LINE COUNT FIRST")
    region_numbers(rep, reg)
    src = reg.src
    lo, hi, mode = reg.hdr, reg.cb[0], "WHOLE"
    if reg.count_hdr > bound:
        mode = "TERMINATOR-BOUNDED"
        last = None
        for ln in range(reg.hdr, reg.cb[0] + 1):
            sts, _ = return_stmts(src, ln)
            if sts:
                last = ln
        rep.w("EXCEEDS %d" % bound)
        if last is None:
            hi = reg.cb[0]
            rep.w("NO RETURN STATEMENT IN REGION - PASTING HEADER THROUGH CLOSING BRACE")
        else:
            hi = last
        rep.w("PASTE RANGE: %d through %d inclusive" % (lo, hi))
    else:
        rep.w("WHOLE - line count %d is at most %d" % (reg.count_hdr, bound))
        rep.w("PASTE RANGE: %d through %d inclusive, header through closing brace"
              % (lo, hi))
    rep.a("PASTE")
    n = 0
    for ln in range(lo, hi + 1):
        rep.plain_line(src, ln)
        n += 1
    rep.w("PASTED LINE COUNT: %d" % n)
    rep.w("REPORTED RANGE LINE COUNT: %d" % (hi - lo + 1))
    inv("paste_line_count_equals_reported_count", n == (hi - lo + 1))
    ctx.results[it["id"]] = {"region": reg, "lo": lo, "hi": hi, "mode": mode}
    ctx.paste_modes.append((it["id"], reg.name, mode, reg.count_hdr))
    return rep


def item_parameters(ctx, it):
    reg = ctx.results[it["source_item"]]
    rep = Rep(it["id"], "Parameter table")
    conv_note(rep)
    rep.a("PARAMETERS")
    if reg is None:
        rep.w("NO DEFINITION FOUND - NO PARAMETER LIST")
        ctx.results[it["id"]] = []
        return rep
    ps, (a, b) = parameters(reg)
    if b > a:
        rep.w("PARAMETER LIST SPANS MORE THAN ONE LINE. Every line pasted below.")
        for ln in range(a, b + 1):
            rep.plain_line(reg.src, ln)
    else:
        rep.plain_line(reg.src, a)
    if not ps:
        rep.w("PARAMETER COUNT: 0")
        ctx.results[it["id"]] = []
        return rep
    for p in ps:
        rep.w("%d | %s | %s | CONTAINS-ASTERISK: %s | %s"
              % (p["pos"], p["text"], "BY REFERENCE" if p["byref"] else "BY VALUE",
                 "yes" if p["star"] else "no", p["var"]))
    rep.w("PARAMETER COUNT: %d" % len(ps))
    ctx.results[it["id"]] = ps
    return rep


def item_census_name_calls(ctx, it):
    name = it["name"]
    defreg = ctx.results.get(it.get("region_item"))
    rep = Rep(it["id"], "Census and call sites for " + name)
    conv_note(rep)
    sites, ndef, ncall = [], 0, 0
    for src in ctx.files:
        rep.a("FILE %s" % src.name)
        nocc, lines = 0, {}
        for ln in range(1, src.nlines + 1):
            hs = pat_hits(src.raw[ln], name)
            if hs:
                nocc += len(hs)
                lines[ln] = hs
        rep.w("N_OCC %s: %d" % (name, nocc))
        rep.w("N_LINES, single per-file count of distinct matching lines: %d" % len(lines))
        if not lines:
            rep.w("NO CALL IN THIS FILE")
        for ln in sorted(lines):
            rep.src_line(src, ln)
            hs = lines[ln]
            if all(i for _c, i in hs):
                rep.w("  INCIDENTAL")
                for c, i in hs:
                    if i:
                        rep.w("  CONTAINING IDENTIFIER: %s"
                              % containing_ident(src.raw[ln], c, name))
                continue
            for c, i in hs:
                if i:
                    rep.w("  INCIDENTAL OCCURRENCE AT COLUMN %d, CONTAINING IDENTIFIER: %s"
                          % (c, containing_ident(src.raw[ln], c, name)))
            kind = "OTHER"
            if defreg is not None and src is defreg.src and ln == defreg.hdr:
                kind = "DEFINITION HEADER"
                ndef += 1
            else:
                raw = src.raw[ln]
                at0 = bool(raw) and raw[0] not in " \t"
                m = src.mask[ln]
                cc = code_hits(src, ln, name)
                follows = False
                if cc:
                    j = cc[0] + len(name)
                    while j < len(m) and m[j] in " \t":
                        j += 1
                    follows = j < len(m) and m[j] == "("
                if at0 and follows:
                    info = classify_candidate(src, ln, m.find("(", cc[0]))
                    kind = "DECLARATION" if info["kind"] == "DECLARATION" \
                        else "DEFINITION HEADER"
                elif follows:
                    kind = "CALL SITE"
            rep.w("  CLASSIFICATION: %s" % kind)
            if kind == "CALL SITE":
                ncall += 1
                sites.append({"src": src, "line": ln})
        rep.w("")
    for s in sites:
        src, ln = s["src"], s["line"]
        rep.a("CALL SITE %s LINE %d" % (src.name, ln))
        rep.pastes += 1
        rep.w("%s %d: %s" % (src.name, ln, src.raw[ln]))
        r = emit_call_block(rep, ctx, src, ln, name, True)
        if r:
            s["args"] = r["args"]
            s["region"] = r["region"]
        rep.w("NO ENCLOSING FUNCTION WAS PASTED IN THIS ITEM.")
        rep.w("")
    rep.a("TOTALS")
    rep.w("DEFINITION HEADER LINES: %d" % ndef)
    rep.w("CALL SITES: %d" % ncall)
    ctx.results[it["id"]] = sites
    ctx.counts[it["id"] + "_calls"] = ncall
    ctx.counts[it["id"] + "_defs"] = ndef
    ctx.counts["arg_lists_split"] = ctx.counts.get("arg_lists_split", 0) + len(sites)
    return rep


def item_arg_param_correspondence(ctx, it):
    sites = ctx.results[it["calls_item"]]
    ps = ctx.results[it["params_item"]]
    rep = Rep(it["id"], "Positional correspondence, computed by position only")
    conv_note(rep)
    zone = it["zone_patterns"]
    mismatch, recv = 0, []
    for s in sites:
        rep.a("CALL SITE %s LINE %d" % (s["src"].name, s["line"]))
        args = s.get("args", [])
        rep.w("ARGUMENT COUNT: %d" % len(args))
        rep.w("PARAMETER COUNT: %d" % len(ps))
        if len(args) != len(ps):
            rep.w("POSITION COUNT MISMATCH")
            mismatch += 1
        for i, t in enumerate(args):
            pos = i + 1
            p = ps[i] if i < len(ps) else None
            rep.w("%s %d | ARG %d | %s | PARAMETER %s | %s | %s | "
                  "ARGUMENT TEXT IS EXACTLY \"%s\": %s | "
                  "ARGUMENT TEXT IS EXACTLY \"%s\": %s"
                  % (s["src"].name, s["line"], pos, t,
                     ("%d" % pos) if p else "NO PARAMETER AT THIS POSITION",
                     p["text"] if p else "NO PARAMETER AT THIS POSITION",
                     p["var"] if p else "NO PARAMETER AT THIS POSITION",
                     zone[0], "yes" if t.strip() == zone[0] else "no",
                     zone[1], "yes" if t.strip() == zone[1] else "no"))
            if p and t.strip() in zone and p["pos"] not in [q["pos"] for q in recv]:
                recv.append(p)
        for j in range(len(args), len(ps)):
            rep.w("%s %d | NO ARGUMENT AT THIS POSITION | PARAMETER %d | %s | %s"
                  % (s["src"].name, s["line"], ps[j]["pos"], ps[j]["text"],
                     ps[j]["var"]))
        rep.w("")
    recv.sort(key=lambda p: p["pos"])
    rep.a("ZONE-RECEIVING PARAMETERS")
    for p in recv:
        rep.w("%d | %s | %s" % (p["pos"], p["text"],
                                "BY REFERENCE" if p["byref"] else "BY VALUE"))
    rep.w("ZONE-RECEIVING PARAMETER COUNT: %d" % len(recv))
    rep.w("POSITION COUNT MISMATCH RESULTS: %d" % mismatch)
    ctx.results[it["id"]] = recv
    ctx.counts["F_mismatch"] = mismatch
    ctx.counts["F_zone_params"] = len(recv)
    return rep


def item_parameter_use_trace(ctx, it):
    recv = ctx.results[it["source_item"]]
    pst = ctx.results[it["paste_item"]]
    rep = Rep(it["id"], "Per-parameter use trace inside the region paste")
    conv_note(rep)
    nat = 0
    if pst is None:
        rep.a("TRACE")
        rep.w("NO PASTE AVAILABLE")
        ctx.counts["F_param_assign_targets"] = 0
        return rep
    src, lo, hi = pst["region"].src, pst["lo"], pst["hi"]
    for p in recv:
        nm = p["var"]
        rep.a("PARAMETER %d %s" % (p["pos"], nm))
        rep.w("PASTE SEARCHED: %s lines %d through %d" % (src.name, lo, hi))
        rep.w("PARAMETER: %d | %s | %s"
              % (p["pos"], nm, "BY REFERENCE" if p["byref"] else "BY VALUE"))
        occl = 0
        for ln in range(lo, hi + 1):
            hs = pat_hits(src.raw[ln], nm)
            if not hs:
                continue
            occl += 1
            rep.plain_line(src, ln)
            for c, i in hs:
                if i:
                    rep.w("  INCIDENTAL AT COLUMN %d, CONTAINING IDENTIFIER: %s"
                          % (c, containing_ident(src.raw[ln], c, nm)))
        rep.w("OCCURRENCE COUNT: %d" % occl)
        ats = []
        for ln in range(lo, hi + 1):
            if is_comment_line(src, ln):
                continue
            at = assigns_to(src, ln, nm)
            if at is not None:
                ats.append((ln, at[1], at[2]))
        if not ats:
            rep.w("ASSIGNMENT-TARGET LINES: ABSENT")
        for (ln, rhs, term) in ats:
            rep.plain_line(src, ln)
            if term:
                rep.w("  RHS %s" % rhs)
            else:
                rep.w("  RHS TERMINATOR NOT ON LINE")
                rep.w("  REMAINDER VERBATIM: %s" % rhs)
        rep.w("ASSIGNMENT-TARGET COUNT: %d" % len(ats))
        nat += len(ats)
        cmps = [ln for ln in range(lo, hi + 1)
                if not is_comment_line(src, ln) and compares(src, ln, nm)]
        if not cmps:
            rep.w("COMPARISON LINES: ABSENT")
        for ln in cmps:
            rep.plain_line(src, ln)
        conds = [ln for ln in range(lo, hi + 1)
                 if first_token(src.mask[ln]) in ("if", "else")
                 and code_hits(src, ln, nm)]
        if not conds:
            rep.w("CONDITIONAL LINES CONTAINING THE NAME: ABSENT")
        for ln in conds:
            rep.plain_line(src, ln)
            emit_stack_for(rep, pst["region"], ln, True)
        lh, diag = loop_headers(src, lo, hi)
        lhn = [(ln, k) for (ln, k) in lh if code_hits(src, ln, nm)]
        if not lhn:
            rep.w("for/while/switch/do HEADERS CONTAINING THE NAME: ABSENT")
        for (ln, k) in lhn:
            rep.plain_line(src, ln)
            rep.w("  HEADER KEYWORD: %s" % k)
        rets = []
        for ln in range(lo, hi + 1):
            sts, _raw = return_stmts(src, ln)
            for (bare, expr) in sts:
                if code_hits(src, ln, nm):
                    rets.append((ln, bare, expr))
        if not rets:
            rep.w("RETURN STATEMENTS CONTAINING THE NAME: ABSENT")
        for (ln, bare, expr) in rets:
            rep.plain_line(src, ln)
            rep.w("  %s" % ("BARE" if bare else "CARRIES-AN-EXPRESSION"))
            if not bare:
                rep.w("  RETURNED EXPRESSION TEXT: %s" % expr)
        rep.w("")
    if not recv:
        rep.a("TRACE")
        rep.w("NO ZONE-RECEIVING PARAMETER - NOTHING TO TRACE")
    ctx.counts["F_param_assign_targets"] = nat
    return rep


def item_statement_inventory(ctx, it):
    pst = ctx.results[it["paste_item"]]
    rep = Rep(it["id"], "Statement inventory inside the region paste")
    conv_note(rep)
    if pst is None:
        rep.a("INVENTORY")
        rep.w("NO PASTE AVAILABLE")
        ctx.results[it["id"]] = []
        return rep
    src, lo, hi = pst["region"].src, pst["lo"], pst["hi"]
    rep.a("PASTE SEARCHED")
    rep.w("PASTE SEARCHED: %s lines %d through %d, produced by item %s"
          % (src.name, lo, hi, it["paste_item"]))
    rep.a("RETURN STATEMENTS")
    ns, nr = 0, 0
    for ln in range(lo, hi + 1):
        sts, raw = return_stmts(src, ln)
        nr += raw
        for (bare, expr) in sts:
            ns += 1
            rep.plain_line(src, ln)
            rep.w("  %s" % ("BARE" if bare else "CARRIES-AN-EXPRESSION"))
            if not bare:
                rep.w("  RETURNED EXPRESSION TEXT: %s" % expr)
    if ns == 0:
        rep.w("ABSENT")
    rep.w("RETURN STATEMENT COUNT: %d" % ns)
    rep.w("RAW SUBSTRING-HIT COUNT, DIAGNOSTIC ONLY: %d" % nr)
    rep.a("LOOP AND SWITCH HEADERS")
    lh, diag = loop_headers(src, lo, hi)
    if not lh:
        rep.w("ABSENT")
    for (ln, k) in lh:
        rep.plain_line(src, ln)
        rep.w("  HEADER KEYWORD: %s" % k)
    rep.w("WHOLE-TOKEN RESULT COUNT: %d" % len(lh))
    for k in LOOPSW:
        rep.w("RAW SUBSTRING COUNT FOR %s, DIAGNOSTIC ONLY: %d" % (k, diag[k]))
    rep.a("ASSIGNMENT-TARGET LINES")
    na = 0
    for ln in range(lo, hi + 1):
        if is_comment_line(src, ln):
            continue
        sites = assign_sites(src, ln)
        if not sites:
            continue
        rep.plain_line(src, ln)
        for (tgt, _c, rhs, term) in sites:
            na += 1
            if term:
                rep.w("  ASSIGNS-TO %s | RHS %s" % (tgt, rhs))
            else:
                rep.w("  ASSIGNS-TO %s | RHS TERMINATOR NOT ON LINE" % tgt)
                rep.w("  REMAINDER VERBATIM: %s" % rhs)
    if na == 0:
        rep.w("ABSENT")
    rep.w("ASSIGNMENT-TARGET RECORD COUNT: %d" % na)
    zlines = []
    for pat in it["patterns"]:
        rep.a("PATTERN %s" % pat)
        found = False
        for ln in range(lo, hi + 1):
            hs = pat_hits(src.raw[ln], pat)
            if not hs:
                continue
            found = True
            rep.plain_line(src, ln)
            for c, i in hs:
                if i:
                    rep.w("  INCIDENTAL AT COLUMN %d, CONTAINING IDENTIFIER: %s"
                          % (c, containing_ident(src.raw[ln], c, pat)))
            if pat in it.get("zone_patterns", []):
                if ln not in zlines:
                    zlines.append(ln)
        if not found:
            rep.w("ABSENT")
    ctx.results[it["id"]] = {"src": src, "lo": lo, "hi": hi,
                             "region": pst["region"], "zone_lines": sorted(zlines)}
    ctx.counts[it["id"] + "_zone_lines"] = len(zlines)
    return rep


def item_brace_map(ctx, it):
    reg = ctx.results[it["source_item"]]
    rep = Rep(it["id"], "Brace map")
    conv_note(rep)
    rep.a("BRACE MAP")
    if reg is None:
        rep.w("NO DEFINITION FOUND - NO BRACE MAP")
        return rep
    region_numbers(rep, reg)
    entries, excluded = emit_brace_map(rep, reg)
    ctx.maps.append((it["id"], len(entries),
                     max([e["depth"] for e in entries]) if entries else 0,
                     len(excluded)))
    return rep


def item_conditional_stacks(ctx, it):
    inv0 = ctx.results[it["paste_item"]]
    rep = Rep(it["id"], "Conditional lines with full stacks")
    conv_note(rep)
    if inv0 is None:
        rep.a("CONDITIONALS")
        rep.w("NO PASTE AVAILABLE")
        return rep
    src, lo, hi, reg = inv0["region"].src, inv0["lo"], inv0["hi"], inv0["region"]
    n = 0
    for ln in range(lo, hi + 1):
        if is_comment_line(src, ln):
            continue
        if first_token(src.mask[ln]) not in ("if", "else"):
            continue
        n += 1
        rep.a("CONDITIONAL LINE %d" % ln)
        rep.plain_line(src, ln)
        emit_stack_for(rep, reg, ln, False)
        for p in it["zone_patterns"]:
            rep.w("CONTAINS \"%s\" not INCIDENTAL: %s"
                  % (p, "yes" if code_hits(src, ln, p) else "no"))
        rep.w("")
    if n == 0:
        rep.a("CONDITIONALS")
        rep.w("ABSENT")
    rep.w("CONDITIONAL LINE COUNT: %d" % n)
    ctx.counts[it["id"] + "_conditionals"] = n
    return rep


def item_zone_line_blocks(ctx, it):
    inv0 = ctx.results[it["source_item"]]
    rep = Rep(it["id"], "Zone-occurrence lines, classified, with full stacks")
    conv_note(rep)
    if inv0 is None:
        rep.a("ZONE LINES")
        rep.w("NO PASTE AVAILABLE")
        return rep
    src, reg = inv0["src"], inv0["region"]
    lines = inv0["zone_lines"]
    pats = it["zone_patterns"]
    cc = {"ASSIGNMENT-TARGET": 0, "CONTAINS-EQUALS-NOT-TARGET": 0,
          "COMPARISON": 0, "STRING-LITERAL": 0, "COMMENT": 0, "OTHER": 0}
    rep.a("PASTE SEARCHED")
    rep.w("PASTE SEARCHED: %s lines %d through %d, produced by item %s"
          % (src.name, inv0["lo"], inv0["hi"], it["source_item"]))
    rep.w("CLASSES ARE NOT MUTUALLY EXCLUSIVE. A line is reported once per")
    rep.w("applicable class and counted once per applicable class.")
    if not lines:
        rep.a("ZONE LINES")
        rep.w("ABSENT - no line in the paste contains either zone pattern")
    for ln in lines:
        rep.a("ZONE LINE %d" % ln)
        rep.plain_line(src, ln)
        classes = []
        if is_comment_line(src, ln):
            classes.append(("COMMENT", None))
        for p in pats:
            if string_literal_only(src, ln, p):
                classes.append(("STRING-LITERAL", "pattern %s" % p))
        for p in pats:
            at = assigns_to(src, ln, p)
            if at is not None:
                if at[2]:
                    classes.append(("ASSIGNMENT-TARGET",
                                    "ASSIGNS-TO %s | RHS %s" % (p, at[1])))
                else:
                    classes.append(("ASSIGNMENT-TARGET",
                                    "ASSIGNS-TO %s | RHS TERMINATOR NOT ON LINE"
                                    % p))
                    classes.append(("ASSIGNMENT-TARGET",
                                    "REMAINDER VERBATIM: %s" % at[1]))
        for p in pats:
            if contains_equals_not_target(src, ln, p):
                classes.append(("CONTAINS-EQUALS-NOT-TARGET", "pattern %s" % p))
        for p in pats:
            if compares(src, ln, p):
                classes.append(("COMPARISON", "pattern %s" % p))
        if not classes:
            classes.append(("OTHER", None))
        seen = []
        for (k, detail) in classes:
            if k not in seen:
                cc[k] += 1
                seen.append(k)
            rep.w("CLASS: %s%s" % (k, ("   " + detail) if detail else ""))
        if "COMMENT" in seen or "STRING-LITERAL" in seen \
                or "CONTAINS-EQUALS-NOT-TARGET" in seen:
            rep.w("NO VERDICT MAY BE BUILT ON THIS LINE.")
        emit_stack_for(rep, reg, ln, False)
        emit_nearest_if(rep, src, brace_stack(src, reg.entries(), ln), ln, reg.hdr)
        rep.w("")
    rep.a("CLASS TOTALS")
    for k in ("ASSIGNMENT-TARGET", "CONTAINS-EQUALS-NOT-TARGET", "COMPARISON",
              "STRING-LITERAL", "COMMENT", "OTHER"):
        rep.w("%s: %d" % (k, cc[k]))
    rep.w("ZONE-OCCURRENCE LINE COUNT: %d" % len(lines))
    ctx.counts["T_zone_comparison"] = cc["COMPARISON"]
    ctx.counts["T_zone_comment"] = cc["COMMENT"]
    ctx.counts["T_zone_string"] = cc["STRING-LITERAL"]
    ctx.counts["T_zone_ceqnt"] = cc["CONTAINS-EQUALS-NOT-TARGET"]
    ctx.counts["T_zone_other"] = cc["OTHER"]
    ctx.counts["T_zone_assign"] = cc["ASSIGNMENT-TARGET"]
    return rep


# ------------------------------------------------- instrumentation wrappers

STATS = {"stacks": 0, "identical_repeats": 0, "multiline_arglists": 0}
_STACK_SEEN = {}
_emit_stack_impl = emit_stack
_call_arg_text_impl = call_arg_text


def emit_stack(rep, src, stack, want_state=True):
    if stack:
        STATS["stacks"] += 1
        key = (src.name, tuple((e["open"], e["close"]) for e in stack))
        if key in _STACK_SEEN:
            STATS["identical_repeats"] += 1
        else:
            _STACK_SEEN[key] = True
    return _emit_stack_impl(rep, src, stack, want_state)


def call_arg_text(src, ln, name_col, name):
    r = _call_arg_text_impl(src, ln, name_col, name)
    if r and not r.get("unterminated") and r.get("multiline"):
        STATS["multiline_arglists"] += 1
    return r


# ---------------------------------------------------------------- runner

INV_NAMES = ["brace_balance_zero_at_every_region_close",
             "paste_line_count_equals_reported_count",
             "n_lines_equals_distinct_paste_count",
             "every_brace_map_close_derived_by_counting",
             "every_stack_entry_has_open_and_close",
             "no_argument_list_unterminated",
             "no_closing_brace_reported_as_declaration",
             "span_labelled_for_every_region_line_count"]

OPS = {
    "census_assign": item_census_assign,
    "classify_scope": item_classify_scope,
    "stacks_per_line": item_stacks_per_line,
    "rhs_identifier_records": item_rhs_identifier_records,
    "locate_region": item_locate_region,
    "paste_region": item_paste_region,
    "parameters": item_parameters,
    "census_name_calls": item_census_name_calls,
    "arg_param_correspondence": item_arg_param_correspondence,
    "parameter_use_trace": item_parameter_use_trace,
    "statement_inventory": item_statement_inventory,
    "brace_map": item_brace_map,
    "conditional_stacks": item_conditional_stacks,
    "zone_line_blocks": item_zone_line_blocks,
}


class Ctx(object):
    def __init__(self, files, spec):
        self.files = files
        self.spec = spec
        self.results = {}
        self.counts = {}
        self.maps = []
        self.paste_modes = []


def load_tree(spec):
    t = spec["tree"]
    paths = [t["ea"], t["indicator"]]
    inc = t["include_dir"]
    mqh = sorted(os.path.join(inc, f) for f in os.listdir(inc)
                 if f.lower().endswith(".mqh"))
    paths += mqh
    return [Src.from_file(p) for p in paths], paths


def count_incidental_only(files, patterns):
    n, names = 0, []
    for p in patterns:
        total, incid = 0, 0
        for src in files:
            for ln in range(1, src.nlines + 1):
                for _c, i in pat_hits(src.raw[ln], p):
                    total += 1
                    if i:
                        incid += 1
        if total > 0 and total == incid:
            n += 1
            names.append(p)
    return n, names


def write_stasis(outdir, files, paths, pre, post, supplied):
    lines = ["SRJ CENSUS - FILE-LEVEL STASIS METADATA",
             "TOOL: srjcensus %s" % TOOL_VERSION,
             "This section is stasis metadata. It is not an item answer.",
             "NO ITEM ANSWER WAS ADJUSTED FROM ANY VALUE IN THIS SECTION.",
             ""]
    for src in files:
        st = os.stat(src.path)
        lines.append("PATH: %s" % src.path)
        lines.append("  LINES: %d" % src.nlines)
        lines.append("  BYTES: %d" % src.nbytes)
        lines.append("  MTIME: %s" % time.strftime("%Y-%m-%d %H:%M:%S",
                                                   time.localtime(st.st_mtime)))
        lines.append("  ENCODING DETECTED: %s" % src.enc)
        lines.append("  SHA256: %s" % src.sha)
        lines.append("")
    lines.append("HASH GATE")
    for k, label in (("ea", "EA .mq5"), ("ind", "FlowLogic .mq5")):
        s = supplied[k].upper()
        lines.append("  %s SUPPLIED: %s" % (label, s))
        lines.append("  %s PRE-RUN : %s -> %s"
                     % (label, pre[k], "MATCH" if pre[k] == s else "MISMATCH"))
        lines.append("  %s POST-RUN: %s -> %s"
                     % (label, post[k], "MATCH" if post[k] == s else "MISMATCH"))
    lines.append("")
    lines.append("DISAGREEMENTS: %s"
                 % ("none" if all(pre[k] == supplied[k].upper() and
                                  post[k] == supplied[k].upper()
                                  for k in ("ea", "ind")) else "see HASH GATE above"))
    p = os.path.join(outdir, "STASIS.txt")
    with open(p, "w", encoding="utf-8", newline="\n") as f:
        f.write("\n".join(lines) + "\n")
    WRITES.append(p)
    return p


def run_job(job_path, outdir, pin):
    WRITES[:] = []
    INV.clear()
    STATS["stacks"] = 0
    STATS["identical_repeats"] = 0
    STATS["multiline_arglists"] = 0
    _STACK_SEEN.clear()
    for n in INV_NAMES:
        INV[n] = True

    self_sha = sha256_file(os.path.abspath(__file__))
    with open(job_path, "rb") as f:
        jb = f.read()
    job_sha = hashlib.sha256(jb).hexdigest().upper()
    spec = json.loads(jb.decode("utf-8"))
    outdir = os.path.abspath(outdir)
    if not os.path.isdir(outdir):
        os.makedirs(outdir)

    pin_state = "NOT SUPPLIED"
    if pin:
        pin_state = "MATCH" if self_sha.lower() == pin.strip().lower() else "MISMATCH"

    supplied = {"ea": spec["stasis"]["ea_sha256"],
                "ind": spec["stasis"]["indicator_sha256"]}
    ea, ind = spec["tree"]["ea"], spec["tree"]["indicator"]
    pre = {"ea": sha256_file(ea), "ind": sha256_file(ind)}

    status = "COMPLETED"
    failures, item_status, outfiles = [], [], []
    unexpected = []

    if pin_state == "MISMATCH":
        status = "BLOCKED"
        unexpected.append("LIBRARY PIN MISMATCH - NO ITEM WAS RUN")
    if pre["ea"] != supplied["ea"].upper() or pre["ind"] != supplied["ind"].upper():
        status = "BLOCKED"
        unexpected.append("PRE-RUN HASH MISMATCH - NO ITEM WAS RUN")

    files, paths = [], []
    if status != "BLOCKED":
        files, paths = load_tree(spec)
        if len(files) != int(spec.get("expect_file_count", len(files))):
            unexpected.append("FILE COUNT %d, SPEC EXPECTED %d"
                              % (len(files), spec["expect_file_count"]))
        ctx = Ctx(files, spec)
        for it in spec["items"]:
            fn = OPS.get(it["op"])
            if fn is None:
                item_status.append((it["id"], "NOT-RUN"))
                failures.append("%s: UNKNOWN OP %s" % (it["id"], it["op"]))
                status = "PARTIAL"
                continue
            try:
                rep = fn(ctx, it)
                path, nl, nb = emit(outdir, rep)
                outfiles.append((path, nl, nb))
                item_status.append((it["id"],
                                    "COMPLETE" if rep.pastes > 0 else "EMPTY-RESULT"))
            except Exception:
                item_status.append((it["id"], "NOT-RUN"))
                failures.append("%s\n%s" % (it["id"], traceback.format_exc()))
                status = "PARTIAL"
        # post-check: amendment 15, verified against W2's own records
        for key in [i["id"] for i in spec["items"] if i["op"] == "classify_scope"]:
            for r in ctx.results.get(key, []):
                if first_token(r["src"].mask[r["line"]]) == "}" \
                        and r["kind"] == "FILE-SCOPE":
                    inv("no_closing_brace_reported_as_declaration", False)
        counts = ctx.counts
        maps, pmodes = ctx.maps, ctx.paste_modes
    else:
        counts, maps, pmodes = {}, [], []

    post = {"ea": sha256_file(ea), "ind": sha256_file(ind)}
    if files:
        outfiles.append(None)
        outfiles.pop()
        sp = write_stasis(outdir, files, paths, pre, post, supplied)
        outfiles.append((sp, sum(1 for _ in open(sp, encoding="utf-8")),
                         os.path.getsize(sp)))

    if any(v is False for v in INV.values()):
        status = "PARTIAL" if status == "COMPLETED" else status
        for k, v in INV.items():
            if not v:
                unexpected.append("INVARIANT FAIL: %s" % k)
    if post["ea"] != supplied["ea"].upper() or post["ind"] != supplied["ind"].upper():
        status = "BLOCKED"
        unexpected.append("POST-RUN HASH MISMATCH")

    outside = [p for p in WRITES if not os.path.abspath(p).startswith(outdir)]
    if outside:
        status = "BLOCKED"
        for p in outside:
            unexpected.append("WRITE OUTSIDE OUTPUT DIRECTORY: %s" % p)

    inc_n, inc_names = ((0, []) if not files else
                        count_incidental_only(files,
                                              spec.get("provenance_patterns", [])))

    def g(k):
        return counts.get(k, 0)

    R = []
    R.append("TASK %s RECEIPT" % spec.get("task", "UNKNOWN"))
    R.append("  STATUS: %s" % status)
    R.append("  LIBRARY: %s SHA256 %s vs PINNED %s -> %s"
             % (os.path.abspath(__file__), self_sha,
                (pin.strip().upper() if pin else "NOT SUPPLIED"), pin_state))
    R.append("  SELFTEST: not run in this invocation")
    R.append("  JOB SPEC: %s SHA256 %s" % (os.path.abspath(job_path), job_sha))
    R.append("  SPEC VERSION: %s" % spec.get("spec_version", "UNKNOWN"))
    R.append("  EXIT CODE: %d" % (0 if status == "COMPLETED" else 1))
    R.append("  STDERR: %s" % ("none" if not failures else "see FAILURES below"))
    R.append("")
    R.append("  HASH GATE")
    for k, label in (("ea", "EA .mq5"), ("ind", "FL .mq5")):
        s = supplied[k].upper()
        R.append("    %s PRE  %s vs SUPPLIED %s -> %s"
                 % (label, pre[k], s, "MATCH" if pre[k] == s else "MISMATCH"))
        R.append("    %s POST %s vs SUPPLIED %s -> %s"
                 % (label, post[k], s, "MATCH" if post[k] == s else "MISMATCH"))
    R.append("")
    R.append("  WRITE AUDIT")
    R.append("    files written under output directory : %d" % (len(WRITES) - len(outside)))
    R.append("    files written anywhere else          : %d" % len(outside))
    R.append("    source files read                    : %d" % len(files))
    R.append("")
    R.append("  OUTPUT FILES")
    for (p, nl, nb) in outfiles:
        R.append("    %s | %d lines | %d bytes" % (p, nl, nb))
    R.append("")
    R.append("  ITEM COMPLETION")
    R.append("    legend: COMPLETE = item emitted at least one pasted source line;")
    R.append("            EMPTY-RESULT = item ran and pasted nothing, which is a result;")
    R.append("            NOT-RUN = item raised, see FAILURES")
    for (iid, st) in item_status:
        R.append("    %s | %s" % (iid, st))
    R.append("")
    R.append("  INVARIANTS")
    for n in INV_NAMES:
        R.append("    %s | %s" % (n, "PASS" if INV.get(n, True) else "FAIL"))
    R.append("")
    R.append("  CONFIRMATION FIELDS, aggregates and item names only")
    R.append("    brace counting used: YES | bounds carried by %s"
             % ", ".join(i["id"] for i in spec["items"]
                         if i["op"] in ("locate_region", "paste_region", "brace_map")))
    R.append("    brace-map rule used: YES | maps: %d"
             % len(maps))
    for (iid, ne, md, nx) in maps:
        R.append("      %s | entries %d | max depth %d | excluded %d"
                 % (iid, ne, md, nx))
    R.append("    enclosing-construct rule used: YES | full stacks delivered: %d"
             % STATS["stacks"])
    R.append("    no-abbreviation on derived output: YES | stacks repeated in full "
             "that were identical to another stack: %d" % STATS["identical_repeats"])
    R.append("    argument-split rule used: YES | call sites split: %d | "
             "POSITION COUNT MISMATCH results: %d"
             % (g("arg_lists_split"), g("F_mismatch")))
    R.append("    multi-line call rule used: YES | argument lists continuing onto a "
             "following line: %d | no answer reported as UNTERMINATED: %s"
             % (STATS["multiline_arglists"],
                "confirmed" if INV.get("no_argument_list_unterminated", True)
                else "NOT CONFIRMED"))
    R.append("    paste sizing")
    for (iid, nm, mode, cnt) in pmodes:
        R.append("      %s | %s | %s | line count %d" % (iid, nm, mode, cnt))
    R.append("    census-pattern provenance: YES | INCIDENTAL-ONLY results: %d%s"
             % (inc_n, (" | patterns: " + ", ".join(inc_names)) if inc_names else ""))
    R.append("    previous-output independence: every line number, bound, "
             "declaration line, count and classification in every output file was "
             "computed in this run from file text only; no prior figure was read, "
             "quoted or reconciled against")
    R.append("")
    R.append("  COUNTS ONLY - no line numbers, no text, no verdicts")
    R.append("    W: zone assignment-target lines %d, in-function %d, file-scope %d,"
             % (g("W_assign_lines"), g("W_in_function"), g("W_file_scope")))
    R.append("       stacks emitted %d, stacks with a g_state header entry %d,"
             % (g("W_stacks"), g("W_stacks_g_state")))
    R.append("       stacks with a loop/switch entry %d, RHS identifiers %d"
             % (g("W_stacks_loop"), g("W_rhs_identifiers")))
    R.append("    F: FindLegTouch definitions %d, call sites %d,"
             % (g("F4_defs"), g("F4_calls")))
    R.append("       position-count mismatches %d, zone-receiving parameters %d,"
             % (g("F_mismatch"), g("F_zone_params")))
    R.append("       assignment targets on those parameters %d"
             % g("F_param_assign_targets"))
    R.append("    T: TpTargetUpdateBest definitions %d, call sites %d,"
             % (g("T8_defs"), g("T8_calls")))
    R.append("       conditionals %d, zone-occurrence lines %d,"
             % (g("T6_conditionals"), g("T5_zone_lines")))
    R.append("       of those classified COMPARISON %d, COMMENT %d, "
             "STRING-LITERAL %d," % (g("T_zone_comparison"), g("T_zone_comment"),
                                     g("T_zone_string")))
    R.append("       CONTAINS-EQUALS-NOT-TARGET %d, OTHER %d, ASSIGNMENT-TARGET %d"
             % (g("T_zone_ceqnt"), g("T_zone_other"), g("T_zone_assign")))
    R.append("       classes are not mutually exclusive; a line may be counted "
             "in more than one class")
    R.append("")
    R.append("  UNEXPECTED: %s" % ("none" if not unexpected else ""))
    for u in unexpected:
        R.append("    %s" % u)
    if failures:
        R.append("")
        R.append("  FAILURES")
        for fmsg in failures:
            for l in fmsg.split("\n"):
                R.append("    %s" % l)
    R.append("END RECEIPT")

    rp = os.path.join(outdir, "RECEIPT.txt")
    with open(rp, "w", encoding="utf-8", newline="\n") as f:
        f.write("\n".join(R) + "\n")
    sys.stdout.write("\n".join(R) + "\n")
    return 0 if status == "COMPLETED" else 1


# ---------------------------------------------------------------- fixtures

def _t(text):
    return Src.from_text("FIXTURE", text)


def fx_comments():
    s = _t('int a = 1; // b = 2;\n'
           '/* block\n'
           '   c = 3;\n'
           '*/\n'
           'string s = "// not a comment";\n'
           'string t = "/* also not */";\n'
           'int d = 4;\n')
    assert assigns_to(s, 1, "a") is not None
    assert assigns_to(s, 1, "b") is None
    assert assigns_to(s, 3, "c") is None
    assert is_comment_line(s, 3)
    at = assigns_to(s, 5, "s")
    assert at is not None and at[1].strip() == '"// not a comment"'
    assert assigns_to(s, 6, "t") is not None
    assert assigns_to(s, 7, "d") is not None


def fx_region_and_stack():
    s = _t('void Foo()\n'
           '  {\n'
           '   if(a==1)\n'
           '     {\n'
           '      b=2;\n'
           '     }\n'
           '   return;\n'
           '  }\n')
    r = locate([s], "Foo")["region"]
    assert r is not None
    assert (r.hdr, r.pclose[0], r.ob[0], r.cb[0]) == (1, 1, 2, 8)
    assert r.count_hdr == 8 and r.count_open == 7
    e, x = r.bmap()
    assert len(e) == 2 and x == []
    assert e[1]["header"] == 3
    st = brace_stack(s, e, 5)
    assert len(st) == 2
    h, same = nearest_if(s, st, 5)
    assert h == 3 and same is False


def fx_same_line_braces():
    s = _t('void Bar()\n'
           '  {\n'
           '   if(a) { c=1; }\n'
           '   d=2;\n'
           '  }\n')
    r = locate([s], "Bar")["region"]
    e, _x = r.bmap()
    assert len(e) == 2
    assert len(brace_stack(s, e, 4)) == 1
    assert nearest_if(s, brace_stack(s, e, 4), 4)[0] is None


def fx_decoy_close():
    s = _t('void OnInit()\n'
           '  {\n'
           '   if(a)\n'
           '     {\n'
           '      b=1;\n'
           '   }\n'
           '  }\n')
    r = locate([s], "OnInit")["region"]
    assert r.cb[0] == 7


def fx_multiline_call():
    s = _t('void Baz()\n'
           '  {\n'
           '   Call(a, F(b, c), "x,y",\n'
           '        d[1,2], e);\n'
           '  }\n')
    a = call_arg_text(s, 3, s.mask[3].find("Call"), "Call")
    assert a["multiline"] is True and a["close"][0] == 4
    assert a["args"] == ["a", "F(b, c)", '"x,y"', "d[1,2]", "e"]


def fx_whole_token_keyword():
    s = _t('int informant = 0;\n'
           'for(int i=0;i<3;i++)\n'
           '  {\n'
           '   formatted = 1;\n'
           '  }\n')
    res, diag = loop_headers(s, 1, 5)
    assert len(res) == 1 and res[0] == (2, "for")
    assert diag["for"] >= 3


def fx_for_clauses():
    s = _t('for(int i=0; i<n; i++)\n')
    c = for_clauses(s, 1, 0)
    assert c == ["int i=0", "i<n", "i++"]


def fx_file_scope_decl():
    s = _t('double g_zoneHi = 0.0;\n'
           'void F()\n'
           '  {\n'
           '   g_zoneHi = 1.0;\n'
           '  } g_zoneHi;\n')
    ok, ty = file_scope_decl(s, 1, "g_zoneHi")
    assert ok and ty == "double"
    ok2, why = file_scope_decl(s, 5, "g_zoneHi")
    assert ok2 is False and why == "CLOSING BRACE"
    ok3, _w = file_scope_decl(s, 4, "g_zoneHi")
    assert ok3 is False


def fx_decl_records():
    s = _t('void F()\n'
           '  {\n'
           '   double v = 1.0;\n'
           '   if(a)\n'
           '     {\n'
           '      double v = 2.0;\n'
           '      x = v;\n'
           '     }\n'
           '   y = v;\n'
           '  }\n')
    d = decl_records(s, 1, 10, "v")
    assert [r["D"] for r in d] == [3, 6]


def fx_rhs_not_terminated():
    s = _t('void F()\n'
           '  {\n'
           '   double z = A(b,\n'
           '                c);\n'
           '  }\n')
    at = assigns_to(s, 3, "z")
    assert at is not None and at[2] is False
    assert at[1].strip() == "A(b,"


def fx_incidental():
    s = _t('x = prev_g_zoneHi;\n'
           'g_zoneHi = 1.0;\n')
    h = pat_hits(s.raw[1], "g_zoneHi")
    assert len(h) == 1 and h[0][1] is True
    assert containing_ident(s.raw[1], h[0][0], "g_zoneHi") == "prev_g_zoneHi"
    assert assigns_to(s, 1, "g_zoneHi") is None
    assert assigns_to(s, 2, "g_zoneHi") is not None


def fx_comparison():
    s = _t('if(g_zoneHi == 0.0)\n'
           'if(g_zoneHi > 0.0)\n'
           'if(g_zoneHi != 0.0)\n')
    assert compares(s, 1, "g_zoneHi") is True
    assert compares(s, 2, "g_zoneHi") is False
    assert compares(s, 3, "g_zoneHi") is True


def fx_header_gap():
    s = _t('void F()\n'
           '  {\n'
           '   if(a &&\n'
           '      b)\n'
           '     {\n'
           '      c=1;\n'
           '     }\n'
           '  }\n')
    h, gap = resolve_header(s, 5, 1)
    assert h == 3 and gap == 2


def fx_excluded_brace():
    s = _t('void F()\n'
           '  {\n'
           '   Print("{");\n'
           '  }\n')
    r = locate([s], "F")["region"]
    e, x = r.bmap()
    assert len(e) == 1 and len(x) == 1 and x[0][0] == 3


def fx_returns():
    s = _t('int F()\n'
           '  {\n'
           '   if(a) return;\n'
           '   returned = 1;\n'
           '   return b+1;\n'
           '  }\n')
    st3, raw3 = return_stmts(s, 3)
    assert st3 == [(True, "")] and raw3 == 1
    st4, raw4 = return_stmts(s, 4)
    assert st4 == [] and raw4 == 1
    st5, _r = return_stmts(s, 5)
    assert st5 == [(False, "b+1")]


def fx_assign_sites():
    s = _t('a = b = 0;\n'
           'if(a >= b) c += 1;\n')
    sites = assign_sites(s, 1)
    assert [t for (t, _c, _r, _m) in sites] == ["a", "b"]
    assert assign_sites(s, 2) == []


def fx_split_depth0():
    t = 'a, (b, c), d'
    assert split_depth0(t, t) == ["a", "(b, c)", "d"]
    assert split_depth0("", "") == []


def fx_fallback_definition():
    s = _t('//+---+\n'
           '  double Helper(int a)\n'
           '    {\n'
           '     return a;\n'
           '    }\n')
    res = locate([s], "Helper")
    assert res["candidates"] == []
    assert res["fallback_reached"] is True
    assert len(res["fallback_lines"]) == 1
    assert res["fallback_lines"][0]["lead"] == "  "
    assert res["region"] is not None
    assert (res["region"].hdr, res["region"].cb[0]) == (2, 5)


def fx_declaration_not_definition():
    s = _t('bool FindLegTouch(double &hi,\n'
           '                  double lo);\n'
           'bool FindLegTouch(double &hi, double lo)\n'
           '  {\n'
           '   return true;\n'
           '  }\n')
    res = locate([s], "FindLegTouch")
    kinds = [c["info"]["kind"] for c in res["candidates"]]
    assert kinds == ["DECLARATION", "DEFINITION"]
    assert res["candidates"][0]["info"]["pclose"][0] == 2
    assert res["region"].hdr == 3


def fx_parameters():
    s = _t('bool FindLegTouch(double &hi, double lo, int n=3, double arr[])\n'
           '  {\n'
           '   return true;\n'
           '  }\n')
    r = locate([s], "FindLegTouch")["region"]
    ps, span = parameters(r)
    assert len(ps) == 4 and span == (1, 1)
    assert ps[0]["byref"] is True and ps[0]["var"] == "hi"
    assert ps[1]["byref"] is False and ps[1]["var"] == "lo"
    assert ps[2]["var"] == "n"
    assert ps[3]["var"] == "arr"


def fx_parameters_multiline():
    s = _t('bool F(double &a,\n'
           '       double b)\n'
           '  {\n'
           '   return true;\n'
           '  }\n')
    r = locate([s], "F")["region"]
    ps, span = parameters(r)
    assert len(ps) == 2 and span == (1, 2)
    assert (r.hdr, r.pclose[0], r.ob[0], r.cb[0]) == (1, 2, 3, 5)


def fx_identifiers_in():
    s = _t('   double z = A(b, c) + d1 + 1.0;\n')
    at = assigns_to(s, 1, "z")
    a, b, _t2 = rhs_span(s, 1, at[0])
    ids = identifiers_in(s.mask[1][a:b])
    names = [n for (n, _c, _p) in ids]
    called = [n for (n, _c, p) in ids if p]
    assert called == ["A"]
    assert "b" in names and "c" in names and "d1" in names


def fx_g_state():
    s = _t('if(g_state == 2)\n'
           '// if(g_state == 2)\n'
           'Print("g_state");\n'
           'if(prev_g_state == 2)\n')
    assert contains_g_state(s, 1) is True
    assert contains_g_state(s, 2) is False
    assert contains_g_state(s, 3) is False
    assert contains_g_state(s, 4) is False


def fx_enclosing_def():
    s = _t('void A()\n'
           '  {\n'
           '   x=1;\n'
           '  }\n'
           'void B()\n'
           '  {\n'
           '   y=2;\n'
           '  }\n')
    assert enclosing_def(s, 3).name == "A"
    assert enclosing_def(s, 7).name == "B"
    assert enclosing_def(s, 9) is None


FIXTURES = [
    ("comments_and_strings", fx_comments),
    ("region_bounds_and_stack", fx_region_and_stack),
    ("same_line_brace_pair", fx_same_line_braces),
    ("decoy_closing_brace", fx_decoy_close),
    ("multiline_call_nested_commas", fx_multiline_call),
    ("whole_token_keyword", fx_whole_token_keyword),
    ("for_clause_split", fx_for_clauses),
    ("file_scope_decl_and_brace_exclusion", fx_file_scope_decl),
    ("declaration_records_sharing_a_name", fx_decl_records),
    ("rhs_terminator_not_on_line", fx_rhs_not_terminated),
    ("incidental_substring", fx_incidental),
    ("comparison_rule", fx_comparison),
    ("header_resolution_with_gap", fx_header_gap),
    ("excluded_brace_in_string", fx_excluded_brace),
    ("return_statements", fx_returns),
    ("assignment_sites", fx_assign_sites),
    ("argument_split_depth_zero", fx_split_depth0),
    ("definition_header_fallback", fx_fallback_definition),
    ("declaration_versus_definition", fx_declaration_not_definition),
    ("parameter_table", fx_parameters),
    ("parameter_list_multiline", fx_parameters_multiline),
    ("rhs_identifier_extraction", fx_identifiers_in),
    ("g_state_detection", fx_g_state),
    ("enclosing_definition_lookup", fx_enclosing_def),
]


def selftest():
    npass, nfail = 0, 0
    out = ["srjcensus %s SELFTEST" % TOOL_VERSION]
    for (nm, fn) in FIXTURES:
        try:
            fn()
            npass += 1
            out.append("  PASS  %s" % nm)
        except Exception:
            nfail += 1
            out.append("  FAIL  %s" % nm)
            for l in traceback.format_exc().split("\n"):
                out.append("        %s" % l)
    out.append("SELFTEST: %d passed, %d failed" % (npass, nfail))
    sys.stdout.write("\n".join(out) + "\n")
    return 0 if nfail == 0 else 1


# ---------------------------------------------------------------- cli

def main(argv=None):
    ap = argparse.ArgumentParser(prog="srjcensus", add_help=True)
    ap.add_argument("--selftest", action="store_true")
    ap.add_argument("--job")
    ap.add_argument("--out")
    ap.add_argument("--pin")
    ap.add_argument("--version", action="store_true")
    a = ap.parse_args(argv)
    if a.version:
        sys.stdout.write("srjcensus %s\n" % TOOL_VERSION)
        return 0
    if a.selftest:
        return selftest()
    if not a.job or not a.out:
        ap.error("--job and --out are both required unless --selftest is given")
    return run_job(a.job, a.out, a.pin)


if __name__ == "__main__":
    sys.exit(main())