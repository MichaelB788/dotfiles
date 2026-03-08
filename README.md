# Dotfiles

Dotfiles for Arch-based distros.

I stow all dotfiles during installation. As such, you can find **all of my
configurations under the `modules/` directory**. Feel free to take a look.

`bootstrap.sh` calls all of the scripts under `scripts/`. Be sure to take a look
at them before installing.

## Installation

Clone the repo and make all scripts executable

```bash
git clone https://github.com/MichaelB788/dotfiles.git $HOME/dotfiles
cd $HOME/dotfiles
chmod +x $HOME/dotfiles/bootstrap.sh $HOME/dotfiles/scripts/*.sh
```

Then, run the `bootstrap.sh` script to install all packages and dotfiles.
