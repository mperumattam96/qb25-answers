#!/usr/bin/env python3
import sys
import numpy as np
import random 
from scipy.stats import poisson, norm

def num_reads(genomesize, readlength, coverage): 
    result = genomesize * coverage / readlength
    return result

genomesize = 1000000
readlength = 100
coverage3x = 3
coverage10x = 10
coverage30x = 30

num_reads_10x = num_reads(genomesize, readlength, coverage10x)
num_reads_10x = int(num_reads_10x)

## use an array to keep track of the coverage at each position in the genome
genome_coverage = np.zeros((genomesize), dtype=int)
for i in range(num_reads_10x): #trying to find where the reads come from in the 1Mbp genome
  startpos = random.randint(0,genomesize-readlength+1) 
  endpos = startpos + readlength
  genome_coverage[startpos:endpos] += 1

## get the range of coverages observed
maxcoverage = max(genome_coverage)
xs = list(range(0, maxcoverage+1)) 

## Get the poisson pmf at each of these
poisson_estimates = poisson.pmf(xs, mu = coverage10x)

## Get normal pdf at each of these (i.e. the density between each adjacent pair of points)
normal_estimates = norm.pdf(xs, loc = coverage10x, scale = np.sqrt(coverage10x))

#convert to counts 
poisson_counts = poisson_estimates * genomesize
normal_counts  = normal_estimates * genomesize

## now plot the histogram and probability distributions
with open("poisson_10x.txt", "w") as f:
    for x, count in zip(xs, poisson_counts):
       f.write(f"{x}\t{count}\n")

with open("normal_10x.txt", "w") as f:
    for x, count in zip(xs, normal_counts):
       f.write(f"{x}\t{count}\n")
  
with open("coverage_10x.txt", "w") as f:
    for c in genome_coverage:
       f.write(f"{c}\n")
