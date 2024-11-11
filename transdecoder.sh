#!/bin/bash -ve

#SBATCH -p compute # partition (queue)
#SBATCH --export=ALL
#SBATCH -n 1

TransDecoder.LongOrfs -t hard_filtered_transcripts.fasta
TransDecoder.Predict -t hard_filtered_transcripts.fasta