#!/usr/bin/env python3

import sys

cele_file = open (sys.argv[1]) #cele_file is filestream, cannot be indexed 
for line in cele_file: #line is iterator 
    line = line.strip("\n").split("\t") #making each row into a list called "line"
    gene_length = int(line[2]) - int(line[1])
    original_score = int(line[4])
    new_score = original_score*gene_length
    if line[5] == "-":
        new_score = new_score * -1
    else:
        new_score = new_score * 1
    print(line[0], line[1], line[2], line[3], new_score, line[5]) 

