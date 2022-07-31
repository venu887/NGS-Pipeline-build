SECONDS=0

# Seconds will give us output time for entire run or single run 
# change working directory

# type pwd to know the root for currient directory
cd /home/venu/Desktop/NGS_pipeline/
# 1. In this pipeline I have installed SRA_toolkit then downloaded SRA fastq files(SRR15852393_1.fastq)
# 2. I used this file for further analysis quality control by FsatQC tool

#Next directory should be Script directory 
# We need to specify data file which holds fastaq files as input and output

# Run fastqc
#SRA_fastaq files
# Output as .html and .gz files
fastqc data/SRR_1.fastq -o data/


# 3. Run trimmomatic to trim reads with poor quality if necessory after verifying the data for many factors like per base quality, adopters...
# Sudo apt-get update 
# Sudo apt-get install Trimmomatic (update again) 
# There are many tools for trimming data.
# Make sure you have to give correct present working directory path and input put file name, Create output file name
# Out put as FASTQC file
java -jar ~//Desktop/NGS_pipeline/Trimmomatic-0.39/trimmomatic-0.39.jar SE -threads 4 data/SRR_1.fastq data/SRR1_Trim.fastq TRAILING:10 -phred33
echo "Trimmomatic finished running!"

# If necessory again run FastaQC for new trimmed file
fastqc data/SRR1_Trim.fastq -o data/


# 4. Run HISAT2 for genome allignment with humangenome 38
# HISAT2 proved that very fast than compared wirh STAR 
# install and run python code provided by HISAT2 
# Sudo apt-get update 
# Sudo apt-get install hisat2
# get the genome indices alignmenr wirh human genome
# wget https://genome-idx.s3.amazonaws.com/hisat/grch38_genome.tar.gz
# Or  DOWNLOD ditectly http://daehwankimlab.github.io/hisat2/download/#version-hisat2-221https://ccb.jhu.edu/software/hisat2/manual.shtml#getting-started-with-hisat2
# Extract files and keep it in folder "hisat" in that sub folder called genome has around 8 files
hisat2 -q --rna-strandness R -x hisat2/grch38/genome -U data/SRR1_Trim.fastq | samtools sort -o hisat2/SRR1_trimmed.bam
echo "HISAT2 finished running!"

# STEP 3: Run featureCounts - Quantification

# get features 
# wget http://ftp.ensembl.org/pub/release-106/gtf/homo_sapiens/Homo_sapiens.GRCh38.106.gtf.gz
featureCounts -S 2 -a ../hg38/Homo_sapiens.GRCh38.106.gtf -o quants/demo_featurecounts.txt HISAT2/demo_trimmed.bam
echo "featureCounts finished running!"


duration=$SECONDS
echo "$(($duration / 60)) minutes and $(($duration % 60)) seconds elapsed."
