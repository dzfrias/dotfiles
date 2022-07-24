# new sets up a git repository in the current directory along with a remote
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

# Only used to check if in git repo, so supress all output
git status > /dev/null 2>&1
# Check if in a git repo
local code=$?
if [[ $code == 128 ]]; then
  git init

  # Add a README if no other files exist in the directory
  local file_count=$(ls | wc -l)
  if [[ $file_count -eq 0 ]]; then
    touch README.md
    # Get the endmost part of $PWD and puts it into README.md
    echo "# ${PWD:t}" >> README.md
  fi

  # Add to the new repo
  git add --all
  git commit --message='Initial commit'
else
  git commit
fi

# Create a new GitHub repo
gh repo create $1 $view_status --remote origin --source .
git push --set-upstream origin main
echo 'All set up!'
