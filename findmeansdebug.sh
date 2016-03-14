function findmeans {

	for d in $(find compiled_STRGs -type f | cut -d/ -f2);
	#So $d changes with each loop, taking a different sample ID each time
	do
		$g= cut $d -d. -f1
		echo $g >> means_for_R_temp1.gtf
		#create a file with the codes for the replicates

		

		awk '{ total += $2 } END { print total/NR }' compiled_STRGs/$d >> means_for_R_temp2.gtf

	done
