#!/bin/bash
#
#SBATCH --partition=normal
#SBATCH --ntasks=1
#SBATCH --mem=32000
#SBATCH --output=ProcessRADtag_%J_stdout.txt
#SBATCH --error=ProcessRADtag_%J_stderr.txt
#SBATCH --time=02:00:00
#SBATCH --job-name=ProcessRADtaqLANE8
#SBATCH --mail-user=matthew.wersebe@ou.edu
#SBATCH --mail-type=ALL
#SBATCH --chdir=/work/mwerseb1/Lane_8B
#
#################################################
hostname

module load Stacks/2.41-foss-2018b

process_radtags -p /work/mwerseb1/Lane_8 -o /work/mwerseb1/Lane_8/Cleaned -b /work/mwerseb1/Lane_8/barcodes_names.txt --clean --quality -E phred33 -r --disable_rad_check --index_null --adapter_1 CTGTCTCTTATACAC
