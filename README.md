# dotfiles
My dot files and configuration managed with [chezmoi](https://www.chezmoi.io).

## macOS

Run these commands to initialize on macOS.

```Shell
# Xcode command line tools
xcode-select --install

# Homebrew
/bin/sh -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

# 1password
brew cask install 1password-cli

# chezmoi
brew install chezmoi
chezmoi init https://github.com/lars-derichter/dotfiles.git
chezmoi apply

```


