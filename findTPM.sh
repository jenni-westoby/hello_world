function findTPM {

	for d in $(find "$1"_StringTie -type d -name "*_C57BL-6J_*" | cut -d/ -f2);
	do

		grep "STRG.13023.2\|STRG.14192.3" "$1"_StringTie/$d/reformat_alignment_transcript_debug.gtf | awk '$3=="transcript"' | awk '{print $12$14$16}'| awk '{split($1,words,"\""); print words[2]"\t"words[4]"\t"words[6]}' >> temptestfile.gtf

	done
	
	if grep "STRG.13023.2\|STRG.14192.3" temptestfile.gtf;

	then

		if [ $1 = "MaleT" ] 
		then
	
			awk  '{ total2+=$2 } {total3+=$3} END  { print "STRG.13023.2""\t"total2/7"\t"total3/7 }' temptestfile.gtf >> StringTie_mean_TPM_values_"$1".gtf

			echo "$1"

		else
			awk  '{ total2+=$2 } {total3+=$3} END  { print "STRG.13023.2""\t"total2/8"\t"total3/8 }' temptestfile.gtf >> StringTie_mean_TPM_values_"$1".gtf

		fi

	rm temptestfile.gtf

	else echo -e "STRG.13023.2\t0\t0">>StringTie_mean_TPM_values_"$1".gtf

	fi
}
#{ total2 +=$3 } END { print total2/NR }'
#{ print "STRG.31917.1""\t"} 
#| awk '{ total += $2 } END { print total/NR }'
