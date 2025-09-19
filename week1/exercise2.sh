wget https://hgdownload.soe.ucsc.edu/goldenPath/hg16/bigZips/hg16.chrom.sizes
less hg16.chrom.sizes
grep -v _ hg16.chrom.sizes > hg16-main.chrom.sizes
bedtools makewindows -g hg16-main.chrom.sizes -w 1000000 > hg16-1mb.bed > hg16-1mb.bed 
wc hg16-1mb.bed 
mv /Users/cmdb/Downloads/hg16-kc.tsv /Users/cmdb/qb25-answers/week1
wc hg16-kc.tsv
cut -f1-3,5 hg16-kc.tsv > hg16-kc.bed
head -n 5 hg16-kc.bed 
bedtools intersect -c -a hg16-1mb.bed -b hg16-kc.bed > hg16-kc-count.bed 
wc hg16-kc-count.bed 

#genes in hg19 = 80270
cut -f4 hg19-kc.bed | wc -l
#How many genes are in hg19 but not in hg16?
bedtools intersect -v -a hg19-kc.bed -b hg16-kc.bed > hg19_no16.bed
cut -f4 hg19_no16.bed | wc -l
#42717 genes only in hg19
#hg19 is a newer reference genome, so technology and annotations have improved, thus increasing the number of genes in the genome

#genes in hg16 = 21365
cut -f4 hg16-kc.bed | wc -l
#How many genes are in hg16 but not in hg19?
bedtools intersect -v -a hg16-kc.bed -b hg19-kc.bed > hg16_no19.bed
cut -f4 hg16_no19.bed | wc -l
#3460 genes only in hg16
#Because hg16 is an older genome, there might be some areas in the genome previously annotated as genes that are no longer considered fucntional genes, like a chromosomal insertion of a different gene. 