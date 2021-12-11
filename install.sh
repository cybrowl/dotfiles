#!/bin/bash

exists()
{
  command -v "$1" >/dev/null 2>&1
}

# Installing all Deps and Configs
echo "----------------"
echo "Dependencies"
echo "----------------"

## Git
if exists git; then
  echo "git exists"
else 
  echo "installing git"
  brew install git
fi

## Fish
if exists fish; then
  echo "fish exists"
else
  echo "Installing Fish"
  brew install fish
  sudo bash -c 'echo /usr/local/bin/fish >> /etc/shells'
  chsh -s /usr/local/bin/fish
  
fi

## Fisher
if [ ! -d /.config/fish/functions/fisher.fish ]; then
  echo "fisher exists"
else
  brew tap bbatsche/fisher
  brew install fisherman

  fisher install matchai/spacefish
fi

## Tmux
if exists tmux; then
  echo "tmux exists"
else
  echo "installing tmux"
  brew install tmux
fi

## NeoVim
if exists nvim; then
  echo "neo vim exists"
else
  echo "installing nvim"
  brew install neovim
fi

## Alacritty
if [ ! -d /Applications/Alacritty.app ]; then
  echo "moving alacritty app to applications"
  // TODO: copy app to applications
else
  echo "alacritty app exists"
fi

## Hammerspoon
if [ ! -d /Applications/Hammerspoon.app ]; then
  echo "installing hammerspoon"
  brew install hammerspoon --cask
else 
  echo "hammerspoon exists" 
fi

## Node
if exists node; then
  echo "installing node"
  brew install node
else 
  echo "node exists" 
fi

echo "----------------"
echo "Configs"
echo "----------------"

## Hammerspoon
if [ ! -d ~/.hammerspoon ]; then
  echo "copying hammerspoon configs"
  mkdir ~/.hammerspoon
  yes | cp -rf ./hammerspoon/* ~/.hammerspoon/
else 
  echo "hammerspoon configs exist -> update" 
  yes | cp -rf ./hammerspoon/* ~/.hammerspoon/
fi

## Alacritty
if [ ! -d ~/.config/alacritty ]; then
  echo "copying alacritty configs"
  cd ~/.config && mkdir alacritty
  yes | cp -rf ./alacritty/alacritty.yml ~/.config/alacritty
  yes | cp -rf ./alacritty/dracula.yml ~/.config/alacritty
else 
  echo "alacritty configs exist -> update" 
  yes | cp -rf ./alacritty/alacritty.yml ~/.config/alacritty
  yes | cp -rf ./alacritty/dracula.yml ~/.config/alacritty
fi

## Tmux
if [ ! -f ~/.tmux.conf ]; then
  echo "copying tmux configs"
  yes | cp -rf ./tmux/.tmux.conf ~/
  tmux source-file ~/.tmux.conf
else 
  echo "tmux configs exist -> update" 
  yes | cp -rf ./tmux/.tmux.conf ~/
  tmux source-file ~/.tmux.conf
fi



