#!/bin/bash


# Created on: Sep 2, 2014
# Usage: ./fastqc.run.sh
# Goal: Apply fastqc to multiple FASTQ files produced in different batches or releases
# Author: Javier Quilez (GitHub: jaquol)

# General notes:
# release_id and fastq_id are extracted based on the absolute file path, so it needs to be adjusted in each case
# The script builds one script for each file, which is then sent to a parallel computing system (commented command at the end of the script). This needs to be adapted for anybody's needs


# Directories
CWD=`pwd`
PATH_DATA=$CWD/example_dataset_github
PATH_ANALYSIS=$CWD/FASTQC
mkdir -p $PATH_ANALYSIS/qu_cmd/out_mn


# Loop over FASTQ files
for file in `ls $PATH_DATA/*/*.gz`; do

	# Extract release, sample and FASTQ IDs
	release_id=`echo $file | cut -d '/' -f 9 | cut -d '.' -f 1`
	fastq_id=`echo $file | cut -d '/' -f 9 | cut -d '.' -f 2`
	
	# Output directory
	OUTDIR=$PATH_ANALYSIS/fastqc_reports/$fastq_id
	mkdir -p $OUTDIR
	
	# Job building
	# Use release_id and fastq_id as unique file identifier
	jobName=$PATH_ANALYSIS/qu_cmd/$release_id.$fastq_id.fastqc.sh
	echo '#!/bin/bash' > $jobName
	# Load fastqc in the parallele computing system in which the scritp will be run
	echo 'module load fastqc/0.10.1' >> $jobName
	jobCmd="fastqc $file --outdir $OUTDIR"
	echo $jobCmd >> $jobName

	# Submit job
	cd $PATH_ANALYSIS/qu_cmd
	chmod a+x $jobName
	#bsub -o $PATH_ANALYSIS/qu_cmd/out_mn -e $PATH_ANALYSIS/qu_cmd/out_mn -q scavenger -J fastqc.$releae_id.$fastq_id -n 1 -W 05:00 $jobName

done

