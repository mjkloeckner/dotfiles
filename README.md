# Martin's linux configuration files

![screenshot](https://user-images.githubusercontent.com/64109770/137519364-6ff50046-669a-46a1-8d46-f88b4cf7a5cb.png "Arch linux btw xd")

* **OS**: Artix linux on my main computer, I also have *arch linux btw* intalled on my laptop
* **WM**: Currently DWM but I used i3wm for a while
* **SHELL**: Zsh with a couple of plugins, I used to use bash before I discover zsh
* **Term**: kitty because of the ligature support, I like alacritty also
* **Editor**: vim for code and sometimes vscode to write latex papers
* **Login Manager**: autologin on tty1 and starting Xserver from zshrc
```console
# Starts the X server only on tty1
if [[ -z "$DISPLAY" ]] && [[ $(tty) = /dev/tty1 ]]; then
	startx 2> /dev/null
logout
fi
```
* **Lockscreen**: i3lock custom [script](https://github.com/klewer-martin/scripts/blob/inspiron/lockscreen)
* **Notifications**: Dunst is started when X starts and the dunstify to send notifications
* **Blue light filter**: redshift
