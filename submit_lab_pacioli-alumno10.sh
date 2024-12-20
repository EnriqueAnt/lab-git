#!/bin/bash

#SBATCH -p hpc-bio-pacioli
#SBATCH --chdir=/home/alumno10/labgit/lab-git/
#SBATCH -J file-cut
#SBATCH --cpus-per-task=1
#SBATCH --ntasks=4
#SBATCH --mail-type=END
#SBATCH --mail-user=enriqueantonio.hernandezs@um.es
#SBATCH --output=file-cut-output-%j.out

# Definir el directorio de entrada y los archivos a procesar
input_folder="/home/alumno10/labgit/lab-git/fastqc"
files=($input_folder/*.fastq)

# Lanzar las tareas para cada archivo en paralelo
for i in "${!files[@]}"; do
  srun -n 1 bash /home/alumno10/labgit/lab-git/file-cut.sh "${files[$i]}" &
done

wait

