from __future__ import print_function
from glob import glob

a_table = [None] * 256
b_table = [None] * 256
c_table = [None] * 256
sys_table = [None] * 256
tables = dict(
	A=a_table, 
	B=b_table, 
	C=c_table, 
	SYS=sys_table, 
)
with file('obj/all_functions.asm', 'w') as all_fp:
	for fn in glob('functions/*.asm'):
		first = file(fn).readline().strip()
		if first.startswith('#$'):
			first = first.split(' ')
			name, entries = first[1], first[2:]
			for entry in entries:
				assert entry.endswith('h)')
				table, entry = entry[:-2].split('(')
				assert table in tables
				tables[table][int(entry, 16)] = name
		all_fp.write('.include "%s"\n' % fn)
	all_fp.write('.include "obj/dispatcher.asm"\n')

def write_dispatcher(dis, table, register):
	w = lambda x, indent=True: print(('\t' if indent else '') + x, file=dis)
	w('dispatch_%s:' % table, indent=False)
	for i, name in enumerate(tables[table]):
		if name == None:
			continue
		w('li $t0, 0x%02X' % i)
		w('beq $t0, %s, export_%s' % (register, name))
	w('j abort_debug')

with file('obj/dispatcher.asm', 'w') as dis:
	write_dispatcher(dis, 'A', '$t1')
	write_dispatcher(dis, 'B', '$t1')
	write_dispatcher(dis, 'C', '$t1')
	write_dispatcher(dis, 'SYS', '$a0')
