# FlaGs
Predicting protein functional association by analysis of conservation of genomic context (Flanking Genes).

#Version 1.2.7 Updates:

- When the length of Flanking Gene is more than 7000 amino acids Jackhmmer can not process the clustering step and thus raised error for few reported cases. This version of FlaGs checks if the length of all Flanking Genes for each query. If the query has been found with a flanking gene that is longer than 7000 amino acids, it has been excluded (reported in the file with '_QueryStatus.txt' suffix) and in from the analyses to avoid errors. 

- This version also contains a shell script that can create a conda environment specifically for FlaGs, so that if user had previously installed conda in the computer, can run FlaGs just by adding this environment. 
