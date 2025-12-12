#!/usr/bin/env python3

reads = ['ATTCA', 'ATTGA', 'CATTG', 'CTTAT', 'GATTG', 'TATTT', 'TCATT', 'TCTTA', 'TGATT', 'TTATT', 'TTCAT', 'TTCTT', 'TTGAT']

k = 3
edges = set()

for read in reads:
    for i in range(len(read) - k):
        src = read[i:i+k]
        dst = read[i+1:i+1+k]
        edges.add((src, dst))

with open("graph.dot", "w") as f:
    f.write("digraph G {\n")
    for src, dst in sorted(edges):
        f.write(f'    "{src}" -> "{dst}";\n')
    f.write("}\n")
