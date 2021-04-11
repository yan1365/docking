#!/bin/bash
echo "receptor full path is: $1"
echo "ligand full path is: $2"
echo "config full path is: $3"
echo "output dir is(without/): $4"

cd $2
for f in *.pdbqt
do
i=${f%".pdbqt"} 
vina --config $3 --ligand ${f} --out $4${i}_out.pdbqt
done
 
touch result_summary.txt
echo "receptor full path is: $1">result_summary.txt
echo "ligand full path is: $2">>result_summary.txt
echo "config full path is: $3">>result_summary.txt







