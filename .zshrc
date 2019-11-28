## TERM color setting
## Must be at the top of the zshrc because it needs to be sourced before oh-my-zsh runs
export TERM="xterm-256color"

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
ZSH_THEME="robbyrussell"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  tmux
)

source $ZSH/oh-my-zsh.sh

## User configuration
## This section contains my settings :)
## Phil Davies
## May 21st, 2019

## ZSH Theme
POWERLEVEL9K_MODE='nerdfont-complete'
source  ~/.dotfiles/zsh/powerlevel9k/powerlevel9k.zsh-theme
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(virtualenv dir vcs newline status)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=()
POWERLEVEL9K_PROMPT_ADD_NEWLINE=true
POWERLEVEL9K_SHORTEN_STRATEGY="truncate_from_right"
POWERLEVEL9K_SHORTEN_DIR_LENGTH=3
POWERLEVEL9K_SHORTEN_DELIMITER="*"

## Tmux config
## Tmux config in part from: https://blogs.technet.microsoft.com/jessicadeen/linux/macos-ohmyzsh-tmux-vim-iterm2-powerlevel9k-badass-terminal/
source ~/.dotfiles/tmux/tmuxinator.zsh

## Ruby configs
if which rbenv > /dev/null; then
  eval "$(rbenv init -)"
  export RUBYPATH=$HOME/.gem/ruby/2.3.0
  export PATH=$PATH:$RUBYPATH/bin
  source $(dirname $(gem which colorls))/tab_complete.sh

  alias ls=colorls
fi

## GO configs
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin
export GO111MODULE=on

#Phil's Aliases
alias sudo="sudo -E"
alias mkdir="mkdir -pv"
alias cls="clear"
alias svup="spotify vol up"
alias svdown="spotify vol down"
alias gs="git status"
alias xclear="pbcopy < /dev/null"
alias ipy="ipython"

#Phil's exports
export KEYTIMEOUT=1
export MAKEFLAGS=-j$(sysctl -n hw.ncpu)
export GPG_TTY=$(tty)

#Phil's custom settings
#Set zsh in vi mode
bindkey -v

#Reverse search
bindkey '^R' history-incremental-search-backward

#Phil's dotfiles git alias
alias config="/usr/bin/git --git-dir=$HOME/.cfg --work-tree=$HOME"

## Mac specific settings
if [[ `uname` == "Darwin" ]]; then
  ## Preferred editor for local and remote sessions
  if [[ -n $SSH_CONNECTION ]]; then
    export EDITOR='vim'
  else
    export EDITOR='mvim -v'
  fi
fi


## Add thefuck support
eval $(thefuck --alias)

## Add lastpass-cli aliases
alias lplog="lpass login pdavies@cloudflare.com"
alias lpssh="echo 'Copying SSH password from LP vault' && lpass show -cp privateKeyPass"
alias lptac="echo 'Copying TACACS password from LP vault' && lpass show -cp tacacs+"

## Add /usr/local/sbin to path
# It's needed for mtr
#
# Also add ~/.dotfiles/bin
# for local scripts (like git-housekeep)
export PATH=$PATH:/usr/local/sbin:~/.dotfiles/bin

## CF specific
docklog() { docker login docker-registry.cfdata.org -u pdavies@cloudflare.com -p "$1" }

function pretty_csv {
    # column -t -s, -n "$@" | less
    cat "$@" | sed 's/,/ ,/g' | column -t -s, | less -S
}
