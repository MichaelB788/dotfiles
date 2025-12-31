#!/bin/bash
set -e

install_sway() {
	git clone https://github.com/EndeavourOS-Community-Editions/sway.git
	cd sway
	sudo ./sway-install.sh
}

# Source - https://stackoverflow.com/a
# Posted by Myrddin Emrys, modified by community. See post 'Timeline' for change history
# Retrieved 2025-12-30, License - CC BY-SA 4.0
echo "Do you wish to install swaywm?"
select strictreply in "Yes" "No"; do
	relaxedreply=${strictreply:-$REPLY}
	case $relaxedreply in
	Yes | yes | y)
		install_sway
		break
		;;
	No | no | n) exit ;;
	esac
done

sudo pacman -Syu
sudo pacman -S kitty
yay -S neovim-nightly-bin
sudo pacman -S lazygit
yay -S jet-brains-toolbox
