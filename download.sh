#!/bin/bash -ve

#SBATCH -p compute # partition (queue)
#SBATCH --export=ALL
#SBATCH -n 1

fastq-dump --split-files {SRA}
