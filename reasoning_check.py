#!/usr/bin/python
import re

arr = input().split(' ')
del arr[len(arr)-1] # last element is empty
d = dict()
for atom in arr:
	m = re.match(r"(.+)\((\d+),(.+)\)", atom)
	if m:
		if not m.group(1) in d.keys():
			d[m.group(1)] = dict()
		d[m.group(1)][m.group(2)] = m.group(3)
	else:
		print ("Error", atom)
		exit()

men = range(1,5);
line = "\t\t"
for man in men:
	line += str(man) + "\t\t"
print (line)

for key in d.keys():
	line = key + "\t"
	if len(key) < 8:
		line += "\t"
	for man in men:
		line += d[key][str(man)] + "\t"
		if len(d[key][str(man)]) < 8:
			line += "\t"
	print (line)
