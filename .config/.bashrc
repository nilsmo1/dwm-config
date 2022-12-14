#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Alias
alias ls='ls --color=auto'
alias la='ls --color=auto -A'
alias lc='clear; ls'
alias ll='clear; ls --color=auto *'
alias die='shutdown now'
alias dwmupdate='sudo cp config.def.h config.h; sudo make clean install'
alias bb='sudo "$BASH" -c "$(history -p !!)"'
alias ghci='stack ghci'
alias py='python'
alias l1='ls -1'
alias grip='~/.local/bin/grip'
alias md='typora > /dev/null 2>&1 &'
alias netrestart='netctl restart TN_wifi_A20319-profile'
alias vim='nvim'

PS1='[\W] ~ '

if [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
  exec startx 
fi
