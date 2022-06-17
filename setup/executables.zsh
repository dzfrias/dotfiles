#!/usr/local/bin/zsh

# Splits file by line
executables=(${(f)"$(cat resources/executables.txt)"})
for executable in $executables; do
  # Makes files in glob pattern executable
  chmod +x ~/.dotfiles/${~executable}
done
