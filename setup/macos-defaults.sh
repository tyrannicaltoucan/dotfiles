#!/usr/bin/env bash

# -----------------------------------------------
# System
# -----------------------------------------------

# Always use overlay scrollbars
defaults write NSGlobalDomain AppleShowScrollBars -string "WhenScrolling"

# Expand save file dialogs
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode2 -bool true

# Disable the automatic termination of inactive apps
defaults write NSGlobalDomain NSDisableAutomaticTermination -bool true

# Disable various text "features"
defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false
defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false

# Enable trackpad tap clicking
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1

# Disable the press-and-hold feature in favor of key repeat
defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false

# Change key repeat speed
defaults write NSGlobalDomain KeyRepeat -int 1

# Shorten the delay before activating key repeat
defaults write NSGlobalDomain InitialKeyRepeat -int 15

# -----------------------------------------------
# Dock
# -----------------------------------------------

# Resize dock items to 48 pixels
defaults write com.apple.dock tilesize -int 48

# Disable mouse based dock resizing
defaults write com.apple.Dock size-immutable -bool true

# Add a bottom-left hotcorner for turning off displays (activates when command key is pressed)
defaults write com.apple.dock wvous-bl-corner -int 10
defaults write com.apple.dock wvous-bl-modifier -int 1048576

# Change the window minimizing animation
defaults write com.apple.dock mineffect -string "scale"

# Enable dock autohiding
defaults write com.apple.dock autohide -bool true

# Don't show recent applications on the dock
defaults write com.apple.dock show-recents -bool false

# -----------------------------------------------
# Finder
# -----------------------------------------------

# Always use list view
defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"

# Always show directories before files
defaults write com.apple.finder _FXSortFoldersFirst -bool true

# When performing a search, only search in the current directory
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"

# Disable warnings when changing file extensions
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

# Disable warning when emptying the trash
defaults write com.apple.finder WarnOnEmptyTrash -bool false

# Show the user's hidden library directory
chflags nohidden "$HOME/Library" && xattr -d com.apple.FinderInfo "$HOME/Library" &> /dev/null

# Expand the following File Info panes
defaults write com.apple.finder FXInfoPanesExpanded -dict \
    General -bool true \
    OpenWith -bool true \
    Privileges -bool true

# -----------------------------------------------
# Safari
# -----------------------------------------------

# Stop Safari from opening "safe" files automatically after downloading
defaults write com.apple.Safari AutoOpenSafeDownloads -bool false

# Disable spell checking in Safari
defaults write com.apple.Safari WebContinuousSpellCheckingEnabled -int 0

# -----------------------------------------------
# Activity Monitor
# -----------------------------------------------

# Display CPU usage in Activity Monitor's Dock icon
defaults write com.apple.ActivityMonitor IconType -int 5

# Show all processes in Activity Monitor
defaults write com.apple.ActivityMonitor ShowCategory -int 0

# -----------------------------------------------
# Miscellaneous
# -----------------------------------------------

# Stop Time Machine from asking if new drives should be used as backup volumes
defaults write com.apple.TimeMachine DoNotOfferNewDisksForBackup -bool true

# Don't create .DS_Store files on network or USB drives
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true

# Save screenshots to ~/Pictures/Screenshots
mkdir -p "$HOME/Pictures/Screenshots"
defaults write com.apple.screencapture location -string "${HOME}/Pictures/Screenshots"

# Disable screenshot drop shadow
defaults write com.apple.screencapture disable-shadow -bool false

# Use plain text mode for new TextEdit documents
defaults write com.apple.TextEdit RichText -int 0

# -----------------------------------------------
# Apply settings
# -----------------------------------------------

for app in "Dock" \
    "Finder" \
    "TextEdit" \
    "Safari" \
    "Activity Monitor" \
    "cfprefsd" \
    "SystemUIServer"; do
    killall "${app}" &> /dev/null
done

printf "Some changes may require a restart to take effect.\n"
