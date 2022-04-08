#!/bin/bash -l
#SBATCH -A uppmax2022-2-5
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 4
#SBATCH -t 00:10:00
#SBATCH -J Trimmomatic
#SBATCH --mail-user shuai.shao.5274@student.uu.se
#SBATCH --mail-type=END,FAIL
#SBATCH --qos=short

module load bioinfo-tools trimmomatic

rm -r ~/genome_analysis/durpi/results/trimmomatic/
cd $SNIC_TMP
rm -r ./*
cp ~/genome_analysis/durpi/data/transcriptome/untrimmed/SRR6040095_scaffold_11.* $SNIC_TMP/
mkdir trimmomatic
trimmomatic PE -threads 4 -summary summary.txt \
SRR6040095_scaffold_11.1.fastq.gz SRR6040095_scaffold_11.1.fastq.gz -baseout trimmomatic/SRR6040095_scaffold_11.fastq.gz \
ILLUMINACLIP:/sw/bioinfo/trimmomatic/0.39/snowy/adapters/TruSeq3-PE.fa:2:30:10 LEADING:3 TRAILING:3 SLIDINGWINDOW:4:15 MINLEN:36 \
&& cp -r trimmomatic/  ~/genome_analysis/durpi/results/assembly/trimmomatic/
cd ~/genome_analysis/durpi/scripts
