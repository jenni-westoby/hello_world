for d in $(find rna-seq.StringTie -type d -name "*_C57BL-6J_*" | cut -d/ -f2);
do

echo "cp chr9_bedgraph.bedgraph /home/jw817/bedgraphs/$d; grep 'chr9' /home/jw817/bedgraphs/$d/bedgraph_data.bedgraph >> /home/jw817/bedgraphs/$d/chr9_bedgraph.bedgraph; cp chr16_bedgraph.bedgraph /home/jw817/bedgraphs/$d; grep 'chr16' /home/jw817/bedgraphs/$d/bedgraph_data.bedgraph >> /home/jw817/bedgraphs/$d/chr16_bedgraph.bedgraph; cp chr17_bedgraph.bedgraph /home/jw817/bedgraphs/$d; grep 'chr17' /home/jw817/bedgraphs/$d/bedgraph_data.bedgraph >> /home/jw817/bedgraphs/$d/chr17_bedgraph.bedgraph;" >> make_bedgraphs_cmds_chr_specific.txt

done
