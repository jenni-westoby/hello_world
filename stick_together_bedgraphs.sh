for d in $(find Desktop/partII_research_project/bedgraphs -type d -name "*_C57BL-6J_*" | cut -d/ -f4);
do
cat Desktop/temporary_bedgraph.bedgraph Desktop/partII_research_project/bedgraphs/$d/chr17_bedgraph.bedgraph > Desktop/temporary_bedgraph2.bedgraph
rm Desktop/temporary_bedgraph.bedgraph
cp Desktop/temporary_bedgraph2.bedgraph Desktop/temporary_bedgraph.bedgraph
done
