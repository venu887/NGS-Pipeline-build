# Step-1
#Setup Libraries and install tools for NGS pipeline as a beginer
man sudo_root
# List of Items in currient folder
ls
# Change directory of going to folder to another folder
cd desktop
cd ..
cd Downloads
mkdir test
cd test
cd ../..
cd Downloads
ls
#firefox.tmp  sratoolkit.3.0.0-ubuntu64.tar.gz  test
# Download SRA_tool kit from NCBI_SRA for Linux
tar xyzf sra
sudo apt-get install sta-toolkit
[sudo] password for venu: 
Reading package lists... Done
Building dependency tree... Done
Reading state information... Done
E: Unable to locate package sta-toolkit

cd ..
sudo apt-get install sta-toolkit

cd Downloads 
ls
firefox.tmp  sratoolkit.3.0.0-ubuntu64  sratoolkit.3.0.0-ubuntu64.tar.gz  test

cd sratoolkit.3.0.0-ubuntu64 

tar -xyzf sratoolkit.3.0.0-ubuntu64.tar.gz

sratoolkit.3.0.0-ubuntu64$ ls
bin  CHANGES  example  README-blastn  README.md  README-vdb-config  schema

sratoolkit.3.0.0-ubuntu64$ cd bin

bin$ ./vdb-config -i
     SRA configuration
                                                                                                   
  [   save   ]    [   exit   ]    [ discard  ]    [ default  ]                                     
                                                                                                   
   MAIN      CACHE     AWS       GCP       NET       TOOLS                                         

bin$ ./vdb-config -i

     SRA configuration                                                                  
# bin contains all SRA fastaQ files codes for acess to NCBI
bin$ ls

bin$ cd ..

cd bin

#DOWNLOAD FASTAQ FILES FROM NCBI TO LOCAL FOLDER by using fasterq-dump
# Make sure SRA toolkit installed in download folder
Downloads$ sudo apt install sra-toolkit
[sudo] password for venu: 

Downloads$ ls
firefox.tmp  sratoolkit.3.0.0-ubuntu64  sratoolkit.3.0.0-ubuntu64.tar.gz  SRR_Acc_List.txt  test

#Extract  .gz file by using Linux command or normally

Downloads$ cd sratoolkit.3.0.0-ubuntu64
sratoolkit.3.0.0-ubuntu64$ bin

$ cd bin

## USE NCBI accession number SRR number to download 
## I have downloaded Pair end reads means Forward and reverce reads of a gene

bin$ fasterq-dump --split-files SRR15852393

Downloads$ ls
firefox.tmp                sratoolkit.3.0.0-ubuntu64.tar.gz  SRR15852393_2.fastq  test
sratoolkit.3.0.0-ubuntu64  SRR15852393_1.fastq               SRR_Acc_List.txt

sudo apt install mtools

## Download FastQC from https://www.bioinformatics.babraham.ac.uk/projects/download.html#fastqc 
fastqc_v0.11.9      sratoolkit.3.0.0-ubuntu64         SRR15852393_2.fastq
fastqc_v0.11.9.zip  sratoolkit.3.0.0-ubuntu64.tar.gz  SRR_Acc_List.txt
firefox.tmp         SRR15852393_1.fastq               test

## Extract .ZIP file and KEEP it FastQC folder in home page
venu@venu-VirtualBox:~$ ls
Desktop  Documents  Downloads  FastQC  Music  Pictures  Public  snap  Templates  Videos

$ cd FastQC
FastQC$ ls

$ ./fastqc
bash: ./fastqc: Permission denied

## NEED To install java new Version or jave in FastQC folder
$ sudo apt-get install open jdk-11-jer-headless

$ sudo apt-get install open jdk-8-jer-headless
venu@venu-VirtualBox:~/FastQC$ java -version
Command 'java' not found, but can be installed with:
sudo apt install default-jre              # version 2:1.11-72build2, or
sudo apt install openjdk-11-jre-headless  # version 11.0.15+10-0ubuntu0.22.04.1
sudo apt install openjdk-17-jre-headless  # version 17.0.3+7-0ubuntu0.22.04.1
sudo apt install openjdk-18-jre-headless  # version 18~36ea-1
sudo apt install openjdk-8-jre-headless   # version 8u312-b07-0ubuntu1

venu@venu-VirtualBox:~$ jave -version 
Command 'jave' not found, did you mean:
  command 'save' from deb atfs (1.4pl6-15)
  command 'jaxe' from deb jaxe (3.5-13)
  command 'jive' from deb filters (2.55-3build1)
  command 'dave' from deb libhttp-dav-perl (0.49-2)
  command 'javr' from deb xc3sprog (0+svn795+dfsg-4)
  command 'jake' from deb node-jake (0.7.9-2)
  command 'jove' from deb jove (4.17.3.6-2)
  command 'java' from deb default-jre (2:1.11-72build2)
  command 'java' from deb openjdk-11-jre-headless (11.0.15+10-0ubuntu0.22.04.1)
  command 'java' from deb openjdk-17-jre-headless (17.0.3+7-0ubuntu0.22.04.1)
  command 'java' from deb openjdk-18-jre-headless (18~36ea-1)
  command 'java' from deb openjdk-8-jre-headless (8u312-b07-0ubuntu1)
