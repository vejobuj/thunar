#!/bin/bash

echo "Running shred
ATTENTION: may not be able to shred when not run from root."

echo '/usr/bin/shred -vfz -n 3 ' "$@"

/usr/bin/shred -vufz -n 3 "$@"

echo "All done, please check if there are any errors in the terminal. And hit enter key to exit."
read end;

exit 0
