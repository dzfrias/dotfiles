function g+() {
  if [[ ${1: -4} != ".cpp" ]]; then
    # Adds .cpp to first input if there isn't one already
    1="${1}.cpp"
  fi
  if [[ $# != 2 ]]; then
    # If only one argument is given, sets the terminal output to be
    # the first argument without .cpp
    2="${1:s/.cpp/}"
  fi
  # Compiles with C++20
  g++ -std=c++20 $1 -o $2 && "$PWD/"$2
}

function ea() {
  local file_amount=$(ls | wc -l | xargs)
  if (( $file_amount > 10 )); then
    command exa \
      --icons \
      --ignore-glob $EXA_IGNORE \
      --group-directories-first \
      --oneline \
      $@
  else
    command exa --icons --ignore-glob $EXA_IGNORE --group-directories-first $@
  fi
}

function tea() {
  if [[ $PWD =~ 'Rust' ]]; then
    # Only ignores the target directory if in a rust project
    ea -T --ignore-glob="$TEA_IGNORE|target" $@
  else
    ea -T --ignore-glob=$TEA_IGNORE $@
  fi
}

function gitsetup() {
  # Sets up a git repository in current folder
  git init
  git add .
  git commit -m 'Initial commit'
  git remote add origin $1
  git remote --verbose
  git branch -m main
  git push origin --set-upstream main
}

function gal() {
  # Shows what an alias is aliased to
  printf '%s\n' $aliases[$1]
}

function calc() {
  # Evaluates arguments in python with the math library
  python3 -c "from math import *; print($*);"
}

function precmd() {
  # Newline after every prompt
  print ''
  # Vertical cursor every prompt
  echo -ne '\e[6 q'
}
