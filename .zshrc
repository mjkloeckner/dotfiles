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

PROMPT_EOL_MARK=''

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

zstyle :compinstall filename '/home/mk/.zshrc'

autoload -Uz compinit
compinit

_comp_options+=(globdots)

source ~/.config/zsh/plugged/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.config/zsh/plugged/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#ff0000"
# ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#ff0000,bg=cyan,bold,underline"

# avoid vi keybindigs;
bindkey -e

# Add my personal scripts folder to path
PATH="$PATH:$HOME/soydev/scripts:$HOME/soydev/scripts/statusbar:$HOME/.local/share/gem/ruby/2.7.0/bin:$HOME/.local/bin"

# Set nvim as default editor
export EDITOR=/usr/bin/nvim

# Set neovim as default editor
set preview_images_method ueberzug

# aliases; probably gonna export them to a file in a future
alias c='clear'
alias cal='cal -3'
alias cp='cp -iv'
alias devbox='ssh -Y mk@192.168.0.172'
alias df='df -h | grep -v snapd'
alias diff='diff --color=auto' 
alias g='git'
alias grep='grep --color=auto'
alias ls='ls --color=auto'
alias la='ls -la'
alias ll='ls -l'
alias l='ls'
alias matrix='unimatrix -n -s 95 -l o -a'
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


# this part sets a nice colored bash like prompt;
autoload -U colors && colors

PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[magenta]%}%M %{$fg[blue]%}%1~%{$fg[red]%}]%{$reset_color%}$%b "




# starts the x server (because I don't use a disply manager)
if [[ -z "$DISPLAY" ]] && [[ $(tty) = /dev/tty1 ]]; then
 startx
logout
fi

# Use lf to switch directories and bind it to ctrl-o
lfcd () {
    tmp="$(mktemp)"
    lf -last-dir-path="$tmp" "$@"
    if [ -f "$tmp" ]; then
        dir="$(cat "$tmp")"
        rm -f "$tmp" >/dev/null
        [ -d "$dir" ] && [ "$dir" != "$(pwd)" ] && cd "$dir"
    fi
}
bindkey -s '^o' 'lfcd\n'

# this fix my keybord in terminal; (I use st)
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
