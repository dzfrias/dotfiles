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
alias vrc='nvim ~/rcfiles/init.vim'
alias ql='quick-look'
alias newrepo='gh repo create'
alias omzplugs='cd ~/.oh-my-zsh/custom/plugins'
alias cc='noglob calc'


# -ENVIRONMENT VARIABLES-
export EDITOR=nvim
# Highlights anything with main.* as purple to exa
export EXA_COLORS='main.*=35'
# Makes direnv not log anything
export DIRENV_LOG_FORMAT=
# Changes man pages to be viewed with bat
export MANPAGER='sh -c "col -bx | bat -l man -p"'
# z doesn't follow symlinks
export _Z_NO_RESOLVE_SYMLINKS=1


# -BINDKEYS-
# inoremap jk <Esc> for the command line
bindkey jk vi-cmd-mode
# # Binds shift-tab to accept autosuggestions
bindkey '^[[Z' autosuggest-accept
# Binds search keys
bindkey '^K' up-line-or-search
bindkey '^J' down-line-or-search
bindkey -s '^P' 'cd ~/iCloud/Python^M'
bindkey -s '^R' 'cd ~/iCloud/Rust^M'
bindkey -s '^X' 'cd ~/iCloud/Executables^M'
bindkey -s '^W' 'cd ~/iCloud/Web^M'
bindkey -s '^N' 'cd ~/iCloud/Markdown^M'
bindkey -s 'uu' 'cd ..^M'


# -FUNCTIONS-
function g+ {
    if [[ ${1: -4} != ".cpp" ]]; then
        # Adds .cpp to first input if there isn't one already
        1="${1}.cpp"
    fi
    if [[ $# != 2 ]]; then
        # If only one argument is given, sets the terminal output to be
        # the first argument without .cpp
        2="${1:s/.cpp/}"
    fi
    # Run special C++ configuration with C++20
    g++ -std=c++20 $1 -o $2 && "$PWD/"$2
}

function gdocs {
    s=$PWD
    cd "$HOME/Library/Mobile Documents/com~apple~CloudDocs/My Code/gdocs"
    activate
    py main.py $1 $2 $s
    deactivate
    cd $s
    unset s
}

function ea {
    amount=`ls | wc -l | xargs`
    if [ $amount -gt 10 ]; then
        command exa --icons -I My\ Code --group-directories-first -1 $@
        return
    fi
    command exa --icons -I My\ Code --group-directories-first $@
    unset amount
}

function tea {
    if [[ $PWD =~ "Rust" ]]; then
        # Only ignores the target directory if in a rust project
        ea -T --ignore-glob="__pycache__|venv|My\ Code|target" $@
        return
    fi
    ea -T --ignore-glob="__pycache__|venv|My\ Code" $@
}

function nvim {
    # Used specifically for C++ coding so a .cpp doesn't have to be added
    # after each file
    string=$(file $1)
    # This substring appears in all executables made by C++
    substring="Mach-O 64-bit executable x86_64"
    # Tests if the file type contains the substring
    if test "${string#*$substring}" != "$string"; then
        1="${1}.cpp"
    fi
    command nvim $1
}

function mj {
    if [[ $1 == "prev" ]]; then
        out=`$HOME/iCloud/Executables/mj jump $2`
        last_dir=$PWD
        cd $out
        pwd
        echo
        ls
        cd $last_dir
        unset last_dir
        return
    fi
    out=`$HOME/iCloud/Executables/mj $1 $2`
    if [[ $1 == "jump" || $1 == "undo" ]]; then
        cd $out
    fi
}

function rclean {
    # Cleans specific words from current git repo
    touch temp_remove.txt
    for text in "$@"
    do
        # Puts each argument into the temporary file
        echo $text > temp_remove.txt
    done
    rm temp_remove.txt
    # Clean file's contents throughout the repo
    bfg --replace-text temp_remove.txt .git
    git reflog expire --expire=now --all && git gc --prune=now --aggressive
    # Removes extraneous files
    rm -r .git.bfg-report
    git push --force
}

function gitsetup {
    # Sets up a git repository in current folder
    git init
    git add .
    git commit -m 'Initial commit'
    git remote add origin $1
    git remote -v
    git branch -m main
    git push origin -u main
}

function gclass {
    s=$PWD
    cd "$HOME/Library/Mobile Documents/com~apple~CloudDocs/My Code/gclass"
    activate
    py main.py
    deactivate
    cd $s
    unset s
}

function gal {
    printf '%s\n' $aliases[$1]
}

function calc() {
    python3 -c "from math import *; print($*);"
}

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

precmd() {
    # Newline after every prompt
    print ""
    # Vertical cursor every prompt
    echo -ne '\e[6 q'
}

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
