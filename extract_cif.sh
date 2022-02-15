#!/bin/sh
cd new_cif_files
for files in *
do
	a=$(grep _cell_length_a $files | awk -F'(' '{print $1}'| awk -F' ' '{print $2}')
	b=$(grep _cell_length_b $files | awk -F'(' '{print $1}'| awk -F' ' '{print $2}')
	c=$(grep _cell_length_c $files | awk -F'(' '{print $1}'| awk -F' ' '{print $2}')
	alpha=$(grep _cell_angle_alpha $files | awk -F'(' '{print $1}'| awk -F' ' '{print $2}')
	beta=$(grep _cell_angle_beta $files | awk -F'(' '{print $1}'| awk -F' ' '{print $2}')
	gamma=$(grep _cell_angle_gamma $files | awk -F'(' '{print $1}'| awk -F' ' '{print $2}')
	vol=$(grep _cell_volume $files | awk -F'(' '{print $1}'| awk -F' ' '{print $2}')
	moeity=$(grep _chemical_formula_moiety $files | awk -F"'" '{print $2}')
	echo -e $files'\t'$moeity'\t'$a'\t'$b'\t'$c'\t'$alpha'\t'$beta'\t'$gamma'\t'$vol
	
done	

cd ..
