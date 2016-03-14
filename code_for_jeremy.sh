for variable in $(find /home/jw817/rna-seq.StringTie -type f -name "out.gtf" | cut -d / -f 5);

do

	cd /home/jw817/rna-seq.StringTie/$variable

	for I in range {37001113-37010729}; 
	do

		if ! awk “transcript” out.gtf | grep $I | grep annotation_transcripts.gtf
			awk “transcript” out.gtf | grep “I”  >> annotation_transcripts.gtf

	done



	for I in range {3744043- 3750791};
	do

	done

	for I in range {122848860-122866006};
	do

	done
