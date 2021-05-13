#!/usr/bin/env bash

## delete boot entry
efibootmgr -b 0004 -B
efibootmgr -c -d /dev/sda -p 1 -L "Gentoo" -l '/EFI/gentoo/vmlinuz-5.15.88-gentoo' -u 'root=/dev/sda2 rootfstype=ext4 quiet video=hyperv_fb:1920x1080'

## set boot order
#efibootmgr -o xxxx, xxx, xxx
