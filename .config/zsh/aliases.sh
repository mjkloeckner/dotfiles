# alias sv='sudo nvim'
alias bat='bat -pp'
alias cal='cal -3'
alias cdwm='cd $HOME/.config/dwm && $EDITOR config.def.h'
alias ckitty='$EDITOR $HOME/.config/kitty/kitty.conf'
alias cnvim='$EDITOR $HOME/.config/nvim/init.vim'
alias cp='cp -iv'
alias de:en="trans de:en"
alias dev='tmux attach-session -t dev || tmux new-session -s dev'
alias devbox='ssh -Y mk@192.168.0.101'
alias df='df -h | grep -v snapd'
alias diff='diff --color=auto'
alias en:de="trans en:de"
alias en:es="trans en:es"
alias es:en="trans en:es"
alias f='fzf'
alias g='git'
alias gaa='git add .'
alias gbr="git branch"
alias gc='git commit'
alias gck='git checkout'
alias gcm='git commit -m'
alias glg="git --no-pager log --pretty --graph --decorate --color=always \
	--oneline"
alias glgf="git --no-pager log --graph --abbrev-commit --decorate \
	--format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) \
	%C(white)%s%C(reset) %C(dim white)- %an%C(reset)%C(bold yellow)%d%C(reset)'\ 
	--all; echo"
alias glgt="git --no-pager log --graph --abbrev-commit --decorate \
	--format=format:'%C(bold blue)%h%C(reset) %C(white)%s\
	%C(reset)%C(bold yellow)%d%C(reset)' --all; echo"
alias gpl='git pull'
alias gps='git push'
alias grep='grep --color=auto'
alias gst='git status'
alias j='jobs'
alias l='ls --color=auto'
alias la='ls --color=auto -oah'
alias less='less -f'
alias lf='lfrun'
alias lf_='lf'
alias ll='ls --color=auto -oh'
alias ls='ls --color=auto --group-directories-first'
alias matrix='unimatrix -s 96 -l o -a -f'
alias mkdir='mkdir -v'
alias mv='mv -vi'
alias news='newsboat'
alias nvi='nvim'
alias open='xdg-open'
alias py='python'
alias r='ranger'
alias sdcv='sdcv --color'
alias ss='sudo systemctl'
alias svim='sudo nvim'
alias tree='tree --dirsfirst -C'
alias vi='vim'
alias vim='nvim'
alias wget='wget --hsts-file ~/.cache/wget-hsts'
alias xclip='xclip -selection clipboard'
