function findmeans() {

	for d in $(find compiled_STRGs -type f | cut -d/ -f2);
	#So $d changes with each loop, taking a different sample ID each time
	do
		
		echo $d | awk '{split($1, words, "."); print words[1]}' >> means_for_R_temp1.gtf
		#create a file with the codes for the replicates

		

		awk '{ total += $2 } END { print total/NR }' compiled_STRGs/$d >> means_for_R_temp2.gtf

	done

	chmod +rwx means_for_R_temp1.gtf
	chmod +rwx means_for_R_temp2.gtf
	#change permissions so can paste files

	paste means_for_R_temp1.gtf means_for_R_temp2.gtf >> means_for_R.gtf
	#paste the files together into a new file with codes in the first column and TPM values in the second

	rm means_for_R_temp1.gtf
	rm means_for_R_temp2.gtf
	#remove the old unneeded files
}
