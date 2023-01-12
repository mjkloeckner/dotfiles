#				 _
#		 _______| |__  _ __ ___
#		|_  / __| '_ \| '__/ __|
#		 / /\__ \ | | | | | (__
#		/___|___/_| |_|_|  \___|
#
# 		by github.com/klewer-martin
#

HISTFILE=$HOME/.cache/zsh_history
HISTSIZE=1000000
SAVEHIST=$HISTSIZE
ZDOTDIR=$HOME/.config/zsh

# Do not save less pager history file
LESSHISTFILE=/dev/null

setopt inc_append_history
setopt hist_ignore_all_dups
setopt share_history
setopt interactivecomments
setopt autocd
setopt nohup
# setopt nopromptcr
setopt correct
setopt noclobber
setopt nolistambiguous
setopt extended_glob

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Add plugins (because I don't use a plugin manager)
source $HOME/.config/zsh/plugged/zsh-autosuggestions/zsh-autosuggestions.zsh
unset ZSH_AUTOSUGGEST_USE_ASYNCS
# bindkey '^ ' autosuggest-fetch
bindkey '^n' autosuggest-accept

source $HOME/.config/zsh/plugged/zsh-history-substring-search/zsh-history-substring-search.zsh

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=#ff0000'
# ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#ff00ff,bg=cyan,bold,underline"
# ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE=6
# source /usr/share/zsh/plugins/zsh-vi-mode/zsh-vi-mode.plugin.zsh

# Add my personal scripts folder to path
PATH="$PATH:$HOME/.local/bin/statusbar:$HOME/.local/bin/statusbar/buttons:$HOME/.local/bin:$HOME/go/bin:/usr/local/go/bin"

# Set enviroment variables
export EDITOR=/usr/bin/nvim
export BROWSER=/usr/bin/firefox
export TERM='xterm-256color'
export LC_TIME="es_AR.UTF-8" # dd/mm/yy time format

# PROMPT_EOL_MARK=''

# vi mode
bindkey -v
export KEYTIMEOUT=1

bindkey -M emacs '^?' backward-kill-word
bindkey -M viins '^?' backward-kill-word
bindkey -M vicmd '^?' backward-kill-word

bindkey -M emacs '^[[3;5~' kill-word
bindkey -M viins '^[[3;5~' kill-word
bindkey -M vicmd '^[[3;5~' kill-word

# yank to the system clipboard
function vi-yank-xclip {
    zle vi-yank
   echo "$CUTBUFFER" | xclip -selection clipboard
}

zle -N vi-yank-xclip
bindkey -M vicmd 'y' vi-yank-xclip

# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zstyle :compinstall filename '$HOME/.zshrc'
zmodload zsh/complist
compinit
_comp_options+=(globdots)		# Include hidden files.

# Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history

bindkey -v '^?' backward-delete-char
# bindkey '^R' history-incremental-pattern-search-backward
#
# Search backwards and forwards with a pattern
bindkey -M vicmd '/' history-incremental-pattern-search-backward
bindkey -M vicmd '?' history-incremental-pattern-search-forward

# set up for insert mode too
bindkey -M viins '^R' history-incremental-pattern-search-backward
bindkey -M viins '^F' history-incremental-pattern-search-forward

# Change cursor shape for different vi modes.
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] ||
     [[ $1 = 'block' ]]; then
    echo -ne '\e[1 q'
  elif [[ ${KEYMAP} == main ]] ||
       [[ ${KEYMAP} == viins ]] ||
       [[ ${KEYMAP} = '' ]] ||
       [[ $1 = 'beam' ]]; then
    echo -ne "\e[5 q"
  fi
}
zle -N zle-keymap-select

zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne "\e[5 q"
}
zle -N zle-line-init

echo -ne '\e[5 q' # Use beam shape cursor on startup.

preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.

# This is for ranger to display previews properly
set preview_images_method ueberzug

# Load colors and set a colored prompt:
autoload -U colors && colors

# PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[magenta]%}%M %{$fg[cyan]%}%1~%{$fg[red]%}]%{$reset_color%}%(?..%F{red})$%{$reset_color%} "
# PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[magenta]%}%M %{$fg[cyan]%}%1~%{$fg[red]%}]%{$reset_color%}%(?..%F{red})$%b%{$reset_color%} "
# PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[magenta]%}%M %{$fg[cyan]%}%1~%{$fg[red]%}]%{$fg[yellow]%}[%j]%{$reset_color%}%(?..%F{red}) $%{$reset_color%} "

