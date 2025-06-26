#!/bin/bash

set -e

function check_prerequisites {
    sudo apt-get install build-essential
    if ! dpkg -l git &>/dev/null; then
        sudo apt-get install dpkg
    fi
}

function build_neovim_from_source {
    # Neovim dependencies
    sudo apt-get install ninja-build gettext cmake unzip curl

    # Neovim installation
    git clone https://github.com/neovim/neovim
    cd neovim
    git checkout stable # Remove or comment out this line for the nightly build
    make CMAKE_BUILD_TYPE=Release
    sudo make install

    cd ..
    rm -rf neovim
}

function install_luarocks {
    wget https://luarocks.org/releases/luarocks-3.12.1.tar.gz
    tar zxpf luarocks-3.12.1.tar.gz
    cd luarocks-3.12.1
    ./configure && make && sudo make install
    sudo luarocks install luasocket

    cd ..
    rm -rf luarocks-3.12.1
}

function install_lazygit {
    LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | \grep -Po '"tag_name": *"v\K[^"]*')
    curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/download/v${LAZYGIT_VERSION}/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
    tar xf lazygit.tar.gz lazygit
    sudo install lazygit -D -t /usr/local/bin/
    rm lazygit*
}

function install_terminal_extras {
    # Install xclip to use with Neovim and Vim
    if ! dpkg -l xclip &>/dev/null; then
        sudo apt-get install xclip
    fi

    # Lazygit to use with nvim
    if command -v lazygit &>/dev/null; then
        read -p "Lazygit already installed. Update? (y/n) " answer
        case ${answer:0:1} in
            y|Y|yes|Yes|"" )
                install_lazygit
            ;;
            * ) ;;
        esac
    else
        install_lazygit
    fi
}

function setup_everything {
    sudo apt-get update
    check_prerequisites

    if command -v nvim &>/dev/null; then
        read -p "Neovim is already installed. Would you like to update? (y/n) " answer
        case ${answer:0:1} in
            y|Y|yes|Yes|"" )
                build_neovim_from_source
            ;;
            * ) ;;
        esac
    else
        build_neovim_from_source
    fi

    if ! command -v lua &>/dev/null; then
        read -p "Luarocks is not installed. It is not required, but recommmended. Install? (y/n) " answer
        case ${answer:0:1} in
            y|Y|yes|Yes|"" )
                install_luarocks
            ;;
            * ) ;;
        esac
    fi

    install_terminal_extras
}

# Installer start
if [ -f /etc/os-release ]; then
    . /etc/os-release
    if [ "$ID_LIKE" == "debian" ]; then
        setup_everything
    else
        echo "This is not a debian-based distro!"
    fi
else
    echo "Cannot determine the operating system using /etc/os-release. This script may not be compatible."
fi
