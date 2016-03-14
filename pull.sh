function pull {
#function that takes a transcript name and searches through quant files in rna-seq.StringTie, pulling out the TPM value for that transcript in each quant file and creating a new file with the TPM values for the transcript of interest in the second column and the code for the mouse replicate in the first

	local STRG=$1

	#start of file name
	middle=$(echo $STRG | cut -d. -f2)
	#end of file name
	end=$(echo $STRG | cut -d. -f3)

	
	for d in $(find rna-seq.StringTie -type d -name "*_C57BL-6J_*" | cut -d/ -f2);
	#So $d changes with each loop, taking a different sample ID each time
	do
		echo $d >> compiled_STRGs/$middle$end"_temp1.gtf"
		#create a file with the codes for the replicates
		
		grep $STRG /home/jenniwestoby/rna-seq.StringTie/$d/quant.sf | awk '{print $4}' >> compiled_STRGs/$middle$end"_temp2.gtf"
		#create a file with the TPM values
		

	done
	
	chmod +rwx compiled_STRGs/$middle$end"_temp1.gtf"
	chmod +rwx compiled_STRGs/$middle$end"_temp2.gtf"
	#change permissions so can paste files

	paste compiled_STRGs/$middle$end"_temp1.gtf" compiled_STRGs/$middle$end"_temp2.gtf" > compiled_STRGs/$middle$end".gtf"
	#paste the files together into a new file with codes in the first column and TPM values in the second

	rm compiled_STRGs/$middle$end"_temp1.gtf"
	rm compiled_STRGs/$middle$end"_temp2.gtf"
	#remove the old unneeded files
}




