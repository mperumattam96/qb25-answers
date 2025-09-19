(qb25) cmdb@QuantBio-33 Downloads % cd ..
(qb25) cmdb@QuantBio-33 ~ % cd qb25-answers 
(qb25) cmdb@QuantBio-33 qb25-answers % cd assignments 
(qb25) cmdb@QuantBio-33 assignments % ls
data_exploration_assignment.Rmd
data_visualization_assignment.Rmd
MP_data_exploration_assignment_complete
MP_data_exploration_assignment_complete.Rmd
qb25-answers_MP:python_dictionaries.ipynb
qb25-answers:python_basics.ipynb
(qb25) cmdb@QuantBio-33 assignments % cd ..
(qb25) cmdb@QuantBio-33 qb25-answers % cd week1 
(qb25) cmdb@QuantBio-33 week1 % ls
exercise1.Rmd.R			hg19-main.chrom.sizes
hg19-1mb.bed			hg19.chrom.sizes
hg19-kc-count.bed		hgt_genome_23cdbf_4457d0.pdf
hg19-kc.bed			hgt_genome_23e881_445a20.pdf
hg19-kc.tsv			nhek.bed
(qb25) cmdb@QuantBio-33 week1 %   grep 1_Active nhek.bed > nhek-active.bed
(qb25) cmdb@QuantBio-33 week1 %   grep 12_Repressed nhek.bed > nhek-repressed.bed
(qb25) cmdb@QuantBio-33 week1 % ls
exercise1.Rmd.R			hg19.chrom.sizes
hg19-1mb.bed			hgt_genome_23cdbf_4457d0.pdf
hg19-kc-count.bed		hgt_genome_23e881_445a20.pdf
hg19-kc.bed			nhek-active.bed
hg19-kc.tsv			nhek-repressed.bed
hg19-main.chrom.sizes		nhek.bed
(qb25) cmdb@QuantBio-33 week1 % mv /Users/cmdb/Downloads/nhlf.bed /Users/cmdb/qb25-answers/week1
(qb25) cmdb@QuantBio-33 week1 % ls
exercise1.Rmd.R			hgt_genome_23cdbf_4457d0.pdf
hg19-1mb.bed			hgt_genome_23e881_445a20.pdf
hg19-kc-count.bed		nhek-active.bed
hg19-kc.bed			nhek-repressed.bed
hg19-kc.tsv			nhek.bed
hg19-main.chrom.sizes		nhlf.bed
hg19.chrom.sizes
(qb25) cmdb@QuantBio-33 week1 % grep 1_Active nhlf.bed > nhlf-active.bed
(qb25) cmdb@QuantBio-33 week1 % grep 12_Repressed nhlf.bed > nhlf-repressed.bed
(qb25) cmdb@QuantBio-33 week1 % ls
exercise1.Rmd.R			hgt_genome_23e881_445a20.pdf
hg19-1mb.bed			nhek-active.bed
hg19-kc-count.bed		nhek-repressed.bed
hg19-kc.bed			nhek.bed
hg19-kc.tsv			nhlf-active.bed
hg19-main.chrom.sizes		nhlf-repressed.bed
hg19.chrom.sizes		nhlf.bed
hgt_genome_23cdbf_4457d0.pdf
(qb25) cmdb@QuantBio-33 week1 % wc nhek-active.bed 
   14013  112104  899705 nhek-active.bed
(qb25) cmdb@QuantBio-33 week1 % wc nhek-repressed.bed 
   32314  258512 1916982 nhek-repressed.bed
(qb25) cmdb@QuantBio-33 week1 % wc nhlf-active.bed 
   14888  119104  956585 nhlf-active.bed
(qb25) cmdb@QuantBio-33 week1 % nhlf-re
zsh: command not found: nhlf-re
(qb25) cmdb@QuantBio-33 week1 % wc nhlf-repressed.bed 
   34469  275752 2044657 nhlf-repressed.bed
(qb25) cmdb@QuantBio-33 week1 % 






