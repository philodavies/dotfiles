# Enable colors and change prompt
autoload -U colors && colors # Load the colors
#PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$%b "

# Disable freeze terminal hot keys
stty stop undef   # Disable Ctrl-s from freezing terminal
stty start undef  # Disable Ctrl-q from resuming terminal


# Load aliases if available
[ -f "$XDG_CONFIG_HOME/aliases/aliasrc" ] && source "$XDG_CONFIG_HOME/aliases/aliasrc"


bindkey -v #Set zsh to vi mode
bindkey '^R' history-incremental-search-backward #Reverse search
bindkey '^A' vi-beginning-of-line #Go to line start

setopt INC_APPEND_HISTORY
setopt HIST_IGNORE_ALL_DUPS
setopt EXTENDED_HISTORY

function pretty_csv {
    cat "$@" | sed 's/,/ ,/g' | column -t -s, | less -S
}

hash pkgfile && source /usr/share/doc/pkgfile/command-not-found.zsh

# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit -d "$XDG_CACHE_HOME/zsh/.zcompdump"
_comp_options+=(globdots)		# Include hidden files.

# Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char

# Change cursor shape for different vi modes.
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] ||
     [[ $1 = 'block' ]]; then
    echo -ne '\e[1 q'

  elif [[ ${KEYMAP} == main ]] ||
       [[ ${KEYMAP} == viins ]] ||
       [[ ${KEYMAP} = '' ]] ||
       [[ $1 = 'beam' ]]; then
    echo -ne '\e[5 q'
  fi
}
zle -N zle-keymap-select
_fix_cursor() {
    echo -ne "\e[5 q"
}
precmd_functions+=(_fix_cursor)

# Powerlevel10k (prompts)
source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme

# Load syntax highlighting; should be last.
source /usr/share/zsh/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh 2>/dev/null

# To customize prompt, run `p10k configure` or edit ~/.config/zsh/.p10k.zsh.
[[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh
