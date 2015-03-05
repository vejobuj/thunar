#!/bin/bash
    sudo -u chrome chown chrome:bar "$@" -R
    sudo -u chrome chmod g+rwx "$@" -R
echo "All done. And hit enter key to exit."
read end;

exit 0
