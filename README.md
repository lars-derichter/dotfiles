# dotfiles

My dot files and configuration managed with [chezmoi](https://www.chezmoi.io).

## macOS

1. run these commands in the terminal:

```shell
# Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# 1Password
brew install 1password
```

2. open 1Password and login
3. in 1Password:  Settings >> Developer select: `Use the SSH-Agent` and
   `Integrate with 1password-cli`
4. login in App Store
5. run these commands in the terminal:

```shell
# chezmoi
brew install chezmoi
chezmoi init https://github.com/lars-derichter/dotfiles.git

# You will be prompted for your GPG key ID and 1Password item ID, defaults are prefilled
chezmoi apply
```

## Afterwards

- login to vscode (using Github) to sync settings
- login to setapp and install favourite apps
- Install manually:
  - https://wordcounterapp.com/
  - IBM SPSS

## Project setup with mise

[Mise](https://mise.jdx.dev/) manages tool versions per project. When you `cd`
into a directory with a `.mise.toml`, mise automatically activates the right
versions.

Pin a tool version for the current project:

```shell
mise use node@20
mise use python@3.12
mise use java@temurin-25
```

This creates or updates `.mise.toml` in the project root. Commit it to version
control so everyone on the project uses the same versions.

### Node.js

```shell
mise use node@20        # pin Node 20 for this project
```

Mise also reads `.nvmrc` and `.node-version` files automatically.

Example `.mise.toml`:

```toml
[tools]
node = "20"
```

If you need corepack (for pnpm/yarn):

```toml
[tools]
node = { version = "20", postinstall = "corepack enable" }
```

### Python

```Shell
mise use python@3.12    # pin Python 3.12 for this project
```

To auto-create and activate a virtualenv, add an `[env]` section:

```toml
[tools]
python = "3.12"

[env]
_.python.venv = { path = ".venv", create = true }
```

Mise creates the `.venv` on first activation and activates it automatically when
you enter the directory. Uses `uv venv` if [uv](https://docs.astral.sh/uv/) is
installed, otherwise falls back to `python -m venv`.

### Java

```shell
mise use java@25              # OpenJDK (default vendor)
mise use java@temurin-25      # Eclipse Temurin
mise use java@corretto-25     # Amazon Corretto
mise use java@zulu-25         # Azul Zulu
```

Mise sets `JAVA_HOME` automatically. Also reads `.java-version` and `.sdkmanrc`
files.

Example `.mise.toml`:

```toml
[tools]
java = "temurin-25"
```

### Environment variables

Set project-specific environment variables in the `[env]` section of
`.mise.toml`:

```toml
[env]
NODE_ENV = "development"
DATABASE_URL = "postgres://localhost/mydb"
```

Load variables from a `.env` file:

```toml
[env]
_.file = ".env"
```

Add directories to `PATH`:

```toml
[env]
_.path = ["./bin", "./node_modules/.bin"]
```

A complete example combining tools and environment:

```toml
[tools]
node = "20"
python = { version = "3.12", postinstall = "pip install -r requirements.txt" }

[env]
_.python.venv = { path = ".venv", create = true }
_.file = ".env"
_.path = ["./bin"]
NODE_ENV = "development"
```
