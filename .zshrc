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


# -EXPORTS & VARIABLES-
export EDITOR=nvim
# Highlights anything with main.* as purple to exa
export EXA_COLORS='main.*=35'
# Makes direnv not log anything
export DIRENV_LOG_FORMAT=
# Changes man pages to be viewed with bat
export MANPAGER='sh -c "col -bx | bat --language man --plain"'
# z doesn't follow symlinks
export _Z_NO_RESOLVE_SYMLINKS=1
export EXTRA_CONFIG_PATH="$HOME/.extra_zsh.zsh"
DWNL="$HOME/Downloads"
DTOP="$HOME/Desktop"


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
alias exa='exa --long --header --no-user --icons --no-permissions --git'
# Reads a symlink
alias fsym='readlink -f'
alias googlepip='pip install --upgrade google-api-python-client google-auth-httplib2 google-auth-oauthlib'
# Sets up a virtual environment for jupyter notebook
alias jupyter-venv="python -m ipykernel install --user --name=$1"
alias zrc='nvim ~/.zshrc'
alias ezrc="nvim $EXTRA_CONFIG_PATH"
alias vrc='nvim ~/dotfiles/.config/nvim/init.vim'
# Quick Look on a file
alias ql='quick-look'
alias newrepo='gh repo create'
alias omzplugs='cd ~/.oh-my-zsh/custom/plugins'
# To perform calculations
alias cc='noglob calc'
# Alias for committing with a message
alias gcm='gcmsg'
# Makes bat the diff pager
alias gd='git diff | bat'
# pip freeze into requirements.txt, but doesn't include pynvim
alias pypkgs="pip freeze | rg '^(?!.*msgpack|greenlet|pynvim).*' --pcre2 > requirements.txt"


# -BINDKEYS-
# Maps jk to normal mode in the zsh line editor
bindkey jk vi-cmd-mode
# Binds shift-tab to accept autosuggestions
bindkey '^[[Z' autosuggest-accept
# Binds search keys
bindkey '^K' up-line-or-search
bindkey '^J' down-line-or-search
# Clears the prompt, writes the text, and enters it
bindkey -s 'uu' '^Ucd ..^M'
bindkey -s '^H' '^Ucd ~/dotfiles^M'


# -FUNCTIONS-
source "$HOME/dotfiles/.functions.zsh"
source $EXTRA_CONFIG_PATH

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
