for d in $(find rna-seq.StringTie -type d -name "*_C57BL-6J_*" | cut -d/ -f2);
do

echo "mkdir /home/jw817/bedgraphs/$d; grep 'chr9\|chr16\|chr17' /home/jg600/rna-seq.STAR_aligned/$d/coverage.bedgraph > /home/jw817/bedgraphs/$d/bedgraph_data.bedgraph" >> make_bedgraphs_cmds.txt

done

