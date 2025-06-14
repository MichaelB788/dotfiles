#!/bin/bash

set -e

is_installed() {
    local cmd="$1"
        echo "Checking if $cmd is installed..."
        command -v "$cmd" &> /dev/null 
}

function build_neovim_from_source {
    # Neovim dependencies
    NEOVIM_DEP=(base-devel ninja cmake curl unzip)
    for pkg in "${NEOVIM_DEP[@]}"; do
        if is_installed pkg; then
            echo "$pkg is already installed."
        else
            sudo pacman -S "$pkg"
        fi
    done

    # Neovim installation
    git clone https://github.com/neovim/neovim
    cd neovim
    git checkout stable # Remove or comment out this line for the nightly build
    make CMAKE_BUILD_TYPE=Release
    sudo make install
    cd .. && rm -rf neovim
}

function copy_config_files {
    cd ../.config/
    cp -r nvim/ ~/.config/
    cp -r Code/ ~/.config/
    cp -r kitty/ ~/.config/ 
    cp .vimrc ~/
    cd ..
}

function setup_everything {
    build_neovim_from_source
    copy_config_files
}

# Installer start
setup_everything
