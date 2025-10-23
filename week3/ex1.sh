#!/bin/bash

#tar -xzvf BYxRM_bam.tar.gz

#for sample in *.bam #converting bam to bai 
#do 
   # samtools index ${sample} 
#done 

# chmod +x call_vairants.sh

#Question 1.1 
#for i in *.bam
#do
    #samtools view -c ${i} 
#done > read_counts.txt

#generate a list of bam file names 

#for i in *.bam
#do 
    # ${i} 
#done > bamListFile.txt

#freebayes -f /Users/cmdb/qb25-answers/week2/genomes/sacCer3.fa -L bamListFile.txt --genotype-qualities -p 1 > unfiltered.vcf