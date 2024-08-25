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
eval $(op signin) # Then manually add account

# chezmoi
brew install chezmoi
chezmoi init https://github.com/lars-derichter/dotfiles.git

# Check defaults in $HOME/.local/share/chezmoi/.chezmoi.toml.tmpl

chezmoi apply

```

## Afterwards

- In iTerm2 settings: `Load iterm settings from ~/.iterm2` and `Save changes automatically`
- In 1password settings:  `Use the SSH-Agent` and `Integrate with 1password-cli`

## Todo

Fix 1password-cli integration for gpg-key


