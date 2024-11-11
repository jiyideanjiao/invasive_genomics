#!/bin/bash -ve
#SBATCH -p compute # partition (queue)
#SBATCH --export=ALL
#SBATCH -n 20

spades.py --rna --pe1-1 left_trimmed.fq --pe1-2 right_trimmed.fq -t 20 -o output_genome