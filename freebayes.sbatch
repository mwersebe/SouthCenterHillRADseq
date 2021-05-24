#!/bin/bash
#SBATCH --partition=normal
#SBATCH --ntasks=1
#SBATCH --mem=31240
#SBATCH --output=freebayes_%J_stdout.txt
#SBATCH --error=freebayes_%J_stderr.txt
#SBATCH --time=48:00:00
#SBATCH --job-name=freebayes_calling_Resurrection-RAD
#SBATCH --mail-user=matthew.wersebe@ou.edu
#SBATCH --mail-type=ALL
#SBATCH --chdir=/work/mwerseb1/Lane_8/Cleaned/Final_BAMs/
###########################################################
hostname

module load HTSlib/1.10.2-GCC-8.3.0

/home/mwerseb1/freebayes/bin/freebayes -f /work/mwerseb1/Assembly/SC_F1-1A_hap13B_scaffold_LOD26_purged.fa -L /work/mwerseb1/Lane_8/Cleaned/Final_BAMs/bam.list --populations /work/mwerseb1/Lane_8/Cleaned/Final_BAMs/pop.map |bgzip > SC_RAD.vcf.gz 

tabix -p vcf SC_RAD.vcf.gz
