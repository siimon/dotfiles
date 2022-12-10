#!/bin/sh

# install homebrew
if ! [ -x "$(command -v brew)" ]; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

#brew update
brew tap Homebrew/bundle

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
ln -s "$path/.zshrc" ~/
ln -s "$path/.config" ~/

ln -s "$path/U.S.\ with\ Swedish\ Characters.bundle" ~/Library/Keyboard\ Layouts/
