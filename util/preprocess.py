from glob import glob
from os import makedirs

def preprocess(fn):
	if '/' in fn:
		try:
			makedirs('obj/pp/%s' % fn.rsplit('/', 1)[0])
		except:
			pass
	with open('obj/pp/%s' % fn, 'w') as ofp:
		with open(fn, 'r') as ifp:
			ofp.write(ifp.read().replace('@', 'L'))

map(preprocess, glob('*.asm'))
map(preprocess, glob('functions/*.asm'))
map(preprocess, glob('obj/*.asm'))
