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
alias wolkanade='wol BC:5F:F4:47:3D:44'

alias dc='docker-compose -f /var/docker/docker-compose.yml'
alias mysqldump='docker exec mariadb mysqldump'
alias rmempty='find . -type d -empty -delete'

alias svim='sudo -E $EDITOR'
alias svi='sudo -E $EDITOR'

alias systemctl='sudo systemctl'
