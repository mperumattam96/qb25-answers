#!/usr/bin/env python3

import sys
vcf_file = open("/Users/cmdb/qb25-answers/week3/biallelic.vcf")

for line in vcf_file:
    if line.startswith("#"):
        continue
    fields = line.rstrip('\n').split('\t') #every column

    info = fields[7]
    full_allele = info.split(';')[3] #takes only 4th column which is AF
    allele_freq = full_allele.strip("AF=")
    allele_freq = float(allele_freq)
    print(allele_freq)