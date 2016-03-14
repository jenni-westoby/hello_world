function findTPM {

	for d in $(find /Volumes/JENNI/home/jenniwestoby/"$1"_Kallisto -type d -name "*_C57BL-6J_*" | cut -d/ -f7);
	do

		grep "STRG.11740.1\|STRG.13516.1\|STRG.12868.1\|STRG.15733.1\|STRG.20450.1\|STRG.11668.1\|STRG.15514.1\|STRG.15353.1\|STRG.11490.1\|STRG.13940.1\|STRG.14217.1\|STRG.14616.1\|STRG.24375.1\|STRG.13360.1\|STRG.19330.1\|STRG.16101.1\|STRG.12895.1\|STRG.13170.1\|STRG.9338.1\|STRG.13486.1\|STRG.14091.1\|STRG.13551.1\|STRG.12763.1\|STRG.13023.1\|STRG.13945.1\|STRG.9030.1\|STRG.14913.1\|STRG.8962.1\|STRG.13403.1\|STRG.14192.1" /Volumes/JENNI/home/jenniwestoby/"$1"_Kallisto/$d/Relevant_Strings.gtf | awk '{print $1"\t"$5}'>> Desktop/partII_research_project/"$1"_Kallisto_11740_1.gtf

done
}
