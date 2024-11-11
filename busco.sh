#!/bin/bash -ve

#SBATCH -p compute # partition (queue)
#SBATCH --export=ALL
#SBATCH -n 40

busco -i {protein} \
      -o busco_output \
      -l arachnida_odb10 \
      -m prot \
      -c 40
