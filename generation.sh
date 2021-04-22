#!/bin/bash

#precompile C
gcc genTick.c -o genTick;

#define arguments (time, folder_log, access_log, error_log);


time=$1
folder_log=build/$2
access_log=$folder_log/$3.txt
error_log=$folder_log/$4.txt

#cd build/
#
rm -rf $folder_log
mkdir -p $folder_log
touch $access_log
touch $error_log
./genTick $time | python3 ./genSensorData.py | {
    while IFS= read -r line;
    do
        echo $(cut -d';' -f 1,2,4,5 <<< $line) >> $access_log
        echo $line 2>> $error_log
    done
}




#./build/test $time $accesslog $errorlog

