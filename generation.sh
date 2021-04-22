#!/bin/bash

#define arguments (time, folder_log, access_log, error_log);

time=$1
folder_log=$2
access_log=$3
error_log=$4

#cd build/
#
mkdir build/$folder_log
touch build/$folder_log/$access_log.txt
touch build/$folder_log/$error_log.txt
./genTick $time | python3 ./genSensorData.py | 1> $access_log.txt




#./build/test $time $accesslog $errorlog

