#!/usr/bin/env bash

efibootmgr -c -d /dev/sda -p 1 -L "Gentoo" -l '/EFI/gentoo/vmlinuz-5.10.27-gentoo.efi' -u 'root=/dev/sda2 rootfstype=ext4 quiet'
