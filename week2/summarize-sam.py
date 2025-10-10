#!/usr/bin/env python3

import sys

sam_file = open (sys.argv[1])
count_alignments = {}
mismatch_counts = {}

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

    for field in fields[1:]:
        if field.startswith("NM:i:"):
            nm_value = int(field[5:])
            mismatch_counts[nm_value] = mismatch_counts.get(nm_value, 0) + 1
            break 

print("Alignments: ")
for each in count_alignments.keys():
    print(each, count_alignments[each])

print("\nMismatch: ")
for nm in sorted(mismatch_counts.keys()):
    print (nm, mismatch_counts[nm])

# examine mismatches per alignment
# for loop go through line by line and look for NM:i: 
# and then strip NM and leave it with number
# key will be the number 


