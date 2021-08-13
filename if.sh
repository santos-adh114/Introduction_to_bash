#!/bin/bash
a=70
b=10
c=50
if [ $a -gt $c ]; then          # use -ge/-lt/-le for greater than or equals to, less than, and less than or equals to resp.
   echo "$a is greater than $c"  # We can add elif condition after it by elif [ condition ]; then ; statement
else
   echo "$a is not greater than $c" 
fi  # Any if statement (s) must be closed by fi

## If with two conditions

if [ $a -gt $c ] && [ $b -gt $c ]; then             # && indicates AND gate, use || for OR  gate 
   echo "Both of them are greater than $c"          
else
   echo "None or just one of them is greater than $c" 
fi

