# dotfiles

My dot files and configuration managed with [chezmoi](https://www.chezmoi.io).

## macOS

On a new install first login to the App Store, install 1Password and then run these commands to initialize on macOS.

```Shell
# Xcode command line tools
xcode-select --install

# Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# chezmoi
brew install chezmoi
chezmoi init https://github.com/lars-derichter/dotfiles.git

# Check defaults in $HOME/.local/share/chezmoi/.chezmoi.toml.tmpl
chezmoi apply

```

## Afterwards

- in 1password settings: `Use the SSH-Agent` and `Integrate with 1password-cli`
- login to vscode (using Github) to sync settings
- login to setapp and install favourite apps

