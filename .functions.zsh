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
                ea -T --ignore-glob="$EXA_IGNORE|target" $@
                return
        fi
        ea -T --ignore-glob=$EXA_IGNORE $@
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

function gal {
        printf '%s\n' $aliases[$1]
}

function calc() {
        python3 -c "from math import *; print($*);"
}

function precmd() {
        # Newline after every prompt
        print ""
        # Vertical cursor every prompt
        echo -ne '\e[6 q'
}


