for d in $(find rna-seq.StringTie -type d -name "*_C57BL-6J_*" | cut -d/ -f2);
do
	 grep -f Strings_for_Kallisto/$d.gtf Kallisto/$d/kallisto_quant/abundance.tsv > Kallisto/$d/Relevant_Strings.gtf

done
