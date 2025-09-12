#1
cd qb25-answers #command line prompts
cd unix-python-scripts #looking in the correct directory 
chmod +x MP_python_script.py #making my file executable
./MP_python_script.py ce11_genes.bed #calls my script and which file to look at 
wc -l ce11_genes.bed #counts number of lines
output: 
#53935 features 

cut -f 1 ce11_genes.bed|sort|uniq -c #command line prompt
output:
# 5460 chrI
# 6299 chrII
# 4849 chrIII
# 21418 chrIV
#   12 chrM
# 9057 chrV
# 6840 chrX

cut -f 6 ce11_genes.bed|sort|uniq -c #command line prompt
output:
# 26626 -
# 27309 +

cd /Users/cmdb/Data/GTEx 
head GTEx_Analysis_v8_Annotations_SampleAttributesDS.txt #to determine which column SMTSDs is in 
cut -f 7 GTEx_Analysis_v8_Annotations_SampleAttributesDS.txt |sort|uniq -c|sort 

The three SMTSDs with the most samples: 
Whole Blood, Muscle - Skeletal, Lung

output: 
#    1 SMTSD
#    4 Kidney - Medulla
#    9 Cervix - Ectocervix
#    9 Fallopian Tube
#   10 Cervix - Endocervix
#   21 Bladder
#  100 Kidney - Cortex
#  164 Brain - Substantia nigra
#  166 Uterus
#  173 Vagina
#  177 Brain - Amygdala
#  181 Minor Salivary Gland
#  182 Brain - Spinal cord (cervical c-1)
#  192 Cells - EBV-transformed lymphocytes
#  193 Small Intestine - Terminal Ileum
#  195 Ovary
#  213 Brain - Anterior cingulate cortex (BA24)
#  217 Cells - Leukemia cell line (CML)
#  232 Brain - Putamen (basal ganglia)
#  236 Brain - Hypothalamus
#  243 Brain - Hippocampus
#  251 Liver
#  253 Artery - Coronary
#  260 Spleen
#  262 Prostate
#  263 Brain - Cerebellar Hemisphere
#  275 Adrenal Gland
#  277 Brain - Nucleus accumbens (basal ganglia)
#  291 Brain - Caudate (basal ganglia)
#  298 Brain - Cerebellum
#  301 Pituitary
#  325 Brain - Cortex
#  360 Pancreas
#  381 Stomach
#  389 Colon - Sigmoid
#  401 Esophagus - Gastroesophageal Junction
#  406 Testis
#  425 Brain - Frontal Cortex (BA9)
#  432 Colon - Transverse
#  450 Artery - Aorta
#  452 Heart - Atrial Appendage
#  480 Breast - Mammary Tissue
#  527 Cells - Cultured fibroblasts
#  559 Esophagus - Muscularis
#  564 Adipose - Visceral (Omentum)
#  622 Esophagus - Mucosa
#  638 Skin - Not Sun Exposed (Suprapubic)
#  689 Heart - Left Ventricle
#  722 Nerve - Tibial
#  763 Adipose - Subcutaneous
#  770 Artery - Tibial
#  812 Thyroid
#  849 Skin - Sun Exposed (Lower leg)
#  867 Lung
# 1132 Muscle - Skeletal
# 3288 Whole Blood

#3


grep "RNA" GTEx_Analysis_v8_Annotations_SampleAttributesDS.txt|wc -l #command 
#20017 lines that have RNA 

man grep #look for more commands, found  -v, --invert-match

grep -v "RNA" GTEx_Analysis_v8_Annotations_SampleAttributesDS.txt|wc -l
# 2935 lines that do not have RNA 






