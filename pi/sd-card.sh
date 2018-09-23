#!/usr/bin/env bash

# Basic steps to setup a pi image.

diskutil list | grep '(external, physical)'
# diskutil unmountDisk /dev/disk2

# dd bs=1m if=../../images/2018-06-27-raspbian-stretch-lite.img of=/dev/rdisk2 conv=sync
# diskutil eject /dev/rdisk2
