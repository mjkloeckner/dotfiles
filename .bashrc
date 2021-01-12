#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Aliases
alias ls='ls --color=auto'
alias la='ls -la'
alias ll='ls -l'
alias cl='clear'

PS1='[\u@\h \W]\$ '

PATH="$PATH:/home/mk/.scripts"
