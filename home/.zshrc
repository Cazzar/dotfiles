if [[ "$(uname)" == "Darwin" ]]; then
    export ZPLUG_HOME="$(brew --prefix)/opt/zplug"
else
    export ZPLUG_HOME=~/.zplug
fi
source $ZPLUG_HOME/init.zsh

#self manage zplug
zplug 'zplug/zplug', hook-build:'zplug --self-manage'

zplug "plugins/git", from:oh-my-zsh
zplug "plugins/colorize", from:oh-my-zsh
zplug "plugins/redis-cli", from:oh-my-zsh
zplug "plugins/tmux", from:oh-my-zsh
zplug "plugins/urltools", from:oh-my-zsh
zplug "romkatv/powerlevel10k", as:theme, depth:1
zplug "Cazzar/zsh-config"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh

# fpath=( ~/.zsh/functions "${fpath[@]}" )
# for f in ~/.zsh/functions/*; do
#   autoload -Uz $(basename $f)
# done
[[ -f ~/.zsh/1.alias.zsh ]] && source ~/.zsh/1.alias.zsh

HISTFILE=${ZDOTDIR:-$HOME}/.zsh_history
HISTSIZE=2000
SAVEHIST=1000

autoload bashcompinit
bashcompinit

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

# Then, source plugins and add commands to $PATH
zplug load

eval "$(zoxide init zsh)"

eval "$(~/.local/bin/mise activate zsh)"

