#!/bin/bash
#================
# FILE          : config.sh
#----------------
# PROJECT       : OpenSuSE KIWI Image System
# COPYRIGHT     : (c) 2006 SUSE LINUX Products GmbH. All rights reserved
#               :
# AUTHOR        : Marcus Schaefer <ms@suse.de>
#               :
# BELONGS TO    : Operating System images
#               :
# DESCRIPTION   : configuration script for SUSE based
#               : operating systems
#               :
#               :
# STATUS        : BETA
#----------------
#======================================
# Functions...
#--------------------------------------
test -f /.kconfig && . /.kconfig
test -f /.profile && . /.profile

#======================================
# Greeting...
#--------------------------------------
echo "Configure image: [$kiwi_iname]..."

#======================================
# Create ssh machine keys
#--------------------------------------
/usr/sbin/sshd-gen-keys-start

(cd /usr/share/locale && find -name "*.mo" | xargs rm)

echo "export WAYLAND_DISPLAY=/tmp/wayland-0" >> /home/user/.bashrc
echo "export MOZ_ENABLE_WAYLAND=1" >> /home/user/.bashrc
echo "export XDG_RUNTIME_DIR=/home/user/.run" >> /home/user/.bashrc
echo "mkdir -p /home/user/.run" >> /home/user/.bashrc
