cd week1 
grep 1_Active nhek.bed > nhek-active.bed
grep 12_Repressed nhek.bed > nhek-repressed.bed
ls
mv /Users/cmdb/Downloads/nhlf.bed /Users/cmdb/qb25-answers/week1
grep 1_Active nhlf.bed > nhlf-active.bed
grep 12_Repressed nhlf.bed > nhlf-repressed.bed
(qb25) cmdb@QuantBio-33 week1 % wc nhek-active.bed 
   14013  112104  899705 nhek-active.bed
(qb25) cmdb@QuantBio-33 week1 % wc nhek-repressed.bed 
   32314  258512 1916982 nhek-repressed.bed
(qb25) cmdb@QuantBio-33 week1 % wc nhlf-active.bed 
   14888  119104  956585 nhlf-active.bed
(qb25) cmdb@QuantBio-33 week1 % wc nhlf-repressed.bed 
   34469  275752 2044657 nhlf-repressed.bed

#Construct a bedtools command to test where there is any overlap between 1_Active and 12_Repressed in a given condition (aka mutually exclusive)
cd /Users/cmdb/qb25-answers/week1
bedtools intersect -u -a nhek-active.bed -b nhek-repressed.bed > mutually_exl.bed
wc mutually_exl.bed 
#1 - there is no overlap in nhek active and repressed (output = 0)

#active in NHEK and NHLF = 11608
bedtools intersect 
bedtools intersect -u -a nhek-active.bed -b nhlf-active.bed > both_active.bed
wc both_active.bed

#regions that are active in NHEK but not active in NHLF = 2405
bedtools intersect -v -a nhek-active.bed -b nhlf-active.bed > NHEKactive_notNHLF.bed
wc NHEKactive_notNHLF.bed

#features output first command: 11608
#features output second command: 2405
#14013 - original number of lines in nhek-active.bed matches the sum
# 11608+2405 = 14013 ! 















