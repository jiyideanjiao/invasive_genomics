#!/bin/bash -ve

#SBATCH -p compute # partition (queue)
#SBATCH --export=ALL
#SBATCH -n 100

iqtree -s supergene.phy -m MFP -b 100 -nt 100