#exercise 1
cd variants
bowtie2 -p 4 -x ../genomes/sacCer3 -U ~/Data/BYxRM/fastq/A01_01.fq.gz > A01_01.sam
    less -S A01_01.sam
samtools sort -o A01_01.bam A01_01.sam
samtools index A01_01.bam
samtools idxstats /Users/cmdb/qb25-answers/week2/variants/A01_01.bam > A01_01.idxstats

#exercise 2
How this visualization compares to haplotypes in BYxRM_GenoData.txt

In the txt file, the AO1_01, A01_03, A01_04 have high confidence SNPs with the R call,, where th A01_2, A01_5 are grouped together with the B call. This aligns with the IGTV coverage where 01, 03, and 04 coverage is empty in the beginning and looks the same. 

#exercise 4

minimap2 -ax map-ont /Users/cmdb/qb25-answers/week2/genomes/sacCer3.fa /Users/cmdb/qb25-answers/week2/rawdata/ERR8562476.fastq > longreads.sam

#sort .sam into .bam and index
samtools sort -o longreads.bam longreads.sam
samtools index longreads.bam > longreads.idxstats
samtools idxstats /Users/cmdb/qb25-answers/week2/longreads/longreads.bam > longreads.idxstats

exercise #5

hisat2-build sacCer3.fa sacCer3
hisat2 -p 4 -x /Users/cmdb/qb25-answers/week2/genomes/sacCer3 -U /Users/cmdb/qb25-answers/week2/rawdata/SRR10143769.fastq -S SRR10143769.sam

samtools sort -o SRR10143769.bam SRR10143769.sam
samtools index SRR10143769.bam

The parts of the genes that have the most coverage are the coding sequences, specifically the exons, which makes sense as this is RNA-seq data showing gene expression.