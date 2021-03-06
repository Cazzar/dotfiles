#!/bin/zsh

# Directory listings
alias ls="ls --color=auto -F"
alias ll="ls -lah"
alias la="ls -A"

alias mem="free -m"

alias php-xdebug="php -dxdebug.remote_autostart=On"

alias please='sudo $(fc -ln -1)'

alias sum="awk '{ s += \$1; } END { print s}'"

alias which='type -a'
alias manthat='man $(fc -ln -1 | awk -F" " "{print \$1}")'
alias dirs='dirs -v'

alias rmempty='find . -type d -empty -delete'

alias svim='sudo -E $EDITOR'
alias svi='sudo -E $EDITOR'

alias systemctl='sudo systemctl'

alias used='df -h | grep -v "loop\|tmpfs\|dev \|run"'
