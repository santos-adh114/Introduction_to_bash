#!/bin/sh

## Here I will discuss how to slice a string. This looks trivial but it can be applied to rename files and folders

# Use the following commands if there is a well defined separator (.,:,$,@, etc.) to slice the index

str='santosh@adhikari@lives.in_columbia@sc'
# str='ISIF = 3'

#the following command slices string wrt '.' and prints the first column : expected output: 'santosh@adhikari@lives'

b=$(echo $str | awk -F. '{print $1}') # This takes b as string. Generally recommended for file handling.
b=$(echo $str | awk -F= '{print $2}') # displays '3'
echo $b

# following command first slices from left wrt '@' and return the third column i.e. 'lives.in_columbia' . Remember second column
# then the second is 'adhikari' and the fourth column is 'sc'. Second part of the command slices again wrt '_' and returns the 
# resulting second column. Hence final output is 'columbia'

echo $str | awk -F@ '{print $3}' | awk -F_ '{print $2}'

# You can also use cut command for slicing
# Following cuts everything and just returns 1st column of string separated by '.' In this case santosh@adhikari@lives

echo $str | cut -d. -f1


# Next we try to slice a column from the line (in principle a column from a data file)
# Following command searches for string 'following' in the file string_slices.sh followed by returning the topmost line followe
# by returning the fifth column of that line

grep_line=$(grep 'following' string_slicing.sh | head -1 | awk '{print $5}') # we expect output to be 'commands'
echo $grep_line

# These information can be useful in further handling algebras.

# To follow up: Practical example. If you are working on a cluster and you accidentally submitted jobs that were not supposed to be

# The following command takes the list of queued jobs of username santosha. Assuming column 1 to be jobid, the awk command stores all
# those job id in a datafile called subjob.txt . I will comment out the following as it shows error here. This command is appropriate
# for when you are working in the cluster.

squeue | grep santosha | awk '{print $1}'>subjob.txt

# The following command reads each line of the txt file and deletes each of the job. Before doing it please check the file subjob.txt

cat subjob.txt | while read line
do
   scancel/del $line # check for the delete job command in your cluster. Most common is scancel or del
   scontrol update jobid=$line partition=defq-48core # use this command to change the queue
done

# If you are working on hyperion cluster and want to avoid some nodes try the following in your job submission file

 SBATCH --exclude=nodes [246, 249-253]

or

  SBATCH --exclude=[246, 249-253] # Probably this one works. check before you do!!

### Some important shortcuts

   cat $file | wc -l # returns the number of lines in the file $file
   

   ls | wc -l  # returns number of files and sub-directories in the given directory
  

   ls -d */ | wc -l  # returns number of subdirectories present in the given directory


