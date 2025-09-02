# .bashrc for isak

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Aliases
alias ls='ls --color=auto'
alias py='python3'
alias du='du -h'
alias grep='grep -i'
alias vim='nvim'
alias hx='helix'
alias language='languagetool --http --config server.properties --port 8081 --public --allow-origin "*"'
alias prog='cd ~/Dropbox/Programming/'
export EDITOR="nvim"


xset r rate 200 30 # Set repeat rate of holding down keys. NOTE: Only works on X11.
# setxkbmap -option caps:escape # Bind caps lock to escape (more useful)
export EDITOR=nvim
export host=192.168.50.135
export PATH=$PATH:$HOME/bin
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx
export WINIT_UNIX_BACKEND=x11
export PATH="$HOME/.nimble/bin:$PATH"

fuzzy-change-dir() {
	local dir
	dir="$(fd -t d . ~ | fzf)"
	cd "$dir"
}

bind -x '"\C-f":fuzzy-change-dir; ls -l'

# Colors:
PS1="\[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h:\[\033[33;1m\]\W\[\033[m\]\$ "
PS2='> '


if command -v pyenv 1>/dev/null 2>&1; then
   eval "$(pyenv init - bash)" 
fi
