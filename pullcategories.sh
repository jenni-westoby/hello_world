function pullcategories {
#function that takes a transcript name and searches through quant files in rna-seq.StringTie, pulling out the TPM value for that transcript in each quant file and creating a new file with the TPM values for the transcript of interest in the second column and the code for the mouse replicate in the first

	local STRG=$1

	#start of file name
	middle=$(echo $STRG | cut -d. -f2)
	#end of file name
	end=$(echo $STRG | cut -d. -f3)

	
	for d in $(find FemaleB_StringTie -type d -name "*_C57BL-6J_*" | cut -d/ -f2);
	#So $d changes with each loop, taking a different sample ID each time
	do
		echo '"'$d'"' >> data_for_R/compiled_STRGs_femaleB_StringTie/$middle$end"_temp1.gtf"

		echo "femaleB" >> data_for_R/compiled_STRGs_femaleB_StringTie/$middle$end"_temp3.gtf"
		#create a file with the codes for the replicates
		
		grep $STRG /home/jenniwestoby/rna-seq.StringTie/$d/quant.sf | awk '{print $4}' >> data_for_R/compiled_STRGs_femaleB_StringTie/$middle$end"_temp2.gtf"
		#create a file with the TPM values
		

	done
	
	chmod +rwx data_for_R/compiled_STRGs_femaleB_StringTie/$middle$end"_temp1.gtf"
	chmod +rwx data_for_R/compiled_STRGs_femaleB_StringTie/$middle$end"_temp2.gtf"
	#change permissions so can paste files
	cp data_for_R/carbon_copy.gtf data_for_R/compiled_STRGs_femaleB_StringTie/$middle$end".gtf"

	paste data_for_R/compiled_STRGs_femaleB_StringTie/$middle$end"_temp1.gtf" data_for_R/compiled_STRGs_femaleB_StringTie/$middle$end"_temp2.gtf" data_for_R/compiled_STRGs_femaleB_StringTie/$middle$end"_temp3.gtf">> data_for_R/compiled_STRGs_femaleB_StringTie/$middle$end".gtf"
	#paste the files together into a new file with codes in the first column and TPM values in the second

	rm data_for_R/compiled_STRGs_femaleB_StringTie/$middle$end"_temp1.gtf"
	rm data_for_R/compiled_STRGs_femaleB_StringTie/$middle$end"_temp2.gtf"
	#remove the old unneeded files
}
