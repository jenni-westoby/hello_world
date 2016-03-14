function findTPM {

	for d in $(find "$1"_StringTie -type d -name "*_C57BL-6J_*" | cut -d/ -f2);
	do

		grep "STRG.31917.1\|STRG.36884.1\|STRG.35199.1\|STRG.42328.1\|STRG.54679.7\|STRG.42150.2\|STRG.40709.2\|STRG.30389.1\|STRG.37284.1\|STRG.37954.1\|STRG.39201.1\|STRG.64690.1\|STRG.35902.2\|STRG.52177.2\|STRG.42795.2\|STRG.34662.1\|STRG.35551.1\|STRG.38304.1\|STRG.25700.3\|STRG.40633.2\|STRG.24765.1\|STRG.36738.2\|STRG.38818.2\|STRG.35788.1\|STRG.36457.1\|STRG.25957.2\|STRG.43176.3\|STRG.37784.1\|STRG.37275.1" "$1"_StringTie/$d/reformat_alignment_transcript_debug.gtf | awk '$3=="transcript"' | awk '{print $12$14$16}'| awk '{split($1,words,"\""); print words[2]"\t"words[4]"\t"words[6]}' >> temptestfile.gtf

	done
	
	if grep "STRG.31917.1\|STRG.36884.1\|STRG.35199.1\|STRG.42328.1\|STRG.54679.7\|STRG.42150.2\|STRG.40709.2\|STRG.30389.1\|STRG.37284.1\|STRG.37954.1\|STRG.39201.1\|STRG.64690.1\|STRG.35902.2\|STRG.52177.2\|STRG.42795.2\|STRG.34662.1\|STRG.35551.1\|STRG.38304.1\|STRG.25700.3\|STRG.40633.2\|STRG.24765.1\|STRG.36738.2\|STRG.38818.2\|STRG.35788.1\|STRG.36457.1\|STRG.25957.2\|STRG.43176.3\|STRG.37784.1\|STRG.37275.1" temptestfile.gtf;

	then

		if [`$1`=="MaleB"]
		then
	
			awk  '{ total2+=$2 } {total3+=$3} END  { print "STRG.31917.1""\t"total2/7"\t"total3/7 }' temptestfile.gtf >> StringTie_mean_TPM_values_"$1".gtf

		echo "7"

		else
			awk  '{ total2+=$2 } {total3+=$3} END  { print "STRG.31917.1""\t"total2/8"\t"total3/8 }' temptestfile.gtf >> StringTie_mean_TPM_values_"$1".gtf

		fi

	rm temptestfile.gtf

	else echo -e "STRG.31917.1\t0\t0">>StringTie_mean_TPM_values_"$1".gtf

	fi
}
#{ total2 +=$3 } END { print total2/NR }'
#{ print "STRG.31917.1""\t"} 
#| awk '{ total += $2 } END { print total/NR }'
