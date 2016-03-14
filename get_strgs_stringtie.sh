function findTPM {

	for d in $(find /Volumes/JENNI/home/jenniwestoby/"$1"_StringTie -type d -name "*_C57BL-6J_*" | cut -d/ -f7);
	do

		grep "STRG.31917.2\|STRG.36884.5\|STRG.35199.2\|STRG.42328.6\|STRG.54679.2\|STRG.31575.1\|STRG.40709.1\|STRG.39201.3\|STRG.52177.1\|STRG.34662.4\|STRG.38304.2\|STRG.25700.1\|STRG.40633.3\|STRG.24765.2\|STRG.36738.1\|STRG.38818.1\|STRG.35788.2\|STRG.36457.2\|STRG.25957.1\|STRG.37139.2\|STRG.43176.1\|STRG.37784.2\|STRG.37275.2" /Volumes/JENNI/home/jenniwestoby/"$1"_StringTie/$d/reformat_alignment_transcript_debug.gtf | awk '$3=="transcript"' | awk '{print $12$16}'| awk '{split($1,words,"\""); print words[2]"\t"words[4]"\t"words[6]}' >> Desktop/"$1"_StringTie_31917_2.gtf

	done

}
