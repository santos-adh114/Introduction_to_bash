#!/bin/sh

## Here I will discuss how to slice a string. This looks trivial but it can be applied to rename files and folders
## Follwing command to delete all files from directories without any permission issues.
rm -r -f <directory_path> (order of -r -f does not matter. We can use rm -f -r <directory_path> as well)
## Following command looks for file named "file_name" and deletes if from all directories and sub-directories
find . -name "file_name" -delete

FINDING A FILE

# following command finds all the files inside the given directory and its subdirectories for file 
#with extension .sh and stores the list in a data file list.txt

   find . -type f -name '*.sh'>list.txt  # use >> for append mode. Especially useful during looping 


# The following loop could be used to access the contents of these files once we have the list

    cat list.txt | while read line
      do
      echo $line # displays path of the file
      cat $line  # opens the content of the file
      echo
    done

In the repo there is a file called "find_replace.sh". This code searches for a file of given name 
in the given directory and writes to a file for complete path of occurance of each file. Once
the file is written, it then reads each line of the file and searches for an pharase to find and 
replace. Finally, it deletes the file where the path were written 
(uncommenting this line would keep the file)

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

## searching for a expression or phrase in the file and replacing it
IN MacOs
brew install gnu-sed
gsed -i 's/santosh/san/gI' hello.txt (Assuming the file hello.txt has a phrase santosh. 
All the phrases in the file hello.txt that contain santosh will be replaced by san)

In Linux:
sed -i "/santosh/c san" hello.txt
or
sed -i "/s/santosh/san/g" hello.txt
