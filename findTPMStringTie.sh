function findTPM {

	for d in $(find "$1"_StringTie -type d -name "*_C57BL-6J_*" | cut -d/ -f2);
	do

		grep "STRG.13516.4\|STRG.13945.3" "$1"_StringTie/$d/reformat_alignment_transcript_debug.gtf | awk '$3=="transcript"' | awk '{print $12$18}'| awk '{split($1,words,"\""); print words[2]"\t"words[4]}' >> temptestfile.gtf

	done
	
	if grep "STRG.13516.4\|STRG.13945.3" temptestfile.gtf;

	then

		if [ $1 = "MaleT" ] 
		then
	
			awk  '{ total += $2; sumsq += ($2)^2} END  { print "STRG.13516.4""\t"total/7"\t"sqrt((sumsq-total^2/7)/6)}' temptestfile.gtf >> StringTie_mean_sd_TPM_values_"$1".gtf

			echo "$1"

		else
			awk  '{ total += $2; sumsq += ($2)^2} END  { print "STRG.13516.4""\t"total/8"\t"sqrt((sumsq-total^2/8)/7)}' temptestfile.gtf >> StringTie_mean_sd_TPM_values_"$1".gtf

		fi

	rm temptestfile.gtf

	else echo -e "STRG.13516.4\t0\t0">>StringTie_mean_sd_TPM_values_"$1".gtf

	fi
}
