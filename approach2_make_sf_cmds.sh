#!/bin/bash

#Create a variable to hold the location of the sailfish index, so I don't have to type it out ever ever again
#Assumes I'm working in the home directory because the file path is relative to $HOME
indexDir=/home/jw817/sailfish_index_approach2

#Now we want a for loop to go through every sample of RNA-seq data
#We find every directory within rna-seq.fastq that is the right strain (i.e., BL6). Then we cut using / as a delimiter and take the second field, so we just get the sample ID
for d in $(find rna-seq.StringTie -type d -name "*_C57BL-6J_*" | cut -d/ -f2);
#So $d changes with each loop, taking a different sample ID each time
do
#Pull the lane number from the sample ID and save it in a variable
lane=$(echo $d | cut -d_ -f2 | cut -d# -f1)
#First make a new directory within rna-seq.sailfish to hold the output, for each sample
#Then run sailfish
#Save these commands in a file
echo "sailfish quant -i $indexDir -l \"ISF\" -1 /home/jg600/rna-seq.fastq/$d/s_"$lane"_1_sequence.fq -2 /home/jg600/rna-seq.fastq/$d/s_"$lane"_2_sequence.fq -o /home/jw817/rna-seq.StringTie/$d -p 4" >> approach1_sf_cmds.txt
done
