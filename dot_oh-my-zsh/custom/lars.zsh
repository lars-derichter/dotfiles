# Some more aliases and functions that I like

# Enable aliases to be sudo’ed
alias sudo='sudo '

##
#  FILESYSTEM
##
alias dl="cd ~/Downloads"
alias odl="open ~/Downloads"
alias pg="cd ~/Projects-Github"
alias opg="open ~/Projects-Github"
alias ic="cd ~/Library/Mobile\ Documents/com~apple~CloudDocs" # iCloud Drive
alias oic="open ~/Library/Mobile\ Documents/com~apple~CloudDocs" # iCloud Drive
alias tm="cd ~/OneDrive\ -\ Thomas\ More"
alias otm="open ~/OneDrive\ -\ Thomas\ More"

# ld lars digital files
# alias ld="cd ~/Library/Mobile\ Documents/com~apple~CloudDocs/0-ld"
# alias old="open ~/Library/Mobile\ Documents/com~apple~CloudDocs/0-ld"
# ## area
# ldafunction() {
# 	pushd ~/Library/Mobile\ Documents/com~apple~CloudDocs/0-ld/${1}*
# }
# export ldafunction
# ## category
# ldcfunction() {
# 	pushd ~/Library/Mobile\ Documents/com~apple~CloudDocs/0-ld/*/${1}*
# }
# export ldcfunction
# ## item
# ldifunction() {
# 	pushd ~/Library/Mobile\ Documents/com~apple~CloudDocs/0-ld/*/*${1}*
# }
# export ldifunction

# alias lda='ldafunction'
# alias ldc='ldcfunction'
# alias ldi='ldifunction'

# `o` with no arguments opens the current directory, otherwise opens the given
# location
function o() {
	if [ $# -eq 0 ]; then
		open .;
	else
		open "$@";
	fi;
}

# eza — modern ls replacement (https://github.com/eza-community/eza)
alias l="eza -lF --icons --git"
alias la="eza -laF --icons --git"
alias lsd="eza -lDF --icons"
alias lt="eza -lTF --icons --git --level=2"

##
#  GIT
##
alias gs="git status"

##
#  NETWORK & BROWSERS
##
alias chrome='/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome'
# Kill all the tabs in Chrome to free up memory
# [C] explained: http://www.commandlinefu.com/commands/view/402/exclude-grep-from-your-grepped-output-of-ps-alias-included-in-description
alias chromekill="ps ux | grep '[C]hrome Helper --type=renderer' | grep -v extension-process | tr -s ' ' | cut -d ' ' -f2 | xargs kill"

# Flush Directory Service cache
alias flush="dscacheutil -flushcache"

##
#  VISUAL STUDIO CODE
##

# `vc` with no arguments opens the current directory in Visual Studio Code, otherwise
# opens the given location
function vc() {
	if [ $# -eq 0 ]; then
		code .;
	else
		code "$@";
	fi;
}

# `vcd` shows a diff of two files in Visual Studio Code
function vcd() {
	code --diff "$@";
}

##
# Todoist CLI
##
#source $(brew --prefix)/share/zsh/site-functions/_todoist_peco

##
#  MISC
##

# Lock the screen (when going AFK)
alias afk="osascript -e 'tell application \"System Events\" to keystroke \"q\" using {control down, command down}'"

# Reload the shell (i.e. invoke as a login shell)
alias reload="exec $SHELL -l"

# Get week number
alias week='date +%V'

# Recursively delete `.DS_Store` files
alias cleanup="find . -type f -name '*.DS_Store' -ls -delete"
