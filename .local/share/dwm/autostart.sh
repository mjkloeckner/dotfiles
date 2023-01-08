# set proper resolution
# xrandr -s 1366x768

# start compositor
# picom &

unclutter &

# swaps lock-mayus with escape & lalt with lsuper;
# keyboardmap &

# xbindkeys -f $HOME/.config/xbindkeys/.xbindkeysrc &

xss-lock -l lockscreen &

# i3lock -c 00000000 --wrongtext="" --veriftext="" --veriftext="" --noinputtext="" -i $HOME/.cache/i3lock/current/dimblur.png --ringcolor=8B008B --keyhlcolor=ff00ff --verifcolor=0000FF --indicator

# xrandr --output HDMI1 --mode 1600x900 --above eDP1 && nitrogen --restore &
# export AWT_TOOLKIT=MToolkit &

# xss-lock grabs a logind suspend inhibit lock and will use betterlockscreen to lock the screen before suspend.
# xss-lock -l lockscreen &

# xfce4-power-manager &

# polkit-dumb-agent &

# $HOME/.config/dwmblocks/dwmblocks &
export QT_QPA_PLATFORMTHEME='qt5ct'

# Minimal picom:
# picom --config /dev/null --backend xrender --experimental-backends
# picom --experimental-backends --backend glx &
# picom --experimental-backends --backend glx --vsync --xrender-sync-fence &
# picom

sys-dark-scheme

# kill -35 $(pidof dwmblocks)
