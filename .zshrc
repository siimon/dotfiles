# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="dracula"
DEFAULT_USER="simonnyberg"
prompt_context(){}
export EDITOR='vim'

export LC_ALL=en_US.UTF-8

# Use ripgrep as default search engine with fzf
export FZF_DEFAULT_COMMAND='rg --files'

export COLORTERM=truecolor

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias c="cd ~/code/"
alias doc="cd ~/Documents/"
alias d="docker"
alias t="/usr/local/opt/todo-txt/bin/todo.sh"
alias mux=tmuxinator
alias rw="nvim -c ':G'"
# Use NeoVim
alias vim="nvim"

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
plugins=(git brew macos node npm tmux docker docker-compose rust ripgrep swiftpm xcode)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export PATH=~/bin:/usr/local/bin:/usr/local/sbin:/usr/local/mysql/bin:/usr/local/git/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/X11/bin:/usr/local/share/npm/bin:/usr/local/go/bin:~/.gopath/bin:~/bin:~/.cargo/bin:/opt/homebrew/bin
export GOPATH=~/.gopath
# Use Z-zsh, https://github.com/sjl/z-zsh
. /opt/homebrew/etc/profile.d/z.sh
ctags=/usr/local/bin/ctags

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

PROMPT+='
> '

export NVM_DIR="$HOME/.nvm"
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
ssh-add -q --apple-load-keychain

eval "$(rbenv init - zsh)"
eval "$(~/.local/bin/mise activate zsh)"
