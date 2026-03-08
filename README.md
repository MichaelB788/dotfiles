# Dotfiles

Dotfiles for Arch-based distros.

I stow all dotfiles during installation. As such, you can find **all of my
configurations under the `modules/` directory**. Feel free to take a look.

`bootstrap.sh` calls all of the scripts under `scripts/`. Be sure to take a look
at them before installing.

## Installation

```bash
git clone https://github.com/MichaelB788/dotfiles.git $HOME/dotfiles
cd $HOME/dotfiles
```

**Verify that all the scripts under `scripts/` are executable BEFORE running
`bootstrap.sh`**. After that, you can run:

```bash
./$HOME/dotfiles/bootstrap.sh
```