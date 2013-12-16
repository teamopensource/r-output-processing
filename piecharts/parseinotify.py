import re

f_in = open("/var/data/inotify1.log", "r")


hdrl = f_in.readline()

headers = re.findall("(\w+)\s+", hdrl)


values = []
for line in f_in:
	row = re.findall("([\w\.\-\/]+)\s+", line)
	values.append(row)


print ",".join(headers)
for value in values:
	print ",".join(value)