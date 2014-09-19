#!/bin/bash
module load seqtk/1.0-r45

seqtk sample -s100 /sc/orga/projects/sharpa01a/HapMap_RNASeq/QC_C178/Sample_NA18925/NA18925_CTTGTA_L002_R1_001.C54NHACXX.fastq.gz 100 | gzip -c > /hpc/users/quilej01/HapMap_RNASeq/example_dataset_github/batch05/batch05.file06.gz
