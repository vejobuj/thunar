#!/bin/bash

echo "Running Anti-Virus scan.
ATTENTION: This scan may not be able to detect all infections when not run from root."

echo 'clamscan -r ' "$@"

clamscan -r "$@"

echo "All done, please check if there are any infections found in the terminal. And hit enter key to exit."
read end;

exit 0
