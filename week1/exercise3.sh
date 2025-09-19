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

#compare -a nhek-active.bed -b nhlf-active.bed (minumum overlap fraction of A or B)
bedtools intersect -f 1 -a nhek-active.bed -b nhlf-active.bed > f_only.bed
wc f_only.bed
#4821

bedtools intersect -F 1 -a nhek-active.bed -b nhlf-active.bed > bigF.bed
#6731

bedtools intersect -f 1 -F 1 -a nhek-active.bed -b nhlf-active.bed > bothF.bed
#1409

#relationship between the NHEK and NHLF chromatin state change as you alter the overlap parameter?
#The f/F command determines how much overlap there is between your datasets. 
#We need to see what nhek active states are also in nhlf active states,
#and then what nhlf active states are also in nhek active states. The last command consists of
#both perfectly overlapping, which is why there are far fewer hits than the first two commands. 

#Active in NHEK, Active in NHLF
bedtools intersect -u -a nhek-active.bed -b nhlf-active.bed > active-active.bed
#The intersect function worked, as all 9 chromatin state conditions (including NHLF and NHEK) are "active" with an active promoter, and 6 have strong enhancers as well.

#Active in NHEK, Repressed in NHLF
bedtools intersect -u -a nhek-active.bed -b nhlf-repressed.bed > active-repressed.bed
#The NHLF, HUVEC, and GM12878 conditions are repressed, while the other 6 (including NHEK) are active and ready to be transcribed. 

#Repressed in NHEK, Repressed in NHLF
bedtools intersect -u -a nhek-repressed.bed -b nhlf-repressed.bed > repressed-repressed.bed
#All 9 conditions are greyed out and classified as repressed. 





