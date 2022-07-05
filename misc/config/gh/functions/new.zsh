# Sets up a git repository in the current directory along with a remote
# repository on GitHub. The first argument is the name, the second is either
# pub[lic] or pri[vate].


if [[ $# != 2 ]]; then
  echo 'Need two arguments of the form: NAME VIEW_STATUS'
  return 1
fi

case $2 in
  'private' || 'pri')
    local view_status='--private'
    ;;
  'public' || 'pub')
    local view_status='--public'
    ;;
  *)
    echo 'Invalid view status. Must be "pub[lic]" or "pri[vate]"'
    return 1
esac

# New git repo
git init

# Adds a README if no other files exist in the directory
local file_count=$(ls | wc -l)
if [[ $file_count -eq 0 ]]; then
  touch README.md
  # Gets the endmost part of $PWD and puts it into README.md
  echo "# ${PWD:t}" >> README.md
fi

# Adds to the new repo
git add --all
git commit --message='Initial commit'

# Creates a new GitHub repo interactively
gh repo create $1 $view_status --remote origin --source .
git push --set-upstream origin main
echo 'All set up!'