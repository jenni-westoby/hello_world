import re

with open("out.gtf", "r") as f:

	lines=f.readlines()
	
	i=0
	
	while i < len(lines):
		
			
		line=lines[i].strip()
		if line[0] == "#":
			i += 1
			continue
		lineList = re.split("\s+", line)		

		chromosome=lineList[0]
		identifier=lineList[2]
		start=lineList[3]
		end=lineList[4]
		i += 1

		if identifier=='transcript' and chromosome=="17" and 37001113<=int(start)<=37010729:

# ZFP57 is on chromosome 17 and 3701113-37010729 is the range across which I want to extract any overlapping transcripts

			with open("alignment_transcript_debug.gtf", "a") as myfile:
				myfile.write(line+'\n')
				myfile.close()

			while re.split('\s', lines[i].strip())[2]=='exon':
				with open("alignment_transcript_debug.gtf", "a") as myfile:
					myfile.write(lines[i])
					myfile.close()
				i=i+1

		elif identifier=='transcript' and chromosome=="17" and int(start)<=37001113 and int(end)>37001113:

#This condition will catch any transcripts that start before the expected start site but overlap with the rest of the gene

			with open("alignment_transcript_debug.gtf", "a") as myfile:
				myfile.write(line+'\n')
				myfile.close()
			

			while re.split('\s', lines[i].strip())[2]=='exon':
				with open("alignment_transcript_debug.gtf", "a") as myfile:
					myfile.write(lines[i])
					myfile.close()
				i=i+1

		elif identifier=='transcript' and chromosome=="9" and int(start)<=122848860 and int(end)>122848860:
			
			with open("alignment_transcript_debug.gtf", "a") as myfile:
				myfile.write(line+'\n')
				myfile.close()

			while re.split('\s', lines[i].strip())[2]=='exon':
				with open("alignment_transcript_debug.gtf", "a") as myfile:
					myfile.write(lines[i])
					myfile.close()
				i=i+1

		elif identifier=='transcript' and chromosome=="9" and 122848860<=int(start)<=122866006:

			with open("alignment_transcript_debug.gtf", "a") as myfile:
				myfile.write(line+'\n')
				myfile.close()

			while re.split('\s', lines[i].strip())[2]=='exon':
				with open("alignment_transcript_debug.gtf", "a") as myfile:
					myfile.write(lines[i])
					myfile.close()
				i=i+1

		elif identifier=='transcript' and chromosome=="16" and int(start)<=3744043 and int(end)>3744043:

			with open("alignment_transcript_debug.gtf", "a") as myfile:
				myfile.write(line+'\n')
				myfile.close()

			while re.split('\s', lines[i].strip())[2]=='exon':
				with open("alignment_transcript_debug.gtf", "a") as myfile:
					myfile.write(lines[i])
					myfile.close()
				i=i+1

		elif identifier=='transcript' and chromosome=="16" and 3744043<=int(start)<=3750791:

			with open("alignment_transcript_debug.gtf", "a") as myfile:
				myfile.write(line+'\n')
				myfile.close()			

			while re.split('\s', lines[i].strip())[2]=='exon':
				with open("alignment_transcript_debug.gtf", "a") as myfile:
					myfile.write(lines[i])
					myfile.close()
				i=i+1

		

