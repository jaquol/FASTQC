#!/bin/bash
module load seqtk/1.0-r45

seqtk sample -s100 /sc/orga/projects/sharpa01a/HapMap_RNASeq/QC_C178/Sample_NA12878/NA12878_CAGATC_L001_R1_001.C54NHACXX.fastq.gz 100 | gzip -c > /hpc/users/quilej01/HapMap_RNASeq/example_dataset_github/batch04/batch04.file02.gz
