#!/bin/bash 
set -x 
set -e

PID=`ps -eo pid,etime,cmd | grep " ./app/parse_.*py" | grep -v grep | awk '{print $1}'`
START_TIME=`ps -eo pid,etime,cmd | grep " ./app/parse_.*py" | grep -v grep | awk '{print $2}' | awk -F ':' '{print $1}'`

#echo $PID
#echo $START_TIME

#START_TIME='12'
#echo $START_TIME | awk -F ':' '{print $1}'
if [[ "$START_TIME" -ge 10 ]]
then
	echo $PID
	echo $START_TIME
	echo $START_TIME | awk -F ':' '{print $1}'
	echo "Killing $START_TIME $PID"
	kill $PID
fi

