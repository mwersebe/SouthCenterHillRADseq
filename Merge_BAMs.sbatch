#!/bin/bash
#SBATCH --partition=normal
#SBATCH --ntasks=1
#SBATCH --mem=31240
#SBATCH --output=MergeBAMs_SAMPLE_%J_stdout.txt
#SBATCH --error=MergeBAMs_SAMPLE_%J_stderr.txt
#SBATCH --time=00:30:00
#SBATCH --job-name=MergeBAMs_SAMPLE
#SBATCH --mail-user=matthew.wersebe@ou.edu
#SBATCH --mail-type=ALL
#SBATCH --chdir=/work/mwerseb1/Lane_8/Cleaned/Final_BAMs


########################################################
hostname

module load BamTools/2.5.1-GCC-8.3.0 

bamtools merge -in /work/mwerseb1/Lane_8/Cleaned/SAMPLE_lane8.bam \
-in /work/mwerseb1/Lane_8B/Practice/SAMPLE_lane8B.bam \
-out /work/mwerseb1/Lane_8/Cleaned/Final_BAMs/SAMPLE.bam