Try: sudo apt install <deb name>

FastQC$ fastqc --help
FastQC$ chmod a+x *astqc*

## It will open GUI Environment of FastQC 
FastQC$ ./fastqc
FastQC$ chmod 755 fastqc

#NGS- Script 
# Conversion of Fastaq files to FastaQC
Downloads/SRA_fastaq files$ fastqc SRR15852393_1.fastq -o

fastqc SRR15852393_2.fastq [-o SRA_fastaq files]
Skipping '[-o' which didn't exist, or couldn't be read
Skipping 'SRA_fastaq' which didn't exist, or couldn't be read
Skipping 'files]' which didn't exist, or couldn't be readfastqc 

## From above Open folder and you will find two files
#. .zip file and .html file of all analysis results.

# To run two fastq files at a time.
fastqc SRR15852393_1.fastq  SRR15852393_2.fastq -o
# we will get two .html and .gz files at a time

#1. Further Processiong the sequence reads we can install package called 
# ea-utils/ There are many methods for processing 
sudo apt install ea-utils

# run fastaq files for processing
fastq-mcf 
fastq-mcf -q 10 n/a SRR15852393_1.fastq -o SRR_1.fastq

# you can see new file will saved in our folder with name SRR_1.fastq
#  Go to FastQC folder and oprn it by running this command
 ./fastqc
 open GUI and open file to verify old sequence and new one to compare
 
#2. Using TRIMMOMATIC for processing
#install TRIMMOMATIC new version and run script for pair end or single end analysis
# change directory to fastaq files folder then use this command
java -jar ~/Trimmomatic-0.39/trimmomatic-0.39.jar SE -threads 4 -phred33 SRR15852393_1.fastq SRR_1_fastq.demo TRAILING:10 
# there i can see my new SRR file and then open it in FastQC GUI

ls
# to eloborate what exactly in folder
ls -shl *



#3. Allignment wirh HISAT2 tool from GRCH 38
# HISAT2 proved that very fast than compared wirh STAR 
# install and run python code provided by HISAT2 
# Sudo apt-get update 
# Sudo apt-get install hisat2
# get the genome indices alignmenr wirh human genome
# wget https://genome-idx.s3.amazonaws.com/hisat/grch38_genome.tar.gz
# Or  DOWNLOD ditectly http://daehwankimlab.github.io/hisat2/download/#version-hisat2-221https://ccb.jhu.edu/software/hisat2/manual.shtml#getting-started-with-hisat2
# Extract files and keep it in folder "hisat" in that sub folder called genome has around 8 files

# we can run 
hisat2 -q --rna-strandness R -x hisat2/grch38/genome -U data/SRR1_Trim.fastq | samtools sort -o hisat2/SRR1_trimmed.bam
echo "HISAT2 finished running!"

# Go and look for bam files
cd hisat2
samtiools view -h SRR1_trimmed.bam |  less


#4. Creating the FeatureCounts from .bam files
# for this we need to install a tool called SUBREAD
sudo apt-get update
mkdir quants at NGS_pipeline
sudo apt-get install subread
# Then download gene count file from ENSEMBAL/human38/.gtf files (always check for new version)
# wget http://ftp.ensembl.org/pub/release-106/gtf/homo_sapiens/Homo_sapiens.GRCh38.107.gtf.gz

featureCounts -S 2 -a hg38/Homo_sapiens.GRCh38.107.gtf.gz -o quants/SRR1_featurecounts.txt hisat2/SRR1_trimmed.bam
echo "featureCounts finished running!"

# There are two files showed up in quants folder
SRR1_featurecounts.txt  SRR1_featurecounts.txt.summary

cat SRR1_featurecounts.txt.summary
Status    hisat2/SRR1_trimmed.bam
Assigned  115232
Unassigned_Unmapped 3235060
Unassigned_Read_Type     0
Unassigned_Singleton     0
Unassigned_MappingQuality     0
Unassigned_Chimera  0
Unassigned_FragmentLength     0
Unassigned_Duplicate     0
Unassigned_MultiMapping  2024109
Unassigned_Secondary     0
Unassigned_NonSplit 0
Unassigned_NoFeatures    323315
Unassigned_Overlapping_Length 0
Unassigned_Ambiguity     23427

# Look at SRR1_featurecounts.txt 
cat SRR1_featurecounts.txt |less
Geneid  Chr     Start   End     Strand  Length  hisat2/SRR1_trimmed.bam

cat SRR1_featurecounts.txt |cut -f1,7 | less

# you can see raw counts for each gene obtain from single fastq file. 

