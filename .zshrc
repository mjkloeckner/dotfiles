#				 _              
#		 _______| |__  _ __ ___ 
#		|_  / __| '_ \| '__/ __|
#		 / /\__ \ | | | | | (__ 
#		/___|___/_| |_|_|  \___|
#								
# 		by github.com/klewer-martin
#

HISTFILE=~/.cache/histfile
HISTSIZE=1000000
SAVEHIST=1000000


# If not running interactively, don't do anything
[[ $- != *i* ]] && return


# Add plugins (because I don't use a plugin manager)
source ~/.config/zsh/plugged/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.config/zsh/plugged/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#ff0000"

# Add my personal scripts folder to path
PATH="$PATH:$HOME/soydev/scripts:$HOME/soydev/scripts/statusbar:$HOME/.local/share/gem/ruby/2.7.0/bin:$HOME/.local/bin"

# Set EDITOR and TERM values
export EDITOR=/usr/bin/nvim
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
function zle-keymap-select () {
    case $KEYMAP in
        vicmd) echo -ne '\e[1 q';;      # block
        viins|main) echo -ne '\e[5 q';; # beam
    esac
}


# This is for ranger to display previews properly
set preview_images_method ueberzug

# Load colors and set a colored prompt:
autoload -U colors && colors
PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[magenta]%}%M %{$fg[blue]%}%1~%{$fg[red]%}]%{$reset_color%}$%b "

# Starts the X server:
if [[ -z "$DISPLAY" ]] && [[ $(tty) = /dev/tty1 ]]; then
	startx
logout
fi

# Edit line in vim with ctrl-e:
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line

bindkey -s '^f' 'cd "$(dirname "$(fzf)")"\n'

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
alias c='clear'
alias cal='cal -3'
alias cp='cp -iv'
alias devbox='ssh -Y mk@192.168.0.172'
alias df='df -h | grep -v snapd'
alias diff='diff --color=auto' 
alias f='fzf'
alias g='git'
alias gaa='git add .'
alias gc='git commit'
alias gcm='git commit -m'
alias gpl='git pull'
alias gps='git push'
alias gst='git status'
alias grep='grep --color=auto'
alias l='ls --color=auto'
alias la='ls --color=auto -lah'
alias ll='ls --color=auto -lh'
alias ls='ls --color=auto'
alias matrix='unimatrix -n -s 96 -l o -a'
alias py='python'
alias r='ranger'
alias ss='sudo systemctl'
alias sv='sudo nvim'
alias svim='sudo nvim'
alias termite='termite --title="termite"'
alias v='nvim'
alias vim_='vim'
alias vim='nvim'
alias xclip='xclip -selection clipboard'
