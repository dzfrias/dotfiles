function ea() {
  # Counts files in current directory
  local file_amount=$(ls | wc -l)
  if [[ $file_amount -gt 10 ]]; then
    # Icons, directories first, and every file gets its own line
    command exa \
      --icons \
      --ignore-glob \
      --group-directories-first \
      --oneline \
      $@
  else
    # Icons and directories come first
    command exa --icons --ignore-glob --group-directories-first $@
  fi
}

function tea() {
  if [[ -f 'Cargo.toml' ]]; then
    # Only ignores the target directory if in a rust project
    ea -T --ignore-glob "venv|__pycache__|.git|target" $@ --group-directories-first
  else
    ea -T --ignore-glob "venv|__pycache__|.git|node_modules" $@ --group-directories-first
  fi
}

function precmd() {
  # Newline after every prompt
  echo ''
}
