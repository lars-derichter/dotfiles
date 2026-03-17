# macOS Developer Setup — Improvement Ideas

## Shell & Terminal

- **zsh-autosuggestions** and **zsh-syntax-highlighting** — two of the most impactful zsh plugins. Autosuggestions show ghost-text completions from history; syntax highlighting colors valid/invalid commands as you type.
- **fzf** — fuzzy finder for files, history, and more. Pairs well with `z` for directory navigation. Also enables `Ctrl+R` fuzzy history search.
- **bat** — `cat` replacement with syntax highlighting and git integration. Useful as a pager for `man`, `git diff`, etc.
- **eza** (or **lsd**) — modern `ls` replacement with git status, icons, tree view. Could replace the custom `l`/`la`/`lsd` aliases.
- **ripgrep** (`rg`) — dramatically faster than grep for code search.
- **fd** — modern `find` replacement, respects `.gitignore`, much faster.
- **jq** — CLI JSON processor. Essential for working with APIs, configs, and piping JSON output.
- **yq** — same as jq but for YAML/TOML — useful given how much config is YAML these days.
- **direnv** — per-directory environment variables. Pairs nicely with mise and is invaluable for projects with different env configs.

## Git & Development Workflow

- **delta** (`git-delta`) — much better git diff viewer with syntax highlighting, line numbers, and side-by-side mode. Drop-in replacement via gitconfig.
- **gh** (GitHub CLI) — essential for PRs, issues, actions from the terminal.
- **lazygit** — TUI for git that's faster than switching to a GUI for complex operations (interactive rebase, cherry-pick, etc.).
- **pre-commit** — framework for managing git hooks. Worth having globally available.
- **git config additions** — consider `push.autoSetupRemote = true`, `rerere.enabled = true` (remember merge conflict resolutions), `diff.algorithm = histogram` (better diffs).

## System & Productivity

- **Raycast** — consider as an Alfred alternative (or complement). Free tier is very capable, with built-in clipboard history, snippets, window management, and a plugin ecosystem.
- **htop** or **btop** — interactive process viewer, better than Activity Monitor for terminal users.
- **watch** — run commands repeatedly. Useful for monitoring.
- **tree** — directory structure visualization. Small but frequently useful.
- **trash** (`trash-cli` or `macos-trash`) — move to Trash instead of `rm`. Safer.

## macOS Preferences (plist additions)

- **Finder**: show hidden files (`AppleShowAllFiles`), show path bar, show status bar, default to list view, search current folder by default.
- **Keyboard**: faster key repeat rate (`KeyRepeat = 2`, `InitialKeyRepeat = 15`) — big improvement for coding.
- **Screenshots**: change default location to `~/Screenshots`, disable shadow on window screenshots.
- **TextEdit**: default to plain text instead of rich text.
- **Disable**: "Are you sure you want to open this application?" (`com.apple.LaunchServices LSQuarantine`).

## Security & Networking

- **1Password CLI shell plugin** — the shell plugin adds biometric unlock for CLI sessions and `op run` for injecting secrets into commands.

## Container & Cloud (if relevant)

- **Docker Desktop** or **OrbStack** (lighter alternative) — for containerized development.
- **kubectl** + **kubectx/kubens** — if working with Kubernetes.
- Cloud CLIs (**awscli**, **gcloud**, **azure-cli**) depending on stack.