# %(condition.ifTrue.ifFalse)
# %(1j.%j.)

# Shows jobs in background number
# PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[magenta]%}%M %{$fg[cyan]%}%1~%{$fg[red]%}]%(1j.%{$fg[yellow]%}[%j].)%{$reset_color%}%(?..%{$fg[red]%})$%{$reset_color%} "

PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[magenta]%}%M %{$fg[cyan]%}%1~%{$fg[red]%}]%(1j.%F{011}(%j)%f.)%{$reset_color%}%(?..%{$fg[red]%})$%{$reset_color%} "
# PS1="%B%{$fg[yellow]%} %n%{$fg[green]%}@%{$fg[magenta]%}%M %{$fg[cyan]%}%1~ %(1j.%F{011}[%j]%f.)%{$reset_color%}%(?..%{$fg[red]%})$%{$reset_color%} "

# Right prompt
# RPS1="hola"
# PS1="%B%{$fg[red]%}[%n%{$fg[green]%} %{$fg[cyan]%}%1~%{$fg[red]%}]%{$reset_color%}%(?..%F{red})#%b%{$reset_color%} "

# Edit line in vim with ctrl-e:
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line

# bindkey -s '^e' 'cd "$(dirname "$(fzf)")"\n'

# This fix my keybord in terminal; (I use st)
autoload -Uz up-line-or-beginning-search
autoload -Uz down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

bindkey '^[[P'    delete-char					# delete 	 delete previous char
bindkey '^[[3~'   delete-char					# delete 	 delete previous char
bindkey '^[[H'    beginning-of-line             # home       go to the beginning of line
bindkey '^[[F'    end-of-line                   # end        go to the end of line
bindkey '^[[1;5C' forward-word                  # ctrl+right go forward one word
bindkey '^[[1;5D' backward-word                 # ctrl+left  go backward one word
bindkey '^H'      backward-kill-word            # ctrl+bs    delete previous word
bindkey '^[[M'	  kill-word                     # ctrl+del   delete next word

# Source aliases file
source $HOME/.config/zsh/aliases.sh

# Dynamic window title with zsh shell.
# Shows current directory and running (multi-line) command.
case "$TERM" in (rxvt|rxvt-*|st|st-*|*xterm*|(dt|k|E)term)
    local term_title () { print -n "\e]0;${(j: :q)@}\a" }
    precmd () {
      local DIR="$(print -P '%~ $')"
      term_title "$DIR" "zsh"
    }
    preexec () {
      local DIR="$(print -P '%~ $')"
      local CMD="${(j:\n:)${(f)1}}"
      term_title "$DIR" "$CMD"
    }
  ;;
esac

# Starts the X server:
if [[ -z "$DISPLAY" ]] && [[ $(tty) = /dev/tty1 ]]; then
	startx 2> /dev/null
logout
fi

# Enable mouse support for less pager on tmux
[[ ! -z "$TMUX" ]] && export LESS='--mouse -Rf'

# Default arguments for fzf
export FZF_DEFAULT_OPTS='--height=8 --layout=reverse --border=sharp'


# . $HOME/mouse.zsh

# M for vi (cmd) mode
bindkey -M vicmd M zle-toggle-mouse

# zstyle ':completion:*' menu select script /usr/local/etc/bash_completion.d/git-completion.bash

# unambigandmenu() {
#     zle expand-or-complete
#     zle magic-space
#     zle backward-delete-char
#     zle expand-or-complete
# }
# zle -N unambigandmenu

# zstyle -e ':completion:*' list-colors 'reply=("${PREFIX:+=(#bi)($PREFIX:t)(?)*==03=01}:${(s.:.)LS_COLORS}")'
# zstyle -e ':completion:*:default' list-colors 'reply=("${PREFIX:+=(#bi)($PREFIX:t)(?)*==34=00}:${(s.:.)LS_COLORS}")';
pfetch

source $HOME/.config/zsh/plugged/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
ZSH_HIGHLIGHT_STYLES[unknown-token]='fg=#ff0000'
# ZSH_HIGHLIGHT_STYLES[comment]='fg=grey,bold'
ZSH_HIGHLIGHT_STYLES[comment]='fg=#707070,bold'

