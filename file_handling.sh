#!/bin/sh

## Here I will discuss how to slice a string. This looks trivial but it can be applied to rename files and folders

# following command finds all the files inside the given directory and its subdirectories for file with extension .sh and stores
# the list in a data file list.txt

   find . -type f -name '*.sh'>list.txt  # use >> for append mode. Especially useful during looping 


# The following loop could be used to access the contents of these files once we have the list

    cat list.txt | while read line
      do
      echo $line # displays path of the file
      cat $line  # opens the content of the file
      echo
    done


# Following script looks for a particular file called 'lobsterout' in the folder. If it doesn't see that file then the
# code executes certain functions. This can be helpful in future experience.
cd pbe_output
for folder in *
do
cd $folder/lobster
FILE='lobsterout'
if [ -f "$FILE" ]; then
    echo "$FILE exists."
else
    echo "$FILE does not exist."
    cp ../../../lobster.sh .
    sbatch lobster.sh
fi
cd ../..
done
cd ..

## for setting permissions
chmod -R 777 $folder_name  # (sets permission for access to all edits in the given folder name)
