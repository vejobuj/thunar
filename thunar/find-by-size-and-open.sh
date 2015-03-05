#!/bin/bash

# This script is meant for integration with thunar: appearance: folders
# passed %f
#
# requires xfce4-terminal, whiptail, thunar

# recurse find file by size

# check number of parameters in command
PARAMS=1
if [ $# -ne "$PARAMS" ]
then
  echo
  echo "Script requires the first argument to be the folder to look in."
  echo
  exit 1
fi

input=$(whiptail --topleft --radiolist "Choose size:" 20 78 15 --title "Find" \
"+1M" "" off \
"+5M" "" off \
"+10M" "" off \
"+20M" "" off \
"+50M" "" on \
"+100M" "" off \
"+250M" "" off \
"+500M" "" off \
"+1000M" "" off \
"+2000M" "" off \
"+4000M" "" off \
3>&1 1>&2 2>&3)
 
if [[ -z "$input" ]]; then
   exit 0  
fi

title=$(echo "Find $input in $1" | sed 's/ /./g')


cmd=$(echo "whiptail --topleft --title \"$title\" --topleft --checklist \"Choose:\" 20 124 15 "`find "$1" -size "$input"  | sed 's/ /+/g' | sed 's/$/ "" off \\ /' | sed 's/^//'`"--clear")

foobar=$($cmd 3>&1 1>&2 2>&3)

open=$(echo $foobar | sed 's/"//g'| sed 's/+/%20/g' | sed 's/ / file:\/\//g' | sed 's/^/thunar file:\/\//')

if [[ -z "$foobar" ]]; then
   exit 0  
else
   $open &
   sleep 3
fi

exit 0
