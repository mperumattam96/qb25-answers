#!/usr/bin/env python3

import sys

sam_file = sys.argv[1]

count_alignments = {}

for line in sam_file:
    line = line.rstrip()
    if line.startswith('@'):
        continue
    fields = line.split("\t")
    rname = fields[2]

    if rname in count_alignments:
        count_alignments[rname] += 1
    else:
        count_alignments[rname] = 1

for each in count_alignments.keys():
    print(each, count_alignments[each])