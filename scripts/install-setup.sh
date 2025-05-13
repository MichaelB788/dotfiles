#!/bin/bash

set -e

echo "Installing git..."
sudo apt-get install git

echo "Installing Neovim prerequisites..."
sudo apt-get install -y ninja-build gettext cmake curl build-essential

echo "Cloning Neovim..."
git clone https://github.com/neovim/neovim
cd neovim

echo "Building Neovim (stable)..."
git checkout stable
make CMAKE_BUILD_TYPE=Release
sudo make install

echo "Cleaning up..."
cd ..
rm -rf neovim

echo "Neovim installed in /usr/local"

echo "Installing lazy.nvim prerequisites..."
echo "Installing luarocks..."
wget https://luarocks.org/releases/luarocks-3.11.1.tar.gz
tar zxpf luarocks-3.11.1.tar.gz
cd luarocks-3.11.1
./configure && make && sudo make install
sudo luarocks install luasocket

echo "luarocks installed!"

echo "Cloning Neovim config..."
cp ../nvim/ ~/.config/
