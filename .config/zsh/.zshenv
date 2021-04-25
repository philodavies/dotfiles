#!/bin/zsh

# ZSH profile file. Runs on login. Environmental variables are set here.

# Adds ~/.local/bin/ to PATH
export PATH="$PATH:$(du "$HOME/.local/bin" | cut -f2 | paste -sd ':')"

# Default programs
export BROWSER="vivaldi-stable"
export EDITOR="vim"
export TERMINAL="kitty"

# XDG
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"

# Dots
export HISTFILE="$XDG_CACHE_HOME/zsh/.zhistory"
export LESSHISTFILE=-
export XINITRC="$XDG_CONFIG_HOME/X11/xinitrc"
export XSERVERRC="$XDG_CONFIG_HOME/X11/xserverrc"
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"

# Command history settings
export HISTSIZE=50000
export HISTTIMEFORMAT="[%f %T] "
export SAVEHIST=50000

export DIFFPROG="nvim -d"
export KEYTIMEOUT=1
export GPG_TTY=$(tty)
export GNUPGHOME="$XDG_DATA_HOME"/gnupg
export TERM="xterm-256color"

# Golang configs
export GO111MODULE=on
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin


## FB things
# hostname=$(hostname -d)
# if [ "${hostname##*facebook.com*}" ]; then
#   export no_proxy=".fbcdn.net,.facebook.com,.thefacebook.com,.tfbnw.net,.fb.com,.fburl.com,.facebook.net,.sb.fbsbx.com,localhost"
#   export http_proxy=fwdproxy:8080
#   export https_proxy=fwdproxy:8080
# fi
