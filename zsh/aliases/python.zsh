# -GENERAL-
alias python='python3'
alias py='python3'
# Activates virtual environment
alias activate='source venv/bin/activate'
# Creates a new virtual environment with global packages included
alias venv='echo "layout python-venv" > .envrc && direnv allow .'
# Sets up a virtual environment for jupyter notebook
alias jupyter-venv="python -m ipykernel install --user --name=$1"


# -PIP-
# Makes pip have to have venv to install to prevent accidental global installs
alias pipi='pip install --require-virtualenv'
alias pipw='which pip3'
alias pipf='pip freeze'
# Installs the google api client into the virtual environment
alias googlepip='pip install --upgrade google-api-python-client google-auth-httplib2 google-auth-oauthlib'
