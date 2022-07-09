# Open the closest matching repo to the first argument


if [[ $# != 1 ]]; then
  echo 'Usage: gh o [repo]'
  return 1
fi

local repos=$(gh repo list --json 'name' --jq '.[].name')

local matches=()
local repo
# Split into array by newline
for repo in ${(f)repos}; do
  # Check if repo matches glob pattern
  if [[ $repo == *$1* ]]; then
    matches+=$repo
  fi
done

if [[ ${#matches} == 0 ]]; then
  echo 'No repos found'
  unset matches
  return 1
fi

if [[ ${#matches} != 1 ]]; then
  for match in $matches; do
    if [[ $match == $1 ]]; then
      local url=$(gh repo view $match --json 'url' --jq '.url')
      osascript ~/.dotfiles/misc/config/gh/functions/resources/_open.scpt $url
      unset matches
      return 0
    fi
  done
  # Join array by ', '
  echo "Multiple repos found: ${(pj:, :)matches}"
  unset matches
  return 1
fi

local url=$(gh repo view $matches --json 'url' --jq '.url')
osascript ~/.dotfiles/misc/config/gh/functions/resources/_open.scpt $url

unset matches
