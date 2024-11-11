# Codes for the Analysis of Invasive Spider Genomics

In this repository you find codes used in the study - Genomic convergence fuels recent rapid adaptation in invasive spiders.

## Requirements

### General

- Unix-like environment
- python3 (>= 3.9.0)
- R (>= 4.3.0)

### Bioinformatics tools
- [NCBI Datasets command line tools](https://www.ncbi.nlm.nih.gov/datasets/docs/v2/download-and-install/)
- [fastp](https://github.com/OpenGene/fastp)
- [rnaSPAdes](https://github.com/ablab/spades)
- [Transdecoder](https://github.com/TransDecoder/TransDecoder)
- [BUSCO](https://busco.ezlab.org/)
- [orthofinder](https://github.com/davidemms/OrthoFinder)
- [mafft](https://mafft.cbrc.jp/alignment/software/)
- [trimAl](http://trimal.cgenomics.org/)
- [iqtree2](http://www.iqtree.org/)
- [r8s](https://naturalis.github.io/mebioda/doc/week1/w1d5/r8s1.7.manual.pdf)
- [DIAMOND](https://github.com/bbuchfink/diamond)
- [RERconverge](https://github.com/nclark-lab/RERconverge)
- [phangorn](https://cran.r-project.org/web/packages/phangorn/index.html)
- [phytools](https://cran.r-project.org/web/packages/phytools/index.html)
- [PAL2NAL](https://www.bork.embl.de/pal2nal/)
- [hyphy](https://github.com/veg/hyphy)

## Pipeline

```sh
#download omics data
sbatch download.sh

#quality control and trimming
sbatch fastp.sh

#tranascriptome assembly
sbatch rnaSPAdes.sh

#gene model prediction
sbatch transdecoder.sh 

#BUSCO assessment for assembly completeness
sbatch busco.sh 

#Ortholog identification
sbatch orthofinder.sh 

#orthologous protein alignment
snakemake --cores=1000 -s snakefile_mafft

#trimming alignment gaps
snakemake --cores=1000 -s snakefile_trimal

#construct phylogenetic tree
sbatch iqtree.sh 

#estimate divergence time
r8s -b -f r8s.ctl

#trimmed gene tree
snakemake --cores=1000 -s snakefile_trimgenetree

#estimate branch length for trimmed gene tree
Rscript estimate_branch_length.R

#estimate relative evolutionary rate (RER)
Rscript estimate_rer.Rscript

#prepare codon alignment
snakemake --cores=1000 -s snakefile_pal2nal

#identify genes under relaxation
snakemake --cores=1000 -s snakefile_relax

#identify genes under positive selection
snakemake --cores=1000 -s snakefile_bustedph

```
