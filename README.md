# 🛠️ My Dotfiles

Welcome to my personal dotfiles! This repository contains configuration files
and setup scripts for my development environment, tools, and terminal customization.

## ✨ Features

- Shell configuration: `bash`
- Editor setup: `neovim`, `vscode`, and `vim`
- Terminal emulator: `kitty`

## 🗂️ Structure

```bash
.
├── .bashrc
├── .config
│   ├── Code
│   │   └── User
│   │       └── keybindings.json
│   ├── kitty
│   │   └── kitty.conf
│   └── nvim
│       ├── init.lua
│       ├── lazy-lock.json
│       └── lua
│           ├── config
│           │   ├── keymaps.lua
│           │   ├── lazy.lua
│           │   └── options.lua
│           └── plugins
│               ├── code.lua
│               ├── git.lua
│               ├── lsp.lua
│               ├── markdown.lua
│               ├── navigation.lua
│               └── visual-sprinkles.lua
├── README.md
├── scripts
│   └── install.sh
└── .vimrc
````

## Dependencies

* git

* Latest version of Neovim

* Lazygit

* VSCode

* gvim

* kitty terminal

## Quick Install - Linux

To automate the setup, you can use this [Github Gist snippet](https://gist.github.com/8dedebc8108226650b62d7533b00b522.git) to clone these dotfiles as a bare repository 
without conflicting any existing dotfiles.

Simply open up the terminal and enter the following:

```
git clone https://gist.github.com/8dedebc8108226650b62d7533b00b522.git helper_script
chmod +x helper_script/clone.sh
./helper_script/clone.sh
```

Pre-existing dotfiles which conflict with the new ones will be placed under `~/.config-backup`

## Quick Install - Neovim Setup

> NOTE: This script will only run on Debian and Arch based systems, however it should be easy to configure it to work on any Linux based system.

After running the above commands to copy the config over to your machine, there should be a directory labeled `scripts/` under the home directory 
that contains another bash file that can bootstrap the installation and setup of Neovim.

From the home directory, execute the following:

```
chmod +x scripts/bootstrap-neovim.sh
./scripts/bootstrap-neovim.sh
```

## Non-Linux Systems (MacOS / Windows)

On Windows, you have the option of installing [WSL](https://learn.microsoft.com/en-us/windows/wsl/install). I recommend installing Ubuntu, running
the Neovim bootstrap script should work out of the box.

Otherwise, you would need to manually install [Neovim](https://github.com/neovim/neovim/wiki/Building-Neovim/688be28f98c18e73b5043879b5963287a9b13d6c) and [Lazygit](https://github.com/jesseduffield/lazygit) and copy the dotfiles into the appropriate directories.
for your system.

After that, clone this repository normally:

```
git clone https://github.com/MichaelB788/dotfiles.git
```

And copy the dotfiles into their appropriate directories.
