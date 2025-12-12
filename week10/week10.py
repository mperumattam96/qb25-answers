#!/usr/bin/env python3
import sys
import numpy as np
from fasta import readFASTA

#read in parameters 
fasta_file = sys.argv[1]
sigma_file = sys.argv[2]
gap_penalty = int(sys.argv[3])
out_file = sys.argv[4]

input_sequences = readFASTA(open(fasta_file))
seq1_id, sequence1 = input_sequences[0]
seq2_id, sequence2 = input_sequences[1]

# Read the scoring matrix into a dictionary
fs = open(sigma_file)
sigma = {}
alphabet = fs.readline().strip().split()
for line in fs:
	line = line.rstrip().split()
	for i in range(1, len(line)):
		sigma[(alphabet[i - 1], line[0])] = float(line[i])
fs.close()

# Read in the actual sequences using readFASTA
# Initialize F matrix 
F_matrix = np.zeros((len(sequence1)+1, len(sequence2)+1), dtype=int)
for i in range(len(sequence1)+1):
	F_matrix[i,0] = i*gap_penalty # first column
for j in range(len(sequence2)+1):
	F_matrix[0,j] = j*gap_penalty # first row
	
# Initialize traceback matrix 

T_matrix = np.empty((len(sequence1)+1, len(sequence2)+1), dtype=object)

up = 'up'
left = 'left'
diag = 'diag'

for i in range(len(sequence1)+1):
    T_matrix[i,0] = up
for j in range(len(sequence2)+1):
    T_matrix[0,j] = left
T_matrix[0,0] = None


#Populate matrices 

for i in range(1, len(sequence1)+1):  # loop through rows
    for j in range(1, len(sequence2)+1):  # loop through columns
        score_diag = F_matrix[i-1, j-1] + sigma[(sequence1[i-1], sequence2[j-1])]
        score_up   = F_matrix[i-1, j] + gap_penalty
        score_left = F_matrix[i, j-1] + gap_penalty

        F_matrix[i, j] = max(score_diag, score_up, score_left)

        # tie-break
        if F_matrix[i, j] == score_diag:
            T_matrix[i, j] = diag
        elif F_matrix[i, j] == score_up:
            T_matrix[i, j] = up
        else:
            T_matrix[i, j] = left

sequence1_alignment = ''
sequence2_alignment = ''
i = len(sequence1)
j = len(sequence2)

# Follow traceback to generate alignment 
while i > 0 or j > 0:
    direction = T_matrix[i, j]

    if direction == 'diag':
        sequence1_alignment += sequence1[i-1]
        sequence2_alignment += sequence2[j-1]
        i -= 1
        j -= 1

    elif direction == 'up':
        sequence1_alignment += sequence1[i-1]
        sequence2_alignment += "-"
        i -= 1

    elif direction == 'left':
        sequence1_alignment += "-"
        sequence2_alignment += sequence2[j-1]
        j -= 1


#reverse
sequence1_alignment = sequence1_alignment[::-1]
sequence2_alignment = sequence2_alignment[::-1]

# identify alignment 
identity_alignment = ''
for i in range(len(sequence1_alignment)):
	if sequence1_alignment[i] == sequence2_alignment[i]:
		identity_alignment += '|'
	else:
		identity_alignment += ' '

#write alignment to output          
output = open(out_file, 'w')

for i in range(0, len(identity_alignment), 100):
	output.write(sequence1_alignment[i:i+100] + '\n')
	output.write(identity_alignment[i:i+100] + '\n')
	output.write(sequence2_alignment[i:i+100] + '\n\n\n')
	
#metrics 

#score
alignment_score = F_matrix[len(sequence1), len(sequence2)]

matches = 0
for i in range(len(sequence1_alignment)):
    a = sequence1_alignment[i]
    b = sequence2_alignment[i]
    if a == b:
        matches += 1

#sequence identity 
percent_identity_seq1 = matches / len(sequence1_alignment) * 100
percent_identity_seq2 = matches / len(sequence2_alignment) * 100

#gaps 
gaps_seq1 = sequence1_alignment.count("-")
gaps_seq2 = sequence2_alignment.count("-")


print("Gaps in sequence 1:", gaps_seq1)
print("Gaps in sequence 2:", gaps_seq2)
print("Percent identity (seq1):", percent_identity_seq1)
print("Percent identity (seq2):", percent_identity_seq2)
print("Alignment score:", alignment_score)