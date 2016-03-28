# history setup
HISTCONTROL=ignoreboth
HISTSIZE=5000
HISTFILESIZE=10000
shopt -s histappend

# aliases
alias lah='ls -lah'

# commands
function ppgrep() { pgrep "$@" | xargs ps fp 2>/dev/null; }

# scm parse
function __git_branch() {
	git rev-parse --abbrev-ref HEAD 2> /dev/null || return 1
}

function __hg_branch() {
	hg branch 2> /dev/null || return 1
}

function __scm() {
	BRANCH="$(__git_branch || __hg_branch)"
	if [ -n "$BRANCH" ]; then  
		echo " (${BRANCH})"
	fi
}

# colors
RESTORE='\033[00m'
RED='\033[00;31m'
GREEN='\033[00;32m'
YELLOW='\033[00;33m'
BLUE='\033[00;34m'
PURPLE='\033[00;35m'
CYAN='\033[00;36m'
LIGHTGRAY='\033[00;37m'
LRED='\033[01;31m'
LGREEN='\033[01;32m'
LYELLOW='\033[01;33m'
LBLUE='\033[01;34m'
LPURPLE='\033[01;35m'
LCYAN='\033[01;36m'
WHITE='\033[01;37m'

PS1="\[${GREEN}\]\u@\h\[${RESTORE}\]:\[${BLUE}\]\w\[${YELLOW}\]\$(__scm)\[${RESTORE}\]$ "

# nvm stuff
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"

# node modules in current directory
PATH=./node_modules/.bin:$PATH
