# set wallpaper
# nitrogen --restore

# Start compositor
# picom &
picom --experimental-backends --backend glx &

#$HOME/.config/dwm/dwm-bar/dwm_bar.sh &

xbindkeys -f $HOME/.config/xbindkeys/.xbindkeysrc &

keyboardmap &
xinput --set-prop 12 'libinput Tapping Enabled' 1

# lockscreen &
xss-lock -l lockscreen &

# xrandr --output HDMI1 --mode 1600x900 --above eDP1 && nitrogen --restore &

# setxkbmap -option caps:swapescape
# setxkbmap -option altwin:swap_lalt:lwin
