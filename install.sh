#!/bin/bash
set -e

# Important note: This only works on arch-based systems

arch_setup() {
  echo "Updating system..."
	sudo pacman -Syu --noconfirm > /dev/null

  local pacman_pkgs=(
    gvim fzf kitty lazygit
  )

  local yay_pkgs=(
    neovim-nightly-bin jetbrains-toolbox
  )

  if !command -v yay &> /dev/null; then
    echo "yay undetected. Installing yay..."
    {
      sudo pacman -S --needed --noconfirm git base-devel
      git clone https://aur.archlinux.org/yay.git
      (cd yay && makepkg -si)
    } >/dev/null
  fi

  # If the word is double-quoted, ${name[*]} expands to a single word
  # with the value of each array # member separated by the first character
  # of the IFS variable, and ${name[@]} expands each element of name to a
  # separate word.
  echo "Installing packages via pacman..."
  sudo pacman -S --needed --noconfirm "${pacman_pkgs[@]}" > /dev/null

  echo "Installing packages via yay..."
  yay -S --needed --noconfirm "${yay_pkgs[@]}" > /dev/null

  if [[ "${1}" == "--eos-sway" ]]; then
    echo "Installing eos-sway..."
    {
      git clone https://github.com/EndeavourOS-Community-Editions/sway.git
      (cd sway && sudo ./sway-install.sh)
    }
  fi
}

clone_repos() {
  echo "Cloning my repos..."
  if [[ ! -d "$HOME/scripts" ]]; then
    git clone git@github.com:MichaelB788/scripts.git $HOME/scripts > /dev/null
  fi
  if [[ ! -d "$HOME/notes" ]]; then
    git clone git@github.com:MichaelB788/notes.git $HOME/notes > /dev/null
  fi
}

main() {
  read -rp "Link dotfiles? [y/N]: "
  if [[ "$REPLY" =~ ^[yY]$ ]]; then
    local DOTFILES_PATH=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &> /dev/null && pwd)
    bash "$DOTFILES_PATH/bootstrap.sh" 
  fi

  arch_setup
  clone_repos
  echo "Done!"
}

main ${@}
