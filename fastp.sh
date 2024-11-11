#!/bin/bash -ve

#SBATCH -p compute # partition (queue)
#SBATCH --export=ALL
#SBATCH -n 1

fastp -i left.fq -o left_trimmed.fq -I right.fq -O right_trimmed.fq
