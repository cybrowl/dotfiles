#!/bin/bash

# Installing all Deps and Configs

#### Deps ####

echo "----- deps -----"

## Fish
if brew ls --versions fish > /dev/null; then
  echo "fish exists"
else
  echo "installing fish"
  brew install fish
fi

## Git
if git --version > /dev/null; then
  echo "git exists"
else 
  echo "installing git"
  brew install git
fi

## Omf (pkg manager for fish)
if [ ! -d ~/.config/omf ]; then
  curl -sL https://git.io/fisher | source
  sudo bash -c 'echo /usr/local/bin/fish >> /etc/shells'
  chsh -s /usr/local/bin/fish
  
  fisher install matchai/spacefish
fi

## Tmux
if brew ls --versions tmux > /dev/null; then
  echo "tmux exists"
else
  echo "installing tmux"
  brew install tmux
fi

## NeoVim
if brew ls --versions neovim > /dev/null; then
  echo "neo vim exists"
else
  echo "installing nvim"
  brew install neovim
fi

## Alacritty
if [ ! -d /Applications/Alacritty.app ]; then
  echo "moving alacritty app to applications"
else
  echo "alacritty app exists"
fi

## Hammerspoon
if brew info --cask hammerspoon > /dev/null; then
  echo "hammerspoon exists"
else 
  brew install hammerspoon --cask
fi


#### Configs ####
echo "----- configs -----"

## Hammerspoon
echo "copying hammerspoon configs"

if [ ! -d ~/.hammerspoon ]; then
  mkdir ~/.hammerspoon
fi

yes | cp -rf ./hammerspoon/* ~/.hammerspoon/

## Alacritty
echo "copying alacritty configs"

if [ ! -d ~/.config/alacritty ]; then
  mkdir ~/.config alacritty
fi

# copy config
yes | cp -rf ./alacritty/alacritty.yml ~/.config/alacritty

# copy theme file
yes | cp -rf ./alacritty/dracula.yml ~/.config/alacritty

## Tmux

echo "copying tmux configs"

yes | cp -rf ./tmux/.tmux.conf ~/
tmux source-file ~/.tmux.conf

