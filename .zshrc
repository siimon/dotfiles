# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="geoffgarside"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias c="cd ~/code/"
alias doc="cd ~/Documents/"
alias we="~/code/ansiweather/ansiweather"

# TODO.TXT Settings, https://github.com/ginatrapani/todo.txt-cli
export TODOTXT_DEFAULT_ACTION=ls
export TODOTXT_DATE_ON_ADD=1
alias t='todo.sh -d ~/Dropbox/todo/todo.cfg'

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git brew osx node npm pip bower)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export PATH=~/bin:/usr/local/bin:/usr/local/sbin:/usr/local/mysql/bin:/usr/local/git/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/X11/bin:/usr/local/share/npm/bin/:/usr/local/go/bin/:~/.gopath/bin
export GOPATH=~/.gopath

# Determine what character to use in place of the '$' for my prompt.
function repo_char {
    git branch >/dev/null 2>/dev/null && echo '☿' && return
    echo '○'
}

# Display any virtual env stuff with python.
function virtualenv_info {
    [ $VIRTUAL_ENV ] && echo '('`basename $VIRTUAL_ENV`') '
}




if tput setaf 1 &> /dev/null; then
	tput sgr0
	if [[ $(tput colors) -ge 256 ]] 2>/dev/null; then
		MAGENTA=$(tput setaf 9)
		ORANGE=$(tput setaf 172)
		GREEN=$(tput setaf 190)
		PURPLE=$(tput setaf 141)
		WHITE=$(tput setaf 0)
    LIGHT_GREEN=$(tput setaf 120)
    YELLOW=$(tput setaf 226)
    RED=$(tput setaf 196)
  else
		MAGENTA=$(tput setaf 5)
		ORANGE=$(tput setaf 4)
		GREEN=$(tput setaf 2)
		PURPLE=$(tput setaf 1)
		WHITE=$(tput setaf 7)
    LIGHT_GREEN=$(tput setaf 2)
    YELLOW=$(tput setaf 3)
    RED=$(tput setaf 1)
	fi
	BOLD=$(tput bold)
	RESET=$(tput sgr0)
else
	MAGENTA="\033[1;31m"
	ORANGE="\033[1;33m"
	GREEN="\033[1;32m"
	PURPLE="\033[1;35m"
	WHITE="\033[1;37m"
	BOLD=""
	RESET="\033[m"
fi

export MAGENTA
export ORANGE
export GREEN
export PURPLE
export WHITE
export BOLD
export RESET
export YELLOW
export LIGHT_GREEN
export RED


# All of my git variables.
ZSH_THEME_GIT_PROMPT_PREFIX=" on %{${YELLOW}%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{${RED}%}!"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{${RED}%}?"
ZSH_THEME_GIT_PROMPT_CLEAN=""

# I like a new line between my result and the next prompt.  Makes it easier to see
PROMPT='
%{${LIGHT_GREEN}%}${PWD/#$HOME/~}%{$reset_color%}$(git_prompt_info)
$(virtualenv_info)> '

# Use Z-zsh, https://github.com/sjl/z-zsh
. ~/code/dotfiles/zsh/z-zsh/z.sh
function precmd(){
  z --add "$(pwd -P)"
}
ctags=/usr/local/bin/ctags

. ~/.nvm/nvm.sh


### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"


# Output all different colors that can be used in tput setaf
aa_256 ()
{
( x=`tput op` y=`printf %$((${COLUMNS}-6))s`;
for i in {0..256};
do
o=00$i;
echo -e ${o:${#o}-3:3} `tput setaf $i;tput setab $i`${y// /=}$x;
done )
}

export NODE_PATH=.

source ~/.zsh_private
