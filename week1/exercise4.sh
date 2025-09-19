touch exercise4.sh
open exercise4.sh -a "visual studio code"
mv /Users/cmdb/Downloads/snps-chr1.bed /Users/cmdb/qb25-answers/week1
wc snps-chr1.bed 

bedtools intersect -wa -a snps.chr1 -b hg19-kc.bed > SNPS_in_hg19.bed
cut -f 2 SNPS_in_hg19.bed |sort| uniq -c

bedtools sample -n 20 -seed 42 snps.chr1 > SNP_subset.bed

bedtools sort -i SNP_subset.bed > SNP_subset.bed
bedtools sort -i hg19-kc.bed > hg19-kc.bed
bedtools closest -a SNP_subset.bed -b hg19-kc.bed -d -t > both_sorted.bed
