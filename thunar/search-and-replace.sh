#!/bin/bash
# This script is meant for integration with thunar: appearance: folders
# passed %f
#
# requires xfce4-terminal, whiptail, thunar

# recurse find and replace

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
input=$(whiptail --topleft --inputbox "WARNING: THIS IS A LOADED GUN. 
BACKUP before you search and replace in files recursively without undo!
- You cannot use ^ character in your input.  

Enter text to find in files or cancel:" 13 78 $INIT --title "Search and replace in files" 3>&1 1>&2 2>&3)
 
if [[ -z "$input" ]]; then
   exit 0  
fi
input=$(echo $input | sed 's/"//g')

INIT=""
input2=$(whiptail --topleft --inputbox "Enter text to replace with. If you wish to replace quotes \", add a backslash \\ before each quote \\\". Or press cancel:" 13 78 $INIT --title "Search and replace in files" 3>&1 1>&2 2>&3)
input2=$(echo $input2 | sed 's/"//g')

title=$(echo "Find $input and replace with $input2 in $1" | sed 's/ /./g')

affected=$(grep -lr -e "$input" "$1/")

if [[ -z "$affected" ]]; then
   whiptail --topleft --title "No matches" --msgbox "Sorry your search phrase was not found." 8 78
   exit 0
fi

sure=$(whiptail --title "Confirm changes" --topleft --inputbox "The following files are changed, are you REALLY sure?  Type YES in upper case to continue.
$affected" 20 124 3>&1 1>&2 2>&3)

if [ "$sure" = "YES" ]
then
   grep -lZr -e "$input" "$1/" | xargs -0 sed -i "s^$input^$input2^g"
else
   exit 0 &
   sleep 3
fi

exit 0

# choose ^ for seperation of sed command, so ^ cannot be used to search and replace
#The character you put after ’s’ (s being substitute command) determines delimiter you want to use. So you can always specify delimiter that is not contained in your search string to avoid errors, and provide better readability compared to escaping forward slashes. In your case to search for http://www.example.com/oldpage.html and replace it with http://www.example.com/newpage.html you could use ‘_’ as separator:
#sed ’s_http://www.example.com/oldpage.html_http://www.example.com/newpage.html_g’



