#!/bin/bash

set -e

# This script installs Neovim, Lazygit, and luarocks

set_os_specific_globals() {
	if [ -f /etc/os-release ]; then
		. /etc/os-release
		OS_FAMILY="${ID_LIKE:-$ID}"
		case "$OS_FAMILY" in
			*debian*) 
				INSTALL="sudo apt-get install -y"
				DEV_TOOLS="build-essential"
				NVIM_PKGS=(ninja-build gettext cmake unzip curl)
				;;
			*arch*)
				INSTALL="sudo pacman -S --noconfirm"
				DEV_TOOLS="base-devel"
				NVIM_PKGS=(cmake unzip ninja curl)
				;;
			*fedora*)
				INSTALL="sudo dnf install -y"
				DEV_TOOLS="@development-tools"
				NVIM_PKGS=(ninja-build cmake gcc make unzip gettext curl)
				;;
			*)
				echo "This script isn't supported with this Linux distro: $ID"
				echo "Consider modifying the set_os_specific_settings to add compatibility to your machine"
				exit 1
		esac
	else
		echo "Cannot determine the operating system using /etc/os-release. This script may not be compatible."
		exit 1
	fi
}

install_dependencies() {
	$INSTALL $DEV_TOOLS
	$INSTALL git
}

install_neovim() {
	$INSTALL "${NVIM_PKGS[@]}"
	git clone https://github.com/neovim/neovim
	cd neovim
	make CMAKE_BUILD_TYPE=Release
	sudo make install
	cd ..
	rm -rf neovim
}

install_lazygit() {
	LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | \grep -Po '"tag_name": *"v\K[^"]*')
	curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/download/v${LAZYGIT_VERSION}/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
	tar xf lazygit.tar.gz lazygit
	sudo install lazygit -D -t /usr/local/bin/
	rm lazygit*
}

main() {
	set_os_specific_globals
	install_dependencies
	install_neovim
	install_lazygit
	$INSTALL luarocks
}

main
