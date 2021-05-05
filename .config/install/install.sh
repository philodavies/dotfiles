#!/bin/sh
# Phil's dotfile install script
# by Phil D

### SETUP ###
name=$1

### THE ACTUAL SCRIPT ###
# Load default sudo and lock root account
cp "/home/$name/.config/sudo/01_sane_defaults" /etc/sudoers.d/
passwd -l root

# Load lightdm configs and enable service
cp "/home/$name/.config/lightdm/lightdm.conf" /etc/lightdm/
cp "/home/$name/.config/lightdm/lightdm-webkit2-greeter.conf" /etc/lightdm/
systemctl enable lightdm
