# Personal linux configuration files

These are my config files. I use linux with suckless's dynamic window manager
(dwm), it's nothing too fancy, just a nice wallpaper and a black status bar on
the bottom to show basic information.

To write code generaly I use vim (neovim) and tmux, here is a screenshot
debugging [6502 emulator](https://github.com/mjkloeckner/6502)

![debugging 6502 emulator](https://user-images.githubusercontent.com/64109770/209008527-a6ea6ca3-8b7d-4e72-a41f-b1ee632bbf73.png)

## Applications that I use
- **OS**: Arch linux
- **Shell**: Zsh for user, dash linked to /bin/sh
- **Window manager**: [dwm fork](https://github.com/mjkloeckner/dwm)
- **dwm status**: [dwmblocks-async](https://github.com/UtkarshVerma/dwmblocks-async)
- **Application launcher**: [dmenu fork](https://github.com/mjkloeckner/dmenu)
- **Term**: kitty and [my fork](https://github.com/mjkloeckner/dmenu) of
  suckless's simple terminal (st) on my laptop
- **Term font**: JetBrainsMono Nerd Font
- **dwm bar (and dmenu) font**: [Victor Mono Regular](https://rubjo.github.io/victor-mono/)
  and JoyPixels for emojis
- **Editor**: vim (neovim)
- **vim colorscheme**: gruvbox
- **Web browser**: Firefox
- **Login manager**: none, autologin on tty1 and starting Xorg from zsh with the
  following statement:

```console
# Starts the X server only on tty1
if [[ -z "$DISPLAY" ]] && [[ $(tty) = /dev/tty1 ]]; then
	startx 2> /dev/null
	logout
fi
```

- **Lockscreen**: i3lock custom [script](https://github.com/klewer-martin/scripts/blob/inspiron/lockscreen)
  (wrapper of [betterlockscreen](https://github.com/betterlockscreen/betterlockscreen))
- **Notifications**: Dunst 
- **Blue light filter**: redshift
- **Compositor**: jonaburg's picom fork (adds animations when changing
  workspaces in dwm)
- **Applications theme**: adwaita
- **Video player**: mpv
- **pdf viewer**: zathura

## Arch linux package installation

### Display server and graphics libraries
Starting from a vanilla arch linux installation you will need, first Xorg server
and some basic fonts

```
# pacman -S xorg xorg-server xorg-xinit ttf-dejavu ttf-joypixels
```

also make sure to install your graphics card drivers as well as common graphics
libraries, in the case of integrated intel hd graphics:

```
# pacman -S xf86-video-intel mesa mesa-utils
```

### System
```
# pacman -S zsh dash base-devel ssh git openssh xss-lock xbindkeys xcape dunst \
man-db man-pages
```

read more about why [dash](https://wiki.archlinux.org/title/Dash) on the arch
wiki

#### Zsh plugins installation
Run the following commands to clone the plugins into the zsh plugged folder,
then it should be sourced automatically from the .zshrc file
##### [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions)

```
$ git clone https://github.com/zsh-users/zsh-autosuggestions \
	~/.config/zsh/plugged/zsh-autosuggestions
```
##### [zsh-history-substring-search](https://github.com/zsh-users/zsh-history-substring-search)
```
$ git clone https://github.com/zsh-users/zsh-history-substring-search \
	~/.config/zsh/plugged/zsh-history-substring-search
```
##### [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting)
```
$ git clone https://github.com/zsh-users/zsh-syntax-highlighting.git
	~/.config/zsh/plugged/zsh-syntax-highlighting
```

### User applications
#### Official repositories
These are some packages from the offical repos that I use

```
# pacman -S neovim tmux kitty firefox dolphin dolphin-plugins gvfs gvfs-mtp \
gvfs-smb kio kio-extras kio-fuse adwaita-qt5 zathura zathura-pdf-mupdf \
zathura-pdf-djvu mpv xclip gnome-calculator redshift lxappearance qt5ct \
nitrogen feh translate-shell ueberzug scrot udisks2 gtk2 gtk3
```

#### Arch linux User Repositories
These are packages from the AUR (make sure you have an [AUR
helper](https://wiki.archlinux.org/title/AUR_helpers) installed)

```
$ yay -S betterlockscreen nerd-fonts-jetbrains-mono picom-jonaburg-git gitmux
```
