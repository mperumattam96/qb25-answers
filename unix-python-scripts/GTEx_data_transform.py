#!/usr/bin/env python3
import sys
import gzip

exp_data_file = gzip.open("/Users/cmdb/Data/GTEx/GTEx_Analysis_2017-06-05_v8_RNASeQCv1.1.9_gene_tpm.gct.gz")


_ = exp_data_file.readline() #skip first two headers 
_ = exp_data_file.readline()

header = exp_data_file.readline().rstrip().split("\t") 
data = exp_data_file.readline().rstrip().split("\t")

#dictionary
data_dict = {}

# Looping through fields, skipping first two colums 
for i in range(2,len(header)):
    sample = header[i]
    expression = data[i]
    data_dict[sample] = expression

metadata = open("/Users/cmdb/Data/GTEx/GTEx_Analysis_v8_Annotations_SampleAttributesDS.txt")

_ = metadata.readline()

for line in metadata:
    fields = line.rstrip().split("\t")
    sample_id = fields[0]
    tissue_type = fields[1]

if sample_id in data_dict:
    expression = data_dict[sample_id]
    print(f"SAMPLEID: {sample_id}, Expression: {expression}, Tissue: {tissue_type}")
