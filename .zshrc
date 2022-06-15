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
    pip
    zsh-autopair
    zsh-syntax-highlighting
)
source $ZSH/oh-my-zsh.sh
# Not oh-my-zsh, but sets up theme;
eval "$(oh-my-posh --init --shell zsh --config ~/dotfiles/.zsh_stuff/theme.json)"


# -EXPORTS-
export EDITOR=nvim
# Highlights anything with main.* as purple to exa
export EXA_COLORS='main.*=35'
# Makes direnv not log anything
export DIRENV_LOG_FORMAT=
# Changes man pages to be viewed with bat
export MANPAGER='sh -c "col -bx | bat --language man --plain"'
# z doesn't follow symlinks
export _Z_NO_RESOLVE_SYMLINKS=1
# Where extra zsh configurations are stored
export EXTRA_CONFIG_PATH="$HOME/.extra_zsh.zsh"
export DWNL="$HOME/Downloads"
export DTOP="$HOME/Desktop"


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
alias pb='pbcopy'
alias exa='exa --long --header --no-user --icons --no-permissions --git'
# Reads a symlink
alias fsym='readlink -f'
alias googlepip='pip install --upgrade google-api-python-client google-auth-httplib2 google-auth-oauthlib'
# Sets up a virtual environment for jupyter notebook
alias jupyter-venv="python -m ipykernel install --user --name=$1"
alias zrc="nvim $HOME/dotfiles/.zshrc"
alias ezrc="nvim $EXTRA_CONFIG_PATH"
alias vrc="nvim $HOME/dotfiles/.config/nvim/init.vim"
# Quick Look on a file
alias ql='quick-look'
# Creates local repo, makes new github repo, then pushes
alias newrepo='git init && gh repo create && git push --set-upstream origin main'
alias omzplugs='cd ~/.oh-my-zsh/custom/plugins'
# To perform calculations
alias cc='noglob calc'
# Alias for committing with a message and adding all
alias gcm='gcam'
# Makes bat the diff pager with no styling
alias gd='git diff | bat --plain'
# Amend git commit
alias gamm='git commit --amend'
# pip freeze into requirements.txt, but doesn't include pynvim
alias pipreq="pip freeze | rg '^(?!.*msgpack|greenlet|pynvim).*' --pcre2 > requirements.txt"
# Makes pip have to have venv to install to prevent accidental global installs
alias pipin='pip install --require-virtualenv'
alias pipw='which pip3'
alias pipf='pip freeze'
alias crn='crontab'
# Taskwarrior, see .taskrc for all taskwarrior configuration
alias t='task'
alias to='task tod'
alias tc='task code'
alias ta='task add'
alias tn='task next'
alias tt='taskwarrior-tui'
alias notif='terminal-notifier'
alias chx='chmod +x'
# Makes a new temp file and puts into editor
alias mkt='nvim $(mktemp)'


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
source "$HOME/dotfiles/.zsh_stuff/functions.zsh"
source $EXTRA_CONFIG_PATH

# -ZLE-
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


# -HIGHLIGHT STYLES-
typeset -A ZSH_HIGHLIGHT_STYLES
# Modifiers like sudo and command
ZSH_HIGHLIGHT_STYLES[precommand]="fg=blue,underline"
# The main part of commands
ZSH_HIGHLIGHT_STYLES[arg0]="fg=cyan"
# Keywords like for and if (purple)
ZSH_HIGHLIGHT_STYLES[reserved-word]='fg=#bb9af7'
# 'string', "string", and $"string"
ZSH_HIGHLIGHT_STYLES[single-quoted-argument]='fg=green'
ZSH_HIGHLIGHT_STYLES[double-quoted-argument]='fg=green'
ZSH_HIGHLIGHT_STYLES[dollar-quoted-argument]='fg=green'
# 'string and "string (red)
ZSH_HIGHLIGHT_STYLES[single-quoted-argument-unclosed]='fg=#db4b4b'
ZSH_HIGHLIGHT_STYLES[double-quoted-argument-unclosed]='fg=#db4b4b'
# - options (dark cyan)
ZSH_HIGHLIGHT_STYLES[single-hyphen-option]='fg=#0db9d7'
ZSH_HIGHLIGHT_STYLES[double-hyphen-option]='fg=#0db9d7'


# -PLUGIN SETUP-
# Sets up lf icons
source "$HOME/.config/lf/icons.zsh"
# Sets up lf that changes directory
source "$HOME/.config/lf/lfcd.sh"
