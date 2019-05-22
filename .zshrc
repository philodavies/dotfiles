## TERM color setting
## Must be at the top of the zshrc because it needs to be sourced before oh-my-zsh runs
export TERM="xterm-256color"
ZSH_TMUX_AUTOSTART='true'

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
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(ssh dir vcs newline status)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=()
POWERLEVEL9K_PROMPT_ADD_NEWLINE=true

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

#Phil's Aliases
alias sudo="sudo -E"
alias mkdir="mkdir -pv"

#Phil's exports
export KEYTIMEOUT=1

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
    export EDITOR='mvim'
  fi
fi

