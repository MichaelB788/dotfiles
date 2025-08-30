# Quick Install

## Part 1: Copy the headless repo

To automate the setup, you can use this [Github Gist snippet](https://gist.github.com/8dedebc8108226650b62d7533b00b522.git) to clone these dotfiles as a bare repository 
without conflicting any existing dotfiles.

Simply open up the terminal and enter the following:

```bash
git clone https://gist.github.com/8dedebc8108226650b62d7533b00b522.git helper_script
chmod +x helper_script/clone.sh
./helper_script/clone.sh
```

Pre-existing dotfiles which conflict with the new ones will be placed under `~/.config-backup`

## Part 2: Setup Neovim and other dependencies

> NOTE: This script will only run on Debian and Arch based systems, however it should be easy to configure it to work on any Linux based system.

After running the above commands to copy the config over to your machine, there should be a directory labeled `scripts/` under the home directory 
that contains another bash file that can bootstrap the installation and setup of Neovim.

From the home directory, execute the following:

```
chmod +x scripts/install-cli-tools.sh
./scripts/install-cli-tools.sh
```

This will install Neovim nightly, along with my other tools such as Lazygit and luarocks (for installing neorg).

## Non-Linux Systems (MacOS / Windows)

**If you are on Windows use WSL**. Don't bother using Powershell unless you hate your life.

I believe MacOS should be compatible with the shell scripts but I cannot be bothered to test.

In any case, manually installing [Neovim](https://github.com/neovim/neovim/wiki/Building-Neovim/688be28f98c18e73b5043879b5963287a9b13d6c) and [Lazygit](https://github.com/jesseduffield/lazygit) and copy the dotfiles into the appropriate directories.
should do everything the shell scripts do. After that, clone this repository normally:

```bash
git clone https://github.com/MichaelB788/dotfiles.git
```

And copy the dotfiles into their appropriate directories.

For Windows, Neovim config files are usually under `C:/User/<username>/AppData/Local/nvim`. If you don't see the `nvim`
folder, just make a new one and put the config files in there.
