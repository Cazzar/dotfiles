#!/bin/zsh

# Directory listings
alias ls="ls --color=auto -F"
alias ll="ls -lah"
alias la="ls -A"

alias mem="free -m"

alias sass="sass -t expanded --no-cache"
alias sassw="sass --watch sass:css"
alias touchsass="find ./ -iname \"*.scss\" -exec touch \{\} \;"

alias grep="grep -n"
alias gitpatch="patch -u -p1"

# Open web addresses in the browser if one was set in zshrc.local
if [[ -n $BROWSER ]]; then
  alias -s html=$BROWSER
  alias -s org=$BROWSER
  alias -s com=$BROWSER
  alias -s net=$BROWSER
fi

