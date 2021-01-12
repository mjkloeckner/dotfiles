#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc


if [ -z "$DISPLAY" -a $XDG_VTNR -eq 1 ]; then
	startx
fi

PATH="$PATH:/home/mk/.scripts"