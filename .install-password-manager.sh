#!/bin/sh

# exit immediately if password-manager-binary is already in $PATH
type op >/dev/null 2>&1 && exit

case "$(uname -s)" in
Darwin)
    # commands to install password-manager-binary on Darwin
    brew install 1password-cli
    op account add --address my.1password.com --email lars.derichter@gmail.com
    eval $(op signin)
    ;;
Linux)
    # commands to install password-manager-binary on Linux
    echo "No password manager for Linux selected"
    ;;
*)
    echo "unsupported OS"
    exit 1
    ;;
esac