
for d in $(find rna-seq.StringTie -type d -name "*_C57BL-6J_*" | cut -d/ -f2);
#So $d changes with each loop, taking a different sample ID each time
do
#Pull the lane number from the sample ID and save it in a variable
lane=$(echo $d | cut -d_ -f2 | cut -d# -f1)

echo "bowtie -a --best --strata -S -m 100 -X 400 --chunkmbs 256 --fullref -p 4 approach2_transcripts  -1 /home/jg600/rna-seq.fastq/$d/s_"$lane"_1_sequence.fq -2 /home/jg600/rna-seq.fastq/$d/s_"$lane"_2_sequence.fq | samtools view -F 0xC -bS - | samtools sort -n - mmseq_approach2/$d/mmseq_output.namesorted; bam2hits-linux -m "\""(STRG.*)\sgene=(STRG.*)"\"" 1 2 approach2_transcripts.fa mmseq_approach2/$d/mmseq_output.namesorted.bam > mmseq_approach2/$d/mmseq_output.hits; mmseq-linux mmseq_approach2/$d/mmseq_output.hits mmseq_approach2/$d/mmseq_output" >> make_mmseq_cmds.txt

done


