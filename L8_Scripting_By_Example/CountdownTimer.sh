#!/bin/bash
#
# This script can be used as a timer so that you can set a task time limit 

COUNTER=$1
COUNTER=$(( COUNTER * 5 ))

CountDown(){
    COUNTER=$((COUNTER -1 ))
    sleep 1
}


while [ $COUNTER -gt 0 ]
    do
        echo you still have $COUNTER seconds
        CountDown
    done


[ $COUNTER = 0 ] && echo 'out of time' && CountDown
[ $COUNTER = "-1" ] && echo your are one second late && CountDown

while true
do  
    echo you are ${COUNTER#*-} seconds late
    CountDown
done
