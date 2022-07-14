# Grey out hidden apps
defaults write com.apple.Dock showhidden -boolean yes

# Default to list view in Finder
defaults write com.apple.Finder FXPreferredViewStyle Nlsv

# Show file extensions in Finder
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# Disable press and hold
defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false

# Make finder quit with CMD-Q
defaults write com.apple.finder QuitMenuItem -bool true
