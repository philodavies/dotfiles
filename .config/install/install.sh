#!/bin/sh
# Phil's dotfile install script
# by Phil D

### SETUP ###
name=$1
repo=$2

### THE ACTUAL SCRIPT ###
# Install dotfiles
alias config="sudo -u git --git-dir="/home/$name/Git/.cfg/" --work-tree="/home/$name"
sudo -u "$name" mkdir -p "/home/$name/Git/"
config clone --bare "$repo" "/home/$name/Git/.cfg"
config checkout

# Load default sudo
cp "/home/$name/.config/sudo/01_sane_defaults" /etc/sudoers.d/
passwd -l root

# Load lightdm configs and enable service
cp "/home/$name/.config/lightdm/lightdm.conf" /etc/lightdm/
cp "/home/$name/.config/lightdm/lightdm-webkit2-greeter.conf" /etc/lightdm/
systemctl enable lightdm
