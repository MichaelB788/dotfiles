#!/bin/bash
set -e

# See https://neovim.io/doc2/install/ for methods of installing neovim and neovim nightly

eos_setup() {
	sudo pacman -Syu

	sudo pacman -S kitty

	yay -S neovim-nightly-bin

	sudo pacman -S lazygit

	yay -S jet-brains-toolbox

	# Source - https://stackoverflow.com/a/226724
	# Posted by Myrddin Emrys, modified by community. See post 'Timeline' for change history
	# Retrieved 2025-12-30, License - CC BY-SA 4.0
	echo "Do you wish to install EndeavourOS's flavor of sway?"
	select strictreply in "Yes" "No"; do
		relaxedreply=${strictreply:-$REPLY}
		case $relaxedreply in
		Yes | yes | y)
			git clone https://github.com/EndeavourOS-Community-Editions/sway.git
			cd sway
			sudo ./sway-install.sh
			break
			;;
		No | no | n) exit ;;
		esac
	done
}

fedora_setup() {
	sudo dnf update -y

	sudo dnf kitty

	sudo dnf copr enable agriffis/neovim-nightly
	sudo dnf install -y neovim python3-neovim

	sudo dnf copr enable dejan/lazygit
	sudo dnf install -y lazygit

	echo "Do you wish to install Fedora's flavor of sway?"
	select strictreply in "Yes" "No"; do
		relaxedreply=${strictreply:-$REPLY}
		case $relaxedreply in
		Yes | yes | y)
			sudo dnf install sway sway-config-fedora
			break
			;;
		No | no | n) exit ;;
		esac
	done
}

debian_setup() {
	sudo apt-get update && sudo apt-get upgrade

	sudo apt-get install kitty

	sudo add-apt-repository ppa:neovim-ppa/unstable
	sudo apt update
	sudo apt-get install neovim

	sudo apt-get install lazygit

	echo "Do you wish to install sway?"
	select strictreply in "Yes" "No"; do
		relaxedreply=${strictreply:-$REPLY}
		case $relaxedreply in
		Yes | yes | y)
			sudo apt-get install sway
			break
			;;
		No | no | n) exit ;;
		esac
	done
}

case "${1}" in
--eos)
	eos_setup
	;;
--fedora)
	fedora_setup
	;;
--deb)
	debian_setup
	;;
'' | *)
	echo "Usage: ./install-cli-tools.sh <flag>"
	echo "Flags:"
	echo "--eos -> EndeavourOS"
	echo "--fedora -> Fedora"
	echo "--deb -> Debian, Ubuntu, or any other derivative"
	;;
esac
