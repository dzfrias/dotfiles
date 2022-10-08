function ea() {
  # Counts files in current directory
  local file_amount=$(ls | wc -l)
  if [[ $file_amount -gt 10 ]]; then
    # Icons, directories first, and every file gets its own line
    command exa \
      --icons \
      --ignore-glob $EXA_IGNORE \
      --group-directories-first \
      --oneline \
      $@
  else
    # Icons and directories come first
    command exa --icons --ignore-glob $EXA_IGNORE --group-directories-first $@
  fi
}

function tea() {
  if [[ -f 'Cargo.toml' ]]; then
    # Only ignores the target directory if in a rust project
    ea -T --ignore-glob="$TEA_IGNORE|target" $@
  else
    ea -T --ignore-glob=$TEA_IGNORE $@
  fi
}

# Evaluates arguments in python with the math library
function calc() { python3 -c "from math import *; print($*);" }

function precmd() {
  # Newline after every prompt
  echo ''
  # Vertical cursor every prompt
  echo -ne '\e[6 q'
}
