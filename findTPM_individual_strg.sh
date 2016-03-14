function findTPM {

	for d in $(find /Volumes/JENNI/home/jenniwestoby/"$1"_Kallisto -type d -name "*_C57BL-6J_*" | cut -d/ -f7);
	do

		grep "STRG.31917.1\|STRG.36884.1\|STRG.35199.1\|STRG.42328.1\|STRG.54679.7\|STRG.42150.2\|STRG.40709.2\|STRG.30389.1\|STRG.37284.1\|STRG.37954.1\|STRG.39201.1\|STRG.64690.1\|STRG.35902.2\|STRG.52177.2\|STRG.42795.2\|STRG.34662.1\|STRG.35551.1\|STRG.38304.1\|STRG.25700.3\|STRG.40633.2\|STRG.24765.1\|STRG.36738.2\|STRG.38818.2\|STRG.35788.1\|STRG.36457.1\|STRG.25957.2\|STRG.43176.3\|STRG.37784.1\|STRG.37275.1" /Volumes/JENNI/home/jenniwestoby/"$1"_Kallisto/$d/Relevant_Strings.gtf | awk '{print $1"\t"$5}'>> Desktop/partII_research_project/$1_STRG.31917.1.gtf

	done
}
