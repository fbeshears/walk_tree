#find_code.py

import os, sys

if len(sys.argv) < 2:
  search = raw_input('enter a search string: ')
else:
  search = sys.argv[1]

if len(search) < 1: exit()

files = os.listdir('./book_python_code')

for fn in files:
  if not fn.endswith('.py'): continue
  pfn = './book_python_code/' + fn
  fh = open(pfn)
  lines = fh.readlines()
  fh.close()


  for line in lines:
    line = line.rstrip()
    if line.find(search) >= 0:
      print fn, line