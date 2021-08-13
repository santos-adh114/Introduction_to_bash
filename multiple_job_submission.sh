#!/bin/bash
for x in 1 2 3 4 5 6   # do not use comma to separate, use space 
do                     # any for loop should be followed by do. After you write all statements, finally write done to close the loop.
mkdir $x               # Creates a folder named 1, 2, 3, and so on starting first with folder 1
cd $x                  # Gets inside the folder just created in the step before.

# The following create a file called INCAR in the above folder and writes everything written between two ! sign 
cat >INCAR<<!           
SYSTEM= H2_atom
ISTART=0
ENCUT=650
ISMEAR=1
SIGMA=0.1
NPAR=4
LMAXMIX=4  #NEEDED FOR PAW
GGA=PE
PREC=Accurate
IBRION=-1
NSW=0
POTIM=0.3
!

#Same as above to create a file named KPOINTS
cat >KPOINTS<<!
kpoints
0
G
4    4    1
0.    0.    0.
!
#Same as above to create POSCAR
cat >POSCAR<<!
H2-atom
1.0
20.0    0.0    0.0
0.0    20.0    0.0
0.0    0.0    20.0
H
2
Cartesian
0.0    0.0    0.0
0.0    0.0    $x
!

### executable here ##  Please use:  sbatch job_script_file ## You may need assistance at this step depending on what you are using

cd ..  # This step is important. You should always know the path you submitted your job if you are especially using for commands
done

