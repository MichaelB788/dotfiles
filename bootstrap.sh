#!/bin/bash
set -e

echo "Linking dotfiles..."

DOTFILES_PATH=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &> /dev/null && pwd)

ln -sfn "$DOTFILES_PATH/vim" "$HOME/.vim"
ln -sf "$DOTFILES_PATH/ideavimrc" "$HOME/.ideavimrc"

for dir in "$DOTFILES_PATH/config"/*; do
  ln -sfn $dir "$HOME/.config/"
done

echo "Done!"
