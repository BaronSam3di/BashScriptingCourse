#!/bin/bash
#
echo '
Create a user helpdesk/ Write a menu script that is staered automatically when this user logs in.
The Menu script should never be terminated, unless the user ligs our (which is a menu option as well). 
From this menu, make at least the following options availible:

'
PASSWORD="password"
changePassword ()
{
    echo "Plese enter the new password.."
    read newPassword
    echo Changeing password to $newPassword
}

pingHost ()
{
    echo please enter the host you would like to ping
    read host
    ping -c2 $host
    echo Just pinged $host
}

logOff ()
{
    echo we are logging off
}



echo 'select a task: '
select TASK in 'Reset Password' 'Show disk usage' 'Ping a host' 'Log out' # These are the options

do

        case $REPLY in 
            1 ) TASK=changePassword;;
            2 ) TASK="df -h";;
            3 ) TASK=pingHost;;        # free not avalible on Mash
            4 ) TASK='exit';;
            * ) echo ERROR && exit 2;;
        esac
        
        if [ -n "$TASK" ]
            then
                    clear
                    $TASK
                    break
            else
            echo INVALID CHOICE && exit 3
        fi

done