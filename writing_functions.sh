#!/bin/bash

# The following function takes absolute value of the given arguments
abs() { local e=$( echo ${1} | tr -d -); echo $e; } 

# The following four functions add, subtract, multiply and divide the arguments. Note the order of arguments is important!!
add() { local sum=$(awk "BEGIN {print ${1} + ${2}; exit}"); echo $sum; }
subtract() { local sum=$(awk "BEGIN {print ${1} - ${2}; exit}"); echo $sum; }
multiply() { local sum=$(awk "BEGIN {print ${1} * ${2}; exit}"); echo $sum; }
divide() { local sum=$(awk "BEGIN {print ${1} / ${2}; exit}"); echo $sum; }


f1=23.4
f2=-23.0

abs1=$(abs $f1)
abs2=$(abs $f2)
e1=$(add $f1 $f2)
e2=$(subtract $f1 $f2)
e3=$(multiply $f1 $f2)
e4=$(divide $f1 $f2)

echo "Inputs: $f1 and $f2"
echo "sum : $e1"
echo "diff : $e2"
echo "product : $e3"
echo "ratio : $e4"
