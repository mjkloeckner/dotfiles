#				 _              
#		 _______| |__  _ __ ___ 
#		|_  / __| '_ \| '__/ __|
#		 / /\__ \ | | | | | (__ 
#		/___|___/_| |_|_|  \___|
#								
# 		by github.com/klewer-martin
#

HISTFILE=~/.cache/histfile
HISTSIZE=10000000
SAVEHIST=10000000

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Add plugins (because I don't use a plugin manager)
source ~/.config/zsh/plugged/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.config/zsh/plugged/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#ff0000"

# Add my personal scripts folder to path
PATH="$PATH:$HOME/soydev/scripts:$HOME/soydev/scripts/statusbar:$HOME/.local/bin"

# Set EDITOR and TERM values
export EDITOR=/usr/bin/nvim
# export TERM='alacritty'
export TERM='xterm-256color'

PROMPT_EOL_MARK=''

# avoid vi keybindigs;
#bindkey -e

# vi mode
bindkey -v
export KEYTIMEOUT=1

# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zstyle :compinstall filename '/home/mk/.zshrc'
zmodload zsh/complist
compinit
_comp_options+=(globdots)		# Include hidden files.

# Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char

# Change cursor shape for different vi modes.
# function zle-keymap-select () {
#     case $KEYMAP in
#         vicmd) echo -ne '\e[1 q';;      # block
#         viins|main) echo -ne '\e[5 q';; # beam
#     esac
# }

# Change cursor shape for different vi modes.
# function zle-keymap-select () {
#     case $KEYMAP in
# 		vicmd) print -rn -- $terminfo[cvvis];; # block cursor
# 		viins|main) print -rn -- $terminfo[cnorm];; # less visible cursor
#     esac
# }

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
RPROMPT='%F{red} %(?.. %?'
PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[magenta]%}%M %{$fg[cyan]%}%1~%{$fg[red]%}]%{$reset_color%}%(?..%F{red})$%b %{$reset_color%}"
# PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[magenta]%}%M %{$fg[blue]%}%1~%{$fg[red]%}]%{$reset_color%}$%b "
# PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[magenta]%}%M %{$fg[blue]%}%1~%{$fg[red]%}]%{$fg[red]%}%(?..(%?%))%{$reset_color%}$%b "
# PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[magenta]%}%M %{$fg[blue]%}%1~%{$fg[red]%}]%{$reset_color%}$%b %(?..[%?] )"

# Edit line in vim with ctrl-e:
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line

bindkey -s '^f' 'cd "$(dirname "$(fzf)")"\n'
# bindkey -s '^F' 'cd "$(dirname "$(sudo find ~ \( ! -regex '.*/\..*' \) -type f  | fzf)")"'

setopt autocd

# This fix my keybord in terminal; (I use st)
autoload -Uz up-line-or-beginning-search
autoload -Uz down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

bindkey '^[[P'    delete-char					# delete 	 delete previous char
bindkey '^[[3~'    delete-char					# delete 	 delete previous char
bindkey '^[[H'    beginning-of-line             # home       go to the beginning of line
bindkey '^[[F'   end-of-line                   # end        go to the end of line
bindkey '^[[1;5C' forward-word                  # ctrl+right go forward one word
bindkey '^[[1;5D' backward-word                 # ctrl+left  go backward one word
bindkey '^H'      backward-kill-word            # ctrl+bs    delete previous word
bindkey '^[[M'	  kill-word                     # ctrl+del   delete next word

# Aliases; (probably gonna export them to a file in a future)
alias cal='cal -3'
alias cdwm='cd $HOME/.config/dwm && $EDITOR config.def.h'
alias ckitty='$EDITOR $HOME/.config/kitty/kitty.conf'
alias cnvim='$EDITOR $HOME/.config/nvim/init.vim'
alias cp='cp -iv'
alias devbox='ssh -Y mk@192.168.0.101'
alias df='df -h | grep -v snapd'
alias diff='diff --color=auto' 
alias f='fzf'
alias g='git'
alias gaa='git add .'
alias gc='git commit'
alias gcc='gcc -ansi -pedantic -std=c99'
alias gcm='git commit -m'
alias gpl='git pull'
alias gps='git push'
alias gst='git status'
alias grep='grep --color=auto'
alias l='ls --color=auto'
alias la='ls --color=auto -lah'
alias ll='ls --color=auto -lh'
alias ls='ls --color=auto'
alias lf_='lf'
alias lf='lfrun'
alias matrix='unimatrix -n -s 96 -l o -a'
alias py='python'
alias r='ranger'
alias ss='sudo systemctl'
# alias sv='sudo nvim'
alias svim='sudo nvim'
alias v='nvim'
alias vim='nvim'
alias xclip='xclip -selection clipboard'

# Dynamic window title with zsh shell.
# Shows current directory and running (multi-line) command.
case "$TERM" in (rxvt|rxvt-*|st|st-*|*xterm*|(dt|k|E)term)
    local term_title () { print -n "\e]0;${(j: :q)@}\a" }
    precmd () {
      local DIR="$(print -P '[%c]%#')"
      term_title "$DIR" "zsh"
    }
    preexec () {
      local DIR="$(print -P '[%c]%#')"
      local CMD="${(j:\n:)${(f)1}}"
      term_title "$DIR" "$CMD"
    }
  ;;
esac

# Starts the X server:
if [[ -z "$DISPLAY" ]] && [[ $(tty) = /dev/tty1 ]]; then
	startx
logout
fi

# Default arguments for fzf
# export FZF_DEFAULT_OPTS="--height=8 --layout=reverse --border=sharp --history='~/.cache/fzf/histfile'"
export FZF_DEFAULT_OPTS='--height=8 --layout=reverse --border=sharp' 

export PF_INFO="ascii title os kernel uptime pkgs memory"
pfetch
