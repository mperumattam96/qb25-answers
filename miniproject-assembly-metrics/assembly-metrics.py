#!/usr/bin/env python3

import sys 
import fasta #needs to be in same directory as script

contig_file = open(sys.argv[1]) #giving tuple at a time, filestream
contigs = fasta.FASTAReader(contig_file)

num_contigs = 0
total_length = 0
avg_length = 0

all_contig_length = []

for identity,sequence in contigs: #it knows its a tuple, and breaks up the tuple
    num_contigs += 1
    total_length += len(sequence) 
    all_contig_length.append(len(sequence))
print("Number of contigs: ", num_contigs)
print("Total length: ", total_length)
avg_length = (total_length/num_contigs)
print("Average length: ", avg_length)


all_contig_length.sort(reverse=True)
for contig_length in all_contig_length:
    cum_length += contig_length
    if cum_length >= total_length/2:
        N50 = contig_length
        break

print("sequence length of the shortest contig at 50% of the total assembly length: ", N50)
