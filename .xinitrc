
# swaps lock-mayus with escape & lalt with lsuper;
# exec keyboardmap &

$HOME/.config/dwmblocks/dwmblocks &

xrdb ~/.Xresources &

nitrogen --restore &

# xss-lock grabs a logind suspend inhibit lock and will use betterlockscreen to lock the screen before suspend. 
# exec xss-lock -l lockscreen &

# start i3 window manager;
# exec i3

lockscreen

export AWT_TOOLKIT=MToolkit &

# start dynamic window manager;
exec dwm
