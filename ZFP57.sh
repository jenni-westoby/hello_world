for d in $(find /home/jg600/rna-seq.sailfish -type d -name "*_C57BL-6J_*" | cut -d/ -f5);
	grep OTTMUST00000096470 /home/jg600/rna-seq.sailfish/$d/quant.sf >> /home/jw817/ZFP57_expression_sf_on_whole_transcriptome.gtf
