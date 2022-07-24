# percent gets the language usage percentage of a git repository, mirrors the
# behavior of the 'Languages' section of a GitHub repository's homepage.


# Get the name and size of every language in the repo, of the form "NAME\nSIZE"
local results=$(
gh repo view \
  --json 'languages' \
  --jq '.languages.[] | .node.name, .size'
)
# Split the results into an array by newlines
local data=(${(f)results})

# Declare an associative array
local -A ordered_data
local total=0.0

local i
for (( i=1; i<=${#data}; i++ )); do
  # If the index of the item is even, it will be a size, so add it to the total
  if (( i % 2 == 0 )); then
    local total=$((total + ${data[i]}))
  # Otherwise it's the name of the language
  else
    ordered_data[${data[i]}]=${data[i+1]}
  fi
done

local language
local size
for language size in ${(kv)ordered_data}; do
  # Get percentage of total size of the language as a float
  local -F percentage=$((size * 100 / total))
  # Print the percentage rounded to one decimal place
  printf "%s: %.1f%%\n" $language $percentage
# Sort by size
done | sort --field-separator=':' --key=2 --ignore-leading-blanks --general-numeric-sort --reverse
