#!/bin/bash
#SBATCH --account=PAS1855
#SBATCH --time=140:00:00
#SBATCH --output=slurm-vina-%j.out
#SBATCH --cpus-per-task=40
#SBATCH --mail-type=ALL
set  -u -o pipefail
#$1 equals the recepor full path, $2 equals ligand library
#when could not open file for reading, check config files

echo "receptor full path is: $1"
ligandpath=$(find ~+ -name ${2})/pdbqt
echo "ligand full path is: ${ligandpath}" 
configpath=${1%".pdbqt"}_OSC-config.txt
outputdir=/fs/ess/PAS1855/users/yan1365/docking/results/$(basename $1|xargs  basename -s ".pdbqt")-$2
cd /fs/ess/PAS1855/users/yan1365/docking/results/
mkdir ${outputdir}
echo "output dir is: ${outputdir}"
cd ${ligandpath}
echo "change dir to $(pwd)"
for f in *.pdbqt; do
echo "ligand in progress is: ${f}"
i=${f%".pdbqt"}_out.pdbqt
if [ -e ${outputdir}/${i} ]; then
    echo "${i} exists."
    else
timeout 60m vina --config ${configpath} --ligand ${f} --out ${outputdir}/${i}
fi
echo "${f} docking finished"
done
 
touch result_summary.txt
echo "receptor full path is: $1">result_summary.txt
echo "ligand full path is: ${ligandpath}">>result_summary.txt
echo "config full path is: ${configpath}">>result_summary.txt







