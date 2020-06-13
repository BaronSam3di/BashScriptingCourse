#!/bin/bash
#

INTERVAL=$1
while true $INTERVAL
do
    VALUE=$(ps -eo pcpu,pid -o comm= | sort -k1 -n -r | head -1)
    
    USAGE=$(echo $VALUE | awk '{ print $1}')
    USAGE1=${USAGE%.*}
    PID1=$(echo $VALUE | awk '{ print $2}')
    PNAME1=$(echo $VALUE | awk '{ print $3}')
    
#####
# Debugging information 

echo USAGE1 is set to $USAGE1
echo PID1 is set to $PID1
echo PNAME1 is set to $PNAME1
# read

    if [ $USAGE -gt 80 ]
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