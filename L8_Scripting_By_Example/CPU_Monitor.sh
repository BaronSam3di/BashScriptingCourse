#!/bin/bash
#

INTERVAL=$1
while true $INTERVAL
do
    sleep 3
    USAGE=`ps -eo pcpu,pid -o comm= | sort -k1 -n -r | head -1 | awk '{ print $1}'`
    USAGE=${USAGE%.*}
    PID=`ps -eo pcpu,pid -o comm= | sort -k1 -n -r | head -1 | awk '{ print $2}'`
    PNAME=`ps -eo pcpu,pid -o comm= | sort -k1 -n -r | head -1 | awk '{ print $3}'`
    if [$USAGE -gt 80]
    then
        USAGE1=$USAGE
        PID1=$PID
        PNAME=$PNAME
        sleep 7
        USAGE2=`ps -eo pcpu,pid -o comm= | sort -k1 -n -r | head -1 | awk '{ print $1}'`
        USAG2E=${USAGE%.*}
        PID2=`ps -eo pcpu,pid -o comm= | sort -k1 -n -r | head -1 | awk '{ print $2}'`
        PNAME2=`ps -eo pcpu,pid -o comm= | sort -k1 -n -r | head -1 | awk '{ print $3}'`
        [ $USAGE2 -gt 80] && [$PID1 = $PID2] && \
            mail -s 'CPU load of $PNAME is above *)%' root@blah.com < .
    fi
        
   
done