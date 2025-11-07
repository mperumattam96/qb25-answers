1.3 What does the PCA plot suggest to you about the data? Why?
I think the label for Rep2 Fe and Rep3 LFC.Fe data points got switched. Because PCA1 is explained by tissue type, their "colors" (which we coded to be indicated by tissue type) are in opposite clusters. 

I am not sure how to fix this problem. I imagine there was a problem with Fe and LFC.Fe being named similarly, so when the data was read in it switched the label for the data points, but the actual data is correct. 

What feature explains the first principal component (simply saying “tissue” is not sufficient)?
PCA1 seems to be indicating that tissue type is the highest source of variance in gene expression, which makes sense with what we know about cell-type specificity and gene expression. 

3. GO analysis
Overall, the categories of enrichment make sense. Cluster 3 seems to have a general theme of membrane transport components that are enriched, and Cluster 6 has immune response components enriched. We would hope that for specific clusters, the gene ontology results would fall into the same category. 