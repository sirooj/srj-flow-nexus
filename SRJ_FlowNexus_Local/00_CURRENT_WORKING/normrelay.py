import hashlib
import pathlib
p = pathlib.Path('SRJ_FlowNexus_Local/06_HANDOFFS/BUILDER_RELAY_COUNCIL_v284-USDJPY-GUARDS4.md')
before = p.read_bytes()
t = before.decode('utf-8').splitlines()
out = chr(13) + chr(10)
p.write_bytes(out.join(t).encode('utf-8'))
after = p.read_bytes()
print('lines=', len(t))
print('before=', len(before), 'after=', len(after))
print('digest=', hashlib.sha256(after).hexdigest().upper()[:8])
print('CRLF=', after.count(b'\r\n'), 'loneLF=', after.count(b'\n') - after.count(b'\r\n'))
