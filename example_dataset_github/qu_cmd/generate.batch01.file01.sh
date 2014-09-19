#!/bin/bash
module load seqtk/1.0-r45

seqtk sample -s100 /sc/orga/projects/sharpa01a/HapMap_RNASeq/QC_C179/Sample_HG00526/HG00526_GTGAAA_L004_R1_001.C51TWACXX.fastq.gz 100 | gzip -c > /hpc/users/quilej01/HapMap_RNASeq/example_dataset_github/batch01/batch01.file01.gz
