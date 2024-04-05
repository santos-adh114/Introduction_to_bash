filename="trial.txt" ! modify the name of file. It could be set as a complete path too. eg. "/project/.../trial.txt" 
find $dir_name$ -name $search_file$>$filename ! $dir_name$="/project/wen/sadhik22/expt_graphene/", $search_file$ ='job.sh'
! For example: find /project/wen/sadhik22/expt_graphene/ -name 'job.sh'>$filename
while IFS= read -r line; do
    echo $line
    sed -i 's/mem=100GB/mem=60GB/g' $line  ! general syntax is sed -i 's/$search_phrase$/$replace_phrase$/g'
done < "$filename"
rm $filename ! uncomment or deleting this line would retain the .txt file created above
