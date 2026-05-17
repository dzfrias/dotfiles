# Changes man pages to be viewed with bat
export MANPAGER='sh -c "col -bx | bat --language man --plain"'
export FZF_DEFAULT_COMMAND='fd --type file --hidden'
export FZF_DEFAULT_OPTS="\
  --preview-window=up \
  --black \
  --bind='ctrl-f:preview-half-page-down,ctrl-b:preview-half-page-up'"

# Prompt
source ~/.dotfiles/extra/zsh-plugins/agkozak-zsh-prompt/agkozak-zsh-prompt.plugin.zsh
export AGKOZAK_LEFT_PROMPT_ONLY=1
export AGKOZAK_CMD_EXEC_TIME=0
export AGKOZAK_BLANK_LINES=1

source ~/.dotfiles/extra/zsh-plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.dotfiles/extra/zsh-plugins/almostontop/almostontop.plugin.zsh

# Load fzf stuff
source <(fzf --zsh)

export FPATH="$HOME/.zcomp:${FPATH}"
# Load completions
autoload -Uz compinit
compinit

precmd () {
  # Reset cursor to vertical line
  echo -ne '\e[6 q'
}

alias ls='eza --long --header --no-user --icons --no-permissions --git --group-directories-first'
alias tree='eza --tree --icons --group-directories-first --git-ignore'
alias reload='exec zsh'

rec () {
  : ${1:=~/Downloads}
  command ls "$1" | fzf | xargs -I{} mv "$1/{}" .
}

mkt () {
  local random=$RANDOM
  mkdir "/tmp/$random"
  cd "/tmp/$random"
}

root () {
  local start=$PWD

  while [[ $PWD != $HOME && ! -f LICENSE && ! -d .git && ! -f README.md ]]; do
    cd ..
  done

  pushd $start > /dev/null
  cd - > /dev/null
}

# Start prompt with solid line
echo -ne '\e[6 q'

setopt NO_NOMATCH
setopt NOTIFY

# Maps jk to normal mode in the zsh line editor
bindkey jk vi-cmd-mode
# Clears the prompt, writes the text, and enters it
bindkey -s 'uu' '^Ucd ..^M'
bindkey '^P' up-line-or-history
bindkey '^N' down-line-or-history

function zle-keymap-select {
  # Change cursor for depending on the mode
  if [[ ${KEYMAP} == vicmd ]] || [[ $1 = 'block' ]]; then
    echo -ne '\e[2 q'
  elif [[ ${KEYMAP} == main ]] ||
    [[ ${KEYMAP} == viins ]] ||
    [[ ${KEYMAP} = '' ]] ||
    [[ $1 = 'beam' ]]; then
    echo -ne '\e[6 q'
  fi
}
zle -N zle-keymap-select
