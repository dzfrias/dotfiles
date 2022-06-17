#!/usr/local/bin/zsh

function home() {
  # Symlinks files in home.txt to their appropriate destination. Lines in the
  # home.txt are of the form '$src $dest' where $dest can be optional. If $dest
  # is not specified, the file will be symlinked to be $HOME

  # Splits home.txt into an array of lines
  local home_files=(${(f)"$(cat home.txt)"})

  # So the iter variables are local
  local home_file=
  for home_file in $home_files; do
    # Splits each line by word
    local info=(${=home_file})
    local src="~/.dotfiles/$info[1]"
    local dest=$info[2]

    local match=
    # Turns $src into a glob pattern
    for match in ${~src}; do
      # Checks if $dest is empty
      if [[ -z $dest ]]; then
        # Gets only the file name of the path with :t
        ln -s $src ~/.${match:t}
      else
        # Turns $dest into a glob pattern (so tilde is expanded)
        ln -s $src ${~dest}
      fi
    done
  done
}

function config() {
  # Symlinks all directories in config into the ~/.config directory

  local config_dir=
  # Everything in the config dir
  for config_dir in ~/.dotfiles/config/*; do
    ln -s $config_dir ~/.config
  done
}

home
config
