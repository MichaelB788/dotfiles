#!/bin/bash

set -e

function check_prerequisites {
    if ! pacman -Qg base-devel; then
        sudo pacman -S base-devel
    elif ! pacman -Qs git; then
        sudo pacman -S git
    fi
}

function build_neovim_from_source {
    # Neovim dependencies
    sudo pacman -S ninja-build gettext cmake unzip curl

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

function install_terminal_extras {
    # Install xclip to use with Neovim and Vim
    if ! pacman -Qs xclip; then
        sudo pacman -S xclip
    fi

    # Lazygit to use with nvim
    if ! pacman -Qs lazygit; then
        read -p "Lazygit already installed. Update? (y/n)" answer
        case ${answer:0:1} in
            y|Y|yes|Yes|"" )
                sudo pacman -S lazygit
            ;;
            * ) ;;
        esac
    else
        sudo pacman -S lazygit
    fi
}

function setup_everything {
    check_prerequisites

    if command -v nvim &>/dev/null; then
        read -p "Neovim is already installed. Would you like to update? (y/n)" answer
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
        read -p "Luarocks is not installed. It is not required, but recommmended. Install? (y/n)" answer
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
setup_everything
