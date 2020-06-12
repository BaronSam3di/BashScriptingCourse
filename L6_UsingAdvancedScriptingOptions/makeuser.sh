#!/bin/bash
# script that creates users usin
# Usage: use -a to add a home directory
#        use -b to make the user member of group 100
#        use -c to specify a custom shell. This option
#               is followed by the shell name

while getopts "abc:" opt            # getopts - special tool for reading options 
do
case $opt in 
    a ) VAR1=-m ;;
    b ) VAR2="-g 100";;
    c ) VAR3="-s $OPTARG" ;;
    * ) echo 'usage: makeuser [-a] [-b] [0-c shell] username'
esac
done

echo the current arguments are set to $*
shift $((OPTIND -1))
echo now the current arguments are set to $*
echo useradd $VAR1 $VAR2 $VAR3 $1
exit 0
