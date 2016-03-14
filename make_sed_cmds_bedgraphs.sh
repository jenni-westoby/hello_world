for d in $(find Desktop/partII_research_project/bedgraphs -type d -name "*_C57BL-6J_*" | cut -d/ -f4);
do

echo "sed -i.backup -e 's/name=.*/name=$d/' Desktop/partII_research_project/bedgraphs/$d/chr17_bedgraph.bedgraph; sed -i.backup -e 's/name=.*/name=$d/' Desktop/partII_research_project/bedgraphs/$d/chr16_bedgraph.bedgraph; sed -i.backup -e 's/name=.*/name=$d/' Desktop/partII_research_project/bedgraphs/$d/chr9_bedgraph.bedgraph;" >> Desktop/partII_research_project/sed_cmds_bedgraphs_new.gtf

done
