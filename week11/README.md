Exercise 1

1.1
How many 100bp reads are needed to sequence a 1Mbp genome to 3x coverage?
1Mbp = 1,000,000 bp 
1,000,000 x 3 = 3,000,000 
Reads = 3,000,000/100 = 30,000

1.4
1. Zero-coverage positions: 50542 (output from .py file)
2. It matches the Poisson distribution well, but does not fit the normal distrubtion as well. The Poisson distribution and my actual data is shifted more to the left than the normal distriubtion. Poisson is better with low coverage because it is asymmetric and the normal distribution is symmetric. 

1.5 
1. Zero-coverage positions: 73 (output from .py file)
2.  The Poisson distribution fits very well on this curve, and is still better than the normal distribution. 

1.6
1. Zero-coverage positions: 5 (output from .py file)
2. The Poisson curve is very smooth in this graph, and is better than the normal distrubtion. The Poisson is more aligned with the peak in my data than the normal distribution stil, and there are only 5 positions with zero coverage in the simulation. 


2.4
dot -Tpng graph.dot -o ex2_graph.png

2.5 
ATTCATTGATTCTTA

2.6
We need to make sure that we have enough sequencing reads so we don't have positions with 0 coverage. Now, the standard is typically aiming for 30x coverage. We also need to make sure that during the reconstruction, we have only one path possible for the real genomic sequence. To do this, we must have have long enough reads, so they can be be pieced together with enough overlap and not have repeated k-mers, but not too long so there are errors. We need a k-mer of at least 15 nt long for human. 

