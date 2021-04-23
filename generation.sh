#!/bin/bash

#precompile C
gcc genTick.c -o genTick;

#define arguments (time, folder_log, access_log, error_log);

time=$1
user=$(whoami)
folder_log=~/$2

echo $folder_log
access_log=$folder_log/$3.txt
error_log=$folder_log/$4.txt



#create log's files and directory 




mkdir -p $folder_log
touch $access_log
touch $error_log


./genTick $time | python3 ./genSensorData.py 2>&1 |	{
# redirectory error and nominal

./genTick $time | python3 ./genSensorData.py | {

    echo "I am $user $(id -u $user)"
    while IFS= read -r line;
    do
        echo $(cut -d';' -f 1,2,4,5 <<< $line) >> $access_log
        echo $line 2>> $error_log
    done
}




#./build/test $time $accesslog $errorlog

