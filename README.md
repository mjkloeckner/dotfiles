# Martin's linux configuration files

These are my config files. I use linux with suckless's dynamic window manager
(dwm), it's nothing too fancy, just a nice wallpaper and a black status bar on
the bottom to show basic information.

To write code generaly I use vim (neovim) and tmux, here is a screenshot
debugging [6502 emulator](https://github.com/mjkloeckner/6502)

![debugging 6502 emulator](https://user-images.githubusercontent.com/64109770/209008527-a6ea6ca3-8b7d-4e72-a41f-b1ee632bbf73.png)

## Applications that I use
* **OS**: Arch linux
* **SHELL**: Zsh 
* **Term**: kitty because of the ligature support, I also use suckless's simple
  terminal (st) too on my laptop
* **Editor**: vim (neovim)
* **Web Browser**: Firefox
* **Login Manager**: autologin on tty1 and starting Xserver from zshrc

```console
# Starts the X server only on tty1
if [[ -z "$DISPLAY" ]] && [[ $(tty) = /dev/tty1 ]]; then
	startx 2> /dev/null
	logout
fi
```

* **Lockscreen**: i3lock custom
  [script](https://github.com/klewer-martin/scripts/blob/inspiron/lockscreen)
* **Notifications**: Dunst 
* **Blue light filter**: redshift
