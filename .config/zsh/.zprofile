#!/bin/zsh

# ZSH profile file. Runs on login.

# Start the Xorg server if it hasn't already been started
[ "$(tty)" = "/dev/tty1" ] && ! pidof Xorg >/dev/null 2>&1 && exec xinit
