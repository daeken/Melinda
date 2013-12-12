from glob import glob
from os import makedirs
import re

def rewrite(source, sfn):
	instances = dict()
	def rep(match):
		name = match.group(1)
		isdef = match.group(2)
		if name not in instances:
			instances[name] = 0, False
		if isdef == ':':
			if instances[name][1] == False:
				instances[name] = instances[name][0], True
			else:
				instances[name] = instances[name][0] + 1, True
		return '_%s_%i%s%s' % (sfn, instances[name][0], name, isdef)
	source = list(source.split('\n'))
	for i, line in enumerate(source):
		tline = line.split('#')[0]
		if ':' in tline and tline.strip()[0] != '@':
			for name in instances:
				instances[name] = instances[name][0] + 1, False
		source[i] = re.sub(r'@([a-zA-Z0-9_.\\@]+)(:?)', rep, line)

	return '\n'.join(source)

def preprocess(fn):
	sfn = fn.split('/')[-1].split('.')[0]
	if '/' in fn:
		try:
			makedirs('obj/pp/%s' % fn.rsplit('/', 1)[0])
		except:
			pass
	with open('obj/pp/%s' % fn, 'w') as ofp:
		with open(fn, 'r') as ifp:
			ofp.write(rewrite(ifp.read(), sfn))

list(map(preprocess, glob('*.asm')))
list(map(preprocess, glob('functions/*.asm')))
list(map(preprocess, glob('obj/*.asm')))
