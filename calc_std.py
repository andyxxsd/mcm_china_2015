#! /usr/bin/env python
import argparse
import re
import numpy
import math

parser = argparse.ArgumentParser()
parser.add_argument('file', default='script/t2_raw_solution.txt')
parser.add_argument('offset', default=0)
parser.add_argument('number', default=3)
args = parser.parse_args()

r = re.compile('[ \t\b\r]+')
raw = open(args.file).read()
offset = int(args.offset)
n = int(args.number)
data =  [[] for i in xrange(n)]
cnt = 0
# print raw.split('\n')
for row in raw.split('\n'):
	if offset > 0:
		offset -= 1
		continue
	cnt += 1
	if cnt % 5 ==0:
		continue
	# print str(cnt) + ": " + row
	a = row.split(' ')
	while '' in a:
		a.remove('')
	for i in xrange(n):
		data[i].append(float(a[i]))

cnt -= cnt / 5 + 1

print data[1][100:120]
print data[2][100:120]

while cnt > 0:
	std = 0.
	for i in xrange(n):
		std += numpy.std(numpy.array(data[i][0:4]))
		data[i] = data[i][4:]
	cnt -= 4
	# print std


