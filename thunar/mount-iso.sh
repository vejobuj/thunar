#!/bin/bash

sudo umount /media/iso
sudo mount -t iso9660 -o loop,user "$1" /media/iso
sudo mount "$1" /media/iso
sudo mount "$1" /media/iso -o loop=/dev/loop0
sudo mount -o loop,offset=307200 "$1" /media/iso
