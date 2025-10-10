#!/usr/bin/env python3

import sys
vcf_file = open("/Users/cmdb/qb25-answers/week3/biallelic.vcf")
af = open("AF.txt", "w")
dp = open("DP.txt", "w")

af.write("AlleleFrequency\n")
dp.write("ReadDepth\n")

for line in vcf_file:
    if line.startswith("#"):
        continue
    fields = line.rstrip('\n').split('\t') #every column

    info = fields[7]
    full_allele = info.split(';')[3] #takes only 4th column which is AF
    allele_freq = full_allele.strip("AF=")
    allele_freq = float(allele_freq)
    af.write(f"{allele_freq}\n")

    format_fields = fields[8].split(":")
    samples = fields[9:]
    if "DP" in format_fields:
        index = format_fields.index("DP")
        for position in samples:
            sample_fields = position.split(':')
            if len(sample_fields) > index: 
                depth = float(sample_fields[index])
                dp.write(f"{depth}\n")
            else: 
                continue



    



