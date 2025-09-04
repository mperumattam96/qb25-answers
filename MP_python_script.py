#!/usr/bin/env python3

import sys

cele_file = open(sys.argv[1])
 

for bed_data in cele_file:
    bed_data = cele_file.strip("\n").split("\t")
    start = int(bed_data[1])
    end = int(bed_data[2])
    gene_length = end - start
    original_score = int(bed_data[4])
    new_score = original_score*gene_length
    if bed_data[5] == "-":
        new_score == new_score * -1
    if bed_data[5] == "+":
        new_score == new_score * 1


    






   

    


