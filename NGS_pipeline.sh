SECONDS=0
# Seconds will give us output time for entire run or single run 
# change working directory

# type pwd to know the root for currient directory
cd /home/venu/Desktop/NGS_pipeline/

#Next directory should be Script directory 
# We need to specify data file which holds fastaq files as input and output

# STEP 1: Run fastqc
#fastqc data/demo.fastq -o data/SR 
#SRA_fastaq files
fastqc data/SRR_1.fastq -o data/

# run trimmomatic to trim reads with poor quality
# There are many tools for trimming data.
java -jar ~/Desktop/demo/tools/Trimmomatic-0.39/trimmomatic-0.39.jar SE -threads 4 data/demo.fastq data/demo_trimmed.fastq TRAILING:10 -phred33
echo "Trimmomatic finished running!"

#fastqc data/demo_trimmed.fastq -o data/


# STEP 2: Run HISAT2
# HISAT2 proved that very fast than compared wirh STAR 
# install and run python code provided by HISAT2 
# get the genome indices alignmenr wirh human genome
# htps://genome-idx.s3.amazonaws.com/hisat/grch38_genome.tar.gz

#
# run alignment
hisat2 -q --rna-strandness R -x HISAT2/grch38/genome -U data/SRR_trimmed.fastq | samtools sort -o HISAT2/demo_trimmed.bam
echo "HISAT2 finished running!"

# STEP 3: Run featureCounts - Quantification

# get features 
# wget http://ftp.ensembl.org/pub/release-106/gtf/homo_sapiens/Homo_sapiens.GRCh38.106.gtf.gz
featureCounts -S 2 -a ../hg38/Homo_sapiens.GRCh38.106.gtf -o quants/demo_featurecounts.txt HISAT2/demo_trimmed.bam
echo "featureCounts finished running!"


duration=$SECONDS
echo "$(($duration / 60)) minutes and $(($duration % 60)) seconds elapsed."
