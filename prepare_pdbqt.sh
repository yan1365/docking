#!/bin/bash
 for f in $(find ~+ -name "*.sdf"); 

 do
 i=$(dirname ${f})/pdbqt
 j=$(basename ${f})

  obabel -isdf ${f} -opdbqt  -O ${i}/${j%sdf}pdbqt -m -h 
  done
  
  for m in $(find ~+ -name "*.mol2"); 

 do
 n=$(dirname ${m})/pdbqt
 p=$(basename ${m})
echo ${n}/${p%mol2}pdbqt
  obabel -imol2 ${m} -opdbqt  -O ${n}/${p%mol2}pdbqt -m -h 
  done 