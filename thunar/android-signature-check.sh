#!/bin/bash

unzip -p "$1" META-INF/CERT.RSA | keytool -printcert
unzip -p "$1" META-INF/NFPPDKEY.RSA | keytool -printcert

echo "Hit any key to continue with jarsigner verify."
read end;

jarsigner -verbose -verify  "$1"

echo "All done, please check if there are any messages in the terminal. And hit enter key to exit."
read end;

exit 0
