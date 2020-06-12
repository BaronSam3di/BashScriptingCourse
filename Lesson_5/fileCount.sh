#!/bin/bash
#
#script that counts files 
echo which directory do you want to count?
read DIR
cd $DIR
COUNTER=0

for i in *
do 
	COUNTER=$((COUNTER+1))
	echo I have counted $COUNTER files in this directory
done

