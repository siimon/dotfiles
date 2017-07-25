#!/bin/sh

# install homebrew
if ! [ -x "$(command -v brew)" ]; then
	/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

#brew update
brew tap Homebrew/bundle

# install mac app store cli - needed for some bundle apps
brew install mas

# install all apps from Brewfile
brew bundle

# install oh-my-zsh
if [ ! -d ~/.oh-my-zsh ]; then
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
fi

# setup symlinks to config files
path=$(pwd)
ln -s "$path/.agignore" ~/
ln -s "$path/.gitconfig" ~/
ln -s "$path/.gitignore" ~/
ln -s "$path/.tmux.conf" ~/
ln -s "$path/.vim" ~/
ln -s "$path/.vimrc" ~/
ln -s "$path/.zshrc" ~/

# # install git submodules
git submodule init
git submodule update

ln -s "$path/U.S.\ with\ Swedish\ Characters.bundle" ~/Library/Keyboard\ Layouts/
