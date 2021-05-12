#!/usr/bin/env bash

set -xeuo pipefail

THIS_DIR="$(dirname $(realpath ${BASH_SOURCE[0]}))"

mkdir -p $THIS_DIR/etc/portage
cp -rf /etc/portage/* $THIS_DIR/etc/portage/
cp -r /etc/fstab $THIS_DIR/etc/
cp -r /etc/conf.d $THIS_DIR/etc/

mkdir -p $THIS_DIR/var/lib/portage
cp -f /var/lib/portage/world $THIS_DIR/var/lib/portage/
cp -f /var/lib/portage/world_sets $THIS_DIR/var/lib/portage/

mkdir -p $THIS_DIR/home
cp -f $HOME/.bashrc $THIS_DIR/home/
cp -f $HOME/.bash_logout $THIS_DIR/home/
cp -f $HOME/.bash_profile $THIS_DIR/home/
cp -f $HOME/.dircolors $THIS_DIR/home/
cp -f $HOME/.tmux.conf $THIS_DIR/home/
cp -f $HOME/.vimrc $THIS_DIR/home/
cp -f $HOME/.gitconfig $THIS_DIR/home/

mkdir -p $THIS_DIR/kernel
cp -f /usr/src/linux/.config $THIS_DIR/kernel/config-$(uname -r)

echo 'All DONE'
