#!/bin/bash

#define arguments (time, access_log, error_log);

time=$1
access_log=$2
error_log=$3

cd build/
./test $time $accesslog $errorlog

