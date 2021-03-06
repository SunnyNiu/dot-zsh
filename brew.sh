/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

# Tools
brew install zsh
brew install trash
brew install vim
brew install watch
brew install ncdu

# Git
brew install git
brew install tig
brew install diff-so-fancy

# Node
brew tap nodenv/nodenv
brew install yarn
brew install nodenv
brew install nodenv-nvmrc

# Misc
brew install awscli
brew install sbt
brew install jenv
mkdir -p ~/.jenv/versions

# Casks
brew tap homebrew/cask-versions
brew tap homebrew/cask-drivers
brew cask install hammerspoon
brew cask install steelseries-exactmouse-tool
brew cask install zulu8
brew cask install visual-studio-code
brew cask install slack
brew cask install docker
brew cask install jetbrains-toolbox
brew cask install 1password
brew cask install iterm2
brew cask install alfred
brew cask install bartender
brew cask install google-chrome
brew cask install firefox
