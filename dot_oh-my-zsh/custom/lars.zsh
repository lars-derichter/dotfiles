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
alias ld="cd ~/Library/Mobile\ Documents/com~apple~CloudDocs/0-ld"
alias old="open ~/Library/Mobile\ Documents/com~apple~CloudDocs/0-ld"
## area
ldafunction() {
	pushd ~/Library/Mobile\ Documents/com~apple~CloudDocs/0-ld/${1}*
}
export ldafunction
## category
ldcfunction() {
	pushd ~/Library/Mobile\ Documents/com~apple~CloudDocs/0-ld/*/${1}*
}
export ldcfunction
## item
ldifunction() {
	pushd ~/Library/Mobile\ Documents/com~apple~CloudDocs/0-ld/*/*${1}*
}
export ldifunction

alias lda='ldafunction'
alias ldc='ldcfunction'
alias ldi='ldifunction'

# `o` with no arguments opens the current directory, otherwise opens the given
# location
function o() {
	if [ $# -eq 0 ]; then
		open .;
	else
		open "$@";
	fi;
}

# Detect which `ls` flavor is in use
if ls --color > /dev/null 2>&1; then # GNU `ls`
	colorflag="--color"
	export LS_COLORS='no=00:fi=00:di=01;31:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.gz=01;31:*.bz2=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.avi=01;35:*.fli=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.ogg=01;35:*.mp3=01;35:*.wav=01;35:'
else # macOS `ls`
	colorflag="-G"
	export LSCOLORS='BxBxhxDxfxhxhxhxhxcxcx'
fi

# List all files colorized in long format
alias l="ls -lF ${colorflag}"

# List all files colorized in long format, including dot files
alias la="ls -laF ${colorflag}"

# List only directories
alias lsd="ls -lF ${colorflag} | grep --color=never '^d'"

# Always use color output for `ls`
#alias ls="command ls ${colorflag}"

##
#  GIT
##
alias gs="git status"

##
#  NETWORK & BROWSERS
##
alias chrome='/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome'
alias firefox='/Applications/Firefox.app/Contents/MacOS'
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
#  MISC
##

# Lock the screen (when going AFK)
alias afk="/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend"

# Reload the shell (i.e. invoke as a login shell)
alias reload="exec $SHELL -l"

# Get week number
alias week='date +%V'

# Recursively delete `.DS_Store` files
alias cleanup="find . -type f -name '*.DS_Store' -ls -delete"
