#!/bin/bash
#SBATCH --partition=normal
#SBATCH --ntasks=1
#SBATCH --mem=31240
#SBATCH --output=BWAalignment_SAMPLE_%J_stdout.txt
#SBATCH --error=BWAalignment_SAMPLE_%J_stderr.txt
#SBATCH --time=05:00:00
#SBATCH --job-name=BWAalignment_SAMPLE
#SBATCH --mail-user=matthew.wersebe@ou.edu
#SBATCH --mail-type=ALL
#SBATCH --chdir=/work/mwerseb1/Lane_8/Cleaned

##############################################
 
module load BWA/0.7.17-foss-2018b
module load SAMtools/1.10-GCC-8.3.0

#Align paired reads
bwa mem -M -t 4 /work/mwerseb1/Assembly/Pulicaria_13B_purged SAMPLE.fq.gz|samtools sort -@ 2 -T SAMPLE|samtools markdup -@ 2 - -|samtools addreplacerg -r'ID:SAMPLE' -r'SM:SAMPLE' - -o SAMPLE_lane8.bam

