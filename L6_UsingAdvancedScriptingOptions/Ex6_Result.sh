#!/bin/bash
#
while true ; do
    trap " echo NOPE" INT
    pingHost ()
    {
        echo please enter the host you would like to ping
        read host
        ping -c2 $host
    }

echo 'Select Option: '
select TASK in 'Reset Password' 'Show disk usage' 'Ping a host' 'Log out' # These are the options
do

        case $REPLY in 
            1) TASK=passwd;;
            2) TASK="df -h";;
            3) TASK=pingHost;;        
            4) TASK='exit';;
            * ) echo ERROR && exit 2;;
        esac
        
        if [ -n "$TASK" ]
            then
                    $TASK
                    break
            else
            echo INVALID CHOICE #, try again
        fi
    done
done