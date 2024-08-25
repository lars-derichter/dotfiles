# dotfiles
My dot files and configuration managed with [chezmoi](https://www.chezmoi.io).

## macOS

On a new install first login to the App Store, install 1Password and then run these commands to initialize on macOS.

```Shell
# Xcode command line tools
xcode-select --install

# Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# 1password
brew install --cask 1password-cli
eval $(op signin my.1password.com <email>)

# chezmoi
brew install chezmoi
chezmoi init https://github.com/lars-derichter/dotfiles.git

# Check defaults in $HOME/.local/share/chezmoi/.chezmoi.toml.tmpl

chezmoi apply

```


