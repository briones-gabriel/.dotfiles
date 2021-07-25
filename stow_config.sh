#!/bin/bash
set -e

# Stow Neovim
mkdir ~/.config/nvim
stow nvim -t ~/.config/nvim

# Stow Alacritty
mkdir ~/.config/alacritty
stow alacritty -t ~/.config/alacritty

# Stow .ideavimrc
stow --dotfiles -adopt jetbrains

# Stow git
stow --dotfiles git

# Stow Azure-CLI
stow --dotfiles dot-azure

# Stow Docker
stow --dotfiles dot-docker

# Stow Starship
stow starship -t ~/.config

# Stow tmux
stow --dotfiles tmux

echo "Files stowed successfully"
