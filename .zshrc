# Path to your oh-my-zsh installation.
  export ZSH=/home/phil/.oh-my-zsh

# Set name of the theme to load.
ZSH_THEME="robbyrussell"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
)

source $ZSH/oh-my-zsh.sh

## User configuration
#Phil's functions

#function to show which vi mode I am in.
function zle-line-init zle-keymap-select {
    VIM_PROMPT="%{$fg_bold[yellow]%} [% NORMAL]% %{$reset_color%}"
    RPS1="${${KEYMAP/vicmd/$VIM_PROMPT}/(main|viins)/} $EPS1"
    zle reset-prompt
}

function collapse_pwd {
    echo $(pwd | sed -e "s,^$HOME,~,")
}

#Phil's Aliases
alias sudo="sudo -E"
alias mkdir="mkdir -pv"


#Phil's exports
export KEYTIMEOUT=1
export PROMPT="%{$fg[magenta]%}%n%{$reset_color%} at %{$fg[yellow]%}%m%{$reset_color%} in %{$fg_bold[green]%}%15<..<%~%<<%#%{$reset_color%} "


#Phil's custom settings
#Set zsh in vi mode
bindkey -v


#This sets the prompt to show when I am in vi edit mode.
RPS1="${${KEYMAP/vicmd/$VIM_PROMPT}/(main|viins)/} $EPS1"
zle -N zle-line-init
zle -N zle-keymap-select


#Phil's dotfiles git alias
alias config=/usr/bin/git --git-dir=$HOME/.cfg --work-tree=$HOME
