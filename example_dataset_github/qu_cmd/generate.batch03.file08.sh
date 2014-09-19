#!/bin/bash
module load seqtk/1.0-r45

seqtk sample -s100 /sc/orga/projects/sharpa01a/HapMap_RNASeq/QC_S90/Sample_NA18500/NA18500_GTCCGC_L001_R1_001.C54URACXX.fastq.gz 100 | gzip -c > /hpc/users/quilej01/HapMap_RNASeq/example_dataset_github/batch03/batch03.file08.gz
