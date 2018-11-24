#!/usr/bin/env bash

# Basic steps to setup a pi image.

# diskutil list | grep '(external, physical)'

EXT_DISK=$(diskutil list | perl -n -e'/^\/dev\/(\w+)\s+\(internal, physical/ && print $1')
echo "Perl found: $EXT_DISK"

EXT_DISK=$(diskutil list | awk '/\(external, physical\)/ {print $1}' | cut -d '/' -f 3)
echo "Awk found: $EXT_DISK"
# diskutil unmountDisk /dev/disk2

# dd bs=1m if=../../images/2018-06-27-raspbian-stretch-lite.img of=/dev/rdisk2 conv=sync
# diskutil eject /dev/rdisk2
