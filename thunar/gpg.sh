#!/bin/bash

# gpg for thunar customized actions, 
# command: xfce4-terminal -x /media/bar/Scripts/thunar/gpg.sh %F
# appearance: anything but folders

echo "Please choose
 E to encrypt
 D to decrypt
 S to sign
 V to verify";
read action;

if [ "$action" == "D" ]
   then
   gpg -d "$@" > "$@.out"
   
   echo "Your outputfile may be BASE64 encoded, do you wish to decode? YN: ";
   read yn;
   if [ "$yn" == "Y" ]
      then
      base64 -d "$@.out" > "$@.OUT"
      rm "$@.out"
   fi
fi

if [ "$action" == "E" ]
   then
   gpg --list-keys
   gpg -e --armor "$@"
fi

if [ "$action" == "S" ]
   then
   gpg --clearsign  "$@"
   geany "$@.asc"
fi

if [ "$action" == "V" ]
   then
   gpg --verify "$@"
fi
echo "All done, please check if there are any messages in the terminal. And hit enter key to exit."
read end;

exit 0
