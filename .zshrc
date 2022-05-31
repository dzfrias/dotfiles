# -OH-MY-ZSH-
export ZSH="$HOME/.oh-my-zsh"
plugins=(
    git
    zsh-autosuggestions
    z
    ripgrep
    fd
    direnv
    macos
    web-search
    thefuck
    alias-tips
    autoupdate
)
source $ZSH/oh-my-zsh.sh
# Not oh-my-zsh, but sets up theme
eval "$(oh-my-posh --init --shell zsh --config ~/.oh-my-zsh/themes/jandedobbeleer.omp.json)"


# -ALIASES-
alias ex='exit'
alias ls='ls -G'
alias py='python3'
# Views the markdown file
alias md="command nvim $1 -c 'MarkdownPreview'"
alias reload='exec zsh'
# In case of mistype
alias relaod='reload'
# Creates a new virtual environment with global packages included
alias venv='echo "layout python-venv" > .envrc && direnv allow .'
alias activate='source venv/bin/activate'
# Takes whatever is piped and copies it to clipboard (and prints it)
alias pb='pbcopy'
# Turns json dictionaries into json files
alias exa='exa -l -h --no-user --icons --no-permissions --git'
alias fsym='readlink -f'
alias googlepip='pip install --upgrade google-api-python-client google-auth-httplib2 google-auth-oauthlib'
# Sets up a virtual environment for jupyter notebook
alias jupyter-venv="python -m ipykernel install --user --name=$1"
alias pyjson="py '$HOME/Library/Mobile Documents/com~apple~CloudDocs/My Code/shell/pyjson.py' $1 $2"
alias opts="py '$HOME/Library/Mobile Documents/com~apple~CloudDocs/My Code/shell/man_opts.py' $1 $2"
alias nodeps="py '$HOME/Library/Mobile Documents/com~apple~CloudDocs/My Code/shell/nodeps.py'"
alias zrc='nvim ~/.zshrc'
alias vrc='nvim ~/dotfiles/init.vim'
# Quick Look on a file
alias ql='quick-look'
alias newrepo='gh repo create'
alias omzplugs='cd ~/.oh-my-zsh/custom/plugins'
# To perform calculations
alias cc='noglob calc'


# -EXPORTS & VARIABLES-
export EDITOR=nvim
# Highlights anything with main.* as purple to exa
export EXA_COLORS='main.*=35'
# Makes direnv not log anything
export DIRENV_LOG_FORMAT=
# Changes man pages to be viewed with bat
export MANPAGER='sh -c "col -bx | bat -l man -p"'
# z doesn't follow symlinks
export _Z_NO_RESOLVE_SYMLINKS=1
DWNL="$HOME/Downloads"
DTOP="$HOME/Desktop"


# -BINDKEYS-
# inoremap jk <Esc> for the command line
bindkey jk vi-cmd-mode
# Binds shift-tab to accept autosuggestions
bindkey '^[[Z' autosuggest-accept
# Binds search keys
bindkey '^K' up-line-or-search
bindkey '^J' down-line-or-search
# Binds these keys to write and enter the corresponding commands
bindkey -s '^P' 'cd ~/iCloud/Python^M'
bindkey -s '^R' 'cd ~/iCloud/Rust^M'
bindkey -s '^X' 'cd ~/iCloud/Executables^M'
bindkey -s '^W' 'cd ~/iCloud/Web^M'
bindkey -s '^N' 'cd ~/iCloud/Markdown^M'
bindkey -s 'uu' 'cd ..^M'


# -FUNCTIONS-
source "$HOME/dotfiles/.functions.zsh"


# -ZLE-
function zle-line-init {
   RPS1="${${KEYMAP/vicmd/-- NORMAL --}/(main|viins)/-- INSERT --}"
   RPS2=$RPS1
   zle reset-prompt
}

function zle-keymap-select {
  # Change visual text showing which mode
  RPS1="${${KEYMAP/vicmd/-- NORMAL --}/(main|viins)/-- INSERT --}"
  RPS2=$RPS1
  zle reset-prompt

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
zle -N zle-line-init
zle -N zle-keymap-select

# -HIGHLIGHT STYLES-
typeset -A ZSH_HIGHLIGHT_STYLES
ZSH_HIGHLIGHT_STYLES[suffix-alias]="fg=blue,underline"
ZSH_HIGHLIGHT_STYLES[precommand]="fg=blue,underline"
ZSH_HIGHLIGHT_STYLES[arg0]="fg=cyan"


# -PLUGIN SETUP-
# Sets up syntax highlighting
source "$HOME/.scripts/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
# Sets up lf icons
source "$HOME/.config/lf/icons.zsh"
# Sets up lf that changes directory
source "$HOME/.config/lf/lfcd.sh"
