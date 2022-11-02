#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Alias
alias ls='ls --color=auto'
alias la='ls --color=auto -a'
alias lc='clear; ls'
alias ll='clear; ls --color=auto *'
alias die='shutdown now'
alias dwmupdate='sudo cp config.def.h config.h; sudo make clean install'
alias bb='sudo "$BASH" -c "$(history -p !!)"'
alias ghci='stack ghci'
alias py='python'
alias l1='ls -1'
alias pdf='zathura'
alias grip='~/.local/bin/grip'
alias md='typora > /dev/null 2>&1 &'

PS1='[\u@\h \W]\$ '
if [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
  exec startx 
fi
