#!/bin/bash
#supervison.sh
#define arguments (time, folder_log, access_log, error_log, max_memory);
user=$(whoami)
time=$1
folder_log=~/$2
echo $folder_log
access_log=$folder_log/$3.txt
error_log=$folder_log/$4.txt
max_memory=$5

#create a directory for the archive and get the size of the log's files

if ([ -d $folder_log ])
then
    if (pidof -x "./generation.sh" >/dev/null;)
    then
        echo "Directory $folder_log exists."
        outSize=$(find $access_log -printf "%s")
        errSize=$(find $error_log -printf "%s")
#display the size of the files
        
        echo "$access_log size is $outSize bytes."
        echo "$error_log size is $errSize bytes."
        

#date formatting

        now=$(date +"%Y-%m-%d %H:%M:%S")

#check memory size

        if [[ $outSize -gt $max_memory ]] || [[ $errSize -gt $max_memory ]]
        then # killing processes
            for p in $(pgrep -u $user generation.sh); do kill $p; done

            if [[ $outSize -gt $max_memory ]] && [[ $errSize -gt $max_memory ]]
            then # archive log's files
                echo "Both files size are bigger than the max allocated !"
                $(cd $folder_log && ls -l)
                echo $(cd $folder_log && tar -czvf "./$now.tar.gz" "$3.txt" "$4.txt")
            elif [[ $outSize -gt $max_memory ]]
            then
                echo "The $access_log size is bigger than the max allocated !"
                echo $(cd $folder_log && tar -czvf "./$now.tar.gz" "$3.txt")
            elif [[ $errSize -gt $max_memory ]]
            then
                echo "The $error_log size is bigger than the max allocated !"
                echo $(cd $folder_log && tar -czvf "./$now.tar.gz" "$4.txt")
            fi
        fi
    else
        echo "generation.sh is not running"
    fi
else
    echo "Directory $folder_log does not exists."
fi
