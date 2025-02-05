#!/bin/bash
# Only one cpu (you can ak more if you want to make it faster)
#SBATCH --ntasks 1 
# asking time could be in minute 120 or 2:00:00  or 1-00:00:00(24H) 
#SBATCH --time 40:00:00
#SBATCH --mem 100000 #for the memory 
#SBATCH --partition zen4
# Partition (zen4 or zen16 depending of your memory requirement) 

# to debug script could be interessant to have 
set -x
# purging all module to be sure to not having interferaence with current environnement
module purge
# loading only needed module for sample
module load pangeo-meso/2024.01.22  #module python
# execute my program
jupyter-nbconvert --to notebook --ExecutePreprocessor.timeout=-1 --execute /home/lrapella/DMI-HIRHAM5_MOHC-HadGEM2-ES.ipynb
exit 0


