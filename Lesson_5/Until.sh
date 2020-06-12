#!/bin/bash
#
echo '

WHILE is used to execute commands as long as a condition is a TRUE

UNTIL is used to execute command as long as a condition is FALSE

The structure of their use is... 

whiile|until command
do
	command
done
'
COUNTER=0
while true
do 
	sleep 1
	COUNTER=$((COUNTER + 1))
	echo $COUNTER seconds have passed since starting this script
done
