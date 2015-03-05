#!/bin/bash

# This script is meant for integration with thunar: appearance: folders
# passed %f
#
# requires xfce4-terminal, whiptail, thunar

# Recurse find in files

# check number of parameters in command
PARAMS=1
if [ $# -ne "$PARAMS" ]
then
  echo
  echo "Script requires the first argument to be the folder to look in."
  echo
  exit 1
fi

INIT=""
input=$(whiptail --topleft --inputbox "Please enter search string (case insensitive):" 8 78 $INIT --title "Find" 3>&1 1>&2 2>&3)
 
if [[ -z "$input" ]]; then
   exit 0  
fi
 
input=$(echo $input | sed 's/"//g')

title=$(echo "Find $input in $1" | sed 's/ /./g')

find=$(echo 'find '$1' -iname '$input)


cmd=$(echo "whiptail --topleft --title \"$title\" --topleft --checklist \"Choose:\" 20 124 15 "`grep -F -l -i "$input" "${1}" -R | sed 's/ /+/g' | sed 's/$/ "" off \\ /' | sed 's/^//'`"--clear")

foobar=$($cmd 3>&1 1>&2 2>&3)

open=$(echo $foobar | sed 's/"//g'| sed 's/+/%20/g' | sed 's/ / file:\/\//g' | sed 's/^/thunar file:\/\//')

if [[ -z "$foobar" ]]; then
   exit 0  
else
   $open &
   sleep 3
fi

exit 0
