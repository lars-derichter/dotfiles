# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with
code in this repository.

## Overview

Chezmoi-managed dotfiles for macOS development. Source repo lives at
`~/.local/share/chezmoi/`, targets `$HOME`.

## Key Commands

```shell
chezmoi apply                  # Deploy all managed files to $HOME
chezmoi diff                   # Preview changes before applying
chezmoi add ~/.some/file       # Start managing a new file
chezmoi edit ~/.some/file      # Edit source version of a managed file
chezmoi cd                     # cd into the source directory
chezmoi data                   # Show template data values
```

After editing Brewfile: `brew bundle --file=~/Brewfile`

## Chezmoi Naming Conventions

- `dot_` prefix → deployed with `.` prefix (`dot_zshrc` → `~/.zshrc`)
- `private_dot_` → private files (`private_dot_ssh/` → `~/.ssh/`)
- `.tmpl` suffix → processed as Go templates before deployment
- `run_once_` prefix → scripts that execute once per machine on `chezmoi apply`
- `run_once_after_` → run-once scripts that execute after file deployment
- `executable_` prefix → deployed with executable permissions

## Template System

Go templates using chezmoi data defined in `.chezmoi.toml.tmpl`. Prompted on
`chezmoi init`:

- `preferredhostname` — system hostname
- `fullname` — for git config / GPG
- `email` — for git config / GPG
- `gpg_key_id` — GPG signing key ID
- `gpg_key_op_id` — 1Password item ID for GPG private key

Platform conditionals: `{{ if eq .chezmoi.os "darwin" }}` for macOS-specific
config.

## Architecture

- **Brewfile** — all Homebrew packages, casks, and App Store apps
- **dot_zshrc** — shell config: oh-my-zsh, plugins, Starship prompt, 1Password
  SSH agent
- **dot_gitconfig.tmpl** — templated git config (identity, GPG signing,
  platform-specific editor)
- **dot_oh-my-zsh/custom/** — custom shell functions, aliases, theme
- **private_dot_init/** — `run_once_` scripts for machine bootstrap:
  package installation, hostname setup, GPG/SSH agent config, mise language
  runtimes (Node.js, Python, Java), macOS system preferences
- **dot_config/mise/** — mise-en-place global config for tool version management
- **dot_claude/** — Claude Code settings (auto-approved permissions for
  non-destructive operations)
- **private_dot_gnupg/** — GPG config with 1Password-sourced private key
- **private_dot_ssh/** — SSH config with 1Password identity agent

## Secrets Management

Secrets are managed through 1Password CLI (`op`). The
`.install-password-manager.sh` hook auto-installs `op` before chezmoi reads
source state. GPG private key is fetched from 1Password during the run-once
setup script.

## Important Notes

- `.chezmoiignore` excludes README.md, LICENSE, and .DS_Store from deployment
- When adding new templated files, ensure they use the correct chezmoi data
  variables from `.chezmoi.toml.tmpl`
- Run-once scripts are idempotent — chezmoi tracks execution by script content
  hash
