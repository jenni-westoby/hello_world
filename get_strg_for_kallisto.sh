for d in $(find rna-seq.StringTie -type d -name "*_C57BL-6J_*" | cut -d/ -f2);
do
	awk '$3=="transcript"' rna-seq.StringTie/$d/reformat_alignment_transcript_debug.gtf | awk '{print $12}' | cut -d"\"" -f2 > Strings_for_Kallisto/$d.gtf
done
