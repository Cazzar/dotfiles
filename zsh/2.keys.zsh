
KEY_FILE="${ZDOTDIR:-$HOME}/.zkbd/${TMUX_TERM:-$TERM}-$VENDOR-$OSTYPE"

if [[ -f $KEY_FILE ]]; then
  source $KEY_FILE
elif [[ ${#terminfo} > 0 ]]; then
  typeset -g -A key
  
  key[Home]=${terminfo[khome]}
  key[End]=${terminfo[kend]}
  key[Insert]=${terminfo[kich1]}
  key[Delete]=${terminfo[kdch1]}
  key[Up]=${terminfo[kcuu1]}
  key[Down]=${terminfo[kcud1]}
  key[Left]=${terminfo[kcub1]}
  key[Right]=${terminfo[kcuf1]}
  key[PageUp]=${terminfo[kpp]}
  key[PageDown]=${terminfo[knp]}
else
  echo "Unable to find keybindings file at $KEY_FILE and no terminfo available. Taking a wild guess with keybindings."
  echo 'Please run `autoload zkbd; zkbd` to create a keybinding file.'
  if [[ -n $TMUX_TERM ]]; then
    echo "Please be aware that we will include based on TMUX_TERM but xkbd will create it's file based on TERM; you will need to rename the generated file."
  fi
  echo

  typeset -g -A key
  key[Home]="^[[1~"
  key[End]="^[[4~"
  key[PageUp]="^[[5~"
  key[PageDown]="^[[6~"
  key[Insert]="^[[2~"
  key[Delete]="^[[3~"
fi

[[ -n "${key[Home]}"     ]]  && bindkey  "${key[Home]}"     beginning-of-line
[[ -n "${key[End]}"      ]]  && bindkey  "${key[End]}"      end-of-line
[[ -n "${key[Insert]}"   ]]  && bindkey  "${key[Insert]}"   overwrite-mode
[[ -n "${key[Delete]}"   ]]  && bindkey  "${key[Delete]}"   delete-char
[[ -n "${key[Up]}"       ]]  && bindkey  "${key[Up]}"       up-line-or-history
[[ -n "${key[Down]}"     ]]  && bindkey  "${key[Down]}"     down-line-or-history
[[ -n "${key[Left]}"     ]]  && bindkey  "${key[Left]}"     backward-char
[[ -n "${key[Right]}"    ]]  && bindkey  "${key[Right]}"    forward-char
[[ -n "${key[PageUp]}"   ]]  && bindkey  "${key[PageUp]}"   beginning-of-history
[[ -n "${key[PageDown]}" ]]  && bindkey  "${key[PageDown]}" end-of-history

bindkey '^R' history-incremental-search-backward

# Alt-Right
bindkey "^[[1;3C" forward-word
bindkey "^[^[[1;3C" forward-word
bindkey "^[f" forward-word
bindkey "^[Oc" emacs-forward-word

# Alt-Left
bindkey "^[[1;3D" backward-word
bindkey "^[^[[1;3D" backward-word
bindkey "^[b" backward-word
bindkey "^[Od" emacs-backward-word

# Shift-Tab
bindkey "^[[Z" reverse-menu-complete

unset KEY_FILE
