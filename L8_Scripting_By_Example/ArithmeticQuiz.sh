#!/bin/bash
#
# This script is a Arithmetic game that will tell you if you get it wrong or right, and store he results in a file

logfile="$HOME/.fcalc-game-log"

date >> $logfile

while true ; do
    
        if [ "$(expr $RANDOM % 100 )" -lt "70" ]; then
            FirstNumber=`expr $(expr $RANDOM % 4) + 6`
        else
            FirstNumber=`expr $RANDOM % 5`
        fi
        
        SecondNumber=`expr $RANDOM % 10`
        rep=`expr $SecondNumber \* $FirstNumber`
        
        urep="-1"
        
        while [ "$urep" -ne "$rep" ]; do 
            read -p " $SecondNumber * $FirstNumber = ?" urep
            
            if [ "$urep" -ne "$rep" ]; then
                echo " $SecondNumber * $FirstNumber = ?: $rep: WRONG" >> $logfile
                echo Buzzzzzz
                
            else  
                echo " $SecondNumber * $FirstNumber = ?: $rep: CORRECT! " >> $logfile
            fi
            
        done
    done