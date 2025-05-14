#!/bin/bash

set -e

is_installed() {
    local cmd="$1"
    echo "Checking if $cmd is installed..."
    command -v "$cmd" &> /dev/null 
}

function install_dependencies {
    echo "Updating package list..."
    sudo apt-get update
    sudo apt-get install -y build-essential

    # Installing pip
    if is_installed "pip"; then
        echo "pip is already installed."
    else
        echo "Installing pip..."
        sudo apt-get install -y python3-pip
    fi

    # Installing node.js for npm
    if is_installed "node"; then
        echo "node is already installed."
    else
        trap "rm -f nodesource_setup.sh" EXIT
        sudo apt install -y curl
        curl -fsSL https://deb.nodesource.com/setup_23.x -o nodesource_setup.sh
        sudo -E bash nodesource_setup.sh
        sudo apt install -y nodejs
    fi

    # Installing go
    if is_installed "go"; then
        echo "go is already installed."
    else
        trap "rm -f go1.24.3.linux-amd64.tar.gz" EXIT
        wget https://go.dev/dl/go1.24.3.linux-amd64.tar.gz
        sudo tar -C /usr/local -xzf go1.24.3.linux-amd64.tar.gz
        echo 'export PATH=$PATH:/usr/local/go/bin' >> ~/.bashrc 
    fi
}

function build_neovim_from_source {
    # Neovim dependencies
    NEOVIM_DEP=(ninja-build gettext cmake curl build-essential)
    for pkg in "${NEOVIM_DEP[@]}"; do
        if is_installed pkg; then
            echo "$pkg is already installed."
        else
            sudo apt-get install "$pkg"
        fi
    done

    # Neovim installation
    trap "cd .. && rm -rf neovim" EXIT
    git clone https://github.com/neovim/neovim
    cd neovim
    git checkout stable # Remove or comment out this line for the nightly build
    make CMAKE_BUILD_TYPE=Release
    sudo make install
}

function install_lsp_servers {
    echo "Installing LSPs..."

    # lua-language-server
    if is_installed "lua-language-server"; then
        echo "Skipping lua-ls."
    else
        trap "rm -rf lua-language-server"
        git clone https://github.com/LuaLS/lua-language-server
        (cd lua-language-server && source ./make.sh)
    fi

    # clangd
    if is_installed "clangd"; then
        echo "Skipping clangd."
    else
        sudo apt install -y clangd-12
        sudo update-alternatives --install /usr/bin/clangd clangd /usr/bin/clangd-12 100
    fi

    # pyright
    if is_installed "pyright"; then
        echo "Skipping pyright."
    else
        pip install pyright[nodejs]
    fi

    # bash_lsp
    if is_installed "bash-language-server"; then
        echo "Skipping bash_ls."
    else
        sudo apt install shellcheck
        sudo npm i -g bash-language-server
    fi

    # shfmt
    if is_installed "shfmt"; then
        echo "Skipping shfmt."
    else
        go install mvdan.cc/sh/v3/cmd/shfmt@latest
    fi
}

function install_nvim_extras {
    # lazygit
    git clone https://github.com/jesseduffield/lazygit.git
    cd lazygit
    go install

    # lua
    trap "rm -rf lua-*" EXIT
    curl -L -R -O https://www.lua.org/ftp/lua-5.4.7.tar.gz
    tar zxf lua-5.4.7.tar.gz
    cd lua-5.4.7
    make all test
    cd ..
    
    # luarocks
    wget https://luarocks.org/releases/luarocks-3.11.1.tar.gz
    tar zxpf luarocks-3.11.1.tar.gz
    cd luarocks-3.11.1
    ./configure && make && sudo make install
    sudo luarocks install luasocket
}

function copy_config_files {
    cd ../config
    cp -r nvim/ ~/.config/
    cp -r Code/ ~/.config/
    cp -r kitty/ ~/.config/ 
    cp .vimrc ~/
    cd ../scripts
}

function setup_everything {
    install_dependencies
    build_neovim_from_source
    install_nvim_extras
    install_lsp_servers
    copy_config_files
}

function run_installer {
    while true; do
        echo '
What would you like to install?

1) Install and setup the entire config (recommended on a new device)
2) Build Neovim from source / update Neovim to latest stable release
3) Install Neovim extras (lazygit, lua, luarocks)
4) Install LSP servers
5) Copy or update config files

Press "q" to quit
        '
        read -r input
        case "$input" in
            "1")
                setup_neovim_config ;;
            "2")
                build_neovim_from_source ;;
            "3")
                install_nvim_extras ;;
            "4")
                install_lsp_servers ;;
            "5")
                copy_config_files ;;
            "q")
                break ;;
        esac
    done

}

# Installer start
run_installer
