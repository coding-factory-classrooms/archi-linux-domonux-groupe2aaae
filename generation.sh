#!/bin/bash

#define arguments (time, access_log, error_log);

time=$1
access_log=$2
error_log=$3

#cd build/
#
./toaster $time | python3 ./genSensorData.py
./build/test $time $accesslog $errorlog

