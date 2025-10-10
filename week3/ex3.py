#!/usr/bin/env python3

sample_ids = ["A01_62", "A01_39", "A01_63", "A01_35", "A01_31", "A01_27", "A01_24", "A01_23", "A01_11", "A01_09"]
vcf_file = open("/Users/cmdb/qb25-answers/week3/biallelic.vcf")

print("SampleID\tChrom\tPos\tGenotype")

for line in vcf_file:
    if line.startswith("#"):
        continue
    fields = line.split("\t")
    chrom = fields[0]
    pos = fields[1]

    for i in range(10): 
        sample_name = sample_ids[i]
        sample_data = fields[9 + i]
        genotype = sample_data.split(":")[0]
        
        if genotype == "0":
            print(f"{sample_name}\t{chrom}\t{pos}\t0")
        elif genotype == "1":
            print(f"{sample_name}\t{chrom}\t{pos}\t1")