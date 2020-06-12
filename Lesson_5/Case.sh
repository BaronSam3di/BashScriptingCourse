#!/bin/bash
# Simple script to explain the use of Case
VAR=$1
case $VAR in
yes)		# This is the first case of YES. Each case ends with a closeing bracket. No opening bracket is needed. Wierd I know 
		echo ok;;
no|nee)
	echo too bad;;
*)		# this is the default (for all other inputs) 
	echo try again;;
esac
		
