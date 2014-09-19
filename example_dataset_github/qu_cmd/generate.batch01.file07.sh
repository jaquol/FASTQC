#!/bin/bash
module load seqtk/1.0-r45

seqtk sample -s100 /sc/orga/projects/sharpa01a/HapMap_RNASeq/QC_S90/Sample_HG00615/HG00615_GTCCGC_L005_R1_001.C54URACXX.fastq.gz 100 | gzip -c > /hpc/users/quilej01/HapMap_RNASeq/example_dataset_github/batch01/batch01.file07.gz