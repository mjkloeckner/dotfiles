# Martin's linux configuration files

![18-55-27_29-03-2022_scrot](https://user-images.githubusercontent.com/64109770/160713617-4e0bd90c-f65a-4332-a96c-7f7a83dcaafc.png)

* **OS**: Artix linux on my main computer, I also have *arch linux btw* intalled on my laptop
* **WM**: Currently DWM but I used i3wm for a while
* **SHELL**: Zsh with a couple of plugins, I used to use bash before I discover zsh
* **Term**: kitty because of the ligature support, I like alacritty also
* **Editor**: vim for code and sometimes vscode to write latex papers
* **Web Browser**: Mozilla Firefox
* **Login Manager**: autologin on tty1 and starting Xserver from zshrc
```console
# Starts the X server only on tty1
if [[ -z "$DISPLAY" ]] && [[ $(tty) = /dev/tty1 ]]; then
	startx 2> /dev/null
logout
fi
```
* **Lockscreen**: i3lock custom [script](https://github.com/klewer-martin/scripts/blob/inspiron/lockscreen)
* **Notifications**: Dunst is started when X starts and dunstify to send notifications
* **Blue light filter**: redshift
